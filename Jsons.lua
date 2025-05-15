local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local isAutoEnabled = false -- Toggle status

-- Toggle function to switch ON/OFF
local function toggleAuto()
    isAutoEnabled = not isAutoEnabled
    print("Auto Script is now", isAutoEnabled and "Enabled" or "Disabled")
end

-- Function to check for Dragon Fruit in inventory
local function hasDragonFruit()
    for _, item in pairs(player.Backpack:GetChildren()) do
        if item.Name == "Dragon Fruit" then
            return true
        end
    end
    for _, item in pairs(player.Character:GetChildren()) do
        if item.Name == "Dragon Fruit" then
            return true
        end
    end
    return false
end

-- Simulate Equip (just print for now)
local function equipItem(name)
    print("Equipping:", name)
    -- Add your real equip code here
end

-- Auto collect function (simplified)
local function autoCollect()
    for _, obj in pairs(workspace:GetChildren()) do
        if obj.Name == "Dragon Fruit" or obj.Name == "Sword" or obj.Name == "Fruit" then
            print("Collecting item:", obj.Name)
            -- Add pickup logic here
        end
    end
end

-- Boss fight logic simplified
local function bossFightLogic()
    local bossFightActive = false -- Simulate boss fight status; real logic needed to detect
    if bossFightActive then
        if hasDragonFruit() then
            equipItem("Dragon Fruit")
        else
            equipItem("Sword")
        end
    else
        equipItem("Sword")
    end
end

-- Bind toggle to keyboard key (For example, press "P" to toggle ON/OFF)
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed then
        if input.KeyCode == Enum.KeyCode.P then
            toggleAuto()
        end
    end
end)

-- Main loop running every second, only if enabled
RunService.Heartbeat:Connect(function()
    if isAutoEnabled then
        autoCollect()
        bossFightLogic()
    end
end)
