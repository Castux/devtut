function isPalindrome(input)

	original = input	-- saved for the final message

	-- remove spaces

	withoutSpaces = ""

	for i = 1,#input do
		letter = string.sub(input, i, i)
		if letter ~= " " then
			withoutSpaces = withoutSpaces .. letter
		end
	end

	-- reverse

	reverse = ""

	for i = #withoutSpaces,1,-1 do
		reverse = reverse .. string.sub(withoutSpaces, i, i)
	end

	-- check if they are the same

	return withoutSpaces == reverse
end

input = "a man a plan a canal panama"

if isPalindrome(input) then
	print("'" .. input .. "' is a palindrome!")
else
	print("'" .. input .. "' is not a palindrome!")
end