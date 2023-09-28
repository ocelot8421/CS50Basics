require "sprites.sprite"

Dog = Sprite:extend()

function Dog:new(path, x, y, leashLength, scale)
    Dog.super.new(self, path, x, y, scale)
    self.leashLengthMax = 300
    self.leashLength = leashLength
    self.y = self.y + self.leashLength
    self.posAngle = 0
    self.speed = 200
    self.speedVertical = 100
end

function Dog:update(dt, girlX, girlY)
    self.posAngle = math.atan2(self.x - girlX, self.y - girlY)
    --self.leashLength = math.sqrt(math.pow(self.x - girlX, 2) + math.pow(self.y - girlY, 2))
    if love.keyboard.isDown("left") and self.posAngle / math.pi * 180 > -90 then
        self.x = self.x - self.leashLength * math.cos(self.posAngle) * dt
        --self.y = self.y + self.leashLength * math.sin(self.posAngle) * dt
        self.posAngle = self.posAngle + math.rad(1)
    elseif love.keyboard.isDown("right") and self.posAngle / math.pi * 180 < 90 then
        self.x = self.x + self.leashLength * math.cos(self.posAngle) * dt
        --self.y = self.y - self.leashLength * math.sin(self.posAngle) * dt
        self.posAngle = self.posAngle - math.rad(1)
    end
 
    --if love.keyboard.isDown("down") then
    --    self.y = math.min(self.y + self.speedVertical * dt, self.leashLengthMax)
    --else
    --    self.y = self.y - self.speedVertical * dt
    --end
end
