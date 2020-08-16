#Config by Andres Cornejo
#To change to zsh: chsh -s $(which zsh)

vsFixDir="/home/andres/.config/scripts/vsc_market.sh -l"

#Aliases
alias syy="yay -Syy"
alias zshconfig="emacs ~/.zshrc"
alias rcvim="vim ~/.config/nvim/init.vim"
alias m="ncmpcpp"
alias wp="feh --bg-fill $1"
alias resc="./.config/scripts/restart_compton.sh"
alias resp="./.config/polybar/launch.sh"
alias upmir="reflector --latest 200 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist"
alias vsfix="sudo exec "
#alias ro="exec /home/andres/.config/gzdoom/scripts/launchRO.sh"

# Use neovim for vim if present.
command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d" 
