function love.load()
    x = 0
    y = 0
    Data = 0
    love.window.setTitle("Love Game")
    love.graphics.setBackgroundColor(1, 1, 1)
    love.graphics.setColor(0, 0, 0)
end

function love.update(dt)
    x = x + 1
    Data = Data + (dt * 1)
end

function love.draw()
    love.graphics.circle("fill", x, y, 50, 50)  
    love.graphics.setColor(0, 1, 0)

    love.graphics.print("This is a statement", 200, 200)
    love.graphics.print(Data, 300, 300)
end