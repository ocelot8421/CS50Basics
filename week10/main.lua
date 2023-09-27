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
    listOfTrees = {}
    numOfTrees = 1
    for i=1,numOfTrees do
        tree = Circle(math.random(5, 40), math.random(0, love.graphics.getWidth( )))
        table.insert(listOfTrees, tree)
    end

    leashLengthMax = 300
    leashLength = leashLengthMax

    -- girl
    require "sprites.girl"
    originX = 400
    originY = 100
    girl = Girl("resources/girl.png", originX, originY, 1, leashLength)
 
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
    terrier:update(dt, girl.x, girl.y)
    girl:update(dt, terrier.x, terrier.y)
    for i=1,numOfTrees do
        listOfTrees[i]:update(dt, leashLength, terrier.x, terrier.y, girl.x, girl.y)
        if checkCollision(terrier, listOfTrees[i]) or checkCollision( girl, listOfTrees[i]) then
            love.graphics.setBackgroundColor(255/255, 200/255, 40/255, 127/255)
        else
            love.graphics.setBackgroundColor(0,0,0,0)
               
        end
    end
    leash:update(terrier.x, terrier.y, girl.x, girl.y)
end


function checkCollision(a, b)
    flag = false
    local room_x = math.max(a.x, a.x + a.width, b.x, b.x+b.width) - math.min(a.x, a.x + a.width, b.x, b.x+b.width)
    local room_y = math.max(a.y, a.y + a.height, b.y, b.y+b.height) - math.min(a.y, a.y + a.height, b.y, b.y+b.height)
    if  room_x < a.width + b.width and  room_y < a.height + b.height then
        flag = true
    end
    print(flag)
    return flag
end


function love.draw()
    -- shapes
    for i=1,numOfTrees do
        listOfTrees[i]:draw()
    end
    
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