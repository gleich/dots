use std::{
    env, fs,
    path::{Path, PathBuf},
    process::Command,
};

use anyhow::{bail, Result};
use git::publish_changes;

use conf::Config;
use task_log::task;

mod conf;
mod git;

fn main() {
    let home_dir = dirs::home_dir().unwrap();
    let config = prepare(&home_dir).expect("Failed to read from configuration file");

    for package in config.packages {
        task(format!("Generating package: {}", package.name), || {
            package.generate().expect("Failed to generate package");
        });
    }
    for folders in config.folders {
        task(
            format!("Copying folders from {}", folders.parent.display()),
            || {
                folders
                    .copy_children(&home_dir)
                    .expect("Failed to copy child folders");
            },
        )
    }
    for file in config.files {
        task(
            format!("Copying files from {}", file.parent.display()),
            || {
                file.copy_children(&home_dir)
                    .expect("Failed to copy child files");
            },
        );
    }

    env::set_current_dir("..").expect("Failed to back to repository root");

    task("Writing changes to README", || {
        write_to_readme().expect("Failed to write information to README");
    });
    task("Publishing changes", || {
        publish_changes().expect("Failed to commit and push changes");
    });
}

fn prepare(home_dir: &Path) -> Result<Config> {
    task("Verifying path", || -> Result<()> {
        let cwd = env::current_dir()?;
        if !cwd.to_str().unwrap().ends_with("/dots") {
            bail!("Please run from correct path")
        };
        Ok(())
    })?;

    let config = task("Creating folders", || -> Result<Config> {
        let username = PathBuf::from(home_dir.iter().last().unwrap().to_str().unwrap());
        if username.exists() {
            fs::remove_dir_all(&username)?;
        }
        fs::create_dir(&username)?;
        let config = Config::read()?;
        env::set_current_dir(&username)?;
        Ok(config)
    })?;
    Ok(config)
}

fn write_to_readme() -> Result<()> {
    let neofetch_output =
        String::from_utf8(Command::new("neofetch").arg("--stdout").output()?.stdout)?;
    fs::write(
        "README.md",
        format!(
            "
# dots

```txt
{}
```
",
            neofetch_output.trim()
        ),
    )?;
    Ok(())
}
