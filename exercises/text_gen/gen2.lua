function read_file(name)

	local file = io.open(name, "r")
	local text = file.read(file, "*a")
	file.close(file)

	return text:gsub("\n", " ")
end



function analyze(str, tab, order)
	
	for i = 1, #str - order do
		local sub = str:sub(i, i + order - 1)
		local follow = str:sub(i + order, i + order)
		
		tab[sub] = tab[sub] or {}
		table.insert(tab[sub], follow)
	end
	
end

	
function random_array_element(array)
	return array[math.random(#array)]
end

function random_key(t, capitalOnly)

	local keys = {}
	for k,v in pairs(t) do

		if capitalOnly then
			if string.match(k, "^%u") then
				table.insert(keys, k)
			end
		else
			table.insert(keys, k)
		end
	end

	return random_array_element(keys)
end


function generate(tab, order, length)
	
	local start = random_key(tab, true)
	local res = start
	
	while #res < length do
		local prefix = res:sub(#res - order + 1)
		local next = random_array_element(tab[prefix])
		
		res = res .. next
	end
	
	return res
end

local tab = {}
local order = 12

math.randomseed(os.time())

analyze(read_file("dracula.txt"), tab, order)
analyze(read_file("moby.txt"), tab, order)
analyze(read_file("grimm.txt"), tab, order)
analyze(read_file("pap.txt"), tab, order)

print(generate(tab, order, 3000))