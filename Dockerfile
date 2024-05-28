FROM debian:stable-slim
RUN apt update && \
    apt install -y \
    vim \
    curl \
    git \
    jq \
    libxml2-utils \
    black \
    python3-pip \
    shellcheck
RUN pip3 install --break-system-packages ruff

RUN apt install -y \
  autoconf \
  automake \
  pkg-config
WORKDIR /tmp
RUN git clone https://github.com/universal-ctags/ctags.git
WORKDIR /tmp/ctags
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install

COPY ./vimrc /root/.vimrc
RUN curl -fLo /root/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN vim +'PlugInstall --sync' +qa
ENV TERM=xterm-256color
ENV LANG=C.UTF-8
ENV LANGUAGE=C.UTF-8
ENV LC_ALL=C.UTF-8
WORKDIR /mount

