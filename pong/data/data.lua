local M = {}

M.buttons = {
    Start = {
        image = love.graphics.newImage("Images/menuImage/panel.png"),
        message = {
            text = "Start",
            x = 370,
            y = 137
        },
        x = 320,
        y = 120,
        isHovered = false,
        isClicked = false
    },
    Continue = {
        image = love.graphics.newImage("Images/menuImage/panel.png"),
        message = {
            text = "Continue",
            x = 600,
            y = 68
        },
        x = 570,
        y = 50,
        isHovered = false,
        isClicked = false
    },
    Settings = {
        image = love.graphics.newImage("Images/menuImage/panel.png"),
        message = {
            text = "Settings",
            x = 600,
            y = 240
        },
        x = 570,
        y = 220,
        isHovered = false,
        isClicked = false
    },
    exit = {
        image = love.graphics.newImage("Images/menuImage/exit.png"),
        message = {
            text = "Exit",
            x = 93,
            y = 487
        },
        x = 30,
        y = 470,
        isHovered = false,
        isClicked = false
    }
}

-- In your load function
M.bobbingChars = { -- ch1
{
    img = love.graphics.newImage("Images/menuImage/hug.png"),
    -- x = 420,
    -- y = 420,
    x = 380,
    y = 30,
    amplitude = 10,
    speed = 1.2
}, -- ch2
{
    img = love.graphics.newImage("Images/menuImage/hpi.png"),
    -- x = 650,
    -- y = 420,
    x = 480,
    y = 220,
    amplitude = 8,
    speed = 0.9
}, -- ch3
{
    img = love.graphics.newImage("Images/menuImage/hup.png"),
    x = 360,
    y = 330,
    amplitude = 12,
    speed = 1
}, -- ch4
{
    img = love.graphics.newImage("Images/menuImage/huy.png"),
    x = 650,
    y = 350,
    amplitude = 10,
    speed = 1.1
}, -- ch5
{
    img = love.graphics.newImage("Images/menuImage/heart.png"),
    x = 535,
    y = 400,
    amplitude = 15,
    speed = 0.8
}}

return M
