--[[
    TextBox Component - Text input component
]]

local TextBox = {}
TextBox.__index = TextBox

local function createTextBoxFrame(options)
    local frame = Instance.new("TextBox")
    frame.Name = "TextBox"
    frame.Size = options.size or UDim2.new(0, 200, 0, 40)
    frame.Position = options.position or UDim2.new(0, 10, 0, 10)
    frame.BackgroundColor3 = options.backgroundColor or Color3.fromRGB(255, 255, 255)
    frame.TextColor3 = options.textColor or Color3.fromRGB(0, 0, 0)
    frame.PlaceholderColor3 = options.placeholderColor or Color3.fromRGB(180, 180, 180)
    frame.PlaceholderText = options.placeholder or "Enter text..."
    frame.TextSize = options.textSize or 16
    frame.Font = options.font or Enum.Font.Gotham
    frame.BorderSizePixel = 1
    frame.BorderColor3 = options.borderColor or Color3.fromRGB(200, 200, 200)
    frame.Parent = options.parent
    
    -- Corner radius
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = frame
    
    return frame
end

function TextBox.new(options)
    options = options or {}
    
    local self = setmetatable({}, TextBox)
    
    self.frame = createTextBoxFrame(options)
    self._connections = {}
    
    self:_setupInteractions()
    
    return self
end

function TextBox:_setupInteractions()
    self._connections.focusGained = self.frame.FocusLost:Connect(function(enterPressed)
        if self._focusCallback then
            self._focusCallback(enterPressed, self:GetText())
        end
    end)
end

function TextBox:OnFocusLost(callback)
    self._focusCallback = callback
end

function TextBox:GetText()
    return self.frame.Text
end

function TextBox:SetText(text)
    self.frame.Text = text
end

function TextBox:Clear()
    self.frame.Text = ""
end

function TextBox:Focus()
    self.frame:CaptureFocus()
end

function TextBox:Destroy()
    for _, connection in pairs(self._connections) do
        connection:Disconnect()
    end
    self.frame:Destroy()
end

return TextBox
