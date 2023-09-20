----debugger
--if arg[2] == "debug" then
--    require("lldebugger").start()
--end


--function love.load()
--    x = 30
--    y = 50
--end


--function  love.draw()
--    love.graphics.rectangle("line", x, y, 100, 100)
--end


--function love.keypressed(key)
--    if key == "space" then
--        x = math.random(100, 500)
--        y = math.random(100, 500)
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