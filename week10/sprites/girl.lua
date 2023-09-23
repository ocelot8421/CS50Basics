require "sprites.sprite"

Girl = Sprite:extend()

function Girl:new(path, x, y, speed, scale)
    Girl.super.new(self, path, x, y, scale)
    self.speed = speed
    
end

function Girl:update(dt, dogX, dogY)
    self.posAngle = math.atan2(dogX - self.x, dogY - self.y)
    if self.posAngle / math.pi * 180 > 0.5 then
        print(self.posAngle / math.pi * 180)
        self.x = self.x + self.speed * math.cos(self.posAngle) * dt
        --self.y = self.y - self.speed * math.sin(self.posAngle)
        self.posAngle = self.posAngle + math.rad(1)
    elseif self.posAngle / math.pi * 180 < -0.5 then
        print(self.posAngle / math.pi * 180)
        self.x = self.x - self.speed * math.cos(self.posAngle) * dt
        --self.y = self.y - self.speed * math.sin(self.posAngle)
        self.posAngle = self.posAngle - math.rad(1)
    end
end

function Girl:draw(x, y)
    self.offsetX = x
    self.offsetY = y
    Girl.super.draw(self)
end

