__GIT_PROMPT_DIR=${__GIT_PROMPT_DIR:-"~/.bash"}
__GITPROMPT_STYLE_SHA1_HOSNTAME=${__GITPROMPT_STYLE_SHA1_HOSNTAME:-"0"}

# Colors
# Reset
ResetColor="\[\033[0m\]"       # Text Reset

# Regular Colors
Red="\[\033[0;31m\]"          # Red
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue

# Bold
BGreen="\[\033[1;32m\]"       # Green

# High Intensty
IBlack="\[\033[0;90m\]"       # Black

# Bold High Intensty
Magenta="\[\033[1;95m\]"     # Purple

              black='\['`tput sgr0; tput setaf 0`'\]'
                red='\['`tput sgr0; tput setaf 1`'\]'
              green='\['`tput sgr0; tput setaf 2`'\]'
             yellow='\['`tput sgr0; tput setaf 3`'\]'
               blue='\['`tput sgr0; tput setaf 4`'\]'
            magenta='\['`tput sgr0; tput setaf 5`'\]'
               cyan='\['`tput sgr0; tput setaf 6`'\]'
              white='\['`tput sgr0; tput setaf 7`'\]'

              BLACK='\['`tput setaf 0; tput bold`'\]'
                RED='\['`tput setaf 1; tput bold`'\]'
              GREEN='\['`tput setaf 2; tput bold`'\]'
             YELLOW='\['`tput setaf 3; tput bold`'\]'
               BLUE='\['`tput setaf 4; tput bold`'\]'
            MAGENTA='\['`tput setaf 5; tput bold`'\]'
               CYAN='\['`tput setaf 6; tput bold`'\]'
              WHITE='\['`tput setaf 7; tput bold`'\]'

                dim='\['`tput sgr0; tput setaf p1`'\]'  # half-bright

            bw_bold='\['`tput bold`'\]'


# Various variables you might want for your PS1 prompt instead
Time12a="\@"
PathShort="\w"

# Default values for the appearance of the prompt. Configure at will.
GIT_PROMPT_PREFIX="("
GIT_PROMPT_SUFFIX=")"
GIT_PROMPT_SEPARATOR="|"
GIT_PROMPT_BRANCH="${Magenta}"
GIT_PROMPT_STAGED="${Red}● "
GIT_PROMPT_CONFLICTS="${Red}✖ "
GIT_PROMPT_CHANGED="${Blue}✚ "
GIT_PROMPT_REMOTE=" "
GIT_PROMPT_UNTRACKED="…"
GIT_PROMPT_CLEAN="${BGreen}✔"

function update_current_git_vars() {
    unset __CURRENT_GIT_STATUS
    local gitstatus="$__GIT_PROMPT_DIR/gitstatus.py"
    
    _GIT_STATUS=$(python $gitstatus)
    __CURRENT_GIT_STATUS=($_GIT_STATUS)
	GIT_BRANCH=${__CURRENT_GIT_STATUS[0]}
	GIT_REMOTE=${__CURRENT_GIT_STATUS[1]}
    if [[ "." == "$GIT_REMOTE" ]]; then
		unset GIT_REMOTE
	fi
	GIT_STAGED=${__CURRENT_GIT_STATUS[2]}
	GIT_CONFLICTS=${__CURRENT_GIT_STATUS[3]}
	GIT_CHANGED=${__CURRENT_GIT_STATUS[4]}
	GIT_UNTRACKED=${__CURRENT_GIT_STATUS[5]}
	GIT_CLEAN=${__CURRENT_GIT_STATUS[6]}
	GIT_SHORTSHA1=${__CURRENT_GIT_STATUS[7]}
}

function setGitPrompt() {
	update_current_git_vars

	PROMPT_START="$IBlack$Time12a$ResetColor$Yellow$PathShort$ResetColor"
	PROMPT_END=" % "

	if [ -n "$__CURRENT_GIT_STATUS" ]; then
	  STATUS=" $GIT_PROMPT_PREFIX$GIT_PROMPT_BRANCH$GIT_BRANCH$ResetColor"

	  if [ -n "$GIT_REMOTE" ]; then
		  STATUS="$STATUS$GIT_PROMPT_REMOTE$GIT_REMOTE$ResetColor"
	  fi

	  STATUS="$STATUS$GIT_PROMPT_SEPARATOR"
	  if [ "$GIT_STAGED" -ne "0" ]; then
		  STATUS="$STATUS$GIT_PROMPT_STAGED$GIT_STAGED$ResetColor"
	  fi

	  if [ "$GIT_CONFLICTS" -ne "0" ]; then
		  STATUS="$STATUS$GIT_PROMPT_CONFLICTS$GIT_CONFLICTS$ResetColor"
	  fi
	  if [ "$GIT_CHANGED" -ne "0" ]; then
		  STATUS="$STATUS$GIT_PROMPT_CHANGED$GIT_CHANGED$ResetColor"
	  fi
	  if [ "$GIT_UNTRACKED" -ne "0" ]; then
		  STATUS="$STATUS$GIT_PROMPT_UNTRACKED$GIT_UNTRACKED$ResetColor"
	  fi
	  if [ "$GIT_CLEAN" -eq "1" ]; then
		  STATUS="$STATUS$GIT_PROMPT_CLEAN"
	  fi
	  STATUS="$STATUS$ResetColor$GIT_PROMPT_SUFFIX"

	  PS1="$PROMPT_START$STATUS$PROMPT_END"
	else
	  PS1="$PROMPT_START$PROMPT_END"
	fi
}

