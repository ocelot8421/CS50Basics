Sprite = Object:extend()

function Sprite:new(path, x, y, scale)
    self.img = love.graphics.newImage(path)
    self.x = x
    self.y = y
    self.angle = 0
    self.scale = scale
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.offsetX = self.img:getWidth() / 2
    self.offsetY = self.img:getHeight() / 2

    -- path behind the girl
    self.track = {}
    self.trackLength = 500
    for i=self.trackLength,1,-1 do
        table.insert(self.track, nil)
    end
end

function Sprite:draw()
    love.graphics.draw(self.img, self.x, self.y, self.angle, self.scale, self.scale, self.offsetX, self.offsetY)

end