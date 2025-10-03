-- Collision
function checkCollision(cx, cy, radius, rx, ry, rw, rh)
    -- Find the closest point on the rectangle to the circle's center
    local closestX = math.max(rx, math.min(cx, rx + rw))
    local closestY = math.max(ry, math.min(cy, ry + rh))

    -- Calculate the distance between the circle's center and the closest point
    local distanceX = cx - closestX
    local distanceY = cy - closestY
    local distanceSquared = (distanceX * distanceX) + (distanceY * distanceY)

    -- Check if the distance is less than or equal to the radius
    return distanceSquared <= (radius * radius)
end

-- Handle collition with paddles, walls 
function handleCollision()
    if ballY - 20 <= 20 or ballY + 20 >= love.graphics.getHeight() - 25 then
        ballSpeedY = ballSpeedY * -1
    end

    if checkCollision(ballX, ballY, 20, pad1X, pad1Y, 30, 130) then
        padSound:play()
        ballSpeedX = ballSpeedX * -1
    end

    if checkCollision(ballX, ballY, 20, pad2X, pad2Y, 30, 130) then
        ballSpeedX = ballSpeedX * -1
        padSound:play()
    end

    if ballX <= 0 then
        ballX = 400
        ballY = 270
        p2Score = p2Score + 1
        pointSound:play()
        score2Image = love.graphics.newImage('Points/img_'..p2Score..'.png')
    end
    if ballX >= 800 then
        ballX = 400
        ballY = 270
        p1Score = p1Score + 1
        pointSound:play()
        score1Image = love.graphics.newImage('Points/img_'..p1Score..'.png')
    end
end

-- Scoreboard
function scoreBoard()
    love.graphics.draw(score1Image, 150, 50, 0 , 0.5, 0.5)
    love.graphics.draw(score2Image, 600, 50, 0 , 0.5, 0.5)
end

-- keyboard Events
function keyboardEvents(dt)
    if love.keyboard.isDown('w') and pad1Y > 20 then
        pad1Y = pad1Y - (dt * 300)
    elseif love.keyboard.isDown('s') and pad1Y < 445 then
        pad1Y = pad1Y + (dt * 300)
    end
    if love.keyboard.isDown('up') and pad2Y > 20 then
        pad2Y = pad2Y - (dt *300)
    elseif love.keyboard.isDown('down') and pad2Y < 445 then
        pad2Y = pad2Y + (dt * 300)
    end
end

-- Paddles
function pad(x, y)
    return love.graphics.rectangle("fill", x, y, 30, 130)
end

-- Ball
function ballMove(dt)
    ballX = ballX + (ballSpeedX * dt)
    ballY = ballY + (ballSpeedY * dt)
end

-- Walls
function wall(x, y, r)
    return love.graphics.draw(wallImage, x, y, r, 1, 1)
end

-- Game functions
function love.load()
    love.window.setTitle("Ping Pong")
    ballX = 400
    ballY = 270

    base = 100
    incr = 128
    count = 3
    wallX = 100
    wallY = 25

    p1Score = 0
    p2Score = 0

    ballSpeedX = 150 -- Pixels per second
    ballSpeedY = 150

    pad1X = 10;
    pad1Y = 10;

    pad2X = 760;
    pad2Y = 10;

    -- Images
    wallImage = love.graphics.newImage('Images/wall.png')
    padImage = love.graphics.newImage('Images/bricks_brown.png')
    ballImage = love.graphics.newImage('Images/hud_player_purple.png')
    score1Image = love.graphics.newImage('Points/img_'..p1Score..'.png')
    score2Image = love.graphics.newImage('Points/img_'..p1Score..'.png')
    bgImage = love.graphics.newImage('Images/bg_trees.png')

    -- audio 
    padSound = love.audio.newSource('audio/pad.ogg', 'static')
    pointSound = love.audio.newSource('audio/point.ogg', 'static')
end

function love.update(dt)
    ballMove(dt)
    keyboardEvents(dt)
    handleCollision()
end

function love.draw()
    love.graphics.draw(bgImage, 0, 0, 0, 1.7, 1.5)

    pad(pad1X, pad1Y)
    love.graphics.draw(padImage, pad1X - 5, pad1Y, 0, 0.4, 1.1)

    pad(pad2X, pad2Y)
    love.graphics.draw(padImage, pad2X - 15, pad2Y, 0, 0.4, 1.1)

    love.graphics.draw(ballImage, ballX - 30, ballY - 30, 0, 0.5, 0.5)

    for i = 1, 7 do
        wall((base + (i - 1) * incr), wallY, 3.14)
    end

    wall(0, 575, 0)
    for i = 1, 7 do
        wall((base + (i - 1) * incr), 575, 0)
    end

    scoreBoard()
end
