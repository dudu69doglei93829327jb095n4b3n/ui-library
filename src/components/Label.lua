--[[
    Label Component - Text display component
]]

local Label = {}
Label.__index = Label

local function createLabelFrame(options)
    local frame = Instance.new("TextLabel")
    frame.Name = "Label"
    frame.Size = options.size or UDim2.new(0, 200, 0, 50)
    frame.Position = options.position or UDim2.new(0, 10, 0, 10)
    frame.BackgroundTransparency = options.backgroundTransparency or 1
    frame.BackgroundColor3 = options.backgroundColor or Color3.fromRGB(255, 255, 255)
    frame.TextColor3 = options.textColor or Color3.fromRGB(0, 0, 0)
    frame.TextSize = options.textSize or 18
    frame.Font = options.font or Enum.Font.Gotham
    frame.Text = options.text or "Label"
    frame.TextWrapped = options.textWrapped ~= false
    frame.TextXAlignment = options.textXAlignment or Enum.TextXAlignment.Left
    frame.TextYAlignment = options.textYAlignment or Enum.TextYAlignment.Top
    frame.BorderSizePixel = 0
    frame.Parent = options.parent
    
    return frame
end

function Label.new(options)
    options = options or {}
    
    local self = setmetatable({}, Label)
    
    self.frame = createLabelFrame(options)
    
    return self
end

function Label:SetText(text)
    self.frame.Text = text
end

function Label:GetText()
    return self.frame.Text
end

function Label:SetTextColor(color)
    self.frame.TextColor3 = color
end

function Label:SetTextSize(size)
    self.frame.TextSize = size
end

function Label:Destroy()
    self.frame:Destroy()
end

return Label
