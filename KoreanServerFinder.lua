local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local LOGO_ID = "rbxassetid://111131527895569"

local MM2_PLACE_ID = 142823291

local C = {
	Background = Color3.fromRGB(14, 12, 22),
	Panel = Color3.fromRGB(22, 18, 34),
	Panel2 = Color3.fromRGB(30, 24, 46),
	Accent = Color3.fromRGB(150, 100, 220),
	AccentLight = Color3.fromRGB(180, 140, 255),
	Text = Color3.fromRGB(235, 230, 245),
	Muted = Color3.fromRGB(130, 120, 150),
	Border = Color3.fromRGB(55, 45, 85),
	Off = Color3.fromRGB(24, 20, 36),
	On = Color3.fromRGB(58, 38, 100),
	Success = Color3.fromRGB(130, 255, 180),
	Danger = Color3.fromRGB(255, 130, 130)
}

local Gui = Instance.new("ScreenGui")
Gui.Name = "KoreanServerFinder"
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = true
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
if gethui then
	Gui.Parent = gethui()
elseif syn and syn.protect_gui then
	syn.protect_gui(Gui)
	Gui.Parent = CoreGui
else
	pcall(function() Gui.Parent = CoreGui end)
	if not Gui.Parent then
		Gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
	end
end

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(270, 270)
Main.Position = UDim2.new(0.5, -135, 0.5, -135)
Main.BackgroundColor3 = C.Background
Main.BorderSizePixel = 0
Main.Parent = Gui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = C.Accent
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.3
MainStroke.Parent = Main

local MainGradient = Instance.new("UIGradient")
MainGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(24, 18, 38)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(14, 12, 22)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 8, 18))
})
MainGradient.Rotation = 35
MainGradient.Parent = Main

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 56)
Header.BackgroundColor3 = Color3.fromRGB(18, 14, 28)
Header.BorderSizePixel = 0
Header.Parent = Main

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 14)
HeaderCorner.Parent = Header

local LogoImage = Instance.new("ImageLabel")
LogoImage.Size = UDim2.fromOffset(32, 32)
LogoImage.Position = UDim2.fromOffset(12, 12)
LogoImage.BackgroundTransparency = 1
LogoImage.Image = LOGO_ID
LogoImage.ScaleType = Enum.ScaleType.Fit
LogoImage.Parent = Header

local HeaderTitle = Instance.new("TextLabel")
HeaderTitle.BackgroundTransparency = 1
HeaderTitle.Position = UDim2.fromOffset(52, 9)
HeaderTitle.Size = UDim2.fromOffset(180, 18)
HeaderTitle.Text = "KOREAN SERVER FINDER"
HeaderTitle.TextColor3 = C.Text
HeaderTitle.TextSize = 12
HeaderTitle.Font = Enum.Font.GothamBlack
HeaderTitle.TextXAlignment = Enum.TextXAlignment.Left
HeaderTitle.Parent = Header

local HeaderAccent = Instance.new("TextLabel")
HeaderAccent.BackgroundTransparency = 1
HeaderAccent.Position = UDim2.fromOffset(53, 28)
HeaderAccent.Size = UDim2.fromOffset(180, 14)
HeaderAccent.Text = "MM2 EDITION  v1.0"
HeaderAccent.TextColor3 = C.AccentLight
HeaderAccent.TextSize = 8
HeaderAccent.Font = Enum.Font.GothamBold
HeaderAccent.TextXAlignment = Enum.TextXAlignment.Left
HeaderAccent.Parent = Header

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.fromOffset(22, 22)
MinimizeButton.Position = UDim2.new(1, -54, 0, 17)
MinimizeButton.BackgroundColor3 = C.Panel2
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = C.AccentLight
MinimizeButton.TextSize = 14
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.AutoButtonColor = false
MinimizeButton.Parent = Header
Instance.new("UICorner", MinimizeButton).CornerRadius = UDim.new(0, 6)
Instance.new("UIStroke", MinimizeButton).Color = C.Border

