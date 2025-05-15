repeat wait() until game:IsLoaded()

local plr = game.Players.LocalPlayer
local rs = game:GetService("ReplicatedStorage")
local ts = game:GetService("TweenService")

-- Teleport function
function teleport(pos)
    local hrp = plr.Character:WaitForChild("HumanoidRootPart")
    local tween = ts:Create(hrp, TweenInfo.new(1), {CFrame = CFrame.new(pos)})
    tween:Play()
    tween.Completed:Wait()
end

-- Bandit finder
function getBandit()
    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
        if v.Name == "Bandit" and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            return v
        end
    end
    return nil
end

-- Attack function (simple tool swing)
function attack()
    local tool = plr.Character:FindFirstChildOfClass("Tool")
    if tool then
        tool:Activate()
    end
end

while true do
    pcall(function()
        -- Quest Status Check
        if not plr.PlayerGui:FindFirstChild("QuestGUI") then
            teleport(Vector3.new(1060, 16, 1547))  -- NPC location
            wait(1)
            rs.Remotes.Comm:InvokeServer("StartQuest", "BanditQuest1", 1)
            wait(1)
        end

        -- Attack Loop
        local target = getBandit()
        while target and target.Humanoid.Health > 0 do
            teleport(target.HumanoidRootPart.Position + Vector3.new(0, 3, 0))
            attack()
            wait(0.5)
            target = getBandit()
        end
    end)
    wait(1)
end
