local function pickTheme()
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
		opts = function(_, opts)
			opts.theme = pickTheme()
			opts.holidays = {
				halloween = {
					start_date = { month = 10, day = 1 },
					end_date = { month = 10, day = 31 },
				},
				us_thanksgiving = {
					start_date = { month = 11, day = 1 },
					end_date = require("drop").calculate_us_thanksgiving(os.date("%Y")),
				},
				xmas = {
					start_date = { month = 12, day = 1 },
					end_date = { month = 12, day = 25 },
				},
			}
			opts.filetypes = { "dashboard" }
			opts.screensaver = 1000 * 60 * 10
		end,
	},
}
