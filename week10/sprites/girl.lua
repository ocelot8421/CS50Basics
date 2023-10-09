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
    Girl.super.update(self,dt)
end



function Girl:draw(x, y)
    self.offsetX = x
    self.offsetY = y
    
    -- draws the track-path behind the girl
    --love.graphics.setColor(250/255, 218/255, 221/255, 0.2)
    --Girl.super.drawTrackLine(self)
    
    -- draws the picture
    love.graphics.setColor(1,1,1)
    Girl.super.draw(self)
end

