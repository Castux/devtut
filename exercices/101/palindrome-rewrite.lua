input = "a man a plan a canal panama"

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