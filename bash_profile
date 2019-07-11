export ANDROID_HOME=/Users/alexiicarey/Library/Android/sdk/
export PATH=${PATH}:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

export JAVA_HOME=$(/usr/libexec/java_home)

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

MYSQL=/usr/local/mysql-5.7.24-macos10.14-x86_64/bin
export PATH=$PATH:$MYSQL
export DYLD_LIBRARY_PATH=/usr/local/mysql-5.7.24-macos10.14-x86_64/lib:$DYLD_LIBRARY_PATH

# Maximum number of history lines in memory
export HISTSIZE=50000
# Maximum number of history lines on disk
export HISTFILESIZE=50000
# Ignore duplicate lines
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file 
#  instead of overwriting it
shopt -s histappend

# After each command, append to the history file 
#  and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

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
function cdp {
  cd `pwd`
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

export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
