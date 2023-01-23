local Quad = script and script.Parent and require(script.Parent.Quad) or (function() repeat task.wait() until getgenv().Quad return getgenv().Quad end)()
local quad = Quad.init("ui")
local round,class,mount,store,event,tween
    = quad.round,quad.class,quad.mount,quad.store,quad.event,quad.tween

local shadow = class.extend()

local frame = class("Frame")
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.75
frame.BackgroundColor3 = Color3.fromRGB(0,0,0)

local imageLabel = class("ImageLabel")
imageLabel.BackgroundTransparency = 1

function shadow:init(props)
    props:default("ShadowSizeLeft",40)
    props:default("ShadowSizeRight",40)
    props:default("ShadowSizeTop",30)
    props:default("ShadowSizeBottom",50)
    props:default("ZIndex",-1)
    props:default("Size",UDim2.fromScale(1,1))
    props:default("Position",UDim2.fromScale(0,0))
    props:default("AnchorPoint",Vector2.new(0,0))
end

function shadow:render(props)
    return frame {
        Size = props("Size"),
        Position = props("Position"),
        AnchorPoint = props("AnchorPoint"),
        ZIndex = props("ZIndex"),
        imageLabel("Bottom"){
            [event.created] = function(this)
                self.__Bottom = this
            end,
            Position = UDim2.fromScale(0, 1),
            Size = props("ShadowSizeBottom"):with(function()
                return UDim2.new(1, 0, 0, props.ShadowSizeBottom)
            end),
            ZIndex = props("ZIndex"),
            Image = "rbxassetid://6030947500"
        },
        imageLabel("BottomRight"){
            [event.created] = function(this)
                self.__BottomRight = this
            end,
            Position = UDim2.fromScale(1, 1),
            Size = props("ShadowSizeBottom,ShadowSizeRight"):with(function()
                return UDim2.new(0, props.ShadowSizeRight, 0, props.ShadowSizeBottom)
            end),
            ZIndex = props("ZIndex"),
            Image = "rbxassetid://6030948089"
        },
        imageLabel("BottomLeft"){
            [event.created] = function(this)
                self.__BottomLeft = this
            end,
            Position = UDim2.fromScale(0, 1),
            Size = props("ShadowSizeBottom,ShadowSizeLeft"):with(function()
                return UDim2.new(0, props.ShadowSizeLeft, 0, props.ShadowSizeBottom)
            end),
            ZIndex = props("ZIndex"),
            Image = "rbxassetid://6030947802",
            AnchorPoint = Vector2.new(1, 0)
        },
        imageLabel("Top"){
            [event.created] = function(this)
                self.__Top = this
            end,
            Size = props("ShadowSizeTop"):with(function()
                return UDim2.new(1, 0, 0, props.ShadowSizeTop)
            end),
            ZIndex = props("ZIndex"),
            Image = "rbxassetid://6030947326",
            AnchorPoint = Vector2.new(0, 1)
        },
        imageLabel("TopLeft"){
            [event.created] = function(this)
                self.__TopLeft = this
            end,
            Size = props("ShadowSizeTop,ShadowSizeLeft"):with(function()
                return UDim2.new(0, props.ShadowSizeLeft, 0, props.ShadowSizeTop)
            end),
            ZIndex = props("ZIndex"),
            Image = "rbxassetid://6030947654",
            AnchorPoint = Vector2.new(1, 1)
        },
        imageLabel("TopRight"){
            [event.created] = function(this)
                self.__TopRight = this
            end,
            Position = UDim2.fromScale(1, 0),
            Size = props("ShadowSizeTop,ShadowSizeRight"):with(function()
                return UDim2.new(0, props.ShadowSizeRight, 0, props.ShadowSizeTop)
            end),
            ZIndex = props("ZIndex"),
            Image = "rbxassetid://6030947949",
            AnchorPoint = Vector2.new(0, 1)
        },
        imageLabel("Left"){
            [event.created] = function(this)
                self.__Left = this
            end,
            Size = props("ShadowSizeLeft"):with(function()
                return UDim2.new(0, props.ShadowSizeLeft, 1, 0)
            end),
            ZIndex = props("ZIndex"),
            Image = "rbxassetid://6030946815",
            AnchorPoint = Vector2.new(1, 0)
        },
        imageLabel("Right"){
            [event.created] = function(this)
                self.__Right = this
            end,
            Position = UDim2.fromScale(1, 0),
            Size = props("ShadowSizeRight"):with(function()
                return UDim2.new(0, props.ShadowSizeRight, 1, 0)
            end),
            ZIndex = props("ZIndex"),
            Image = "rbxassetid://6030947135"
        }
    }
end

return shadow
