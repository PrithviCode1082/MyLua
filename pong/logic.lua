local Game = {}

-- keyboard Events
function Game.keyboardEvents(pad1X, pad1Y, pad2X, pad2Y)
    if love.keyboard.isDown('w') and pad1Y > 10 then
        pad1Y = pad1Y - 4
    elseif love.keyboard.isDown('s') and pad1Y < 460 then
        pad1Y = pad1Y + 4
    end
    if love.keyboard.isDown('up') and pad2Y > 10 then
        pad2Y = pad2Y - 4
    elseif love.keyboard.isDown('down') and pad2Y < 460 then
        pad2Y = pad2Y + 4
    end
end

-- Paddles
function Game.pad(x, y)
    love.graphics.setColor(1, 1, 1)
    return love.graphics.rectangle("fill", x, y, 30, 130)
end

-- Ball
function Game.ball(x, y)
    love.graphics.setColor(1, 0, 0)
    return love.graphics.circle("fill", x, y, 20, 20)
end

function ballMove(ballX, ballY, ballDirection, dt)
    if ballDirection == "Right" then
        ballX = ballX + (dt * 130)
        ballY = ballY + (dt * 130)
    elseif ballDirection == "Left" then
        ballX = ballX - (dt * 130)
        ballY = ballY - (dt * 130)             
    end
end

return Game
