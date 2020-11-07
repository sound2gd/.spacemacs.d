#! /bin/sh

work_path=$(dirname $0)

if [ ! -d $HOME/.tmux ];then
   ln -s $work_path/.tmux $HOME/.tmux
   ln -s -f $work_path/.tmux/.tmux.conf $HOME/.tmux.conf
   ln -s $work_path/.tmux.conf.local $HOME/
   echo "已创建~/.tmux软连接"
fi
