function read_file(name)

	local file = io.open(name, "r")
	local text = file.read(file, "*a")
	file.close(file)

	return text
end

function split(s,sep)

	local parts = {}

	local i = 1
	while i < #s do

		local pos = string.find(s, sep, i)
		if pos == nil then
			pos = #s + 1
		end

		local part = string.sub(s, i, pos - 1)
		table.insert(parts, part)
		i = pos + 1
	end

	return parts
end

function load_database()

	-- load all text, split it into lines

	local text = read_file("clients.csv")
	local lines = split(text, "\n")

	-- split each line into fields

	for i,line in ipairs(lines) do
		lines[i] = split(line, ",")
	end

	-- remove the first line, which has the field names

	local fields = lines[1]
	table.remove(lines, 1)

	-- create tables using the field names

	local database = {}

	for i,line in ipairs(lines) do

		local t = {}
		for j = 1,#fields do
			t[fields[j]] = line[j]
		end

		table.insert(database, t)
	end

	return database
end

local clients = load_database()
print(clients[243]["StreetAddress"])