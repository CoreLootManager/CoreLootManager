from locale import currency
from disnake import Webhook, Embed
import asyncio
import aiohttp
import requests
import time
import sys

GIT_ENDPOINT = "https://api.github.com/repos/corelootmanager/corelootmanager/releases"

def get_latest_release() -> list:
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


def build_release_fields(body:str) -> list:
    fields = []
    current_field_title = ""
    current_field = []
    creating_field = False

    lines = body.splitlines()
    for line in lines:
        new_bullet = False
        new_field = False

        if line.startswith("###"):
            new_bullet = True
        elif line.startswith("##"):
            new_field = True

        if new_field:
            if creating_field and len(current_field) > 0:
                fields.append({
                    "title": current_field_title,
                    "body": "\n".join(current_field)
                    })
            creating_field = True
            current_field_title = line.strip("# ")
            current_field = []
        else:
            if new_bullet and creating_field:
                current_field.append("**"+line.strip("# ")+"**")
            elif creating_field:
                current_field.append(line.strip())

    if creating_field and len(current_field) > 0:
        fields.append({
            "title": current_field_title,
            "body": "\n".join(current_field)
            })

    return fields

def build_release_embed(releases:list, o = 0) -> dict:
    author = releases[o]["author"]["login"]
    body = releases[o]["body"]

    tag = releases[o]["tag_name"]
    name = releases[o]["name"]
    prerelease = releases[o]["prerelease"]
    url = releases[o]["html_url"]# 2F3136 dcb749


    author_field = "Core Loot Manager has been updated!"
    version_title = "**Version**"
    # more_info_field = "For more information check out the full [release notes](" + url + ")."
    support_us_field = "Become a [patron](https://patreon.com/classiclootmanager) or check out how to <#904660817889337404> if you enjoy using <:clm:892642400525242428>"
    if author == 'lantisnt':
        author = 'Lantis'
    footer = "Released by " + author
    size = len(author_field) + len(name) + len(url) + len(version_title) + len(tag) + 2 + len(support_us_field) + 2 + len(footer)

    embed = {
        "author": {"name": author_field},
        "title": name,
        "url":url,
        "color": 14464841,
        "fields": [
            {"name": version_title, "value": "`" + tag  + "`", "inline": False}
        ],
        "footer": {"text": footer}
    }
    
    fields = build_release_fields(body)
    for field in fields:
        title = field["title"]
        body = field["body"]
        if len(title) > 256:
            title = title[:253]+"..."
        if len(body) > 1024:
            body = body[:1021]+"..."

        if size + (len(title) + len(body)) <= 6000:
            embed["fields"].append({"name": title, "value": body, "inline": False})
            size += (len(title) + len(body))

    # embed["fields"].append({"name": "\u200b", "value": more_info_field, "inline": False})

    embed["fields"].append({"name": "\u200b", "value": support_us_field, "inline": False})

    content = "<@&852049281959591947> <@&1077961406613299311>" # @Announcements @Retail

    return content, embed

async def post(content, embed):
    try:
        async with aiohttp.ClientSession() as session:
            webhook = Webhook.from_url(sys.argv[1], session=session)
            await webhook.send(content = content, embed = Embed.from_dict(embed), username='New Release')
    except Exception as e:
        print(str(e))
        exit(30)

async def main():
    if len(sys.argv) != 2:
        print("Invalid arguments")
        exit(1)

    releases = get_latest_release()

    if len(releases) == 0:
        print("No releases found")
        exit(20)

    content, embed = build_release_embed(releases)

    await post(content, embed)

if __name__ == "__main__":
    asyncio.run(main())
