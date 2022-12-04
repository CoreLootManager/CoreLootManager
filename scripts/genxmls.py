from pathlib import PosixPath

FILELIST = '_filelist.xml'
IGNORE_PREFIX = ["_", "."]

def beginsWithAny(i: str, b:list) -> bool:
    for prefix in b:
        if i.startswith(prefix):
            return True
    return False

def writeFilelist(path: PosixPath):
    if not path.is_dir(): return
    


BASE = PosixPath(".")



for x in BASE.iterdir():
    if x.is_dir():
        for y in x.iterdir():
            print(y, y.relative_to(x))