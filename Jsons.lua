-- Auto Clicker for Blox Fruits with Corner Toggle Button

local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local mouse = plr:GetMouse()

local clickEnabled = false
local clickSpeed = 0.2 -- Delay between clicks in seconds

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Name = "AutoClickerUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = plr:WaitForChild("PlayerGui")

ToggleButton.Name = "ToggleClicker"
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 100, 0, 40)
ToggleButton.Position = UDim2.new(1, -110, 1, -50) -- bottom right corner
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
ToggleButton.Text = "Clicker: OFF"
ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 18

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = ToggleButton

-- Toggle function
ToggleButton.MouseButton1Click:Connect(function()
	clickEnabled = not clickEnabled
	ToggleButton.Text = "Clicker: " .. (clickEnabled and "ON" or "OFF")
	ToggleButton.BackgroundColor3 = clickEnabled and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(0, 255, 0)
end)

-- Auto click loop
task.spawn(function()
	while true do
		if clickEnabled then
			mouse1press()
			wait(0.05)
			mouse1release()
			wait(clickSpeed)
		else
			wait(0.2)
		end
	end
end)
