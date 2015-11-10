local names = {
	"yksi",
	"kaksi",
	"kolme",
	"neljä",
	"viisi",
	"kuusi",
	"seitsemän",
	"kahdeksaan",
	"yhdeksään"
}

function upTo99(n)

	local units = n % 10
	local tens = (n - units) / 10

	if n == 0 then
		return "nolla"

	elseif n < 10 then
		return names[n]

	elseif n == 10 then
		return "kymmenen"

	elseif n < 20 then
		return names[units] .. "toista"
	
	else
		local result = names[tens] .. "kymmentä"
		if units > 0 then
			result = result .. names[units]
		end

		return result
	end
end

function upTo999(n)

	local low = n % 100
	local hundreds = (n - low) / 100

	local unitsString = upTo99(low)

	local result

	if hundreds == 0 then
		return unitsString
	elseif hundreds == 1 then
		result = "sata"
	else
		result = names[hundreds] .. "sataa"
	end

	if low > 0 then
		result = result .. unitsString
	end

	return result
end

function upTo999999(n)

	local low = n % 1000
	local high = (n - low) / 1000

	local lowString = upTo999(low)
	local highString = upTo999(high)

	local result

	if high == 0 then
		return lowString
	elseif high == 1 then
		result = "tuhat"
	else
		result = highString .. "tuhatta"
	end

	if low > 0 then
		result = result .. lowString
	end

	return result
end

function toFinnishSpelling(n)

	if n > 999999 then
		error("Only up to 999999 supported")
	end

	return upTo999999(n)
end

for i = 1,999999 do
	print(i .. ": " .. toFinnishSpelling(i))
end