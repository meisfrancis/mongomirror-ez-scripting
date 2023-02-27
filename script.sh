#!/usr/bin/env bash
function read_input() {
  read -p 'Enter source host: ' source
  read -p 'Enter destination host: ' des
  read -p 'Bookmark file name: ' bm
  read -p 'Source username: ' s_user
  read -p 'Source pass: ' s_pass
  read -p 'Destination username: ' d_user
  read -p 'Destination pass: ' d_pass
  read -p 'Collection name: ' col

  echo Pls review your request
  echo Source Reps: $source
  echo Destination Reps: $des
  echo Bookmark: $bm
  echo Collection: $col

  read -p 'Perform mirror (y/n): ' confirm

  if [ $confirm = 'y' ]
  then
    mongomirror \
    --host $source \
    --destination $des \
    --bookmarkFile $bm \
    --username $s_user \
    --password $s_pass \
    --destinationUsername $d_user \
    --destinationPassword $d_pass \
    --ssl \
    --authenticationDatabase admin \
    --includeDB $col \

  else
    read_input
  fi
}

read_input


