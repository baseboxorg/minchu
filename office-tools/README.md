# A collection of scripts used for office use(pdf, tex,documents etc).

---
This directory tree contains several scripts used for office tools
Requirements of individual scripts vary. Sometimes, the scripts simply assume that
you have the necessary packages/binaries installed and they are available to you in PATH etc.
Please read the comment section of each script before proceeding.

---
#### **pdf-rotate**
Tool to rotate pdf files by 90,180,270 degrees


**Requires**
* pdf90, pdf180, pdf270 from  [texlive-extra-utils] package.
* pdf files to be in same directory from which script is called.

**Usage**:
Simply run the script with parameters and files. You can input multiple files.
Parameters should be specified first.
```
Parameters are:
[--right]            [ Rotate 90 right ]
[--left ]            [ Rotate 90 left ]
[--up-down]          [ Rotate 180 (upside down) ]
<file1> <file2> ...  [ Files to handle ]```
```
Example: `./pdf-rotate --right foo.pdf`. The output is saved in the same directory with a suffix `-rotated` to original filename. To see the options available and help menu simply run  `./pdf-rotate --help` argument to the script.
