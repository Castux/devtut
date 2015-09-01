input = "a man a plan a canal panama"

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

if withoutSpaces == reverse then
	print("'" .. original .. "' is a palindrome!")
else
	print("'" .. original .. "' is not a palindrome!")
end