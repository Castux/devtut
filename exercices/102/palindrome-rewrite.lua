function isPalindrome(input)

	-- reverse

	reverse = ""

	for i = #input,1,-1 do
		reverse = reverse .. string.sub(input, i, i)
	end

	-- check if they are the same

	return input == reverse
end

input = "amanaplanacanalpanama"

if isPalindrome(input) then
	print("'" .. input .. "' is a palindrome!")
else
	print("'" .. input .. "' is not a palindrome!")
end