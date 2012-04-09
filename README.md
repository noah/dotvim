This is my personal collection of vim plugins, some of which are very
must-have and some of which seemed like a good idea at the time.  This
setup leans on the excellent
[vundle](https://github.com/gmarik/vundle.git) package manager.  

To install this setup:

```
% git clone git@github.com:noah/dotvim.git ~/.vim
```

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

