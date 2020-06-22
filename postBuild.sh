#!/bin/bash
set -ex # Exit immediately if a command exists with a non-zero status and then print coomands and ther arguments

fileid="1X6KVJloBrXwylg_Dk129zMT1_WSdx0Er" # The fileid generated by google drive
filename="sample_data.zip" # The file name you want to be stored as
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=1X6KVJloBrXwylg_Dk129zMT1_WSdx0Er" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
unzip ./${filename} -d ./sample_data && rm ./${filename} ./cookie