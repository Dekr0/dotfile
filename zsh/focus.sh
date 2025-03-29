#!/usr/bin/sh

cmd="${1:- }"
classname="${2:- }"
args="${3:- }"

result="$(xdotool search --limit 1 --classname "^${classname}$" getwindowpid)"

if [ -z "$result" ]
then
    $cmd $args
else
    # xdotool windowactivate --sync ${result}
    wid=$(wmctrl -lp | grep "${result}" | awk '{print $1}')
    wmctrl -iR "${wid}"
fi
