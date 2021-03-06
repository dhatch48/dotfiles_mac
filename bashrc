export CLICOLOR=1   # simply enables coloring of your terminal.
export LSCOLORS=GxFxCxDxBxegedabagaced  # specifies how to color specific items
export EDITOR=vim

# some more ls aliases
alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -alht' # Sort by mod date
alias lc='ls -AlhtU'
alias lad='ls -d */'

# can also redefine a command to change default options
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias df='df -h'
alias du='du -h'
alias h='history'
alias up='cd ..'
alias tart='tar -tzvf'   # List file in archive
alias tarc='tar -czvf'   # archive to file and gzip
alias tarx='tar -xzvf'   # unarchive and ungzip
# some apple script
alias unmute="osascript -e 'set volume output muted false'"
alias mute="osascript -e 'set volume output muted true'"
# Dramatically improve grep performance - temporarily set collation to ascii
# For grep version older than 2.7
# Prepend 'LC_ALL=C'
# ex. LC_ALL=C frep 'asdf' *.txt
alias grep='LC_ALL=C grep'
alias fgrep='LC_ALL=C fgrep'
alias egrep='LC_ALL=C egrep'
alias less='less -MRS'
alias phptools="php $HOME/Sites/unified/tools/createSqlForModel.php"
alias getVundle="git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim"
alias findswap="find . -iname '*.swp'"
alias rmswap="find . -iname '*.swp' -print0 | xargs -0 rm"
# Show bash keybindings
alias showkeys="bind -p | grep -v '^#\|self-insert\|^$'"
alias st="tmux attach-session || tmuxp load work || tmux"
alias brewck="brew update; brew outdated"
alias brewup="brew update && brew upgrade && brew cleanup && brew doctor"
alias eb="vim $HOME/.bashrc" # Edit Bash
alias ta='tmux attach-session'
alias tl='tmux list-session'

# Git aliases
alias g='git status'
alias ga='git add'
alias gc='git commit -v'
alias gd='git diff'
alias gu='git remote update'
alias gsi='git status --ignored'
alias gl='git log'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gca='git commit --amend'
alias gp='git push'

# schedule wake in +7 seconds from now
# sudo pmset schedule wake "$(date -j -v +7S "+%m/%d/%Y %H:%M:%S")"

# Todo.txt stuff
#alias t='todo.sh -d $HOME/.todo.cfg'
#complete -F _todo t
alias t='/usr/local/Cellar/todo-txt/2.10/bin/todo.sh -d $HOME/.todo.cfg'
source /usr/local/Cellar/todo-txt/2.10/etc/bash_completion.d/todo_completion complete -F _todo t
export TODOTXT_DEFAULT_ACTION=ls
# Turns auto archive off
export TODOTXT_AUTO_ARCHIVE=0

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

echo ""
echo -n "Welcome to bash on $OSTYPE, "; whoami
echo ""
echo -n "Today is "; date "+%m-%d-%Y %H:%M:%S"
echo ""
cal
echo -n "Uptime: "; uptime
echo ""

MYNAME='David Hatch'
export MYNAME

# or set it and export it in same line

export HISTSIZE=1000				    	# 500 is default
export HISTTIMEFORMAT='%b %d %T  '		    # using strftime
export HISTCONTROL=ignoreboth:erasedups		# ignoredups:ignorespace
export HISTIGNORE="t *:delHistory*:fg:history:history -d*:h:h -d*:pwd:exit:df:ll:ls:man *:"
# append to the history file, don't overwrite it
shopt -s histappend
shopt -s globstar # Turn on **
shopt -o -s notify
shopt -q -s cdspell

# Save and reload the history after each command finishes
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export EDITOR=vim
# mac default
#export PS1='\h:\W \u$ '    # OS X orig
RESET="\[$(tput sgr0)\]"
YELLOW="\[$(tput setaf 3; tput setab 0)\]"
BLUE="\[$(tput setaf 4)\]"
PURPLE="\[$(tput setaf 5)\]"
export PS1="$YELLOW\w$RESET\n$BLUE\u@\h$RESET $PURPLE\$$RESET "

# GREP_COLOR codes
# Attributes:   Text color:    Background:
#   0 reset all   30 black       40 black
#   1 bright      31 red         41 red
#   2 dim         32 green       42 green
#   4 underscore  33 yellow      43 yellow
#   5 blink       34 blue        44 blue
#   7 reverse     35 purple      45 purple
#   8 hidden      36 cyan        46 cyan
#                 37 white       47 white
# Separate with ";"
#
export GREP_COLOR="34;40"

# Specify options grep should use by default
export GREP_OPTIONS="--color=auto"

##############################
# Readline options
##############################
# Bash completion without strict case
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# Up/Down arrow for filtered history search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Meta+left/right arrow
bind '"\e[1;9D": backward-word'
bind '"\e[1;9C": forward-word'
# Same but in tmux
bind '"\e[1;3D": backward-word'
bind '"\e[1;3C": forward-word'
##############################

# For OS X only
function del() {
    for thisArg in "$@"; do
        mv -n "$thisArg" ~/.Trash
    done
}
export -f del

extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
#        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
#        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
export -f extract

delHistory () {
    start=$1
    end=${2:-$1}
    count=$(( end - start ))
    while [[ $count -ge 0 ]]; do
        history -d "$start" 
        ((count--))
    done
}
export -f delHistory

path () {
    tr : '\n' <<< $PATH
}
export -f path

# This is for your git auto completion
if [ -f ~/.git-completion.bash ]; then
	source ~/.git-completion.bash
fi

# Recursively remove files
#find . -name "Thumbs.db" -print0 | xargs -0 rm
# Explanation 
# find in current dir and below the name in quotes and print it ending with
# null... -0 tells xargs that args are null seperated and removes each file
# 
# Newer way
#find . -iname 'free*3*9*' -exec rm '{}' \;

#File Permissions: Octal Notation
#------------------------------------
#
#		user	group	other
#
#	r	4	4	4
#	w	2	2	0
#	x	1	0	0
#
#	total	7	6	4
#
#	rwxrw-r-- = 764
#
#	rwxr-xr-x = 755
#
#	rwx------ = 700
#
#	rwxr--r-- = 744
#
#	r-------- = 400  (root must change or execute)
