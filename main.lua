-- Débogueur Visual Studio Code 
if pcall(require, "lldebugger") then
    require("lldebugger").start()
end

io.stdout:setvbuf('no')

love.graphics.setDefaultFilter("nearest")

local myGame = require("game")

--

function love.load()
  
  love.window.setMode(1024,768)
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  myGame.Load()
  
end

function love.update(dt)
	myGame.Update(dt)
end

function love.draw()
  
	myGame.Draw()
end

function love.keypressed(key)
  
  print(key)
  
end
  