require "sprites.shape"

Circle = Shape:extend()

function Circle:new(radius, x)
    Circle.super.new(self, x)
    self.img = love.graphics.newImage("resources/t1.png")
    self.radius = radius
    self.width = 2 * self.radius
    self.height = 2 * self.radius
end

function Circle:update(dt, girl, terrier)
    if self.y + self.radius < 0 then
        self.y = love.graphics.getHeight()
        --math.randomseed(os.clock()*100000000000)
        --self.x = math.random(0, love.graphics.getWidth())
        self.x = 400
    else
        Circle.super.update(self, dt)
    end

    ---- checks collision with girl
    --minX = math.min(terrier.x - terrier.offsetX * terrier.scale, terrier.x + terrier.offsetX * terrier.scale, self.x - self.radius, self.x + self.radius)
    --maxX = math.max(terrier.x - terrier.offsetX * terrier.scale, terrier.x + terrier.offsetX * terrier.scale, self.x - self.radius, self.x + self.radius)
    --distX = maxX - minX
    --lengthX = terrier.width * terrier.scale + self.width
    --minY = math.min(terrier.y - terrier.offsetY * terrier.scale, terrier.y + (terrier.height - terrier.offsetY) * terrier.scale, self.y - self.radius, self.y + self.radius)
    --maxY = math.max(terrier.y - terrier.offsetY * terrier.scale, terrier.y + (terrier.height - terrier.offsetY) * terrier.scale, self.y - self.radius, self.y + self.radius) -- felső offset nem jó
    --distY = maxY - minY
    --lengthY = terrier.height * terrier.scale + self.height

    ----print(distX .."  ".. lengthX .." - ".. distY .."  ".. lengthY)
    ----print(terrier.x - terrier.offsetX * terrier.scale .."  "..  terrier.x + terrier.offsetX * terrier.scale .."  "..  self.x - self.radius.."  "..  self.x + self.radius)
    ----print(terrier.y - terrier.offsetY * terrier.scale .."  ".. terrier.y + (terrier.height - terrier.offsetY) * terrier.scale .."  ".. self.y - self.radius .."  ".. self.y + self.radius)

    --if distX < lengthX and distY < lengthY then
    --    love.graphics.setColor(1, 0, 0, 1)
    --    print("au")
    --else
    --    love.graphics.setColor(1, 1, 1, 0.5)
    --end
    if self.collise(self, terrier) or self.collise(self, girl) then
        love.graphics.setColor(1, 0, 0, 1)
    else
        love.graphics.setColor(1, 1, 1, 0.5)
    end
end

function Circle:draw()
    --love.graphics.setColor(1, 1, 1, 0.5)
    love.graphics.circle("line", self.x, self.y, self.radius)
    --love.graphics.setColor(1, 1, 1, 0.5)
    love.graphics.draw(self.img, self.x, self.y, self.angle, 0.7, 0.7, 245, 185)
    love.graphics.setColor(1, 1, 1, 1)
end


function Circle:collise(sprite)
    crashed = false

    -- checks collision with girl
    minX = math.min(sprite.x - sprite.offsetX * sprite.scale, sprite.x + sprite.offsetX * sprite.scale, self.x - self.radius, self.x + self.radius)
    maxX = math.max(sprite.x - sprite.offsetX * sprite.scale, sprite.x + sprite.offsetX * sprite.scale, self.x - self.radius, self.x + self.radius)
    distX = maxX - minX
    lengthX = sprite.width * sprite.scale + self.width
    minY = math.min(sprite.y - sprite.offsetY * sprite.scale, sprite.y + (sprite.height - sprite.offsetY) * sprite.scale, self.y - self.radius, self.y + self.radius)
    maxY = math.max(sprite.y - sprite.offsetY * sprite.scale, sprite.y + (sprite.height - sprite.offsetY) * sprite.scale, self.y - self.radius, self.y + self.radius) -- felső offset nem jó
    distY = maxY - minY
    lengthY = sprite.height * sprite.scale + self.height

    --print(distX .."  ".. lengthX .." - ".. distY .."  ".. lengthY)
    --print(sprite.x - sprite.offsetX * sprite.scale .."  "..  sprite.x + sprite.offsetX * sprite.scale .."  "..  self.x - self.radius.."  "..  self.x + self.radius)
    --print(sprite.y - sprite.offsetY * sprite.scale .."  ".. sprite.y + (sprite.height - sprite.offsetY) * sprite.scale .."  ".. self.y - self.radius .."  ".. self.y + self.radius)

    if distX < lengthX and distY < lengthY then
        print("au")
        crashed = true
    end

    return crashed
end