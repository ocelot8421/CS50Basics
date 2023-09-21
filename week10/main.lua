--debugger
if arg[2] == "debug" then
    require("lldebugger").start()
end


function love.load()
    -- shapes
    Object = require "classic"
    require "sprites.circle"
    require "sprites.rectangle"
    r1 = Circle(100, 500, 25)
    r2 = Circle(800, 500, 25)

    -- girl
    require "sprites.girl"
    girl = Girl("resources/girl.png", 400, 100, 1)
 

    -- terrier
    require "sprites.dog"
    terrier = Dog("resources/dog.png", 400, 400, 0.35)


end


function love.update(dt)
    r1:update(dt)
    r2:update(dt)
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

    
    -- little white sheep
    --love.graphics.draw(girlImg, 400, 100, 0, 1, 1, girlWidth/2, girlHeight/2)

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