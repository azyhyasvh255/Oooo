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

-- Auto Farming Logic
spawn(function()
	while true do
		wait(1)
		if autoFarm then
			local char = player.Character
			local hrp = char:FindFirstChild("HumanoidRootPart")

			-- Step 1: Go to MPC
			local mpc = workspace:FindFirstChild("MPC")
			if mpc and mpc:FindFirstChild("HumanoidRootPart") then
				hrp.CFrame = mpc.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
				wait(1)
				fireproximityprompt(mpc.ProximityPrompt)  -- For dialogue accept
				wait(2)
			end

			-- Step 2: Skip TV and DP
			-- Optional: Add skip logic if needed

			-- Step 3: Fly toward MBC
			local mbc = workspace:FindFirstChild("MBC")
			if mbc and mbc:FindFirstChild("HumanoidRootPart") then
				for i = 1, 10 do
					hrp.CFrame = hrp.CFrame:Lerp(mbc.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0), 0.3)
					wait(0.2)
				end
			end

			-- Step 4: Attack MBC
			local attackSpeed = 0.4  -- 0.1 = fast, 1 = slow
			while mbc and mbc:FindFirstChild("Humanoid") and mbc.Humanoid.Health > 0 and autoFarm do
				-- Position near MBC
				hrp.CFrame = mbc.HumanoidRootPart.CFrame + Vector3.new(0, 2, 0)
				-- Trigger attack (assuming keypress or remote)
				game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
				wait(attackSpeed)
			end
		end
	end
end)
