--debugger
if arg[2] == "debug" then
    require("lldebugger").start()
end


function love.load()
    -- shapes
    Object = require "classic"
    require "sprites.circle"
    require "sprites.rectangle"
    math.randomseed(os.clock()*100000000000)
    r1 = Circle(25, math.random(0, love.graphics.getWidth( )))
    r2 = Circle(25, math.random(0, love.graphics.getWidth( )))

    -- girl
    require "sprites.girl"
    originX = 400
    originY = 100
    girl = Girl("resources/girl.png", originX, originY, 1)
 
    -- terrier
    require "sprites.dog"
    leashLength = 300
    terrier = Dog("resources/dog.png", originX, originY, leashLength, 0.35)
end


function love.update(dt)
    r1:update(dt)
    r2:update(dt)
    terrier:update(dt, originX, originY)
end


function checkCollision(a, b)
    local room_x = math.max(a.x, a.x + a.girlWidth, b.x, b.x+b.with) - math.min(a.x, a.x + a.girlWidth, b.x, b.x+b.girlWidth)
    local room_y = math.max(a.y, a.y + a.girlHeight, b.y, b.y+b.girlHeight) - math.min(a.y, a.y + a.girlHeight, b.y, b.y+b.girlHeight)
    return  room_x < a.girlWidth + b.girlWidth and  room_y < a.girlHeight + b.girlHeight
end


function love.draw()
    -- shapes
    r1:draw()
    r2:draw()

    girl:draw()

    -- terrierr
    terrier:draw()
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