y = 100
x = 100
XY = 400
YX = 300
yy = 400
xx = 599
function love.draw()
  love.graphics.circle("fill", x, y, 20, 30)
  love.graphics.circle("fill", XY, YX, 40, 4)
  love.graphics.circle("fill", xx, yy, 30, 8)
end

function love.update(dt)
  differenceX = XY - x
  differenceY = YX - y
  differenceXX = xx - x
  differenceYY = yy - y
  distance = math.sqrt(differenceX * differenceX + differenceY * differenceY)
  distancee = math.sqrt(differenceXX * differenceXX + differenceYY * differenceY)
  if distance < 20 + 40 then
    XY = XY + 3
  end
  if distancee < 20 + 30 then
love.event.quit()
  end
  if  love.keyboard.isDown("right") then
    x = x + 400 * dt
  end
  if love.keyboard.isDown("left") then
    x = x - 400 * dt
  end
  if love.keyboard.isDown("up") then
    y = y - 200 * dt
  end
  if love.keyboard.isDown("down") then
    y = y + 200 * dt
  end
end
