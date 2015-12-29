#!/bin/bash

RED=`tput setaf 1`
GREEN=`tput setaf 2`
NC=`tput sgr0`

echo "${RED}>> ${GREEN}installing pathogen${NC}"
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo creating vimrc symlink
ln vimrc ~/.vimrc

echo "${RED}>> ${GREEN}installing plugins${NC}"
cd ~/.vim/bundle
echo "${RED}+ ${GREEN}NERD Tree plugin${NC}" 
git clone https://github.com/scrooloose/nerdtree.git
echo "${RED}+ ${GREEN}NERD Commenter plugin${NC}"
git clone https://github.com/scrooloose/nerdcommenter.git
echo "${RED}+ ${GREEN}EeasyMotion plugin${NC}"
git clone https://github.com/easymotion/vim-easymotion.git
echo "${RED}+ ${GREEN}Airline plugin${NC}"
git clone https://github.com/bling/vim-airline.git
#pip install --user powerline-status
echo "${RED}+ ${GREEN}CTRL-P plugin${NC}"
git clone https://github.com/ctrlpvim/ctrlp.vim.git
echo "${RED}+ ${GREEN}Startify plugin${NC}"
git clone https://github.com/mhinz/vim-startify.git
