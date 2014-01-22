
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
_PS1 ()
{
  local PRE= NAME="$1" LENGTH="$2";
  [[ "$NAME" != "${NAME#$HOME/}" || -z "${NAME#$HOME}" ]] &&
  PRE+='~' NAME="${NAME#$HOME}" LENGTH=$[LENGTH-1];
  ((${#NAME}>$LENGTH)) && NAME=".${NAME:$[${#NAME}-LENGTH+4]}";
  echo "$PRE$NAME"
}
PS1='\u@\h:$(_PS1 "$PWD" 16)\$ '
# If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux
