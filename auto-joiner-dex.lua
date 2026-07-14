-- DEX NOTIFIER GUI (Visual Only)
-- Recriado por Manus

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Sidebar = Instance.new("Frame")
local SidebarCorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local Status = Instance.new("TextLabel")
local NavButtons = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local Content = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local LiveFeedLabel = Instance.new("TextLabel")
local DetectedLabel = Instance.new("TextLabel")
local ClearButton = Instance.new("TextButton")
local LogsContainer = Instance.new("ScrollingFrame")
local LogsLayout = Instance.new("UIListLayout")

-- Properties
ScreenGui.Name = "DexNotifier"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
MainFrame.Size = UDim2.new(0, 500, 0, 300)
MainFrame.BorderSizePixel = 0

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

UIStroke.Color = Color3.fromRGB(80, 50, 150)
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

-- Sidebar
Sidebar.Name = "Sidebar"
Sidebar.Parent = MainFrame
Sidebar.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
Sidebar.Size = UDim2.new(0, 120, 1, 0)
Sidebar.BorderSizePixel = 0

SidebarCorner.CornerRadius = UDim.new(0, 12)
SidebarCorner.Parent = Sidebar

Title.Name = "Title"
Title.Parent = Sidebar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 10, 0, 10)
Title.Size = UDim2.new(1, -20, 0, 25)
Title.Font = Enum.Font.GothamBold
Title.Text = "DEX NOTIFIER"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left

Status.Name = "Status"
Status.Parent = Sidebar
Status.BackgroundTransparency = 1
Status.Position = UDim2.new(0, 10, 0, 30)
Status.Size = UDim2.new(1, -20, 0, 15)
Status.Font = Enum.Font.Gotham
Status.Text = "● Connected"
Status.TextColor3 = Color3.fromRGB(0, 255, 100)
Status.TextSize = 12
Status.TextXAlignment = Enum.TextXAlignment.Left

NavButtons.Name = "NavButtons"
NavButtons.Parent = Sidebar
NavButtons.BackgroundTransparency = 1
NavButtons.Position = UDim2.new(0, 10, 0, 60)
NavButtons.Size = UDim2.new(1, -20, 1, -110)

UIListLayout.Parent = NavButtons
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

local function createNavBtn(name, active)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Parent = NavButtons
    btn.BackgroundColor3 = active and Color3.fromRGB(40, 30, 80) or Color3.fromRGB(20, 20, 25)
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Font = Enum.Font.GothamMedium
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 12
    btn.AutoButtonColor = true
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = btn
    
    if not active then
        local s = Instance.new("UIStroke")
        s.Color = Color3.fromRGB(40, 40, 50)
        s.Thickness = 1
        s.Parent = btn
    end
end

createNavBtn("Logs", true)
createNavBtn("History", false)
createNavBtn("Users", false)
createNavBtn("Settings", false)

local HideUI = Instance.new("TextButton")
HideUI.Name = "HideUI"
HideUI.Parent = Sidebar
HideUI.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
HideUI.Position = UDim2.new(0, 10, 1, -40)
HideUI.Size = UDim2.new(1, -20, 0, 30)
HideUI.Font = Enum.Font.GothamMedium
HideUI.Text = "Hide UI"
HideUI.TextColor3 = Color3.fromRGB(200, 200, 200)
HideUI.TextSize = 12
local HideCorner = Instance.new("UICorner")
HideCorner.CornerRadius = UDim.new(0, 8)
HideCorner.Parent = HideUI

-- Content Area
Content.Name = "Content"
Content.Parent = MainFrame
Content.BackgroundTransparency = 1
Content.Position = UDim2.new(0, 130, 0, 10)
Content.Size = UDim2.new(1, -140, 1, -20)

-- Toggles Placeholder
local Toggles = Instance.new("Frame")
Toggles.Name = "Toggles"
Toggles.Parent = Content
Toggles.BackgroundTransparency = 1
Toggles.Size = UDim2.new(1, 0, 0, 40)

local function createToggle(name, pos)
    local label = Instance.new("TextLabel")
    label.Parent = Toggles
    label.BackgroundTransparency = 1
    label.Position = pos
    label.Size = UDim2.new(0, 80, 1, 0)
    label.Font = Enum.Font.GothamMedium
    label.Text = name
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local bg = Instance.new("Frame")
    bg.Parent = Toggles
    bg.BackgroundColor3 = Color3.fromRGB(100, 50, 255)
    bg.Position = pos + UDim2.new(0, 70, 0, 10)
    bg.Size = UDim2.new(0, 40, 0, 20)
    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(1, 0)
    bc.Parent = bg
    
    local circle = Instance.new("Frame")
    circle.Parent = bg
    circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    circle.Position = UDim2.new(1, -18, 0, 2)
    circle.Size = UDim2.new(0, 16, 0, 16)
    local cc = Instance.new("UICorner")
    cc.CornerRadius = UDim.new(1, 0)
    cc.Parent = circle
end

createToggle("Auto-Join", UDim2.new(0, 0, 0, 0))
createToggle("Auto-Force", UDim2.new(0, 150, 0, 0))

TopBar.Name = "TopBar"
TopBar.Parent = Content
TopBar.BackgroundTransparency = 1
TopBar.Position = UDim2.new(0, 0, 0, 50)
TopBar.Size = UDim2.new(1, 0, 0, 20)

