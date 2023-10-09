require "sprites.sprite"

Girl = Sprite:extend()

function Girl:new(path, x, y, scale, leashLength)
    Girl.super.new(self, path, x, y, scale)
    leash = leashLength
    self.time = 0
    posAngle = 0
    speedGirl = 0
    amplitudo = 0
    tempAmp = 0
    dogXX = 0
    dogYY = 0
    girlXX = self.x
    girlYY = self.y
end

function Girl:update(dt, dogX, dogY)
    dogXX = dogX
    dogYY = dogY
    girlXX = self.x
    girlYY = self.y
    dogH = dogX - self.x

    -- The dog is moving and pulling the girl (horizontally). The girl's speed increased (horizontally).
    if love.keyboard.isDown("right") and self.x < dogX then
        amplitudo = 0
        speedGirl = 100 * dogH / 50
        tempAmp = speedGirl
        posAngle = 0
    elseif love.keyboard.isDown("left") and self.x > dogX then
        amplitudo = 0
        speedGirl = 100 * dogH / 50
        tempAmp = speedGirl
        posAngle = 0
    end

    -- The dog stopped but the girl still have speed. She's speed is decreasing and starting oscillating.
    if speedGirl ~= 0 and math.abs(dogH) < 1 then
        speedGirl = 0
        amplitudo = tempAmp
    end
    if amplitudo ~= 0 then
        posAngle = posAngle + 1
    end
    if posAngle > 3000 then
        amplitudo = 0
        posAngle = 0
        self.x = dogX
    end

    deltaX = amplitudo * math.pow(2.7182818284, -0.1 * dt * posAngle) * math.cos(math.rad(posAngle)) * dt
    self.x = self.x + deltaX + speedGirl * dt

    -- draws the path where was the sprite before. (x1, y1, x2, y2, x3, y3, ....)
    --table.remove(self.track, self.trackLength)
    --table.remove(self.track, self.trackLength - 1)
    for i=self.trackLength,4,-2 do
        if self.track[i - 2] and self.track[i - 3] then
            self.track[i] = self.track[i - 2] - dt * 100 -- y coordinates
            self.track[i - 1] = self.track[i - 3] -- x coordinates
        end
    end
    
    self.track[1] = self.x
    self.track[2] = self.y

end



function Girl:draw(x, y)
    self.offsetX = x
    self.offsetY = y
    
    -- draws the path behind the girl
    for i=1,self.trackLength,2 do
        if self.track[i + 2] ~= nil and self.track[i + 3] ~= nil then
            distanceBottom = self.offsetY - self.height
            love.graphics.line(
                (self.track[i] - self.offsetX), (self.track[i + 1] - distanceBottom), 
                (self.track[i + 2] - self.offsetX), (self.track[i + 3] - distanceBottom)
            )
            love.graphics.line(
                (self.track[i] + (self.width - self.offsetX)), (self.track[i + 1] - distanceBottom), 
                (self.track[i + 2] + (self.width - self.offsetX)), (self.track[i + 3] - distanceBottom)
            )
        end
    end

    -- draws the picture
    Girl.super.draw(self)
end

