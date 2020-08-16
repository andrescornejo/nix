local filesystem = require('gears.filesystem')

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'alacritty',
    editor = 'vscodium',
    rofi_drun = 'rofi -show drun ',
    rofi_run = 'rofi -show run ',
    rofi_mountmenu = filesystem.get_configuration_dir() .. '/scripts/mount_menu.sh',
    rofi_powermenu = filesystem.get_configuration_dir() .. '/scripts/power_menu.sh',
    lock = 'mpc pause && dm-tool lock',
    quake = 'alacritty --title QuakeTerminal'
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'compton --config ' .. filesystem.get_configuration_dir() .. '/configuration/compton.conf',
    'blueberry-tray', -- Bluetooth tray icon
    'xfce4-power-manager', -- Power manager
    '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    'mpd ~/.config/mpd/mpd.conf',
    'mpDris2',
    'light-locker --no-late-locking --lock-on-suspend --idle-hint', --Screen locker
    'nm-applet',
    'pasystray'
  }
}
