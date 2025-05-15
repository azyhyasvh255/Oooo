repeat wait() until game:IsLoaded()

local plr = game.Players.LocalPlayer
local rs = game:GetService("ReplicatedStorage")
local ts = game:GetService("TweenService")

function teleport(pos)
    local hrp = plr.Character:WaitForChild("HumanoidRootPart")
    local tween = ts:Create(hrp, TweenInfo.new(1), {CFrame = CFrame.new(pos)})
    tween:Play()
    tween.Completed:Wait()
end

function getBandit()
    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
        if v.Name == "Bandit" and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            return v
        end
    end
    return nil
end

while true do
    pcall(function()
        -- Accept Quest
        teleport(Vector3.new(1060, 16, 1547))  -- Bandit Quest Giver position
        wait(1.5)
        rs.Remotes.Comm:InvokeServer("StartQuest", "BanditQuest1", 1)
        wait(1)

        -- Find and kill bandits
        local bandit = getBandit()
        while bandit do
            teleport(bandit.HumanoidRootPart.Position + Vector3.new(0,5,0))
            wait(0.2)
            rs.Remotes.Comm:InvokeServer("Attack", "Melee")  -- Replace with real attack function if needed
            wait(0.3)
            bandit = getBandit()
        end
    end)
    wait(2)
end
