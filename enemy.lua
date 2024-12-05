local enemy = {}

enemy.images = {}
enemy.images[1] = love.graphics.newImage("images/enemy1.png")
enemy.images[2] = love.graphics.newImage("images/enemy2.png")
enemy.nbImages = 2
enemy.imgCurrent = 1
enemy.keyPressed = false

enemy.line = 6
enemy.column = 7

function enemy.Update(pMap, dt)
    enemy.imgCurrent = enemy.imgCurrent + 5*dt
    if math.floor(enemy.imgCurrent) > enemy.nbImages then
      enemy.imgCurrent = 1
    end
end


function enemy.Draw(pMap)
    local x = (enemy.column-1) * pMap.TILE_WIDTH
    local y = (enemy.line-1) * pMap.TILE_HEIGHT
    love.graphics.draw(enemy.images[math.floor(enemy.imgCurrent)], x, y, 0, 1, 1)
end

return enemy