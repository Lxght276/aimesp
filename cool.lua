-- Roblox ESP + Aimbot Script with GUI (Fixed ESP Refresh)
-- WARNING: This is for educational purposes only. Using this in games may violate terms of service.

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Lxght's niggermenu"
ScreenGui.Parent = game.CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 300, 0, 350)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Text = "ESP & Aimbot"
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18
Title.Parent = MainFrame

-- ESP Settings
local ESPFrame = Instance.new("Frame")
ESPFrame.Name = "ESPFrame"
ESPFrame.Size = UDim2.new(1, -10, 0, 100)
ESPFrame.Position = UDim2.new(0, 5, 0, 35)
ESPFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ESPFrame.Parent = MainFrame

local ESPTitle = Instance.new("TextLabel")
ESPTitle.Name = "ESPTitle"
ESPTitle.Size = UDim2.new(1, 0, 0, 20)
ESPTitle.Position = UDim2.new(0, 0, 0, 0)
ESPTitle.BackgroundTransparency = 1
ESPTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPTitle.Text = "ESP Settings"
ESPTitle.Font = Enum.Font.SourceSansBold
ESPTitle.TextSize = 16
ESPTitle.Parent = ESPFrame

local ESPToggle = Instance.new("TextButton")
ESPToggle.Name = "ESPToggle"
ESPToggle.Size = UDim2.new(0.4, 0, 0, 25)
ESPToggle.Position = UDim2.new(0.05, 0, 0, 25)
ESPToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ESPToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPToggle.Text = "ESP: OFF"
ESPToggle.Font = Enum.Font.SourceSans
ESPToggle.TextSize = 14
ESPToggle.Parent = ESPFrame

local ESPColorLabel = Instance.new("TextLabel")
ESPColorLabel.Name = "ESPColorLabel"
ESPColorLabel.Size = UDim2.new(0.4, 0, 0, 20)
ESPColorLabel.Position = UDim2.new(0.05, 0, 0, 55)
ESPColorLabel.BackgroundTransparency = 1
ESPColorLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPColorLabel.Text = "ESP Color:"
ESPColorLabel.Font = Enum.Font.SourceSans
ESPColorLabel.TextSize = 14
ESPColorLabel.TextXAlignment = Enum.TextXAlignment.Left
ESPColorLabel.Parent = ESPFrame

local ESPColor = Instance.new("TextButton")
ESPColor.Name = "ESPColor"
ESPColor.Size = UDim2.new(0.2, 0, 0, 20)
ESPColor.Position = UDim2.new(0.45, 0, 0, 55)
ESPColor.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
ESPColor.Text = ""
ESPColor.Parent = ESPFrame

-- Aimbot Settings
local AimbotFrame = Instance.new("Frame")
AimbotFrame.Name = "AimbotFrame"
AimbotFrame.Size = UDim2.new(1, -10, 0, 150)
AimbotFrame.Position = UDim2.new(0, 5, 0, 140)
AimbotFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
AimbotFrame.Parent = MainFrame

local AimbotTitle = Instance.new("TextLabel")
AimbotTitle.Name = "AimbotTitle"
AimbotTitle.Size = UDim2.new(1, 0, 0, 20)
AimbotTitle.Position = UDim2.new(0, 0, 0, 0)
AimbotTitle.BackgroundTransparency = 1
AimbotTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotTitle.Text = "Aimbot Settings"
AimbotTitle.Font = Enum.Font.SourceSansBold
AimbotTitle.TextSize = 16
AimbotTitle.Parent = AimbotFrame

local AimbotToggle = Instance.new("TextButton")
AimbotToggle.Name = "AimbotToggle"
AimbotToggle.Size = UDim2.new(0.4, 0, 0, 25)
AimbotToggle.Position = UDim2.new(0.05, 0, 0, 25)
AimbotToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
AimbotToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotToggle.Text = "Aimbot: OFF"
AimbotToggle.Font = Enum.Font.SourceSans
AimbotToggle.TextSize = 14
AimbotToggle.Parent = AimbotFrame

