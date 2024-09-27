#!/bin/sh


if [ $# -ne 2 ]
then
    echo "Usage $0 an01234 'Title'"
    exit 1
fi

app_note=`echo $1 | sed 's/an//'`
target_dir=../an$app_note
title="$2"

for i in `find . -print`
do
    case $i in
        ./.git/*) ;;
        ./.git) ;;
        ./copyme.sh) ;;
        *)
            target=`echo $target_dir/$i | sed -e "s/an0xxxx/$1/"`
            echo Creating $target
            if [ -f "$i" ]
            then
                sed -e "s/0xxxx/$app_note/" -e "s/<APP NOTE TITLE HERE>/$title/" < $i > $target
            elif [ -d "$i" ]
            then
                mkdir -p $target
            else
                echo 'What ? ' $i
            fi
            ;;
    esac
done
