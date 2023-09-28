require "sprites.shape"

Rectangle = Shape:extend()

function Rectangle:new(x, y, width, height)
    --self.x = x
    --self.y = y
    Rectangle.super.new(self, x, y) --can not use syntatic sugar
    self.width = width
    self.height = height
    self.speed = 100
end

function Rectangle:update(dt)
    self.x = self.x + self.speed * dt
end

function Rectangle:draw()
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end