-- GGZERA STYLE HUB FULL LUAU UI by LUA GOD 💻🔥
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UIS = game:GetService("UserInputService")

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = "LuaGodGGZeraUI"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.3, 0, 0.3, 0)
Main.Size = UDim2.new(0, 420, 0, 320)
Main.Active = true
Main.Draggable = true

local Title = Instance.new("TextLabel", Main)
Title.Text = "Lua God Hub - GGZera Style"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Title.BorderSizePixel = 0
Title.TextSize = 18

local Close = Instance.new("TextButton", Main)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextColor3 = Color3.fromRGB(255, 50, 50)
Close.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Close.Size = UDim2.new(0, 40, 0, 40)
Close.Position = UDim2.new(1, -40, 0, 0)
Close.BorderSizePixel = 0
Close.TextSize = 20

Close.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

local Container = Instance.new("Frame", Main)
Container.BackgroundTransparency = 1
Container.Position = UDim2.new(0, 10, 0, 50)
Container.Size = UDim2.new(1, -20, 1, -60)

local UIListLayout = Instance.new("UIListLayout", Container)
UIListLayout.Padding = UDim.new(0, 10)

-- FUNÇÃO RAPIDA DE CRIAÇÃO DE TOGGLE
local function CreateToggle(text, callback)
	local Toggle = Instance.new("TextButton", Container)
	Toggle.Size = UDim2.new(1, 0, 0, 30)
	Toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Toggle.BorderSizePixel = 0
	Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
	Toggle.Font = Enum.Font.Gotham
	Toggle.TextSize = 16
	Toggle.Text = text .. ": OFF"
	
	local state = false
	Toggle.MouseButton1Click:Connect(function()
		state = not state
		Toggle.Text = text .. ": " .. (state and "ON" or "OFF")
		if callback then callback(state) end
	end)
end

-- DROPDOWN STYLE
local function CreateDropdown(text, list, callback)
	local Drop = Instance.new("TextButton", Container)
	Drop.Size = UDim2.new(1, 0, 0, 30)
	Drop.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Drop.BorderSizePixel = 0
	Drop.TextColor3 = Color3.fromRGB(255, 255, 255)
	Drop.Font = Enum.Font.Gotham
	Drop.TextSize = 16
	Drop.Text = text

	Drop.MouseButton1Click:Connect(function()
		Drop.Text = text .. ": " .. list[math.random(1, #list)]
		if callback then callback(Drop.Text) end
	end)
end

-- SLIDER STYLE
local function CreateSlider(text, min, max, callback)
	local Slider = Instance.new("TextButton", Container)
	Slider.Size = UDim2.new(1, 0, 0, 30)
	Slider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Slider.BorderSizePixel = 0
	Slider.TextColor3 = Color3.fromRGB(255, 255, 255)
	Slider.Font = Enum.Font.Gotham
	Slider.TextSize = 16
	local value = min
	Slider.Text = text .. ": " .. tostring(value)
	
	Slider.MouseButton1Click:Connect(function()
		value = value + 1
		if value > max then value = min end
		Slider.Text = text .. ": " .. tostring(value)
		if callback then callback(value) end
	end)
end

-- COLOR PICKER SIMPLIFICADO
local function CreateColor(text, callback)
	local Btn = Instance.new("TextButton", Container)
	Btn.Size = UDim2.new(1, 0, 0, 30)
	Btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Btn.BorderSizePixel = 0
	Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
	Btn.Font = Enum.Font.Gotham
	Btn.TextSize = 16
	Btn.Text = text
	
	Btn.MouseButton1Click:Connect(function()
		local color = Color3.fromRGB(math.random(255), math.random(255), math.random(255))
		Btn.BackgroundColor3 = color
		if callback then callback(color) end
	end)
end
