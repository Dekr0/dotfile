# Only run on fresh install OS
local codebase=$HOME/codebase
local dlocal=$HOME/.local
local download=$HOME/Downloads
local repo=$HOME/repo
local suckless=$repo/suckless

# Setup directory
# Directory might exist, or might not exist
cd ~
if [ ! -d $dlocal ] then
    mkdir $dlocal
fi
mkdir $dlocal/bin
if [ ! -d $download ] then
    mkdir $download
fi
# Directory guarantee not exist
mkdir $codebase
mkdir $repo
mkdir $suckless

# install golang
curl $download/go1.24.2.linux-amd64.tar.gz https://go.dev/dl/go1.24.2.linux-amd64.tar.gz
cd $download
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.24.2.linux-amd64.tar.gz

# install shutil
cd $codebase
git clone https://github.com:Dekr0/shutil.git
cd shutil
python build.py

# install dwm
cd $suckless
git clone https://github.com/Dekr0/dwm.git
cd $suckless/dwm
git merge origin/patched
./install.sh
./reset.sh

# deploy dotfile
cd $repo
git clone https://github.com/Dekr0/dotfile.git 
cd dotfile
source zsh/dotfile.sh
deploy_dotfile

# setup ssh key
xssh-keygen
