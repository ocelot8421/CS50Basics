Shape = Object:extend()

function Shape:new(x)
    self.x = x
    self.y = 400
    self.speed = 100
end

function Shape:update(dt)
    self.y = self.y - self.speed * dt
end