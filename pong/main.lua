-- local Game = require("game")

buttons = {
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

function printGraphics()
	-- Background
	love.graphics.draw(menuBG, 0, 0, 0, 0.8, 0.7)
	love.graphics.draw(sunBG, 40, 20, 0, 1, 1)

	-- Buttons
	for _, btn in pairs(buttons) do
		local image = btn.image
		local x = btn.x
		local y = btn.y

		-- Inner message data
		local messageText = btn.message.text
		local messageX = btn.message.x
		local messageY = btn.message.y

		love.graphics.draw(image, x, y, 0, 2, 1.5)
		if messageText == "Exit" then
			love.graphics.setColor(1, 1, 1)
		else
			love.graphics.setColor(0.321, 0.718, 0.533)
		end
		love.graphics.print(messageText, messageX, messageY, 0, 0.5, 0.5)
		love.graphics.setColor(1, 1, 1)

		-- MouseEvents
		-- menuWidth = image:getWidth() * 2
		-- menuHeight = image:getHeight() * 1.5

	end

end

function printMessage()
	love.graphics.setColor(1, 1, 0, 0.5)
	love.graphics.setFont(customFont)
	love.graphics.print("PONG", 500, 470, 0, 1, 1)
	love.graphics.setColor(1, 1, 1)
end

-- function isMouseOver(image, x, y)
-- 	menuWidth = image:getWidth() * 2
-- 	menuHeight = image:getHeight() * 1.5

-- 	if mouseX > x and mouseX < x + menuWidth and mouseY > y and mouseY < y + menuHeight then
-- 		return true
-- 	else
-- 		return false
-- 	end
-- end

-- function mouseEvents()
-- 	isHover = false
-- 	if isMouseOver(panelBG1, 320, 120) then
-- 		isHover = true
-- 	elseif isMouseOver(panelBG1, 570, 50) then
-- 		isHover = true
-- 	elseif isMouseOver(panelBG3, 570, 220) then
-- 		isHover = true
-- 	elseif isMouseOver(exit, 30, 470) then
-- 		isHover = true
-- 	end

-- 	if isHover then
-- 		love.graphics.draw(pointerImage, mouseX, mouseY, 0, 1.5, 1.5)
-- 	else
-- 		love.graphics.draw(cursorImage, mouseX, mouseY, 0, 1.5, 1.5)
-- 	end
-- end

function love.load()
	love.window.setTitle("PONG")
	-- Images
	menuBG = love.graphics.newImage("Images/menuImage/menuForest.png")
	sunBG = love.graphics.newImage("Images/menuImage/sun.png")
	panelBG1 = love.graphics.newImage("Images/menuImage/panel.png")
	panelBG2 = love.graphics.newImage("Images/menuImage/panel.png")
	panelBG3 = love.graphics.newImage("Images/menuImage/panel.png")
	exit = love.graphics.newImage("Images/menuImage/exit.png")

	-- characters
	ch1 = love.graphics.newImage("Images/menuImage/hug.png")
	ch2 = love.graphics.newImage("Images/menuImage/hpi.png")
	ch3 = love.graphics.newImage("Images/menuImage/hup.png")
	ch4 = love.graphics.newImage("Images/menuImage/huy.png")
	ch5 = love.graphics.newImage("Images/menuImage/heart.png")

	-- Font
	customFont = love.graphics.newFont("Images/menuImage/PG.otf", 80)
	customMessageFont = love.graphics.newFont("Images/menuImage/PG.otf", 40)

	-- cursor
	cursorImage = love.graphics.newImage("Images/menuImage/cursor.png")
	pointerImage = love.graphics.newImage("Images/menuImage/pointer.png")

	love.mouse.setVisible(false)
end

function love.update(dt)
	mouseX, mouseY = love.mouse.getPosition()
end

function love.draw()
	printGraphics()
	printMessage()
	-- mouseEvents()

	love.graphics.draw(ch1, 420, 420, 0, 0.5, 0.5)
	love.graphics.draw(ch2, 650, 420, 0, 0.5, 0.5)
	love.graphics.draw(ch3, 420, 520, 0, 0.5, 0.5)
	love.graphics.draw(ch4, 650, 520, 0, 0.5, 0.5)
	love.graphics.draw(ch5, 535, 400, 0, 0.5, 0.5)

end

-- -- local Game = require("game")

-- function printGraphics()
--     love.graphics.draw(menuBG, 0, 0, 0, 0.8, 0.7)
--     love.graphics.draw(sunBG, 40, 20, 0, 1, 1)
--     love.graphics.draw(panelBG1, 320, 120, 0, 2, 1.5)
--     love.graphics.draw(panelBG2, 570, 50, 0, 2, 1.5)
--     love.graphics.draw(panelBG3, 570, 220, 0, 2, 1.5)
--     love.graphics.draw(exit, 30, 470, 0, 2, 1.5)

--     love.graphics.setColor(1, 1, 0, 0.5)
--     love.graphics.setFont(customFont)
--     love.graphics.print("PONG", 500, 470, 0, 1, 1)
--     love.graphics.setColor(1, 1, 1)
-- end

-- function printMessage()
--     love.graphics.setColor(0.321, 0.718, 0.533)
--     love.graphics.setFont(customMessageFont)
--     love.graphics.print("Start", 370, 137, 0, 1, 1)
--     love.graphics.print("Continue", 600, 68, 0, 1, 1)
--     love.graphics.print("Settings", 600, 240, 0, 1, 1)
--     love.graphics.setColor(1, 1, 1)

--     love.graphics.setColor(1, 1, 1)
--     love.graphics.print("Quit", 93, 485, 0, 1, 1)
--     love.graphics.setColor(1, 1, 1)
-- end

-- function isMouseOver(image, x, y)
--     menuWidth = image:getWidth() * 2
--     menuHeight = image:getHeight() * 1.5

--     if mouseX > x and mouseX < x + menuWidth and
--     mouseY > y and mouseY < y + menuHeight then
--         return true
--     else
--         return false
--     end
-- end

-- function mouseEvents()
--     isHover = false
--     if isMouseOver(panelBG1, 320, 120) then
--         isHover = true
--     elseif isMouseOver(panelBG1, 570, 50) then
--         isHover = true
--     elseif isMouseOver(panelBG3, 570, 220) then
--         isHover = true
--     elseif isMouseOver(exit, 30, 470) then
--         isHover = true
--     end

--     if isHover then
--         love.graphics.draw(pointerImage, mouseX, mouseY, 0, 1.5, 1.5)
--     else
--         love.graphics.draw(cursorImage, mouseX, mouseY, 0, 1.5, 1.5)
--     end
-- end

-- function love.load()
--     love.window.setTitle("PONG")
--     -- Images
--     menuBG = love.graphics.newImage('Images/menuImage/menuForest.png');
--     sunBG = love.graphics.newImage('Images/menuImage/sun.png')
--     panelBG1 = love.graphics.newImage('Images/menuImage/panel.png')
--     panelBG2 = love.graphics.newImage('Images/menuImage/panel.png')
--     panelBG3 = love.graphics.newImage('Images/menuImage/panel.png')
--     exit = love.graphics.newImage('Images/menuImage/exit.png')

--     -- characters
--     ch1 = love.graphics.newImage('Images/menuImage/hug.png');
--     ch2 = love.graphics.newImage('Images/menuImage/hpi.png');
--     ch3 = love.graphics.newImage('Images/menuImage/hup.png');
--     ch4 = love.graphics.newImage('Images/menuImage/huy.png');
--     ch5 = love.graphics.newImage('Images/menuImage/heart.png');

--     -- Font
--     customFont = love.graphics.newFont("Images/menuImage/PG.otf", 80)
--     customMessageFont = love.graphics.newFont("Images/menuImage/PG.otf", 40)

--     -- cursor
--     cursorImage = love.graphics.newImage('Images/menuImage/cursor.png')
--     pointerImage = love.graphics.newImage('Images/menuImage/pointer.png')
--     isHover = false
--     love.mouse.setVisible(false)

-- end

-- function love.update(dt)
--     mouseX, mouseY = love.mouse.getPosition()
-- end

-- function love.draw()
--     printGraphics()
--     printMessage()
--     mouseEvents()

--     love.graphics.draw(ch1, 420, 420, 0, 0.5, 0.5)
--     love.graphics.draw(ch2, 650, 420, 0, 0.5, 0.5)
--     love.graphics.draw(ch3, 420, 520, 0, 0.5, 0.5)
--     love.graphics.draw(ch4, 650, 520, 0, 0.5, 0.5)
--     love.graphics.draw(ch5, 535, 400, 0, 0.5, 0.5)
-- end
