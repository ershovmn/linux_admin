#!/bin/sh
if [ -d "test" ]; then
    mkdir -p backups
    FILENAME="backup_$(date '+%Y-%m-%d_%H-%M-%S').tar"
    tar -cf $FILENAME test 
    mv $FILENAME backups/$FILENAME
else
    if [ ! -d "backups" ]; then
        echo "No backups"
    else
        FILENAME="$(ls ~/test1/backups/ -t | head -n 1)"
        tar -xf backups/$FILENAME
   `fi
fi
