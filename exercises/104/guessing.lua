math.randomseed(os.time())

local max = 1000
local N = math.random(max)

print("Welcome to the number guessing game!")
print("I am thinking of a number between 1 and " .. max)

local tries = 0

while true do
	print("Take a guess:")
	local input = io.read()
	local guess = tonumber(input)

	if guess == nil then
		print("Hey, " .. input .. " is not a number!")
	else
		tries = tries + 1

		if guess < N then
			print("Too small!")
		elseif guess == N then
			print("You got it, in " .. tries .. " tries!")
			break
		else
			print("Too big!")
		end
	end
end

print("Thanks for playing!")
