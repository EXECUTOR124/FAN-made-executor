local RunDevCommand = game.ReplicatedStorage:WaitForChild("RunDevCommand")

local ScreenGui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
ScreenGui.IgnoreGuiInset = true

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 350, 0, 200)
Frame.Position = UDim2.new(0.5, -175, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Active = true
Frame.Draggable = true

local TextBox = Instance.new("TextBox", Frame)
TextBox.Size = UDim2.new(1, -20, 0, 40)
TextBox.Position = UDim2.new(0, 10, 0, 10)
TextBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.PlaceholderText = "Enter command (tp Player, speed 50, god...)"
TextBox.ClearTextOnFocus = false

local Execute = Instance.new("TextButton", Frame)
Execute.Size = UDim2.new(1, -20, 0, 40)
Execute.Position = UDim2.new(0, 10, 0, 60)
Execute.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Execute.TextColor3 = Color3.fromRGB(255, 255, 255)
Execute.Text = "Run"

local Output = Instance.new("TextLabel", Frame)
Output.Size = UDim2.new(1, -20, 0, 40)
Output.Position = UDim2.new(0, 10, 0, 110)
Output.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Output.TextColor3 = Color3.fromRGB(255, 255, 255)
Output.Text = "Output..."

Execute.MouseButton1Click:Connect(function()
    local result = RunDevCommand:InvokeServer(TextBox.Text)
    Output.Text = result
end)
