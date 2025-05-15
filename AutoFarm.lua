-- Load Orion GUI Library
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- Window banate hain
local Window = OrionLib:MakeWindow({
    Name = "Delta AngelHub | AutoFarm",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "DeltaAngelHub",
    IntroEnabled = false
})

-- Tab Create
local AutoTab = Window:MakeTab({
    Name = "Auto Farm",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- State variable
_G.AutoFarm = false

-- Farm function
function AutoFarm()
    while _G.AutoFarm do
        pcall(function()
            -- Basic auto attack
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Attack", "Combat")
        end)
        wait(1)
    end
end

-- Toggle Button
AutoTab:AddToggle({
    Name = "Enable Auto Level Farm",
    Default = false,
    Callback = function(Value)
        _G.AutoFarm = Value
        if Value then
            AutoFarm()
        end
    end
})

-- Init
OrionLib:Init()
