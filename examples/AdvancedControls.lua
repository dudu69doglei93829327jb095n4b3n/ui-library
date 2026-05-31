--[[
    Advanced Controls Demo - Example with sliders and more complex UI
]]

local UILibrary = require(game.ServerStorage:WaitForChild("UILibrary"))

-- Create screen
local screen = UILibrary.Screen.new()

-- Create main panel
local controlPanel = UILibrary.Panel.new({
    parent = screen.frame,
    position = UDim2.new(0.5, -200, 0.5, -200),
    size = UDim2.new(0, 400, 0, 400),
    backgroundColor = UILibrary.Colors.White
})

-- Title
local title = UILibrary.Label.new({
    parent = controlPanel.frame,
    text = "Advanced Controls",
    position = UDim2.new(0, 10, 0, 10),
    size = UDim2.new(1, -20, 0, 30),
    textSize = 24,
    textColor = UILibrary.Colors.Primary
})

-- Volume slider
local volumeLabel = UILibrary.Label.new({
    parent = controlPanel.frame,
    text = "Volume: 50%",
    position = UDim2.new(0, 10, 0, 50),
    size = UDim2.new(1, -20, 0, 20),
    textSize = 14
})

local volumeSlider = UILibrary.Slider.new({
    parent = controlPanel.frame,
    position = UDim2.new(0, 10, 0, 75),
    size = UDim2.new(1, -20, 0, 30),
    min = 0,
    max = 100,
    value = 50
})

volumeSlider:OnChanged(function(value)
    volumeLabel:SetText("Volume: " .. UILibrary.Utils.RoundNumber(value, 0) .. "%")
end)

-- Brightness slider
local brightnessLabel = UILibrary.Label.new({
    parent = controlPanel.frame,
    text = "Brightness: 100%",
    position = UDim2.new(0, 10, 0, 120),
    size = UDim2.new(1, -20, 0, 20),
    textSize = 14
})

local brightnessSlider = UILibrary.Slider.new({
    parent = controlPanel.frame,
    position = UDim2.new(0, 10, 0, 145),
    size = UDim2.new(1, -20, 0, 30),
    min = 0,
    max = 200,
    value = 100
})

brightnessSlider:OnChanged(function(value)
    brightnessLabel:SetText("Brightness: " .. UILibrary.Utils.RoundNumber(value, 0) .. "%")
end)

-- Options checkboxes
local optionsLabel = UILibrary.Label.new({
    parent = controlPanel.frame,
    text = "Options:",
    position = UDim2.new(0, 10, 0, 190),
    size = UDim2.new(1, -20, 0, 20),
    textSize = 14
})

local soundCheckbox = UILibrary.Checkbox.new({
    parent = controlPanel.frame,
    text = "Enable Sound",
    position = UDim2.new(0, 10, 0, 215),
    size = UDim2.new(1, -20, 0, 30),
    checked = true
})

local musicCheckbox = UILibrary.Checkbox.new({
    parent = controlPanel.frame,
    text = "Enable Music",
    position = UDim2.new(0, 10, 0, 250),
    size = UDim2.new(1, -20, 0, 30),
    checked = true
})

local vibrationCheckbox = UILibrary.Checkbox.new({
    parent = controlPanel.frame,
    text = "Enable Vibration",
    position = UDim2.new(0, 10, 0, 285),
    size = UDim2.new(1, -20, 0, 30),
    checked = false
})

-- Save button
local saveButton = UILibrary.Button.new({
    parent = controlPanel.frame,
    text = "Save Settings",
    position = UDim2.new(0.5, -75, 0, 330),
    size = UDim2.new(0, 150, 0, 40)
})

saveButton:Connect(function()
    print("Settings saved!")
    print("Volume: " .. UILibrary.Utils.RoundNumber(volumeSlider:GetValue(), 0))
    print("Brightness: " .. UILibrary.Utils.RoundNumber(brightnessSlider:GetValue(), 0))
    print("Sound: " .. tostring(soundCheckbox:IsChecked()))
    print("Music: " .. tostring(musicCheckbox:IsChecked()))
    print("Vibration: " .. tostring(vibrationCheckbox:IsChecked()))
end)
