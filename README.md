# Poster jDPG ChaosExpo: Length of the border of Saxony

## Contribution

The poster is in German language. If you find spelling mistake or have better sketches your contribution os welcome.

## Setup 

This poster uses the style sheets of the [IPF-template](https://bitbucket.org/binaerzeicheneimer/ipfbeamerposter).
To get a fresh template version use
```
git pull TemplateIPF
```

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