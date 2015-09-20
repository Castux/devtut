function isPalindrome(input)

	for left = 1, #input / 2 do

		right = #input - left + 1

		if string.sub(input, left, left) ~= string.sub(input, right, right) then
			return false
		end
	end

	return true
end

input = "amanaplanacanalpanama"

if isPalindrome(input) then
	print(input .. " is a palindrome!")
else
	print(input .. " is not a palindrome!")
end