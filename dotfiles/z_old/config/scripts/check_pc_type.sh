#!/bin/bash
#This script sets the pc_type file, which is used for the CCR-Autoconfig scripts

file_dir="$HOME"/.cache/ccr_pc_type
desc="#This file contains the pc type, necessary for the CCR-Autoconfig"
amdnv="amd+nv"
intel="intel"
intnvopt="intel+nv_optimus"

function prompt_options {
	printf "\nSelect a PC type: 
	1. AMD CPU + Nvidia GPU
	2. Intel CPU only
	3. Intel CPU + Nvidia GPU (Optimus Enabled)

	Enter a number: "
	read pc_type
	validate_pctype $pc_type
}

function validate_pctype {
	if [ "$1" == "1" ] ; then
		create_config $amdnv	
	elif [ "$1" == "2" ] ; then
		create_config $intel
	elif [ "$1" == "3" ] ; then
		create_config $intnvopt
	else
		clear
		printf "Invalid option inserted please try again."
		prompt_options
	fi
}

function create_config {
cat > "$HOME"/.cache/ccr_pc_type << HERE
$desc
$1
HERE
}

function verify_file_integrity {
	if grep -q $amdnv "$file_dir" ; then
		printf "File verified successfully."
	elif grep -q $intel "$file_dir" ; then
		printf "File verified successfully."
	elif grep -q $intnvopt "$file_dir" ; then
		printf "File verified successfully.\n"
	else
		printf "\n***ccr_pc_type file is corrupt, initiating rebuild***\n"
		prompt_options
	fi	
}

##Script execution##

clear

if [ ! -f $file_dir ]; then
	printf "\n***ccr_pc_type file not found, creating at ~/.cache***\n"
	prompt_options
else
	echo "ccr_pc_type found"
	verify_file_integrity
fi
