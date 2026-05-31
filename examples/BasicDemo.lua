--[[
    Basic Demo - Simple example of UI Library usage
]]

local UILibrary = require(game.ServerStorage:WaitForChild("UILibrary"))

-- Create a new screen
local screen = UILibrary.Screen.new()

-- Create a main panel
local mainPanel = UILibrary.Panel.new({
    parent = screen.frame,
    position = UDim2.new(0.5, -150, 0.5, -150),
    size = UDim2.new(0, 300, 0, 300),
    backgroundColor = UILibrary.Colors.Gray100
})

-- Create a title label
local titleLabel = UILibrary.Label.new({
    parent = mainPanel.frame,
    text = "Welcome to UI Library!",
    position = UDim2.new(0, 10, 0, 10),
    size = UDim2.new(1, -20, 0, 30),
    textSize = 20,
    textColor = UILibrary.Colors.Primary
})

-- Create a button
local button = UILibrary.Button.new({
    parent = mainPanel.frame,
    text = "Click Me!",
    position = UDim2.new(0.5, -60, 0, 50),
    size = UDim2.new(0, 120, 0, 40)
})

button:Connect(function()
    print("Button was clicked!")
    titleLabel:SetText("Button Clicked!")
end)

-- Create a progress bar
local progressBar = UILibrary.ProgressBar.new({
    parent = mainPanel.frame,
    position = UDim2.new(0.5, -100, 0, 110),
    size = UDim2.new(0, 200, 0, 20)
})

-- Animate progress bar
local progress = 0
while true do
    wait(0.05)
    progress = (progress + 0.01) % 1
    progressBar:SetProgress(progress)
end
