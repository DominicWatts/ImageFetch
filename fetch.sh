#!/bin/bash
DIMENSION=600
COUNT=20

echo "Start downloading $COUNT x $DIMENSION x $DIMENSION images"

command -v wget >/dev/null 2>&1 || { 
    echo >&2 "I require wget but it's not installed.  Aborting."; 
    exit 1; 
}

echo "Creating $DIMENSION x $DIMENSION folder" 

mkdir $DIMENSION

cd $DIMENSION

echo "Downloading $DIMENSION x $DIMENSION images" 

for I in $(seq 1 $COUNT)
do
    NAME=$(printf "%03d" $I);
    wget -c https://i.picsum.photos/id/$I/$DIMENSION/$DIMENSION.jpg -O image-$NAME.jpg
done

echo "End"