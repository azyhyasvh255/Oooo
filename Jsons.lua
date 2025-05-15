-- Basic Auto Farm Level Script with GUI Toggle Button (No Loading UI)

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AutoFarmUI"
ScreenGui.Parent = game.CoreGui

-- Toggle Button
local Toggle = Instance.new("TextButton")
Toggle.Size = UDim2.new(0, 120, 0, 40)
Toggle.Position = UDim2.new(0, 10, 0.5, -20)
Toggle.BackgroundColor3 = Color3.fromRGB(85, 170, 255) -- Tum yeh color customize kar sakte ho
Toggle.Text = "Auto Farm: OFF"
Toggle.TextScaled = true
Toggle.Parent = ScreenGui

-- Farming Control
local autoFarmEnabled = false

Toggle.MouseButton1Click:Connect(function()
    autoFarmEnabled = not autoFarmEnabled
    Toggle.Text = autoFarmEnabled and "Auto Farm: ON" or "Auto Farm: OFF"
    Toggle.BackgroundColor3 = autoFarmEnabled and Color3.fromRGB(0, 255, 127) or Color3.fromRGB(85, 170, 255)
end)

-- Auto Farm Loop
task.spawn(function()
    while true do
        task.wait(1)
        if autoFarmEnabled then
            -- Yahan tum apna farming logic daal sakte ho
            -- Example: Auto attack enemy, move to quest, etc.
            -- Example:
            pcall(function()
                local character = game.Players.LocalPlayer.Character
                if character then
                    -- Dummy example: teleport to position
                    character:MoveTo(Vector3.new(0, 10, 0))
                end
            end)
        end
    end
end)
