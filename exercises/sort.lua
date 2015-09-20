function selection_sort(arr)

	local result = {}

	while #arr > 0 do
		local min = arr[1]
		local index = 1

		for i,v in ipairs(arr) do
			if v < min then
				index = i
				min = v
			end
		end

		table.insert(result, min)
		table.remove(arr, index)
	end

	return result
end

function insertion_sort(arr)

	local result = {}

	-- take values one by one

	for i = 1, #arr do

		-- go through temporary result (sorted)
		-- and find the final position of the value

		for j = 1, #result + 1 do

			if j > #result or arr[i] < result[j] then
				table.insert(result, j, arr[i])
				break
			end
		end
	end

	return result
end

function merge_sort(arr)

	-- base of recursion

	if #arr <= 1 then
		return arr
	end

	-- split

	local left = {}
	local right = {}
	local middle = math.floor(#arr/2)

	for i = 1, middle do
		left[#left + 1] = arr[i]
	end

	for i = middle + 1, #arr do
		right[#right + 1] = arr[i]
	end

	-- sort halves

	left = merge_sort(left)
	right = merge_sort(right)

	-- merge results

	local result = {}

	local leftIndex = 1
	local rightIndex = 1

	while leftIndex <= #left and rightIndex <= #right do

		local l = left[leftIndex]
		local r = right[rightIndex]

		if l < r then
			result[#result + 1] = l
			leftIndex = leftIndex + 1
		else
			result[#result + 1] = r
			rightIndex = rightIndex + 1
		end

	end

	for i = leftIndex,#left do
		result[#result + 1] = left[i]
	end

	for i = rightIndex,#right do
		result[#result + 1] = right[i]
	end

	return result
end

math.randomseed(os.time())

test = {}
for i = 1,40 do
	test[i] = math.random(100)
end

print(table.concat(test, ","))

test = selection_sort(test)
print(table.concat(test, ","))

test = insertion_sort(test)
print(table.concat(test, ","))

test = merge_sort(test)
print(table.concat(test, ","))
