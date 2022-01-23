function love.load()
  target = {}
  target.x = 300
  target.y = 300
  target.radius = 50

  score = 0
  timer = 0

  gameFont = love.graphics.newFont(40)

  circleRGB = {}
  circleRGB.r = 1
  circleRGB.g = 1
  circleRGB.b = 1
end

function love.update(dt)

end

function love.draw()
  love.graphics.setColor(circleRGB.r, circleRGB.g, circleRGB.b)
  love.graphics.circle("fill", target.x, target.y, target.radius)
  
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(gameFont)
  love.graphics.print(score, 0, 0)
end

function love.mousepressed(x, y, button, istouch, presses)
  if button == 1 then
    local mouseToTarget = distanceBetween(x, y, target.x, target.y)
    if mouseToTarget < target.radius then
      score = score + 1

      target.radius = math.random(5, 50)
      target.x = math.random(target.radius, love.graphics.getWidth() - target.radius)
      target.y = math.random(target.radius, love.graphics.getHeight() - target.radius)

      circleRGB.r = math.random()
      circleRGB.g = math.random()
      circleRGB.b = math.random()

    else
      score = 0
    end
  end
end

function distanceBetween(x1, y1, x2, y2)
  return math.sqrt( ( x2 - x1 )^2 + ( y2 - y1 )^2 )
end