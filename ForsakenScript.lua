local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local CurrentFartsActive = {}
local MusicConnections = {}
local LopticaCooldown = false
local ReplaceStandingMusic = false
local aimbotActive = false
local BabyShark = nil
local BlockEnabled = false
local Runners = false
local CurrentSound = "ShedletskyOLD.mp3"

local fart = {
	aimbot = {},
	abilities = {},
	characterChange = nil,
}

local MusicList = {
	["Shed OLD"] = "ShedletskyOLD.mp3",
	["Shed NEW"] = "ShedletskyNEW.mp3",
	["Shed 2"] = "Shedletsky2.mp3",
	["Plead"] = "plead.mp3",
	["Pleadud"] = "Pleadud.mp3",
        ["Curiosity"] = "curiosity.mp3",
	["VIP"] = "vip.mp3",
	["Vanity"] = "vanity.mp3",
	["Cupcakes"] = "smile.mp3"
}

local Window = Rayfield:CreateWindow({
   Name = "Forsakened.xd - BETA VERSION",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by UNknown dude",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = Forsakened, -- Create a custom folder for your hub/game
      FileName = "Forsakened"
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
      Note = "Get fuckng key in discord server ", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"c00lguiwth"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local function JanitorModeEnabled(oklolloolloololololol)
	for _, connection in pairs(oklolloolloololololol) do
		if connection and connection.Connected then
			connection:Disconnect()
		end
	end
	table.clear(oklolloolloololololol)
end

local Tab = Window:CreateTab("Animations", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Main")

local Input = Tab:CreateInput({
   Name = "Animation to run",
   CurrentValue = "",
   PlaceholderText = "Brickbattler",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
local args = {
    [1] = "PlayEmote",
    [2] = "Animations",
    [3] = Text
}

game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
   end,
})

local Tab = Window:CreateTab("Annoying for peoples", "angry")
local Section = Tab:CreateSection("ESP")

local Button = Tab:CreateButton({
   Name = "ESP",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxGamerblx/test/refs/heads/main/ESP%20(beta%20test)"))()
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

local Button = Tab:CreateButton({
   Name = "Boost FPS",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxGamerblx/test/refs/heads/main/boostfps"))()

Rayfield:Notify({
   Title = "Boost FPS",
   Content = "Boosted FPS Succesful (when will lag again use that)",
   Duration = 6.5,
   Image = 4483362458,
})

   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Show Chat",
   CurrentValue = false,
   Callback = function(Value)
 _G.ShowChat = Value
 
 while _G.ShowChat do
 game:GetService("TextChatService").ChatWindowConfiguration.Enabled = Value
 wait()
 end
   end,
})

local Slider = Tab:CreateSlider({
   Name = "Stamina",
   Range = {25, 29},
   Increment = 1,
   Suffix = "Of speed",
   CurrentValue = 26,
   Callback = function(Value)
local Sprinting = game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting
local m = require(Sprinting)
m.MaxStamina = 100
m.StaminaGain = 25



m.StaminaLoss = 10
m.SprintSpeed = Value
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Disable drain stamina",
   CurrentValue = false,
   Callback = function(Value)
local Sprinting = game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting
local m = require(Sprinting)

m.StaminaLossDisabled = Value
   end,
})

local Tab = Window:CreateTab("Aimbot", 4483362458) -- Title, Image
local Section = Tab:CreateSection("c00lkidd aimbot")

local function Aimbot(Dur)
	if not Dur then
		return
	end
	local Char, CharacterGender = GetCharAndFold()
	if not Char or not CharacterGender then
		return
	end

	local Me = game.Players.LocalPlayer
	local MeButCharacter = Me.Character
	if not MeButCharacter or not MeButCharacter:FindFirstChild("HumanoidRootPart") then
		return
	end

	local HornyFolder = workspace:FindFirstChild("Players")
		and workspace.Players:FindFirstChild(CharacterGender == "Killers" and "Survivors" or "Killers")
	if not HornyFolder then
		return
	end

	local function FindClosestPerson()
		local ClosestTarget, ClosestDistance = nil, math.huge
		local MyPosition = MeButCharacter.HumanoidRootPart.Position

		for _, v in pairs(HornyFolder:GetChildren()) do
			if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
				local distance = (v.HumanoidRootPart.Position - MyPosition).Magnitude
				if distance < ClosestDistance then
					ClosestDistance = distance
					ClosestTarget = v
				end
			end
		end
		return ClosestTarget
	end

	local target = FindClosestPerson()
	task.spawn(function()
		pcall(function()
			local success, err = pcall(function()
				if SmoothShiftLock ~= "Unavailable" and not SmoothShiftLock.Enabled then
					SmoothShiftLock:ToggleShiftLock()
				else
					if not game:GetService("UserInputService").MouseBehavior == Enum.MouseBehavior.LockCenter then
						local ShiftlockKeybindEnum =
							game:GetService("Players").LocalPlayer.PlayerData.Settings.Keybinds.ShiftLock.Value
						-- get keycode of shiftlock
						local ShiftlockKeyCode = Enum.KeyCode[ShiftlockKeybindEnum]
						VIM:SendKeyEvent(
							true,
							ShiftlockKeyCode,
							false,
							game:GetService("Players").LocalPlayer.PlayerGui
						)
						VIM:SendKeyEvent(
							false,
							ShiftlockKeyCode,
							false,
							game:GetService("Players").LocalPlayer.PlayerGui
						)
					end
				end
			end)

			if not success then
				return
			end
		end)
	end)

	task.spawn(function()
		local startTime = tick()
		local UserInputService = game:GetService("UserInputService")
		UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
		while tick() - startTime < Dur do
			if target and target:FindFirstChild("HumanoidRootPart") then
				local wawa = MeButCharacter.HumanoidRootPart
				local wawaza = target.HumanoidRootPart.Position
				local MathematicalCalculations = (wawaza - wawa.Position).unit
				-- change camera
				local Cumera = game.Workspace.CurrentCamera
				local targetCFrame = CFrame.lookAt(
					Cumera.CFrame.Position,
					Cumera.CFrame.Position
						+ Vector3.new(
							MathematicalCalculations.X,
							MathematicalCalculations.Y,
							MathematicalCalculations.Z
						)
				)
				game:GetService("TweenService")
					:Create(Cumera, TweenInfo.new(AimSmoothnes, Enum.EasingStyle.Linear), { CFrame = targetCFrame })
					:Play()
			end
			task.wait()
		end
		UserInputService.MouseBehavior = Enum.MouseBehavior.Default
	end)
end

local Toggle = Tab:CreateToggle({
	Name = "C00lkid Aimbot",
	CurrentValue = false,
	Callback = function(Value)
		game:GetService("ReplicatedStorage").Modules.Network.RemoteEvent
			:FireServer("SetDevice", state and "Mobile" or "PC")
	end,
})

local Tab = Window:CreateTab("LMS", 4483362458) -- Title, Image
local Section = Tab:CreateSection("LMS")

local function LastStandingReplacement(state)
	ReplaceStandingMusic = state
	local LastStandingFolder = workspace.Themes
	if ReplaceStandingMusic then
		if LastStandingFolder then
			local connection = LastStandingFolder.ChildAdded:Connect(function(child)
				if child:IsA("Sound") and child.Name == "LastSurvivor" then
					child.SoundId = getcustomasset("forsakenedxd/" .. tostring(CurrentSound))
					child.TimePosition = 0
				end
			end)
			table.insert(MusicConnections, connection)
		end
	else
		if LastStandingFolder and LastStandingFolder.ChildAdded then
			Rayfield:Notify({ Title = "Disabled Music Replace", Content = "Music Will Go Back To Normal Next Round", Duration = 10, Image = "music" }) -- 😭😭😭😭😭😭
			for _, connection in ipairs(MusicConnections) do
				connection:Disconnect()
			end
		end
	end
end

local function ChangeMusic(music)
	local LastStandingFolder = workspace.Themes
	if LastStandingFolder then
		for _, child in ipairs(LastStandingFolder:GetChildren()) do
			if child:IsA("Sound") and child.Name == "LastSurvivor" then
				child.SoundId = getcustomasset("forsakenedxd/" .. tostring(music))
				child.TimePosition = 0
			end
		end
	end
end

local Dropdown = Tab:CreateDropdown({
	Name = "Music List",
	Options = {
		"Shed OLD",
		"Shed NEW",
		"Shed 2",
		"Plead",
		"Pleadud",
		"Curiosity",
		"VIP",
		"Vanity",
		"Cupcakes"
	},
	CurrentOption = { "Shed OLD" },
	MultipleOptions = false,
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
	local basePath = "forsakenedxd/"

	if not isfolder("forsakenedxd") then
		makefolder("forsakenedxd")
	end
   	if not isfolder(basePath) then
		makefolder(basePath)
	end

	for _, url in ipairs(assetList) do
		local filePath = basePath .. url:match("Assets/(.+)") if
		filePath then
			local newFilePath = filePath:gsub("%.png$", ".png.real"):gsub("%.mp4$", ".mp4.real"):gsub("%.mp3$", ".mp3")

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

pcall(CheckAndDeleteAssets)
	task.spawn(function()
		pcall(CheckIfFartsDownloaded)
	end)

Rayfield:LoadConfiguration()
