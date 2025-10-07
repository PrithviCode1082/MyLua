data = require("data.data")

-- Check Hovering
function isHovering(image, x, y)
	menuWidth = image:getWidth() * 2
	menuHeight = image:getHeight() * 1.5
	return mouseX > x and mouseX < x + menuWidth and mouseY > y and mouseY < y + menuHeight
end

-- Print Objects
function printObjects()
	love.graphics.draw(menuBG, 0, 0, 0, 0.8, 0.7)
	love.graphics.draw(sunBG, 40, 20, 0, 1, 1)
	love.graphics.draw(ch1, 420, 420, 0, 0.5, 0.5)
	love.graphics.draw(ch2, 650, 420, 0, 0.5, 0.5)
	love.graphics.draw(ch3, 420, 520, 0, 0.5, 0.5)
	love.graphics.draw(ch4, 650, 520, 0, 0.5, 0.5)
	love.graphics.draw(ch5, 535, 400, 0, 0.5, 0.5)
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

		if isHovering(btn.image, btn.x, btn.y) then
			btn.isHovered = true
		else
			btn.isHovered = false
		end
	end
end

function isClicked(btn)
	local mx, my = love.mouse.getPosition()
	local w, h = btn.image:getWidth(), btn.image:getHeight()
	return love.mouse.isDown(1) and mx > btn.x and mx < btn.x + w and my > btn.y and my < btn.y + h
end

function mouseEvents()
	for _, btn in pairs(data.buttons) do
		if btn.isHovered then
			love.graphics.draw(pointerImage, mouseX, mouseY, 0, 1.5, 1.5)
			if isClicked(btn) then
				love.graphics.print("Clicked", 40, 40)
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
	mouseEvents()
end
