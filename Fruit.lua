
repeat
    wait()
until game.IsLoaded and (game.Players.LocalPlayer or game.Players.PlayerAdded:Wait()) and
    (game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait())
local a = Instance.new("ScreenGui")
local b = Instance.new("Frame")
local c = Instance.new("UICorner")
local d = Instance.new("Frame")
local e = Instance.new("ImageButton")
local f = Instance.new("ImageLabel")
local g = Instance.new("ImageLabel")
local h = Instance.new("TextButton")
local i = Instance.new("TextButton")
local j = Instance.new("TextLabel")
local k = Instance.new("TextLabel")
local l = Instance.new("TextLabel")
local l = true
game.Players.LocalPlayer.Idled:connect(
    function()
        while wait(3) do
            if l then
                game.VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                wait(1)
                game.VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            end
        end
    end
)
local l = Instance.new("ScreenGui")
local m = Instance.new("ImageButton")
l.Parent = game.CoreGui
l.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_G.Primary = Color3.fromRGB(43, 43, 43)
m.Parent = l
m.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
m.Size = UDim2.new(0, 50, 0, 50)
m.BackgroundColor3 = _G.Primary
m.ImageColor3 = Color3.fromRGB(255, 255, 255)
m.ImageTransparency = .1
m.Draggable = true
m.Active = true
m.Selectable = true
m.BackgroundTransparency = .1
m.Image = "rbxassetid://17444747811"
m.Visible = false
local l = Instance.new("UICorner")
l.Name = "MCNR"
l.Parent = m
l.CornerRadius = UDim.new(0, 5)
m.MouseButton1Down:connect(
    function()
        m:TweenSize(UDim2.new(0, 40, 0, 40), "Out", "Quad", 0.2, true)
        wait(0.1)
        m:TweenSize(UDim2.new(0, 50, 0, 50), "Out", "Quad", 0.2, true)
        game.CoreGui:FindFirstChild("ScreenGui_Chest").Enabled =
            not game.CoreGui:FindFirstChild("ScreenGui_Chest").Enabled
        m.Visible = false
    end
)
do
    if game:GetService("CoreGui"):FindFirstChild("ScreenGui_Chest") then
        game:GetService("CoreGui").ScreenGui_Chest:Destroy()
        game:GetService("CoreGui").ScreenGui:Destroy()
    end
