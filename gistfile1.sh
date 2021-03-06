#!/bin/bash

WPDIR="$HOME/Pictures/Qwallpaper"

random=true
apply=false
wpfile=""

function usage {
        if [ $1 -eq 1 ]; then
                stream=2
                exitcode=255
        else
                stream=1
                exitcode=0
        fi
        echo "Usage: $(basename $0) [-n|--noapply] [-h|--help] [wallpaper_locat$
        echo "If wallpaper location is not given a random wallpaper from $WPDIR$
        exit $exitcode
}

# handle arguments
while [ $# -gt 0 ]; do
        if [ "$1" = "--help" -o "$1" == "-h" ]; then
                usage 0
        elif [ "$1" = "--noapply" -o "$1" = "-n" ]; then
                apply=false
        else
                if ! $random; then
                        usage 1
                elif [ ! -f "$1" ]; then
                        echo "file '$1' not found" >&2
                        exit 1
                fi
                random=false
                { cd $(dirname "$1"); dir=$(pwd); }
                wpfile="$dir/$(basename "$1")"
        fi
        shift
done

if $random; then
        wpfile=$(ls "$WPDIR"/*.jpg | sort -R | head -n 1)
        echo "chose $wpfile" >&2
fi

cat >$HOME/.config/nitrogen/bg-saved.cfg <<EOF
[:0.0]
file=$wpfile
mode=5
bgcolor=# 0 0 0
EOF

if $apply; then
        echo "Imaged Set in Config"
fi

