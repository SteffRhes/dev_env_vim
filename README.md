
## dev_env_vim

My containerized vim setup, for OS hygiene, portability and reproducibility.

The Dockerfile defines the debian based image setup and a few third-party additions, such as linters and plugins.

A ~~caveat~~ security feature is that only the current folder is mounted into the container, so opening a file 
from a parent folder is not possible.

### use docker hub image

To use the pre-built image pushed to docker hub, simply do:
```
docker run -it -v ./:/mount/ steffrhes/dev_env_vim:latest
```

### building and using scripts

(tested only on Linux.)

To build locally and use the executable script for convenience, first build with:
```
./dev_env_vim_build.sh
```
After that, run the built image with the script:
```
./dev_env_vim_run.sh
```

Calling this script is equivalent to calling a usual vim executable, e.g. passing arguments 
like so:
```
./dev_env_vim_run.sh -p file1 file2
```

The script may be called from anywhere with an alias added to .bashrc like so:
```
alias vim=/path/to/dev_env_vim_run.sh
```
