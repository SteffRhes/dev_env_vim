
## dev_env_vim

A containerized vim setup, for stable reproducibility and increased system hygiene.

The Dockerfile concerns the debian based image setup and several linter dependencies.

The build and run bash scripts assume podman, but docker works equally fine.

A ~~caveat~~ security feature is that only the current folder (and its subfolders) is mounted into the container, 
so opening a file from another parent folder is not possible.

### how to use

tested only on linux.

first run the build script in this folder:
```
./dev_env_vim_build.sh
```
After that, a local image `dev_env_vim` was created, run this interactively with the script
```
./dev_env_vim_run.sh
```

Parameters can be passed directly to vim, e.g. this would open two files in two tabs:
```
./dev_env_vim_run.sh -p file1 file2
```

The run script could be made runnable anywhere with an alias added to .bashrc like so:
```
alias vim=/path/to/dev_env_vim_run.sh
```

Or wrap the podman call into a function in .bashrc:
```
vim() {
    podman run --rm -it -v .:/mount:z dev_env_vim vim "$@"
}
```
