data = require("data.data")
gm = require("game")

local M = {}

-- Print Objects
function printObjects()
	love.graphics.draw(menuBG, 0, 0, 0, 0.8, 0.7)
	love.graphics.draw(sunBG, 40, 20, 0, 1, 1)

	for i, char in ipairs(data.bobbingChars) do
		local offset = math.sin(bobbingTimer * char.speed) * char.amplitude
		local currentY = char.y + offset
		love.graphics.draw(char.img, char.x, currentY, 0, 0.5, 0.5)
	end
end

function printGraphics()
	-- Background
	printObjects()

	-- Buttons
	for _, btn in pairs(data.buttons) do
		love.graphics.draw(btn.image, btn.x, btn.y, 0, 2, 1.5)
		if btn.message.text == "Exit" then
			love.graphics.setColor(1, 1, 1)
		else
			love.graphics.setColor(0.321, 0.718, 0.533)
		end
		love.graphics.print(btn.message.text, btn.message.x, btn.message.y, 0, 0.5, 0.5)
		love.graphics.setColor(1, 1, 1)

		if data.isHovered(btn, 2, 1.5, mouseX, mouseY) then
			btn.isHovered = true
		else
			btn.isHovered = false
		end
	end
end

function menuEventReturn(text)
	if text == "Start" then
		gm.reset()
		data.state = "Game"
	elseif text == "Continue" then
		data.state = "Game"
	elseif text == "Settings" then
		data.previousState = "Menu"
		data.state = "Setting"
	elseif text == "Exit" then
		love.event.quit()
	end
end

function mouseEvents()
	windowWidth, windowHeight = love.graphics.getDimensions()

	for _, btn in pairs(data.buttons) do
		if btn.isHovered then
			love.graphics.draw(pointerImage, mouseX, mouseY, 0, 1.5, 1.5)
			if data.isClicked(btn, 2, 1.5, mouseX, mouseY) then
				menuEventReturn(btn.message.text)
			end
			goto continue
		else
			love.graphics.draw(cursorImage, mouseX, mouseY, 0, 1.5, 1.5)
		end
	end
	::continue::
end

function printMessage()
	love.graphics.setColor(1, 1, 0, 0.5)
	love.graphics.setFont(customFont)
	love.graphics.print("PONG", 500, 470, 0, 1, 1)
	love.graphics.setColor(1, 1, 1)
end

------------------------------- Core Events ---------------------------------------

function M.load()
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

	-- cursor
	cursorImage = love.graphics.newImage("Images/menuImage/cursor.png")
	pointerImage = love.graphics.newImage("Images/menuImage/pointer.png")

	love.mouse.setVisible(false)
	bobbingTimer = 0
end

function M.update(dt)
	mouseX, mouseY = love.mouse.getPosition()
	bobbingTimer = bobbingTimer + dt
end

function M.draw()
	love.graphics.push()
	printGraphics()
	printMessage()
	mouseEvents()
	love.graphics.pop()
end

return M
