
#!/bin/zsh

# 将~/.config/nvim 文件夹更名为~/.config/nvim.bak
mv ~/.config/nvim ~/.config/nvim.bak

# 使用git clone来克隆配置文件仓库到~/.config/nvim.bak
git clone https://github.com/Enigmaaaa/nvim.git ~/.config/nvim.bak

# 输出操作完成的消息
echo "config setting DOWN"