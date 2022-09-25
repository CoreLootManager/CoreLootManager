md = open("mdin/md.md").read()

def parse_md(body:str) -> list:
    fields = []
    current_field_title = ""
    current_field = []
    creating_field = False
    current_bullet_title = ""
    current_bullet = []
    creating_bullet = False

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
                if creating_bullet and len(current_bullet) > 0:
                    current_field.append({
                        "title": current_bullet_title,
                        "body": current_bullet
                    })
                    current_bullet = []
                    creating_bullet = False

                fields.append({
                    "title": current_field_title,
                    "body": current_field
                    })
            creating_field = True
            current_field_title = line.strip("# ")
            current_field = []
        else:
            if new_bullet and creating_field:
                if creating_bullet and len(current_bullet) > 0:
                    current_field.append({
                        "title": current_bullet_title,
                        "body": current_bullet
                    })
                creating_bullet = True
                current_bullet_title = line.strip("# ")
                current_bullet = []
            elif creating_field and creating_bullet:
                current_bullet.append(line.strip())

    if creating_field and len(current_field) > 0:
        if creating_bullet and len(current_bullet) > 0:
            current_field.append({
                "title": current_bullet_title,
                "body": current_bullet
            })
        fields.append({
            "title": current_field_title,
            "body": current_field
            })

    return fields

from pprint import PrettyPrinter

pp = PrettyPrinter()

pp.pprint(parse_md(md))

def fields_to_luachangelog(fields:list):
    output = []
    output.append("{")
    output.append("    version = \"\",")
    output.append("    data = {")
    for field in fields:
        output.append("        {")
        output.append("            name = \"{0}\",".format(field["title"]))
        output.append("            data = {")
        for bullet in field["body"]:
            output.append("                {{ header = \"{0}\", body = \"{1}\" }},".format(bullet["title"], "\n".join(bullet["body"])))
        output.append("            },")
        output.append("        },")
    output.append("    },")
    output.append("},")
    return output


lines = fields_to_luachangelog(parse_md(md))

lua = open("mdout/lua.lua", "w")
lua.write("\n".join(lines))
lua.close()