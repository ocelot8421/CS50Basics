require "sprites.sprite"

Girl = Sprite:extend()

function Girl:new(path, x, y, amplitudo, scale, leashLength)
    Girl.super.new(self, path, x, y, scale)
    self.leashLength = leashLength
    self.amplitudo = amplitudo
    self.time = 0
    self.posAngle = 0
end

function Girl:update(dt, dogX, dogY)
    if self.posAngle < 3000 then
        deltaX = self.amplitudo * math.pow(2.7182818284, -0.1 * dt * self.posAngle) * math.cos(math.rad(self.posAngle)) * dt
        self.x = self.x + deltaX -- original position
        self.y = self.y + leashLength - math.sqrt(math.pow(self.leashLength, 2) - math.pow(deltaX, 2))
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