local AimbotKeybindLabel = Instance.new("TextLabel")
AimbotKeybindLabel.Name = "AimbotKeybindLabel"
AimbotKeybindLabel.Size = UDim2.new(0.4, 0, 0, 20)
AimbotKeybindLabel.Position = UDim2.new(0.05, 0, 0, 55)
AimbotKeybindLabel.BackgroundTransparency = 1
AimbotKeybindLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotKeybindLabel.Text = "Aimbot Keybind:"
AimbotKeybindLabel.Font = Enum.Font.SourceSans
AimbotKeybindLabel.TextSize = 14
AimbotKeybindLabel.TextXAlignment = Enum.TextXAlignment.Left
AimbotKeybindLabel.Parent = AimbotFrame

local AimbotKeybind = Instance.new("TextButton")
AimbotKeybind.Name = "AimbotKeybind"
AimbotKeybind.Size = UDim2.new(0.4, 0, 0, 25)
AimbotKeybind.Position = UDim2.new(0.45, 0, 0, 55)
AimbotKeybind.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
AimbotKeybind.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotKeybind.Text = "RightControl"
AimbotKeybind.Font = Enum.Font.SourceSans
AimbotKeybind.TextSize = 14
AimbotKeybind.Parent = AimbotFrame

local AimbotFOVLabel = Instance.new("TextLabel")
AimbotFOVLabel.Name = "AimbotFOVLabel"
AimbotFOVLabel.Size = UDim2.new(0.4, 0, 0, 20)
AimbotFOVLabel.Position = UDim2.new(0.05, 0, 0, 85)
AimbotFOVLabel.BackgroundTransparency = 1
AimbotFOVLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotFOVLabel.Text = "Aimbot FOV:"
AimbotFOVLabel.Font = Enum.Font.SourceSans
AimbotFOVLabel.TextSize = 14
AimbotFOVLabel.TextXAlignment = Enum.TextXAlignment.Left
AimbotFOVLabel.Parent = AimbotFrame

local AimbotFOV = Instance.new("TextBox")
AimbotFOV.Name = "AimbotFOV"
AimbotFOV.Size = UDim2.new(0.4, 0, 0, 25)
AimbotFOV.Position = UDim2.new(0.45, 0, 0, 85)
AimbotFOV.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
AimbotFOV.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotFOV.Text = "100"
AimbotFOV.Font = Enum.Font.SourceSans
AimbotFOV.TextSize = 14
AimbotFOV.Parent = AimbotFrame

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0.9, 0, 0, 30)
CloseButton.Position = UDim2.new(0.05, 0, 0, 300)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Text = "Close"
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextSize = 16
CloseButton.Parent = MainFrame

-- Variables
local ESPEnabled = false
local AimbotEnabled = false
local AimbotKeybindEnum = Enum.KeyCode.RightControl
local ESPColorValue = Color3.fromRGB(255, 0, 0)
local AimbotFOVValue = 100

local ESPBoxes = {}
local ESPNames = {}
local ESPHealths = {}
local PlayerConnections = {}

-- Functions
local function RemoveESP(player)
    if ESPBoxes[player] then
        ESPBoxes[player]:Destroy()
        ESPBoxes[player] = nil
    end
    if ESPNames[player] then
        ESPNames[player]:Destroy()
        ESPNames[player] = nil
    end
    if ESPHealths[player] then
        if ESPHealths[player][1] then
            ESPHealths[player][1]:Destroy()
        end
        if ESPHealths[player][2] then
            ESPHealths[player][2]:Disconnect()
        end
        ESPHealths[player] = nil
    end
end

