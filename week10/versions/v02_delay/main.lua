----debugger
--if arg[2] == "debug" then
--    require("lldebugger").start()
--end


--function love.load()
--    tick = require "tick"
--    drawRectangle = false
--    tick.delay(
--        function ()
--            drawRectangle = true
--        end,
--        2
--    )
--end


--function love.update(dt)
--    tick.update(dt)
--end


--function  love.draw()
--    if drawRectangle then
--        love.graphics.rectangle("fill", 100, 100, 300, 200)
--    end
--end



----errorhandler
--local love_errorhandler = love.errhand

--function love.errorhandler(msg)
--    if lldebugger then
--        error(msg, 2)
--    else
--        return love_errorhandler(msg)
--    end
--end