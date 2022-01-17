#!/bin/bash
if [[ -z $GOOGLE_APPLICATION_CREDENTIALS ]]
then
  echo "[ERROR] GOOGLE_APPLICATION_CREDENTIALS env variable must be provided"
  exit 1
elif [[ -z $GOOGLE_APPLICATION_CREDENTIALS_JSON_B64 ]]
then 
  echo "[ERROR] GOOGLE_APPLICATION_CREDENTIALS_JSON_B64 env variable must be provided"
  exit 1
fi

if [[ -f $GOOGLE_APPLICATION_CREDENTIALS && -s $GOOGLE_APPLICATION_CREDENTIALS ]]
then
  echo "[INFO] File does exist! Already filled"
elif [[ -f $GOOGLE_APPLICATION_CREDENTIALS && ! -s $GOOGLE_APPLICATION_CREDENTIALS ]]
then
  echo "[INFO] File exist! File is empty"
  echo $GOOGLE_APPLICATION_CREDENTIALS_JSON_B64 | base64 -d > $GOOGLE_APPLICATION_CREDENTIALS
else
  echo "[INFO] File does not exist! Creating a new one"
  touch $GOOGLE_APPLICATION_CREDENTIALS
  echo $GOOGLE_APPLICATION_CREDENTIALS_JSON_B64 | base64 -d > $GOOGLE_APPLICATION_CREDENTIALS
fi