for i = 1,100 do

	if i % 3 == 0 then
		if i % 5 == 0 then
			print("FizzBuzz")
		else
			print("Fizz")
		end
	elseif i % 5 == 0 then
		print("Buzz")
	else
		print(i)
	end
	
end