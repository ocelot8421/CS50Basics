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
    if love.keyboard.isDown("left") and self.posAngle / math.pi * 180 > -90 then
        self.x = self.x - self.leashLength * math.cos(self.posAngle) * dt
        self.posAngle = self.posAngle + math.rad(1)
    elseif love.keyboard.isDown("right") and self.posAngle / math.pi * 180 < 90 then
        self.x = self.x + self.leashLength * math.cos(self.posAngle) * dt
        self.posAngle = self.posAngle - math.rad(1)
    end

    Dog.super.update(self, dt)
end

function Dog:draw()
    
    -- draws the picture
    love.graphics.setColor(1,1,1)
    Dog.super.draw(self)
    love.graphics.print("Terrier: " ..self.painPoint, 20, 30)
end
