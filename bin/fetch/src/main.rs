use std::{
    env, fs,
    path::{Path, PathBuf},
    process::Command,
};

use anyhow::{bail, Result};
use chrono::{Local, TimeZone};
use git::publish_changes;
use log::{info, LevelFilter};
use simplelog::{ColorChoice, TermLogger, TerminalMode};

use conf::Config;

mod conf;
mod git;

fn main() {
    let home_dir = dirs::home_dir().unwrap();
    let config = prepare(&home_dir).expect("Failed to read from configuration file");

    for package in config.packages {
        package.generate().expect("Failed to generate package");
    }
    for folders in config.folders {
        folders
            .copy_children(&home_dir)
            .expect("Failed to copy child folders");
    }
    for file in config.files {
        file.copy_children(&home_dir)
            .expect("Failed to copy child files");
    }

    env::set_current_dir("..").expect("Failed to back to repository root");

    publish_changes().expect("Failed to commit and push changes");
    write_to_readme().expect("Failed to write information to README");
}

fn prepare(home_dir: &Path) -> Result<Config> {
    TermLogger::init(
        LevelFilter::Trace,
        simplelog::ConfigBuilder::new()
            .set_time_offset(Local.timestamp(0, 0).offset().to_owned())
            .build(),
        TerminalMode::Stdout,
        ColorChoice::Auto,
    )
    .expect("Failed to configure logger");

    let cwd = env::current_dir()?;
    if !cwd.to_str().unwrap().ends_with("/dots") {
        bail!("Please run from correct path")
    }
    info!("Path verified");

    let username = PathBuf::from(home_dir.iter().last().unwrap().to_str().unwrap());
    if username.exists() {
        fs::remove_dir_all(&username)?;
    }
    fs::create_dir(&username)?;
    let config = Config::read()?;
    env::set_current_dir(&username)?;
    info!("Prepared for fetch. Starting now");
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

![format](https://github.com/gleich/dots/workflows/format/badge.svg)

```txt
{}
```
",
            neofetch_output
        ),
    )?;
    Ok(())
}
