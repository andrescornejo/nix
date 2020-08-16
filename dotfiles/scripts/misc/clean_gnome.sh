#!/bin/sh
# Installs gnome without the bloat.

prog='epiphany gedit gnome-books gnome-calendar gnome-contacts gnome-documents gnome-getting-started-docs gnome-maps gnome-music gnome-photos gnome-software gnome-weather totem'
sdo=''

# Set sudo if not run with sudo.
if (( $EUID != 0 )); then
    sdo='sudo'
fi

if ! command -v pacman &> /dev/null;
then
    echo "Pacman not available. Exiting..."
    exit
else
    echo 'Installing GNOME...'
    $sdo pacman -Syu $prog --noconfirm &> /dev/null
    echo 'Cleaning up GNOME instalation...'
    $sdo pacman -Rs $prog --noconfirm &> /dev/null 
    echo 'GNOME install complete.'
    exit
fi
