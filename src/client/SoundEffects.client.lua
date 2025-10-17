-- SoundEffects: Professional sound system
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local SoundService = game:GetService("SoundService")

print("🔊 Setting up sound effects...")

-- Create sound group for better mixing
local sfxGroup = Instance.new("SoundGroup")
sfxGroup.Name = "SFXGroup"
sfxGroup.Volume = 0.5
sfxGroup.Parent = SoundService

-- Function to play a sound
local function playSound(soundId, volume, pitch)
	local sound = Instance.new("Sound")
	sound.SoundId = soundId
	sound.Volume = volume or 0.5
	sound.PlaybackSpeed = pitch or 1
	sound.SoundGroup = sfxGroup
	sound.Parent = SoundService
	sound:Play()
	
	sound.Ended:Connect(function()
		sound:Destroy()
	end)
end

-- Listen for checkpoint reached
local leaderstats = player:WaitForChild("leaderstats")
local stageValue = leaderstats:WaitForChild("Stage")

local lastStage = stageValue.Value
stageValue.Changed:Connect(function(newStage)
	if newStage > lastStage then
		-- Checkpoint sound (using free public sound)
		playSound("rbxassetid://6895079853", 0.5, 1.1)  -- Success chime
		lastStage = newStage
	end
end)

-- Add character sounds
local function addCharacterSounds(character)
	wait(0.5)
	
	local humanoid = character:WaitForChild("Humanoid")
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	-- Jump sound
	humanoid.StateChanged:Connect(function(oldState, newState)
		if newState == Enum.HumanoidStateType.Jumping then
			playSound("rbxassetid://6723495892", 0.3, math.random(95, 105) / 100)
		elseif newState == Enum.HumanoidStateType.Landed then
			playSound("rbxassetid://6723495892", 0.2, 0.8)
		end
	end)
	
	-- Death sound
	humanoid.Died:Connect(function()
		playSound("rbxassetid://5943191130", 0.4, 1)
	end)
end

if player.Character then
	addCharacterSounds(player.Character)
end

player.CharacterAdded:Connect(addCharacterSounds)

print("✅ Sound effects ready!")

