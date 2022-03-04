use std::{
    fs,
    path::{Path, PathBuf},
    process::Command,
};

use anyhow::{Context, Result};
use fs_extra::dir;
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
    pub parent: PathBuf,
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
        Ok(())
    }
}

impl Folders {
    pub fn copy_children(&self, home_dir: &Path) -> Result<()> {
        for child in &self.children {
            let actual_path = home_dir.join(&self.parent).join(child);
            let child_parent = child.parent().unwrap().to_path_buf();
            let parent = if child_parent.to_str().unwrap().is_empty() {
                &self.parent
            } else {
                &child_parent
            };
            if !parent.exists() {
                fs::create_dir_all(parent)?;
            }
            dir::copy(&actual_path, parent, &dir::CopyOptions::default()).context(format!(
                "{} from {}",
                child.display(),
                self.parent.display()
            ))?;
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
        }
        Ok(())
    }
}
