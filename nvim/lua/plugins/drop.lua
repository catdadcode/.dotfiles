local function pickTheme()
	-- Define holiday dates with start and end dates.
	-- local holidays = {
	-- 	easter = { startDate = calculateEaster(year), endDate = calculateEaster(year) },
	-- 	halloween = { startDate = { month = 10, day = 1 }, endDate = { month = 10, day = 31 } },
	-- 	new_year = { startDate = { month = 1, day = 1 }, endDate = { month = 1, day = 1 } },
	-- 	st_patricks_day = { startDate = { month = 3, day = 17 }, endDate = { month = 3, day = 17 } },
	-- 	thanksgiving = { startDate = { month = 11, day = 15 }, endDate = calculateThanksgiving(year) },
	-- 	us_independence_day = { startDate = { month = 7, day = 3 }, endDate = { month = 7, day = 5 } },
	-- 	valentines_day = { startDate = { month = 2, day = 14 }, endDate = { month = 2, day = 14 } },
	-- 	xmas = { startDate = { month = 12, day = 1 }, endDate = { month = 12, day = 25 } },
	-- }

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
		dir = "~/code/drop.nvim",
		opts = {
			theme = pickTheme(),
			filetypes = { "dashboard" },
			screensaver = 1000 * 60 * 10,
		},
	},
}
