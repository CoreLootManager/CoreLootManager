import sys, os
import argparse
import re
from pathlib import Path
from github import Github, GithubException

class ErrorReport:
    def __init__(self, filepath:str, line:int, comment:str):
        self.filepath = filepath
        self.line = line
        self.comment = comment
    def __str__(self):
        return "{0}:{1} {2}".format(self.filepath, self.line, self.comment)

GITHUB_REPO = "ClassicLootManager/ClassicLootManager"

FILENAME_POS = 0
LINE_POS = 1
COMMENT_POS = 3

class GithubInfo:
    def __init__(self):
        self.token = os.getenv('GITHUB_TOKEN')
        self.repo = os.getenv('GITHUB_REPOSITORY')
        self.event = os.getenv('GITHUB_EVENT_NAME')
        self.SHA = os.getenv('GITHUB_SHA')
        self.isPR = False
        if self.event == 'pull_request':
            ref = os.getenv('GITHUB_REF')
            if ref:
                try:
                    print(ref)
                    print(ref.split('/'))
                    print(ref.split('/')[2].split(":"))
                    self.PR = int(ref.split('/')[2].split(":")[1])
                    self.isPR = True
                except Exception:
                    pass
        self.verify()

    def verify(self):
        if self.token is None:
            raise Exception("Token is None")
        if self.repo is None:
            raise Exception("Repo is None")
        if self.isPR and self.PR is None:
            raise Exception("PR is None")
        if self.SHA is None:
            raise Exception("SHA is None")

    def __str__(self):
        if self.isPR:
            return "Token: *** Repo: {0} isPR: {1} ({2}) SHA: {3}".format(self.repo, self.isPR, self.PR, self.SHA)
        else:
            return "Token: *** Repo: {0} isPR: {1} SHA: {3}".format(self.repo, self.isPR, self.PR, self.SHA)

def comment_lines(reports:ErrorReport, info:GithubInfo):
    try:
        g = Github(info.token)
        repo = g.get_repo(info.repo)
        # issue = repo.create_issue(title=title, body=body, labels=labels)
        print(info)
        for report in reports:
            print(report)
    except GithubException as e:
        pass

def main(args):
    pattern = re.compile("^\\s*(.*):(\\d+):(\\d+):\\s*(.*)\\s*$")
    data = []
    reports = []
    with open(args.report, "r") as report_file:
        lines = report_file.readlines()
        for line in lines:
            data.append(pattern.findall(line))
    for entries in data:
        for entry in entries:
            try:
                reports.append(ErrorReport(entry[FILENAME_POS], int(entry[LINE_POS]), entry[COMMENT_POS]))
            except Exception as e:
                print("Exception: ", e)

    if len(reports) > 0:
        info = None
        try:
            info = GithubInfo()
        except Exception as e:
            print(e)
            exit(0)
        comment_lines(reports, info)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--report', dest='report', type=Path, help="Path to luacheck report in plain formatter output.")
    main(parser.parse_known_args(sys.argv)[0])