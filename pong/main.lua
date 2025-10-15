local ps_data = require("data.data")

function printPlayers()
	love.graphics.setColor(0, 0, 0)
	love.graphics.print("Player 1", 160, 160, 0, 1.5, 1.5)
	love.graphics.print("Player 2", 530, 160, 0, 1.5, 1.5)
	love.graphics.setColor(1, 1, 1)
end

function printScores()
	love.graphics.draw(ps_data.p1Image, 150, 50, 0, 0.5, 0.5)
	love.graphics.draw(ps_data.p2Image, 600, 50, 0, 0.5, 0.5)
	--
end

function love.load()
	sb_panel_1 = love.graphics.newImage("Images/scoreImage/panel.png")
	sb_panel_2 = love.graphics.newImage("Images/scoreImage/panel.png")

	scoreFont = love.graphics.newFont("Images/menuImage/PG.otf", 25)
end

function love.update(dt)
	love.graphics.setFont(scoreFont)
end

function love.draw()
	love.graphics.draw(sb_panel_1, 50, 80, 0, 2.7, 3)
	love.graphics.draw(sb_panel_2, 420, 80, 0, 2.7, 3)
	printPlayers()
	printScores()
end
