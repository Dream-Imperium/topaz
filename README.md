![topaz](icon/128x128.png "topaz")
<h1 align="center">topaz</h1>

**Simple Image Viewer for X**

topaz is a simple image viewer for X. It is free software so that you can use it and modify it for your needs. 

Please file a bug report if something does not work as documented or expected. 

Contributions are welcome but there is no guarantee that they will be incorporated.


Features
--------

* Basic image operations, e.g. zooming, panning, rotating
* Customizable key and mouse button mappings (in *config.h*)
* Thumbnail mode: grid of selectable previews of all images
* Ability to cache thumbnails for fast re-loading
* Basic support for multi-frame images
* Load all frames from GIF files and play GIF animations
* Display image information in status bar


Dependencies
------------

topaz requires the following software to be installed:

  * Imlib2
  * X11
  * Xft
  * freetype2
  * fontconfig
  * giflib (optional, disabled with `HAVE_GIFLIB=0`)
  * libexif (optional, disabled with `HAVE_LIBEXIF=0`)

Please make sure to install the corresponding development packages in case that
you want to build topaz on a distribution with separate runtime and development
packages (e.g. *-dev on Debian).


Building
--------

topaz is built using the commands:

    $ make
    $ sudo make install

Please note, that the latter one requires root privileges.
By default, topaz is installed using the prefix "/usr/local", so the full path
of the executable will be "/usr/local/bin/topaz".

You can install topaz into a directory of your choice by changing the second
command to:

    # make PREFIX="/your/dir" install

The build-time specific settings of topaz can be found in the file *config.h*.
Please check and change them, so that they fit your needs.
If the file *config.h* does not already exist, then you have to create it with
the following command:

    $ make config.h


Usage
-----

Please see the [man page.](topaz.1)


Download
--------

You can [browse](https://github.com/Dream-Imperium/topaz) the source code repository
on GitHub or get a copy using git with the following command:

    git clone https://github.com/Dream-Imperium/topaz