local function CreateESP(player)
    -- First remove any existing ESP for this player
    RemoveESP(player)
    
    local character = player.Character or player.CharacterAdded:Wait()
    if not character then return end
    
    -- Wait for necessary parts to load
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
    local humanoid = character:WaitForChild("Humanoid", 5)
    local head = character:WaitForChild("Head", 5)
    
    if not humanoidRootPart or not humanoid or not head then return end
    
    -- Create ESP Box
    local box = Instance.new("BoxHandleAdornment")
    box.Name = player.Name .. "_ESP"
    box.Adornee = humanoidRootPart
    box.AlwaysOnTop = true
    box.ZIndex = 10
    box.Size = Vector3.new(2, 3, 1)
    box.Transparency = 0.7
    box.Color3 = ESPColorValue
    box.Parent = humanoidRootPart
    
    -- Create Name Label
    local nameLabel = Instance.new("BillboardGui")
    nameLabel.Name = player.Name .. "_Name"
    nameLabel.Adornee = head
    nameLabel.Size = UDim2.new(0, 100, 0, 40)
    nameLabel.StudsOffset = Vector3.new(0, 2.5, 0)
    nameLabel.AlwaysOnTop = true
    
    local nameText = Instance.new("TextLabel")
    nameText.Name = "NameText"
    nameText.Size = UDim2.new(1, 0, 0, 20)
    nameText.Position = UDim2.new(0, 0, 0, 0)
    nameText.BackgroundTransparency = 1
    nameText.TextColor3 = ESPColorValue
    nameText.Text = player.Name
    nameText.Font = Enum.Font.SourceSansBold
    nameText.TextSize = 16
    nameText.Parent = nameLabel
    
    nameLabel.Parent = head
    
    -- Create Health Label
    local healthLabel = Instance.new("BillboardGui")
    healthLabel.Name = player.Name .. "_Health"
    healthLabel.Adornee = head
    healthLabel.Size = UDim2.new(0, 100, 0, 40)
    healthLabel.StudsOffset = Vector3.new(0, 1.5, 0)
    healthLabel.AlwaysOnTop = true
    
    local healthText = Instance.new("TextLabel")
    healthText.Name = "HealthText"
    healthText.Size = UDim2.new(1, 0, 0, 20)
    healthText.Position = UDim2.new(0, 0, 0, 0)
    healthText.BackgroundTransparency = 1
    healthText.TextColor3 = ESPColorValue
    healthText.Text = "HP: " .. math.floor(humanoid.Health)
    healthText.Font = Enum.Font.SourceSans
    healthText.TextSize = 14
    healthText.Parent = healthLabel
    
    healthLabel.Parent = head
    
    -- Health update connection
    local healthConnection = humanoid:GetPropertyChangedSignal("Health"):Connect(function()
        if ESPEnabled and healthText then
            healthText.Text = "HP: " .. math.floor(humanoid.Health)
        end
    end)
    
    -- Store references
    ESPBoxes[player] = box
    ESPNames[player] = nameLabel
    ESPHealths[player] = {healthLabel, healthConnection}
end

local function ToggleESP()
    ESPEnabled = not ESPEnabled
    ESPToggle.Text = "ESP: " .. (ESPEnabled and "ON" or "OFF")
    
    if ESPEnabled then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                CreateESP(player)
            end
        end
    else
        for player, _ in pairs(ESPBoxes) do
            RemoveESP(player)
        end
    end
end

local function GetClosestPlayerToCursor()
    local closestPlayer = nil
    local shortestDistance = math.huge
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
            local humanoid = player.Character:FindFirstChild("Humanoid")
            
            if humanoidRootPart and humanoid and humanoid.Health > 0 then
                local screenPoint, onScreen = Camera:WorldToViewportPoint(humanoidRootPart.Position)
                
                if onScreen then
                    local mouseLocation = UserInputService:GetMouseLocation()
                    local distance = (Vector2.new(mouseLocation.X, mouseLocation.Y) - Vector2.new(screenPoint.X, screenPoint.Y)).magnitude
                    
                    if distance < shortestDistance and distance <= AimbotFOVValue then
                        shortestDistance = distance
                        closestPlayer = player
                    end
                end
            end
        end
    end
    
    return closestPlayer
