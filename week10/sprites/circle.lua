require "sprites.shape"

Circle = Shape:extend()

function Circle:new(radius, x)
    Circle.super.new(self, x)
    self.radius = radius
end

function Circle:update(dt, leashLength, dogX, dogY, girlX, girlY)
    if self.y + self.radius < 0 then
        self.y = love.graphics.getHeight()
        math.randomseed(os.clock()*100000000000)
        self.x = math.random(0, love.graphics.getWidth())
    else
        Circle.super.update(self, dt, leashLength, dogX, dogY, girlX, girlY)
    end
end

function Circle:draw()
    love.graphics.circle("line", self.x, self.y, self.radius)
end