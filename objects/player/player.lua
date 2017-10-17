Player = Object:extend()

function Player:new()
  self.player_walk = love.graphics.newImage("objects/player/player_walk.png")
  local width = self.player_walk:getWidth()
  local height = self.player_walk:getHeight()
  frames = {}
  local frame_width = 24
  local frame_height = 46
  for i=0,4 do
    table.insert(frames, love.graphics.newQuad(1 + i * (frame_width + 2), 1, frame_width, frame_height, width, height))
  end
  currentFrame = 1
end

function Player:update(dt)
  currentFrame = currentFrame + 6 * dt
  if currentFrame >= 5 then
    currentFrame = 1
  end
end

function Player:draw()
  love.graphics.draw(self.player_walk, frames[math.floor(currentFrame)], 100, 100)
end
