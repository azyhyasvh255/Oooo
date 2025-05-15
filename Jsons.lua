-- Simple big toggle button in the right corner to show/hide the main UI

local player = game.Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- Main UI Frame (jo pehle banaya tha)
local mainUI = Instance.new("Frame")
mainUI.Size = UDim2.new(0, 200, 0, 150)
mainUI.Position = UDim2.new(1, -210, 0, 10) -- Right top corner, 10 px down, 10 px from right edge
mainUI.BackgroundColor3 = Color3.fromRGB(30,30,30)
mainUI.Parent = PlayerGui

-- Add your existing buttons inside mainUI here...

-- Toggle Button
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 80, 0, 80) -- bada button
toggleButton.Position = UDim2.new(1, -90, 0.5, -40) -- Screen ke right center ke thoda upar
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Text = "UI ON"
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextSize = 24
toggleButton.Parent = PlayerGui

local uiVisible = true

toggleButton.MouseButton1Click:Connect(function()
    uiVisible = not uiVisible
    mainUI.Visible = uiVisible
    toggleButton.Text = uiVisible and "UI ON" or "UI OFF"
end)

-- Example inside mainUI: Add farmButton and levelUpButton
local farmButton = Instance.new("TextButton", mainUI)
farmButton.Position = UDim2.new(0, 10, 0, 10)
farmButton.Size = UDim2.new(0, 180, 0, 40)
farmButton.Text = "Auto Farm: OFF"

local levelUpButton = Instance.new("TextButton", mainUI)
levelUpButton.Position = UDim2.new(0, 10, 0, 60)
levelUpButton.Size = UDim2.new(0, 180, 0, 40)
levelUpButton.Text = "Auto Level-Up: OFF"

local autoFarmEnabled = false
local autoLevelUpEnabled = false

farmButton.MouseButton1Click:Connect(function()
    autoFarmEnabled = not autoFarmEnabled
    farmButton.Text = "Auto Farm: " .. (autoFarmEnabled and "ON" or "OFF")
end)

levelUpButton.MouseButton1Click:Connect(function()
    autoLevelUpEnabled = not autoLevelUpEnabled
    levelUpButton.Text = "Auto Level-Up: " .. (autoLevelUpEnabled and "ON" or "OFF")
end)
