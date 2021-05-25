import os
import shutil
from pathlib import Path
from loguru import logger
import shutil

USR_NAME = "matt"
home = Path.home()


@logger.catch
def main():
    """Main function"""
    ensure_correct_path()
    os.chdir("./../../")
    remove_current_config()
    os.mkdir(USR_NAME)

    generate_package(
        name="homebrew",
        cmd="brew bundle dump --describe --file=-",
        file_name="Brewfile",
    )
    generate_package(
        name="npm",
        cmd="npm list -g --depth 0",
        file_name="packages.txt",
    )
    generate_package(
        name="vscode",
        cmd="code --list-extensions",
        file_name="extensions.txt",
    )

    copy_folders(
        ".config",
        [
            "neofetch",
            "nuke",
            "bpytop/themes",
            "ranger",
            "nvim",
            "texsch",
            "zsh",
            "fish",
            "omf",
            "kitty",
            "zathura",
            "resin",
        ],
    )
    copy_files(
        ".config",
        [
            "bpytop/bpytop.conf",
            "fgh/config.yaml",
            "gh/config.yml",
            "coc/extensions/package.json",
            "jrnl/jrnl.yaml",
        ],
    )

    copy_folders(
        ".",
        [
            "Library/Developer/Xcode/UserData/KeyBindings",
            "Library/Developer/Xcode/UserData/FontAndColorThemes",
            "Library/Developer/Xcode/UserData/CodeSnippets",
            "Library/Application Support/Code - Insiders/User/snippets",
            "Library/Preferences/gitmoji-nodejs",
        ],
    )
    copy_files(
        ".",
        [
            ".gitconfig",
            ".tmux.conf",
            ".zshrc",
            ".zprofile",
            ".p10k.zsh",
            ".docker/config.json",
            "Library/Application Support/eDEX-UI/settings.json",
            "Library/Application Support/Code - Insiders/User/keybindings.json",
            "Library/Application Support/Code - Insiders/User/settings.json",
            ".gnupg/gpg-agent.conf",
            ".rustup/settings.toml",
            ".actrc",
        ],
    )
    write_to_readme()
    push_changes()
    shutil.rmtree("./matt/.config/fish/completions")


def ensure_correct_path():
    """Ensure that this program is running from the correct location"""
    logger.info("Verifying path")
    cwd = os.getcwd()
    correct_path = f"/Users/{USR_NAME}/src/Matt-Gleich/public/shell/dots/bin/fetch"
    if cwd != correct_path:
        logger.error(f"Please run from {correct_path}")
        exit(1)
    logger.success("Correct path")


def remove_current_config():
    """Remove the current configuration"""
    logger.info("Removing current configuration")
    shutil.rmtree(os.path.join(".", USR_NAME))
    logger.success("Removed the current configuration")


def generate_package(name: str, cmd: str, file_name: str):
    """Generate a package

    Args:
        name (str): The name of the package
        cmd (str): Command to get list package contents
        file_name (str): Name of the file to put the package contents in
    """
    logger.info(f"Generating {name} package")
    content = os.popen(cmd).read()
    folder = os.path.join(".", USR_NAME, "packages", name)
    os.makedirs(folder, exist_ok=True)
    with open(os.path.join(folder, file_name), "w") as file:
        file.write(content)
    logger.success(f"Genenerated {name}")


def copy_folders(prefix: str, folders: list):
    """Copy a list of folders

    Args:
        prefix (str): The prefix folder for all the folders relative to the home path
        folders (list): List of all the folders and their paths relative to the prefix
    """
    for f in folders:
        actual_path = os.path.join(home, prefix, f)
        logger.info(f"Copying folder: {actual_path}")
        copy_path = os.path.join(".", USR_NAME, prefix, f)
        shutil.copytree(actual_path, copy_path)
        logger.success(f"Copied config folder: {f}")


def copy_files(prefix: str, files: list):
    """Copy a list of files

    Args:
        prefix (str): The prefix folder for all the files relative to the home path
        files (list): List of all the files and their paths relative to the prefix
    """
    for f in files:
        actual_path = os.path.join(home, prefix, f)
        logger.info(f"Copying file: {actual_path}")
        copy_path = os.path.join(".", USR_NAME, prefix, f)
        os.makedirs(os.path.dirname(copy_path), exist_ok=True)
        shutil.copyfile(actual_path, copy_path)
        logger.success(f"Copied config file: {f}")


def push_changes():
    """Push the latest changes"""
    logger.info("Pushing the latest changes")
    os.system("git add .")
    os.system('git commit -m "chore(update): Update to latest config"')
    os.system("git push")
    logger.success("Pushed the latest changes!")


def write_to_readme():
    """Write to README.md"""
    logger.info("Generating README")
    neofetch_output = os.popen("neofetch --stdout").read().strip("\n")
    with open("README.md", "w") as readme:
        readme.write(
            f"""
# dots

![format](https://github.com/Matt-Gleich/dots/workflows/format/badge.svg)

```txt
{neofetch_output}
```
"""
        )
    logger.success("Wrote to README")


if __name__ == "__main__":
    main()
