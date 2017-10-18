Animation = Object:extend()

local generateFrames = function(spritesheet, fWidth, fHeight, numFrames)
  local frames = {}
  local width = spritesheet:getWidth()
  local height = spritesheet:getHeight()
  for i=0,numFrames-1 do
    table.insert(frames, love.graphics.newQuad(
    1 + i * (fWidth + 2), 1,
    fWidth, fHeight, width, height))
  end
  return frames
end

function Animation:new(spritesheet, fWidth, fHeight, numFrames)
  self.spritesheet = spritesheet
  self.frames = generateFrames(spritesheet, fWidth, fHeight, numFrames)
  self.cx = fWidth / 2
  self.cy = fHeight / 2
  self.numFrames = numFrames
  self.currentFrame = 1
end

function Animation:update(dt)
  self.currentFrame = self.currentFrame + 6 * dt
  if self.currentFrame >= self.numFrames then
    self.currentFrame = 1
  end
end

function Animation:draw(pos_x, pos_y, direction, scale)
  love.graphics.draw(
    self.spritesheet,
    self.frames[math.floor(self.currentFrame)],
    pos_x,
    pos_y,
    0, direction * scale, scale, self.cx, self.cy)
end
