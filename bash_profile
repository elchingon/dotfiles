export PATH=$PATH:/usr/local/git/bin:/Users/alexiicarey/src/android-sdk-macosx/platform-tools::/Users/alexiicarey/src/android-sdk-macosx/android-ndk-r18b
export ANDROID_HOME=/Users/alexiicarey/Library/Android/sdk/
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

export JAVA_HOME=$(/usr/libexec/java_home)

MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
##
# Your previous /Users/alexiicarey/.bash_profile file was backed up as /Users/alexiicarey/.bash_profile.macports-saved_2013-02-25_at_15:56:31
##

# MacPorts Installer addition on 2013-02-25_at_15:56:31: adding an appriate PATH variable for use with MacPorts.
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
export PATH=/usr/local/bin:$PATH

# needed to run nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

source ~/.profile

##
# DELUXE-USR-LOCAL-BIN-INSERT
# (do not remove this comment)
##
echo $PATH | grep -q -s "/usr/local/bin"
if [ $? -eq 1 ] ; then
    PATH=$PATH:/usr/local/bin
    export PATH
fi
function tabname {
  # Will use current dir name if called without arg.
  printf "\e]1;${1-$(basename `pwd`)}\a"
}
function winname {
  # Will use current dir name if called without arg.
  printf "\e]2;${1-$(basename `pwd`)}\a"
}
function tab {
  # Will cd into current dir if called without arg.
  osascript -e 'tell application "Terminal"' \
            -e 'tell application "System Events" to keystroke "t" using {command down}' \
            -e "do script \"cd `pwd` && cd ${1-.} && tabname && clear\" in front window" \
            -e 'end tell' > /dev/null
}
# Function to shorten the directory path 
_PS1 ()
{
  local PRE= NAME="$1" LENGTH="$2";
  [[ "$NAME" != "${NAME#$HOME/}" || -z "${NAME#$HOME}" ]] &&
  PRE+='~' NAME="${NAME#$HOME}" LENGTH=$[LENGTH-1];
  ((${#NAME}>$LENGTH)) && NAME=".${NAME:$[${#NAME}-LENGTH+4]}";
  echo "$PRE$NAME"
}
PS1='\u@\h:$(_PS1 "$PWD" 16)\$ '

#export PATH=/Users/alexiicarey/.rvm/gems/ruby-2.4.1/bin:/Users/alexiicarey/.rvm/gems/ruby-2.4.1@global/bin:/Users/alexiicarey/.rvm/rubies/ruby-2.4.1/bin:/Users/alexiicarey/.rvm/bin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/Users/alexiicarey/src/android-sdk-macosx/platform-tools:/usr/local/mysql/bin
export PATH="/usr/local/sbin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
