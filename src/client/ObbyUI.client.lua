-- ObbyUI: Professional client-side UI for the obby
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

print("🎨 Creating Professional Obby UI...")

-- Wait for leaderstats
local leaderstats = player:WaitForChild("leaderstats")
local stageValue = leaderstats:WaitForChild("Stage")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ObbyUI"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

-- ===== STAGE DISPLAY =====
local stageFrame = Instance.new("Frame")
stageFrame.Name = "StageFrame"
stageFrame.Size = UDim2.new(0, 220, 0, 90)
stageFrame.Position = UDim2.new(1, -240, 0, 20)
stageFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
stageFrame.BackgroundTransparency = 0.3
stageFrame.BorderSizePixel = 0
stageFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 15)
corner.Parent = stageFrame

local stageGradient = Instance.new("UIGradient")
stageGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 150, 200)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 200, 255))
}
stageGradient.Rotation = 45
stageGradient.Parent = stageFrame

local stageStroke = Instance.new("UIStroke")
stageStroke.Color = Color3.fromRGB(255, 255, 255)
stageStroke.Thickness = 2
stageStroke.Transparency = 0.7
stageStroke.Parent = stageFrame

local stageLabel = Instance.new("TextLabel")
stageLabel.Name = "StageLabel"
stageLabel.Size = UDim2.new(1, -20, 0.35, 0)
stageLabel.Position = UDim2.new(0, 10, 0.1, 0)
stageLabel.BackgroundTransparency = 1
stageLabel.Text = "🦋 STAGE"
stageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
stageLabel.TextScaled = true
stageLabel.Font = Enum.Font.GothamBold
stageLabel.TextStrokeTransparency = 0
stageLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
stageLabel.Parent = stageFrame

local stagePadding = Instance.new("UIPadding")
stagePadding.PaddingLeft = UDim.new(0, 10)
stagePadding.PaddingRight = UDim.new(0, 10)
stagePadding.Parent = stageLabel

local stageNumber = Instance.new("TextLabel")
stageNumber.Name = "StageNumber"
stageNumber.Size = UDim2.new(1, -20, 0.45, 0)
stageNumber.Position = UDim2.new(0, 10, 0.5, 0)
stageNumber.BackgroundTransparency = 1
stageNumber.Text = tostring(stageValue.Value) .. " / 6"
stageNumber.TextColor3 = Color3.fromRGB(255, 255, 100)
stageNumber.TextScaled = true
stageNumber.Font = Enum.Font.GothamBlack
stageNumber.TextStrokeTransparency = 0
stageNumber.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
stageNumber.Parent = stageFrame

-- ===== CHECKPOINT CELEBRATION =====
local celebrationFrame = Instance.new("Frame")
celebrationFrame.Name = "CelebrationFrame"
celebrationFrame.Size = UDim2.new(0, 400, 0, 120)
celebrationFrame.Position = UDim2.new(0.5, -200, 0.3, 0)
celebrationFrame.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
celebrationFrame.BackgroundTransparency = 1
celebrationFrame.BorderSizePixel = 0
celebrationFrame.Visible = false
celebrationFrame.ZIndex = 10
celebrationFrame.Parent = screenGui

local celebrationCorner = Instance.new("UICorner")
celebrationCorner.CornerRadius = UDim.new(0, 20)
celebrationCorner.Parent = celebrationFrame

local celebrationLabel = Instance.new("TextLabel")
celebrationLabel.Name = "Label"
celebrationLabel.Size = UDim2.new(1, 0, 1, 0)
celebrationLabel.BackgroundTransparency = 1
celebrationLabel.Text = "✨ CHECKPOINT! ✨"
celebrationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
celebrationLabel.TextScaled = true
celebrationLabel.Font = Enum.Font.GothamBlack
celebrationLabel.TextStrokeTransparency = 0
celebrationLabel.TextStrokeColor3 = Color3.fromRGB(100, 50, 0)
celebrationLabel.Parent = celebrationFrame

local celebrationPadding = Instance.new("UIPadding")
celebrationPadding.PaddingLeft = UDim.new(0, 20)
celebrationPadding.PaddingRight = UDim.new(0, 20)
celebrationPadding.PaddingTop = UDim.new(0, 20)
celebrationPadding.PaddingBottom = UDim.new(0, 20)
celebrationPadding.Parent = celebrationLabel

-- ===== WELCOME SCREEN =====
local welcomeFrame = Instance.new("Frame")
welcomeFrame.Name = "WelcomeFrame"
welcomeFrame.Size = UDim2.new(1, 0, 1, 0)
welcomeFrame.Position = UDim2.new(0, 0, 0, 0)
welcomeFrame.BackgroundColor3 = Color3.fromRGB(20, 10, 30)
welcomeFrame.BackgroundTransparency = 0
welcomeFrame.BorderSizePixel = 0
welcomeFrame.ZIndex = 100
welcomeFrame.Parent = screenGui

