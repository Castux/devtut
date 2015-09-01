function fibonacci(n)

	if n <= 2 then
		return 1
	end

	local a = 1
	local b = 1
	local c

	for i = 3,n do
		c = a + b
		a = b
		b = c
	end

	return c
end

for i = 1,100 do
	print(fibonacci(i))
end