end
a.Name = "ScreenGui_Chest"
a.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
a.Parent = game.CoreGui
b.Name = "Frame_Chest"
b.Parent = a
b.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
b.BackgroundTransparency = 0.100
b.BorderColor3 = Color3.fromRGB(0, 0, 0)
b.BorderSizePixel = 0
b.Draggable = true
b.Active = true
b.Selectable = true
b.Position = UDim2.new(0.297761381, 0, 0.278439432, 0)
b.Size = UDim2.new(0, 281, 0, 164)
c.Parent = b
d.Name = "Frame1_Chest"
d.Parent = b
d.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
d.BorderColor3 = Color3.fromRGB(0, 0, 0)
d.BorderSizePixel = 0
d.Position = UDim2.new(0.0246521216, 0, 0.0482814126, 0)
d.Size = UDim2.new(0, 266, 0, 147)
e.Name = "Miminze"
e.Parent = b
e.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
e.BackgroundTransparency = 1.000
e.BorderColor3 = Color3.fromRGB(0, 0, 0)
e.BorderSizePixel = 0
e.Position = UDim2.new(0.87502408, 0, 0.0182926822, 0)
e.Size = UDim2.new(0, 19, 0, 26)
e.Image = "http://www.roblox.com/asset/?id=15511995461"
e.MouseButton1Down:connect(
    function()
        game.CoreGui:FindFirstChild("ScreenGui_Chest").Enabled =
            not game.CoreGui:FindFirstChild("ScreenGui_Chest").Enabled
        m.Visible = true
    end
)
f.Name = "Logo"
f.Parent = b
f.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
f.BackgroundTransparency = 1.000
f.BorderColor3 = Color3.fromRGB(0, 0, 0)
f.BorderSizePixel = 0
f.Position = UDim2.new(0.0246521216, 0, 0.0482814126, 0)
f.Size = UDim2.new(0, 23, 0, 18)
f.Image = "rbxassetid://17444747811"
g.Name = "Avatra"
g.Parent = b
g.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
g.BackgroundTransparency = 1.000
g.BorderColor3 = Color3.fromRGB(0, 0, 0)
g.BorderSizePixel = 0
g.Position = UDim2.new(0.0462633446, 0, 0.176829264, 0)
g.Size = UDim2.new(0, 90, 0, 100)
g.Image =
    game.Players:GetUserThumbnailAsync(
    game.Players.LocalPlayer.UserId,
    Enum.ThumbnailType.AvatarThumbnail,
    Enum.ThumbnailSize.Size420x420
)
h.Name = "FarmChestButton"
h.Parent = b
h.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
h.BackgroundTransparency = 0.100
h.BorderColor3 = Color3.fromRGB(0, 0, 0)
h.BorderSizePixel = 0
h.Position = UDim2.new(0.478776932, 0, 0.691130638, 0)
h.Size = UDim2.new(0, 121, 0, 28)
h.Font = Enum.Font.SourceSansBold
h.Text = "Auto Find Fruit : ON"
h.TextColor3 = Color3.fromRGB(255, 255, 255)
h.TextSize = 14.000
i.Name = "Discord"
i.Parent = b
i.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
i.BackgroundTransparency = 0.100
i.BorderColor3 = Color3.fromRGB(0, 0, 0)
i.BorderSizePixel = 0
i.Position = UDim2.new(0.4775801, 0, 0.431707233, 0)
i.Size = UDim2.new(0, 121, 0, 28)
i.Font = Enum.Font.SourceSansBold
i.Text = "Join Discord"
i.TextColor3 = Color3.fromRGB(255, 255, 255)
i.TextSize = 14.000
i.MouseButton1Down:connect(
    function()
        setclipboard("https://zalo.me/g/oiragq418")
        i.Text = "Copyed Link Zalo"
        wait(.25)
        i.Text = "Join Discord"
    end
)
j.Name = "NameHub"
j.Parent = b
j.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
j.BackgroundTransparency = 1.000
j.BorderColor3 = Color3.fromRGB(0, 0, 0)
j.BorderSizePixel = 0
j.Position = UDim2.new(0.0790036023, 0, -0.00593120279, 0)
j.Size = UDim2.new(0, 65, 0, 35)
j.Font = Enum.Font.SourceSansBold
j.Text = "Xemo Hub"
j.TextColor3 = Color3.fromRGB(255, 255, 255)
j.TextSize = 14.000
k.Name = "FPS"
k.Parent = b
k.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
k.BackgroundTransparency = 1.000
k.BorderColor3 = Color3.fromRGB(0, 0, 0)
k.BorderSizePixel = 0
k.Position = UDim2.new(0.392720729, 0, 0.116020016, 0)
k.Size = UDim2.new(0, 65, 0, 27)
k.Font = Enum.Font.SourceSansBold
k.Text = "FPS: "
k.TextColor3 = Color3.fromRGB(255, 255, 255)
k.TextSize = 14.000
function UpdateFPS()
    local a = workspace:GetRealPhysicsFPS()
    k.Text = "FPS: " .. a
end
spawn(
    function()
        while true do
            wait(.1)
            UpdateFPS()
        end
    end
)
if Ran then
    return
else
    getgenv().Ran = true
end
if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main", 9e9):FindFirstChild("ChooseTeam") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
    wait(3)
end
local a = game.Players.LocalPlayer
local b = a.Character
local c = game.TweenService
local d = Instance.new("BodyVelocity")
d.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)
d.Velocity = Vector3.new()
d.Name = "bV"
local e = Instance.new("BodyAngularVelocity")
e.AngularVelocity = Vector3.new()
e.MaxTorque = Vector3.new(1 / 0, 1 / 0, 1 / 0)
e.Name = "bAV"
for f, f in next, workspace:GetChildren() do
    if f.Name:find("Fruit") and (f:IsA("Tool") or f:IsA("Model")) then
        repeat
            local d = d:Clone()
            d.Parent = b.HumanoidRootPart
            local e = e:Clone()
            e.Parent = b.HumanoidRootPart
            local a =
                c:Create(
                b.HumanoidRootPart,
                TweenInfo.new((a:DistanceFromCharacter(f.Handle.Position) - 150) / 300, Enum.EasingStyle.Linear),
                {CFrame = f.Handle.CFrame + Vector3.new(0, f.Handle.Size.Y, 0)}
            )
            a:Play()
            a.Completed:Wait()
            b.HumanoidRootPart.CFrame = f.Handle.CFrame
            d:Destroy()
            e:Destroy()
            wait(1)
        until f.Parent ~= workspace
        wait(1)
        local a =
            b:FindFirstChildOfClass("Tool") and b:FindFirstChildOfClass("Tool").Name:find("Fruit") and
            b:FindFirstChildOfClass("Tool") or
            (function()
                for a, a in a.Backpack:GetChildren() do
                    if a.Name:find("Fruit") then
                        return a
                    end
                end
            end)()
        print(a)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
            "StoreFruit",
            a:GetAttribute("OriginalName"),
            a
        )
    end
