function isPrime(n)
	for i = 2, n-1 do
		if n % i == 0 then
			return false
		end
	end

	return true
end

for i = 2,1000 do
	if isPrime(i) then
		print(i)
	end
end