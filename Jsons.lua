
-- Blox Fruits Auto Script (Background) - Dragon Fruit Handling + Boss Fight Logic

local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")

local fruitCollected = false
local dragonStored = false
local bossFightActive = false

-- Function to check inventory for Dragon Fruit
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

-- Function to store (cube) Dragon Fruit
local function storeDragonFruit()
    if dragonStored then return end
    local fruit = nil
    for _, item in pairs(player.Backpack:GetChildren()) do
        if item.Name == "Dragon Fruit" then
            fruit = item
            break
        end
    end
    if fruit then
        -- Use server event to store fruit in cube (simulate)
        print("Dragon Fruit found, storing it...")
        -- Assume some server event: ReplicatedStorage.Events.StoreFruit:FireServer(fruit)
        dragonStored = true
    end
end

-- Function to auto collect first 3 sea fruits/items
local function autoCollect()
    -- This is a simplified example to scan nearby items and pick up useful ones
    local workspaceItems = workspace:GetChildren()
    for _, obj in pairs(workspaceItems) do
        if obj.Name == "Dragon Fruit" and not dragonStored then
            -- Pick Dragon Fruit and store it (do not equip)
            print("Dragon Fruit found on ground, picking up...")
            -- Pickup code here (simulate)
            storeDragonFruit()
        elseif obj.Name == "Sword" or obj.Name == "Fruit" then
            -- Pickup other items based on your rules
            print("Collecting item:", obj.Name)
            -- Pickup code here (simulate)
        end
    end
end

-- Function to handle boss fight sword and fruit usage
local function bossFightLogic()
    if bossFightActive then
        if hasDragonFruit() then
            -- Equip Dragon Fruit for boss fight
            print("Boss fight active - equipping Dragon Fruit")
            -- Equip code (simulate)
        else
            -- Use sword if no Dragon Fruit
            print("Boss fight active - using sword")
            -- Equip sword (simulate)
        end
    else
        -- Normal fight - use sword only
        print("Normal fight - using sword")
    end
end

-- Main loop
while true do
    autoCollect()
    bossFightLogic()
    wait(5) -- Delay between cycles
end
