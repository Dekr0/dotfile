# Helper functions and snippets in bash
#
# Function default parameter `${1:-default_value}`
#
# To make use of the return value of each function, call the function and get 
# return value using `$?`
# 
# 0 mean true / success; 1 mean false / fail

exist() {
    local path="${1:-}"
    if [ -e $path ]; then
        echo 0
    else
        echo 1
    fi
}

is_file() {
    local path="${1:-}"
    if [ -f $path ]; then
        echo 0
    else
        echo 1
    fi
}

is_dir() {
    local path="${1:-}"
    if [ -d $path ]; then
        echo 0
    else
        echo 1
    fi
}
