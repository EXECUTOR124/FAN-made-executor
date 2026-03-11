local Admins = {
    ["YourUserNameHere"] = true
}

local Commands = {}

-- Teleport command
Commands.tp = function(player, args)
    local targetName = args[1]
    local targetPlayer = game.Players:FindFirstChild(targetName)
    if targetPlayer and targetPlayer.Character then
        player.Character:SetPrimaryPartCFrame(targetPlayer.Character.PrimaryPart.CFrame)
    end
end

-- Speed command
Commands.speed = function(player, args)
    local amount = tonumber(args[1]) or 16
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = amount
    end
end

-- God mode
Commands.god = function(player)
    if player.Character then
        local hum = player.Character:FindFirstChild("Humanoid")
        if hum then hum.MaxHealth = math.huge hum.Health = math.huge end
    end
end

-- Core Remote Function
local RF = Instance.new("RemoteFunction")
RF.Name = "RunDevCommand"
RF.Parent = game.ReplicatedStorage

RF.OnServerInvoke = function(player, commandText)
    if not Admins[player.Name] then return "Not allowed" end

    local split = string.split(commandText, " ")
    local cmd = split[1]
    table.remove(split, 1)

    if Commands[cmd] then
        Commands[cmd](player, split)
        return "Executed"
    else
        return "Unknown command"
    end
end
