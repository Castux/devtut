function isPrime(n)
	for i = 2, n-1 do
		if n % i == 0 then
			return false
		end
	end

	return true
end

--for i = 2,1000 do
--	if isPrime(i) then
--		print(i)
--	end
--end

function fibonacci(n)

	if n <= 2 then
		return 1
	end

	local a = 1
	local b = 1
	local c

	for i = 3,n do
		c = a + b
		a = b
		b = c
	end

	return c
end

--for i = 1,100 do
--	print(fibonacci(i))
--end

function isPalindrome(input)

	for left = 1, #input / 2 do

		local right = #input - left + 1

		if string.sub(input, left, left) ~= string.sub(input, right, right) then
			return false
		end
	end

	return true
end

--local input = "amanaplanacanalpanama"

--if isPalindrome2(input) then
--	print(input .. " is a palindrome!")
--else
--	print(input .. " is not a palindrome!")
--end