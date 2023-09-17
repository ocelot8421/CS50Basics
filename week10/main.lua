--debugger
if arg[2] == "debug" then
    require("lldebugger").start()
end

a = 300
--aq = {0.2929, 1, 0.7071, 1, -0.2929, -1, -0.7071, -1}
aq = {0.2929, 0.7071, 0.7071, 0.2929, -0.2929, -0.7071, -0.7071, -0.2929}
b = 300
--bq = {0.7071, 1, -0.2929, -1, -0.7071, -1, 0.2929, 1}
bq = {1 - 0.2929, 0.2929, -0.2929, -1 + 0.2929, -0.7071, -0.2929, 0.2929, 0.7071}
c = 1
d = 0
e = 1
q = 0

 function love.load()
    listOfRectangles = {}
end

function createRect(a, b)
    rect = {}
    rect["width"] = 2
    rect.height = 2
    rect.x = a
    rect.y = b
    rect.speed = 100

    table.insert(listOfRectangles, rect)
end

function love.keypressed(key)
    if key == "space" then
        createRect(a, b)
        a = a + c * 1 * aq[q % 8 + 1]
        b = b + c * 1 * bq[q % 8 + 1]
        
        q = q + 1
    end
    if q % 2 == 0 then
        e = c
        c = c + d
        d = e
    end
end


function love.update(dt)
    if love.keyboard.isDown("d") then
        for i, rect in ipairs(listOfRectangles) do
            rect.x = rect.x + rect.speed * dt
        end
    elseif love.keyboard.isDown("a") then
        for i, rect in ipairs(listOfRectangles) do
            rect.x = rect.x - rect.speed * dt
        end
    end
    
    if love.keyboard.isDown("s") then
        for i, rect in ipairs(listOfRectangles) do
            rect.y = rect.y + rect.speed * dt
        end
    elseif love.keyboard.isDown("w") then
        for i, rect in ipairs(listOfRectangles) do
            rect.y = rect.y - rect.speed * dt
        end
    end  
end


function love.draw()
    for i,rect in ipairs(listOfRectangles) do
        love.graphics.rectangle("line", rect.x, rect.y, rect.width, rect.height)
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