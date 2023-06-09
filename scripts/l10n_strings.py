import sys
import argparse
import string
import copy
import os
import re
import math
import translators as ts
from pathlib import Path

import pprint
from xmlrpc.client import boolean
pp = pprint.PrettyPrinter(indent=4)

def _print(*args):
    # pass
    print(*args)

locale_to_google = {
    'deDE': 'de',
    'frFR': 'fr',
    'ruRU': 'ru',
    'esES': 'es',
    'zhCN': 'zh-CN',
    'zhTW': 'zh-TW',
}

locale_to_baidu = {
    'deDE': 'de',
    'frFR': 'fra',
    'ruRU': 'ru',
    'esES': 'spa',
    'zhCN': 'zh',
    'zhTW': 'zh',
}

class L10nStorage:
    def __init__(self, base, parser, markdown):
        self.data = {}
        self.not_used = {}
        self.translations = {}
        self.do_not_translate = {}
        self.base = base
        self.parser = parser
        self.markdown = markdown

        self._displayed_not_used_header_markdown = False

    def store(self, l10n_string:string, file:Path, line:int):
        if not self.data.get(l10n_string):
            self.data[l10n_string] = []
        self.data[l10n_string].append((file.relative_to(self.base), line))

    def copy(self, source):
        self.data = copy.deepcopy(source.data)

    def translate(self, locale, string, translation, do_not_translate):
        if not self.data.get(string):
            self.not_used[string] = True
            if self.parser:
                _print("Info:Locale/{0}.lua:{1} Not Used".format(locale, string))
            elif self.markdown:
                if  not self._displayed_not_used_header_markdown:
                    self._displayed_not_used_header_markdown = True
                    _print("## Unused strings:")
                _print('`{}`'.format(string))
            else:
                _print('Not used: {}'.format(string))
            return
        if self.not_used.get(string):
            del self.not_used[string]
        
        if not self.translations.get(locale):
            self.translations[locale] = {}
        self.translations[locale][string] = translation

        if do_not_translate:
            if not self.do_not_translate.get(locale):
                self.do_not_translate[locale] = {}
            self.do_not_translate[locale][string] = True

    def get_if_do_translate(self, locale, string):
        if not self.do_not_translate.get(locale):
            return True
        return not self.do_not_translate[locale].get(string)

    def get_translation(self, locale, string):
        if not self.translations.get(locale):
            return ""
        if not self.translations[locale].get(string):
            return ""
        return self.translations[locale][string]

def add_indirectly_used_strings(storage:L10nStorage):
    for s in ["Hunter", "Warrior", "Druid", "Priest", "Mage", "Paladin", "Rogue", "Warlock", "Shaman", "Death Knight", "Demon Hunter", "Evoker"]:
        storage.store('CLM.L["{0}"]'.format(s), Path(storage.base) / Path(""), "indirectly")

    # tabs
    for s in ["History", "Profiles"]:
        storage.store('CLM.L["{0}"]'.format(s), Path(storage.base) / Path(""), "indirectly")

def get_paths():
    excludeDirs = [
        ".release",
        ".github",
        ".vscode",
        ".git",
        "TESTING",
        "scripts",
        "ClassicLootManager/ExternalLibs",
        "ClassicLootManager/Libs",
        "ClassicLootManager/Locale",
        "ClassicLootManager/Media",]

    baseDir = Path().resolve()
    excludePaths = []
    for e in excludeDirs:
        excludePaths.append(baseDir / Path(e))
    subdirs = [x for x in baseDir.iterdir() if x.is_dir()]
    paths = [x for x in subdirs if (x not in excludePaths)]
    return baseDir, paths, excludeDirs

def find_files(path: Path, query, recursive):
    files = []
    if path.is_dir():
        for subPath in path.iterdir():
            if subPath.is_dir() and recursive:
                files.extend(find_files(subPath, query, recursive))
            elif query.search(str(subPath)):
                files.append(subPath)
    elif query.search(path):
            files.append(path)
    return files

def scan_file_for_l10n_string(file:Path, query, storage:L10nStorage):
    with open(file, 'r') as f:
        lineNum = 0
        while True:
            line = f.readline()
            if not line: # EOF
                break
            lineNum += 1
            matches = query.findall(line)
            if matches:
                for match in matches:
                    storage.store(match, file, lineNum)

def scan_file_for_l10n_translation(file:Path, query, storage:L10nStorage, locale):
    with open(file, 'r') as f:
        lineNum = 0
        while True:
            line = f.readline()
            if not line: # EOF
                break
            lineNum += 1
            do_not_translate = line.strip().endswith("notranslate")
            if not line.startswith("--") or do_not_translate:
                matches = query.findall(line)
                if matches:
                    for match in matches:
                        storage.translate(locale, match[0], match[1], do_not_translate)

def output_to_file(filename, storage, locale):
    orderedData = dict(sorted(storage.data.items()))
    with open(filename, 'w') as f:
        f.write("local _, CLM = ...\n")
        f.write("if GetLocale() == \"{}\" then\n".format(locale))
        for string, dataDict in orderedData.items():
            for useTuple in dataDict:
                f.write("-- {0}:{1}\n".format(useTuple[0], useTuple[1]))
            translation = storage.get_translation(locale, string)
            prefix = ""
            suffix = ""
            do_not_translate = not storage.get_if_do_translate(locale, string)
            if translation == "" or do_not_translate:
                prefix = "--"
            if do_not_translate:
                suffix = "--notranslate"
            f.write('{0}{1} = "{2}"{3}\n'.format(prefix, string, translation, suffix))
        f.write("end")


