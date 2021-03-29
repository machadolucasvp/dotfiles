USER_HOME=$1
BASED_DISTRO=$2
CURRENT_DIR=$(dirname "$0")
. $CURRENT_DIR/common.sh


defaultInstall $BASED_DISTRO brave
defaultInstall $BASED_DISTRO vscode code

defaultInstall $BASED_DISTRO nvm
nvm install --lts

defaultInstall $BASED_DISTRO zsh
chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

