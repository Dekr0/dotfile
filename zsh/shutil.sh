fd() {
    local depth="${1:-2}"
    local worker="${2:-0}"
    local dir="${3:-.}"
    cd $(shutil --walker -walker-depth $depth --walker-worker $worker $dir)
}

fdb() {
    cd $(shutil --walker --walker-depth 3 --walker-worker 0)
    zle reset-prompt
}

fdb_kitty() {
    select=$(shutil --walker --walker-depth 3 --walker-worker 0)
    kitten @ launch --type=tab --cwd $select
}

kitty_tab_fzf() {
    shutil --kitty-fzf-tab
}

pkg_install() {
    pkg="${1:-}"

    if [ -z "${pkg}" ]; then
        echo "pkg_install: package name is required"
    fi

    category="${2:-other}"

    sudo pacman -S $pkg
    
    if [ $? -eq 0 ]; then
        shutil --pkg-add $pkg --pkg-category $category

        cd $PKG_LIST_HOME
        git add .
        git commit -m "add package ${pkg} to ${category}"
        git push origin Arch-PC
    fi
}

pkg_uninstall() {
    pkg="${1:-}"

    if [ -z "${pkg}" ]; then
        echo "pkg_uinstall: package name is required"
    fi

    category="${2:-other}"

    sudo pacman -R $pkg

    if [ $? -eq 0 ]; then
        shutil --pkg-rm $pkg --pkg-category $category

        cd $PKG_LIST_HOME
        git add .
        git commit -m "remove package ${pkg} to ${category}"
        git push origin Arch-PC
    fi
}
