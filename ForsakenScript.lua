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
      FolderName = Forsakenedxd, -- Create a custom folder for your hub/game
      FileName = "Forsakenedyezz"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
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

local function GetAssetList()
		local url = "https://api.github.com/repos/RobloxGamerblx/test/git/trees/main?recursive=1"
		local assetList = {}

		local success, errorMessage = pcall(function()
			local Request = http_request or syn.request or request
			if Request then
				local response = Request({
					Url = url,
					Method = "GET",
					Headers = { ["Content-Type"] = "application/json" },
				})

				if response and response.Body then
					local data = game:GetService("HttpService"):JSONDecode(response.Body)
					for _, item in ipairs(data.tree) do
						if
							item.path:match("^Assets/.+%.png$")
							or item.path:match("^Assets/.+%.mp4$")
							or item.path:match("Assets/(.+)%.mp3$")
						then
							local rawUrl = "https://raw.githubusercontent.com/RobloxGamerblx/test/main/" .. item.path
							table.insert(assetList, rawUrl)

							local name = item.path:match("Assets/(.+)%.png$") or item.path:match("Assets/(.+)%.mp4$")
							if name then
								table.insert(NameProtectNames, name)
							end
							
						end
					end
				end
			end
		end)

		if not success then
			Rayfield:Notify({ Title = "Error", Content = errorMessage, Duration = 5 })
		end
		return assetList
	end

		local function DownloadBallers(url, path)
			if not isfile(path) then
				local suc, res = pcall(function()
					return game:HttpGet(url, true)
				end)
				if not suc or res == "404: Not Found" then
					Rayfield:Notify({ Title = "Error", Content = "erm not found", Duration = 5 })
				end
				writefile(path, res)
			end
		end

		local function CheckIfFartsDownloaded()
			local assetList = GetAssetList()
			local basePath = "Forsakenedxd/Assets/"

			if not isfolder("Forsakenedxd") then
				makefolder("Forsakenedxd")
			end

			if not isfolder(basePath) then
				makefolder(basePath)
			end

			for _, url in ipairs(assetList) do
				local filePath = basePath .. url:match("Assets/(.+)")
				if filePath then
					local newFilePath = filePath:gsub("%.png$", ".png"):gsub("%.mp4$", ".mp4"):gsub("%.mp3$", ".mp3")

					if not isfile(newFilePath) then
						local folderPath = newFilePath:match("(.*/)")
						if folderPath and not isfolder(folderPath) then
							makefolder(folderPath)
						end
						DownloadBallers(url, newFilePath)
						Rayfield:Notify({ Title = "Downloaded", Content = newFilePath, Duration = 1, Image = "download" })
					end
				end
			end
		end

setclipboard("https://discord.gg/xNdWfmYyq8")
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
local Tab = Window:CreateTab("Last Man Standing", "Happy")
local Section = Tab:CreateSection("Last Music")

local Dropdown = Tab:CreateDropdown({
   Name = "LastmanStanding",
   Options = {"ShedletskyOLD","ShedletskyNEW"},
   CurrentOption = {"ShedletskyOLD"},
   MultipleOptions = false,
   Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Options)
 CurrentSound = MusicList[Options[1]]
				if ReplaceStandingMusic then
					ChangeMusic(CurrentSound)
				end
			end,
		})

local Toggle = Tab:CreateToggle({
			Name = "Replace Last Standing Music",
			CurrentValue = false,
			Callback = function(state)
				LastStandingReplacement(state)
				if ReplaceStandingMusic then
					ChangeMusic(CurrentSound)
				end
			end,
		})

   -- The variable (Options) is a table of strings for the current selected options
   end,
})
