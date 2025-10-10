pauesbtn = require("data.data")

local PB = {}

-- Bobbing Decoration
function printPauseGraphics()
	for i, char in ipairs(pauesbtn.decorations) do
		local offset = math.sin(bobbingTimer * char.speed) * char.amplitude
		local currentY = char.y + offset
		love.graphics.draw(char.img, char.x, currentY, 0, 0.5, 0.5)
	end
end

-- Buttons and BG
function printButtons()
	for _, btn in pairs(pauesbtn.pauseButtons) do
		love.graphics.draw(btn.image, btn.x, btn.y, 0, 2, 1.5)
		love.graphics.setColor(0.321, 0.718, 0.533)
		love.graphics.setColor(0.6, 0.345, 0.165)
		love.graphics.print(btn.message.text, btn.message.x, btn.message.y, 0, 0.5, 0.5)
		love.graphics.setColor(1, 1, 1)

		if isHovering(btn.image, btn.x, btn.y) then
			btn.isHovered = true
		else
			btn.isHovered = false
		end
	end
end

-- Mouse events
function isHovering(image, x, y)
	menuWidth = image:getWidth() * 2
	menuHeight = image:getHeight() * 1.5
	return mouseX > x and mouseX < x + menuWidth and mouseY > y and mouseY < y + menuHeight
end

function isClicked(btn)
	local mx, my = love.mouse.getPosition()
	local w, h = btn.image:getWidth() * 2, btn.image:getHeight() * 1.5
	return love.mouse.isDown(1) and mx > btn.x and mx < btn.x + w and my > btn.y and my < btn.y + h
end

function mouseEvents()
	windowWidth, windowHeight = love.graphics.getDimensions()

	for _, btn in pairs(pauesbtn.pauseButtons) do
		if btn.isHovered then
			love.graphics.draw(pointerImage, mouseX, mouseY, 0, 1.5, 1.5)
			if isClicked(btn) then
				pauesbtn.isClicked = true
				-- pauesbtn.clickedText = btn.message.text
				-- love.graphics.print(btn.message.text, 100, 100, 0, 1, 1)
			end
			goto continue
		else
			love.graphics.draw(cursorImage, mouseX, mouseY, 0, 1.5, 1.5)
		end
	end
	::continue::
end

----------------------------  Main Pause Menu Events ------------------------------------
function PB.load()
	-- Main
	pauseBG = love.graphics.newImage("Images/pauseImage/pauseBG.png")
	button1 = love.graphics.newImage("Images/pauseImage/button.png")
	button2 = love.graphics.newImage("Images/pauseImage/button.png")
	button3 = love.graphics.newImage("Images/pauseImage/button.png")

	-- Fonts
	customFont = love.graphics.newFont("Images/menuImage/PG.otf", 80)
	love.graphics.setFont(customFont)

	cursorImage = love.graphics.newImage("Images/menuImage/cursor.png")
	pointerImage = love.graphics.newImage("Images/menuImage/pointer.png")
	love.mouse.setVisible(false)

	bobbingTimer = 0
end

function PB.update(dt)
	mouseX, mouseY = love.mouse.getPosition()
	bobbingTimer = bobbingTimer + dt
end

function PB.draw()
	love.graphics.draw(pauseBG, 180, 80, 0, 3.5, 3.5)
	printButtons()
	printPauseGraphics()
	mouseEvents()
end

return PB
