--these are x y's of the code.
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
enemyspeed = 70
killX = 300
killy = 300
wallX = 10
wallY = 570
XP = 0
BuyX = 300
BuyY = 500
BuyerX = 100
BuyerY = 200
health = 100
Goal2X = 1000
Goal2Y = 400
SpikeX = 1000
SpikeY = 1
finalX =  1200
finalY =  1000
hardX = 300
hardY = 500
easyX = 200
easyY = 200
-- this is the function to draw all thing on screen
function love.draw()
love.graphics.circle("fill", finalX, finalY, 100, 1000)
love.graphics.circle("fill", SpikeX, SpikeY, 50, 4 )
love.graphics.circle("fill", Goal2X, Goal2Y, 20, 8)
-- this sets the color of the Background
love.graphics.setBackgroundColor(0.4, 0, 0, 1)
love.graphics.print("health"..health, 20, 300)
-- this sets the color off all the objects
love.graphics.setColor(0, 0.4, 1.4, 1)
love.graphics.circle("fill", x, y, 20, 30)
love.graphics.circle("fill", XY, YX, 40, 4)
love.graphics.circle("fill", XY, 500, 40, 4)
love.graphics.circle("fill", xx, yy, 30, 8)
love.graphics.circle("line", xyx, yxy, 35, 1000)
love.graphics.rectangle("fill", xxx, yyy, 2000, 10)
love.graphics.rectangle("fill", xxxx, yyy, 10, 2000)
--this is the tutorual for the  game its prited out on the screen
love.graphics.print("aroow keys to move and space to show the protectioncircle", 10, 20)
love.graphics.rectangle("fill", wallX, wallY, 1000, 30)
if(distanceGoal <= 50 + 20)then
  love.graphics.print("One More to go!!", 1000, 200)
  love.graphics.draw(winimage, 2000, 100)
  if(distanceFinal <= 100 + 20 )then
    love.graphics.draw(COOKIE, 1600, 400)
    -- this is the win text and image
    love.graphics.print("YOU HAVE WON THE CHALING HERES A COOKIE", 1000, 600)
  end
end
-- this is the code for the XP sestum
love.graphics.print("XP"..XP, 500, 20)
if(XP >= 4 and distanceBuy < 20 + 60)then
  enemyspeed = enemyspeed - 10
  XP = XP - 4
end
-- this is when xp = 4 a circle will apare so you can touch it so the enemy will be slower
if( XP >= 4)then
  love.graphics.circle("fill", BuyX, BuyY, 60, 8)
end
-- this is the second buying optoin in the  game
if(XP >= 10)then
  love.graphics.circle("fill", BuyerX, BuyerY, 40, 20)
end
--this make the enemy slower when you have 4 XP and it make him slower.
if distancer < 40 + 30 then
  love.graphics.print("You Win.. but not yet", 200, 200)
  love.graphics.draw(winimage ,400, 100)
end
if  love.keyboard.isDown("space") then
  love.graphics.circle("fill", killX, killy, 50, 50)
end
end
--this function is for the collsions.
function love.update(dt)
differenceFianlX =  finalX - x
differenceFinalY = finalY - y
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
differenceBuyX = BuyX - x
differenceBuyY = BuyY - y
differenceBuyerX = BuyerX - x
differenceBuyerY = BuyerY - y
differenceGoalX = Goal2X - SpikeX
differenceGoalY = Goal2Y - SpikeY
differenceGoalXX = SpikeX - x
differenceGoalYY = SpikeY - y
--this sqrtsthe distances by the differences
distancer = math.sqrt(differenceXYXXY * differenceXYXXY + differenceYXYYXXY * differenceYXYYXXY)
distance = math.sqrt(differenceX * differenceX + differenceY * differenceY)
distancee = math.sqrt(differenceXX * differenceXX + differenceYY * differenceYY)
distanceee = math.sqrt(differenceXXX * differenceXXX + differenceYYY * differenceYYY)
distanceeee = math.sqrt(differenceXXXX * differenceXXXX + differenceYYYY * differenceYYYY)
distanceKill = math.sqrt(differencekillx *   differencekillx + differencekilly * differencekilly)
distancewall = math.sqrt(differencewallX * differencewallX + differencewallY * differencewallY)
distanceBuy = math.sqrt(differenceBuyX * differenceBuyX + differenceBuyY * differenceBuyY)
distanceBuyer = math.sqrt(differenceBuyerX * differenceBuyerX + differenceBuyerY * differenceBuyerY)
distanceGoal = math.sqrt(differenceGoalX * differenceGoalX + differenceGoalY * differenceGoalY)
distanceHomerun = math.sqrt(differenceGoalXX * differenceGoalXX + differenceGoalYY * differenceGoalYY)
distanceFinal = math.sqrt(differenceFianlX * differenceFianlX + differenceFinalY * differenceFinalY)
if(distanceGoal <= 50 + 20)then
  enemyspeed = 90
end
-- this is the enemy speed wen you touch the goal.
if(distanceFinal <= 45 + 30 )then
enemyspeed = 0
end
-- this is the distance for  one  of the check points.
if(distanceHomerun <= 20 + 50 )then
  SpikeY =SpikeY + 5
end
while health > 100 do
  health = health - 1
end
if(distanceBuyer <=40 + 20 and XP == 10)then
  XP = XP - 10
  health = health + 10
end
if(distancewall < 300 + 20)then
  y = 0
end
if health == 0 then
  love.event.quit()
end
-- this will see if the enemy is touching the circle so it adds Xp
if(distanceKill < 35 + 50)then
  xyx = 1000
  XP = XP + 1
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
  health = health - 5
end
-- player controls.
if  love.keyboard.isDown("right") then
  x = x + 400 * dt
end
if love.keyboard.isDown("left") then
  x = x - 400 * dt
end
if love.keyboard.isDown("up") then
  y = y - 400 * dt
end
if love.keyboard.isDown("down") then
  y = y + 400 * dt
end
end
-- this is so imageS will be loaded in the sence to the folder
function love.load(dt)
winimage = love.graphics.newImage("WIN.jpg")
COOKIE = love.graphics.newImage("Cookie.jpg")
end
