local backgroundColor = Color3.new(1, 1, 1)
local borderColor = Color3.fromRGB(169, 169, 169)
local borderWidth = 2
local transparency = 0.8

local darkThemeGui = Instance.new("ScreenGui")
darkThemeGui.Name = "DarkThemeGui"
darkThemeGui.ResetOnSpawn = false
darkThemeGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 400, 0, 250)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
mainFrame.BackgroundColor3 = backgroundColor
mainFrame.BackgroundTransparency = transparency
mainFrame.BorderColor3 = borderColor
mainFrame.BorderSizePixel = borderWidth
mainFrame.Parent = darkThemeGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = mainFrame

local textBox = Instance.new("TextBox")
textBox.Name = "TextBox"
textBox.Size = UDim2.new(0, 380, 0, 40)
textBox.Position = UDim2.new(0.5, -190, 0.5, -60)
textBox.BackgroundColor3 = backgroundColor
textBox.TextColor3 = Color3.new(0, 0, 0)
textBox.BorderSizePixel = borderWidth
textBox.BorderColor3 = borderColor
textBox.BackgroundTransparency = 0.5
textBox.PlaceholderText = "Enter Command ( Prefix ; )"
textBox.Parent = mainFrame

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.new(1, 0, 0)
closeButton.BackgroundTransparency = 1
closeButton.BorderSizePixel = 0
closeButton.TextColor3 = Color3.new(1, 0, 0)
closeButton.Parent = mainFrame

closeButton.MouseButton1Click:Connect(function()
    darkThemeGui:Destroy()
end)

local commandPrefix = ";"
local commands = loadstring(game:HttpGet("https://raw.githubusercontent.com/10memati/infinity-hub/main/commands.lua"))()

textBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local commandText = textBox.Text
        if commandText:sub(1, #commandPrefix) == commandPrefix then
            local args = {}
            for arg in commandText:sub(#commandPrefix + 1):gmatch("%S+") do
                table.insert(args, arg)
            end

            local commandName = table.remove(args, 1)

            if commandName == "tp" then  -- "==", "===" değil
                local player1 = findUser(args[1])
                local player2 = findUser(args[2])
                if player1 and player2 then
                    commands.tp(player1, player2)
                else
                    print("Player not found.")
                end
            else
                print("Invalid command: " .. commandName)
            end
        end
    end
end)

darkThemeGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

function findUser(targetNameStart)
    targetNameStart = string.lower(targetNameStart) -- Girilen adı küçük harfe dönüştür

    for _, player in pairs(game.Players:GetPlayers()) do
        local playerName = string.lower(player.Name) -- Oyuncu adını küçük harfe dönüştür

        if playerName:sub(1, #targetNameStart) == targetNameStart then
            return player
        end
    end

    return nil
end
