* Contents:

  + 1 Introduction_
  + 2 Installation_

    + 2.1 Requirements_
    + 2.2 `Common Stuff`_
    + 2.3 `Zsh Extras`_
    + 2.4 `Vim Extras`_

  + 3 `Backup and Restore`_
  + 4 Update_

Introduction
============

A collection of my dotfiles, including:

$(cat source/rc_module|sed 's/^/* /g')


Installation
============


Requirements
------------

In the ``Makefile``, the syntax ``.ONESHELL`` introduced in ``make 3.82`` is used.
Hence, before rocking you have to upgrade your ``make``.


Common Stuff
------------

Trying out by creating a new account is recommended::

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

Or, install a specific dotfile, one at a time::

$(cat source/rc_module|sed 's/^/\tmake /g')


Zsh Extras
----------

My ``zshrc`` depends on `oh-my-zsh`_ and `dircolors-solarized`_. ``make zsh`` will do most work. But you need to manually change the default login shell::

    chsh -s /usr/bin/zsh


Vim Extras
----------

``vim`` depends on `Vundle.vim`_ to manage vim plugins. ``make vim`` will install plugins automatically. But the compilation of `YouCompleteMe`_ needs some extra work because it provides a compiling choice and really takes time.

In most cases, you can just run::

    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh

But if you want semantic support for C-family languages, take time to::

    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer

If the YCM thing doesn't work, remember to check the newest docs at `YouCompleteMe`_.

My ``vimrc`` contains some self-customed key mappings and home-made scripts in ``.vimrc`` and a collection of selected plugins managed by `Vundle.vim`_. Here's a short list::

$(cat source/vim_plugin)

Backup and Restore
==================

Remember to backup your own dotfiles before trying out others'. By default, ``make install`` or ``make`` will backup related dotfiles in ``.backup`` automatically. But you can do it manually by::

    make backup

To overwrite old backups, you have to remove ``.backup`` fold manually. For safety.

Allright, perhaps what looks good to me doesn't looks good to you. But You can revert to your old dotfiles easily::

    make restore


Update
======

In case you like it, to update this dotfiles to the lastest, just::

    git pull

and then ``make`` what module you want to update.


.. _`oh-my-zsh`: https://github.com/robbyrussell/oh-my-zsh
.. _`dircolors-solarized`: https://github.com/seebi/dircolors-solarized
.. _`Vundle.vim`: https://github.com/VundleVim/Vundle.vim
.. _`YouCompleteMe`: https://github.com/Valloric/YouCompleteMe
