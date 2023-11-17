[![Gitter chat](https://badges.gitter.im/gitterHQ/gitter.png)](https://gitter.im/ada-lang/Lobby)
[![Build](https://github.com/mgrojo/open_url/actions/workflows/main.yml/badge.svg)](https://github.com/mgrojo/open_url/actions/workflows/main.yml)
[![Download][download-img]][download]


`open_url` is a small utility to open [`*.url`](https://www.cyanwerks.com/formats/file-format-url.html) files under GNU/Linux.

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

You can download a pre-built AppImage from the Releases section in GitHub. For using the file,
give it execution permissions and rename it to `open_url`.
```sh
mv Open_URL-x86_64.AppImage ~/.local/bin/open_url
chmod +x open_url
```

# How to run
From the command line:
```
Usage: open_url <file.url>
```

If you want to open the URL files from the graphical file manager, put
`open_url` in the `PATH` for programs and the `open_url.desktop` file
in one of the standard location for desktop files. For example:

```sh
mv open_url ~/.local/bin/
cp open_url.desktop ~/.local/share/applications/
update-desktop-database
```

Then, from the file manager, you should be able to select _Open URL_ as
application to open `*.url` files.

  [download-img]: https://img.shields.io/github/downloads/mgrojo/open_url/total.svg
  [download]: https://github.com/mgrojo/open_url/releases
