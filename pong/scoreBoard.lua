local ps_data = require("data.data")
local SB = {}
local s_gm = require("game")

function SB.isClicked(btn)
	local mx, my = love.mouse.getPosition()
	local w, h = btn.image:getWidth() * 2, btn.image:getHeight() * 1.5
	return love.mouse.isDown(1) and mx > btn.x and mx < btn.x + w and my > btn.y and my < btn.y + h
end

function SB.printPlayers()
	love.graphics.setColor(0, 0, 0)
	love.graphics.print("Player 1", 140, 160, 0, 2, 2)
	love.graphics.print("Player 2", 510, 160, 0, 2, 2)
	love.graphics.setColor(1, 1, 1)
end

function SB.printBtn()
	for key, value in pairs(ps_data.ScoreboardBtn) do
		love.graphics.draw(value.image, value.x, value.y, 0, 1.9, 1.7)
		love.graphics.setColor(0.6, 0.345, 0.165)
		love.graphics.print(key, value.message.x, value.message.y, 0, 1.7, 1.7)
		love.graphics.setColor(1, 1, 1)
	end
end

function SB.printScores()
	love.graphics.draw(ps_data.p1Image, 150, 220, 0, 1, 1)
	love.graphics.draw(ps_data.p2Image, 530, 220, 0, 1, 1)
	--
end

function SB.printStars()
	local p1_base = 130
	local p2_base = 500
	for i = 1, ps_data.p1_score, 1 do
		love.graphics.draw(starImage, p1_base, 360, 0, 1, 1)
		p1_base = p1_base + 40
	end
	for i = 1, ps_data.p2_score, 1 do
		love.graphics.draw(starImage, p2_base, 360, 0, 1, 1)
		p2_base = p2_base + 40
	end
end

function SB.print_panels()
	love.graphics.draw(sb_panel_1, 50, 80, 0, 2.7, 3)
	love.graphics.draw(sb_panel_2, 420, 80, 0, 2.7, 3)
end

function SB.sb_mouseEvents()
	for key, btn in pairs(ps_data.ScoreboardBtn) do
		if ps_data.isHovered(btn, 1.7, 1.7, mouseX, mouseY) then
			love.graphics.draw(SB.pointerImage, mouseX, mouseY, 0, 1.5, 1.5)
			if SB.isClicked(btn) and key == "Menu" then
				s_gm.reset()
				ps_data.state = "Menu"
			end
			if SB.isClicked(btn) and key == "Restart" then
				s_gm.reset()
				ps_data.state = "Game"
			end
			goto continue
		end
	end
	love.graphics.draw(SB.cursorImage, mouseX, mouseY, 0, 1.5, 1.5)
	::continue::
end

function SB.load()
	sb_panel_1 = love.graphics.newImage("Images/scoreImage/panel.png")
	sb_panel_2 = love.graphics.newImage("Images/scoreImage/panel.png")

	scoreFont = love.graphics.newFont("Images/menuImage/PG.otf", 25)
	-- scoreFont = love.graphics.newFont("Fonts/Ubun/ubold.ttf", 25)

	restartBtn = love.graphics.newImage("Images/scoreImage/button.png")
	MenuBtn = love.graphics.newImage("Images/scoreImage/button.png")

	starImage = love.graphics.newImage("Images/scoreImage/yellow.png")

	-- Cursor
	SB.cursorImage = love.graphics.newImage("Images/menuImage/cursor.png")
	SB.pointerImage = love.graphics.newImage("Images/menuImage/pointer.png")

	love.mouse.setVisible(false)
end

function SB.update(dt)
	love.graphics.setFont(scoreFont)
	mouseX, mouseY = love.mouse.getPosition()
end

function SB.draw()
	SB.print_panels()
	SB.printPlayers()
	SB.printScores()
	SB.printBtn()

	SB.printStars()
	SB.sb_mouseEvents()
end

return SB
