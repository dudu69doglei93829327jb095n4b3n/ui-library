--[[
    Checkbox Component - Boolean toggle component
]]

local Checkbox = {}
Checkbox.__index = Checkbox

local function createCheckboxFrame(options)
    local frame = Instance.new("Frame")
    frame.Name = "Checkbox"
    frame.Size = options.size or UDim2.new(0, 200, 0, 30)
    frame.Position = options.position or UDim2.new(0, 10, 0, 10)
    frame.BackgroundTransparency = 1
    frame.BorderSizePixel = 0
    frame.Parent = options.parent
    
    -- Checkbox box
    local box = Instance.new("TextButton")
    box.Name = "Box"
    box.Size = UDim2.new(0, 24, 0, 24)
    box.Position = UDim2.new(0, 0, 0.5, -12)
    box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    box.TextColor3 = Color3.fromRGB(0, 120, 215)
    box.TextSize = 14
    box.Font = Enum.Font.GothamBold
    box.Text = ""
    box.BorderColor3 = Color3.fromRGB(150, 150, 150)
    box.BorderSizePixel = 1
    box.Parent = frame
    
    local boxCorner = Instance.new("UICorner")
    boxCorner.CornerRadius = UDim.new(0, 3)
    boxCorner.Parent = box
    
    -- Label
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(1, -34, 1, 0)
    label.Position = UDim2.new(0, 34, 0, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(0, 0, 0)
    label.TextSize = 14
    label.Font = Enum.Font.Gotham
    label.Text = options.text or "Checkbox"
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.BorderSizePixel = 0
    label.Parent = frame
    
    return frame, box, label
end

function Checkbox.new(options)
    options = options or {}
    
    local self = setmetatable({}, Checkbox)
    
    self.frame, self.box, self.label = createCheckboxFrame(options)
    self.checked = options.checked or false
    self._connections = {}
    
    self:_setupInteractions()
    self:SetChecked(self.checked)
    
    return self
end

function Checkbox:_setupInteractions()
    self._connections.click = self.box.MouseButton1Click:Connect(function()
        self:Toggle()
        if self._changeCallback then
            self._changeCallback(self.checked)
        end
    end)
end

function Checkbox:Toggle()
    self:SetChecked(not self.checked)
end

function Checkbox:SetChecked(checked)
    self.checked = checked
    if self.checked then
        self.box.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
        self.box.Text = "✓"
        self.box.TextColor3 = Color3.fromRGB(255, 255, 255)
    else
        self.box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        self.box.Text = ""
    end
end

function Checkbox:IsChecked()
    return self.checked
end

function Checkbox:SetText(text)
    self.label.Text = text
end

function Checkbox:OnChanged(callback)
    self._changeCallback = callback
end

function Checkbox:Destroy()
    for _, connection in pairs(self._connections) do
        connection:Disconnect()
    end
    self.frame:Destroy()
end

return Checkbox
