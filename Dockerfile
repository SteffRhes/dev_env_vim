FROM debian:stable-slim
RUN apt update
RUN apt install -y vim
RUN apt install -y curl
RUN apt install -y git
RUN curl -fLo /root/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN apt install -y jq
RUN apt install -y libxml2-utils
RUN apt install -y black
RUN apt install -y python3-pip
RUN pip3 install --break-system-packages ruff
RUN apt install -y shellcheck
ENV TERM=xterm-256color
COPY ./vimrc /root/.vimrc
RUN vim +'PlugInstall --sync' +qa
WORKDIR /home
CMD ["vim", "."]
