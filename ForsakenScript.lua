local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Forsakened.xd",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by UNknown dude",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = ForsakenedIsReal, -- Create a custom folder for your hub/game
      FileName = "Forsakenedyezz"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "xNdWfmYyq8", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Get key to using that sh@t",
      Subtitle = "Key System",
      Note = "Get fuckng key in discord server (not ended fully)", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"c00lguiwth"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Animations", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Main")

local Button = Tab:CreateButton({
   Name = "Spam Gangnam Style",
   Callback = function()
_G.anim = true

while _G.anim do
local args = {
    [1] = "PlayEmote",
    [2] = "Animations",
    [3] = "GangnamStyle"
}

game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
wait(0)
end
   end,
})
local Button = Tab:CreateButton({
   Name = "Brickbattler spam",
   Callback = function()
_G.anim = true
            
while _G.anim do
local args = {
    [1] = "PlayEmote",
    [2] = "Animations",
    [3] = "Brickbattler"
}

game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
wait(0)
end
   end,
})

local Button = Tab:CreateButton({
   Name = "Jumpstyle spam",
   Callback = function()
_G.anim = true
            
while _G.anim do
local args = {
    [1] = "PlayEmote",
    [2] = "Animations",
    [3] = "Jumpstyle"
}

game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
wait(0)
end
   end,
})

local Button = Tab:CreateButton({
   Name = "Stop Animations",
   Callback = function()
_G.anim = false

while _G.anim do
local args = {
    [1] = "PlayEmote",
    [2] = "Animations",
}

game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
wait(0)
end
   end,
})

local Tab = Window:CreateTab("Annoying for peoples", "angry")
local Section = Tab:CreateSection("ESP")

local Toggle = Tab:CreateButton({
   Name = "ESP",
   Callback = function()
local Players = cloneref(game:GetService("Players"))
local RunService = cloneref(game:GetService("RunService"))
local Workspace = cloneref(game:GetService("Workspace"))


local function createTextLabel(tool)
    
    if tool:FindFirstChild("ToolNameLabel") then return end

    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ToolNameLabel"
    billboard.Adornee = tool
    billboard.Size = UDim2.new(0, 100, 0, 30)
    billboard.StudsOffset = Vector3.new(0, 2, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = math.huge

    
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = tool.Name
    textLabel.TextColor3 = Color3.new(1, 1, 1) -- White text
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.Parent = billboard

    
    billboard.Parent = tool
end

local function applyOutline(tool)
    -- Check if it already has a highlight
    if not tool:FindFirstChildOfClass("Highlight") then
        local highlight = Instance.new("Highlight")
        highlight.FillColor = Color3.new(1, 1, 0) -- Yellow glow
        highlight.OutlineColor = Color3.new(1, 0, 0) -- Red outline
        highlight.Parent = tool
    end

    
    createTextLabel(tool)
end


for _, obj in Workspace:GetDescendants() do
    if obj:IsA("Tool") and not (obj.Name == "RedFlag" or obj.Name == "BlueFlag" or obj.Name == "Item") then
        applyOutline(obj)
    end
end


Workspace.DescendantAdded:Connect(function(obj)
    if obj:IsA("Tool") then
        applyOutline(obj)
    end
end)


game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Item Esp"; Text = "Loaded!"; Duration = 5})



local function createOutlineESP(model, outlineColor, fillColor)
    if model and not model:FindFirstChildOfClass("Highlight") then
        local highlight = Instance.new("Highlight")
        highlight.Parent = model
        highlight.Adornee = model
        highlight.FillTransparency = 0.75
        highlight.FillColor = fillColor
        highlight.OutlineColor = outlineColor
        highlight.OutlineTransparency = 0 
    end
end

local function createHealthIndicator(character, textColor)
    local head = character:FindFirstChild("Head")
    if head and not head:FindFirstChild("HealthGui") then
        local healthGui = Instance.new("BillboardGui")
        healthGui.Name = "HealthGui"
        healthGui.Size = UDim2.new(0, 100, 0, 30)
        healthGui.AlwaysOnTop = true
        healthGui.MaxDistance = math.huge
        healthGui.Parent = head

        local healthLabel = Instance.new("TextLabel")
        healthLabel.Size = UDim2.new(1, 0, 1, 0)
        healthLabel.BackgroundTransparency = 1
        healthLabel.TextScaled = true
        healthLabel.Text = ""
        healthLabel.TextColor3 = textColor
        healthLabel.Font = Enum.Font.SourceSansBold
        healthLabel.Parent = healthGui
    end
end

local function updateHealthIndicators()
    for _, player in Players:GetPlayers() do
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            local head = character:FindFirstChild("Head")
            if humanoid and head then
                local textColor = humanoid.MaxHealth > 500 and Color3.new(1, 0, 0) or Color3.new(1, 1, 1) -- Red if max HP > 500
                createHealthIndicator(character, textColor)
                
                local healthGui = head:FindFirstChild("HealthGui")
                if healthGui then
                    local healthLabel = healthGui:FindFirstChildOfClass("TextLabel")
                    if healthLabel then
                        healthLabel.Text = math.floor(humanoid.Health) .. "/" .. humanoid.MaxHealth
                        healthLabel.TextColor3 = textColor
                    end
                end
            end
        end
    end
end

local function createOutlineESPForGroup(group, outlineColor, fillColor)
    if group then
        for _, obj in group:GetChildren() do
            local humanoid = obj:FindFirstChildOfClass("Humanoid")
            local rootPart = obj:FindFirstChild("HumanoidRootPart")
            if humanoid and rootPart then
                createOutlineESP(obj, outlineColor, fillColor)
            end
        end
    end
end

local function highlightGenerators()
    for _, obj in workspace:GetDescendants() do
    if obj:IsA("Model") and obj.Name == "Generator" then
        createOutlineESP(obj, Color3.new(1, 1, 0), Color3.new(1, 1, 0.5)) -- Yellow outline, light yellow fill
    end
end
end

local function updateESP()
    while true do
        local players = Players:GetPlayers() -- Store once to avoid multiple function calls

        for _, player in players do
            local character = player.Character
            if character then
                -- Clear existing highlights
                for _, obj in character:GetChildren() do
                    if obj:IsA("Highlight") then
                        obj:Destroy()
                    end
                end

                -- check if humanoid root part have property in robloxia
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    if humanoid.MaxHealth > 500 then
                        -- idk
                        createOutlineESP(character, Color3.new(1, 0, 0), Color3.new(1, 0.5, 0.5))
                        createHealthIndicator(character, Color3.new(1, 0, 0))
                    else
                        -- killars
                        createOutlineESP(character, Color3.new(0.5, 0.5, 0.5), Color3.new(0.7, 0.7, 0.7))
                        createHealthIndicator(character, Color3.new(1, 1, 1))
                    end
                end
            end
        end

        
        updateHealthIndicators()
        highlightGenerators()
        

        task.wait(3) -- More accurate and efficient timing
    end
end
game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Esp"; Text = "Loaded!"; Duration = 20})
task.spawn(updateESP())
   end,
})

local Section = Tab:CreateSection("Helper")
local Button = Tab:CreateButton({
   Name = "remove blur",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxGamerblx/test/refs/heads/main/Time%20Change"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "day",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxGamerblx/test/refs/heads/main/timechange2"))()
   end,
})

