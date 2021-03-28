USER_HOME=$1
BASED_DISTRO=$2
CURRENT_DIR=$(dirname "$0")
. $CURRENT_DIR/common.sh


defaultInstall $BASED_DISTRO brave
defaultInstall $BASED_DISTRO vscode code

