#!/bin/zsh
#
# .zprofile - Run on login Zsh session.
#

# Custom
export DOTFILES=$XDG_CONFIG_HOME/dotfiles
export REPO_HOME=$XDG_CACHE_HOME/repos
export ZIM_HOME=$REPO_HOME/zim
export VOLTA_HOME=$XDG_PROJECTS_DIR/volta
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-21.jdk/Contents/Home

# Ensure path arrays do not contain duplicates.
typeset -gU fpath path cdpath manpath mailpath

# Homebrew setup
typeset -aU _brewcmd=(
  $HOME/.homebrew/bin/brew(N)
  $HOME/.linuxbrew/bin/brew(N)
  /opt/homebrew/bin/brew(N)
  /usr/local/bin/brew(N)
  /home/linuxbrew/.linuxbrew/bin/brew(N)
)
if (( $#_brewcmd )); then
  source <($_brewcmd[1] shellenv | grep -v '\bPATH\b')
fi
unset _brewcmd

# Set the list of directories that cd searches.
cdpath=(
  $XDG_PROJECTS_DIR(N/)
  $XDG_PROJECTS_DIR/mattmc3(N/)
  $cdpath
)

# Set the list of directories that Zsh searches for programs.
path=(
  # core
  $HOME/{,s}bin(N)
  $VOLTA_HOME/bin(N)
  /usr/local/go/bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)

  # emacs
  $HOME/.emacs.d/bin(N)
  $XDG_CONFIG_HOME/emacs/bin(N)

  # apps
  /{usr/local,opt/homebrew}/opt/curl/bin(N)
  /{usr/local,opt/homebrew}/opt/ruby/bin(N)
  /{usr/local,opt/homebrew}/lib/ruby/gems/*/bin(N)
  $HOME/.gem/ruby/*/bin(N)
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"(N)

  # path
  $path
)

# Set common variables if they have not already been set.
export EDITOR=${EDITOR:-nvim}
export VISUAL=${VISUAL:-nvim}
export PAGER=${PAGER:-less}
export LANG=${LANG:-en_US.UTF-8}

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if [[ -z "$LESSOPEN" ]] && (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi
export LESS="${LESS:--g -i -M -R -S -w -z-4}"

# macOS
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER=${BROWSER:-open}
fi

# Set additional linker and preprocessor flags for Ruby
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

# Use `< file` to quickly view the contents of any file.
[[ -z "$READNULLCMD" ]] || READNULLCMD=$PAGER
