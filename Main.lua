--these are x y's off the cod.
y = 100
x = 100
XY = 400
YX = 400
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
killX = 300
killy = 300
wallX = 10
wallY = 570
--
function love.draw()
love.graphics.circle("fill", x, y, 20, 30)
love.graphics.circle("fill", XY, YX, 40, 4)
love.graphics.circle("fill", XY, 500, 40, 4)
love.graphics.circle("fill", xx, yy, 30, 8)
love.graphics.circle("line", xyx, yxy, 35, 100)
love.graphics.rectangle("fill", xxx, yyy, 2000, 10)
love.graphics.rectangle("fill", xxxx, yyy, 10, 2000)
love.graphics.print("aroow keys to move and space to show the protectioncircle", 10, 20)
love.graphics.rectangle("fill", wallX, wallY, 1000, 30)
if distancer < 40 + 30 then
  love.graphics.print("You Win", 200, 200)
  love.graphics.draw(winimage ,300, 100)
end
if  love.keyboard.isDown("space") then
  love.graphics.circle("line", killX, killy, 50, 50)
end
end
--this function is for the collsions.
function love.update(dt)
differencewallY = wallY - y
differencewallX = wallX - y
differencekillx = killX - xyx
differencekilly = killy - yxy
differenceX = XY - x
differenceY = YX - y
differenceXX = xx - x
differenceYY = yy - y
differenceXXX = xyx - x
differenceYYY = yxy - y
differenceXXXX = xxx - x
differenceYYYY = yyy - y
differenceXYXXY = XY - xx
differenceYXYYXXY = YX - yy
distancer = math.sqrt(differenceXYXXY * differenceXYXXY + differenceYXYYXXY * differenceYXYYXXY)
distance = math.sqrt(differenceX * differenceX + differenceY * differenceY)
distancee = math.sqrt(differenceXX * differenceXX + differenceYY * differenceYY)
distanceee = math.sqrt(differenceXXX * differenceXXX + differenceYYY * differenceYYY)
distanceeee = math.sqrt(differenceXXXX * differenceXXXX + differenceYYYY * differenceYYYY)
distanceKill = math.sqrt(differencekillx *   differencekillx + differencekilly * differencekilly)
distancewall = math.sqrt(differencewallX * differencewallX + differencewallY * differencewallY)
if(distancewall < 300 + 20)then
y = 0
end
if(distanceKill < 35 + 50)then
  xyx = 1000
end
-- this is a collsion.
if distance < 20 + 40 then
  XY = XY + 3
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
function love.load(dt)
  winimage = love.graphics.newImage("WIN.jpg")
end
