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
      FolderName = ForsakenedIsTrue, -- Create a custom folder for your hub/game
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
