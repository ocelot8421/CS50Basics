--debugger
if arg[2] == "debug" then
    require("lldebugger").start()
end


function love.load()

    -- musica
    song = love.audio.newSource("resources/Limp Bizkit - Rollin (High-Quality Audio) [TubeRipper.com].ogg", "stream")
    song:play()
    -- shapes
    Object = require "classic"
    require "sprites.shape"
    require "sprites.circle"
    require "sprites.rectangle"
    require "assets.stopwatch"
    math.randomseed(os.clock()*100000000000)
    listOfTrees = {}
    numOfTrees = 8
    for i=1,numOfTrees do
        local tree = Circle(math.random(5, 40), math.random(0, love.graphics.getWidth( )))
        table.insert(listOfTrees, tree)
    end

    -- timer
    stopwatch = StopWatch()

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
    leash:update(dt, terrier.x, terrier.y, girl.x, girl.y, terrier, girl)
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

    -- game over on the screen
    if leash.damaged then
        stopwatch:update()
        love.graphics.print("GAME OVER", 200, 250, 0, 5, 5)
        love.graphics.setColor(1,1,1)
        local timer = stopwatch.finish - stopwatch.start
        local dem = girl.painPoint + terrier.painPoint
        love.graphics.print(string.format("%.1f seconds",timer), 210, 330)
        love.graphics.print(string.format("%.1f pain / sec", dem / timer), 210, 350)
    end
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