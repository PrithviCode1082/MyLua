-- local Game = require("game")

function love.load()
    -- Images
    menuBG = love.graphics.newImage('Images/menuImage/menuForest.png');
    sunBG = love.graphics.newImage('Images/menuImage/sun.png')
    panelBG1 = love.graphics.newImage('Images/menuImage/panel.png')
    panelBG2 = love.graphics.newImage('Images/menuImage/panel.png')
    panelBG3 = love.graphics.newImage('Images/menuImage/panel.png')
    exit = love.graphics.newImage('Images/menuImage/exit.png')

    -- Font
    customFont = love.graphics.newFont("myfont.ttf", 24)
end

function love.update(dt)

end

function love.draw()
    love.graphics.draw(menuBG, 0, 0, 0, 0.8, 0.7)
    love.graphics.draw(sunBG, 40, 20, 0, 1, 1)
    love.graphics.draw(panelBG1, 320, 120, 0, 2, 1.5)
    love.graphics.draw(panelBG2, 570, 50, 0, 2, 1.5)
    love.graphics.draw(panelBG3, 570, 220, 0, 2, 1.5)
    love.graphics.draw(exit, 30, 470, 0, 2, 1.5)

    love.graphics.print("PONG", 500, 470, 0, 4, 4)
end
