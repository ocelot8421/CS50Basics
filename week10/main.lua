--debugger
if arg[2] == "debug" then
    require("lldebugger").start()
end


function love.load()
    -- shapes
    Object = require "classic"
    require "sprites.shape"
    require "sprites.circle"
    require "sprites.rectangle"
    math.randomseed(os.clock()*100000000000)
    r1 = Circle(25, math.random(0, love.graphics.getWidth( )))
    r2 = Circle(25, math.random(0, love.graphics.getWidth( )))

    leashLengthMax = 300
    leashLength = leashLengthMax

    -- girl
    require "sprites.girl"
    originX = 400
    originY = 100
    girl = Girl("resources/girl.png", originX, originY, 100, 1, leashLength)
 
    -- terrier
    require "sprites.dog"
    terrier = Dog("resources/dog.png", originX, originY, leashLength, 0.35)

    --leash
    require "sprites.leash"
    leash = Leash(originX, originY, originX, originY + leashLength)

end


function love.update(dt)
    posAngleRad = math.atan2(terrier.x - girl.x, terrier.y - girl.y)
    posAngleDeg = posAngleRad / math.pi * 180
    leashLength = math.sqrt(math.pow(terrier.x - girl.x, 2) + math.pow(terrier.y - girl.y, 2))
    r1:update(dt, leashLength, terrier.x, terrier.y, girl.x, girl.y)
    r2:update(dt, leashLength, terrier.x, terrier.y, girl.x, girl.y)
    terrier:update(dt, girl.x, girl.y)
    girl:update(dt, terrier.x, terrier.y)
    leash:update(terrier.x, terrier.y, girl.x, girl.y)
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

    -- sprites
    terrier:draw()
    girl:draw(76, 48)
    leash:draw()
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