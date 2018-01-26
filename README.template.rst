* Contents:

  + 1 Introduction_
  + 2 Installation_

    + 2.1 Requirements_
    + 2.2 `Common Stuff`_
    + 2.3 `Zsh Extras`_
    + 2.4 `Vim Extras`_

  + 3 `Backup and Restore`_
  + 4 Update_
  + 5 FAQ_

Introduction
============

A collection of my dotfiles, including:

$(cat source/rc_module|sed 's/^/* /g')

Installation
============


Requirements
------------

``make >= 3.82``.

The ``Makefile`` uses a lot of ``.ONESHELL`` which is introduced in 3.82. If
your global ``make`` is older than this required version, you can compile a
newer version and install it to you home directory locally::

    (download make, untar and cd to it)
    ./configure --prefix=/home/<your-username>
    make && make install


Common Stuff
------------

Try it out by creating a new account is always recommended. Though I have
implemented an automatic backup feature out of box, you shouldn't put your
trust completely in my programming ability and thinking sanity::

    useradd -m dotfiles
    passwd dotfiles
    su -l dotfiles
    cd ~

In case bad things happen or you don't like it, just remove the account::

    userdel -r dotfiles

To download::

    git clone https://github.com/yuex/dotfiles.git
    cd dotfiles

If you like it, you can install by running::

    make install

Or, you can install a particular module, one by one::

$(cat source/rc_module|sed 's/^/    make /g')

Note, the first time you install something, I will backup all your dotfiles
that I may touch in `.backup/`. If the original files or folders are hidden,
they will stay hidden in this backup directory.


Zsh Extras
----------

My ``zshrc`` depends on `oh-my-zsh`_ and `dircolors-solarized`_. ``make zsh``
will do most work. But you need to manually change the default login shell::

    chsh -s /usr/bin/zsh


Vim Extras
----------

``vim`` depends on `Vundle.vim`_ to manage vim plugins. ``make vim`` will
install plugins automatically. But the compilation of `YouCompleteMe`_ needs
some extra work because it provides a compiling choice and really takes time.

In most cases, you can just run::

    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh

But if you want semantic support for C-family languages, take time to::

    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer

If the YCM thing doesn't work, remember to check the newest docs at `YouCompleteMe`_.

My ``vimrc`` contains some self-customed key mappings and home-made scripts in
``.vimrc`` and a collection of selected plugins managed by `Vundle.vim`_.
Here's a short list::

$(cat source/vim_plugin)

Backup and Restore
==================

Remember to backup your own dotfiles before trying out others'. By default,
``make install`` or ``make`` will backup related dotfiles in ``.backup/``
automatically. But you can do it manually by::

    make backup

To overwrite old backups, you have to remove ``.backup`` fold manually.

What looks good to me may not look good to you. You can revert to your old
dotfiles easily::

    make restore

Privacy
=======

I keep private stuff in separated files such as ``.zshrc-private`` for zsh and
``custom.el`` and ``org.el`` for emacs. A trick I found easier to manage them is
put them all in dropbox or google drive and then create some symbolic links. In
this way, those private stuff could be synchronized automatically between your
personal laptops so that you don't need to copy them yourself unless you login
into some servers.


Update
======

In case you like it, to update this dotfiles to the lastest, just::

    git pull

and then ``make`` what module you want to update.

FAQ
===

Emacs' Color is Weired
----------------------

Older version emacs don't support 24bit full color. You have to patch it. But
hopefully, the patch will be integrated into emacs 26.

Inconsolata is not working
--------------------------

Try to compile and use newest tmux. Older version tmux such as 2.2 has many
issues. But most of them are fixed in newer versions such as 2.6.

.. _`oh-my-zsh`: https://github.com/robbyrussell/oh-my-zsh
.. _`dircolors-solarized`: https://github.com/seebi/dircolors-solarized
.. _`Vundle.vim`: https://github.com/VundleVim/Vundle.vim
.. _`YouCompleteMe`: https://github.com/Valloric/YouCompleteMe
