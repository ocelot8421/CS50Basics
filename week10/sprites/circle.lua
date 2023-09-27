require "sprites.shape"

Circle = Shape:extend()

function Circle:new(radius, x)
    Circle.super.new(self, x)
    self.img = love.graphics.newImage("resources/t1.png")
    self.radius = radius
    self.width = 2 * self.radius
    self.height = 2 * self.radius
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
    love.graphics.setColor(1, 1, 1, 0.5)
    love.graphics.circle("line", self.x, self.y, self.radius)
    love.graphics.setColor(1, 1, 1, 0.5)
    love.graphics.draw(self.img, self.x, self.y, self.angle, 0.7, 0.7, 245, 185)
    love.graphics.setColor(1, 1, 1, 1)
end