require "sprites.leash"

StopWatch = Object:extend()

function StopWatch:new(x)
    self.start = love.timer.getTime()
    self.finish = nil
    self.flag = false
end

function StopWatch:update()
    if leash.damaged and not self.flag then
        self.finish = love.timer.getTime()
        self.flag = true
    end
end