local M = {}

M.buttons = {
	Start = {
		image = love.graphics.newImage("Images/menuImage/panel.png"),
		message = {
			text = "Start",
			x = 370,
			y = 137,
		},
		x = 320,
		y = 120,
		isHovered = false,
		isClicked = false,
	},
	Continue = {
		image = love.graphics.newImage("Images/menuImage/panel.png"),
		message = {
			text = "Continue",
			x = 600,
			y = 68,
		},
		x = 570,
		y = 50,
		isHovered = false,
		isClicked = false,
	},
	Settings = {
		image = love.graphics.newImage("Images/menuImage/panel.png"),
		message = {
			text = "Settings",
			x = 600,
			y = 240,
		},
		x = 570,
		y = 220,
		isHovered = false,
		isClicked = false,
	},
	exit = {
		image = love.graphics.newImage("Images/menuImage/exit.png"),
		message = {
			text = "Exit",
			x = 93,
			y = 487,
		},
		x = 30,
		y = 470,
		isHovered = false,
		isClicked = false,
	},
}

return M
