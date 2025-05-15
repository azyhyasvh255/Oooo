--[[ 
  BLOX FRUITS: AUTO LEVEL + FRUIT SNIPER + UI TRACKER 
  EXECUTOR: DELTA
]]

local plr = game.Players.LocalPlayer
local level = plr.Data.Level.Value
local collectedFruits = {}
local collectedStyles = {}
local startTime = tick()

-- UI Setup (Side Panel)
local gui = Instance.new("ScreenGui", plr.PlayerGui)
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 250, 0, 150)
panel.Position = UDim2.new(1, -260, 0, 50)
panel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local info = Instance.new("TextLabel", panel)
info.Size = UDim2.new(1, 0, 1, 0)
info.TextColor3 = Color3.new(1,1,1)
info.BackgroundTransparency = 1
info.TextScaled = true
info.Text = "Loading..."

-- Update UI
spawn(function()
    while wait(2) do
        local timeElapsed = math.floor(tick() - startTime)
        info.Text = "Level: "..level..
                    "\nFighting Styles: "..#collectedStyles..
                    "\nFruits: "..#collectedFruits..
                    "\nTime: "..timeElapsed.."s"
    end
end)
