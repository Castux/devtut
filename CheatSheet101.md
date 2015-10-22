Lua101 cheat sheet
==================

Lexical conventions
-------------------

- `-- foobar` : comment until end of line
- variable name: `_`, letters, numbers (cannot start with a number)
- reserved names: `and break do else elseif end false for function if in
local nil not or repeat return then true until while`

Types
-----

| Type    | Literal               |
|---------|-----------------------|
| number  | `123 -2 45.024 9.9e6` |
| string  | `"Foo" 'Bar'`         |
| boolean | `true false`          |
| nil     | `nil`                 |

Operators
---------

| Number operator | Meaning        |
|-----------------|----------------|
| `a + b`         | addition       |
| `a - b`         | subtraction    |
| `a * b`         | multiplication |
| `a / b`         | division       |
| `a % b`         | modulo         |
| `a ^ b`         | exponentiation |
| `-a`            | opposite       |

| String operator | Meaning       |
|-----------------|---------------|
| `a .. b`        | concatenation |
| `#a`            | length        |

| Comparison operator | Meaning          |
|---------------------|------------------|
| `a == b`            | equal            |
| `a ~= b`            | different        |
| `a < b`             | strictly smaller |
| `a > b`             | strictly greater |
| `a <= b`            | smaller or equal |
| `a >= b`            | greater or equal |

Expressions
-----------

| Expression | Example     |
|------------|-------------|
| literal    | `1`         |
| variable   | `foo`       |
| operation  | `1 + foo`   |
| (expr)     | `(1 + foo)` |

Statements
----------

| Statement               | Meaning                                      |
|-------------------------|----------------------------------------------|
| `print(expression)`     | print value of expression to standard output |
| `variable = expression` | assign value of expression to variable       |
| `if` control structure  | select block of code according to condition  |
| numeric `for` loop      | repeat block of code                         |
| `break`                 | exit current loop                            |

block: sequence of statements

`if` control structure
----------------------

```lua
-- execute block associated with the first expression which is true
-- if all expressions are false, execute elseblock

if expression1 then
	-- block1
elseif expression2 then
	-- block2
elseif expression3 then
	-- block3
else
	-- elseblock
end
```

- `elseif` blocks: 0 or more
- `else` block: 0 or 1

Numeric `for` loop
------------------

```lua
-- repeat block with variable taking values
-- start, start + step, start + 2*step, start + 3*step, etc.
-- until it goes past finish

for variable = start,finish,step do
	-- block
end
```

`step` is optional and defaults to 1