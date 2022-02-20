use std::{
    fs,
    path::{Path, PathBuf},
    process::Command,
};

use anyhow::{Context, Result};
use fs_extra::dir;
use log::info;
use serde::Deserialize;

#[derive(Deserialize, Debug)]
pub struct Config {
    pub packages: Vec<Package>,
    pub folders: Vec<Folders>,
    pub files: Vec<Files>,
}

#[derive(Deserialize, Debug)]
pub struct Package {
    pub name: String,
    pub cmd: Vec<String>,
    pub filename: PathBuf,
}

#[derive(Deserialize, Debug)]
pub struct Folders {
    pub parent: PathBuf,
    pub children: Vec<PathBuf>,
}

#[derive(Deserialize, Debug)]
pub struct Files {
    pub parent: String,
    pub children: Vec<PathBuf>,
}

impl Config {
    pub fn read() -> Result<Self> {
        Ok(toml::from_str(&fs::read_to_string("fetch.toml")?)?)
    }
}

impl Package {
    pub fn generate(&self) -> Result<()> {
        let output = String::from_utf8(
            Command::new(self.cmd.get(0).unwrap())
                .args(self.cmd.iter().skip(1).collect::<Vec<&String>>())
                .output()?
                .stdout,
        )?;
        let folder = PathBuf::from("packages").join(&self.name);
        fs::create_dir_all(&folder)?;
        fs::write(folder.join(&self.filename), output)?;
        info!("Generated package for {}", self.name);
        Ok(())
    }
}

impl Folders {
    pub fn copy_children(&self, home_dir: &Path) -> Result<()> {
        for child in &self.children {
            let actual_path = home_dir.join(&self.parent).join(child);
            let parent = child.parent().unwrap_or(&self.parent);
            if !parent.exists() {
                fs::create_dir_all(parent)?;
            }
            dir::copy(&actual_path, parent, &dir::CopyOptions::default()).context(format!(
                "{} from {}",
                child.display(),
                self.parent.display()
            ))?;
            info!("Copied folder: {}", actual_path.display());
        }
        Ok(())
    }
}

impl Files {
    pub fn copy_children(&self, home_dir: &Path) -> Result<()> {
        fs::create_dir_all(&self.parent)?;
        for child in &self.children {
            let actual_path = home_dir.join(&self.parent).join(child);
            let copy_path = PathBuf::from(&self.parent).join(child);
            fs::create_dir_all(copy_path.parent().unwrap())?;
            fs::copy(&actual_path, &copy_path)?;
            info!("Copied file: {}", actual_path.display());
        }
        Ok(())
    }
}
