class: middle center

# Hello, world!

## Some sort of programmer's joke

---

layout: true

A C classic
===========

```c
#include <stdio.h>

int main(void)
{
	printf("Hello, world!\n");
	return 0;
}
```

---

It does:

- includes another file
- defines a `main` function which:
	- does not take an parameter (`void`)
	- calls function `printf` with a string parameter
	- returns value 0 ("all good")

---

Take note:

- curly braces (typical of C's family)
- every statement ends in `;`
- literals: a string and an integer
- an escaped newline in the string
- explicit types: `int`, `void`

---

layout: false

A Lua classic
=============

```lua
print("Hello, world!")
```

Notice:

- no include: `print` is available by default
- no `;`
- no `main`: the whole file is the main function
- the literal string looks the same
- the call to the `print` function looks the same
- `print` adds a newline by itself

---

Variables
=========

```c
#include <stdio.h>

int main(void)
{
	int i;
	i = 100;
	printf("variable i contains %d\n", i);
	
	return 0;
}
```

- variable `i` must be declared before use, with a *type* `int`
- we *assign* 100 to `i`
- `printf` replaces `%d` with the content of its second argument, expected to be an integer

We could have combined declaration and assignment: `int i = 100;`

---

Variables
=========

In Lua:

```lua
i = 100
print("variable i contains " .. i)
```

Notice:

- variable `i` is used without declaration
- number type is implicitly deduced from the assignment
- operator `..` concatenates a string with another
- number `i` is automatically converted into the string "100"

---

Play it again, Sam!
===================

```c
#include <stdio.h>

int main(void)
{
	int i;
	
	for(i = 1 ; i <= 10 ; i++)
	{
		printf("Hello, world %d!\n", i);
	}
	
	return 0;
}
```

Note:

- `for` is a syntactic construct, not a function
- explicit initialization, test and increment in loop
- again, `i` must be declared before use

---

Play it again, Sam!
===================

In Lua:

```lua
for i = 1,10 do
	print("Hello, world " .. i .. "!")
end
```

- no parentheses or braces, `do` and `end` instead
- implicit initialization, test and increment in loop
- again, `i` is used without declaration

---

Functions
=========

C:

```c
#include <stdio.h>

int print_and_double(int i)
{
	printf("%d\n", i);
	return i*2;
}

int main(void)
{
	int ret;
	
	ret = print_and_double(5);
	printf("ret = %d\n", ret);
	
	return 0;
}
```

---

Functions
=========

Take note:

- declared return type
- declared parameter type and name

C is *statically* typed: the type of every variable must be known at compile time. The compiler will enforce some discipline, and will refuse to compile if we try to pass something else than an `int` to the function `print_and_double`.

---

Functions
=========

Lua:

```lua
function print_and_double(i)
	print(i)
	return i*2
end

ret = print_and_double(5)
print("ret = " .. ret)
```

Notice:

- no return type declaration
- no parameter type declaration (just the name)
- `print` can actually print anything, not just strings
- `print_and_double` can be passed a variable of any type, here we passed a number

---

Functions
=========

Lua is *dynamically* typed: a variable can hold a value of *any* type. It's all decided during execution: the type of `i` is the type of whatever was passed as argument to the function. However, if `i` is not a number, trying to compute `i*2` will fail and produce an error at execution.

More freedom means more self-imposed discipline!