local Slider = Tab:CreateSlider({
   Name = "Max Stamina",
   Range = {90, 125},
   Increment = 10,
   Suffix = "Of Stamina",
   CurrentValue = 100,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
local Sprinting = game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting
local m = require(Sprinting)
m.MaxStamina = Value
m.StaminaGain = 15



m.StaminaLoss = 10
m.SprintSpeed = 26
   -- The variable (Value) is a number which correlates to the value the slider is currently at
   end,
})

local Slider = Tab:CreateSlider({
   Name = "Stamina",
   Range = {25, 28},
   Increment = 10,
   Suffix = "Of speed",
   CurrentValue = 100,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
local Sprinting = game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting
local m = require(Sprinting)
m.MaxStamina = 100
m.StaminaGain = 15



m.StaminaLoss = 10
m.SprintSpeed = Value
   end,
})

local Tab = Window:CreateTab("Settings Themes", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Themes")

local Button = Tab:CreateButton({
   Name = "Default",
   Callback = function()
   Window.ModifyTheme('Default')
   end,
})

local Button = Tab:CreateButton({
   Name = "Amber Glow",
   Callback = function()
   Window.ModifyTheme('AmberGlow')
   end,
})

local Button = Tab:CreateButton({
   Name = "Amethyst",
   Callback = function()
   Window.ModifyTheme('Amethyst')
   end,
})

local Button = Tab:CreateButton({
   Name = "Bloom",
   Callback = function()
   Window.ModifyTheme('Bloom')
   end,
})

local Button = Tab:CreateButton({
   Name = "Dark Blue",
   Callback = function()
   Window.ModifyTheme('DarkBlue')
   end,
})

local Button = Tab:CreateButton({
   Name = "Green",
   Callback = function()
   Window.ModifyTheme('Green')
   end,
})

local Button = Tab:CreateButton({
   Name = "Get blinded",
   Callback = function()
   Window.ModifyTheme('Light')
   end,
})

local Button = Tab:CreateButton({
   Name = "Ocean",
   Callback = function()
   Window.ModifyTheme('Ocean')
   end,
})

local Button = Tab:CreateButton({
   Name = "Serenity",
   Callback = function()
   Window.ModifyTheme('Serenity')
   end,
})

Rayfield:LoadConfiguration()
