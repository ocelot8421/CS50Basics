require "sprites.sprite"

Dog = Sprite:extend()

function Dog:new(path, x, y, leashLength, scale)
    Dog.super.new(self, path, x, y, scale)
    self.leashLength = leashLength
    self.y = self.y + self.leashLength
    self.posAngle = 0
    self.speed = 200
    self.speedVertical = 100
end

function Dog:update(dt, girlX, girlY)
    if love.keyboard.isDown("left") then
        self.x = self.x - self.speed * math.cos(self.posAngle) * dt
        self.y = self.y - self.speed * math.sin(self.posAngle) * dt
        self.posAngle = self.posAngle + math.rad(1)
    elseif love.keyboard.isDown("right") then
        self.x = self.x + self.speed * math.cos(self.posAngle) * dt
        self.y = self.y - self.speed * math.sin(self.posAngle) * dt
        self.posAngle = self.posAngle - math.rad(1)
        --self.y = self.y + math.sqrt(math.pow(self.leashLength, 2) + math.pow(self.x, 2))
    end

    print(self.x .." ".. self.y .." ".. self.posAngle)

    --if love.keyboard.isDown("down") then
    --    self.y = self.y + self.speedVertical * dt
    --else love.keyboard.isDown("space")
    --    self.y = self.y - self.speedVertical * dt
    --end
end