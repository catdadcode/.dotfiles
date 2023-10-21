local function pickTheme()
	-- Function to calculate the date of Easter.
	local function calculateEaster(year)
		-- Variables based on the year input to help calculate the date of Easter.
		local yearMod19 = year % 19 -- Year modulo 19
		local century = math.floor(year / 100)
		local yearWithinCentury = year % 100
		local centuryDiv4 = math.floor(century / 4)
		local centuryMod4 = century % 4
		local centuryCalc = math.floor((century + 8) / 25)
		local centuryCalc2 = math.floor((century - centuryCalc + 1) / 3)
		local easterCalc1 = (19 * yearMod19 + century - centuryDiv4 - centuryCalc2 + 15) % 30
		local yearWithinCenturyDiv4 = math.floor(yearWithinCentury / 4)
		local yearWithinCenturyMod4 = yearWithinCentury % 4
		local easterCalc2 = (32 + 2 * centuryMod4 + 2 * yearWithinCenturyDiv4 - easterCalc1 - yearWithinCenturyMod4) % 7
		local easterCalc3 = math.floor((yearMod19 + 11 * easterCalc1 + 22 * easterCalc2) / 451)
		local easterMonth = math.floor((easterCalc1 + easterCalc2 - 7 * easterCalc3 + 114) / 31)
		local easterDay = ((easterCalc1 + easterCalc2 - 7 * easterCalc3 + 114) % 31) + 1

		-- Return the month and day of Easter as a table.
		return { month = easterMonth, day = easterDay }
	end

	-- Function to calculate the date of Thanksgiving.
	local function calculateThanksgiving(year)
		local thanksgiving = os.time({ year = year, month = 11, day = 1 })
		local weekday = os.date("*t", thanksgiving).wday
		local offset = (11 - weekday) % 7
		local day = 1 + offset + (3 * 7) -- Fourth Thursday of November.
		return { month = 11, day = day }
	end

	local currentDate = os.date("*t")
	local year = currentDate.year
	local month = currentDate.month
	local day = currentDate.day

	-- Define holiday dates with start and end dates.

	local holidays = {
		easter = { startDate = calculateEaster(year), endDate = calculateEaster(year) },
		halloween = { startDate = { month = 10, day = 1 }, endDate = { month = 10, day = 31 } },
		new_year = { startDate = { month = 1, day = 1 }, endDate = { month = 1, day = 1 } },
		st_patricks_day = { startDate = { month = 3, day = 17 }, endDate = { month = 3, day = 17 } },
		thanksgiving = { startDate = { month = 11, day = 15 }, endDate = calculateThanksgiving(year) },
		us_independence_day = { startDate = { month = 7, day = 3 }, endDate = { month = 7, day = 5 } },
		valentines_day = { startDate = { month = 2, day = 14 }, endDate = { month = 2, day = 14 } },
		xmas = { startDate = { month = 12, day = 1 }, endDate = { month = 12, day = 25 } },
	}

	-- Check if today is a holiday or within a holiday range.
	for holiday, dateRange in pairs(holidays) do
		local startMonth, startDay = dateRange.startDate.month, dateRange.startDate.day
		local endMonth, endDay = dateRange.endDate.month, dateRange.endDate.day

		-- Check if the current month is within the holiday month range.
		if
			(month > startMonth and month < endMonth)
			or (month == startMonth and day >= startDay)
			or (month == endMonth and day <= endDay)
		then
			return holiday -- Return the holiday theme name.
		end
	end

	-- Check if we are in a work directory.
	local filepath = vim.fn.getcwd() or ""
	if string.match(filepath, "work") then
		return {
			symbols = {
				"☀️",
				"⚡",
				"🔌",
				"🔋",
				"💡",
				"🌞",
				"🌅",
				"🌄",
				"♻️",
				"🍃",
				"🌍",
				"🌎",
				"🌏",
				"🌱",
				"🌲",
				"🌳",
				"🌴",
				"🏞️",
				"💧",
				"🚰",
			},
			colors = {
				"#00f0ff",
				"#7DF5FD",
				"#D4F8FC",
				"#FF8B20",
				"#FAF8F4",
				"#839FFE",
				"#162241",
				"#F8D520",
				"#F8E78E",
				"#F9F4DA",
				"#4BA385",
				"#FAF8F4",
				"#E1AEE7",
				"#F2E3F5",
				"#EAC895",
				"#EB5757",
				"#F2A8A9",
				"#F7E2E2",
				"#003F86",
				"#0056B8",
				"#4B87CC",
				"#FF7241",
			},
		}
	end

	-- Default theme when it's not a holiday and not work.
	return {
		symbols = { "🐱", "🧔", "💻" },
		colors = { "#00ff00", "#ffff00", "#ff00ff" },
	}
end

return {
	{
		"catdadcode/drop.nvim",
		opts = {
			theme = pickTheme(),
			filetypes = { "dashboard" },
			screensaver = 1000 * 60 * 10,
		},
	},
}
