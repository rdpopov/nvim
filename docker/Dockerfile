#syntax=docker.dockerfile:1
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive 
RUN echo 'alias nvim="alias nvim=/squashfs-root/usr/bin/nvim"' >> ~/.bashrc

#nvim need to run
RUN apt-get update
#nvim dependacies
RUN apt install -y \
	fuse\
	libfuse2\
	git\
	python3-pip\
	curl \
	wget\
	ack-grep

# ripgrep  - 
# I like it and I use it 
RUN apt install -y \
	ripgrep
#ripgrep

#	fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
#	fzf

# neovim dependacies and install 
RUN apt-get install -y \
	ninja-build\
	gettext \
	libtool \
	libtool-bin \
	autoconf \ 
	automake \
	cmake \
	g++ \
	pkg-config \
	tmux\
	unzip

RUN cd / && git clone --depth 1 --branch nightly https://github.com/neovim/neovim
RUN cd neovim && \
	make CMAKE_BUILD_TYPE=Release && \
	make install && \
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&\
	mkdir ~/.config &&\
	cd ~/.config &&\
	git clone https://github.com/rdpopov/nvim &&\
	echo 'alias nvim="/neovim/build/bin/nvim"' >> ~/.bashrc &&\
	pip install neovim &&\
	cd ~/.config/nvim &&\
	./setup.sh -t
#neovim setup end


#LANGUAGE SERVERS
####	ccls
#ccls compile from source --beginnig
#RUN apt install -y g++ build-essential cmake libncurses-dev zlib1g-dev \
#      libevent-dev \
#      libcrypto++-dev libmsgpack-dev libjsoncpp-dev \
#      libmysqlcppconn-dev libgtest-dev cmake libgoogle-perftools-dev \
#      libssl-dev libmysqlclient-dev libcrypto++-dev libc6-dev libc6-dev-i386 \
#      clang libclang-dev llvm
##nvim plugin dependacies
#
##nvim lsp-s
##ccls
#RUN git clone --depth=1 --recursive https://github.com/MaskRay/ccls
#RUN cd ccls && cmake -H. -BRelease -DDCMAKE_BUILD_TYPE=Release && cmake --build Release --target install
#ccls compile from source --ending


####	pyls
#RUN pip install pyls

#setup nvim:nightly


ENTRYPOINT ["/bin/bash"]
