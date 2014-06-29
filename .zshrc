# Set up the prompt

autoload -Uz promptinit
promptinit
#prompt adam1
autoload -U colors && colors
PROMPT="%{$fg_bold[white]%}%n%{$fg_bold[grey]%}@%{$fg_bold[white]%}%m%{$fg_bold[grey]%}:%{$fg_bold[green]%}%p%{$fg[green]%}%c%{$fg_bold[grey]%}$ %{$reset_color%}"

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
setopt HIST_IGNORE_DUPS
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# ALIAS ETC.

bindkey '\e.' insert-last-word
alias vim='nocorrect vim'
alias go='gnome-open'
alias sag='sudo apt-get'
alias c='clear'
alias grep='grep --color=auto'
alias diff='colordiff'
alias h='history'
alias j='jobs -l'
alias ports='netstat -tulanp'
alias mp='mplayer'
alias lock='gnome-screensaver-command --lock'
alias matlb='matlab -nodesktop'
alias vn='nocorrect vnstat'
# commandline math alias showing results in different number representations
alias cz='noglob perl -e '\''shift; $x = eval qq(@ARGV); print $x; printf " 0x%x 0%o %b\n", $x, $x, $x'\'' _'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -trl' 

alias ..='cd ..'

# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
    alias reboot='sudo /sbin/reboot'
    alias shutdown='sudo /sbin/shutdown -h now'
fi

# start vlc http stream of active audio
alias audiostreamvlc='cvlc -vvv pulse://alsa_output.pci-0000_00_1b.0.analog-stereo.monitor --sout '\''#transcode{acodec=mp3,ab=128,channels=2}:standard{access=http,dst=0.0.0.0:8080/pc.mp3}\n'\'' '
