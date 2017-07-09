## A collection of bash/python utilities, config files and dockerfiles
---
This is a repository for collection of bash utilities,scripts and config files I use during my work-flow.
The Repository is organized into modules according to functions.

[![Build Status](https://travis-ci.org/tprasadtp/minchu.svg?branch=master)](https://travis-ci.org/tprasadtp/minchu)
[![Latest Version](https://img.shields.io/github/release/tprasadtp/minchu/all.svg?label=Latest)](https://github.com/tprasadtp/minchu/releases)
[![Latest Version](https://img.shields.io/github/release/tprasadtp/minchu.svg?label=Stable)](https://github.com/tprasadtp/minchu/releases)
[![label](https://img.shields.io/github/issues-raw/badges/shields/website.svg)](https://github.com/tprasadtp/minchu/issues)
[![Maintenance](https://img.shields.io/maintenance/yes/2017.svg)](https://github.com/tprasadtp/minchu/commits/master)
[![license](https://img.shields.io/github/license/tprasadtp/minchu.svg)](https://github.com/tprasadtp/minchu)

` Github URL: https://github.com/tprasadtp/minchu `

* Current Project structure
```
.
├── android-tools
│   ├── adb-screenshot
│   ├── phone-tool
│   ├── PHONE-TOOL.md
│   └── README.md
├── bash
│   └── sindhu-ubuntu
│       ├── .bash_aliases
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
│   ├── docker-eclipse
│   ├── docker-gnome-builder
│   ├── docker-gnome-legacy
│   ├── docker-jekyll
│   ├── docker-helper-core
│   └── README.md
├── git
│   ├── .gitconfig
│   └── .gitignore_global
├── image-processing
│   ├── denoise-raw-stack
│   ├── image-lvl-optimize
│   └── README.md
├── imwheel
│   └── .imwheelrc
├── neofetch
│   └── config
├── office-tools
│   ├── pdf-rotate
│   └── README.md
├── startup-items
│   ├── autostart
│   │   ├── appindicator-fix-startup-dropbox.desktop
│   │   ├── fix-volume-extension-conflict.desktop
│   │   └── imwheel.desktop
│   └── gnome-shell
│       ├── appindicator-fix-startup-dropbox
│       ├── fix-volume-extension-conflict
│       └── README.md
├── stow
│   ├── stow-all-files
│   └── stow.list
├── templates
│   ├── LateX Report.tex
│   ├── Python Plot.py
│   └── Shell Script
├── tests
│   ├── test-dockerfiles
│   ├── test-dockerfiles-diff
│   └── test-shell-scripts
├── third-party
│   ├── chinni
│   │   └── kdeconnect
│   └── README.md
├── cp2stow
├── .gitignore
├── Licence.md
├── minchu.tree
├── README.md
└── .travis.yml
```


* `android-tools` contains bash scripts related to android development and day to day life.
* `bash` contains custom `.bashrc` and `.bash_aliases` files in directories labeled by machine/user name.
* `dockerfiles` contains docker files in sub-directories and helper scripts to launch them.
  + chrome   [![Docker Build Statu](https://img.shields.io/docker/build/tprasadtp/chrome.svg)](https://hub.docker.com/r/tprasadtp/chrome)  [![Docker Automated buil](https://img.shields.io/docker/automated/tprasadtp/chrome.svg)](https://hub.docker.com/r/tprasadtp/chrome/)

  + gnome-builder  [![Docker Build Statu](https://img.shields.io/docker/build/tprasadtp/gnome-builder.svg)](https://hub.docker.com/r/tprasadtp/gnome-builder) [![Docker Automated buil](https://img.shields.io/docker/automated/tprasadtp/gnome-builder.svg)](https://hub.docker.com/r/tprasadtp/gnome-builder/)

  + ubuntu-gnome-zesty    [![Docker Build Statu](https://img.shields.io/docker/build/tprasadtp/ubuntu-gnome-desktop.svg)](https://hub.docker.com/r/tprasadtp/ubuntu-gnome-desktop) [![Docker Automated buil](https://img.shields.io/docker/automated/tprasadtp/ubuntu-gnome-desktop.svg)](https://hub.docker.com/r/tprasadtp/ubuntu-gnome-desktop/)

* `git` contains custom `.gitconfig, .gitignore_global` files.
You need to replace email, gpg key and name in `.gitconfig`, otherwise git will try to sign, commit in my name/email/gpg-key instead of yours.
* `image-processing` consists of several image processing scripts.
* `imwheel` contains custom `.imwheelrc` files.
* `neofetch` contains custom neofetch `config` files.
* `office-tools` A collection of scripts used for office use(pdf, tex,documents etc).
* `startup-items` consists of custom scripts to launch at startup on a system categorized into sub-directories.
  + `autostart` contains autostart items to be added to your gnome desktop.
  + By default they are not listed in stow.list, to symlink them, add `autostart` to a new line in stow.list file and run `./stow-all-files -s`.
* `stow` contains bash script `stow-all-files` to stow all the files on a fresh system/user profile and its config `stow.list`.
* `templates` contains several custom template files which can be used in new file context menu especially in nautilus.
Copy them to `~/Templates` and restart nautilus. `nautilus -q`
* `cp2stow` is bash a script, which copies all the data to "Dotfiles" directory in your Home folder, with a stow script to stow all the files.
  + To copy files to stow, run the script `./cp2stow -c`. This will copy all the files necessary to Dotfiles folder under your home directory.
  + If it is the first time you are using this script, plase rename your existing `.bashrc`, `.bash_aliases` and `.gitignore_global`  files (found under Home directory) to to something like `.bashrc.old`. Do the same for other files if you have any.
  + If you already have some files which conflict with symlinks, you must rename them/delete as mentioned above before running the script. (eg: neofetch config file under `.local/neofetch/config`)
  + If you have renamed your Dotfiles directory then your existing symlinks will not work and you need to delete them manually before stowing again.
  + To stow them (symlink them), just run `./stow-all-files -s` from your Dotfiles directory. (cp2stow should have placed the script and a config file there.)
  + This utility uses rsync to copy the files. You need rsync (installed by default in most cases) to run this script.
  + If you see errors saying that it is not owned by stow then you need to manually remove the symlinks.
  + The script `stow-all-files` uses a config file `stow.list` containing list of directories to be stowed.
  + If the Dotfiles directory has been changed/renamed then you have to delete symlinks manually.[will automate it in future]
  + If you want to stow other directories then just add them to the config file with one directory per line(directory must be present under Dotfiles).
  + Why stow files if you may ask? Here is a wonderful article. http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html

* `minchu.tree` consists of current repository structure. In some cases it might be out of sync with project.
* Almost every executable requires a flag to run.
* `tests` folder contains scripts that are used by travis ci to check for shell scripts and dockerfiles if they build.
  * `test-shell-scripts` and `test-dockerfiles` are tests to be run on travis ci so as they do not need to be run locally.  
  * `test-shell-scripts` is a test which checks with shellcheck for errors and possible problems. `test-dockerfiles-diff`  builds the docker images and checks if they build and will fail if the image build  fails. Since it is computationally expensive to build all the dockerfiles only the files which are changed (when compared to master are built).
  * `test-dockerfiles` builds for all the dockerfiles in the project but is currently not enabled.



### Required additional programs, General  Requirements
- _adb_ and _fastboot_ for `android-tools`
- _imagemagick_ for `image-processing`
- _texlive-extra-utils_ for `office-tools`
- _stow_ for `stow`: to symlink config files and scripts from a single directory.
- _imwheel_ for using custom imwheel config
- Assumes that you are using a debian based system.
- Please see the documentation in individual folders for details regarding each of them.
- Most of them have help flag `--help -h` builtin.

### Changelogs


#### _v1.6_
* Travis CI integration for shellscripts and dockerfiles.
* Fixed several possible errors in shell scripts.
* Moved travis ci test scripts to `tests`

#### _v1.5.2_ , _v1.5.3_
* Fixed a bug in docker-helper-core which failed to load when it was in /.local/bin.
* Added .bash_aliases to seperate aliases from .bashrc.
* Updated documentation.

#### _v1.5.1_
* Updated documentation
* Added script to optimize histogram of image (level adjustments)

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

Well Bob, why have you explained every stupid thing in comments? I know most of them, its stupid.

--You might! But that increases readability and in case I let it eat dust, catch up with it after 10 years, it helps.
