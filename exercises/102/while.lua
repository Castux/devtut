function isPalindrome(input)
	local left = 1
	local right = #input

	while left < right do
		if string.sub(input, left, left) ~= string.sub(input, right, right) then
			return false
		end

		left = left + 1
		right = right - 1
	end

	return true
end

--local input = "amanaplanacanalpanama"

--if isPalindrome2(input) then
--	print(input .. " is a palindrome!")
--else
--	print(input .. " is not a palindrome!")
--end

function collatz(N)

	print(N)

	while N ~= 1 do
		if N % 2 == 0 then
			N = N / 2
		else
			N = 3 * N + 1
		end

		print(N)
	end

end

--collatz(10)