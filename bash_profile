# This only runs on user login

#echo ""
#echo -n "Welcome to Unix on Mac OS X, "; whoami
#echo ""
#echo -n "Today is "; date "+%m-%d-%Y %H:%M:%S"
#echo ""
#cal
#echo -n "Uptime: "; uptime
#echo ""


# This loads in the configuration in .bashrc
# Put all configuration there
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
PATHORIG="$PATH"
export PATH="$HOME/bin:/user/local/bin:/usr/local/sbin:/usr/local/opt/mysql55/bin:$(brew --prefix homebrew/php/php54)/bin:$PATHORIG"
