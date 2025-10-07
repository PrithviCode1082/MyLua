local Game = require("game")
local Menu = require("menu")

function love.load()
	Menu.load()
	Game.load()
end

function love.update(dt)
	if Menu.isClicked and Menu.clickedText == "Start" then
		Game.update(dt)
	else
		Menu.update(dt)
	end
end

function love.draw()
	if Menu.isClicked and Menu.clickedText == "Start" then
		Game.draw()
	else
		Menu.draw()
	end
end
