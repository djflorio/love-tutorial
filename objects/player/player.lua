Player = Object:extend()

function Player:new()
  self.player_walk = love.graphics.newImage("objects/player/player_walk.png")
  self.width = self.player_walk:getWidth()
  self.height = self.player_walk:getHeight()
  self.frames = {}
  self.frame_width = 24
  self.frame_height = 46
  for i=0,4 do
    table.insert(self.frames, love.graphics.newQuad(
      1 + i * (self.frame_width + 2), 1,
      self.frame_width, self.frame_height,
      self.width, self.height))
  end
  self.currentFrame = 1
end

function Player:update(dt)
  self.currentFrame = self.currentFrame + 6 * dt
  if self.currentFrame >= 5 then
    self.currentFrame = 1
  end
end

function Player:draw()
  love.graphics.draw(
    self.player_walk,
    self.frames[math.floor(self.currentFrame)], 100, 100)
end
