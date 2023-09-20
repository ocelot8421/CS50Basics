--debugger
if arg[2] == "debug" then
    require("lldebugger").start()
end


function love.load()
    -- shapes
    Object = require "classic"
    require "rectangle"
    require "circle"
    r1 = Rectangle(100, 100, 200, 50)
    r2 = Circle(350, 80, 25)

    -- images
    myImage = love.graphics.newImage("resources/sheep.png")
    width = myImage:getWidth()
    height = myImage:getHeight()
    print(width .." ".. height)
end


function love.update(dt)
    r1:update(dt)
    r2:update(dt)
end


function love.draw()
    -- shapes
    r1:draw()
    r2:draw()

    -- big baby blue sheep
    love.graphics.setColor(137/255, 207/255, 240/255)
    love.graphics.draw(myImage, 100, 100, 0, 0.5, 0.5, -width/2, -height/2)
    
    -- little white sheep
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(myImage, 100, 100)

    -- little pink sheep
    love.graphics.setColor(250/255, 218/255, 221/255)
    love.graphics.draw(myImage, 100, 100, 0, 0.5, 0.5, -width/2, -height/2)
end


--errorhandler
local love_errorhandler = love.errhand

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end