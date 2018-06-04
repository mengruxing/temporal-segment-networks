#!/usr/bin/env bash

for file in {train_001.txt,train_002.txt,train_003.txt,train_004.txt,test_001.txt,test_002.txt,test_003.txt,test_004.txt}; do
  while read line; do
    clazz=$(echo $line | awk -F/ '{print $1}')
    idx=$(grep "$clazz" classInd.txt | awk '{print $1}')
    echo $line $idx
  done < ~/deeplearning/datasets/UCF_Crimes/Action_Regnition_splits/$file > $file
done
