This vimrc includes my default settings and several vim plugins, some of
which are must-have and some of which seemed like a good idea at the
time.  This setup leans on the excellent
[vundle](https://github.com/gmarik/vundle.git) package manager, requires
an internet connection, and seeks to be fully automated ("clone 'n go").

To install this setup:

```
% git clone git@github.com:noah/dotvim.git ~/.vim
```

The first vim is run, vundle will be downloaded, as well as the list of
plugins defined in `vimrc`.

To update *all* vim plugins, periodically run:

```
% vim +InstallBundles!
```

This will launch an interactive installer; press 'l' while in
interactive mode to view the update log.

Viewing bundles

```
% vim +BundleList       " installed
% vim +Bundles          " available for installation
```

To install new bundles add them to the list in `vimrc`.
