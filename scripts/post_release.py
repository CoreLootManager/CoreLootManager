# MIT License
#
# Copyright (c) 2021 Lantis / Classic Loot Manager team
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

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
    multibody = None
    if len(body) > 1000:
        multibody = body.split("\r\n\r\n")

    tag = releases[0]["tag_name"]
    name = releases[0]["name"]
    prerelease = releases[0]["prerelease"]

    embed = {
        "author": {"name": "Classic Loot Manager has been updated!"},
        "title": name,
        "color": 14464841,
        "fields": [
            {"name": "**Version**", "value": "`" + tag  + "`", "inline": False}
        ],
        "footer": {"text": "Released by " + author}
    }
    if multibody is not None:
        first = True
        for body in multibody:
            if len(body) > 0:
                title = "**CHANGELOG**" if first else "\u200b"
                embed["fields"].append({"name": title, "value": "```" + body + "```", "inline": False})
                first = False
    else:
        if len(body) > 0:
            embed["fields"].append({"name": "**CHANGELOG**", "value": "```" + body + "```", "inline": False})
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
