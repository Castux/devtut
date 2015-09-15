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

function is_allowed_punctuation(s)
	return punctuation[s] == true
end

function get_next_word(text, pos)

	local letter = string.sub(text, pos, pos)
	if is_allowed_punctuation(letter) then
		return letter
	end

	local match = string.match(text, "^%a+", pos)
	if match ~= nil then
		return match
	end
end

function get_all_words(text)
	
	local result = {}

	local i = 1
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

function read_file(name)

	local file = io.open(name, "r")
	local text = file.read(file, "*a")
	file.close(file)

	return text
end

function analyze(words, sequences)
	
	for i = 1,#words - 2 do

		local first = words[i]
		local second = words[i + 1]
		local third = words[i + 2]

		if sequences[first] == nil then
			sequences[first] = {}
		end

		if sequences[first][second] == nil then
			sequences[first][second] = {}
		end

		table.insert(sequences[first][second], third)
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

function generate(sequences, n)

	math.randomseed(os.time())
	local result = {}

	table.insert(result, random_key(sequences, true))
	table.insert(result, random_key(sequences[result[1]]))

	while #result < n or result[#result] ~= "." do
		local previous = result[#result - 1]
		local current = result[#result]

		local candidates = sequences[previous][current]
		local next_word = random_array_element(candidates)
		table.insert(result, next_word)
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

local sequences = {}
analyze(get_all_words(read_file("dracula.txt")), sequences)
analyze(get_all_words(read_file("pap.txt")), sequences)
analyze(get_all_words(read_file("moby.txt")), sequences)
analyze(get_all_words(read_file("grimm.txt")), sequences)

local res = generate(sequences, 400)
pretty_print(res)