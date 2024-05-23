
## dev_env_vim

A containerized vim setup, for stable reproducibility and increased system hygiene.

The Dockerfile concerns the debian based image setup and several linter dependencies.

The build and run bash scripts assume podman, but docker works equally fine.

The run call can be made flexible with an alias in .bashrc, e.g. `alias
v=/path/to/dev_env_vim_run.sh`.

Parameters are passed directly into the container, e.g. `-p file1 file2`.

A caveat is that only the current folder (and hence its subfolders) is mounted into the container, 
so opening a file from another parent folder is not possible.

