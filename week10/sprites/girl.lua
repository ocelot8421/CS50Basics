require "sprites.sprite"

Girl = Sprite:extend()

function Girl:new(path, x, y, speed, scale)
    Girl.super.new(self, path, x, y, scale)
    self.speed = speed
    self.amplitudo = 100
    self.time = 0
    self.posAngle = 0
end

function Girl:update(dt, dogX, dogY)
    if self.posAngle < 3000 then
        self.x = self.x - self.amplitudo * math.pow(2.7182818284, -0.1 * dt * self.posAngle) * math.cos(math.rad(self.posAngle)) * dt
        self.posAngle = self.posAngle + 1
        print(self.posAngle)
        print(math.pow(2.7182818284, -0.3 * dt * self.posAngle))
    end
    
end

function Girl:draw(x, y)
    self.offsetX = x
    self.offsetY = y
    Girl.super.draw(self)
end

