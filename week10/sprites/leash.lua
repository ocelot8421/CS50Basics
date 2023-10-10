Leash = Object:extend()

function Leash:new(girlX, girlY, dogX, dogY)
    self.girlX = girlX
    self.girlY = girlY
    self.dogX = dogX
    self.dogY = dogY
    self.length = 300
    self.demaged = false
end

function Leash:update(dogX, dogY, girlX, girlY)
    self.dogX = dogX
    self.dogY = dogY
    self.girlX = girlX
    self.girlY = girlY
    self.length = math.sqrt(math.pow(self.dogX - self.girlX, 2) + math.pow(self.dogY - self.girlY, 2))
end

function Leash:draw()
    if self.length > 280 and self.demaged == false then
        love.graphics.setColor(50/255, 50/255, 205/255)
        love.graphics.line(self.girlX, self.girlY, self.dogX, self.dogY)
        love.graphics.setColor(1, 1, 1)
    elseif self.length > 280 and self.demaged == true then
        love.graphics.setColor(1, 0, 0)
        love.graphics.line(self.girlX, self.girlY, self.dogX, self.dogY)
        love.graphics.setColor(1, 1, 1)
    end
end