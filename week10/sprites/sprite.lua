Sprite = Object:extend()

function Sprite:new(path, x, y, scale)
    self.img = love.graphics.newImage(path)
    print(path)
    self.x = x
    self.y = y
    self.angle = 0
    self.scale = scale
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
end

function Sprite:draw()
    love.graphics.draw(self.img, self.x, self.y, self.angle, self.scale, self.scale, self.width/2, self.height/2)
end