function setGitPromptSha1Hostname() {
	update_current_git_vars


	if [ -n "$__CURRENT_GIT_STATUS" ]; then
	  STATUS="$GIT_PROMPT_PREFIX$GIT_PROMPT_BRANCH$GIT_BRANCH$ResetColor=$green$GIT_SHORTSHA1$ResetColor"

	  if [ -n "$GIT_REMOTE" ]; then
		  STATUS="$STATUS$GIT_PROMPT_REMOTE$GIT_REMOTE$ResetColor"
	  fi

	  STATUS="$STATUS$GIT_PROMPT_SEPARATOR"
	  if [ "$GIT_STAGED" -ne "0" ]; then
		  STATUS="$STATUS$GIT_PROMPT_STAGED$GIT_STAGED$ResetColor"
	  fi

	  if [ "$GIT_CONFLICTS" -ne "0" ]; then
		  STATUS="$STATUS$GIT_PROMPT_CONFLICTS$GIT_CONFLICTS$ResetColor"
	  fi
	  if [ "$GIT_CHANGED" -ne "0" ]; then
		  STATUS="$STATUS$GIT_PROMPT_CHANGED$GIT_CHANGED$ResetColor"
	  fi
	  if [ "$GIT_UNTRACKED" -ne "0" ]; then
		  STATUS="$STATUS$GIT_PROMPT_UNTRACKED$GIT_UNTRACKED$ResetColor"
	  fi
	  if [ "$GIT_CLEAN" -eq "1" ]; then
		  STATUS="$STATUS$GIT_PROMPT_CLEAN"
	  fi
	  STATUS="$STATUS$ResetColor$GIT_PROMPT_SUFFIX "
	else
	  STATUS=""
	fi

	dir="\w"
	# cwd_truncate
	PROMPT_START="$STATUS"
	if [ "$UID" -eq "0" ]; then
	  PROMPT_MIDDLE="$red\u@\h$ResetColor$green$dir$ResetColor"
	  PROMPT_END="$red#$ResetColor "
	else
	  PROMPT_MIDDLE="$blue\u@\h$ResetColor $cyan$dir$ResetColor"
	  PROMPT_END="$cyan>$ResetColor "
    fi
	PS1="$PROMPT_START$PROMPT_MIDDLE$PROMPT_END"
}

function cwd_truncate {
    local pwd_length=42  # The maximum length we want (seems to fit nicely
                         # in a default length Terminal title bar).

    # Get the current working directory.  We'll format it in $dir.
    dir="$PWD"     

    # Substitute a leading path that's in $HOME for "~"
    if [[ "$HOME" == ${dir:0:${#HOME}} ]] ; then
        dir="~${dir:${#HOME}}"
    fi
    
    # Append a trailing slash if it's not there already.
    if [[ ${dir:${#dir}-1} != "/" ]] ; then 
        dir="$dir/"
    fi

    # Truncate if we're too long.
    # We preserve the leading '/' or '~/', and substitute
    # ellipses for some directories in the middle.
    if [[ "$dir" =~ (~){0,1}/.*(.{${pwd_length}}) ]] ; then  
        local tilde=${BASH_REMATCH[1]}
        local directory=${BASH_REMATCH[2]}
        
        # At this point, $directory is the truncated end-section of the 
        # path.  We will now make it only contain full directory names
        # (e.g. "ibrary/Mail" -> "/Mail").
        if [[ "$directory" =~ [^/]*(.*) ]] ; then
            directory=${BASH_REMATCH[1]} 
        fi
        
        # Can't work out if it's possible to use the Unicode ellipsis,
        # '…' (Unicode 2026).  Directly embedding it in the string does not
        # seem to work, and \u escape sequences ('\u2026') are not expanded.
        #printf -v dir "$tilde/\u2026$s", $directory"
        dir="$tilde/...$directory"
    fi
    # Don't embed $dir directly in printf's first argument, because it's 
    # possible it could contain printf escape sequences.
    #printf "\033]0;%s\007" "$dir"
}

if [ "$__GITPROMPT_STYLE_SHA1_HOSNTAME" -eq "1" ]; then
  PROMPT_COMMAND=setGitPromptSha1Hostname
else
  PROMPT_COMMAND=setGitPrompt
fi
