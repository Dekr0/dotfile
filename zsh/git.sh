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

# how git submodule work
#
# a submodule is a repository embedded inside another repository
#
# each submodule has its own history, a repository it is embedded in is called 
# a super project
#
# on the file system, a submodule usually consists of
#   (i) a Git directory located under the `$GIT_DIR/modules` directory of its 
#   super project
#   (ii) a working directory inside the super project's working directory, and 
#   a `.git` file at the root of the submodule's working directory pointing to 
#   (i)
#
# assuming a submodule has a Git directory at `$GIT_DIR/modules/foo` and a 
# working directory at `path/to/bar`
#
# its super project tracks that submodule via a `gitlink` entry in the tree at 
# `path/to/bar` and an entry in its super project `.gitmodules` file of the 
# form submodule.foo.path = path/to/bar
#
# that `gitlink` entry contains a specific object name of a specific commit 
# that its super project expects its (that submodule) working directory to 
# be at
#
# section `submodule.foo.*` in the .gitmodules file gives additional hints 
# to Git's porcelain layer
#
# example: submodule.foo.url settting specifies where to obtain that 
# submodule
#
# a submodule can be deleted by running `git rm <submodule path>` && 
#`git commit`
# to completely remove a submodule, manually delete `$GIT_DIR/modules/<name>`
