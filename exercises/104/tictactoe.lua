function make_grid()
	return {
		{0,0,0},
		{0,0,0},
		{0,0,0}
	}
end

function print_grid(grid)

	local chars = {[0] = " ", [1] = "X", [2] = "O"}

	for i = 1,3 do
		local row = grid[i]

		print(" " ..
			chars[row[1]] .. " | " ..
			chars[row[2]] .. " | " ..
			chars[row[3]] .. " ")

		if i < 3 then
			print("---+---+---")
		end
	end
end

function check_win(grid)

	-- rows

	for i = 1,3 do
		if grid[i][1] ~= 0 and grid[i][1] == grid[i][2] and grid[i][1] == grid[i][3] then
			return grid[i][1]
		end
	end
	
	-- columns

	for i = 1,3 do
		if grid[1][i] ~= 0 and grid[1][i] == grid[2][i] and grid[1][i] == grid[3][i] then
			return grid[1][i]
		end
	end

	-- diagonals

	if grid[1][1] ~= 0 and grid[1][1] == grid[2][2] and grid[1][1] == grid[3][3] then
		return grid[1][1]
	end

	if grid[1][3] ~= 0 and grid[1][3] == grid[2][2] and grid[1][3] == grid[3][1] then
		return grid[1][3]
	end
end

function get_input(grid)

	while true do
		local input = io.read()
		local row,col = string.match(input, "^(%d+),(%d+)$")
		row, col = tonumber(row), tonumber(col)

		if row == nil or col == nil or
			row < 1 or row > 3 or col < 1 or col > 3 or
			grid[row][col] ~= 0 then

			print("Invalid input, try again")
		else
			return row,col
		end
	end
end

function play()

	local grid = make_grid()
	local current_player = 1

	while true do
		print_grid(grid)
		
		print("Player " .. current_player .. ":")
		local row,col = get_input(grid)
	
		grid[row][col] = current_player
		local winner = check_win(grid)

		if winner ~= nil then
			print_grid(grid)
			print("Winner: player " .. winner)
			return
		end

		current_player = (current_player % 2) + 1
	end
end

play()