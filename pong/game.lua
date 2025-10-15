local Game = {}
local g_data = require("data.data")

function Game.reset()
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

	pad1X = 10
	pad1Y = 10

	pad2X = 760
	pad2Y = 10

	score1Image = love.graphics.newImage("Points/img_" .. p1Score .. ".png")
	score2Image = love.graphics.newImage("Points/img_" .. p1Score .. ".png")
end

-- Collision
function Game.checkCollision(cx, cy, radius, rx, ry, rw, rh)
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

function Game.handleScore()
	g_data.p2_score = p2Score
	g_data.p1_score = p1Score

	score2Image = love.graphics.newImage("Points/img_" .. p2Score .. ".png")
	g_data.p2Image = love.graphics.newImage("Points/img_" .. p2Score .. ".png")

	score1Image = love.graphics.newImage("Points/img_" .. p1Score .. ".png")
	g_data.p1Image = love.graphics.newImage("Points/img_" .. p1Score .. ".png")

	if p1Score == 5 or p2Score == 5 then
		g_data.state = "Score"
	end
end

-- Handle collition with paddles, walls
function Game.handleCollision()
	if ballY - 20 <= 20 or ballY + 20 >= love.graphics.getHeight() - 25 then
		ballSpeedY = ballSpeedY * -1
		wallSound:play()
	end

	if Game.checkCollision(ballX, ballY, 20, pad1X, pad1Y, 30, 130) then
		padSound:play()
		ballSpeedX = ballSpeedX * -1
	end

	if Game.checkCollision(ballX, ballY, 20, pad2X, pad2Y, 30, 130) then
		ballSpeedX = ballSpeedX * -1
		padSound:play()
	end

	if ballX <= 0 then
		ballX = 400
		ballY = 270
		p2Score = p2Score + 1
		pointSound:play()
	end
	if ballX >= 800 then
		ballX = 400
		ballY = 270
		p1Score = p1Score + 1
		pointSound:play()
	end

	Game.handleScore()
end

-- Scoreboard
function Game.scoreBoard()
	love.graphics.draw(score1Image, 150, 50, 0, 0.5, 0.5)
	love.graphics.draw(score2Image, 600, 50, 0, 0.5, 0.5)
end

-- keyboard Events
function Game.keyboardEvents(dt)
	if love.keyboard.isDown("w") and pad1Y > 20 then
		pad1Y = pad1Y - (dt * 300)
	elseif love.keyboard.isDown("s") and pad1Y < 445 then
		pad1Y = pad1Y + (dt * 300)
	end
	if love.keyboard.isDown("up") and pad2Y > 20 then
		pad2Y = pad2Y - (dt * 300)
	elseif love.keyboard.isDown("down") and pad2Y < 445 then
		pad2Y = pad2Y + (dt * 300)
	end
end

-- Paddles
function Game.pad(x, y)
	return love.graphics.rectangle("fill", x, y, 30, 130)
end

-- Ball
function Game.ballMove(dt)
	ballX = ballX + (ballSpeedX * dt)
	ballY = ballY + (ballSpeedY * dt)
end

-- Walls
function Game.wall(x, y, r)
	return love.graphics.draw(wallImage, x, y, r, 1, 1)
end

-------------------------------- Game functions --------------------------------------
function Game.load()
	love.window.setTitle("Ping Pong")
	Game.reset()

	-- Images
	wallImage = love.graphics.newImage("Images/gameImage/wall.png")
	padImage = love.graphics.newImage("Images/gameImage/bricks_brown.png")
	-- ballImage = love.graphics.newImage("Images/gameImage/hud_player_purple.png")
	bgImage = love.graphics.newImage("Images/gameImage/bg_trees.png")

	-- audio
	wallSound = love.audio.newSource("audio/bong.ogg", "static")
	padSound = love.audio.newSource("audio/pad.ogg", "static")
	pointSound = love.audio.newSource("audio/point.ogg", "static")
end

function Game.update(dt)
	Game.ballMove(dt)
	Game.keyboardEvents(dt)
	Game.handleCollision()
end

function Game.draw()
	love.graphics.draw(bgImage, 0, 0, 0, 1.7, 1.5)

	Game.pad(pad1X, pad1Y)
	love.graphics.draw(padImage, pad1X - 5, pad1Y, 0, 0.4, 1.1)

	Game.pad(pad2X, pad2Y)
	love.graphics.draw(padImage, pad2X - 15, pad2Y, 0, 0.4, 1.1)

	for key, value in pairs(g_data.settingBlobs) do
		if value.index == g_data.ballSelected then
			love.graphics.draw(value.image, ballX - 30, ballY - 30, 0, 0.5, 0.5)
			break
		end
	end

	for i = 1, 7 do
		Game.wall((base + (i - 1) * incr), wallY, 3.14)
	end

	Game.wall(0, 575, 0)
	for i = 1, 7 do
		Game.wall((base + (i - 1) * incr), 575, 0)
	end

	Game.scoreBoard()
end

return Game
