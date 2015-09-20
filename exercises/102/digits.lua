function digits(n)
	
	local result = {}
	
	repeat
		local digit = n % 10
		table.insert(result, 1, digit)

		n = (n - digit) / 10
	until n == 0

	return result
end

function digits2(n)

	local result = {}
	local s = "" .. n

	for i = 1,#s do
		result[i] = string.sub(s,i,i)
	end

	return result
end