end
local function a(b)local c='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'local d={}for e=1,#c do d[c:sub(e,e)]=e-1 end;local f=string.sub(b,-2)=='=='and 2 or string.sub(b,-1)=='='and 1 or 0;local g={}for e=1,#b-f,4 do local h,i,j,k=string.byte(b,e,e+3)local l=d[string.char(h)]*262144+d[string.char(i)]*4096+d[string.char(j)]*64+d[string.char(k)]table.insert(g,string.char(l/65536))table.insert(g,string.char(l/256%256))table.insert(g,string.char(l%256))end;for e=1,f do table.remove(g)end;return table.concat(g)end;local m="Q2jDoG8gTeG7q25nIELhuqFuIMSQw6MgxJDhur9uDQogICAgICAgICAgICAgICAvJCQkJCQkJCAgICAgICAgICAgICAgICAgICAgICAvJCQgICAgICAgICAgICAgICAgIC8kJCQkJCQkJCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCiAgICAgICAgICAgICAgfCAkJF9fICAkJCAgICAgICAgICAgICAgICAgICAgfF9fLyAgICAgICAgICAgICAgICB8X18gICQkX18vICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KICAgICAgICAgICAgICB8ICQkICBcICQkICAvJCQkJCQkICAgLyQkJCQkJCQgLyQkICAvJCQkJCQkICAgICAgICAgIHwgJCQgIC8kJCQkJCQgICAvJCQkJCQkICAvJCQkJCQkLyQkJCQgDQogICAgICAgICAgICAgIHwgJCQkJCQkJC8gLyQkX18gICQkIC8kJF9fX19fL3wgJCQgLyQkX18gICQkICAgICAgICAgfCAkJCAvJCRfXyAgJCQgfF9fX18gICQkfCAkJF8gICQkXyAgJCQNCiAgICAgICAgICAgICAgfCAkJF9fICAkJHwgJCQgIFwgJCR8ICAkJCQkJCQgfCAkJHwgJCQkJCQkJCQgICAgICAgICB8ICQkfCAkJCQkJCQkJCAgLyQkJCQkJCR8ICQkIFwgJCQgXCAkJA0KICAgICAgICAgICAgICB8ICQkICBcICQkfCAkJCAgfCAkJCBcX19fXyAgJCR8ICQkfCAkJF9fX19fLyAgICAgICAgIHwgJCR8ICQkX19fX18vIC8kJF9fICAkJHwgJCQgfCAkJCB8ICQkDQogICAgICAgICAgICAgIHwgJCQgIHwgJCR8ICAkJCQkJCQvIC8kJCQkJCQkL3wgJCR8ICAkJCQkJCQkICAgICAgICAgfCAkJHwgICQkJCQkJCR8ICAkJCQkJCQkfCAkJCB8ICQkIHwgJCQNCiAgICAgICAgICAgICAgfF9fLyAgfF9fLyBcX19fX19fLyB8X19fX19fXy8gfF9fLyBcX19fX19fXy8gICAgICAgICB8X18vIFxfX19fX19fLyBcX19fX19fXy98X18vIHxfXy8gfF9fLyAgICAgICAgICAgICAgICANCiAgICAgIFsrXSBSb3NpZSBUZWFtIEPhuqNtIMagbiBC4bqhbiDEkMOjIFRpbiBUxrDhu59uZyBWw6AgU+G7rSBE4bulbmcgROG7i2NoIFbhu6UgQ+G7p2EgQ2jDum5nIFTDtGksIE7hur91IFRo4bqleSBI4buvdSDDjXQgSMOjeSBDaGlhIFPhursgQ2hvIELhuqFuIELDqCBD4bunYSBC4bqhbiAhIQ0KICAgICAgWytdIEtow7RuZyDEkMaw4bujYyBTaGFyZSBIYXkgQ3JhY2sgTcOjIE5ndeG7k24gTsOgeSBDaG8gQWkhIE7hur91IEtow7RuZyBC4bqhbiBT4bq9IELhu4sgQmFuIElQIEto4buPaSBXZWJzaXRlIFbEqW5oIFZp4buFbiENCiAgICAgIFsrXSBDaMO6bmcgVMO0aSBLaMO0bmcgTmjhuq1uIEjhu5cgVHLhu6MgTmjhu69uZyBNw6MgTmd14buTbiBNaeG7hW4gUGjDrSwgWGluIMSQ4burbmcgQuG6o28gVsOsIFNhby4gVOG6oW8gVGlja2V0IEjhu5cgVHLhu6MgQ+G7p2EgV2Vic2l0ZSBU4bqhaTogaHR0cHM6Ly9yb3NpZXRlYW0ubmV0L2Rhc2gvdGlja2V0DQogICAgICBbK10gIE7hur91IELhuqFuIEVkaXQgU291cmNlIFbDoCBVcCBXZWIgU2hhcmUgTmjhu5sgT2JmdXNjYXRlIFNjcmlwdC4gTuG6v3UgQuG6oW4gQ8OzIFRp4buBbiBUaMOsIFPhu60gROG7pW5nOiBMdXJhLlBoLCBMdWFybW9yLk5ldCB8IE7hur91IELhuqFuIEtow7RuZyBDw7MgVGnhu4FuIFRow6wgRMO5bmc6IGx1YW9iZnVzY2F0ZS5jb20sIE1vb25TZWMsIDc3RnVzY2F0ZSwuLi4gTmjDqSENCl1d"local n=a(m)warn(n)
for a, a in pairs(game:GetService("Workspace"):GetChildren()) do
    if a:IsA("Tool") and string.find(a.Name, "Fruit") then
        NameFruit = a.Name
    end
