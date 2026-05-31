--[[
    Panel Component - Container for organizing UI elements
]]

local Panel = {}
Panel.__index = Panel

local function createPanelFrame(options)
    local frame = Instance.new("Frame")
    frame.Name = "Panel"
    frame.Size = options.size or UDim2.new(0, 300, 0, 200)
    frame.Position = options.position or UDim2.new(0, 10, 0, 10)
    frame.BackgroundColor3 = options.backgroundColor or Color3.fromRGB(245, 245, 245)
    frame.BorderSizePixel = 0
    frame.Parent = options.parent
    
    -- Corner radius
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    -- Padding
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 10)
    padding.PaddingBottom = UDim.new(0, 10)
    padding.PaddingLeft = UDim.new(0, 10)
    padding.PaddingRight = UDim.new(0, 10)
    padding.Parent = frame
    
    return frame
end

function Panel.new(options)
    options = options or {}
    
    local self = setmetatable({}, Panel)
    
    self.frame = createPanelFrame(options)
    self.children = {}
    
    return self
end

function Panel:AddChild(element)
    table.insert(self.children, element)
    element.frame.Parent = self.frame
end

function Panel:RemoveChild(element)
    for i, child in ipairs(self.children) do
        if child == element then
            table.remove(self.children, i)
            break
        end
    end
end

function Panel:GetChildren()
    return self.children
end

function Panel:Destroy()
    for _, child in ipairs(self.children) do
        child:Destroy()
    end
    self.frame:Destroy()
end

return Panel
