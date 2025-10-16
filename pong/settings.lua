s_data = require("data.data")

local S = {}

function love.mousereleased(x, y, button)
	if button == 1 then
		for key, value in pairs(s_data.settingNavs) do
			if s_data.isHovered(value, value.sx, value.sy, mouseX, mouseY) and key == "right" and selected < 4 then
				selected = selected + 1
			elseif s_data.isHovered(value, value.sx, value.sy, mouseX, mouseY) and key == "left" and selected > 1 then
				selected = selected - 1
			end
		end
	end
	if s_data.isHovered(s_data.settingExit.back, 1, 1, mouseX, mouseY) and s_data.previousState == "Menu" then
		s_data.state = "Menu"
	elseif s_data.isHovered(s_data.settingExit.back, 1, 1, mouseX, mouseY) and s_data.previousState == "Pause" then
		s_data.state = "Pause"
	end
end

function S.printNavButtons()
	for key, value in pairs(s_data.settingNavs) do
		love.graphics.draw(value.image, value.x, value.y, value.r, value.sx, value.sy)
	end
end

function S.printText(text, heading, subHead, x, y, z)
	love.graphics.setColor(x, y, z)
	if heading == "Zephyr" then
		love.graphics.print(heading, 485, 140, 0, 2.5, 2.5)
	else
		love.graphics.print(heading, 535, 140, 0, 2.5, 2.5)
	end
	love.graphics.print(subHead, 500, 200, 0, 1.5, 1.5)
	love.graphics.print(text, 455, 320, 0, 1, 1)
	love.graphics.setColor(1, 1, 1)
end

function S.hills()
	love.graphics.draw(hilltop, 30, 540, 0, 0.5, 0.5)
	love.graphics.draw(hilltop, 110, 540, 0, 0.5, 0.5)
	love.graphics.draw(hillsmile, 70, 534, 0, 0.55, 0.55)
end

function S.printBlobs()
	for key, value in pairs(s_data.settingBlobs) do
		if value.index == selected then
			love.graphics.draw(value.image, 145, 130, 0, 1, 1)
			S.printText(value.description, key, value.sub_name, value.color[1], value.color[2], value.color[3])
			value.isChosen = value.index == chosen
			if value.isChosen then
				love.graphics.draw(current, 635, 407, 0, 0.7, 0.7)
			else
				love.graphics.draw(selectable, 635, 407, 0, 0.7, 0.7)
			end
			break
		end
	end
end

function S.mouseEvents()
	for key, value in pairs(s_data.settingBlobs) do
		if value.isChosen == false then
			S.image = selectable
			S.x = 635
			S.y = 407
			if s_data.isClicked(S, 0.7, 0.7, mouseX, mouseY) then
				chosen = value.index
				value.isChosen = true
				s_data.ballSelected = chosen
				-- break
				goto continue
			end
		end
		::continue::
	end

	for key, value in pairs(s_data.settingNavs) do
		hovering = false
		if s_data.isHovered(value, value.sx, value.sy, mouseX, mouseY) then
			hovering = true
			goto continue
		end
	end

	if s_data.isHovered(s_data.settingExit.back, 1, 1, mouseX, mouseY) then
		hovering = true
		goto continue
	end

	for key, value in pairs(s_data.settingKeys) do
		hovering = false
		if s_data.isHovered(value, value.sx, value.sy, mouseX, mouseY) then
			hovering = true
			break
		end
	end
	::continue::
end

function S.load()
	selected = 1
	chosen = 1
	hovering = false
	settingBG = love.graphics.newImage("Images/pauseImage/pauseBG.png")
	settingPanel = love.graphics.newImage("Images/pauseImage/pauseBG.png")
	volBtn = love.graphics.newImage("Images/settingImage/pauseBG.png")
	exitBtn = love.graphics.newImage("Images/settingImage/s_exit.png")
	hillsmile = love.graphics.newImage("Images/settingImage/hillsm.png")
	hilltop = love.graphics.newImage("Images/settingImage/hillto.png")
	current = love.graphics.newImage("Images/settingImage/current.png")
	selectable = love.graphics.newImage("Images/settingImage/selective.png")

	S.myFont = love.graphics.newFont("Images/menuImage/PG.otf", 26)
	-- love.graphics.setFont(S.myFont)

	S.cursorImage = love.graphics.newImage("Images/menuImage/cursor.png")
	S.pointerImage = love.graphics.newImage("Images/menuImage/pointer.png")

	-- love.mouse.setVisible(false)
end

function S.update(dt)
	mouseX, mouseY = love.mouse.getPosition()
	love.graphics.setFont(S.myFont)
	-- Mouse Selection events
end

function S.draw()
	love.graphics.push()
	love.graphics.draw(settingBG, 50, 50, 0, 2.5, 2.5)
	love.graphics.draw(settingPanel, 400, 50, 0, 3, 4)
	S.printNavButtons()
	S.printBlobs()
	love.graphics.draw(volBtn, 200, 390, 0, 1.3, 1.3)
	love.graphics.draw(exitBtn, 50, 421, 0, 1, 1)
	S.hills()
	S.mouseEvents()
	if hovering then
		love.graphics.draw(S.pointerImage, mouseX, mouseY, 0, 1.5, 1.5)
	else
		love.graphics.draw(S.cursorImage, mouseX, mouseY, 0, 1.5, 1.5)
	end
	love.graphics.pop()
end

return S
