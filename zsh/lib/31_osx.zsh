export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

if [[ "$OSTYPE" == darwin* ]]; then
  alias ls='gls -hF --color'   # add colors for filetype recognition
  alias sed='gsed'

  export HOMEBREW_GITHUB_API_TOKEN=f4f09dc15dce213977f8def81db6c03a1d6b5569

  antigen bundle brew
  antigen bundle brew-cask

  # new tab in terminal.app stays in same dir
  if [[ "$TERM_PROGRAM" == "Apple_Terminal" ]]; then
    update_terminal_cwd() {
      local URL_PATH=''
      {
        local i ch hexch LANG=C
        for ((i = 1; i <= ${#PWD}; ++i)); do
          ch="$PWD[i]"
          if [[ "$ch" =~ [/._~A-Za-z0-9-] ]]; then
            URL_PATH+="$ch"
          else
            hexch=$(printf "%02X" "'$ch")
            URL_PATH+="%$hexch"
          fi
        done
      }

      local PWD_URL="file://$HOST$URL_PATH"
      printf '\e]7;%s\a' "$PWD_URL"
    }

    autoload add-zsh-hook
    add-zsh-hook chpwd update_terminal_cwd

    update_terminal_cwd
  fi
fi

