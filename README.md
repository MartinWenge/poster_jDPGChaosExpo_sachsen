# IPFbeamerposter

## Build

To generate the `pdf` I use [rake](http://rake.rubyforge.org/).

This means you need [ruby](https://www.ruby-lang.org/), Linux and MacOSX should
come with it, for Windows you can get an installer
[here](http://rubyinstaller.org/). (ruby as of version 1.9 comes with rake, so
you just need to get a "current" ruby [version 2.x will do fine])

To build simply call:
```
rake makepdf
```

this will generate the pdf.

To clean every generated file (this includes the pdf) use

```
rake clobber
```