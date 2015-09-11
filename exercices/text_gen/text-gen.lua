function get_next_word(text, pos)

	local start, finish = text:find("^['-,;:%.!?]", pos)
	if start ~= nil then
		return text:sub(start, finish)
	end

	start, finish = text:find("^%w+", pos)
	if start ~= nil then
		return text:sub(start, finish)
	end
end

function parse_string(text)
	
	local result = {}

	local i = 0
	while i <= #text do
		local next_word = get_next_word(text, i)
		if next_word ~= nil then
			table.insert(result, next_word)
			i = i + #next_word
		else
			i = i + 1
		end
	end

	return result
end

function parse_file(file)

	local fp = io.open(file, "r")
	local text = fp:read("*a")
	fp:close()

	return parse_string(text)
end

local all_words = {}

function analyze(words)
	
	for i = 1,#words - 2 do

		local first = words[i]
		local second = words[i + 1]
		local third = words[i + 2]

		if all_words[first] == nil then
			all_words[first] = {}
		end

		if all_words[first][second] == nil then
			all_words[first][second] = {}
		end

		table.insert(all_words[first][second], third)
	end
end

function random_array_element(array)
	return array[math.floor(math.random() * #array) + 1]
end

function random_key(t, capitalOnly)

	local keys = {}
	for k,v in pairs(t) do

		if capitalOnly then
			if k:find("^%u") then
				table.insert(keys, k)
			end
		else
			table.insert(keys, k)
		end
	end

	return random_array_element(keys)
end

function generate(max)

	local result = {}

	table.insert(result, random_key(all_words, true))
	table.insert(result, random_key(all_words[result[1]]))

	while #result < max or result[#result] ~= "." do
		local previous = result[#result - 1]
		local current = result[#result]

		local candidates = all_words[previous][current]
		if candidates == nil then
			print("Stuck!")
		else
			local next_word = candidates[math.floor(math.random() * #candidates) + 1]
			table.insert(result, next_word)
		end
	end

	return result
end

function pretty_print(words)

	for i,v in ipairs(words) do

		if v:find("%w") then
			io.write(" ")
		end

		io.write(v)
	end
end

analyze(parse_file("dracula.txt"))
analyze(parse_file("pap.txt"))
analyze(parse_file("moby.txt"))
analyze(parse_file("grimm.txt"))

math.randomseed(os.time())

local res = generate(100000)
pretty_print(res)