local Data = {}

Data.buttons = {
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

-- In your load function
Data.bobbingChars = { -- ch1
	{
		img = love.graphics.newImage("Images/menuImage/hug.png"),
		x = 380,
		y = 30,
		amplitude = 10,
		speed = 1.2,
	}, -- ch2
	{
		img = love.graphics.newImage("Images/menuImage/hpi.png"),
		x = 480,
		y = 220,
		amplitude = 8,
		speed = 0.9,
	}, -- ch3
	{
		img = love.graphics.newImage("Images/menuImage/hup.png"),
		x = 360,
		y = 330,
		amplitude = 12,
		speed = 1,
	}, -- ch4
	{
		img = love.graphics.newImage("Images/menuImage/huy.png"),
		x = 650,
		y = 350,
		amplitude = 10,
		speed = 1.1,
	}, -- ch5
	{
		img = love.graphics.newImage("Images/menuImage/heart.png"),
		x = 535,
		y = 400,
		amplitude = 15,
		speed = 0.8,
	},
}

-- In your load function for the pause menu state
Data.decorations = { -- Corner pieces
	{
		img = love.graphics.newImage("Images/pauseImage/bobbingImages/image_0.png"),
		x = 50,
		y = 30,
		amplitude = 5,
		speed = 0.8,
	},
	{
		img = love.graphics.newImage("Images/pauseImage/bobbingImages/image_1.png"),
		x = 690,
		y = 100,
		amplitude = 6,
		speed = 0.9,
	},
	{
		img = love.graphics.newImage("Images/pauseImage/bobbingImages/image_2.png"),
		x = 700,
		y = 400,
		amplitude = 5,
		speed = 1.1,
	},
	{
		img = love.graphics.newImage("Images/pauseImage/bobbingImages/image_3.png"),
		x = 70,
		y = 410,
		amplitude = 7,
		speed = 1.0,
	}, -- Other decorative pieces
	{
		img = love.graphics.newImage("Images/pauseImage/bobbingImages/image_4.png"),
		x = 80,
		y = 250,
		amplitude = 10,
		speed = 1.2,
	},
	{
		img = love.graphics.newImage("Images/pauseImage/bobbingImages/image_5.png"),
		x = 680,
		y = 250,
		amplitude = 12,
		speed = 0.7,
	},
	{
		img = love.graphics.newImage("Images/pauseImage/bobbingImages/image_6.png"),
		x = 630,
		y = 10,
		amplitude = 4,
		speed = 1.3,
	},
	{
		img = love.graphics.newImage("Images/pauseImage/bobbingImages/image_7.png"),
		x = 650,
		y = 500,
		amplitude = 8,
		speed = 0.9,
	},
	{
		img = love.graphics.newImage("Images/pauseImage/bobbingImages/image_8.png"),
		x = 30,
		y = 520,
		amplitude = 6,
		speed = 1.0,
	},
	{
		img = love.graphics.newImage("Images/pauseImage/bobbingImages/image_9.png"),
		x = 30,
		y = 130,
		amplitude = 9,
		speed = 1.1,
	},
}

Data.pauseButtons = {
	Resume = {
		image = love.graphics.newImage("Images/pauseImage/button.png"),
		message = {
			text = "Resume",
			x = 350,
			y = 190,
		},
		x = 310,
		y = 170,
		isHovered = false,
		isClicked = false,
	},

	Restart = {
		image = love.graphics.newImage("Images/pauseImage/button.png"),
		message = {
			text = "Settings",
			x = 340,
			y = 290,
		},
		x = 310,
		y = 270,
		isHovered = false,
		isClicked = false,
	},

	Quit = {
		image = love.graphics.newImage("Images/pauseImage/button.png"),
		message = {
			text = "Main Menu",
			x = 330,
			y = 390,
		},
		x = 310,
		y = 370,
		isHovered = false,
		isClicked = false,
	},
}

Data.settingBlobs = {
	Vex = {
		image = love.graphics.newImage("Images/menuImage/hup.png"),
		sub_name = "The Tri-Scion\n of the Void",
		description = "Its three eyes see all.\nPredicts your every move.\nA truly cosmic challenge.",
		isSelected = true,
		isChosen = true,
		index = 1,
		color = { 0.78, 0.72, 1.0 },
	},
	Pip = {
		image = love.graphics.newImage("Images/menuImage/hpi.png"),
		sub_name = "The Singular\n Glare",
		description = "A powerhouse of pure focus.\nIts singular glare never\n wavers. Hits like a tiny\n pink meteor.",
		isSelected = false,
		isChosen = false,
		index = 2,
		color = { 0.996, 0.541, 0.686 },
	},
	Zephyr = {
		image = love.graphics.newImage("Images/menuImage/huy.png"),
		sub_name = "The Gilded\n Ghost",
		description = "A gilded ghost of the court.\nSpecializes in feints and\nmind-bending curveballs.",
		isSelected = false,
		isChosen = false,
		index = 3,
		color = { 0.98, 0.73, 0.17 },
	},
	Bop = {
		image = love.graphics.newImage("Images/menuImage/hug.png"),
		sub_name = "The Heart\n of the Court",
		description = "The heart and soul of Pong.\nA classic, reliable bounce.\nPerfectly balanced and\n always fun.",
		isSelected = false,
		isChosen = false,
		index = 4,
		color = { 0.36, 0.83, 0.67 },
	},
}

Data.settingNavs = {
	left = {
		image = love.graphics.newImage("Images/settingImage/left.png"),
		x = 55,
		y = 190,
		r = 0,
		sx = 2,
		sy = 2,
	},
	right = {
		image = love.graphics.newImage("Images/settingImage/right.png"),
		x = 335,
		y = 190,
		r = 0,
		sx = 2,
		sy = 2,
	},
}

Data.state = "Menu"
return Data
