input = "amanaplanacanalpanama"

result = true

for left = 1, #input / 2 do

	right = #input - left + 1

	if string.sub(input, left, left) ~= string.sub(input, right, right) then
		result = false
		break
	end
end

if result == true then
	print(input .. " is a palindrome!")
else
	print(input .. " is not a palindrome!")
end