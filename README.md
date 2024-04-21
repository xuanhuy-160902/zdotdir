# Zsh Configuration Repository

Welcome to my [Zsh][zsh] configuration repository! Here you'll find all the [dotfiles][dotfiles] and custom configurations necessary to manage my Zsh environment.

This setup aims to provide a streamlined and efficient shell experience, blending the power of Zsh with the intuitive features of [Fish][fish].

## Features

### Fish-Like Behavior

If you're familiar with Fish, you'll feel right at home with this Zsh configuration. It incorporates various features and behaviors inspired by Fish, making navigation and command execution more intuitive.

### Custom Functions

The [functions][zdotdir/tree/master/functions] directory houses all my custom functions, tailored to enhance productivity and streamline common tasks. Feel free to explore and modify them according to your preferences.

### Custom Completions

In the [completions][zdotdir/tree/master/completions] directory, you'll find custom completion scripts to enhance command line autocomplete functionality. These completions are designed to provide comprehensive suggestions for various commands and utilities.

### Conf.d Organization

To maintain a clean and organized [.zshrc][zdotdir/blob/master/.zshrc], configuration files are separated into the [conf.d][zdotdir/tree/master/conf.d] directory. This approach prevents clutter and allows for easier management of individual settings and configurations.

### Plugin Management

Similar to [Oh My Zsh][oh-my-zsh], the [plugins][zdotdir/tree/master/plugins] directory offers a convenient way to add or remove shell features. Whether you're looking to extend Zsh's capabilities or customize your shell environment, this directory provides flexibility and modularity.

## Installation

To set up this repository for your Zsh configuration, follow these steps:

### Backup Existing Files

Before proceeding with the installation, it's advisable to backup any existing Zsh configuration files to prevent accidental data loss. Run the following commands to back up your current configurations:

```zsh
setopt extended_glob
zfiles=(
  ${ZDOTDIR:-~}/.zsh*(.N)
  ${ZDOTDIR:-~}/.zlog*(.N)
  ${ZDOTDIR:-~}/.zprofile(.N)
)
mkdir -p ~/.bak
for zfile in $zfiles; do
  cp $zfile ~/.bak
done
unset zfile zfiles
```

### Installation Steps

Follow these steps to install this dotfiles repository to your $ZDOTDIR:

1. Set ZDOTDIR Variable:Set the ZDOTDIR variable to point to the location where you want to store your Zsh configuration files. For example, to use ~/.config/zsh as the ZDOTDIR:

```zsh
# Set the amazing ZDOTDIR variable
export ZDOTDIR=~/.config/zsh
```

2. Clone the Repository:Clone this repository (or your fork) recursively to include any submodules:

```zsh
git clone --recursive git@github.com:mattmc3/zdotdir.git $ZDOTDIR
```

3. Update .zshenv File:Update your root .zshenv file to reference the newly set ZDOTDIR:

```zsh
cat << 'EOF' >| ~/.zshenv
export ZDOTDIR=~/.config/zsh
[[ -f $ZDOTDIR/.zshenv ]] && . $ZDOTDIR/.zshenv
EOF
```

4. Load Zsh:Reload Zsh to apply the changes:

```zsh
zsh
```

### Note

Ensure that you have Git installed and configured on your system before proceeding with the installation.

Please remember to review and adjust the installation steps according to your specific environment and preferences.

## Acknowledgments

I would like to extend my special thanks to [mattmc3][mattmc3] for the invaluable reference to the [zdotdir repository][mattmc3/zdotdir]. His work has inspired and influenced the structure and organization of this repository, contributing significantly to its development.

## Contributions

Contributions, suggestions, and feedback are always welcome! If you have any improvements or enhancements to propose, feel free to open an issue or submit a pull request.

## License

This repository is licensed under the [MIT][MIT] License. Feel free to use, modify, and distribute the code as per the terms of the license.

## Resources

- [zsh][zsh]
- [fish][fish]
- [antidote][antidote]
- [zephyr][zephyr]
- [zshzoo][zshzoo]
- [zsh_unplugged][zsh_unplugged]
- [prezto][prezto]
- [oh-my-zsh][oh-my-zsh]
- [awesome zsh][awesome-zsh-plugins]

[//]: <Introduction's Links">
[Zsh]: https://www.zsh.org/
[Fish]: https://fishshell.com
[dotfiles]: https://dotfiles.github.io/
[//]: <Features' Links">
[zdotdir/tree/master/functions]: https://github.com/xuanhuy-160902/zdotdir/tree/master/functions
[zdotdir/tree/master/completions]: https://github.com/xuanhuy-160902/zdotdir/tree/master/completions
[zdotdir/blob/master/.zshrc]: https://github.com/xuanhuy-160902/zdotdir/blob/master/.zshrc
[zdotdir/tree/master/conf.d]: https://github.com/xuanhuy-160902/zdotdir/tree/master/conf.d
[zdotdir/tree/master/plugins]: https://github.com/xuanhuy-160902/zdotdir/tree/master/plugins
[//]: <Acknowledgments' Links">
[mattmc3]: https://github.com/mattmc3
[mattmc3/zdotdir]: https://github.com/mattmc3/zdotdir
[//]: <License's Links">
[MIT]: https://opensource.org/license/mit
[//]: <Resources' Links">
[antidote]: https://github.com/mattmc3/antidote
[zephyr]: https://github.com/zshzoo/zephyr
[zshzoo]: https://github.com/zshzoo/zshzoo
[zsh_unplugged]: https://github.com/mattmc3/zsh_unplugged
[prezto]: https://github.com/sorin-ionescu/prezto
[oh-my-zsh]: https://github.com/ohmyzsh/ohmyzsh
[awesome-zsh-plugins]: https://github.com/unixorn/awesome-zsh-plugins
