-- Auto Farm Script with GUI, Speed, Hover, and Level-Based Farming

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AutoFarmUI"
ScreenGui.Parent = game.CoreGui

-- Toggle Button
local Toggle = Instance.new("TextButton")
Toggle.Size = UDim2.new(0, 140, 0, 40)
Toggle.Position = UDim2.new(0, 10, 0.5, -20)
Toggle.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
Toggle.Text = "Auto Farm: OFF"
Toggle.TextScaled = true
Toggle.Parent = ScreenGui

-- Toggle Handler
local autoFarmEnabled = false
Toggle.MouseButton1Click:Connect(function()
    autoFarmEnabled = not autoFarmEnabled
    Toggle.Text = autoFarmEnabled and "Auto Farm: ON" or "Auto Farm: OFF"
    Toggle.BackgroundColor3 = autoFarmEnabled and Color3.fromRGB(0, 255, 127) or Color3.fromRGB(85, 170, 255)
end)

-- Level-Based Position Table (example coordinates)
local levelPositions = {
    [1] = Vector3.new(100, 20, 100),
    [10] = Vector3.new(500, 20, -200),
    [20] = Vector3.new(1000, 30, 400),
    [30] = Vector3.new(1500, 40, -100),
    [40] = Vector3.new(2000, 50, 300)
    -- Add more level thresholds as needed
}

-- Find best position for given level
local function getFarmingPosition(level)
    local lastPos = nil
    for lvl, pos in pairs(levelPositions) do
        if level >= lvl then
            lastPos = pos
        end
    end
    return lastPos
end

-- Main Auto Farm Loop
task.spawn(function()
    while true do
        task.wait(1)
        if autoFarmEnabled then
            pcall(function()
                local player = game.Players.LocalPlayer
                local char = player.Character
                local humanoid = char and char:FindFirstChildOfClass("Humanoid")
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                local leaderstats = player:FindFirstChild("leaderstats")
                local levelValue = leaderstats and leaderstats:FindFirstChild("Level")

                if humanoid and hrp and levelValue then
                    -- Speed + Hover
                    humanoid.WalkSpeed = 160
                    humanoid.JumpPower = 100
                    hrp.Velocity = Vector3.new(0, 35, 0)

                    -- Get Position for current level
                    local targetPos = getFarmingPosition(levelValue.Value)
                    if targetPos then
                        hrp.CFrame = CFrame.new(targetPos)
                    end
                end
            end)
        else
            pcall(function()
                local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = 16
                    humanoid.JumpPower = 50
                end
            end)
        end
    end
end)
