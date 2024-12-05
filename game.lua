local Game = {}

Game.Map = {}
Game.Map.Grid =  {
                { 2,1,1,1,1,1,1,1,1,1 },
                { 2,2,2,1,1,1,1,3,1,1 },
                { 2,2,2,2,1,1,1,1,3,1 },
                { 1,1,1,1,1,1,1,1,1,1 },
                { 2,2,1,1,1,1,1,1,1,1 },
                { 2,1,1,1,1,1,1,1,1,1 },
                { 1,1,1,3,1,1,1,1,1,1 },
                { 1,1,1,1,1,1,1,1,1,2 },
                { 3,3,1,1,1,1,2,2,2,2 },
                { 3,3,3,1,2,2,2,2,2,2 },
            }

Game.Map.MAP_WIDTH = 10
Game.Map.MAP_HEIGHT = 10
Game.Map.TILE_WIDTH = 8
Game.Map.TILE_HEIGHT = 8

Game.TileTextures = {}
Game.TileTypes = {}

Game.TileTextures[0] = nil
Game.TileTextures[1] = love.graphics.newImage("images/plain.png")
Game.TileTextures[2] = love.graphics.newImage("images/mountain.png")
Game.TileTextures[3] = love.graphics.newImage("images/forest.png")

Game.Hero = require("hero")
Game.Enemy = require("enemy")

function Game.Map.isSolid(pID)
    for l=1,Game.Map.MAP_HEIGHT do
        for c=1,Game.Map.MAP_WIDTH do
        local id = Game.Map.Grid[l][c]
            if id ~= nil then
                if id == 3 then
                    return true
                end
                return false
            end
        end
    end   
end

function Game.Load()
    print(Game.Map.Grid[9][1])



end

function Game.Update(dt)
    Game.Hero.Update(Game.Map, dt)
    Game.Enemy.Update(Game.Map, dt)
end

function Game.Draw()
    love.graphics.scale(4,4)
  local c,l
  
  for l=1,Game.Map.MAP_HEIGHT do
    for c=1,Game.Map.MAP_WIDTH do
      local id = Game.Map.Grid[l][c]
      local tex = Game.TileTextures[id]
      if tex ~= nil then
        love.graphics.draw(tex, (c-1)*Game.Map.TILE_WIDTH, (l-1)*Game.Map.TILE_HEIGHT)
      end
    end
  end
  Game.Hero.Draw(Game.Map)
  Game.Enemy.Draw(Game.Map)
end


return Game