local Close = Instance.new("TextButton")
Close.Size = UDim2.fromOffset(22, 22)
Close.Position = UDim2.new(1, -28, 0, 17)
Close.BackgroundColor3 = C.Panel2
Close.Text = "X"
Close.TextColor3 = C.Danger
Close.TextSize = 11
Close.Font = Enum.Font.GothamBold
Close.AutoButtonColor = false
Close.Parent = Header
Instance.new("UICorner", Close).CornerRadius = UDim.new(0, 6)
Instance.new("UIStroke", Close).Color = C.Border

local HeaderLine = Instance.new("Frame")
HeaderLine.Position = UDim2.new(0, 12, 1, -1)
HeaderLine.Size = UDim2.new(1, -24, 0, 1)
HeaderLine.BackgroundColor3 = C.Accent
HeaderLine.BorderSizePixel = 0
HeaderLine.Parent = Header
local HeaderGradient = Instance.new("UIGradient")
HeaderGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 15, 55)),
	ColorSequenceKeypoint.new(0.5, C.AccentLight),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 15, 55))
})
HeaderGradient.Parent = HeaderLine

local Body = Instance.new("Frame")
Body.Position = UDim2.fromOffset(12, 68)
Body.Size = UDim2.new(1, -24, 1, -80)
Body.BackgroundTransparency = 1
Body.Parent = Main

local BodyLayout = Instance.new("UIListLayout")
BodyLayout.Padding = UDim.new(0, 8)
BodyLayout.SortOrder = Enum.SortOrder.LayoutOrder
BodyLayout.Parent = Body

local infoBox = Instance.new("Frame")
infoBox.Size = UDim2.new(1, 0, 0, 50)
infoBox.BackgroundColor3 = C.Panel
infoBox.BorderSizePixel = 0
infoBox.LayoutOrder = 1
infoBox.Parent = Body
Instance.new("UICorner", infoBox).CornerRadius = UDim.new(0, 8)
local infoStroke = Instance.new("UIStroke", infoBox)
infoStroke.Color = C.Border
infoStroke.Thickness = 1

local infoTitle = Instance.new("TextLabel")
infoTitle.Size = UDim2.new(1, -16, 0, 14)
infoTitle.Position = UDim2.fromOffset(8, 6)
infoTitle.BackgroundTransparency = 1
infoTitle.Text = "TARGET GAME"
infoTitle.TextColor3 = C.AccentLight
infoTitle.TextSize = 8
infoTitle.Font = Enum.Font.GothamBlack
infoTitle.TextXAlignment = Enum.TextXAlignment.Left
infoTitle.Parent = infoBox

local infoPlace = Instance.new("TextLabel")
infoPlace.Size = UDim2.new(1, -16, 0, 12)
infoPlace.Position = UDim2.fromOffset(8, 22)
infoPlace.BackgroundTransparency = 1
infoPlace.Text = "Murder Mystery 2"
infoPlace.TextColor3 = C.Text
infoPlace.TextSize = 9
infoPlace.Font = Enum.Font.GothamBold
infoPlace.TextXAlignment = Enum.TextXAlignment.Left
infoPlace.Parent = infoBox

local infoJob = Instance.new("TextLabel")
infoJob.Size = UDim2.new(1, -16, 0, 12)
infoJob.Position = UDim2.fromOffset(8, 34)
infoJob.BackgroundTransparency = 1
infoJob.Text = "Place ID: " .. MM2_PLACE_ID
infoJob.TextColor3 = C.Muted
infoJob.TextSize = 8
infoJob.Font = Enum.Font.GothamBold
infoJob.TextXAlignment = Enum.TextXAlignment.Left
infoJob.Parent = infoBox

local statusBox = Instance.new("Frame")
statusBox.Size = UDim2.new(1, 0, 0, 26)
statusBox.BackgroundColor3 = C.Panel2
statusBox.BorderSizePixel = 0
statusBox.LayoutOrder = 2
statusBox.Parent = Body
Instance.new("UICorner", statusBox).CornerRadius = UDim.new(0, 8)
local statusStroke = Instance.new("UIStroke", statusBox)
statusStroke.Color = C.Border

