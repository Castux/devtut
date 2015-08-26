input = "a man a plan a canal panama"

original = input	-- saved for the final message

-- optional: remove spaces

withoutSpaces = ""

for i = 1,#input do
	letter = string.sub(input, i, i)
	if letter ~= " " then
		withoutSpaces = withoutSpaces .. letter
	end
end

input = withoutSpaces

-- reverse

reverse = ""

for i = #input,1,-1 do
	reverse = reverse .. string.sub(input, i, i)
end

-- check if they are the same

if input == reverse then
	print("'" .. original .. "' is a palindrome!")
else
	print("'" .. original .. "' is not a palindrome!")
end