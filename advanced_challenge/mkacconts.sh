#!/bin/bash 

file="./newusers"
while IFS= read -r line; do
  first_name=$(echo $line | cut -d " " -f 1)
  last_name=$(echo $line | cut -d " " -f 2)
  user_name=$(echo ${first_name,,} | cut -b 1)${last_name,,}
  sudo useradd "$user_name"
  echo "made new user $user_name"
done<"$file"

