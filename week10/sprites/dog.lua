require "sprites.sprite"

Dog = Sprite:extend()

function Dog:new(path, x, y, scale)
    Dog.super.new(self, path, x, y, scale)
    self.speed = 200
    self.speedVertical = 100
end

function Dog:update(dt)
    if love.keyboard.isDown("left") then
        self.x = self.x - self.speed * dt
    elseif love.keyboard.isDown("right") then
        self.x = self.x + self.speed * dt
    end

    if love.keyboard.isDown("down") then
        self.y = self.y + self.speedVertical * dt
    else love.keyboard.isDown("space")
            self.y = self.y - self.speedVertical * dt
    end
end