export SEP1=""
export SEP2="|"

display_date() {
    printf "%s" "$SEP1"
    printf "DAT %s" "$(date "+%a %d-%m-%y %T")"
    printf "%s\n" "$SEP2"
}

display_date

while true
do
    upperbar=""
    upperbar="$upperbar$(display_date)"

    xsetroot -name "$upperbar"

    sleep 1
done
