#! /usr/bin/env bash

sudo apt update
sudo add-apt-repository ppa:apt-fast/stable
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt update
sudo apt install apt-fast -y

sudo apt-fast install -y gnome-shell-extensions chrome-gnome-shell silversearcher-ag git trash-cli libcanberra-gtk-module libcanberra-gtk3-module gconf2 gconf-service libappindicator1 libssl-dev libsodium-dev python python2.7 python2.7-dev python3 python3-dev curl gnome-tweak-tool openvpn snapd npm zsh libncurses5-dev cscope apt-transport-https ca-certificates gnupg-agent software-properties-common

sudo apt-get -y remove docker docker-engine docker.io containerd runc
sudo apt-fast install -y docker-ce docker-ce-cli containerd.io


sudo dpkg -E -i google-chrome-stable_current_amd64.deb
sudo dpkg -E -i electron-ssr-0.2.6.deb


# vim
rm -r vim-8.2.2311/
unzip -n ./vim-8.2.2311.zip
cd vim-8.2.2311/
./configure --with-features=huge \
                --enable-multibyte \
                --enable-rubyinterp=yes \
                --enable-pythoninterp=yes \
                --with-python-command=`which python2` \
                 --enable-python3interp=yes \
                --with-python3-command=`which python3` \
                --enable-perlinterp=yes \
                --enable-luainterp=yes \
                --enable-cscope \
                --enable-gui=gtk2 --enable-cscope --prefix=/usr/local/
make -j8 && sudo make install -j4
git clone https://github.com/HaomingJu/.vim.git ~/.vim
ln -f -s ~/.vim/.zshrc ~/.zshrc



sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://0qtofn3p.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker


sudo snap install ccls --classic
sudo n lts
sudo npm install n -g


# Zsh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ssh-keygen

# Docker Image Fast:    https://cr.console.aliyun.com/cn-hangzhou/instances/mirrors
# apt-fast:             https://code.launchpad.net/~apt-fast/+archive/ubuntu/stable
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# wget https://github.com/vim/vim/archive/v8.2.2311.zip
# wget https://github.com/qingshuisiyuan/electron-ssr-backup/releases/download/v0.2.6/electron-ssr-0.2.6.deb
