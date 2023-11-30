local commands = {}

commands.tp = function(player, targetPlayer)
    local playerCharacter = player.Character
    local targetPlayerCharacter = targetPlayer.Character

    if playerCharacter and targetPlayerCharacter then
        local playerHumanoidRootPart = playerCharacter:FindFirstChild("HumanoidRootPart")
        local targetHumanoidRootPart = targetPlayerCharacter:FindFirstChild("HumanoidRootPart")

        if playerHumanoidRootPart and targetHumanoidRootPart then
            playerCharacter:SetPrimaryPartCFrame(targetHumanoidRootPart.CFrame * CFrame.new(0, 5, 0))
            print(player.Name .. " teleported to " .. targetPlayer.Name)
        else
            print("Error: Missing HumanoidRootPart for teleportation.")
        end
    else
        print("Error: Missing character for teleportation.")
    end
end

commands.kill = function(targetPlayer)
    local targetCharacter = targetPlayer.Character

    if targetCharacter then
        local targetHumanoid = targetCharacter:FindFirstChildOfClass("Humanoid")

        if targetHumanoid then
            targetHumanoid.Health = 0
            print(targetPlayer.Name .. " has been killed.")
        else
            print("Error: Target player has no Humanoid.")
        end
    else
        print("Error: Target player has no character.")
    end
end

commands.godmode = function(player)
    local playerCharacter = player.Character

    if playerCharacter then
        local playerHumanoid = playerCharacter:FindFirstChildOfClass("Humanoid")

        if playerHumanoid then
            playerHumanoid.Health = math.huge
            print(player.Name .. " is now in god mode.")
        else
            print("Error: Player has no Humanoid.")
        end
    else
        print("Error: Player has no character.")
    end
end

return commands
  
