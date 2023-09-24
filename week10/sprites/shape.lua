Shape = Object:extend()

function Shape:new(x)
    self.x = x
    self.y = 400
    self.speed = 100
end

function Shape:update(dt, leashLength, dogX, dogY, girlX, girlY)
    --print(posAngleDeg)
    self.y = self.y - (dogY - girlY) / leashLength * dt * self.speed
end