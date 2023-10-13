require "sprites.sprite"

Leash = Object:extend()

function Leash:new(girlX, girlY, dogX, dogY)
    self.girlX = girlX
    self.girlY = girlY
    self.dogX = dogX
    self.dogY = dogY
    self.length = 300
    self.damaged = false
    self.tree = Circle
    self.tanPointDog = nil
    self.tanPointGirl = nil
end

function Leash:update(dt, dogX, dogY, girlX, girlY, dog, girl)
    self.dogX = dogX
    self.dogY = dogY
    self.girlX = girlX
    self.girlY = girlY
    self.length = math.sqrt(math.pow(self.dogX - self.girlX, 2) + math.pow(self.dogY - self.girlY, 2))
    
    if self.damaged then
        -- TODO encapsulate (almost the same)
        local distDogTreePow2 = math.pow(self.dogX - self.tree.x, 2) + math.pow(self.dogY - self.tree.y, 2) -- length (pow 2) of line between tree-center and dog-spot
        local alphaDog = math.atan2(self.tree.y - dogY, self.tree.x - dogX) -- slope-angle of line between tree-center and dog-spot - to the horizontal
        local betaDog = math.asin(self.tree.radius / math.sqrt(distDogTreePow2)) -- angle of line between tree-center and dog-spot - to the line between tree-center and dog-spot
        local mDog = math.sqrt(distDogTreePow2 - math.pow(self.tree.radius, 2)) -- length of tangent line from dog's spot to the edge of tree
        local directionDog = {(dogY - self.tree.leashPoint[3][2]), (dogX - self.tree.leashPoint[3][2])}
        
        local distGirlTreePow2 = math.pow(self.girlX - self.tree.x, 2) + math.pow(self.girlY - self.tree.y, 2) -- length (pow 2) of line between tree-center and girl-spot
        local alphaGirl = math.atan2(self.tree.y - girlY, self.tree.x - girlX)  -- slope-angle of line between tree-center and girl-spot 
        local betaGirl = math.asin(self.tree.radius / math.sqrt(distGirlTreePow2)) -- angle of line between tree-center and girl-spot - to the line between tree-center and girl-spot
        local mGirl = math.sqrt(distGirlTreePow2 - math.pow(self.tree.radius, 2)) -- length of tangent line from girls's spot to edge of the tree
        local directionGirl = {(girlY - self.tree.leashPoint[3][2]), (girlX - self.tree.leashPoint[3][2])}

        
        
        self.tanPointGirl = self.tree.leashPoint[1]
        self.tanPointDog = self.tree.leashPoint[2]
        
        
        local multYDog = (dogY - self.tanPointDog[2]) / math.abs(dogY - self.tanPointDog[2]) -- normalized form
        local multXDog = (dogX - self.tanPointDog[1]) / math.abs(dogX - self.tanPointDog[1])
        local multYGirl = (girlY - self.tanPointGirl[2]) / math.abs(girlY - self.tanPointGirl[2]) -- normalized form
        local multXGirl = (girlX - self.tanPointGirl[1]) / math.abs(girlX - self.tanPointGirl[1])
        
        
        
        -- y coordinates around the tree
        self.tree.leashPoint[1][2] = self.tree.y + multYGirl * self.tree.radius * math.abs(math.cos(alphaGirl - betaGirl)) -- girl
        self.tree.leashPoint[2][2] = self.tree.y - multYDog * self.tree.radius * math.abs(math.cos(alphaDog - betaDog)) -- dog
        self.tree.leashPoint[3][2] = self.tree.leashPoint[3][2] - dt * 100
        -- x coordinates around the tree
        self.tree.leashPoint[1][1] = self.tree.x + multXGirl * self.tree.radius * math.abs(math.sin(alphaGirl - betaGirl)) -- girl
        self.tree.leashPoint[2][1] = self.tree.x + multXDog * self.tree.radius * math.abs(math.sin(alphaDog - betaDog)) -- dog
        

    end
end

function Leash:draw()
    if self.length > 280  and not self.damaged then -- TODO ~self.damaged (negal boolean) doesn't work... -.-
        love.graphics.setColor(50/255, 50/255, 205/255)
        love.graphics.line(self.girlX, self.girlY, self.dogX, self.dogY)
        love.graphics.setColor(1, 1, 1)
    elseif self.dogY - self.girlY > 250 and self.damaged then
        love.graphics.setColor(1, 0, 0)
        --love.graphics.line(self.girlX, self.girlY, self.tree.leashPoint[1][1], self.tree.leashPoint[1][2])
        --love.graphics.line(self.tree.leashPoint[2][1], self.tree.leashPoint[2][2], self.dogX, self.dogY)
        love.graphics.line(self.girlX, self.girlY, self.tree.leashPoint[3][1], self.tree.leashPoint[3][2], self.dogX, self.dogY)
        love.graphics.setColor(1, 1, 1)
    end

    --- For debugging:
    if self.damaged then
        love.graphics.setColor(1, 0, 0)
        love.graphics.circle("line", self.tree.leashPoint[3][1], self.tree.leashPoint[3][2], 10)
    end
end