local welcomeGradient = Instance.new("UIGradient")
welcomeGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 150, 200)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(200, 150, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 200, 255))
}
welcomeGradient.Rotation = 90
welcomeGradient.Parent = welcomeFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0.8, 0, 0.15, 0)
titleLabel.Position = UDim2.new(0.1, 0, 0.25, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🦋 BUTTERFLY OBBY 🦋"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBlack
titleLabel.TextStrokeTransparency = 0
titleLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
titleLabel.Parent = welcomeFrame

local subtitleLabel = Instance.new("TextLabel")
subtitleLabel.Size = UDim2.new(0.6, 0, 0.08, 0)
subtitleLabel.Position = UDim2.new(0.2, 0, 0.42, 0)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Text = "Jump through the magical butterfly garden!"
subtitleLabel.TextColor3 = Color3.fromRGB(255, 255, 200)
subtitleLabel.TextScaled = true
subtitleLabel.Font = Enum.Font.Gotham
subtitleLabel.TextStrokeTransparency = 0.5
subtitleLabel.Parent = welcomeFrame

local playButton = Instance.new("TextButton")
playButton.Size = UDim2.new(0, 250, 0, 70)
playButton.Position = UDim2.new(0.5, -125, 0.58, 0)
playButton.BackgroundColor3 = Color3.fromRGB(100, 255, 150)
playButton.BorderSizePixel = 0
playButton.Text = "▶ PLAY"
playButton.TextColor3 = Color3.fromRGB(255, 255, 255)
playButton.TextScaled = true
playButton.Font = Enum.Font.GothamBlack
playButton.TextStrokeTransparency = 0
playButton.AutoButtonColor = false
playButton.Parent = welcomeFrame

local playCorner = Instance.new("UICorner")
playCorner.CornerRadius = UDim.new(0, 15)
playCorner.Parent = playButton

local playPadding = Instance.new("UIPadding")
playPadding.PaddingLeft = UDim.new(0, 20)
playPadding.PaddingRight = UDim.new(0, 20)
playPadding.PaddingTop = UDim.new(0, 10)
playPadding.PaddingBottom = UDim.new(0, 10)
playPadding.Parent = playButton

-- Play button hover effect
playButton.MouseEnter:Connect(function()
	TweenService:Create(playButton, TweenInfo.new(0.2), {
		Size = UDim2.new(0, 270, 0, 75),
		BackgroundColor3 = Color3.fromRGB(120, 255, 170)
	}):Play()
end)

playButton.MouseLeave:Connect(function()
	TweenService:Create(playButton, TweenInfo.new(0.2), {
		Size = UDim2.new(0, 250, 0, 70),
		BackgroundColor3 = Color3.fromRGB(100, 255, 150)
	}):Play()
end)

playButton.MouseButton1Click:Connect(function()
	-- Fade out welcome screen
	TweenService:Create(welcomeFrame, TweenInfo.new(0.5), {
		BackgroundTransparency = 1
	}):Play()
	
	for _, child in pairs(welcomeFrame:GetChildren()) do
		if child:IsA("GuiObject") then
			TweenService:Create(child, TweenInfo.new(0.5), {
				TextTransparency = 1,
				TextStrokeTransparency = 1,
				BackgroundTransparency = 1
			}):Play()
		end
	end
	
	wait(0.5)
	welcomeFrame.Visible = false
end)

-- ===== STAGE CHANGE ANIMATION =====
stageValue.Changed:Connect(function(newStage)
	stageNumber.Text = tostring(newStage) .. " / 6"
	
	-- Bounce animation
	local bounce = TweenService:Create(stageFrame, TweenInfo.new(0.2, Enum.EasingStyle.Bounce), {
		Size = UDim2.new(0, 240, 0, 100)
	})
	bounce:Play()
	
	bounce.Completed:Connect(function()
		TweenService:Create(stageFrame, TweenInfo.new(0.2), {
			Size = UDim2.new(0, 220, 0, 90)
		}):Play()
	end)
	
	-- Show celebration
	if newStage > 1 and newStage <= 6 then
		celebrationLabel.Text = "✨ STAGE " .. newStage .. " REACHED! ✨"
		celebrationFrame.BackgroundTransparency = 0.2
		celebrationFrame.Visible = true
		celebrationLabel.TextTransparency = 0
		
		-- Animate in
		celebrationFrame.Position = UDim2.new(0.5, -200, 0.2, 0)
		TweenService:Create(celebrationFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
			Position = UDim2.new(0.5, -200, 0.3, 0)
		}):Play()
		
		wait(2)
		
		-- Animate out
		TweenService:Create(celebrationFrame, TweenInfo.new(0.3), {
			BackgroundTransparency = 1
		}):Play()
		TweenService:Create(celebrationLabel, TweenInfo.new(0.3), {
			TextTransparency = 1,
			TextStrokeTransparency = 1
		}):Play()
		
		wait(0.3)
		celebrationFrame.Visible = false
	end
end)

print("✅ Professional Obby UI created!")

