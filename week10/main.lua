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
    numOfTrees = 8
    for i=1,numOfTrees do
        local tree = Circle(math.random(5, 40), math.random(0, love.graphics.getWidth( )))
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

    --leash
    require "sprites.leash"
    leash = Leash(originX, originY, originX, originY + leashLength)

end


function love.update(dt)
    terrier:update(dt, girl.x, girl.y)
    girl:update(dt, terrier.x, terrier.y)
    leash:update(terrier.x, terrier.y, girl.x, girl.y)
    for i=1,numOfTrees do
        listOfTrees[i]:update(dt, girl, terrier, leash)
    end
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