class: middle center

# Algorithmics 101

## Or the art of solving problems

---

# Contents

- recursivity

---

# Exercise: sorting an array

TO BE MOVED PROBABLY

To prepare for next lesson (algorithmics): write a function `sort(arr)` that, given an array of numbers, returns an array containing the same numbers, but sorted in increasing order.

```lua
result = sort({3,20,500,8,3,45,91,31,23})
print(table.concat(result, ","))

-- should output: 3,3,8,20,23,31,45,91,500
```

- there are many, many ways
- if stuck, get a shuffled pack of cards, sort them by hand and try to break down your algorithm into its essential parts
- if you find several solutions, try to compare their efficiency: how many operations happen in each, for an array of size N (comparisons, copies, swaps, etc.)

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
    else
        return string.sub(s,1,1) == string.sub(s, #s, #s)
            and palin(string.sub(s, 2, #s-1))
    end
end
```

---

# Exercise: permutations

Write a function which, given an array, prints all possible permutations of that array (rearangement of the elements in all possible orders).

```lua
permutations({1,2,3})

--> 1,2,3
--> 1,3,2
--> 2,1,3
--> 2,3,1
--> 3,2,1
--> 3,1,2
```

---

# A real recursivity exercice

Solve the [tower of Hanoi](https://en.wikipedia.org/wiki/Tower_of_Hanoi) problem.

- 3 pegs
- N discs: always a smaller disc on top of a larger disc
- goal: move all N discs from the first peg to the third

![Hanoi](https://upload.wikimedia.org/wikipedia/commons/0/07/Tower_of_Hanoi.jpeg)

**Hint:** notice that moving N discs from peg A to peg B consists in moving N-1 discs from A to C, moving the N-th disc from A to B, and then N-1 discs from C to B.
