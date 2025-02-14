# Kitty Drop-down Spoon

## Introduction

Following the release of [Ghostty](https://ghostty.org/), I grew fonder of the drop-down feature, which I was using massively when using [Yakuake](https://apps.kde.org/en-gb/yakuake/) / [Guake](https://guake.github.io/) on my Linux distro.

Now my work laptop is running macOS, and [Kitty](https://sw.kovidgoyal.net/kitty/) has been an absolute blast in terms of developer experience (DX). Despite the hype, my feelings are that Ghostty is lagging behind Kitty in many features. However, adding a drop-down feature is not one of Kovid's main priorities in Kitty's development.

So, I came across this [Gist](https://gist.github.com/ernestguillem/0f88b1feb590a8a467dd2b76b5bb4e38) by [Ernest Guillem](https://github.com/ernestguillem), which I decided to use as a base for this Spoon.

## Prerequisites

Ensure that you have [Kitty](https://sw.kovidgoyal.net/kitty/) and [Hammerspoon](https://www.hammerspoon.org/) installed on your macOS system:

```sh
brew install kitty
brew install hammerspoon
```

## Installation

To install this Spoon, clone the repository as a Git subrepo inside Hammerspoon's `Spoons` directory:

```sh
cd ~/.hammerspoon/Spoons # `cd ~/.config/hammerspoon/Spoons` if you are using XDG specs
git clone --recursive https://github.com/ninoCan/KittyDropDown.spoon.git
```

Alternatively, if you want to track updates as a subrepo inside your dotfiles or configuration repository, you can add it as a subrepo using:

```sh
cd ~/.hammerspoon/Spoons
git submodule add https://github.com/ninoCan/KittyDropDown.spoon.git KittyDropDown.spoon
```

Then, initialize and update the submodule:

```sh
git submodule update --init --recursive
```

## Configuration

To enable the Spoon, add the following lines to your `~/.hammerspoon/init.lua` file:

```lua
hs.loadSpoon("KittyDropDown")
spoon.KittyDropDown:start()
```

## Usage

Press `Ctrl + Space` (default hotkey) to toggle the Kitty terminal. You can change this hotkey by modifying `KittyDropDown.spoon/init.lua` before starting the Spoon.

## Uninstallation

To remove the Spoon, delete its directory:

```sh
rm -rf ~/.hammerspoon/Spoons/KittyDropDown.spoon
```

If you installed it as a Git submodule, remove the reference from `.gitmodules` and `.git/config` before deleting the directory:

```sh
git submodule deinit -f ~/.hammerspoon/Spoons/KittyDropDown.spoon
rm -rf ~/.git/modules/hammerspoon/Spoons/KittyDropDown.spoon
rm -rf ~/.hammerspoon/Spoons/KittyDropDown.spoon
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Credits

- Inspired by [Ernest Guillem's Gist](https://gist.github.com/ernestguillem/0f88b1feb590a8a467dd2b76b5bb4e38)
- Developed by [Nino](https://github.com/ninoCan)


