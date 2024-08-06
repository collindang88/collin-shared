# Collin's Shared/Template Files

Repo for some of my shared/template files I use across multiple projects/computers.

To use the `python-build.mk`: Copy-paste or add this repo as a git submodule, then include it in the local `Makefile` with
```
include collin-shared/python-build.mk
```

To use the `.bashrc`: Copy-paste or clone this repo into your computer's root directory, and source it in the local `.bashrc` with
```
OS_NAME="INSERT-OS-NAME-HERE"
source ~/collin-shared/.bashrc
```

`single.mk` is an example Makefile for a single C++ file called `main.cpp`.

`helper.mk` is an example Makefile for a C++ file called `main.cpp` and a helper file called `helper.cpp`.