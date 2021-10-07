SRCS =	.vimrc \
		.zshrc \
		.gitconfig \
		.gitignore \
		.vim \
		.zsh

DESTS = $(addprefix ~/, ${SRCS})

all: clean copy
		
clean:
	rm -rf ${DESTS}

copy: ${SRCS}
	cp -r ${SRCS} ~/


.PHONY: all clean copy
