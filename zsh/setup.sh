echo "source ~/my_dot_files/zsh/zshrc" >> ~/.zshrc

# 安装fzf增强zsh的ctrl-r搜索
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
source ~/.zshrc

