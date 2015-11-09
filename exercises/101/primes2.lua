for i = 1e6,1e200 do

	isPrime = true

	for j = 2, i-1 do
		if i % j == 0 then
			isPrime = false
			break
		end
	end

	if isPrime then
		print(i)
		break
	end

end