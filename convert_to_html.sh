#!/usr/bin/sh

convert() {
    title=$1
    filename=`echo $title | sed "s/md$/html/"`
    top="\
<!DOCTYPE html>\
<html>\
  <head>\
    <meta charset=\"UTF-8\">\
    <title>$title</title>\
  </head>\
  <body>"
    bottom="\
  </body>\
</html>"

    echo "$top" > $filename
    pandoc $title | while read line
    do
        echo "$(printf ' %0.s' `seq 1 4`)$line" >> $filename
    done
    echo $bottom >> $filename

    less $filename
}

if [ `which pandoc | wc -w` -eq 1 ]
then
    convert $1
else
    echo "pandoc is nessesary for this."
    echo "Please install pandoc to convert markdown to html."
    return 1
fi