end

local function AimAt(target)
    if not target or not target.Character then return end
    
    local humanoidRootPart = target.Character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    Camera.CFrame = CFrame.new(Camera.CFrame.Position, humanoidRootPart.Position)
end

-- Player Tracking System
local function SetupPlayer(player)
    if player == LocalPlayer then return end
    
    -- Clean up any existing connections
    if PlayerConnections[player] then
        for _, connection in ipairs(PlayerConnections[player]) do
            connection:Disconnect()
        end
    end
    
    PlayerConnections[player] = {}
    
    -- Handle existing character
    if player.Character then
        if ESPEnabled then
            CreateESP(player)
        end
    end
    
    -- Handle character changes
    table.insert(PlayerConnections[player], player.CharacterAdded:Connect(function(character)
        if ESPEnabled then
            CreateESP(player)
        end
    end))
    
    -- Clean up when player leaves
    table.insert(PlayerConnections[player], player.AncestryChanged:Connect(function(_, parent)
        if not parent then
            RemoveESP(player)
        end
    end))
    
    table.insert(PlayerConnections[player], player.CharacterRemoving:Connect(function()
        RemoveESP(player)
    end))
end

-- Initialize for existing players
for _, player in ipairs(Players:GetPlayers()) do
    SetupPlayer(player)
end

Players.PlayerAdded:Connect(function(player)
    SetupPlayer(player)
end)

Players.PlayerRemoving:Connect(function(player)
    RemoveESP(player)
    if PlayerConnections[player] then
        for _, connection in ipairs(PlayerConnections[player]) do
            connection:Disconnect()
        end
        PlayerConnections[player] = nil
    end
end)

-- GUI Events
ESPToggle.MouseButton1Click:Connect(ToggleESP)

ESPColor.MouseButton1Click:Connect(function()
    local color = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
    ESPColorValue = color
    ESPColor.BackgroundColor3 = color
    
    if ESPEnabled then
        for _, box in pairs(ESPBoxes) do
            if box then
                box.Color3 = color
            end
        end
        for _, nameLabel in pairs(ESPNames) do
            if nameLabel then
                local textLabel = nameLabel:FindFirstChild("NameText")
                if textLabel then
                    textLabel.TextColor3 = color
                end
            end
        end
        for _, healthData in pairs(ESPHealths) do
            if healthData and healthData[1] then
                local healthText = healthData[1]:FindFirstChild("HealthText")
                if healthText then
                    healthText.TextColor3 = color
                end
            end
        end
    end
end)

AimbotToggle.MouseButton1Click:Connect(function()
    AimbotEnabled = not AimbotEnabled
    AimbotToggle.Text = "Aimbot: " .. (AimbotEnabled and "ON" or "OFF")
end)

AimbotKeybind.MouseButton1Click:Connect(function()
    AimbotKeybind.Text = "Press a key..."
    
    local connection
    connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed then
            if input.UserInputType == Enum.UserInputType.Keyboard then
                AimbotKeybindEnum = input.KeyCode
                AimbotKeybind.Text = tostring(input.KeyCode):gsub("Enum.KeyCode.", "")
            end
            connection:Disconnect()
        end
    end)
end)

AimbotFOV.FocusLost:Connect(function()
    local num = tonumber(AimbotFOV.Text)
    if num then
        AimbotFOVValue = math.clamp(num, 10, 1000)
        AimbotFOV.Text = tostring(AimbotFOVValue)
    else
        AimbotFOV.Text = tostring(AimbotFOVValue)
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Aimbot Loop
RunService.RenderStepped:Connect(function()
    if AimbotEnabled and UserInputService:IsKeyDown(AimbotKeybindEnum) then
        local closestPlayer = GetClosestPlayerToCursor()
        if closestPlayer then
            AimAt(closestPlayer)
        end
    end
end)
