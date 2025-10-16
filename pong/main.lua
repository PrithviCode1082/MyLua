local Game = require("game")
local Menu = require("menu")
local pauseMenu = require("pauseMenu")
local settings = require("settings")
local scoreBRD = require("scoreBoard")
local data = require("data.data")

function returner(state)
	if state == "Menu" then
		return Menu
	elseif state == "Game" then
		return Game
	elseif state == "Pause" then
		return pauseMenu
	elseif state == "Setting" then
		return settings
	elseif state == "Score" then
		return scoreBRD
	end
end

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
	scoreBRD.load()
end

function love.update(dt)
	returner(data.state).update(dt)
end

function love.draw()
	returner(data.state).draw()
end
