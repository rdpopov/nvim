#!/bin/bash

safe_exec(){
    if [[ -n $SANDBOX ]];then
        echo $@
    else 
        $@
    fi
}
get_pip(){
    cd ~
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python3 get-pip.py
}

get_distro(){
    safe_exec echo $(cat /etc/*-release |grep ^DISTRIB_ID|cut -f2 -d=)
}

arch_install_yay(){
    cd ~
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
}

package_install() {
    DISTRO=$(get_distro)
    case $DISTRO in 
        Debian|Ubuntu)
            safe_exec sudo apt install $@
            ;;
        Arc*)
            if [[ -x yay ]];then
                safe_exec yay -Sy $@
            else
                arch_install_yay
            fi
            ;;
        Fedora)
            safe_exec sudo dnf install $@
            ;;
        *)
            echo "Unknown distro package manager, Please add it to list and try again"
            ;;
      esac
}

pip_isntall(){
    safe_exec pip isntall $1 && echo "installed $1"
}
