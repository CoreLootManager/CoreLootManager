import sys
import argparse
import string
import copy
import os
import re
from pathlib import Path

import pprint
from xmlrpc.client import boolean
pp = pprint.PrettyPrinter(indent=4)

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
                print("Info:Locale/{0}.lua:{1} Not Used".format(locale, string))
            elif self.markdown:
                if  not self._displayed_not_used_header_markdown:
                    self._displayed_not_used_header_markdown = True
                    print("## Unused strings:")
                print('`{}`'.format(string))
            else:
                print('Not used: {}'.format(string))
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
    for s in ["Hunter", "Warrior", "Druid", "Priest", "Mage", "Paladin", "Rogue", "Warlock", "Shaman"]:
        storage.store('CLM.L["{0}"]'.format(s), Path(storage.base) / Path(""), "indirectly")

def get_paths():
    excludeDirs = ["ExternalLibs", "Libs", "Locale", ".github", "Media", ".vscode", ".git", "TESTING", "scripts"]

    baseDir = Path().resolve()
    excludePaths = []
    for e in excludeDirs:
        excludePaths.append(baseDir / Path(e))
    subdirs = [x for x in baseDir.iterdir() if x.is_dir()]
    paths = [x for x in subdirs if (x not in excludePaths)]

    return baseDir, paths

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

def cleanup(filenames):
    for filename in filenames:
        try:
            os.remove(filename)
        except Exception:
            pass

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
                print("Warning:Locale/{0}.lua:{1} Missing".format(locale, key))
        elif markdown_format:
            print("## Missing translations for locale {}:".format(locale))
            for key in missing_translations:
                print("`" + key + "`")
        else:
            print("=====================================")
            print("Missing translations for locale {}:".format(locale))
            for key in missing_translations:
                print(key)
        return 1
    if ignored_translations_count > 0:
        if markdown_format:
            print("**Ignored {} locale translations**".format(ignored_translations_count))
        elif not parser_format:
            print("Ignored {} locale translations".format(ignored_translations_count))
    return 0

# Always needs to be run from the top directory of the project!
def main(args):
    # Generate filelist
    baseDir, paths = get_paths()
    query = re.compile("\.lua$", re.I)
    files = find_files(baseDir, query, False)
    for path in paths:
        files.extend(find_files(path, query, True))

    # Prepare
    # locales = ["ruRU", "frFR"]
    locales = ["frFR"]
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
        scan_file_for_l10n_translation(baseDir / ("Locale/{0}.lua".format(locale)), l10n_translation_query, storage, locale)
        if args.regenerate:
            output_to_file('Locale/{0}.lua'.format(locale), storage, locale)
    
    status = 0
    for locale in locales:
        status += verify_locales(storage, locale, args.parser, args.markdown)

    exit(status)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--regenerate', dest='regenerate', action='store_true')
    parser.add_argument('--parser', dest='parser', action='store_true')
    parser.add_argument('--markdown', dest='markdown', action='store_true')
    main(parser.parse_known_args(sys.argv)[0])
