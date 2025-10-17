-- WinCelebration: Client-side win celebration
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

print("🏆 Win celebration client ready...")

-- Wait for celebrate event
local celebrateEvent = ReplicatedStorage:WaitForChild("CelebrateWin", 10)
if not celebrateEvent then
	warn("Could not find CelebrateWin event")
	return
end

celebrateEvent.OnClientEvent:Connect(function()
	print("🎉 YOU WON! Creating celebration...")
	
	-- Create win screen
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "WinScreen"
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	screenGui.Parent = playerGui
	
	-- Overlay
	local overlay = Instance.new("Frame")
	overlay.Size = UDim2.new(1, 0, 1, 0)
	overlay.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
	overlay.BackgroundTransparency = 1
	overlay.BorderSizePixel = 0
	overlay.Parent = screenGui
	
	-- Gradient
	local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 215, 0)),
		ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 150, 200)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 200, 255))
	}
	gradient.Rotation = 45
	gradient.Parent = overlay
	
	-- Fade in overlay
	TweenService:Create(overlay, TweenInfo.new(0.5), {
		BackgroundTransparency = 0.3
	}):Play()
	
	-- Win text
	local winLabel = Instance.new("TextLabel")
	winLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
	winLabel.Position = UDim2.new(0.1, 0, 0.3, 0)
	winLabel.BackgroundTransparency = 1
	winLabel.Text = "🎉 CONGRATULATIONS! 🎉"
	winLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	winLabel.TextScaled = true
	winLabel.Font = Enum.Font.GothamBlack
	winLabel.TextStrokeTransparency = 0
	winLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	winLabel.TextTransparency = 1
	winLabel.Parent = screenGui
	
	-- Subtitle
	local subtitleLabel = Instance.new("TextLabel")
	subtitleLabel.Size = UDim2.new(0.6, 0, 0.1, 0)
	subtitleLabel.Position = UDim2.new(0.2, 0, 0.52, 0)
	subtitleLabel.BackgroundTransparency = 1
	subtitleLabel.Text = "You completed the Butterfly Obby!"
	subtitleLabel.TextColor3 = Color3.fromRGB(255, 255, 200)
	subtitleLabel.TextScaled = true
	subtitleLabel.Font = Enum.Font.GothamBold
	subtitleLabel.TextStrokeTransparency = 0.5
	subtitleLabel.TextTransparency = 1
	subtitleLabel.Parent = screenGui
	
	-- Animate text in
	wait(0.3)
	TweenService:Create(winLabel, TweenInfo.new(0.5, Enum.EasingStyle.Back), {
		TextTransparency = 0,
		TextStrokeTransparency = 0
	}):Play()
	
	wait(0.2)
	TweenService:Create(subtitleLabel, TweenInfo.new(0.5), {
		TextTransparency = 0,
		TextStrokeTransparency = 0.5
	}):Play()
	
	-- Play win sound
	local winSound = Instance.new("Sound")
	winSound.SoundId = "rbxassetid://5986151291"  -- Victory fanfare
	winSound.Volume = 0.5
	winSound.Parent = game:GetService("SoundService")
	winSound:Play()
	
	-- Bounce animation
	spawn(function()
		while winLabel.Parent do
			TweenService:Create(winLabel, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
				Rotation = 3
			}):Play()
			wait(0.5)
			TweenService:Create(winLabel, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
				Rotation = -3
			}):Play()
			wait(0.5)
		end
	end)
end)

print("✅ Win celebration client loaded!")

