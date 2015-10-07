class: center middle

# Intro

## Awesomeness begins

---

# Content

- Programming
- Programming languages
- Choosing a language
- Notable ladies in computing

---

class: middle center

# Programming

---

# What is programming?

> Programming is the act of giving a machine a set of instructions to enable it to perform a certain task.

The computer mindlessly does only and exactly what it's told, provided it's told in a language it understands.

---

# Why do we program?

Computers can do basic computations very fast (much faster than humans, billions per second). That's useful for:

- executing tedious tasks automatically ("booooring, let the machine do it")
	- counting words in a book
	- searching in databases
	- writing personalized email to a thousand people
	- solving sudoku
- solving problems that we know *how* to solve, but we never *actually* solved because it would take more than a lifetime
	- finding the quadrillionth decimal of π (spoiler: it's a 0)
	- enumerating mathematical objects (like [trees](http://noe.falzon.free.fr/trees/))
	- cracking cyphers

---

class: middle

![xkcd](https://imgs.xkcd.com/comics/automation.png)

---

# Human augmentation

Programmable computers are a tool, nothing more, nothing less.

Computers also have interesting input/output devices, which give them access to "non-human" powers, and by extension, gives humans non-human powers:

- video games
- computer generated imagery
- sound synthesis
- networking

Anything you can think of, you can program and *make it happen*. Through language you can make worlds appear and set them in motion.

---

class: middle

> I'm a god!!

---

# What can't we program?

Brains are:

- not very fast (a neuron can be activated ~200 times per second)
- very parallel (~100 billion neurons, each connected to ~7000 others)

Computers are:

- extremely fast (~100 billion instructions per second)
- extremely linear (one instruction at a time)

Computers are bad at what brains are good at:

- recognizing shapes in a picture
- understanding/translating natural languages
- doing anything "smart"

If you can break up a problem in simple sub-problems, odds are you can write a program to solve it. Otherwise, you'll probably have to cheat (eg. statistical methods).

---

class: middle center

# Programming languages

---

# Vocabulary

Programming is telling the computer what to do. To "tell" we need to write. To write we need a common language.

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

# Programming languages

Wikipedia has a [list](http://en.wikipedia.org/wiki/List_of_programming_languages) of:

> all notable programming languages in existence, both those in current use and historical ones, in alphabetical order, except for dialects of BASIC and esoteric programming languages.

It's 644 items long. There are many way to categorize and compare these languages. Wikipedia's [list of programming languages by category](http://en.wikipedia.org/wiki/List_of_programming_languages_by_category) has 42 categories.

You can also sort them by family, which influenced which, which merged to give birth to others, etc.

So, where do we start?

---

class: middle

[![Family tree](http://rigaux.org/language-study/diagram.png)](http://rigaux.org/language-study/diagram.png)

---

# General purpose languages

We want to make programs. Native desktop or mobile applications. For that we'll focus on general purpose languages. We can already remove:

- web oriented languages (JavaScript, PHP)
- scientific languages (MATLAB, R, Prolog)
- application specific (VBA)

There are many programming paradigms, or philosophies behind the design of languages. Imperative, functional, object-oriented, concurrent, logic, etc. Not mutually exclusive!

*Imperative*: statements that change a program state ("do this, do that, if this then do that, etc.")

---

# Low level

One of the many ways to measure and classify languages is "how close to the machine" they are.

At the lowest level:

- machine code (the *only* language a processor actually understands)
- assembly (machine code but in human readable form. Very difficult to write what you mean, very easy to make mistakes. Basically impossible to maintain.)

```asm
_main:                                  # @main
    pushl   %ebp
    movl    %esp, %ebp
    pushl   %edi
    pushl   %esi
    subl    $8, %esp
    calll   ___main
    movl    $0, (%esp)
    calll   _time
    movl    %eax, (%esp)
    calll   _srand
    movl    $1717986919, %edi       # imm = 0x66666667
```

---

```asm
LBB0_1:                                 # %while.body
    calll   _rand
    movl    %eax, %esi
    imull   %edi
    movl    %edx, %eax
    shrl    $31, %eax
    sarl    $3, %edx
    addl    %eax, %edx
    shll    $2, %edx
    leal    (%edx,%edx,4), %eax
    subl    %eax, %esi
    movl    %esi, 4(%esp)
    movl    $L_.str, (%esp)
    calll   _printf
    cmpl    $10, %esi
    jne LBB0_1
# BB#2:                                 # %while.end
    xorl    %eax, %eax
    addl    $8, %esp
    popl    %esi
    popl    %edi
    popl    %ebp
    retl
```

---

# High level

Higher (disguised assembly, plus bonuses to make life easier):

C, C++ (compiled languages, quite verbose, strict syntax, still very lax in terms of memory safety, error prone, but have many higher level constructs that makes coding more "logical" and closer to thought processes)

```c
int main()
{
    int a;
    srand(time(NULL));
    while (1) {
        a = rand() % 20;
        printf("%d\n", a);
        if (a == 10) break;
    }
    return 0;
}
```

---

# Highest level

At the highest level:

Python, Ruby, Lua (interpreted languages, concise syntaxes, very dynamic, they allow to do pretty much anything and it works, memory safe)

```lua
math.randomseed(os.time())
while true do
    k = math.random(19)
    print(k)
    if k == 10 then break end
end
```

- great, but slower than low level (10-100 times)
- still fast enough for many purposes

---

# Compromise

What's a good compromise?

- new modern languages try to combine efficiency of low-level languages with ease of use of higher level languages (D, Rust, Go). Still a work in progress.
- big projects combine and use different languages for different purposes. World of Warcraft is mainly in C++, with probably a bit of assembly for very speed critical code, and Lua for scripting and user interface.

Compare solutions for the N-queens problem on [Rosetta Code](http://rosettacode.org/wiki/N-queens_problem).

---

# Compiled language

Development:

- write source code
- give source code to compiler (a program on the developer's machine)
- compiler converts source to machine code, thus creating a program
- distribute program

Use:

- ask OS to run program
- machine code is loaded into memory, processor executes instructions directly

(C, C++, D, Rust, Go...)

---

# Interpreted language

("scripting" language)

Development:

- write source code
- distribute source code

Use:

- give source code to interpreter (a program on the user's machine)
- interpreter builds in memory a high-level representation of the source
- interpreter follows this representation and executes commands

Interpreter = simulation of computer (slow). Often embedded in another program (game, application). Fast enough for most purposes.

(Lua, Python, Ruby, JavaScript...)

---

# Bytecode

Development:

- write source code
- give source code to compiler
- compiler converts source to bytecode, creating a "program"
- distribute "program"

Use:

- give "program" to interpreter ("virtual machine", VM)
- interpreter executes bytecode instructions one by one

(Java, C#, ActionScript...)

---

# Bytecode

Advantage:

- separate compilation: can optimize
- portable "program"
- bytecode instructions "almost" machine code: still pretty fast

In practice, most interpreted languages also compile to bytecode, but there is no separate compilation step: program are distributed in source form (Lua, Python, Ruby...)

---

class: middle center

# Choosing a language

---

# The burden of choice

"I want to learn to program. What language should I learn?"

- impossible to answer
- each language adapted to a different purpose
- just learn many!
- easier to go from low-level to high-level (but also harder to start from low-level...)

---

# The serious approach

Learn the C language to:

- understand inner workings of a computer
- learn discipline in programming (because in C you can't do without)
- know what happens behind the scenes of higher level languages (and thus program better with them)
- realize that some seemingly trivial tasks are a pain in the butt

Learn an object-oriented derivative of C for any serious programming job:

- C++ is *the* most popular language to date
- Objective-C, Swift for anything Apple related
- C# for anything Microsoft related
- D is "C++ done right", but is not so popular yet

(when in doubt, all of the above...)

---

# The scripting approach

In parallel, or after, or instead, learn Lua/Ruby/Python:

- basics can be learned quite fast
- seemingly complex tasks can in fact be trivial!
- "real" programming languages
    - actually used in real life
    - available frameworks for desktop applications, video games, web servers...
- less suited for big projects, because they require self imposed discipline

---

# The rest

The *very* serious approach:

- assembly: doing the job of a compiler
- Lisp: old, still used, quite theoretical
- functional languages: another way to think, quite powerful if you can wrap your head around them
    - Haskell
    - Erlang

To get a job but hate yourself:

- Java

(No seriously, don't learn Java.)

---

# There's more!

For web development (ie. dynamic websites):

- frontend: JavaScript
- backend: PHP, Java, Python, Ruby, Erland, even C/C++
- content: HTML, CSS (not programming languages ☺)

The future:

- Rust
- Go
- D
- to be continued?

---

class: middle center

# Notable ladies in computing

---

# Ada Lovelace (1815-1852)

- 1842: wrote the first algorithm to be implemented on Charles Babbage's Analytical Engine (the first mechanical computer)
- the first computer programmer!
- fixed the first computer bug
- programming language Ada named after her

![Ada Lovelace](https://upload.wikimedia.org/wikipedia/commons/2/2e/Ada_Lovelace_1838.jpg)

---

# Hedy Lamarr (1913-2000)

- 1942: co-invented frequency-hopping spread spectrum technology to prevent radio jamming during World War 2
- still used for most modern radio technologies: WiFi, Bluetooth, mobile phones, etc.
- also, a famous actress...

![Hedy Lamarr](https://upload.wikimedia.org/wikipedia/commons/f/f0/Hedy_Lamarr_in_a_1940_MGM_publicity_still.jpg)

---

# ENIAC programmers (1946)

- Kay McNulty, Betty Jennings, Betty Snyder, Marlyn Wescoff, Fran Bilas, Ruth Lichterman
- ENIAC: the first general purpose electronic computer (US Army)

![ENIAC](https://upload.wikimedia.org/wikipedia/commons/3/3b/Two_women_operating_ENIAC.gif)

---

# Grace Hopper (1906–1992)

- 1949-1952: invented the first English-like programming languages and their compilers (FLOW-MATIC & MATH-MATIC, for the UNIVAC, the first commercial computer in the US)
- led to COBOL, a language still used today
- also, a rear-admiral in the US Navy...

![Grace Hopper](https://upload.wikimedia.org/wikipedia/commons/a/ad/Commodore_Grace_M._Hopper%2C_USN_%28covered%29.jpg)

---

# And many more...

See [Wikipedia][https://en.wikipedia.org/wiki/Women_in_computing#Worldwide_timeline]

---

# A few gentlemen too

- Alan Turing (1912-1954)
    - theoretical computer science
    - mathematical formalisation of computers and computability ("Turing machine")
    - philosophical implications of computing
    - artificial intelligence
    - also, pretty much won World War 2 by cracking Enigma...
- Dennis Richie (1941-2011), Ken Thompson (1943-): C, Unix
- Richard Stallman (1953-), Linus Torvalds (1969-): GNU & Linux, free software
- Bjarne Stroustrup (1050-): C++
- Donald Knuth (1938-), Edsger Dijkstra (1930-2002): algorithmics

---

> I believe that at the end of the century the use of words and general educated opinion will have altered so much that one will be able to speak of machines thinking without expecting to be contradicted. (Alan Turing)

![Alan Turing](https://kpfa.org/wp-content/uploads/2015/05/Dr-Alan-Turing-2956483.jpg)