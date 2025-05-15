-- Auto Farm + Level Detect
local Player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

function getQuest()
    local level = Player.Data.Level.Value
    if level < 10 then
        return "BanditQuest1", Vector3.new(1060, 16, 1547), "Bandit"
    elseif level < 30 then
        return "JungleQuest", Vector3.new(-1600, 36, 145), "Monkey"
    elseif level < 60 then
        return "BuggyQuest1", Vector3.new(-1144, 14, 3832), "Pirate"
    else
        return nil
    end
end

function teleport(pos)
    local tween = TweenService:Create(Player.Character.HumanoidRootPart, TweenInfo.new(1), {CFrame = CFrame.new(pos)})
    tween:Play()
    tween.Completed:Wait()
end

while wait(1) do
    pcall(function()
        local questName, questPos, enemyName = getQuest()
        if questName then
            -- Accept Quest
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(questPos)
            wait(2)
            ReplicatedStorage.Remotes.Comm:InvokeServer("StartQuest", questName, 1)

            -- Attack Loop
            for _,v in pairs(workspace.Enemies:GetChildren()) do
                if v.Name == enemyName and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    teleport(v.HumanoidRootPart.Position + Vector3.new(0, 5, 0))
                    while v.Humanoid.Health > 0 do
                        ReplicatedStorage.Remotes.Comm:InvokeServer("Attack", "Melee") -- Replace with proper attack method
                        wait(0.5)
                    end
                end
            end
        end
    end)
end
