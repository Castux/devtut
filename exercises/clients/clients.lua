function read_file(name)

	local file = io.open(name, "r")
	local text = file.read(file, "*a")
	file.close(file)

	return text
end

function load_database()

	-- load all text, split it into lines

	local lines = {}

	local file = io.open("clients.tsv", "r")
	for line in file:lines() do
		local fields = {}
		for field in string.gmatch(line .. "	", "(.-)	") do
			table.insert(fields, field)
		end

		table.insert(lines, fields)
		if #fields ~= 11 then
			print(#fields)
		end
	end

	do return end

	-- split each line into fields

	for i,line in ipairs(lines) do
		lines[i] = split(line, "\t")
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
--print(clients[243]["StreetAddress"])