git_remote_add_ssh() {
    local remote="${1:-}"
    local repository="${2:-}"
    git remote add $1 git@github.com:$2.git
}

git_remote_add_http() {
    git remote add $1 https://github.com/$2.git
}

git_clone_personal_ssh() {
    local project="${1:-}"
    local dest="${2:-.}"
    git clone git@github.com:Dekr0/$project.git $dest
}

git_clone_personal_http() {
    local project="${1:-}"
    local dest="${2:-.}"
    git clone https://github.com/Dekr0/$project.git $dest
}
