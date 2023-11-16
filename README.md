[![Gitter chat](https://badges.gitter.im/gitterHQ/gitter.png)](https://gitter.im/ada-lang/Lobby)
[![Build](https://github.com/mgrojo/open_url/actions/workflows/main.yml/badge.svg)](https://github.com/mgrojo/open_url/actions/workflows/main.yml)
[![Download][download-img]][download]


[![Gitter chat](https://badges.gitter.im/gitterHQ/gitter.png)](https://gitter.im/ada-lang/Lobby)

`open_url` is a small utility to open "*.url" files under GNU/Linux.

These files are Ini files used in Windows, which have this format:
```
[InternetShortcut]
URL=https://github.com/mgrojo/open_url
```

`open_url` uses `xdg-open` (from the `xdg-utils` package in Debian/Ubuntu) to actually open the
URL in your favorite browser.


# How to build

- Install [Alire](https://alire.ada.dev/)
- Build using `alr build`. All the dependencies are installed and managed by Alire.

# How to install

The tool can be installed using Alire 2.0 with this command:
```
alr install
```
Refer to Alire documentation on how to add the Alire default installation to the PATH variable
or how  to change the default installation prefix.

# Use a pre-built AppImage version

You can download a pre-build AppImage from the Releases section in GitHub. For using the file,
give it execution permissions and rename it to `open_url`.
```sh
mv Open_URL-x86_64.AppImage open_url
chmod +x open_url
```

# How to run
```
Usage: open_url <file.url>
```
