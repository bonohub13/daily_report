#!/usr/bin/sh

convert() {
    title=$1
    filename=`echo $title | sed "s/md$/html/"`
    top="\
<!DOCTYPE html>\n\
<html>\n\
  <head>\n\
    <meta charset=\n\"UTF-8\">\
    <title>$title</title>\n\
  </head>\n\
  <body>"
    bottom="\
  </body>\n\
</html>"

    echo -e "$top" > $filename
    pandoc $title | while read line
    do
        echo "$(printf ' %0.s' `seq 1 4`)$line" >> $filename
    done
    echo -e "$bottom" >> $filename

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
