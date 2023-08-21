# Collin's Shared Config/Build Files

I was using the same `Makefile` across multiple repos and the same `.bashrc` across multiple computers, so I figured I'd make a shared module to enforce SSOT (single source of truth).

To use the `Makefile`: add this repo as a git submodule, then include it in the local `Makefile` with
```
include collin-shared/python-build.mk
```

To use the `.bashrc`, clone this repo into your computer's root directory, and source it in the local `.bashrc` with
```
OS_NAME="INSERT-OS-NAME-HERE"
source ~/collin-shared/.bashrc```