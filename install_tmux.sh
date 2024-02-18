sudo apt install -y tmux xsel
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
mkdir -p $HOME/.config/tmux
ln -s $HOME/Downloads/dotfiles/tmux/tmux.conf $HOME/.config/tmux/tmux.conf
