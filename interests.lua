money = 0

monthlyDeposit = 500

durationYears = 50
durationMonths = durationYears * 12

yearlyRate = 8 / 100
monthlyRate = (1 + yearlyRate)^(1/12) - 1

for month = 1,durationMonths do
	money = money + monthlyDeposit
	money = money * (1 + monthlyRate)

	if month % 12 == 0 then
		print("Year " .. month / 12, money)
	end
end