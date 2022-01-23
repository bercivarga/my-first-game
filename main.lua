function love.load()
  target = {}
  target.x = 300
  target.y = 300
  target.radius = 50

  score = 0
  timer = 5

  gameFont = love.graphics.newFont(40)

  circleRGB = {}
  circleRGB.r = 1
  circleRGB.g = 1
  circleRGB.b = 1

  gameLive = true

  function resetGame()
    score = 0
    timer = 5
  end
end

function love.update(dt)
  if timer > 0 then
    timer = timer - dt
  end
  if timer < 0 then
    timer = 0
  end
end

function love.draw()
  if timer > 0 then
    love.graphics.setColor(circleRGB.r, circleRGB.g, circleRGB.b)
    love.graphics.circle("fill", target.x, target.y, target.radius)
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(gameFont)
    love.graphics.print("Score: "..score, 20, 20)
    love.graphics.print("Time left: "..math.ceil(timer), 400, 20)
  end

  if timer == 0 then
    love.graphics.print("Game over, final score: "..score, 20, love.graphics.getHeight() - 80)
  end
end

function love.mousepressed(x, y, button)
  if button == 1 and timer > 0 then
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
    else
      resetGame()
  end
end

function distanceBetween(x1, y1, x2, y2)
  return math.sqrt( ( x2 - x1 )^2 + ( y2 - y1 )^2 )
end