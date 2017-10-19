Player = Object:extend()

function Player:new()
  self.player_walk = love.graphics.newImage("objects/player/player_walk.png")
  self.player_idle = love.graphics.newImage("objects/player/player_idle.png")

  self.anim_walk = Animation(self.player_walk, 24, 46, 5, 6)
  self.anim_idle = Animation(self.player_idle, 26, 45, 2, 1)

  self.pos_x = 100
  self.pos_y = 100
  self.speed = 100
  self.direction = 1
  self.scale = 2
  self.currentAnim = "walk"
end

function Player:update(dt)
  if love.keyboard.isDown("right") then
    self.currentAnim = "walk"
    self.anim_walk:update(dt)
    self.direction = 1
    self.pos_x = self.pos_x + self.speed * dt
  elseif love.keyboard.isDown("left") then
    self.currentAnim = "walk"
    self.anim_walk:update(dt)
    self.direction = -1
    self.pos_x = self.pos_x - self.speed * dt
  else
    self.currentAnim = "idle"
    self.anim_idle:update(dt)
  end
end

function Player:draw()
  if self.currentAnim == "walk" then
    self.anim_walk:draw(self.pos_x, self.pos_y, self.direction, self.scale)
  elseif self.currentAnim == "idle" then
    self.anim_idle:draw(self.pos_x, self.pos_y, self.direction, self.scale)
  end
end
