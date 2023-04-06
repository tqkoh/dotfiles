
# backup
if [ -f ~/.bashrc ]; then
    cp --backup=numbered ~/.bashrc ~/.bashrc.bak
elif [ -L ~/.bashrc ]; then
    rm ~/.bashrc
fi
if [ -f ~/.vimrc ]; then
    cp --backup=numbered ~/.vimrc ~/.vimrc.bak
elif [ -L ~/.vimrc ]; then
    rm ~/.vimrc
fi
if [ -f ~/.tmux.conf ]; then
    cp --backup=numbered ~/.tmux.conf ~/.tmux.conf.bak
elif [ -L ~/.tmux.conf ]; then
    rm ~/.tmux.conf
fi
if [ -d ~/.tmux ]; then
    cp -r --backup=numbered ~/.tmux ~/.tmux.bak
elif [ -L ~/.tmux ]; then
    rm ~/.tmux
fi

# symlink
ln -s $(pwd)/$1/.bashrc ~/.bashrc
ln -s $(pwd)/$1/.vimrc ~/.vimrc
ln -s $(pwd)/$1/.tmux.conf ~/.tmux.conf
ln -s $(pwd)/$1/.tmux ~/.tmux
