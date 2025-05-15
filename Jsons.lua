-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIListLayout = Instance.new("UIListLayout")

-- Main Power Toggle Button
local MainToggle = Instance.new("TextButton")

-- Configuration table
getgenv().BloxFruits = {
    Team = "Marines",
    TweenSpeed = 350,
    Fruit = {
        FruitNotifier = false,
        AutoRandom = true,
        FruitSniper = {
            Enabled = false,
            TargetFruits = {"Yeti-Yeti", "Dragon-Dragon", "Dough-Dough"},
        },
    },
    Farm = {
        Enabled = true,
        FastMethod = false,
        AutoHop = true,
        ItemHop = true,
    },
    Webhook = {
        Enabled = false,
        URL = "Your Webhook Url",
        UserId = "Id Discord",
    },
    BlackScreen = false,
    FpsBoost = false,
    AntiIdle = true,
}

-- GUI Design
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

MainFrame.Size = UDim2.new(0, 250, 0, 300)
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.Parent = ScreenGui
MainFrame.BorderSizePixel = 0
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

UIListLayout.Parent = MainFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 6)

-- Helper function to create toggle buttons
local function createToggle(text, getPath)
    local toggle = Instance.new("TextButton")
    toggle.Text = text .. ": OFF"
    toggle.Size = UDim2.new(1, -20, 0, 30)
    toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
    toggle.Font = Enum.Font.SourceSansBold
    toggle.TextSize = 18
    toggle.Parent = MainFrame

    local valuePath = getPath()

    toggle.MouseButton1Click:Connect(function()
        local currentValue = valuePath.value
        valuePath.set(not currentValue)
        toggle.Text = text .. ": " .. (valuePath.value and "ON" or "OFF")
    end)
end

-- Define all toggles
createToggle("Fruit Notifier", function()
    return {
        value = getgenv().BloxFruits.Fruit.FruitNotifier,
        set = function(v) getgenv().BloxFruits.Fruit.FruitNotifier = v end
    }
end)

createToggle("Auto Random Fruit", function()
    return {
        value = getgenv().BloxFruits.Fruit.AutoRandom,
        set = function(v) getgenv().BloxFruits.Fruit.AutoRandom = v end
    }
end)

createToggle("Fruit Sniper", function()
    return {
        value = getgenv().BloxFruits.Fruit.FruitSniper.Enabled,
        set = function(v) getgenv().BloxFruits.Fruit.FruitSniper.Enabled = v end
    }
end)

createToggle("Auto Farm", function()
    return {
        value = getgenv().BloxFruits.Farm.Enabled,
        set = function(v) getgenv().BloxFruits.Farm.Enabled = v end
    }
end)

createToggle("Auto Hop", function()
    return {
        value = getgenv().BloxFruits.Farm.AutoHop,
        set = function(v) getgenv().BloxFruits.Farm.AutoHop = v end
    }
end)

createToggle("Item Hop", function()
    return {
        value = getgenv().BloxFruits.Farm.ItemHop,
        set = function(v) getgenv().BloxFruits.Farm.ItemHop = v end
    }
end)

createToggle("Anti Idle", function()
    return {
        value = getgenv().BloxFruits.AntiIdle,
        set = function(v) getgenv().BloxFruits.AntiIdle = v end
    }
end)

-- Main GUI ON/OFF Toggle
MainToggle.Text = "JIO: ON"
MainToggle.Size = UDim2.new(1, -20, 0, 40)
MainToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
MainToggle.Font = Enum.Font.SourceSansBold
MainToggle.TextSize = 20
MainToggle.Parent = ScreenGui
MainToggle.Position = UDim2.new(0.5, -125, 0.5, 170)

local guiEnabled = true
MainToggle.MouseButton1Click:Connect(function()
    guiEnabled = not guiEnabled
    MainFrame.Visible = guiEnabled
    MainToggle.Text = "JIO: " .. (guiEnabled and "ON" or "OFF")
end)
