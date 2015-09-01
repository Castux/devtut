input = "amanaplanacanalpanama"

-- reverse

reverse = ""

for i = #input,1,-1 do
	reverse = reverse .. string.sub(input, i, i)
end

-- check if they are the same

if input == reverse then
	print("'" .. input .. "' is a palindrome!")
else
	print("'" .. input .. "' is not a palindrome!")
end