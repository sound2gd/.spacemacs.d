#! /bin/sh

work_path=$(dirname $0)

if [ ! -d $HOME/.tmux ];then
   echo "创建~/.tmux软连接"
   ln -s $work_path/.tmux $HOME/.tmux
   ln -s -f $work_path/.tmux/.tmux.conf $HOME/.tmux.conf
   cp $work_path/.tmux/.tmux.conf.local $HOME/
fi
