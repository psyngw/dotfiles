#!/usr/bin/env bash

# echo "1"
test -z "$joshuto_wrap_id" && exit 1;

path="$1"       # Full path of the previewed file
x="$2"          # x coordinate of upper left cell of preview area
y="$3"          # y coordinate of upper left cell of preview area
width="$4"      # Width of the preview pane (number of fitting characters)
height="$5"     # Height of the preview pane (number of fitting characters)


# Find out mimetype and extension
mimetype=$(file --mime-type -Lb "$path")
extension=$(/bin/echo "${path##*.}" | awk '{print tolower($0)}')

case "$mimetype" in
    image/png | image/jpeg)
        meta_file="$(get_preview_meta_file $path)"
        y_offset=`cat "$meta_file" | grep "y-offset" | awk '{print $2}'`
        y=$(( $y + $y_offset ))
        show_image "$path" $x $y $width $height
        ;;
    *)
        remove_image

esac
