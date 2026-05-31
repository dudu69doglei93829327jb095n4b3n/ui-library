--[[
    Utilities - Helper functions for UI components
]]

local Utils = {}

function Utils.Lerp(start, finish, alpha)
    return start + (finish - start) * alpha
end

function Utils.LerpColor(color1, color2, alpha)
    return Color3.new(
        Utils.Lerp(color1.R, color2.R, alpha),
        Utils.Lerp(color1.G, color2.G, alpha),
        Utils.Lerp(color1.B, color2.B, alpha)
    )
end

function Utils.ContrastColor(color)
    local brightness = (color.R * 299 + color.G * 587 + color.B * 114) / 1000
    return brightness > 0.5 and Color3.new(0, 0, 0) or Color3.new(1, 1, 1)
end

function Utils.Clamp(value, min, max)
    return math.max(min, math.min(max, value))
end

function Utils.RoundNumber(number, decimals)
    local mult = 10 ^ (decimals or 0)
    return math.floor(number * mult + 0.5) / mult
end

function Utils.GetTextSize(text, size, font, frameSize)
    local textLabel = Instance.new("TextLabel")
    textLabel.Text = text
    textLabel.TextSize = size
    textLabel.Font = font
    textLabel.Size = frameSize or UDim2.new(1, 0, 1, 0)
    
    local textBounds = textLabel.TextBounds
    textLabel:Destroy()
    
    return textBounds
end

return Utils
