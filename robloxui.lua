-- [[ LUA GOD HUB - GGZERA + RAYFIELD STYLE UI (ALL-IN-ONE) ]] --

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

local function Create(class, props)
	local inst = Instance.new(class)
	for i,v in pairs(props) do
		inst[i] = v
	end
	return inst
end

local Gui = Create("ScreenGui", {
	Name = "LuaGodGGHub",
	Parent = game.CoreGui,
	IgnoreGuiInset = true,
	ResetOnSpawn = false
})

local Main = Create("Frame", {
	Size = UDim2.new(0, 440, 0, 360),
	Position = UDim2.new(0.5, -220, 0.5, -180),
	BackgroundColor3 = Color3.fromRGB(20, 20, 20),
	BorderSizePixel = 0,
	Active = true,
	Draggable = true,
	Parent = Gui
})

local Header = Create("Frame", {
	Size = UDim2.new(1, 0, 0, 35),
	BackgroundColor3 = Color3.fromRGB(30, 30, 30),
	BorderSizePixel = 0,
	Parent = Main
})

local Title = Create("TextBox", {
	Text = "LuaGod Hub 👑",
	TextColor3 = Color3.fromRGB(255, 255, 255),
	Font = Enum.Font.GothamBold,
	TextSize = 16,
	BackgroundTransparency = 1,
	Size = UDim2.new(1, -40, 1, 0),
	Position = UDim2.new(0, 10, 0, 0),
	ClearTextOnFocus = false,
	Parent = Header
})

local Close = Create("TextButton", {
	Text = "X",
	Font = Enum.Font.GothamBold,
	TextColor3 = Color3.fromRGB(255, 50, 50),
	TextSize = 18,
	BackgroundTransparency = 1,
	Size = UDim2.new(0, 35, 1, 0),
	Position = UDim2.new(1, -35, 0, 0),
	Parent = Header
})
Close.MouseButton1Click:Connect(function()
	Gui:Destroy()
end)

local Holder = Create("Frame", {
	Size = UDim2.new(1, -20, 1, -50),
	Position = UDim2.new(0, 10, 0, 40),
	BackgroundTransparency = 1,
	Parent = Main
})

local Layout = Instance.new("UIListLayout", Holder)
Layout.Padding = UDim.new(0, 10)

--[[ ELEMENTOS ]]--

function AddTitle(txt)
	Create("TextLabel", {
		Parent = Holder,
		Text = txt,
		TextColor3 = Color3.fromRGB(255,255,255),
		Font = Enum.Font.GothamBold,
		TextSize = 16,
		BackgroundTransparency = 1,
		Size = UDim2.new(1,0,0,25)
	})
end

function AddButton(txt, callback)
	local btn = Create("TextButton", {
		Text = txt,
		TextColor3 = Color3.fromRGB(255,255,255),
		BackgroundColor3 = Color3.fromRGB(35,35,35),
		Font = Enum.Font.Gotham,
		TextSize = 15,
		BorderSizePixel = 0,
		Size = UDim2.new(1,0,0,30),
		Parent = Holder
	})
	btn.MouseButton1Click:Connect(callback)
end

function AddToggle(txt, callback)
	local state = false
	local btn = Create("TextButton", {
		Text = txt..": OFF",
		TextColor3 = Color3.fromRGB(255,255,255),
		BackgroundColor3 = Color3.fromRGB(35,35,35),
		Font = Enum.Font.Gotham,
		TextSize = 15,
		BorderSizePixel = 0,
		Size = UDim2.new(1,0,0,30),
		Parent = Holder
	})
	btn.MouseButton1Click:Connect(function()
		state = not state
		btn.Text = txt..": "..(state and "ON" or "OFF")
		callback(state)
	end)
end

function AddSlider(txt, min, max, def, callback)
	local value = def
	local btn = Create("TextButton", {
		Text = txt..": "..value,
		TextColor3 = Color3.fromRGB(255,255,255),
		BackgroundColor3 = Color3.fromRGB(35,35,35),
		Font = Enum.Font.Gotham,
		TextSize = 15,
		BorderSizePixel = 0,
		Size = UDim2.new(1,0,0,30),
		Parent = Holder
	})
	btn.MouseButton1Click:Connect(function()
		value += 1
		if value > max then value = min end
		btn.Text = txt..": "..value
		callback(value)
	end)
end

function AddDropdown(txt, list, callback)
	local btn = Create("TextButton", {
		Text = txt,
		TextColor3 = Color3.fromRGB(255,255,255),
		BackgroundColor3 = Color3.fromRGB(35,35,35),
		Font = Enum.Font.Gotham,
		TextSize = 15,
		BorderSizePixel = 0,
		Size = UDim2.new(1,0,0,30),
		Parent = Holder
	})
	btn.MouseButton1Click:Connect(function()
		local picked = list[math.random(1,#list)]
		btn.Text = txt..": "..picked
		callback(picked)
	end)
end

function AddColor(txt, callback)
	local btn = Create("TextButton", {
		Text = txt,
		TextColor3 = Color3.fromRGB(0,0,0),
		BackgroundColor3 = Color3.fromRGB(255,255,255),
		Font = Enum.Font.Gotham,
		TextSize = 15,
		BorderSizePixel = 0,
		Size = UDim2.new(1,0,0,30),
		Parent = Holder
	})
	btn.MouseButton1Click:Connect(function()
		local color = Color3.fromRGB(math.random(255), math.random(255), math.random(255))
		btn.BackgroundColor3 = color
		callback(color)
	end)
end

function Notify(text)
	local notify = Create("TextLabel", {
		Parent = Gui,
		Text = text,
		TextColor3 = Color3.fromRGB(255,255,255),
		Font = Enum.Font.GothamBold,
		TextSize = 14,
		BackgroundColor3 = Color3.fromRGB(20, 20, 20),
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5,0),
		Position = UDim2.new(0.5, 0, 0, -40),
		Size = UDim2.new(0, 300, 0, 35)
	})
	
	TweenService:Create(notify, TweenInfo.new(0.3), {Position = UDim2.new(0.5, 0, 0, 10)}):Play()
	task.wait(2.5)
	TweenService:Create(notify, TweenInfo.new(0.3), {Position = UDim2.new(0.5, 0, 0, -40)}):Play()
	task.wait(0.5)
	notify:Destroy()
end
