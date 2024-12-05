local hero = {}

hero.images = {}
hero.images[1] = love.graphics.newImage("images/hero1.png")
hero.images[2] = love.graphics.newImage("images/hero2.png")
hero.nbImages = 2
hero.imgCurrent = 1
hero.keyPressed = false

hero.line = 4
hero.column = 1
hero.direction = 1

function hero.Update(pMap, dt)
  hero.imgCurrent = hero.imgCurrent + 5*dt
  if math.floor(hero.imgCurrent) > hero.nbImages then
    hero.imgCurrent = 1
  end
  
  if love.keyboard.isDown("left","up","right","down") then
    if hero.keyPressed == false then
      hero.keyPressed = true
      local old_c = hero.column
      local old_l = hero.line
    
      if love.keyboard.isDown("up") and hero.line > 1 then
        hero.line = hero.line - 1
      end
      if love.keyboard.isDown("right") and hero.column < pMap.MAP_WIDTH then
        hero.column = hero.column + 1
        hero.direction = 1
      end
      if love.keyboard.isDown("down") and hero.line < pMap.MAP_HEIGHT then
        hero.line = hero.line + 1
      end
      if love.keyboard.isDown("left") and hero.column > 1 then
        hero.column = hero.column - 1
        hero.direction = -1
      end
      
      local id = pMap.Grid[hero.line][hero.column]
      if pMap.isSolid(id) then
        print("Collision")
        hero.column = old_c
        hero.line = old_l
      end
    end
  else
    hero.keyPressed = false
  end
end

function hero.Draw(pMap)
  local x = (hero.column-1) * pMap.TILE_WIDTH
  local y = (hero.line-1) * pMap.TILE_HEIGHT
  love.graphics.draw(hero.images[math.floor(hero.imgCurrent)], x, y, 0, hero.direction, 1)
end

return hero