while true do
	io.write("Say something: ")
	local line = io.read()

	if line == "quit" then
		break
	else
		print(line)
	end
end