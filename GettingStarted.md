class: middle center

# Getting started

## Let's get this party sta-a-a-arted!

---

# Semantic nitpicking

- language: syntactic and semantic rules that describe a set of valid textual inputs, and their meaning
- computer language: a language somehow understood by a computer
- programming language: a computer language that describes instructions to be executed by a computer
- (source) code: text written in a computer language
- algorithm: instructions to solve a specific problem (language agnostic)
- program: the implementation of algorithm(s) in a programming language, once compiled or interpreted. "A piece of software". Something that the computer can execute.

Not all computer languages are programming languages (eg. HTML describes data, not instructions).

- to code: to write text in a computer language
- to program: to write text in a *programming* language, ie. to write a program

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

But first, we need to pick a language.
 
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

# Lua for Windows

An "all included" package:

- Lua interpreter
- A text editor (SCiTE) with Lua syntax highlighting and execution
- Many useful libraries

[Lua for Windows](https://github.com/rjpcomputing/luaforwindows)

---

# Other OSes

On Debian based Linux distributions:

```
sudo apt-get install lua51
```

Mac OS X:

```
curl -O http://www.lua.org/ftp/lua-5.1.5.tar.gz
tar -xzvf lua-5.1.5.tar.gz
cd lua-5.1.5
make macosx
make test
sudo make install
```

---

Text editor
===========

I recommend [Sublime Text](http://www.sublimetext.com/)

- Windows, Linux, Mac OS X
- free for "evaluation purposes" (will nag you once in a while)
- veeeeeery good text editor

To be able to run Lua programs from the editor, select `Tools -> Build System -> New Build System...`, paste this in the file:

```
{
	"cmd": ["lua", "$file"],
	"file_regex": "^lua: (...*?):([0-9]*):?([0-9]*)",
	"selector": "source.lua"
}
```

Save file as `Lua.sublime-build` in the proposed directory. Run a file with `Ctrl-B`.

---

# Checking the install

A good old "Hello World" program:

```lua
print("Hello, world!")
```

- save it in a file `hello.lua`
- run it from command line `lua hello.lua`, or from the text editor (eg. `Ctrl-B` in Sublime)

Should output:

```
Hello, world!
```

---

# Lua ressources

- [Reference manual](http://www.lua.org/manual/5.1/): **all** there is to know. The entire definition of the language and its standard library.
- [Programming in Lua 1st ed.](http://www.lua.org/pil/contents.html): text book by the author of the language. Just as complete, but more accessible as learning material.
- [lua-users wiki](http://lua-users.org/wiki/): snippets, FAQ, libraries...
- [Google](http://www.google.com/) is your friend.

---

# Course content

A healthy mix of:

- general knowledge about:
	- computers
	- programming
	- programming languages
	- other computer languages
	- more computer stuff
- algorithmics (how to solve problems)
- Lua
	- syntax
	- semantics
	- standard library
- other libraries/frameworks
	- interactive applications (games, basically)
		- handling mouse/keyboard input
		- graphical output
	- introduction to network
	- more if interested!

---

# Suggested format

Teacher:

- these slides on a screen
- a Lua console for quick demos
- a text editor for longer examples

Student

- own computer with a text editor + interpreter handy
- Lua reference manual open in a browser tab

---

class: middle

> We must learn to walk before we can run.