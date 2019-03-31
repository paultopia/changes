# Changes

Small CLI to produce a list of files that were added or changed since last run in directory, by extension.  In Swift, so probably only works on Mac (might work on Linux?  Maybe?  Dunno.).  Intended for use with a static site generator or the like to stop wasting time on redundant builds.

currently works in debug builds, but build fails when trying to create a binary with everything statically linked in, as described in [this issue](https://github.com/stephencelis/SQLite.swift/issues/896) I'm pretty sure it's SQLite.

The last couple commits are kind of random efforts to fix this by downgrading swift versions, creating an xcode project and trying to figure out how to build in xcode (how on earth DO you build a binary with everything statically linked in, in xcode?!), etc.

n.b. building does appear to work with xcode, by doing swift package generate-xcodeproj, then opening up the xcode project, and making changes to the build settings in xcode to compile c modules as described [in this issue](https://github.com/stephencelis/SQLite.swift/issues/828), then selecting product -> build for -> running from the xcode menu.  This generates a binary that I'm putting in releases... but I can't promise that the binary will be executable on your machine.  It might not have the libraries linked in in the right way; I have no idea what xcode's build commands do.  Maybe it'll work.  Maybe it won't. Works on my machine. 

## Usage

```
changes [EXTENSION]
```

where extension is, e.g., `txt`.  Prints a list to stdout (one file per line) of each file that has been changed.

creates a hidden sqlite database file `.changes.sqlite3` to hold file hashes and lengths.

## Other

All code released under the WTFPL, included below:

<hr>

[DO WHAT(ever) THE FUCK YOU WANT TO PUBLIC LICENSE](http://www.wtfpl.net/) 

Version 2, December 2004 

Code (C) 2019 Paul Gowder <paul.gowder@gmail.com>

License text copyright (C) 2004 Sam Hocevar <sam@hocevar.net> 

Everyone is permitted to copy and distribute verbatim or modified 
copies of this license document [and code], and changing it is allowed as long 
as the name is changed. 

DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 

TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION 

0. You just DO WHAT THE FUCK YOU WANT TO.
