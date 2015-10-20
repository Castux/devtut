function load_database()

	-- load all text, split it into lines

	local clients = {}

	local file = io.open("clients.csv", "r")

	for line in file:lines() do
		local fields = {}

		for field in string.gmatch(line .. ";", "(.-);") do
			table.insert(fields, field)
		end

		table.insert(clients, fields)
	end

	-- remove the first line, which has the field names

	local fields = clients[1]
	table.remove(clients, 1)

	-- create tables using the field names

	local database = {}

	for i,line in ipairs(clients) do

		local t = {}
		for j = 1,#fields do
			t[fields[j]] = line[j]
		end

		table.insert(database, t)
	end

	return database
end

local clients = load_database()
print(#clients)
print(clients[243]["StreetAddress"])