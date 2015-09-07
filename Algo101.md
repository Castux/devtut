class: middle center

# Algorithmics 101

## Or the art of solving problems

---

# Contents

- recursivity
- logic operators

---

class: middle

# Recursivity

---

# Recursive functions

- A function can call itself.
- Lua (and most languages) is *reentrant*: each invocation of a function creates a new copy of its local variables

**Note:** a function that uses global variables is not reentrant

Recursion is useful when solving a problem consists in:

- solving the same problem for smaller data set(s)
- use/combine the sub-result(s) for the bigger problem

---

# A trivial example

For instance: counting down from `n` is saying `"n"` and counting down from `n-1`.

```lua
function countdown(n)
    print(n)
    countdown(n-1)
end

countdown(10)   -- 10, 9, 8, ..., 2, 1, 0, -1, -2, -3...
```

Then:

`error: stack overflow`

There is a limit to how many recursive calls you can make (~16000+)

---

# Recursion base

Don't forget the recursion *base*:

```lua
function countdown(n)
    print(n)

    if n <= 0 then
        return
    else
        countdown(n-1)
    end
end

countdown(10)   -- 10, 9, 8, ..., 2, 1, 0
```

Note: some problems are better solved iteratively. All recursive functions can be "unfolded" into an iterative flow. But sometimes, recursion is much more elegant.

---

# Exercises/examples

- write recursive function `fact(n)` that computes the factorial of integer `n`
- write recursive function `fib(n)` that computes the `n`-th Fibonacci number
- write recursive function `palin(s)` that checks if string `s` is a palindrome
    - hint: `string.sub(string, i, j)` returns a substring of `string`, that starts at the `i`-th character and ends at the `j`-th character.

---

# Recursive factorial

```lua
function fact(n)
    if n <= 1 then
        return 1
    else
        return n * fact(n-1)
    end
end
```

---

# Recursive Fibonacci

```lua
function fib(n)
    if n <= 2 then
        return 1
    else
        return fib(n-2) + fib(n-1)
    end
end
```

---

# Recursive palindrome

```lua
function palin(s)
    if #s <= 1 then
        return true
    elseif string.sub(s,1,1) ~= string.sub(s, #s, #s) then
        return false
    else
        return palin(string.sub(s, 2, #s-1))
    end

end
```

---

# A real recursivity exercice

Solve the [tower of Hanoi](https://en.wikipedia.org/wiki/Tower_of_Hanoi) problem.

- 3 pegs
- N discs: always a smaller disc on top of a larger disc
- goal: move all N discs from the first peg to the third

![Hanoi](https://upload.wikimedia.org/wikipedia/commons/0/07/Tower_of_Hanoi.jpeg)

**Hint:** notice that moving N discs from peg A to peg B consists in moving N-1 discs from A to C, moving the N-th disc from A to B, and then N-1 discs from C to B.

---

class: middle

# Logical operators

---

# Exercise: and

Write a function `logical_and()` that, given too boolean arguments, returns true if both arguments are true (and false otherwise):

```lua
function logical_and(a,b)
    -- your code here
end

print(logical_and(false, false))  -- false
print(logical_and(false, true))   -- false
print(logical_and(true, false))   -- false
print(logical_and(true, true))    -- true
```

---

# Solution: and

```lua
function logical_and(a,b)
    if a then
        if b then
            return true
        end
    end
    return false
end
```

or shorter:

```lua
function logical_and(a,b)
    if a then
        return b
    else
        return false
    end
end
```

---

# Exercise: or

Write a function `logical_or()` that, given too boolean arguments, returns true if at least one argument is true (and false otherwise):

```lua
function logical_or(a,b)
    -- your code here
end

print(logical_or(false, false))  -- false
print(logical_or(false, true))   -- true
print(logical_or(true, false))   -- true
print(logical_or(true, true))    -- true
```

---

# Solution: or

```lua
function logical_or(a,b)
    if a then
        return true
    elseif b then
        return true
    end

    return false
end
```

Or shorter:

```lua
function logical_or(a,b)
    if a then
        return true
    else
        return b
    end
end
```

---

# Exercise: not

Write a function `logical_not()` that, given true, returns false, and vice versa:

```lua
function logical_not(a)
    -- your code here
end

print(logical_not(true))   -- false
print(logical_not(false))  -- true
```

---

# Solution: not

```lua
function logical_not(a)
    if a then
        return false
    else
        return true
    end
end
```

Or shorter:

```lua
function logical_not(a)
    return a ~= true
end
```

---

# Logical operators: `and`, `or`, `not`

These three logical operations exist as the operators `and`, `or`, and `not`:

```lua
print(false and false)  -- false
print(false and true)   -- false
print(true and false)   -- false
print(true and true)    -- true

print(false or false)  -- false
print(false or true)   -- true
print(true or false)   -- true
print(true or true)    -- true

print(not false)       -- true
print(not true)        -- false
```

---

# More logic

These operators take booleans, and form boolean expressions. As such, they can be used as conditions in `if`, and `while`:

```lua
N = 100
if N % 2 == 0 and N > 100 then
    print(N .. " is odd, and bigger than 100!")
end
```

They can use variables:

```lua
N = 100
isOdd = N % 2 == 0
isBig = N > 50

if isOdd and isBig then
    print(N .. " is odd, and bigger than 100!")
end
```

---

# Saving booleans

...and their results can be saved in variables:

```lua
isRaining = true
haveUmbrella = false

willGoForAWalk = (isRaining and haveUmbrella) or not isRaining
```

Like other operations, they can be chained as much as you want:

```lua
if a and b and c and d then
    print("a, b, c and d are all true!")
end

if a or b or c or d then
    print("At least one of a, b, c or d is true!")
end
```

---

# Mini exercise: logical operators

