# Collin's Shared Config/Build Files

Repo for some of my shared files I use across multiple projects/computers.

To use the `Makefile`: Copy-paste or add this repo as a git submodule, then include it in the local `Makefile` with
```
include collin-shared/python-build.mk
```

To use the `.bashrc`: Copy-paste or clone this repo into your computer's root directory, and source it in the local `.bashrc` with
```
OS_NAME="INSERT-OS-NAME-HERE"
source ~/collin-shared/.bashrc
```