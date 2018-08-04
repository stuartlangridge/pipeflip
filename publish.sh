#!/bin/bash
#scp *.html *.mp3 thump* *.png *.gif *.woff kryogenix.org:public_html/random/pipeflip/

HASH=$(git rev-parse --short HEAD)
rm -f pipeflip.zip

sed "s/HASHUNSPECIFIED/$HASH/" index.html > hashedindex.html

zip pipeflip.zip hashedindex.html *.mp3 thump* *.png *.gif *.woff 
printf "@ hashedindex.html\n@=index.html\n" | zipnote -w pipeflip.zip
rm hashedindex.html

~/.config/itch/bin/butler push pipeflip.zip stuartlangridge/pipe-flip:browser --userversion $HASH

