local CPS = 50
if CPS > 50 then CPS = 50 end  -- Optional safety limit

local keyToggle = "capslock"
local keyMouse = 5

EnablePrimaryMouseButtonEvents(true)

function OnEvent(event, arg)
  if IsKeyLockOn(keyToggle) then
    if IsMouseButtonPressed(keyMouse) then
      repeat
        local time = math.floor(1000 / CPS)
        PressMouseButton(1)
        ReleaseMouseButton(1)
        Sleep(time)
      until not IsMouseButtonPressed(keyMouse)
    end
  end
end
