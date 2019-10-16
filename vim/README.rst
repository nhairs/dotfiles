Vim configuration files
=======================

All of my vim configuration files are split out into different files, by
functionality (i.e display, input shortcuts etc), by plugins and by filetypes.

This has a few advantages, including the ability to create a 'minimal vimrc'
file, from my main vimrc files. You can see this in action with the
`create_minimal.sh` shell script.

Vim plugins are managed with the NeoBundle plugin, written by the mighty
Shougo. All bundles are listed in `01-bundles.vim`. On first startup, it will
clone the NeoBundle plugin into the bundles directory. From there, it will load
the plugin manually then proceeding to install all configured plugins. This
setup means that there are no submodules in git that need to be maintained, and
everything is kept up to date.

Shortcuts
=========

Most of the commands here are only mapped to normal mode, unless stated
otherwise.

Window / Tab shortcuts
----------------------

======================= =========================
Keyboard combination    Shortcut description
======================= =========================
<Leader>h               :tabprev
<Leader>l               :tabnext
<Leader>n               :tabnew
<Leader>q               :q
<Leader>Q               :wq
tn                      :split
tv                      :vsplit
tr                      :tabnew
th                      :wincmd h
tj                      :wincmd j
tk                      :wincmd k
tl                      :wincmd l
======================= =========================

Unite shortcuts
---------------

======================= =========================
Keyboard combination    Shortcut description
======================= =========================
<Leader>a               Unite outline
<Leader>b               Unite buffer
<Leader>f               Unite bookmark
<Leader>t               Unite file (if no ruby)
<Leader>y               Unite history/yank
======================= =========================

Other plugins
-------------

======================= ==========================
Keyboard combination    Shortcut description
======================= ==========================
<Leader>t               CommandT (if vim has ruby)
<Leader>g               Goyo
======================= ==========================

Installation
============
You may need to perform additional steps when installing:
```lang=bash
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install neovim  # sudo apt upgrade neovim
```

You may need to create virtual envs
```lang=bash
PROJECT_NAME=neovim2 venv 2
pip install pynvim
deactivate

PROJECT_NAME=neovim3 venv 3
pip install pynvim
deactivate
```
