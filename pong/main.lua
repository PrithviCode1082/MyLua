-- local Game = require("game")

function printGraphics()
    love.graphics.draw(menuBG, 0, 0, 0, 0.8, 0.7)
    love.graphics.draw(sunBG, 40, 20, 0, 1, 1)
    love.graphics.draw(panelBG1, 320, 120, 0, 2, 1.5)
    love.graphics.draw(panelBG2, 570, 50, 0, 2, 1.5)
    love.graphics.draw(panelBG3, 570, 220, 0, 2, 1.5)
    love.graphics.draw(exit, 30, 470, 0, 2, 1.5)

    love.graphics.setColor(1, 1, 0, 0.5)
    love.graphics.setFont(customFont)
    love.graphics.print("PONG", 500, 470, 0, 1, 1)
    love.graphics.setColor(1, 1, 1)

    love.graphics.setColor(0.321, 0.718, 0.533)
    love.graphics.setFont(customMessageFont)
    love.graphics.print("Start", 370, 137, 0, 1, 1)
    love.graphics.print("Continue", 600, 68, 0, 1, 1)
    love.graphics.print("Settings", 600, 235, 0, 1, 1)
    love.graphics.setColor(1, 1, 1)

    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Quit", 93, 485, 0, 1, 1)
    love.graphics.setColor(1, 1, 1)
end

function printMessage()
    love.graphics.setColor(0.321, 0.718, 0.533)
    love.graphics.setFont(customMessageFont)
    love.graphics.print("Start", 370, 137, 0, 1, 1)
    love.graphics.print("Continue", 600, 68, 0, 1, 1)
    love.graphics.print("Settings", 600, 235, 0, 1, 1)
    love.graphics.setColor(1, 1, 1)

    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Quit", 93, 485, 0, 1, 1)
    love.graphics.setColor(1, 1, 1)
end

function love.load()
    love.window.setTitle("PONG")
    -- Images
    menuBG = love.graphics.newImage('Images/menuImage/menuForest.png');
    sunBG = love.graphics.newImage('Images/menuImage/sun.png')
    panelBG1 = love.graphics.newImage('Images/menuImage/panel.png')
    panelBG2 = love.graphics.newImage('Images/menuImage/panel.png')
    panelBG3 = love.graphics.newImage('Images/menuImage/panel.png')
    exit = love.graphics.newImage('Images/menuImage/exit.png')

    -- Font
    customFont = love.graphics.newFont("Images/menuImage/PG.otf", 80)
    customMessageFont = love.graphics.newFont("Images/menuImage/PG.otf", 40)

end

function love.update(dt)

end

function love.draw()
    printGraphics()
    printMessage()
    
end
