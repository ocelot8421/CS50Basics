Shape = Object:extend()

function Shape:new(x)
    self.x = x
    self.y = math.random(30, 400)
    self.speed = 100
end

function Shape:update(dt)
    self.y = self.y - dt * self.speed
end