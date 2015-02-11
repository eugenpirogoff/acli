ACLI IS DEPRECATED
=====
Swift is getting more and more a mature language and so the tools that are used in the ecosystem finally have support of it, so please use them. The acli gem is also no longer available for installation from rubygems.  

[Carthage](https://github.com/Carthage/Carthage)

[Cocoapods](http://cocoapods.org)





acli
====

a(wesome swift)cli provides convenient download over the command line of swift libraries listed in [matteocrippa/awesome-swift](https://github.com/matteocrippa/awesome-swift) and [wolg/awesome-swift](https://github.com/Wolg/awesome-swift). to a folder on your machine. other 'readme.md' files can be added over .aclirc as 'repository'. the default folder is 'swift_lib' in the executed folder. this can be change in the .aclirc config file as well.

[![Gem Version](https://badge.fury.io/rb/acli.svg)](http://badge.fury.io/rb/acli)

installation
===
```sudo gem install acli```


usage
===

```acli help``` - lists all available commands

```acli list``` - lists all available libraries mentioned

```acli config``` - created .aclirc config file in current folder


attention
===
this is not a replacement for cocoapods or somehow suitable for a production enviroment.
