local keepProbabilities = true

local punctuation =
{
	["."] = true,
	[","] = true,
	[";"] = true,
	[":"] = true,
	["!"] = true,
	["?"] = true,
	["-"] = true,
	["'"] = true
}

function get_next_word(text, pos)

	local letter = string.sub(text, pos, pos)
	if punctuation[letter] then
		return letter
	end

	local match = string.match(text, "^%a+", pos)
	if match ~= nil then
		return match
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

function parse_file(name)

	local file = io.open(name, "r")
	local text = file.read(file, "*a")
	file.close(file)

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

		if keepProbabilities then
			table.insert(all_words[first][second], third)
		else
			all_words[first][second][third] = true
		end
	end
end

function random_array_element(array)
	return array[math.floor(math.random() * #array) + 1]
end

function random_key(t, capitalOnly)

	local keys = {}
	for k,v in pairs(t) do

		if capitalOnly then
			if string.find(k, "^%u") then
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
		local next_word
		if candidates == nil then
			error("Stuck with: " .. previous .. " " .. current)
		else
			if keepProbabilities then
				next_word = random_array_element(candidates)
			else
				next_word = random_key(candidates)
			end
			table.insert(result, next_word)
		end
	end

	return result
end

function pretty_print(words)

	for i,v in ipairs(words) do

		if i > 1 and
			punctuation[v] == nil and
			words[i-1] ~= "'" and
			words[i-1] ~= "-" then
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

local res = generate(400)
pretty_print(res)