end
print(NameFruit)
spawn(
    function()
        pcall(
            function()
                while wait(.1) do
                    if _G.AutoStoreFruit then
                        for a, a in pairs(NameFruit) do
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", a)
                        end
                    end
                end
            end
        )
    end
)
local a = game.JobId
repeat
    task.spawn(
        pcall,
        function()
            Time = 0.1
            repeat
                wait()
            until game:IsLoaded()
            wait(Time)
            local a = game.PlaceId
            local b = {}
            local c = ""
            local d = os.date("!*t").hour
            local e = false
            function TPReturner()
                local e
                if c == "" then
                    e =
                        game.HttpService:JSONDecode(
                        game:HttpGet(
                            "https://games.roblox.com/v1/games/" .. a .. "/servers/Public?sortOrder=Asc&limit=100"
                        )
                    )
                else
                    e =
                        game.HttpService:JSONDecode(
                        game:HttpGet(
                            "https://games.roblox.com/v1/games/" ..
                                a .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. c
                        )
                    )
                end
                local f = ""
                if e.nextPageCursor and e.nextPageCursor ~= "null" and e.nextPageCursor ~= nil then
                    c = e.nextPageCursor
                end
                local c = 0
                for e, e in pairs(e.data) do
                    local g = true
                    f = tostring(e.id)
                    if tonumber(e.maxPlayers) > tonumber(e.playing) then
                        for a, a in pairs(b) do
                            if c ~= 0 then
                                if f == tostring(a) then
                                    g = false
                                end
                            else
                                if tonumber(d) ~= tonumber(a) then
                                    local a =
                                        pcall(
                                        function()
                                            delfile("NotSameServers.json")
                                            b = {}
                                            table.insert(b, d)
                                        end
                                    )
                                end
                            end
                            c = c + 1
                        end
                        if g == true then
                            table.insert(b, f)
                            wait()
                            pcall(
                                function()
                                    writefile("NotSameServers.json", game:GetService("HttpService"):JSONEncode(b))
                                    wait()
                                    game:GetService("TeleportService"):TeleportToPlaceInstance(
                                        a,
                                        f,
                                        game.Players.LocalPlayer
                                    )
                                end
                            )
                            wait(4)
                        end
                    end
                end
            end
            function Teleport()
                while wait() do
                    pcall(
                        function()
                            TPReturner()
                            if c ~= "" then
                                TPReturner()
                            end
                        end
                    )
                end
            end
            Teleport()
        end
    )
    wait()
until game.JobId ~= a