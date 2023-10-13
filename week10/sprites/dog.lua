require "sprites.sprite"
require "sprites.leash"

Dog = Sprite:extend()

function Dog:new(path, x, y, leashLength, scale)
    Dog.super.new(self, path, x, y, scale)
    self.leashLengthMax = 300
    self.leashLength = leashLength
    self.y = self.y + self.leashLength
    self.posAngle = 0
    self.speed = 200
    self.speedVertical = 100

    self.angleLeash = 0
    self.powN = 0
    self.speedVector = {}
    self.timeDif = 0
    self.startdir = 0
end

function Dog:update(dt, girlX, girlY)
    
    if self.timeDif == 10 then
        self.speedVector[2] = self.speedVector[1] -- earlier spot
        self.speedVector[1] = {self.x, self.y} -- actual spot
        self.timeDif = 0
    end
    self.timeDif = self.timeDif + 1

    self.posAngle = math.atan2(self.x - girlX, self.y - girlY)

    if love.keyboard.isDown("left") and self.posAngle / math.pi * 180 > -90 and not leash.damaged and 0 <= self.x and self.x <= 800 then -- TODO ugly
        self.x = self.x - self.leashLength * math.cos(self.posAngle) * dt
        self.posAngle = self.posAngle + math.rad(3)
    elseif love.keyboard.isDown("right") and self.posAngle / math.pi * 180 < 90 and not leash.damaged and 0 <= self.x and self.x <= 800 then
        self.x = self.x + self.leashLength * math.cos(self.posAngle) * dt
        self.posAngle = self.posAngle - math.rad(3)
    end

    -- dog can't step out of window edges
    if love.keyboard.isDown("right") and 0 > self.x then
        self.x = self.x + 1
    end
    if love.keyboard.isDown("left") and self.x > 800 then
        self.x = self.x - 1
    end
    
    Dog.super.update(self, dt)
    
    if leash.damaged and self.speedVector[1][1] and self.speedVector[2][1] then
        if self.startdir == 0 then
            self.startdir = (self.speedVector[1][1] - self.speedVector[2][1]) / math.abs(self.speedVector[1][1] - self.speedVector[2][1]) -- normalized form
            if self.startdir ~= self.startdir then
                self.startdir = 1
            end
        end
        self.y = self.y - dt * 100 + dt * 100 * math.pow(0.5, self.powN)
        local deltaX = self.startdir * 200 * math.pow(2.7182818284, -0.5 * dt * self.angleLeash) * math.cos(math.rad(self.angleLeash)) * dt
        self.x = self.x + deltaX
        self.angleLeash = self.angleLeash + 1
        self.powN = self.powN + 0.01
    end
end

function Dog:draw()
    
    -- draws the picture
    love.graphics.setColor(1,1,1)
    Dog.super.draw(self)
    love.graphics.print("Terrier: " ..self.painPoint, 20, 30)
end
