function deco(n)

	local res = {}

	local div = 2
	while n > 1 do
		if n % div == 0 then
			res[#res + 1] = div
			n = n / div
		else
			div = div + 1
		end
	end

	return res
end

for i = 1,1000 do
	local res = deco(i)
	print(i, table.concat(res, ","))
end