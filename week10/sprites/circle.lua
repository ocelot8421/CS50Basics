require "sprites.shape"
require "sprites.leash"

Circle = Shape:extend()

function Circle:new(radius, x)
    Circle.super.new(self, x)
    self.img = love.graphics.newImage("resources/t1.png")
    self.radius = radius
    self.width = 2 * self.radius
    self.height = 2 * self.radius
    self.leashPoint = {{},{}}
end

function Circle:update(dt, girl, terrier, leash)
    if self.y + self.radius < 0 then
        self.y = love.graphics.getHeight()
        math.randomseed(os.clock()*100000000000)
        self.x = math.random(0, love.graphics.getWidth())
    else
        Circle.super.update(self, dt)
    end
end


function Circle:draw()
    if self.collise(self, terrier) or self.collise(self, girl) then
        love.graphics.setColor(1, 0, 0, 1)
    else
        love.graphics.setColor(1, 1, 1, 0.5)
    end
    love.graphics.circle("line", self.x, self.y, self.radius)
    love.graphics.draw(self.img, self.x, self.y, self.angle, 0.7, 0.7, 245, 185)

    -- crash point
    local minPx = math.min(terrier.x, girl.x)
    local maxPx = math.max(terrier.x, girl.x)
    --if minPx < self.x and self.x < maxPx and girl.y < self.y and self.y < terrier.y then
        local dx = girl.x - terrier.x
        local dy = girl.y - terrier.y
        local sx = math.sin(math.atan2(dy, dx)) * self.radius
        local sy = math.cos(math.atan2(dy, dx)) * self.radius

        local tanTreeRightPoint = (self.y - sy - girl.y) / (self.x + sx - girl.x)
        local tanTreeLeftPoint = (self.y + sy - girl.y) / (self.x - sx - girl.x)
        
        love.graphics.line((self.x + sy), (self.y + sx), (self.x - sy), (self.y - sx)) -- parallel diagonal line

        if math.abs(dy / dx) < math.abs(tanTreeLeftPoint) or math.abs(dy / dx) < math.abs(tanTreeRightPoint) then
            print("noooo")
            leash.demaged = true
            --self.leashPoint[1] = {self.x}
            leash.tree = self
        end
        
        love.graphics.line(self.x - sx, self.y + sy, self.x + sx, self.y - sy)
    --end
end


function Circle:collise(sprite)
    local crashed = false

    local edgesX = {
        sprite.x - sprite.offsetX * sprite.scale,
        sprite.x + (sprite.width - sprite.offsetX) * sprite.scale,
        self.x - self.radius,
        self.x + self.radius
    }

    local edgesY = {
        sprite.y - sprite.offsetY * sprite.scale,
        sprite.y + (sprite.height - sprite.offsetY) * sprite.scale,
        self.y - self.radius,
        self.y + self.radius
    }
    -- checks collision with girl
    local minX = math.min(unpack(edgesX))
    local maxX = math.max(unpack(edgesX))
    local distX = maxX - minX
    local lengthX = sprite.width * sprite.scale + self.width
    local minY = math.min(unpack(edgesY))
    local maxY = math.max(unpack(edgesY))
    local distY = maxY - minY
    local lengthY = sprite.height * sprite.scale + self.height

    if distX < lengthX and distY < lengthY then
        sprite.painPoint = sprite.painPoint + 1
        crashed = true
    end

    return crashed
end