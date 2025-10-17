-- MusicManager: Background music system
print("🎵 Setting up background music...")

local SoundService = game:GetService("SoundService")

-- Create music group
local musicGroup = Instance.new("SoundGroup")
musicGroup.Name = "MusicGroup"
musicGroup.Volume = 0.3
musicGroup.Parent = SoundService

-- Create ambient background music
local bgMusic = Instance.new("Sound")
bgMusic.Name = "BackgroundMusic"
bgMusic.SoundId = "rbxassetid://1843463175"  -- Peaceful butterfly garden music
bgMusic.Volume = 0.25
bgMusic.Looped = true
bgMusic.SoundGroup = musicGroup
bgMusic.Parent = SoundService

wait(2)  -- Wait for game to load
bgMusic:Play()

print("✅ Background music playing!")