def verify_locales(storage:L10nStorage, locale:string, parser_format:boolean, markdown_format:boolean):
    missing_translations = []
    ignored_translations_count = 0
    for key in storage.data.keys():
        translation = storage.get_translation(locale, key)
        do_translate = storage.get_if_do_translate(locale, key)
        if do_translate:
            if translation == "":
                missing_translations.append(key)
        else:
            ignored_translations_count = ignored_translations_count + 1

    if len(missing_translations) > 0:
        if parser_format:
            for key in missing_translations:
                _print("Warning:Locale/{0}.lua:{1} Missing".format(locale, key))
        elif markdown_format:
            _print("## Missing translations for locale {}:".format(locale))
            for key in missing_translations:
                _print("`" + key + "`")
        else:
            _print("=====================================")
            _print("Missing translations for locale {}:".format(locale))
            for key in missing_translations:
                _print(key)
        return 1, missing_translations
    if ignored_translations_count > 0:
        if markdown_format:
            _print("**Ignored {} locale translations**".format(ignored_translations_count))
        elif not parser_format:
            _print("Ignored {} locale translations".format(ignored_translations_count))
    return 0, []

sanitize_sentence_regex = re.compile("CLM\.L\[[\"\'](.*?)[\'\"]]")
def translate_missing(missing, storage:L10nStorage, locale, total_missing, total_done, last_percent, dry_run):
    if len(missing) > 0:
        for sentence in missing:
            sanitized_sentence = sanitize_sentence_regex.findall(sentence)[0]
            if dry_run:
                _print("translate [{1}]: [{0}]".format(sanitized_sentence, locale_to_baidu[locale]))
            else:
                translation = ts.baidu(sanitized_sentence, from_language='en', to_language=locale_to_baidu[locale])
                storage.translate(locale, sentence, translation, False)
                total_done += 1
                percent = math.floor(100*(total_done/total_missing))
                if percent > last_percent:
                    _print("Translation progress: {0}% [{1}]".format(percent, locale))
                last_percent = percent
    return total_missing, total_done, last_percent


def rewrite_missing(missing, storage:L10nStorage, locale, total_missing, total_done, last_percent, dry_run):
    if len(missing) > 0:
        for sentence in missing:
            sanitized_sentence = sanitize_sentence_regex.findall(sentence)[0]
            if dry_run:
                _print("rewriting [{0}]".format(sanitized_sentence))
            else:
                translation = sanitized_sentence
                storage.translate(locale, sentence, translation, False)
                total_done += 1
                percent = math.floor(100*(total_done/total_missing))
                last_percent = percent
    return total_missing, total_done, last_percent


# Always needs to be run from the top directory of the project!
def main(args):
    # Generate filelist
    baseDir, paths, excludeDirs = get_paths()
    query = re.compile("\.lua$", re.I)
    _files = find_files(baseDir, query, False)
    for path in paths:
        _files.extend(find_files(path, query, True))

    # pp.pprint(_files)
    files = []

    for file in _files:
        isExcluded = False
        for excluded in excludeDirs:
            if str(excluded) in str(file):
                isExcluded = True
                # print("excluded " + str(file))
                break
        if not isExcluded:
            files.append(file)
            

    # Prepare
    locales = ["frFR", "esES", "ruRU", "deDE", "zhCN", "zhTW"]
    l10n_query = re.compile('(CLM\.L\[["\'].*?["\']\])')
    l10n_translation_query = re.compile('(CLM\.L\[["\'].*?["\']\])\s*=\s*["\'](.*)["\']')
    storage = L10nStorage(baseDir, args.parser, args.markdown)
    # Indirectly used strings, e.g. classes
    add_indirectly_used_strings(storage)
    # Scan existing CLM.L use
    for file in files:
        scan_file_for_l10n_string(file, l10n_query, storage)
    # Scan for existing translations and create outputs of them with report
    for locale in locales:
        scan_file_for_l10n_translation(baseDir / ("ClassicLootManager/Locale/{0}.lua".format(locale)), l10n_translation_query, storage, locale)

    total_missing, total_done, last_percent = 0, 0, 0    
    status = 0
    missing_translations = {}
    for locale in locales:
        return_status, missing = verify_locales(storage, locale, args.parser, args.markdown)
        status += return_status
        missing_translations[locale] = missing
        total_missing += len(missing)

    for locale in locales:
        if args.translate:
            total_missing, total_done, last_percent = translate_missing(missing_translations[locale], storage, locale, total_missing, total_done, last_percent, args.dry_run)
        elif args.rewrite:
            total_missing, total_done, last_percent = rewrite_missing(missing_translations[locale], storage, locale, total_missing, total_done, last_percent, args.dry_run)

        if args.regenerate:
            output_to_file('ClassicLootManager/Locale/{0}.lua'.format(locale), storage, locale)

    exit(status)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--regenerate', dest='regenerate', action='store_true')
    parser.add_argument('--parser', dest='parser', action='store_true')
    parser.add_argument('--markdown', dest='markdown', action='store_true')
    parser.add_argument('--translate', dest='translate', action='store_true')
    parser.add_argument('--rewrite', dest='rewrite', action='store_true')
    parser.add_argument('--dry', dest='dry_run', action='store_true')
    main(parser.parse_known_args(sys.argv)[0])
