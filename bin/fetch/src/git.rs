use std::process::Command;

use anyhow::Result;
use log::info;

pub fn publish_changes() -> Result<()> {
    let git_binary = "git";
    Command::new(git_binary).arg("add").arg(".").output()?;
    Command::new(git_binary)
        .arg("commit")
        .arg("-m")
        .arg("chore(update): update to latest config")
        .output()?;
    Command::new(git_binary).arg("push").output()?;
    info!("Pushed the latest changes");
    Ok(())
}
