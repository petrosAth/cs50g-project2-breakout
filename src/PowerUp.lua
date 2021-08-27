--[[
    GD50
    Breakout Remake

    -- PowerUp Class --

    Author: Petros Athanasoulis

    Represents a PowerUp that can be generated from a cleared Brick.
    Every Brick has a random chance to generate a PowerUp when cleared.
]]

PowerUp = Class{}

function PowerUp:init()
    -- simple positional and dimensional variables
    self.width = 16
    self.height = 16
    
    -- used to determine whether this powerup should be rendered
    self.inPlay = false

    -- powerups can only move downwards on the x axis at a constant speed
    self.dy = POWERUP_SPEED

    -- this will be the type of our powerup, and we will index
    -- our table of Quads relating to the global block texture using this
    self.type = type
end

--[[
    Expects an argument with a bounding box, be that a paddle or a brick,
    and returns true if the bounding boxes of this and the argument overlap.
]]
function PowerUp:collides(target)
    -- first, check to see if the left edge of either is farther to the right
    -- than the right edge of the other
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end

    -- if the above aren't true, they're overlapping
    return true
end

function PowerUp:update(dt)
    if self.inPlay then
        self.y = self.y + self.dy * dt
    end
end


function PowerUp:render()
    if self.inPlay then
        -- gTexture is our global texture for all blocks
        -- gFrames['powerUps'] is a table of quads mapping to each individual powerup in the texture
        love.graphics.draw(gTextures['main'], gFrames['powerUps'][self.type], self.x, self.y)
    end
end

