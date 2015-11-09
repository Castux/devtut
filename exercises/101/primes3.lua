count = 0

for i = 2,1e200 do

	isPrime = true

	for j = 2, i-1 do
		if i % j == 0 then
			isPrime = false
			break
		end
	end

	if isPrime then
		count = count + 1
		if count == 2000 then
			print(i)
			break
		end
	end

end