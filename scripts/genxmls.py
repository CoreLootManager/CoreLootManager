from pathlib import PosixPath
from io import TextIOWrapper

FILELIST = '_filelist.xml'
IGNORE_PREFIX = ["_", "."]

def beginsWithAny(i: str, b:list) -> bool:
    for prefix in b:
        if i.startswith(prefix):
            return True
    return False

def isIgnored(p:PosixPath):
    return beginsWithAny(p.as_posix(), IGNORE_PREFIX)

def isExtensionUsed(p:PosixPath):
    return (p.suffix in ['lua', 'xml', ''])


def writeFilelistFile(fhandler: TextIOWrapper, files: list, dirs: list):
    lines = []
    lines.append('<Ui xmlns="http://www.blizzard.com/wow/ui/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.blizzard.com/wow/ui/')
    lines.append('\t..\\FrameXML\\UI.xsd">')
    for dir in dirs:
        lines.append('<Include file="' + dir + FILELIST + '"/>')
    for file in files:
        lines.append('<Script file="' + file + '"/>')
    lines.append('</Ui>')
    fhandler.writelines(lines)

def writeFilelist(path: PosixPath, base:PosixPath):
    if not path.is_dir(): return
    files = []
    dirs = []
    for node in path.iterdir():
        node_relative = node.relative_to(base)
        print(node_relative, isIgnored(node_relative), isExtensionUsed(node_relative))
        if not isIgnored(node_relative) and isExtensionUsed(node_relative):
            if node.is_dir():
                dirs.append(node_relative.as_posix())
                writeFilelist(node, path)
            else:
                files.append(node_relative.as_posix())
    # with open(path / FILELIST, "w", encoding="utf-8") as fhandler:
        # writeFilelistFile(fhandler, files, dirs)

writeFilelist(PosixPath("."), PosixPath("."))

# for x in BASE.iterdir():
#     if x.is_dir():
#         for y in x.iterdir():
#             print(y, y.relative_to(x))