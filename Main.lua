y = 100
x = 100
XY = 400
YX = 300
yy = 400
xx = 599
xyx = 300
yxy = 400
xxx = 3
yyy = 0
xxxx = 0
damegeX = 400
damegeY = 500
enemyspeed = 10
function love.draw()
  love.graphics.circle("fill", x, y, 20, 30)
  love.graphics.circle("fill", XY, YX, 40, 4)
  love.graphics.circle("fill", xx, yy, 30, 8)
  love.graphics.circle("line", xyx, yxy, 35, 100)
  love.graphics.rectangle("fill", xxx, yyy, 2000, 10)
  love.graphics.rectangle("fill", xxxx, yyy, 10, 2000)
  love.graphics.rectangle("fill", damegeX, damegeY, 50, 50)
  if distancee < 20 + 30 then
    love.graphics.print("You Win", 200, 200)
  end
end
--this function is for the collsions.
function love.update(dt)
  differenceX = XY - x
  differenceY = YX - y
  differenceXX = xx - x
  differenceYY = yy - y
  differenceXXX = xyx - x
  differenceYYY = yxy - y
  differenceXXXX = xxx - x
  differenceYYYY = yyy - y
  differenceYYYYY = damegeY - y
  differenceXXXXX = damegeX - x
  distance = math.sqrt(differenceX * differenceX + differenceY * differenceY)
  distancee = math.sqrt(differenceXX * differenceXX + differenceYY * differenceYY)
  distanceee = math.sqrt(differenceXXX * differenceXXX + differenceYYY * differenceYYY)
  distanceeee = math.sqrt(differenceXXXX * differenceXXXX + differenceYYYY * differenceYYYY)
  distanceeeee = math.sqrt(differenceXXXXX * differenceXXXXX + differenceYYYYY * differenceYYYY)
  -- this is a collsion.
  if distance < 20 + 40 then
    XY = XY + 3
  end
  if(distanceeeee < 20 + 0.1)then
  love.event.quit()
  end
  -- this is the enemys code

  if xyx < x then

    xyx = xyx + (enemyspeed * 2.5 * dt)
  end
  if xyx > x then
    xyx = xyx - (enemyspeed * 2.5 * dt)
  end
  if yxy > y then
    yxy = yxy - (enemyspeed * 2.5 * dt)
  end
  if yxy < y then
    yxy = yxy + (enemyspeed * 2.5 * dt)
  end

  if(yyy >= y)then
    y = y + 10
  end
  if(xxxx <= x)then
    X = x + 10
  end
  -- this quits the game when something happens.
  if distanceee < 20 + 35 then
    love.event.quit()
  end
  -- player controls.
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
