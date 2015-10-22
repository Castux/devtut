class: middle center

# Getting started

## Let's get this party sta-a-a-arted!

---

# Tools

To program, you will need:

- a computer
- a text editor (not a text *processor* like Word)
	- Notepad theoretically ok but...
	- Notepad++
	- Sublime Text
	- ...
- a compiler/interpreter for your language of choice
- (optional) some libraries written for your language of choice
- documentation for your tools and languages
	- lots of it on the web
	- books

---

# Lua 5.1

[http://www.lua.org](http://www.lua.org)

- interpreted (no separate compiling)
- dynamic (most checks happen at runtime)
- lightweight (few, sufficient features)
- simple syntax
- fast (for an interpreted language)
- very expressive/extensible
- widely used (Angry Birds, World of Warcraft UI, scripting of many very big games...)

![Lua logo](http://www.lua.org/images/lua.gif)

---

# ZeroBrane Studio

A Lua integrated development environment (IDE):

- Lua interpreter
- text editor with Lua syntax highlighting
- debugger
- some useful libraries
- free and open source
- written in Lua!

[ZeroBrane download](http://studio.zerobrane.com/download?not-this-time)

- Windows:
	- pick the zip archive, unzip it, copy the directory to eg. C:\Program Files
	- right click zbstudio.exe -> Pin to Start Menu
- Mac OS X:
	- pick the dmg archive, open it, copy ZeroBrane Studio to eg. Home -> Applications
	- drag ZeroBrane Studio to dock

---

# ZeroBrane "project"

- create directory LuaCourse (or something) in Documents (or where you want)
- menu Project -> Project Directory -> Choose, pick your directory
- save all your exercices there
- they show up in the "Project" pane on the left

---

# Checking the install

A good old "Hello World" program:

- open new file (ctrl-n)

```lua
print("Hello, world!")
```

- save it in a file `hello.lua` (ctrl-s)
- run it (F6)

Should output:

```
Hello, world!
```

---

# Syntax highlighting tweak

Menu Edit -> Preferences -> Settings: User

```
styles.indicator = {}
```

Save, restart ZeroBrane

---

# Lua ressources

- [Reference manual](http://www.lua.org/manual/5.1/): **all** there is to know. The entire definition of the language and its standard library.
- [Programming in Lua 1st ed.](http://www.lua.org/pil/contents.html): text book by the author of the language. Just as complete, but more accessible as learning material.
- [lua-users wiki](http://lua-users.org/wiki/): snippets, FAQ, libraries...
- [Google](http://www.google.com/) is your friend.