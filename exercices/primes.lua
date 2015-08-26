for i = 2,1000 do

	isPrime = true

	for j = 2, i-1 do
		if i % j == 0 then
			isPrime = false
			break
		end
	end

	if isPrime then
		print(i)
	end

end