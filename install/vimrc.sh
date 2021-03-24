rm -rf ~/.vim/plugged
mkdir -p ~/.vim/tmp
curl -sfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -sfLo ~/.vimrc https://raw.githubusercontent.com/mriva/rc/master/vimrc
vim -es -u .vimrc -i NONE -c "PlugInstall" -c "qa"
