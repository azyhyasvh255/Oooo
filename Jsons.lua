-- Gui Setup
local player = game.Players.LocalPlayer
local autoFarm = false

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
local button = Instance.new("TextButton", gui)

button.Size = UDim2.new(0, 160, 0, 50)
button.Position = UDim2.new(0.8, 0, 0.2, 0)
button.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
button.Text = "Auto Farm: OFF"
button.TextScaled = true

button.MouseButton1Click:Connect(function()
	autoFarm = not autoFarm
	button.Text = "Auto Farm: " .. (autoFarm and "ON" or "OFF")
	button.BackgroundColor3 = autoFarm and Color3.fromRGB(80, 255, 80) or Color3.fromRGB(255, 80, 80)
end)

-- Attack Script Setup
local CbFw = debug.getupvalues(require(player.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]

function GetCurrentBlade()
    local p13 = CbFw2.activeController
    local ret = p13.blades[1]
    if not ret then return end
    while ret.Parent ~= player.Character do ret = ret.Parent end
    return ret
end

function AttackNoCD()
    local AC = CbFw2.activeController
    local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
        player.Character,
        {player.Character.HumanoidRootPart},
        60
    )
    local cac = {}
    local hash = {}
    for k, v in pairs(bladehit) do
        if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
            table.insert(cac, v.Parent.HumanoidRootPart)
            hash[v.Parent] = true
        end
    end
    bladehit = cac
    if #bladehit > 0 then
        local u8 = debug.getupvalue(AC.attack, 5)
        local u9 = debug.getupvalue(AC.attack, 6)
        local u7 = debug.getupvalue(AC.attack, 4)
        local u10 = debug.getupvalue(AC.attack, 7)
        local u12 = (u8 * 798405 + u7 * 727595) % u9
        local u13 = u7 * 798405
        (function()
            u12 = (u12 * u9 + u13) % 1099511627776
            u8 = math.floor(u12 / u9)
            u7 = u12 - u8 * u9
        end)()
        u10 = u10 + 1
        debug.setupvalue(AC.attack, 5, u8)
        debug.setupvalue(AC.attack, 6, u9)
        debug.setupvalue(AC.attack, 4, u7)
        debug.setupvalue(AC.attack, 7, u10)
        pcall(function()
            for k, v in pairs(AC.animator.anims.basic) do
                v:Play()
            end
        end)
        if player.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then
            game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange", tostring(GetCurrentBlade()))
            game:GetService("ReplicatedStorage").Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
            game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 1, "")
        end
    end
end

-- Auto Farm + Attack
spawn(function()
	while true do
		wait(1)
		if autoFarm then
			local char = player.Character
			local hrp = char:FindFirstChild("HumanoidRootPart")

			local mpc = workspace:FindFirstChild("MPC")
			if mpc and mpc:FindFirstChild("HumanoidRootPart") then
				hrp.CFrame = mpc.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
				wait(1)
				fireproximityprompt(mpc:FindFirstChildOfClass("ProximityPrompt"))
				wait(2)
			end

			local mbc = workspace:FindFirstChild("MBC")
			if mbc and mbc:FindFirstChild("HumanoidRootPart") then
				for i = 1, 10 do
					hrp.CFrame = hrp.CFrame:Lerp(mbc.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0), 0.3)
					wait(0.2)
				end
			end

			while mbc and mbc:FindFirstChild("Humanoid") and mbc.Humanoid.Health > 0 and autoFarm do
				hrp.CFrame = mbc.HumanoidRootPart.CFrame + Vector3.new(0, 2, 0)
				pcall(AttackNoCD)
				wait(0.2)
			end
		end
	end
end)
