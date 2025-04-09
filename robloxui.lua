--[[
	LuaGod ShadowUI - GGZERA Vibe Remake 💻🔥
	By @LuaGod (fivesense.io)
]]--

local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local UIS = game:GetService("UserInputService")

-- Base Screen
local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "LuaGodHub"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false

-- Main Frame
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 480, 0, 380)
main.Position = UDim2.new(0.5, -240, 0.5, -190)
main.BackgroundColor3 = Color3.fromRGB(15,15,15)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

-- Header
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 40)
header.BackgroundColor3 = Color3.fromRGB(25,25,25)
header.BorderSizePixel = 0

local title = Instance.new("TextBox", header)
title.Size = UDim2.new(1, -80, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "LuaGod ShadowUI 😎"
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextColor3 = Color3.fromRGB(255,255,255)
title.ClearTextOnFocus = false

-- Close
local close = Instance.new("TextButton", header)
close.Text = "X"
close.Size = UDim2.new(0, 40, 1, 0)
close.Position = UDim2.new(1, -40, 0, 0)
close.BackgroundTransparency = 1
close.Font = Enum.Font.GothamBold
close.TextSize = 18
close.TextColor3 = Color3.fromRGB(255, 60, 60)

close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

-- Holder
local container = Instance.new("Frame", main)
container.Position = UDim2.new(0, 10, 0, 50)
container.Size = UDim2.new(1, -20, 1, -60)
container.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", container)
layout.Padding = UDim.new(0, 10)

-- Custom Notification (Rayfield Fade Style)
local function Notify(text)
	local notify = Instance.new("TextLabel", gui)
	notify.AnchorPoint = Vector2.new(0.5, 0)
	notify.Position = UDim2.new(0.5, 0, 0, -40)
	notify.Size = UDim2.new(0, 300, 0, 35)
	notify.BackgroundColor3 = Color3.fromRGB(30,30,30)
	notify.Text = text
	notify.TextColor3 = Color3.fromRGB(255,255,255)
	notify.Font = Enum.Font.GothamBold
	notify.TextSize = 14
	notify.BorderSizePixel = 0

	TweenService:Create(notify, TweenInfo.new(0.3), {Position = UDim2.new(0.5,0,0,10)}):Play()
	task.wait(2)
	TweenService:Create(notify, TweenInfo.new(0.3), {Position = UDim2.new(0.5,0,0,-40)}):Play()
	task.wait(0.3)
	notify:Destroy()
end

-- Elements (Button / Toggle / Slider / etc)
local function AddButton(text, callback)
	local btn = Instance.new("TextButton", container)
	btn.Size = UDim2.new(1, 0, 0, 30)
	btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
	btn.BorderSizePixel = 0
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 14
	btn.TextColor3 = Color3.fromRGB(255,255,255)
	btn.Text = text
	btn.MouseButton1Click:Connect(callback)
end

local function AddToggle(text, callback)
	local state = false
	local btn = Instance.new("TextButton", container)
	btn.Size = UDim2.new(1, 0, 0, 30)
	btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
	btn.BorderSizePixel = 0
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 14
	btn.TextColor3 = Color3.fromRGB(255,255,255)
	btn.Text = text .. ": OFF"

	btn.MouseButton1Click:Connect(function()
		state = not state
		btn.Text = text .. ": " .. (state and "ON" or "OFF")
		callback(state)
	end)
end

local function AddSlider(text, min, max, default, callback)
	local val = default or min
	local btn = Instance.new("TextButton", container)
	btn.Size = UDim2.new(1, 0, 0, 30)
	btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
	btn.BorderSizePixel = 0
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 14
	btn.TextColor3 = Color3.fromRGB(255,255,255)
	btn.Text = text .. ": " .. val

	btn.MouseButton1Click:Connect(function()
		val = val + 1
		if val > max then val = min end
		btn.Text = text .. ": " .. val
		callback(val)
	end)
end

local function AddDropdown(text, list, callback)
	local btn = Instance.new("TextButton", container)
	btn.Size = UDim2.new(1, 0, 0, 30)
	btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
	btn.BorderSizePixel = 0
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 14
	btn.TextColor3 = Color3.fromRGB(255,255,255)
	btn.Text = text

	btn.MouseButton1Click:Connect(function()
		local pick = list[math.random(1, #list)]
		btn.Text = text .. ": " .. pick
		callback(pick)
	end)
end

local function AddColor(text, callback)
	local btn = Instance.new("TextButton", container)
	btn.Size = UDim2.new(1, 0, 0, 30)
	btn.BackgroundColor3 = Color3.fromRGB(255,255,255)
	btn.BorderSizePixel = 0
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 14
	btn.TextColor3 = Color3.fromRGB(0,0,0)
	btn.Text = text

	btn.MouseButton1Click:Connect(function()
		local color = Color3.fromRGB(math.random(255), math.random(255), math.random(255))
		btn.BackgroundColor3 = color
		callback(color)
	end)
end
