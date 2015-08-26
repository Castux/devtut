class: middle center

# Lua 101

## Crash course in awesomeness!

---

# Contents

- basic types and literals
- expressions
- type coercion
- statements

---

# Running the interpreter

- Lua source usually in `source.lua` files
- From the command line: `lua source.lua`
- From a menu (or shortcut) in a Lua-friendly text editor
- one program = one Lua file (for now)
- interpreter reads the whole file and executes it (a "chunck")

---

# Before we really start

Comments: ignored by the interpreter

```lua
-- till the end of line
--[[till the closing brackets]]
--[==[till the closing matched brackets]==]
```

The `print` function: basic way to output (can take any type as argument)

```lua
print(5 + 6)            -- output: 11
print("This is great!") -- output: This is great!
print(1, nil, true)     -- output: 1    nil    true
```

Assignment to a variable (details to come)

```lua
a = 6
print(a)    -- output: 6
```

---

# Basic types and literals

type:

> (computing): a classification or category of various types of data, that states the possible values that can be taken, how they are stored, and what range of operations are allowed on them

literal:

> (programming): a value, as opposed to an identifier, written into the source code of a computer program

---

# Basic types and literals (2)

Number

```lua
4     0.4     4.57e-3     0.3e12     5e+20     0xabcd1234
```

Internally: double precision floating point numbers

- integers from 0 to 2^53
- real numbers from 4.9e-324 to 1.79e308, with 15~17 significant digits
- infinity
- NaN ("not a number")
- negative versions of all of these

---

# Basic types and literals (3)

String: a sequence of characters representing text

```lua
'blah blah'     -- single quoted
"blah blah"     -- double quoted
[[blah blah]]   -- long string

"This is a singly quoted word: 'horse'"
'Bob said: "Hi, I am Bob!"'
[[Bob said: "Hi, I'm Bob!"]]
```

Escapes: `\t` (tab), `\n` (new line), `\\`, `\'`, `\"`, `\[`,`\]`.

