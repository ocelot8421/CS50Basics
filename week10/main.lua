--debugger
if arg[2] == "debug" then
    require("lldebugger").start()
end



function love.draw()
    love.graphics.print("Hello World!", 100, 100)
end


example = function ()
    print("Hello World!")
end


function example2()
    print("Hello World!")
end


example()
example2()


--errorhandler
local love_errorhandler = love.errhand

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end