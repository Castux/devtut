function load_database()

	-- load all text, split it into lines

	local clients = {}

	for line in io.lines("clients.csv") do
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

function count_genders(clients)

	local male,female = 0,0

	for i,v in ipairs(clients) do
		if v["Gender"] == "male" then
			male = male + 1
		else
			female = female + 1
		end
	end

	return male, female
end

function average_age(clients)
	
	local ages = {}

	local now = os.date("*t")
	thisYear = now["year"]

	local sum = 0
	for i,v in ipairs(clients) do
		local year = string.match(v["Birthday"], "%d%d%d%d")
		local age = thisYear - tonumber(year)
		table.insert(ages, age)
		sum = sum + age
	end

	table.sort(ages)

	return sum/#clients, ages[#ages/2]
end

function photo(clients)

	print("Photo related clients in Tunisia:")

	for i,v in ipairs(clients) do
		local job = string.lower(v["Occupation"])
		local country = v["CountryFull"]
		if string.match(job, "photo") ~= nil and country == "Tunisia" then
			print("", v["Username"], job)
		end
	end

end

function email(address, message)
	print("Email to " .. address .. ": " .. message)
end

function birthdays(clients)

	print("Birthdays:")

	local now = os.date("*t")
	
	for i,v in ipairs(clients) do
		local month,day = string.match(v["Birthday"], "^(%d+)/(%d+)")
		month, day = tonumber(month), tonumber(day)

		if month == now["month"] and day == now["day"] and v["EmailAddress"] ~= "" then
			email(v["EmailAddress"], "Happy birthday " .. v["GivenName"] .. "!")
		end
	end

end

function countries_stats(clients)
	local countries = {}

	for i,v in ipairs(clients) do
		local c = v["CountryFull"]
		if countries[c] == nil then
			countries[c] = 0
		end
		countries[c] = countries[c] + 1
	end

	for k,v in pairs(countries) do
		print(k,v)
	end
end

function test()
	local clients = load_database()
	print("Database has " .. #clients .. " clients")
	print("Male/female:", count_genders(clients))
	print("Average/median age:", average_age(clients))
	photo(clients)
	birthdays(clients)
	countries_stats(clients)
end

test()