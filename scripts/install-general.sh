CURRENT_DIR=$(dirname "$0")
. $CURRENT_DIR/common.sh

apt install -y fonts-hack-ttf && logger hackFont installed

apt install -y zsh && logger zsh installed
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && logger oh-my-zsh installed

wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash && logger nvm installed

curl -s https://get.sdkman.io | bash && logger sdkman installed
source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk install java && logger java8 installed


