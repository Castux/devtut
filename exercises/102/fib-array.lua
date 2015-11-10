function fib(N)
	local array = {1,1}

	while #array < N do
		array[#array + 1] = array[#array - 1] + array[#array]
	end

	return array
end

print(table.concat(fib(100), ","))