LiveFeedLabel.Parent = TopBar
LiveFeedLabel.BackgroundTransparency = 1
LiveFeedLabel.Size = UDim2.new(0, 80, 1, 0)
LiveFeedLabel.Font = Enum.Font.GothamBold
LiveFeedLabel.Text = "LIVE FEED"
LiveFeedLabel.TextColor3 = Color3.fromRGB(80, 60, 150)
LiveFeedLabel.TextSize = 14
LiveFeedLabel.TextXAlignment = Enum.TextXAlignment.Left

DetectedLabel.Parent = TopBar
DetectedLabel.BackgroundTransparency = 1
DetectedLabel.Position = UDim2.new(1, -120, 0, 0)
DetectedLabel.Size = UDim2.new(0, 80, 1, 0)
DetectedLabel.Font = Enum.Font.Gotham
DetectedLabel.Text = "2 detected"
DetectedLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
DetectedLabel.TextSize = 12
DetectedLabel.TextXAlignment = Enum.TextXAlignment.Right

ClearButton.Parent = TopBar
ClearButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
ClearButton.Position = UDim2.new(1, -35, 0, 0)
ClearButton.Size = UDim2.new(0, 35, 1, 0)
ClearButton.Font = Enum.Font.GothamBold
ClearButton.Text = "Clear"
ClearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearButton.TextSize = 10
local ClearCorner = Instance.new("UICorner")
ClearCorner.CornerRadius = UDim.new(0, 4)
ClearCorner.Parent = ClearButton

LogsContainer.Name = "LogsContainer"
LogsContainer.Parent = Content
LogsContainer.BackgroundTransparency = 1
LogsContainer.Position = UDim2.new(0, 0, 0, 80)
LogsContainer.Size = UDim2.new(1, 0, 1, -80)
LogsContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
LogsContainer.ScrollBarThickness = 2

LogsLayout.Parent = LogsContainer
LogsLayout.Padding = UDim.new(0, 10)
LogsLayout.SortOrder = Enum.SortOrder.LayoutOrder

local function createLogItem(name, value)
    local item = Instance.new("Frame")
    item.Name = "LogItem"
    item.Parent = LogsContainer
    item.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    item.Size = UDim2.new(1, -5, 0, 60)
    
    local ic = Instance.new("UICorner")
    ic.CornerRadius = UDim.new(0, 8)
    ic.Parent = item
    
    local is = Instance.new("UIStroke")
    is.Color = Color3.fromRGB(45, 45, 60)
    is.Thickness = 1
    is.Parent = item
    
    local bar = Instance.new("Frame")
    bar.Parent = item
    bar.BackgroundColor3 = Color3.fromRGB(100, 50, 255)
    bar.Position = UDim2.new(0, 8, 0.2, 0)
    bar.Size = UDim2.new(0, 3, 0.6, 0)
    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(1, 0)
    bc.Parent = bar
    
    local title = Instance.new("TextLabel")
    title.Parent = item
    title.BackgroundTransparency = 1
    title.Position = UDim2.new(0, 20, 0, 10)
    title.Size = UDim2.new(0, 200, 0, 20)
    title.Font = Enum.Font.GothamBold
    title.Text = name
    title.TextColor3 = Color3.fromRGB(150, 100, 255)
    title.TextSize = 14
    title.TextXAlignment = Enum.TextXAlignment.Left
    
    local desc = Instance.new("TextLabel")
    desc.Parent = item
    desc.BackgroundTransparency = 1
    desc.Position = UDim2.new(0, 20, 0, 30)
    desc.Size = UDim2.new(0, 200, 0, 20)
    desc.Font = Enum.Font.Gotham
    desc.Text = value .. " • Players: 4"
    desc.TextColor3 = Color3.fromRGB(180, 180, 200)
    desc.TextSize = 12
    desc.TextXAlignment = Enum.TextXAlignment.Left
    
    local join = Instance.new("TextButton")
    join.Parent = item
    join.BackgroundColor3 = Color3.fromRGB(40, 30, 100)
    join.Position = UDim2.new(1, -110, 0.5, -12)
    join.Size = UDim2.new(0, 50, 0, 24)
    join.Font = Enum.Font.GothamBold
    join.Text = "JOIN"
    join.TextColor3 = Color3.fromRGB(255, 255, 255)
    join.TextSize = 10
    local jc = Instance.new("UICorner")
    jc.CornerRadius = UDim.new(0, 6)
    jc.Parent = join
    
    local force = Instance.new("TextButton")
    force.Parent = item
    force.BackgroundColor3 = Color3.fromRGB(180, 100, 20)
    force.Position = UDim2.new(1, -55, 0.5, -12)
    force.Size = UDim2.new(0, 50, 0, 24)
    force.Font = Enum.Font.GothamBold
    force.Text = "FORCE"
    force.TextColor3 = Color3.fromRGB(255, 255, 255)
    force.TextSize = 10
    local fc = Instance.new("UICorner")
    fc.CornerRadius = UDim.new(0, 6)
    fc.Parent = force
end

-- Os 2 logs solicitados
createLogItem("la grande combinação", "120m/s")
createLogItem("la secret", "750m/s")

-- Dragging Functionality
local UserInputService = game:GetService("UserInputService")
local gui = MainFrame

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position
		
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)
