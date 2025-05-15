-- Starter: Create a ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LoadingUI"
ScreenGui.Parent = game.CoreGui

-- Create a Frame (background panel)
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 100)
Frame.Position = UDim2.new(0.5, -150, 0.5, -50)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

-- Create a TextLabel (Loading Text)
local TextLabel = Instance.new("TextLabel")
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "Loading..."
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.Parent = Frame

-- Optional: Add progress bar, animation, etc.
