Sprite = Object:extend()

function Sprite:new(path, x, y, scale)
    self.img = love.graphics.newImage(path)
    self.x = x
    self.y = y
    self.angle = 0
    self.scale = scale
    self.offsetX = self.img:getWidth() / 2
    self.offsetY = self.img:getHeight() / 2

end

function Sprite:draw()
    love.graphics.draw(self.img, self.x, self.y, self.angle, self.scale, self.scale, self.offsetX, self.offsetY)
end