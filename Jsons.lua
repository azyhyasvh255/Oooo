-- Load the Visual UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/VisualRoblox/Roblox/main/UI-Libraries/Visual%20UI%20Library/Source.lua"))()

-- Create the main window
local Window = Library:CreateWindow({
    Name = "Blox Fruits Hub",
    IntroText = "Welcome to Blox Fruits Hub",
    IntroIcon = "rbxassetid://10618644218",
    IntroBlur = true,
    IntroBlurIntensity = 15,
    Theme = Library.Themes.Dark,
    Position = "TopLeft",
    Draggable = true,
    Prefix = ";"
})

-- Create a tab for features
local MainTab = Window:CreateTab("Main Features")

-- Player Speed Increase Toggle
MainTab:CreateToggle("Player Speed Increase", false, function(state)
    if state then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
    else
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)

-- Auto Farm Level (MTRIET External Script)
local mtLoaded = false
MainTab:CreateToggle("Auto Farm Level", false, function(state)
    if state and not mtLoaded then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jebblox/scriptdatabase2/main/scripts/MTriet.lua"))()
        mtLoaded = true
    end
end)
