from discord import Webhook, RequestsWebhookAdapter, Embed
import requests
import time
import sys

if len(sys.argv) != 2:
    print("Invalid arguments")
    exit(1)

GIT_ENDPOINT = "https://api.github.com/repos/lantisnt/classiclootmanager/releases"

def get_newest_release():
    num_calls = 0
    while True:
        num_calls = num_calls + 1
        response = requests.get(GIT_ENDPOINT)
        if response.status_code == 200:
            return response.json()
        else:
            print("Query failed")
            if num_calls >= 10:
                print("Exiting")
                exit(10)
            else:
                print("Sleeping and retrying")
                time.sleep(num_calls)

releases = get_newest_release()

if len(releases) == 0:
    print("No releases found")
    exit(20)

try:
    author = releases[0]["author"]["login"]
    body = releases[0]["body"]

    tag = releases[0]["tag_name"]
    name = releases[0]["name"]
    prerelease = releases[0]["prerelease"]
    url = releases[0]["html_url"]# 2F3136 dcb749

    embed = {
        "author": {"name": "Classic Loot Manager has been updated!"},
        "title": name,
        "color": 14464841,
        "fields": [
            {"name": "**Version**", "value": "`" + tag  + "`", "inline": False},
            {"name": "**CHANGELOG**", "value": "```" + body[:1014] + ("..." if len(body) > 1014 else "") + "```", "inline": False},
            {"name": "\u200b", "value": "For more information check out the full [release notes](" + url + ").", "inline": False}
        ],
        "footer": {"text": "Released by " + author}
    }

    if prerelease:
        embed["description"] = "_This is a beta version and may still contain bugs_"

    webhook = Webhook.from_url(sys.argv[1], adapter = RequestsWebhookAdapter())
    if prerelease:
        webhook.send(embed = Embed.from_dict(embed))
    else:
        webhook.send(content = "<@&852049281959591947>", embed = Embed.from_dict(embed))
except Exception as e:
    print(str(e))
    exit(30)
