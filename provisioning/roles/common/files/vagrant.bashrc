# .bashrc
TERM=xterm-256color
# Alias
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias la='ls -la'
alias  l='ls'
alias ll='ls -l'
alias vi='vim'
alias t='tree -A'

###################################
# Color Settings
##

#
# Common
#
NO_COLOR="\[\033\e[0m\]"
function EXT_COLOR () { echo -ne "\[\033[38;5;$1m\]"; }

#
# Directory Colors
#
COLORS=/etc/DIR_COLORS
[ -e "/etc/DIR_COLORS.$TERM" ] && COLORS="/etc/DIR_COLORS.$TERM"
[ -e "$HOME/.dircolors" ] && COLORS="$HOME/.dircolors"
[ -e "$HOME/.dircolors.$TERM" ] && COLORS="$HOME/.dircolors.$TERM"
[ -e "$HOME/.dir_colors" ] && COLORS="$HOME/.dir_colors"
[ -e "$HOME/.dir_colors.$TERM" ] && COLORS="$HOME/.dir_colors.$TERM"
[ -e "$HOME/.bash_dir_colors" ] && COLORS="$HOME/.bash_dir_colors"
[ -e "$COLORS" ] || return

eval `dircolors --sh "$COLORS"`
[ -z "$LS_COLORS" ] && return

if ! egrep -qi "^COLOR.*none" $COLORS >/dev/null 2>/dev/null ; then
  alias ll='ls -l --color=tty' 2>/dev/null
  alias l.='ls -d .* --color=tty' 2>/dev/null
  alias ls='ls --color=tty' 2>/dev/null
else
  alias ll='ls -l' 2>/dev/null
  alias l.='ls -d .*' 2>/dev/null
fi


#
# Prompt Colors
#

# EXT_COLOR 162 -> Pink
# EXT_COLOR 166 -> Orange
# EXT_COLOR 154 -> Light Green

export PS1="`EXT_COLOR 166`\u\
`EXT_COLOR 162`@\
`EXT_COLOR 166`\h \
`EXT_COLOR 162`\W\
`EXT_COLOR 154`#\[\033[00m\] "


# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

