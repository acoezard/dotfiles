SRCS =	.vimrc \
		.zshrc \
		.gitconfig \
		.gitignore \
		.vim \
		.zsh \
		builder_lang.sh \
		free_space.sh \
		show_space.sh

DESTS = $(addprefix ~/, ${SRCS})

all: clean copy update install

clean:
	rm -rf ${DESTS}

copy: ${SRCS}
	git submodule init
	git submodule update
	cp -r ${SRCS} ~/

update:
	apt -y update
	apt -y upgrade
	apt install -y zsh

install:
	chsh -s /bin/zsh

.PHONY: all clean copy update install
