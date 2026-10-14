#!/usr/bin/env python3
"""Renomeia o template para um novo projeto.

Uso:  python tool/rename_project.py meu_projeto "Meu Projeto" br.com.empresa
  (o 3o argumento é a org; o applicationId final fica <org>.<meu_projeto>)
Depois: flutter pub get && flutter pub run intl_utils:generate && dart run build_runner build --delete-conflicting-outputs
"""
import os, sys

if len(sys.argv) != 4:
    sys.exit(__doc__)
new_pkg, new_title, new_org = sys.argv[1:]
OLD_PKG, OLD_ORG = "flutter_backoffice_template", "br.com.example"
OLD_ID, NEW_ID = f"{OLD_ORG}.{OLD_PKG}", f"{new_org}.{new_pkg}"
OLD_KT = os.path.join("android", "app", "src", "main", "kotlin", *OLD_ID.split("."))
SKIP = {".git", ".dart_tool", "build", ".idea", ".fvm", "Pods"}
EXT = (".dart", ".yaml", ".md", ".json", ".html", ".xml", ".plist", ".gradle", ".kt", ".pbxproj", ".kts", ".arb")

for root, dirs, files in os.walk("."):
    dirs[:] = [d for d in dirs if d not in SKIP]
    for f in files:
        if not f.endswith(EXT) or f == "rename_project.py":
            continue
        p = os.path.join(root, f)
        try:
            t = open(p, encoding="utf-8").read()
        except UnicodeDecodeError:
            continue
        n = t.replace(OLD_ID, NEW_ID).replace(OLD_PKG, new_pkg)
        n = n.replace("Flutter Template", new_title).replace("Template Flutter", new_title)
        if n != t:
            open(p, "w", encoding="utf-8", newline="\n").write(n)

if os.path.isdir(OLD_KT):
    new_dir = os.path.join("android", "app", "src", "main", "kotlin", *NEW_ID.split("."))
    os.makedirs(os.path.dirname(new_dir), exist_ok=True)
    os.rename(OLD_KT, new_dir)
print("OK. Rode: flutter pub get && flutter pub run intl_utils:generate && dart run build_runner build --delete-conflicting-outputs")
