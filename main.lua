function love.load()
  Object = require "assets.vendor/classic"
  require "objects.player.player"

  player = Player()
end

function love.update(dt)
  player:update(dt)
end

function love.draw()
  player:draw()
end
