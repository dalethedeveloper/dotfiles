# fun customizations - and path updates in my own script

# hope you have this in .bashrc
#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# ln -s /home/d57/Dropbox/Stuff/scripts/.bash_aliases ~/.bash_aliases

#if [ -x /usr/bin/dircolors ]; then
#    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#    alias ls='ls --color=auto'
#    #alias dir='dir --color=auto'
#    #alias vdir='vdir --color=auto'
#
#    alias grep='grep --color=auto'
#    alias fgrep='fgrep --color=auto'
#    alias egrep='egrep --color=auto'
#fi

# Fancy Terminal
# if test "$TERM" = "xterm" -o \
#         "$TERM" = "xterm-color" -o \
#         "$TERM" = "xterm-256color" -o \
#         "$TERM" = "rxvt" -o \
#         "$TERM" = "rxvt-unicode" -o \
#         "$TERM" = "xterm-xfree86"; then
#     PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
#     export PROMPT_COMMAND
# fi

# recursive group permission fixes (for when usera in in http and needs 775/664 on http files)
alias tperm="find . -type d -not -perm 775 -not -path './.git*'; find . -type f -not -perm 664 -not -path './.git*'; find . '(' -not -group http -o -not -user http ')' -not -path './.git*'"
alias fperm="echo 'Fixing http file perms (NOT A DRY RUN)'; sudo find . -type d -not -perm 775 -not -path './.git*' -exec chmod 775 {} \; ; sudo find . -type f -not -perm 664 -not -path './.git*' -exec chmod 664 {} \; ; sudo find . '(' -not -group http -o -not -user http ')' -not -path './.git*'  -exec chown http:http {} \; ;"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias tsend='rsync -cvzhOrn'
alias rsend='rsync -cvzhOr'
#alias syn='lsyncd --delay 1 --no-daemon --conf /etc/lsyncd.conf.xml'
alias syn='watch -n 0 rsync -cvzhOrn --exclude=.git --exclude=.svn --exclude=CVS --exclude=.goutputstream* --exclude=.DS_Store '
# WIP
#alias tagup='ctags -R --PHP-kinds=+cf --fields=+iaS --extra=+q -h \'.php\' -R --exclude=\'\.svn\' --exclude=\'\.git\' --exclude=\'*\.js\' --regex-PHP=\'/abstract class ([^ ]*)/\1/c/\' --regex-PHP=\'/interface ([^ ]*)/\1/c/\' --regex-PHP=\'/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/\' /srv/http/wordpress/'

