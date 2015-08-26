input = "a man a plan a canal panama"

result = true

-- we'll check pairs of letter starting from the outside
-- and going in. left and right will contain the current
-- indices

left = 1
right = #input

while left <= right do

	-- skip all the spaces

	while string.sub(input, left, left) == " " do
		left = left + 1
	end

	while string.sub(input, right, right) == " " do
		right = right - 1
	end

	-- check if the letters are the same

	if string.sub(input, left, left) ~= string.sub(input, right, right) then
		result = false
		break
	end

	-- advance the indices

	left = left + 1
	right = right - 1
end

if result == true then
	print("'" .. input .. "' is a palindrome!")
else
	print("'" .. input .. "' is not a palindrome!")
end