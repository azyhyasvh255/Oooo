-- Faster Auto Clicker Script
-- CPS: 50 (Clicks Per Second)
-- Toggle: CAPSLOCK ON
-- Mouse Button: 5 (Usually side button)

local CPS = 50 -- Higher clicks per second for more speed
local keyToggle = "capslock" -- ON/OFF toggle key
local keyMouse = 5 -- Button that must be held for clicking

EnablePrimaryMouseButtonEvents(true)

function OnEvent(event, arg)
  if IsKeyLockOn(keyToggle) then
    if IsMouseButtonPressed(keyMouse) then
      repeat
        local time = math.floor(1000 / CPS) -- Time per click in ms
        PressMouseButton(1)
        ReleaseMouseButton(1)
        Sleep(time)
      until not IsMouseButtonPressed(keyMouse)
    end
  end
end
