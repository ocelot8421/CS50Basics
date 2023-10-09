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
    self.trackLength = 600
    for i=self.trackLength,1,-1 do
        table.insert(self.track, nil)
    end
end

function Sprite:update(dt)
    -- draws the path where was the sprite before. (x1, y1, x2, y2, x3, y3, ....)
    for i=self.trackLength,4,-2 do
        if self.track[i - 2] and self.track[i - 3] then
            self.track[i] = self.track[i - 2] - dt * 100 -- y coordinates
            self.track[i - 1] = self.track[i - 3] -- x coordinates
        end
    end
    self.track[1] = self.x
    self.track[2] = self.y
end

function Sprite:draw()
    love.graphics.draw(self.img, self.x, self.y, self.angle, self.scale, self.scale, self.offsetX, self.offsetY)
end

function Sprite:drawTrackLine()
    for i=1,self.trackLength,2 do
        if self.track[i + 2] ~= nil and self.track[i + 3] ~= nil then
            distanceBottom = (self.offsetY - self.height) * self.scale
            distanceLeft = self.offsetX * self.scale
            distanceRight = (self.width - self.offsetX) * self.scale
            love.graphics.line(
                (self.track[i] - distanceLeft), (self.track[i + 1] - distanceBottom),
                (self.track[i + 2] - distanceLeft), (self.track[i + 3] - distanceBottom)
            )
            love.graphics.line(
                (self.track[i] + distanceRight), (self.track[i + 1] - distanceBottom),
                (self.track[i + 2] + distanceRight), (self.track[i + 3] - distanceBottom)
            )
        end
    end
end