In a long string, every character represents itself (doesn't escape anything and allows newlines)

```lua
a = [[multiline
stuff with unescaped
things: \'\\\t']]
```

---

# Basic types and literals (4)

Boolean: represents a truth value, can take exactly two values (true and false).

Corresponding literals:

- `true`
- `false`

Used in logic and to make branching decisions (what part of the code to execute).

```lua
a = true
print(a)   -- true
a = false
print(a)   -- false
```

---

# Basic types and literals (5)

Nil: absence of value

Any unused variable "contains" `nil`. We can assign `nil` explicitely to "forget" data.

```lua
print(a)    -- nil
a = 5
print(a)    -- 5
a = nil
print(a)    --- nil
```

Functions that do not return anything "return `nil`":

```lua
a = print("whatever")   -- whatever
print(a)                -- nil
```

---

# Basic types and literals (6)

That was the four basic types: number, string, boolean, nil.

The `type` function returns the type of its argument as a string:

```lua
print(type(5))        -- number
print(type("foo"))    -- string
print(type(a))        -- nil
a = true
print(type(a))        -- boolean
```

A variable doesn't have a type. Only its current value has. Lua is a *dynamically typed* language.

---

# Expressions

An expression is anything that has a value, and therefore, a type. Basic expressions are:

- variables
- literals

Expressions are built by combining smaller expressions with *operators*:

- binary (connects two expressions): `expression operator expression`
- unary (transforms one expression into another): `operator expression`

Expressions can be grouped in parentheses when the meaning is ambiguous: `(expression)`

---

# Expressions (2)

Arithmetic operators operate on numbers:

```lua
a = 5 + 6       -- addition
b = 4 - a       -- substraction
c = b * b       -- multiplication
print(c / 2)    -- division
d = -c          -- (unary) negation
```

Other arithmetic operators:

```lua
print(2^10)     -- 1024 (exponentiation)
print(5 % 2)    -- 1 (remainder of division)
```

---

# Expressions (3)

We can nest expressions as much as wanted:

```lua
b = 1e3
a = 5 + 4 * 2 - ((7 + b) / 15)
print(a)    -- -54.133333333333
```

Operators `*` and `/` have *precedence* over `+` and `-` (like in math):

- `a * b + c` is `(a * b) + c`

Unary negation has precedence over all others:

- `- a * - b` is `(-a) * (-b)`.

When in doubt: parentheses!

---

# Expressions (4)

Relational operators *compare* things, and return booleans ("is this true or not?")

Order:

- `a < b`: is a strictly smaller than b?
- `a > b`: is a strictly greater than b?
- `a <= b`: is a smaller or equal to b?
- `a >= b`: is a greater or equal to b?

Works for numbers (natural order), and strings (lexicographic order).

```lua
print(5 < 10)                 -- true
print("rap" <= "rock'n'roll") -- true
print(5 >= "music")           -- error: attempt to
                              -- compare string with number
```

---

# Expressions (5)

Equality:

- `a == b`: is `a` equal to `b`?
- `a ~= b`: is `a` different than `b`?

Works for any types. Two values of different types will always be different, though.

```lua
print(5 == 2.5 * 2)            -- true
print(5 == "5")                -- false
print(type("meh") == "string") -- true
print((5 < 10) == true)        -- true
print(foo ~= nil)              -- false
```

Note: `==` is the comparison operator, `=` is for assignment.

---

# Expressions (6)

Logical operators: operate on booleans.

- `a and b` is true if both `a` and `b` are true
- `a or b` is true if either `a` or `b` is true, or both
- `not a` is true if `a` is false, and vice versa

```lua
x = 5
print(x >= 0 and x <= 10)   -- is x between 0 and 10 included?
print(x % 2 == 0 or x < 0)  -- is x either negative or even?
```

Note that, among other things:

```lua
a ~= b == not(a == b)
a <= b == (a < b or a == b)
a <= b == not(a > b)
not(not a) == a
```

---

# Expressions (7)

String operators:

- `a .. b`: concatenation (`a` followed by `b`)
- `#a`: length (number of characters in `a`)

```lua
foo = "This is" .. " great!"
foo = foo .. " Isn't it?"
print(foo)                  -- This is great! Isn't it?
print(#foo)                 -- 24
print(#"")                  -- 0
print(foo .. "" == foo)     -- true
```

---

# Expressions (8)

Precedence table for all operators (from low precedence to high precedence):

```lua
or
and
<     >     <=    >=    ~=    ==
..
+     -
/     *     %
not   #     - (unary)
^
```

```lua
print("lol " .. a + 4 * b < "foo" and true or not false)

-- is really:
print(((("lol " .. (a + (4 * b))) < "foo") and true)
    or (not false))
```

---

# Expressions (9)

All binary operators left-associative: `a ? b ? c ? d == (((a ? b) ? c) ? d`, except `..` and `^` which are right associative:

```lua
print(5 < 6 == true)    -- true
print(true == 5 < 6)    -- error, attempt to compare boolean with number
print(2^3^2)            -- 512
print((2^3)^2)          -- 64
```

When in doubt: parentheses!

---

# Type coercion

Number to string:

```lua
print("Twas the summer of " .. 70 - 1)    -- 69
print(10 .. 11)     -- 1011
```

String to number:

```lua
print(100 + "5")    -- 105
print("0xf1" + 2)   -- 243
print("5" + "2e3")  -- 2005
print("lol" + 4)    -- error: attempt to perform
                    -- arithmetic on a string value
```

When in doubt, use `tostring()` and `tonumber()`.

```lua
print(tonumber("1e4"))      -- 10000
print(tonumber("haha"))     -- nil
```

---

# Type coercion (2)

Anything to boolean:

> `nil` and `false` are false, anything else is true

```lua
print("yay" and 4 == 2 * 2) -- true
print("false" and true)     -- true
print(nil or true)          -- true
```

Real meanings of `and` and `or`:

- `a and b`: if `a` is true, return `b`, else, return `a`
- `a or b`: if `a` is true, return `a`, else, return `b`

```lua
print(true and 5)           -- 5
print(nil and true)         -- nil
print(false or "awesome")   -- "awesome"
print(200 or whatever)      -- 200
```

---

# Type coercion (3)

"Lazy evaluation": the unnecessary expressions are not even evaluated:

```lua
a = 50 or print("nope")     -- a = 50, nothing is printed
b = false and error()       -- b = false, no error
```

(Note: a function returns a value, so a function call is an expression)

Useful idiom: `condition and value or alternative`. If `condition` is true, `value` will be returned. Else, `alternative` is.

```lua
print(true and 5 or 10)     -- 5
print(false and 5 or 10)    -- 10

numCats = 10
str = "I have " .. numCats .. " cat"
str = str .. (numCats > 1 and "s" or "")
print(str)
```

---

# Statements

- a program (in imperative programming) is a sequence of *statements*
- statement: an instruction for the computer to execute, that changes the program's *state*
- state of program: the content of memory or peripherals, and the current location in the code

Kinds of statements in Lua:

- function call: executing other pieces of code
- assignment: storing values in variables
- flow control: choosing what code to execute depending on some conditions

---

# Statements (2)

We've seen a few standard functions of Lua:

- `print`, which outputs its argument(s) to the console
- `type`, which returns the type of its argument as a string
- `tonumber` and `tostring`, which convert their arguments to number and string
- many more
- our own functions! (later)

A function call, by itself, is a statement:

```lua
-- a valid program
print("foo")
doSomethingElse()
```

---

# Statements (2b)

Note that:

- a function call alone is a statement
- a function call as part in an expression is an expression
- when called alone, a function's return values are discarded, so function calls as statements are only useful if they have *side effects*

```lua
tostring(6)     -- valid but quite useless
```

---

# Statements (3)

Assignment

- syntax: `identifier = expression`
- meaning: "evaluate `expression`, and store result in variable `identifier`"

A variable is a space in memory which has a name, and contains a value. When we use the variable name later in an expression, the value is retrieved from memory, and used to evaluate the expression:

```lua
a = 5           -- store the number 5 in a variable called a
print(a + 4)    -- retrieve the value stored in a,
                -- add 4 to it, and pass the result to function
                -- print
```

Note: an identifier (variable's name) can contain letters, numbers, and `_`, but cannot start with a number: `_fooBar`, `l33tH4xorz`, `camelCase`, `classic_case`, `Weird_Mix2`...

---

# Statements (3)

Multiple assignment:

- `comma separated variables = comma separated expressions`
- all expressions (right hand side) evaluated first
- all values assigned then

```lua
x, y = 1, 2
x, y = y, x
print(x, y)     -- 2    1
```

Some functions return multiple values, caught using multiple assignment:

```lua
integral, fractional = math.modf(2.5)
print(integral, fractional)   -- 2   0.5
```

---

# Statements (4)

Conditional statements: `if then else`. Lets you choose whether a *block* of code will be executed, according to a condition.

```lua
if condition then
    -- statements
end

if condition then
    -- statements
else
    -- statements
end

if condition then
    -- statements
elseif condition2 then
    -- statements
end
```

- `elseif` blocks: any number
- `else` block: maximum one, always last

---

# Statements (5)

```lua
if x > 10 then
    print("x > 10")
else
    print("x <= 10")
end
```

Remember boolean evaluation ("false and nil are false, everything else is true"):

```lua
if foo then
    print("foo is not empty")
elseif foo == false then
    print("foo is false")
else
    print("foo is nil")
end
```

---

# Statements (6)

A block can be any number of statements...

```lua
if x == 10 then
    doThis()
    doThat()
    if danceFloor then
        danceALitteJig()
    end
end
```

... including none:

```lua
if foo then
    -- well, that is useful...
end
```

---

# Statements (7)

You can nest as deep as you want...

```lua
if a then
    if b then
        if c then
            if d then
                print("lol")
            end
        end
    end
end
```

... but it's not always necessary:

```lua
if a and b and c and d then
    print("lol")
end
```

---

# Statements (8)

The `while` loop: repeat a block of code as long as a condition is true

```lua
while condition do
    -- statements
end
```

Example: print numbers from 1 to 10:

```lua
i = 1
while i <= 10 do
    print(i)
    i = i + 1
end
```

---

# Statements (9)

Beware the infinite loop:

```lua
while true do
    print("OMG It's a trap!")
end
```

Loops is what gives a language its computational power to solve *any* problem in existence! They also let you write programs that never terminate.

- `if` statements: skip code, ie. jump forward
- loop statements: repeat code, ie. jump backwards

They control the *flow* of the program.

> You are now a programmer!

Technically, this is enough. Practically, we'll enjoy some shortcuts.

---

# Bonus statements

The `repeat until` loop: sometimes practical to avoid writing statements twice, or if it is easier to formulate an end condition than a while condition:

```lua
repeat
    -- statements
until endCondition
```

Equivalent to:

```lua
-- statements
while not endCondition
    -- statements
end
```

Note: the statements are always executed at least once.

---

# Bonus statements (2)

For instance, same problem as before:

```lua
i = 1
repeat
    print(i)
    i = i + 1
until i > 10
```

---

# Bonus statements (3)

Numeric `for` loop: many loops will increment a number and exit when reaching a value.

```lua
for variable = startValue, endValue do
    -- statements
end
```

Is (almost) equivalent to:

```lua
variable = startValue
while variable <= endValue do
    -- statements
    variable = variable + 1
end
```

---

# Bonus statements (4)

Still the same example:

```lua
for i = 1,10 do
    print(i)
end
```

Can also specify a step, and go backwards:

```lua
-- even numbers
for i = 0,10,2 do
    print(i)
end

-- odd numbers downwards
for i = 9,1,-2 do
    print(i)
end
```

---

# Bonus statements (5)

> Abort, abort!!

The `break` statement: exits a loop (`while`, `repeat` or `for`) early:

```lua
for i = 1,10000 do
    -- some computation
    if foundSolution then
        break   -- this will bring us...
    end
end
-- ... here!
```

---

# Bonus statements (6)

Note: `break` always breaks the innermost loop:

```lua
while something do
    while otherThing do
        if someReason do
            break   -- this will bring us...
        end
    end
    -- ... here!
end
```

---

class: middle center

# Exercices

---

# Roadtrip song

    99 bottles of beer on the wall, 99 bottles of beer,
    Take one down and pass it around, 98 bottles of beer on the wall.
    98 bottles of beer on the wall, 98 bottles of beer,
    Take one down and pass it around, 97 bottles of beer on the wall.
    ...
    1 bottle of beer on the wall, 1 bottle of beer.
    Take one down and pass it around, no more bottles of beer on the wall.
    No more bottles of beer on the wall, no more bottles of beer. 
    Go to the store and buy some more, 99 bottles of beer on the wall.

Write a program that prints the lyrics to the song "99 bottles of beer".

---

# Drinking song

> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz,
> 13, 14, Fizz Buzz, 16, 17, Fizz, 19, Buzz, Fizz, 22, 23, ...

Write a program that ouputs the numbers from 1 to 100, replacing numbers divisible by 3 with "Fizz", numbers divisible by 5 with "Buzz", and numbers divisible by both with "Fizz Buzz".

---

# Fibonacci sequence

> 1, 1, 2, 3, 5, 8, 13, ...

A sequence of integers starting with two ones, and where each number thereafter is the sum of the two previous ones.

Write a program that computes the first 100 terms of the Fibonacci sequence.

---

# Factorial

The factorial of an integer N, denoted N!, is the product of all consecutive integers from 1 to N:

```
5! = 1 * 2 * 3 * 4 * 5 = 120
16! = 20922789888000
```

Write a program that computes the factorial of whatever number is in the variable `N`, so that for instance:

```lua
N = 16
-- your program
```

would compute 16!

---

# Palindromes

A palindrome is a phrase that can be read in both directions, like:

> A man, a plan, a canal, Panama!

In Lua, the function `string.sub` lets you extract substrings. Without going into the details, assume that `string.sub(s, i, i)` will return the `i`-th letter of string `s`:

```lua
print(string.sub("Great!", 3, 3))   -- outputs: e
```

Write a program that recognizes if a string is a palindrome. To simplify, assume there is no punctuation, capitals or spaces, so that the program would only need recognize `"amanaplanacanalpanama"` as a palindrome.

Bonus question: modify your program so that it ignores spaces, and recognizes `"a man a plan a canal panama"` as a palindrome.

---

# Prime numbers

A prime number is an integer that can only be divided by 1 and itself. The first few prime numbers are:

> 2, 3, 5, 7, 11, 13, 17, 19, 23...

Write a program that outputs all the prime numbers smaller than 1000.

Bonus question: modify your program to print the first prime number greater than one million.

Bonus question 2: modify your program to print the 2000th prime number

---

# Prime decomposition

The fundamental theorem of arithmetic states that:

> every integer either is prime itself or is the product of prime numbers, and that this product is unique

For instance:

```
113 == 113
117 == 3 * 3 * 13
120 == 2 * 2 * 2 * 3 * 5
```

Write a program that outputs the prime decompositions of all integers up to 1000.

---

# Compound interests

To pay for your retirement, you put 500 euros per month in a saving account that grows by 8% per year, compounded every month. Write a program that simulates the content of your savings account during the next 50 years.

> ♫ I don't care too... much for money, for money can't buy me love! ♫

Hint: if the annual growth rate is `rate_y`, the monthly growth rate is `rate_m = (1 + rate_y)^(1/12) - 1`