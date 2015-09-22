function permutations(array,start)

	if start == nil then
		start = 1
	end

	if start == #array then
		print(table.concat(array,","))
	end

	for i = start,#array do
		array[start], array[i] = array[i], array[start]
		permutations(array, start + 1)
		array[start], array[i] = array[i], array[start]
	end
end