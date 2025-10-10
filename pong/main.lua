local Game = require("game")
local Menu = require("menu")
local pauseMenu = require("pauseMenu")

local events = { Game, Menu, pauseMenu }

function love.load()
	-- Menu.load()
	-- Game.load()
	-- pauseMenu.load()
	events[1].load()
end

function love.update(dt)
	-- if Menu.isClicked and Menu.clickedText == "Start" then
	-- 	Game.update(dt)
	-- else
	-- 	Menu.update(dt)
	-- end
	-- pauseMenu.update(dt)
	events[1].update(dt)
end

function love.draw()
	-- if Menu.isClicked and Menu.clickedText == "Start" then
	-- 	Game.draw()
	-- else
	-- 	Menu.draw()
	-- end
	-- pauseMenu.draw()
	events[1].draw()
end
