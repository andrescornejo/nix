#!/bin/bash
#This script makes folders, with incrementing numeral index, at a specified directory
#NOT WORKINGxd

printf "Insert the directory in which the folders will be created: "
read dest_dir
printf "\n"

printf "Insert the name of the folders to be created: "
read folder_name
printf "\n"

printf "Insert the starting index: "
read start_index
printf "\n"

printf "Insert the final index: "
read final_index
printf "\n"

if (( $final_index < $start_index)) ; then 
	printf "Error: Final index is smaller than the start index."
else
	mkdir -p "$folder_name"{"$start_index".."$final_index"}
fi
