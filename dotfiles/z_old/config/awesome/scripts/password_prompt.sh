#!/usr/bin/env bash
# Take password prompt from STDIN, print password to STDOUT

rofi\
	-dmenu \
	-password \
	-p "$(printf "Authentication required:" | sed s/://)"
