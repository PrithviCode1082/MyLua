local Game = require("game")
local Menu = require("menu")
local pauseMenu = require("pauseMenu")
local settings = require("settings")
local data = require("data.data")

function love.keypressed(key)
	if key == "escape" and data.state == "Game" then
		data.previousState = "Game"
		data.state = "Pause"
	end
end

function love.load()
	Menu.load()
	Game.load()
	pauseMenu.load()
	settings.load()
end

function love.update(dt)
	if data.state == "Menu" then
		Menu.update(dt)
	elseif data.state == "Game" then
		Game.update(dt)
	elseif data.state == "Pause" then
		pauseMenu.update(dt)
	elseif data.state == "Setting" then
		settings.update(dt)
	end
end

function love.draw()
	if data.state == "Menu" then
		Menu.draw()
	elseif data.state == "Game" then
		Game.draw()
	elseif data.state == "Pause" then
		pauseMenu.draw()
	elseif data.state == "Setting" then
		settings.draw()
	end
end