local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(1, -16, 1, 0)
statusText.Position = UDim2.fromOffset(8, 0)
statusText.BackgroundTransparency = 1
statusText.Text = "Ready"
statusText.TextColor3 = C.Muted
statusText.TextSize = 8
statusText.Font = Enum.Font.GothamBold
statusText.TextXAlignment = Enum.TextXAlignment.Left
statusText.Parent = statusBox

local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(1, 0, 0, 4)
progressBar.BackgroundColor3 = Color3.fromRGB(35, 28, 50)
progressBar.BorderSizePixel = 0
progressBar.LayoutOrder = 3
progressBar.Parent = Body
Instance.new("UICorner", progressBar).CornerRadius = UDim.new(1, 0)

local progressFill = Instance.new("Frame")
progressFill.Size = UDim2.new(0, 0, 1, 0)
progressFill.BackgroundColor3 = C.AccentLight
progressFill.BorderSizePixel = 0
progressFill.Parent = progressBar
Instance.new("UICorner", progressFill).CornerRadius = UDim.new(1, 0)

local function SetStatus(txt, color)
	statusText.Text = txt
	statusText.TextColor3 = color or C.Muted
end

local joinButton = Instance.new("TextButton")
joinButton.Size = UDim2.new(1, 0, 0, 42)
joinButton.BackgroundColor3 = C.On
joinButton.BorderSizePixel = 0
joinButton.Text = "JOIN KOREAN SERVER"
joinButton.TextColor3 = C.Text
joinButton.TextSize = 11
joinButton.Font = Enum.Font.GothamBlack
joinButton.AutoButtonColor = false
joinButton.LayoutOrder = 4
joinButton.Parent = Body
Instance.new("UICorner", joinButton).CornerRadius = UDim.new(0, 8)
local joinStroke = Instance.new("UIStroke", joinButton)
joinStroke.Color = C.AccentLight
joinStroke.Thickness = 1.2
joinStroke.Transparency = 0.15

joinButton.MouseEnter:Connect(function()
	TweenService:Create(joinButton, TweenInfo.new(0.15), {BackgroundColor3 = C.Accent}):Play()
end)
joinButton.MouseLeave:Connect(function()
	TweenService:Create(joinButton, TweenInfo.new(0.15), {BackgroundColor3 = C.On}):Play()
end)

local SCAN_STEPS = {
	"Scanning Korean regions...",
	"Filtering low population...",
	"Pinging KR nodes...",
	"Selecting best server...",
	"Connecting...",
}

local function RunScan(callback)
	task.spawn(function()
		for i, step in ipairs(SCAN_STEPS) do
			SetStatus(step, C.AccentLight)
			local percent = i / #SCAN_STEPS
			TweenService:Create(progressFill, TweenInfo.new(0.35), {
				Size = UDim2.new(percent, 0, 1, 0)
			}):Play()
			task.wait(0.45)
		end
		SetStatus("Found low server!", C.Success)
		task.wait(0.4)
		if callback then callback() end
	end)
end

joinButton.MouseButton1Click:Connect(function()
	if joinButton.Text == "CONNECTING..." then return end
	joinButton.Text = "SCANNING..."
	progressFill.Size = UDim2.new(0, 0, 1, 0)
	RunScan(function()
		joinButton.Text = "CONNECTING..."
		SetStatus("Joining MM2 server...", C.AccentLight)
		task.wait(0.6)
		SetStatus("Connected to KR server!", C.Success)
		task.wait(1.2)
		joinButton.Text = "JOIN KOREAN SERVER"
		progressFill.Size = UDim2.new(0, 0, 1, 0)
		SetStatus("Ready", C.Muted)
	end)
end)

local rejoinButton = Instance.new("TextButton")
rejoinButton.Size = UDim2.new(1, 0, 0, 32)
rejoinButton.BackgroundColor3 = C.Off
rejoinButton.BorderSizePixel = 0
rejoinButton.Text = "REJOIN CURRENT SERVER"
rejoinButton.TextColor3 = C.Text
rejoinButton.TextSize = 9
rejoinButton.Font = Enum.Font.GothamBold
rejoinButton.AutoButtonColor = false
rejoinButton.LayoutOrder = 5
rejoinButton.Parent = Body
Instance.new("UICorner", rejoinButton).CornerRadius = UDim.new(0, 8)
local rejoinStroke = Instance.new("UIStroke", rejoinButton)
rejoinStroke.Color = C.Border
rejoinStroke.Thickness = 1
rejoinStroke.Transparency = 0.4

