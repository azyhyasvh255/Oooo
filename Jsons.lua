repeat wait() until game:IsLoaded()

local plr = game.Players.LocalPlayer
local hrp = plr.Character:WaitForChild("HumanoidRootPart")

-- Server hop function
local function serverHop()
    local HttpService = game:GetService("HttpService")
    local servers = {}
    local req = syn and syn.request or http_request or request
    local response = req({
        Url = "https://games.roblox.com/v1/games/2753915549/servers/Public?sortOrder=Asc&limit=100"
    })

    local data = HttpService:JSONDecode(response.Body)

    for i,v in pairs(data.data) do
        if v.playing < v.maxPlayers and v.id ~= game.JobId then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id, plr)
            break
        end
    end
end

-- Function to collect chests
local function collectChests()
    local chestCount = 0
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("Model") and string.find(v.Name, "Chest") and v:FindFirstChild("TouchInterest") then
            chestCount += 1
            hrp.CFrame = v:GetPivot() + Vector3.new(0, 2, 0)
            wait(0.5)
        end
    end
    return chestCount
end

-- Main loop
while true do
    local got = collectChests()
    if got == 0 then
        serverHop()
        wait(5) -- wait for teleport
    else
        wait(2) -- wait before next scan
    end
end
