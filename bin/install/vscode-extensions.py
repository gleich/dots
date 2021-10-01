import os

os.chdir("../../matt/packages/vscode")

with open("extensions.txt") as ext_file:
    lines = ext_file.readlines()
    for line in lines:
        os.system(f"code --install-extension {line}")