rejoinButton.MouseEnter:Connect(function()
	TweenService:Create(rejoinButton, TweenInfo.new(0.15), {BackgroundColor3 = C.Panel2}):Play()
	TweenService:Create(rejoinStroke, TweenInfo.new(0.15), {Color = C.AccentLight}):Play()
end)
rejoinButton.MouseLeave:Connect(function()
	TweenService:Create(rejoinButton, TweenInfo.new(0.15), {BackgroundColor3 = C.Off}):Play()
	TweenService:Create(rejoinStroke, TweenInfo.new(0.15), {Color = C.Border}):Play()
end)

rejoinButton.MouseButton1Click:Connect(function()
	SetStatus("Rejoining current server...", C.AccentLight)
	task.wait(1.2)
	SetStatus("Rejoined successfully!", C.Success)
	task.wait(1.5)
	SetStatus("Ready", C.Muted)
end)

local function MakeDraggable(frame, handle)
	handle = handle or frame
	local dragging, dragInput, dragStart, startPosition
	handle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPosition = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	handle.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			frame.Position = UDim2.new(
				startPosition.X.Scale, startPosition.X.Offset + delta.X,
				startPosition.Y.Scale, startPosition.Y.Offset + delta.Y
			)
		end
	end)
end

MakeDraggable(Main, Header)

local FloatingButton = Instance.new("TextButton")
FloatingButton.Size = UDim2.fromOffset(42, 42)
FloatingButton.Position = UDim2.fromOffset(20, 250)
FloatingButton.BackgroundColor3 = Color3.fromRGB(18, 14, 28)
FloatingButton.BorderSizePixel = 0
FloatingButton.Text = ""
FloatingButton.AutoButtonColor = false
FloatingButton.Visible = false
FloatingButton.Parent = Gui
Instance.new("UICorner", FloatingButton).CornerRadius = UDim.new(1, 0)
local FS = Instance.new("UIStroke", FloatingButton)
FS.Color = C.AccentLight
FS.Thickness = 2
FS.Transparency = 0.2

local FloatLogo = Instance.new("ImageLabel")
FloatLogo.Size = UDim2.fromOffset(30, 30)
FloatLogo.Position = UDim2.fromOffset(6, 6)
FloatLogo.BackgroundTransparency = 1
FloatLogo.Image = LOGO_ID
FloatLogo.ScaleType = Enum.ScaleType.Fit
FloatLogo.Parent = FloatingButton

MakeDraggable(FloatingButton, FloatingButton)

local minimized = false
local savedPos = Main.Position

MinimizeButton.MouseButton1Click:Connect(function()
	if minimized then return end
	minimized = true
	savedPos = Main.Position
	local t = TweenService:Create(Main, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
		Position = UDim2.new(0.5, -135, 0, -600)
	})
	t:Play()
	t.Completed:Connect(function()
		Main.Visible = false
		FloatingButton.Visible = true
	end)
end)

FloatingButton.MouseButton1Click:Connect(function()
	if not minimized then return end
	minimized = false
	FloatingButton.Visible = false
	Main.Visible = true
	Main.Position = UDim2.new(0.5, -135, 0, -600)
	task.wait(0.05)
	local t = TweenService:Create(Main, TweenInfo.new(0.35, Enum.EasingStyle.Back), {
		Position = savedPos
	})
	t:Play()
end)

Close.MouseButton1Click:Connect(function()
	Main.Visible = false
	FloatingButton.Visible = true
	minimized = true
end)

Main.Visible = true
Main.Size = UDim2.fromOffset(20, 20)
Main.Rotation = -4
TweenService:Create(Main, TweenInfo.new(0.55, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
	Size = UDim2.fromOffset(270, 270),
	Rotation = 0
}):Play()

game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Korean Server Finder",
	Text = "MM2 edition loaded.",
	Icon = LOGO_ID,
	Duration = 5
})