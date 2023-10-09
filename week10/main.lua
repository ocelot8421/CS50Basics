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
    girl = Girl("resources/girl.png", originX, originY, 1, leashLength, 1)
 
    -- terrier
    require "sprites.dog"
    terrier = Dog("resources/dog.png", originX, originY, leashLength, 0.35)
    --terrier = Dog("resources/dog.png", originX, originY, leashLength, 1)

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
        listOfTrees[i]:update(dt, girl, terrier)
    end
    leash:update(terrier.x, terrier.y, girl.x, girl.y)
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

    --for i = 1, 6, 1 do
    --    love.graphics.line(0, i * 100, 800, i * 100)  
    --end
    --love.graphics.line(terrier.x - terrier.offsetX * terrier.scale, 0, terrier.x - terrier.offsetX * terrier.scale, 600)    
    --love.graphics.line(terrier.x + terrier.offsetX * terrier.scale, 0, terrier.x + terrier.offsetX * terrier.scale, 600)    
    --love.graphics.line(0, terrier.y - terrier.offsetY * terrier.scale, 800, terrier.y - terrier.offsetY * terrier.scale)    
    --love.graphics.line(0, terrier.y + (terrier.height - terrier.offsetY) * terrier.scale, 800, terrier.y + (terrier.height - terrier.offsetY) * terrier.scale)    
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