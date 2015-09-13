money = 0

monthlyDeposit = 500
durationYears = 50
yearlyRate = 8 / 100

monthlyRate = (1 + yearlyRate)^(1/12) - 1

for year = 1,durationYears do

	for month = 1,12 do
		money = money + monthlyDeposit
		money = money * (1 + monthlyRate)
	end

	print("Year " .. year .. ": " ..  money)
end