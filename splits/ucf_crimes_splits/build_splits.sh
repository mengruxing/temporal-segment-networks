#!/usr/bin/env bash

for file in {train_001.txt,train_002.txt,train_003.txt,train_004.txt,test_001.txt,test_002.txt,test_003.txt,test_004.txt}; do
  while read line; do
    idx=$(echo $line | awk '{print $1}')
    clazz=$(echo $line | awk '{print $2}')
    grep "^$clazz" ~/deeplearning/datasets/UCF_Crimes/Action_Regnition_splits/$file | xargs -n1 -I {} echo {}$idx
  done < classInd.txt  > $file
done
