--debugger
if arg[2] == "debug" then
    require("lldebugger").start()
end


function love.load()
    x = 100
    y = 100
end

function love.update(dt)
    if love.keyboard.isDown("right") then
        x = x + 500 * dt
    elseif love.keyboard.isDown("left") then
        x = x - 500 * dt
    elseif love.keyboard.isDown("down") then
        y = y + 500 * dt
    elseif love.keyboard.isDown("up") then
        y = y - 500 * dt
    end
end


function love.draw()
    love.graphics.rectangle("line", x, y, 200, 150)
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