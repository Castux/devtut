function primes(N)
	
	local result = {}

	local sieve = {}
	for i = 1,N do
		sieve[i] = true
	end

	for i = 2,#sieve do
		if sieve[i] == true then

			table.insert(result, i)

			for multiple = 2*i,#sieve,i do
				sieve[multiple] = false
			end
		end
	end

	return result
end

local result = primes(100000)

for i = 1,#result do
	print(result[i])
end