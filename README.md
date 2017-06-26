## A collection of bash/python utilities, config files and dockerfiles
---
This is a **Private repository** for collection of bash utilities,scripts and config files I use during my work-flow.
The Repository tree is organized into modules.

` Github URL: https://github.com/tprasadtp/minchu `

* Current Project structure
```
.
├── android-tools
│   ├── adb-screenshot
│   ├── phone-tool
│   └── PHONE-TOOL.md
├── bash
│   └── sindhu-ubuntu
│       └── .bashrc
├── dockerfiles
│   ├── chrome
│   │   ├── chrome-font.conf
│   │   └── Dockerfile
│   ├── eclipse
│   │   └── Dockerfile
│   ├── gnome-builder
│   │   └── Dockerfile
│   ├── ubuntu-gnome-zesty
│   │   └── Dockerfile
│   ├── docker-chrome
│   ├── docker-gnome-builder
│   ├── docker-gnome-legacy
│   ├── docker-helper-core
│   └── README.md
├── git
│   ├── .gitconfig
│   └── .gitignore_global
├── image-processing
│   ├── denoise-raw-stack
│   └── README.md
├── imwheel
│   └── .imwheelrc
├── neofetch
│   └── config
├── office-tools
│   ├── pdf-rotate
│   └── README.md
├── startup-items
│   └── gnome-shell
│       ├── appindicator-fix-startup-dropbox
│       ├── fix-volume-extension-conflict
│       └── README.md
├── stow
│   ├── stow-all-files
│   └── stow.list
├── templates
│   ├── LateX Report.tex
│   └── Shell Script
├── third-party
│   ├── chinni
│   │   └── kdeconnect
│   └── README.md
├── cp2stow
├── .gitignore
├── minchu.tree
└── README.md
```
* `android-tools` contains bash utilities to related to android development and day to day life.
* `bash` contains custom `.bashrc` files in directories labeled by machine/user name.
* `dockerfiles` contains docker files in sub-directories and helper scripts to launch them.
* `git` contains custom .gitconfig, .gitignore files
* `image-processing` consist of several image processing scripts.
* `imwheel` contains custom `.imwheelrc` files.
* `neofetch` contains custom neofetch `config` files.
* `office-tools` A collection of scripts used for office use(pdf, tex,documents etc).
* `startup-items` consists of custom scripts to launch at startup on a system categorized into sub-directories.
* `stow` contains bash script `stow-all-files` to stow all the files on a fresh system/user profile.
* `templates` contains several custom template files which can be used in new file context menu especially in nautilus.
Copy them to `~/Templates` directory and restart nautilus. `nautilus -q`
* `cp2stow` is bash a script, which copies all the data to "Dotfiles" directory in your Home folder, with a stow script to stow all the files.
  + To stow them (symlink them), just run `./stow-all-files -s` from your Dotfiles directory. (cp2stow should have placed the script and a config file there.)
  + This utility uses rsync to copy the files. You need rsync (installed by default in most cases) to run this script.
  + IF you see errors saying that it is not owned by stow then you need to manually remove the symlinks.
  + This script `stow-all-files` uses a config file `stow.list` containing list of directories to be stowed.
  + If the Dotfiles directory has been changed/renamed then you have to delete symlinks manually.[will automate it in future]
  + IF you want to stow other directories then just add them to the file with one directory per line.
* `minchu.tree` consists of current repository structure. In some cases it might be out of sync with project.
* Almost every executable requires a flag to run.

### Changelogs


#### _v1.5_
* Fixed : Typos and errors, a bug with bashrc, paths in several files.
* Improved: adb-screenshot's flow and structure.
* Dynamically get the list of directories to be stowed by a config file.

#### _v1.4_
* Split core functions of helper scripts into its own "module" **[docker-helper-core]** to be reused by other scripts. It makes easy to modify core functions, keeps code clean and reduces de-duplication.
* Added dockerfiles: google-chrome
* Added: **adb-screenshot** to take screen-shots on phone continuously.
* Added: **phone-tool** - an adb based tool to help installing batch apks, batch restore, backup, modify permissions and flash ota zips.
* Added: image-processing
* Added git configs
* Added Stowing scripts (requires GNU stow)
* Added custom Templates
* Bug fixes in argument parser

#### _v1.3_
* Helper scripts for dockerfiles
* +dockerfiles: eclipse

#### _v1.2_
* gnome-builder, ubuntu-gnome-zesty,
* add third-party scripts.

#### _v1.1_
* Split into different modules, Reorganize project.  Added following config/modules.
* config files for several items, startup items, bashrc, imwheel, neofetch.

#### _v1.0_
* Initial upload.

Well Bob, why have you explained every stupid thing in comments? I know most of them and its stupid.
You might! But that increases readability and in case I let it eat dust and catch up with it after 10 years, it helps.
