FROM debian:stable-slim
RUN apt update
RUN apt install -y vim
RUN apt install -y curl
RUN apt install -y git
RUN curl -fLo /root/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY ./vimrc /root/.vimrc
RUN vim +'PlugInstall --sync' +qa
RUN apt install -y jq
RUN apt install -y libxml2-utils
RUN apt install -y black
WORKDIR /home
CMD ["vim", "."]
