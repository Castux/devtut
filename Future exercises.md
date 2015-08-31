# Palindromes

A palindrome is a phrase that can be read in both directions, like:

> A man, a plan, a canal, Panama!

In Lua, the function `string.sub` lets you extract substrings. Without going into the details, assume that `string.sub(s, i, i)` will return the `i`-th letter of string `s`:

```lua
print(string.sub("Great!", 3, 3))   -- outputs: e
```

Write a program that recognizes if a string is a palindrome. To simplify, assume there is no punctuation, capitals or spaces, so that the program would only need recognize `"amanaplanacanalpanama"` as a palindrome.

**Hint:** there are many way to do this. Try to analyze how you would do it "in real life", and then translate that algorithm into Lua.

**Bonus question:** modify your program so that it ignores spaces, and recognizes `"a man a plan a canal panama"` as a palindrome.