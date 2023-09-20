----debugger
--if arg[2] == "debug" then
--    require("lldebugger").start()
--end

--a = 300
--b = 300

-- function love.load()
--    listOfRectangles = {}
--end

--function createRect(a, b)
--    rect = {}
--    rect["width"] = 2
--    rect.height = 2
--    rect.x = a
--    rect.y = b
--    rect.speed = 100

--    table.insert(listOfRectangles, rect)
--end


--function love.update(dt)
--    if love.keyboard.isDown("a") then
--        for i, rect in ipairs(listOfRectangles) do
--            rect.x = rect.x + rect.speed * dt
--        end
--        createRect(a, b)
--    elseif love.keyboard.isDown("d") then
--        for i, rect in ipairs(listOfRectangles) do
--            rect.x = rect.x - rect.speed * dt
--        end
--        createRect(a, b)
--    end
    
--    if love.keyboard.isDown("w") then
--        for i, rect in ipairs(listOfRectangles) do
--            rect.y = rect.y + rect.speed * dt
--        end
--        createRect(a, b)
--    elseif love.keyboard.isDown("s") then
--        for i, rect in ipairs(listOfRectangles) do
--            rect.y = rect.y - rect.speed * dt
--        end
--        createRect(a, b)
--    end  
--end


--function love.draw()
--    for i,rect in ipairs(listOfRectangles) do
--        love.graphics.rectangle("line", rect.x, rect.y, rect.width, rect.height)
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