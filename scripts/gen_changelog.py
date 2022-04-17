import re
from slpp import SLPP
from pprint import PrettyPrinter
printer = PrettyPrinter()
decoder = SLPP()

def add_line(target, line):
    return target + str(line) +  "\n"

def add_version(version):
    return "# Classic Loot Manager " + version

def add_section(section):
    return "## " + section

def add_subsection(subsection):
    return "### " + subsection

def sanitize(text):
    text = re.sub("\|c\w{8}(.*?)\|r", r"`\1`", text)
    text = re.sub("`{2,}", "", text)
    return text

with open("Modules/Changelog/Changelog.lua", "r") as changelog_lua, open("CHANGELOG_tmp.md", "w") as changelog_md:
    lines = changelog_lua.readlines()
    lines[1] = "{"
    decoded = decoder.decode(" ".join(lines[1:]))
    md = ""
    for change in decoded:
        # Version
        md = add_line(md, add_version(change.get("version")))
        ## New section
        for section in change.get("data"):
            md = add_line(md, add_section(section.get("name")))
            for subsection in section.get("data"):
                md = add_line(md, add_subsection(subsection.get("header")))
                md = add_line(md, sanitize(subsection.get("body")))

    changelog_md.write(md)