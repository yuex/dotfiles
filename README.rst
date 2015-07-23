###############
Yuex's Dotfiles
###############

* Contents:

  + 1 Introduction_
  + 2 Installation_

    + 2.1 Basics_
    + 2.2 Zshrc_
    + 2.3 Vimrc_

  + 3 `Backup and Restore`_

Introduction
============

A collection of my dotfiles, including:

* bashrc
* zshrc
* vimrc
* tmux.conf
* nethackrc


Installation
============

Basics
------

Trying out by creating a brand new accound is recommended::

    useradd -m dotfiles
    passwd dotfiles
    su -l dotfiles
    cd ~

In case bad things happen or you don't like it, just remove the account  ::
    
    userdel -r dotfiles

To download::

    git clone https://github.com/yuex/dotfiles.git
    cd dotfiles

If you are feeling lucky, you can just install and try out everything::

    make install

Or, install and try a specific dotfile, one at a time::
    
    make bashrc
    make zshrc
    make vimrc
    make tmux.conf
    make nethackrc


Zshrc
-----
    
``zhsrc`` depends on `oh-my-zsh`_ and `dircolors-solarized`_. ``make zshrc`` will do most work. But you need to change the default login shell manually::
    
    chsh -s /usr/bin/zsh


Vimrc
-----

``vimrc`` depends on `Vundle.vim`_ to manage vim plugins. ``make vimrc`` will install all plugins automatically. But the compilation of `YouCompleteMe`_ may needs some extra work because it provides a compiling choice and really takes time.  

In most cases, you can just::
    
    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh

But if you want semantic support for C-family languages, take time to::
    
    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer

If the YCM thing doesn't work, remember to check the newest docs at `YouCompleteMe`_.


Backup and Restore
==================

Remember to backup your own dotfiles before trying out others'. By default, ``make install`` or ``make`` will backup related dotfiles in ``./backup`` automatically. But you can do it manually by::
    
    make backup

To overwrite old backups, you have to remove ``./backup`` fold manually. For safety.
    
Allright, perhaps what looks good to me doesn't looks good to you. You can revert to your old dotfiles easily::
    
    make restore


.. _`oh-my-zsh`: https://github.com/robbyrussell/oh-my-zsh
.. _`dircolors-solarized`: https://github.com/seebi/dircolors-solarized
.. _`Vundle.vim`: https://github.com/VundleVim/Vundle.vim
.. _`YouCompleteMe`: https://github.com/Valloric/YouCompleteMe
