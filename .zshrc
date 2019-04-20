
if [[ ! ( -d "${HOME}/.zplug" )]]; then
    git clone https://github.com/b4b4r07/zplug "${HOME}/.zplug"
fi

source ${HOME}/.zsh/common.sh

# additonal packages
source ${HOME}/.zplug/init.zsh
source ${HOME}/.zsh/package.sh
zplug install
zplug load

source ${HOME}/.zsh/package_config.sh
