# Add completions for keg-only brews when available.
if (( $+commands[brew] )); then
  brew_prefix=${HOMEBREW_PREFIX:-${HOMEBREW_REPOSITORY:-$commands[brew]:A:h:h}}
  # $HOMEBREW_PREFIX defaults to $HOMEBREW_REPOSITORY but is explicitly set to
  # /usr/local when $HOMEBREW_REPOSITORY is /usr/local/Homebrew.
  # https://github.com/Homebrew/brew/blob/2a850e02d8f2dedcad7164c2f4b95d340a7200bb/bin/brew#L66-L69
  [[ $brew_prefix == '/usr/local/Homebrew' ]] && brew_prefix=$brew_prefix:h

  # Add brew locations to fpath
  fpath=(
    # Add curl completions from homebrew.
    $brew_prefix/opt/curl/share/zsh/site-functions(/N)

    # Add zsh completions.
    $brew_prefix/share/zsh/site-functions(-/FN)

    $fpath
  )
  unset brew_prefix
fi

# Add custom completions.
fpath=(${ZDOTDIR:-${XDG_CONFIG_HOME:-$HOME/.config}/zsh}/completions(-/FN) $fpath)
