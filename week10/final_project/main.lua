io.stdout:setvbuf("no")

-- function love.draw()
  -- love.graphics.print("Hello World!", 100, 100)
-- end

  print("Hello World!")
  print(3 + 4)
  
  kind = "ocelot"
  age = "3"
  text = "Hello, I'm an " .. kind .. ", and I'm " .. age .. " years old."
  print(text)
  
  example = function ()
    print("example function implementation")
  end


function example2()
  print("example2 implementation")
end


example()
example2()

function other_function()
  print("other function")
end
