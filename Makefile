SRCS =	.vimrc \
		.zshrc \
		.gitconfig \
		.gitignore \
		.vim \
		.zsh

DESTS = $(addprefix ~/, ${SRCS})

all: clean copy update install

clean:
	rm -rf ${DESTS}

copy: ${SRCS}
	git submodule init
	git submobule update
	cp -r ${SRCS} ~/

update:
	apt -y update
	apt -y upgrade

install:
	apt install -y zsh
	chsh -s /bin/zsh

.PHONY: all clean copy update install
