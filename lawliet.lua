-- ts file was generated at discord.gg/25ms


if not LPH_OBFUSCATED then
    function LPH_NO_VIRTUALIZE(...)
        return ...
    end
    function LPH_JIT_MAX(...)
        return ...
    end
    function LPH_JIT_ULTRA(...)
        return ...
    end
end
LPH_JIT_ULTRA(function()
    local v1 = nil
    if getgenv().phyx_target.GUIs["Big Gui"] ~= true then
        if getgenv().phyx_target.GUIs["Big Gui"] == false then
            v1 = UDim2.new(0, 75, 0, 35)
        end
    else
        v1 = UDim2.new(0, 100, 0, 50)
    end
    local vu2 = true
    local _ = game:GetService("Workspace").CurrentCamera
    local vu3 = nil
    local vu4 = false
    game.Players.LocalPlayer:GetMouse()
    local vu5 = Instance.new("Part", game.Workspace)
    local v6 = game:GetService("RunService")
    local vu7 = false
    local vu8 = 0
    local v9 = Color3.fromRGB(30, 30, 30)
    local vu10 = game:GetService("HttpService")
    local vu11 = Instance.new("Folder", game:GetService("Workspace"))
    local vu12 = {}
    local function vu20()
        if getgenv().phyx_target.GUIs["Save Position"] and isfile("phyx_by_pluh.txt") then
            local v13, v14 = pcall(function()
                return vu10:JSONDecode(readfile("phyx_by_pluh.txt"))
            end)
            if v13 and v14 then
                local v15, v16, v17 = pairs(v14)
                local v18 = {}
                while true do
                    local v19
                    v17, v19 = v15(v16, v17)
                    if v17 == nil then
                        break
                    end
                    v18[v17] = UDim2.new(0, v19.X, 0, v19.Y)
                end
                return v18
            end
        end
        return {}
    end
    local function vu33(p21)
        local v22 = vu20() or {}
        local v23, v24, v25 = pairs(v22)
        local v26 = {}
        while true do
            local v27
            v25, v27 = v23(v24, v25)
            if v25 == nil then
                break
            end
            v26[v25] = {
                X = v27.X.Offset,
                Y = v27.Y.Offset
            }
        end
        local v28, v29, v30 = pairs(p21)
        while true do
            local v31
            v30, v31 = v28(v29, v30)
            if v30 == nil then
                break
            end
            v26[v30] = {
                X = v31.X.Offset,
                Y = v31.Y.Offset
            }
        end
        local v32 = vu10
        writefile("phyx_by_pluh.txt", v32:JSONEncode(v26))
    end
    local function vu39()
        if isfile("phyx_by_pluh.txt") then
            delfile("phyx_by_pluh.txt")
        end
        vu33({})
        local v34, v35, v36 = pairs(vu12)
        while true do
            local v37
            v36, v37 = v34(v35, v36)
            if v36 == nil then
                break
            end
            local v38 = UDim2.new(0, 10 + v37.Counter * 110, 0, 10)
            v37.Frame.Position = v38
        end
        print("GUI positions have been reset to defaults.")
    end
    local function v57(pu40, p41, p42, p43, p44)
        local v45 = Instance.new("ScreenGui")
        v45.Name = pu40
        v45.Parent = game.CoreGui
        local vu46 = Instance.new("Frame")
        vu46.Size = p41
        vu46.Position = vu20()[pu40] or UDim2.new(0, 10 + vu8 * 110, 0, 10)
        vu46.BackgroundColor3 = p42
        vu46.Active = true
        vu46.Draggable = true
        vu46.Parent = v45
        local v47 = Instance.new("UIStroke")
        v47.Color = Color3.fromRGB(0, 0, 0)
        v47.Thickness = 2
        v47.Parent = vu46
        local v48 = Instance.new("UICorner")
        v48.CornerRadius = UDim.new(0, 10)
        v48.Parent = vu46
        local v49, v50, v51, v52
        if p41 ~= UDim2.new(0, 100, 0, 50) then
            v49 = p41.X.Offset - 10
            v50 = p41.Y.Offset - 10
            v51 = 5
            v52 = 5
        else
            v49 = 80
            v50 = 30
            v51 = (p41.X.Offset - v49) / 2
            v52 = (p41.Y.Offset - v50) / 2
        end
        local v53 = Instance.new("TextButton")
        v53.Size = UDim2.new(0, v49, 0, v50)
        v53.Position = UDim2.new(0, v51, 0, v52)
        v53.Text = p43 or "Button"
        v53.Font = Enum.Font.Fantasy
        v53.TextScaled = true
        v53.TextWrapped = true
        v53.TextColor3 = Color3.fromRGB(255, 215, 18)
        v53.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        v53.Parent = vu46
        local v54 = Instance.new("UIPadding")
        v54.PaddingTop = UDim.new(0, 2)
        v54.PaddingBottom = UDim.new(0, 2)
        v54.PaddingLeft = UDim.new(0, 2)
        v54.PaddingRight = UDim.new(0, 2)
        v54.Parent = v53
        local v55 = Instance.new("UICorner")
        v55.CornerRadius = UDim.new(0, 10)
        v55.Parent = v53
        v53.MouseButton1Click:Connect(p44)
        vu46:GetPropertyChangedSignal("Position"):Connect(function()
            local v56 = vu20()
            v56[pu40] = vu46.Position
            vu33(v56)
        end)
        vu12[pu40] = {
            Frame = vu46,
            Counter = vu8
        }
        vu8 = vu8 + 1
        return v53, vu46
    end
    function play_sound(p58, p59)
        local vu60 = Instance.new("Sound")
        vu60.SoundId = "rbxassetid://" .. p58
        vu60.Volume = p59
        vu60.Parent = vu11
        local v61 = vu60
        vu60.Play(v61)
        vu60.Ended:Connect(function()
            vu60:Destroy()
        end)
    end
    game.Players.LocalPlayer.Chatted:Connect(function(p62)
        if string.lower(p62) == "/e phyx.reset" then
            vu39()
        end
    end)
    local v63 = protectgui or (syn and syn.protect_gui or function()
    end)
    local v64 = Instance.new("ScreenGui")
    local vu65 = game:GetService("TextService")
    local v66 = game:GetService("CoreGui")
    v63(v64)
    v64.ZIndexBehavior = Enum.ZIndexBehavior.Global
    v64.Parent = v66
    local vu85 = {
        Registry = {},
        RegistryMap = {},
        HudRegistry = {},
        FontColor = Color3.fromRGB(255, 255, 255),
        MainColor = Color3.fromRGB(28, 28, 28),
        BackgroundColor = Color3.fromRGB(20, 20, 20),
        AccentColor = Color3.fromRGB(240, 196, 7),
        OutlineColor = Color3.fromRGB(50, 50, 50),
        RiskColor = Color3.fromRGB(255, 50, 50),
        Black = Color3.new(0, 0, 0),
        Font = Enum.Font.Code,
        OpenedFrames = {},
        DependencyBoxes = {},
        Signals = {},
        ScreenGui = v64,
        GetTextBounds = function(_, p67, p68, p69, p70)
            local v71 = vu65:GetTextSize(p67, p69, p68, p70 or Vector2.new(1920, 1080))
            return v71.X, v71.Y
        end,
        Create = function(_, p72, p73)
            if type(p72) == "string" then
                p72 = Instance.new(p72)
            end
            local v74 = next
            local v75 = nil
            while true do
                local v76
                v75, v76 = v74(p73, v75)
                if v75 == nil then
                    break
                end
                p72[v75] = v76
            end
            return p72
        end,
        AddToRegistry = function(_, p77, p78, p79)
            local v80 = {
                Instance = p77,
                Properties = p78,
                Idx = # vu85.Registry + 1
            }
            table.insert(vu85.Registry, v80)
            vu85.RegistryMap[p77] = v80
            if p79 then
                table.insert(vu85.HudRegistry, v80)
            end
        end,
        GetDarkerColor = function(_, p81)
            local v82, v83, v84 = Color3.toHSV(p81)
            return Color3.fromHSV(v82, v83, v84 / 1.5)
        end
    }
    local v86 = vu85
    vu85.NotificationArea = vu85.Create(v86, "Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 40),
        Size = UDim2.new(0, 300, 0, 200),
        ZIndex = 100,
        Parent = v64
    })
    local v87 = vu85
    vu85.Create(v87, "UIListLayout", {
        Padding = UDim.new(0, 4),
        FillDirection = Enum.FillDirection.Vertical,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = vu85.NotificationArea
    })
    function vu85.ApplyTextStroke(_, p88)
        p88.TextStrokeTransparency = 1
        vu85:Create("UIStroke", {
            Color = Color3.new(0, 0, 0),
            Thickness = 1,
            LineJoinMode = Enum.LineJoinMode.Miter,
            Parent = p88
        })
    end
    function vu85.CreateLabel(_, p89, p90)
        local v91 = vu85:Create("TextLabel", {
            BackgroundTransparency = 1,
            Font = vu85.Font,
            TextColor3 = vu85.FontColor,
            TextSize = 16,
            TextStrokeTransparency = 0
        })
        vu85:ApplyTextStroke(v91)
        vu85:AddToRegistry(v91, {
            TextColor3 = "FontColor"
        }, p90)
        return vu85:Create(v91, p89)
    end
    function vu85.Notify(_, p92, pu93)
        if getgenv().phyx_target.Main.Notification then
            local v94, v95 = vu85:GetTextBounds(p92, vu85.Font, 14)
            local vu96 = v95 + 7
            local vu97 = vu85:Create("Frame", {
                BorderColor3 = Color3.new(0, 0, 0),
                Position = UDim2.new(0, 100, 0, 10),
                Size = UDim2.new(0, 0, 0, vu96),
                ClipsDescendants = true,
                ZIndex = 100,
                Parent = vu85.NotificationArea
            })
            local v98 = vu85:Create("Frame", {
                BackgroundColor3 = vu85.MainColor,
                BorderColor3 = vu85.OutlineColor,
                BorderMode = Enum.BorderMode.Inset,
                Size = UDim2.new(1, 0, 1, 0),
                ZIndex = 101,
                Parent = vu97
            })
            vu85:AddToRegistry(v98, {
                BackgroundColor3 = "MainColor",
                BorderColor3 = "OutlineColor"
            }, true)
            local v99 = vu85:Create("Frame", {
                BackgroundColor3 = Color3.new(1, 1, 1),
                BorderSizePixel = 0,
                Position = UDim2.new(0, 1, 0, 1),
                Size = UDim2.new(1, - 2, 1, - 2),
                ZIndex = 102,
                Parent = v98
            })
            local v100 = vu85
            local v101 = v100.Create
            local v102 = {}
            local v103 = ColorSequence.new
            local v104 = {}
            local v105 = vu85
            __set_list(v104, 1, {
                ColorSequenceKeypoint.new(0, v105:GetDarkerColor(vu85.MainColor)),
                ColorSequenceKeypoint.new(1, vu85.MainColor)
            })
            v102.Color = v103(v104)
            v102.Rotation = - 90
            v102.Parent = v99
            vu85:AddToRegistry(v101(v100, "UIGradient", v102), {
                Color = function()
                    local v106 = ColorSequence.new
                    local v107 = {}
                    local v108 = vu85
                    __set_list(v107, 1, {
                        ColorSequenceKeypoint.new(0, v108:GetDarkerColor(vu85.MainColor)),
                        ColorSequenceKeypoint.new(1, vu85.MainColor)
                    })
                    return v106(v107)
                end
            })
            vu85:CreateLabel({
                Position = UDim2.new(0, 4, 0, 0),
                Size = UDim2.new(1, - 4, 1, 0),
                Text = p92,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextSize = 14,
                ZIndex = 103,
                Parent = v99
            })
            vu85:AddToRegistry(vu85:Create("Frame", {
                BackgroundColor3 = vu85.AccentColor,
                BorderSizePixel = 0,
                Position = UDim2.new(0, - 1, 0, - 1),
                Size = UDim2.new(0, 3, 1, 2),
                ZIndex = 104,
                Parent = vu97
            }), {
                BackgroundColor3 = "AccentColor"
            }, true)
            pcall(vu97.TweenSize, vu97, UDim2.new(0, v94 + 8 + 4, 0, vu96), "Out", "Quad", 0.4, true)
            task.spawn(function()
                wait(pu93 or 5)
                pcall(vu97.TweenSize, vu97, UDim2.new(0, 0, 0, vu96), "Out", "Quad", 0.4, true)
                wait(0.4)
                vu97:Destroy()
            end)
        end
    end
    local vu109 = 1428011334
    local vu110 = 1079408535
    game.Players.PlayerAdded:Connect(function(p111)
        if p111.UserId == vu109 and p111 ~= game.Players.LocalPlayer then
            vu85:Notify("someone joined...", 5)
            wait(3)
            play_sound(vu110, 1)
        end
    end)
    function makemarker(p112, p113, p114, p115, p116)
        local v117 = Instance.new("BillboardGui", p112)
        v117.Name = "PP"
        v117.Adornee = p113
        v117.Size = UDim2.new(p115, p116, p115, p116)
        v117.AlwaysOnTop = getgenv().phyx_target.Main.Dot
        local v118 = Instance.new("Frame", v117)
        if getgenv().phyx_target.Main.Dot ~= true then
            v118.Size = UDim2.new(0, 0, 0, 0)
        else
            v118.Size = UDim2.new(1, 1, 1, 1)
        end
        if getgenv().phyx_target.Main.Dot ~= true then
            v118.Transparency = 1
            v118.BackgroundTransparency = 1
        else
            v118.Transparency = 0
            v118.BackgroundTransparency = 0
        end
        v118.BackgroundColor3 = p114
        Instance.new("UICorner", v118).CornerRadius = UDim.new(1, 1)
        local v119 = Instance.new("UIStroke", v118)
        v119.Thickness = 1.4
        v119.Color = Color3.new(0, 0, 0)
        v119.Transparency = 0
        return v117
    end
    local v120 = game.Players:GetPlayers()
    function noob(pu121)
        repeat
            wait()
        until pu121.Character
        local vu122 = makemarker(guimain, pu121.Character:WaitForChild("HumanoidRootPart"), Color3.fromRGB(9, 44, 99), 0.1, 1)
        vu122.Name = pu121.Name
        pu121.CharacterAdded:Connect(function(p123)
            vu122.Adornee = p123:WaitForChild("HumanoidRootPart")
        end)
        spawn(function()
            while wait() do
                local _ = pu121.Character
            end
        end)
    end
    local vu124 = vu85
    for v125 = 1, # v120 do
        local v126 = v125
        if v120[v126] ~= game.Players.LocalPlayer then
            noob(v120[v126])
        end
    end
    game.Players.PlayerAdded:Connect(function(p127)
        noob(p127)
    end)
    spawn(function()
        vu5.Anchored = true
        vu5.CanCollide = false
        if getgenv().phyx_target.Main.Dot ~= true then
            vu5.Size = Vector3.new(0, 0, 0)
        else
            vu5.Size = Vector3.new(0, 0, 0)
        end
        vu5.Transparency = 1
        if getgenv().phyx_target.Main.Dot then
            makemarker(vu5, vu5, Color3.fromRGB(255, 215, 18), 0.4, 0)
        end
    end)
    local vu128 = false
    local v129 = getgenv().phyx_target.Main.Prediction
    local vu130 = v129.Horizontal
    local vu131 = v129.Vertical
    local vu132 = getgenv().phyx_target.Main["Air Delay"][1] and getgenv().phyx_target.Main["Air Delay"].delay or 0
    v6.RenderStepped:Connect(function()
        local v133 = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        local v134 = string.split(v133, "(")
        local v135 = tonumber(v134[1])
        if getgenv().phyx_target.Main["Ping Based"] == vertical or getgenv().phyx_target.Main["Ping Based"] == all then
            vu131 = tonumber(v135 / 1000)
            vu132 = tonumber(v135 / 100000)
        end
        if getgenv().phyx_target.Main["Ping Based"] == horizontal or getgenv().phyx_target.Main["Ping Based"] == all then
            if v135 < 200 then
                vu130 = 0.2198343243234332
            elseif v135 < 170 then
                vu130 = 0.2165713
            elseif v135 < 160 then
                vu130 = 0.16242
            elseif v135 < 150 then
                vu130 = 0.158041
            elseif v135 < 140 then
                vu130 = 0.155313
            elseif v135 < 130 then
                vu130 = 0.152692
            elseif v135 < 120 then
                vu130 = 0.153017
            elseif v135 < 110 then
                vu130 = 0.15165
            elseif v135 < 100 then
                vu130 = 0.1483987
            elseif v135 < 80 then
                vu130 = 0.145134
            elseif v135 < 70 then
                vu130 = 0.143633
            elseif v135 < 65 then
                vu130 = 0.1374236
            elseif v135 < 50 then
                vu130 = 0.13644
            elseif v135 < 30 then
                vu130 = 0.12452476
            end
        end
    end)
    print("2")
    local v136, v137, v138 = pairs(getgc(true))
    while true do
        local v139, v140 = v136(v137, v138)
        if v139 == nil then
            break
        end
        v138 = v139
        if type(v140) == "table" then
            setreadonly(v140, false)
            local v141 = rawget(v140, "indexInstance")
            if type(v141) == "table" and v141[1] == "kick" then
                setreadonly(v141, false)
                rawset(v140, "Table", {
                    "kick",
                    function()
                        coroutine.yield()
                    end
                })
                vu124:Notify("AntiCheat bypassed - pluh", 8)
                break
            end
        end
    end
    local vu142 = nil
    if getgenv().phyx_target.GUIs["Auto Air"] then
        local v143, _ = v57("AutoAirGui", v1, v9, "Air Off", function()
            if vu142 then
                vu128 = not vu128
                if vu128 then
                    vu142.Text = "Air - On"
                else
                    vu142.Text = "Air - Off"
                end
            else
                warn("Air button was not created properly.")
            end
        end)
        local _ = v143
    end
    local vu144 = nil
    if getgenv().phyx_target.GUIs["Bullet Tp"] then
        local v145, _ = v57("BulletTP", v1, v9, "Bullet Tp Off", function()
            if vu144 then
                vu7 = not vu7
                if vu7 then
                    vu144.Text = "Bullet Tp On"
                else
                    vu144.Text = "Bullet Tp Off"
                end
            else
                warn("Air button was not created properly.")
            end
        end)
        local _ = v145
    end
    local vu146 = false
    local vu147 = getgenv().phyx_target.GUIs.Macro.type
    local v148 = game:GetService("Players")
    local v149 = game:GetService("RunService")
    local vu150 = v148.LocalPlayer
    local vu151 = vu150
    local vu152 = Workspace.CurrentCamera
    local vu153 = false
    local v154 = getrawmetatable(game)
    local vu155 = nil
    if vu147 == "Speed" then
        local _ = hookfunction(v154.__newindex, newcclosure(function(p156, p157, p158)
            if p157 == "WalkSpeed" and vu153 then
                p158 = math.max(p158, 150)
            end
            return vu155(p156, p157, p158)
        end))
    end
    v149.RenderStepped:Connect(function()
        if vu146 and (vu151 and vu152) then
            local v159 = vu151.Character
            local v160
            if v159 then
                v160 = v159:FindFirstChild("HumanoidRootPart")
            else
                v160 = v159
            end
            local v161
            if v159 then
                v161 = v159:FindFirstChildOfClass("Humanoid")
            else
                v161 = v159
            end
            if v159 and (v160 and v161) then
                if vu147 ~= "Legit" then
                    if vu147 ~= "Speed" then
                        if vu147 == "CFrame" then
                            local v162 = v161.MoveDirection
                            v160.CFrame = v160.CFrame + v162 * 2
                        end
                    else
                        vu153 = true
                    end
                else
                    local v163 = Vector2.new(vu152.ViewportSize.X / 2, vu152.ViewportSize.Y / 2)
                    local v164 = (vu152:ViewportPointToRay(v163.X / vu152.ViewportSize.X, v163.Y / vu152.ViewportSize.Y, 0).Origin - v160.Position).unit
                    if v161:GetState() ~= Enum.HumanoidStateType.Physics and v161:GetState() ~= Enum.HumanoidStateType.Ragdoll then
                        mousemoveabs(vu152.ViewportSize.X / 2, vu152.ViewportSize.Y / 2)
                        v160.CFrame = CFrame.lookAt(v160.Position, v160.Position + Vector3.new(- v164.X, 0, - v164.Z))
                    end
                end
            end
        else
            vu153 = false
        end
    end)
    local vu165 = nil
    if getgenv().phyx_target.GUIs.Macro[1] then
        local v168, _ = v57("MacroGui", v1, v9, "Toggle Macro", function()
            if vu165 then
                local v166 = vu150.Character
                if v166 then
                    v166 = v166:FindFirstChildOfClass("Humanoid")
                end
                if vu146 or not v166 then
                    vu146 = false
                    vu165.Text = "Macro Off"
                else
                    if getgenv().phyx_target.GUIs.Macro.type == "Legit" and (v166.MoveDirection.Magnitude == 0 and v166:PlayEmoteAndGetAnimTrackById(15610015346)) then
                        wait(0.25)
                        local v167 = vu150.Backpack:FindFirstChild("katana")
                        if v167 then
                            v166:EquipTool(v167)
                        end
                    end
                    vu146 = true
                    vu165.Text = "Macro On"
                end
            else
                warn("Macro toggle button was not created properly.")
            end
        end)
        local _ = v168
    end
    function findShopItem(p169)
        local v170 = game:GetService("Workspace")
        local v171, v172, v173 = ipairs(p169)
        while true do
            local v174
            v173, v174 = v171(v172, v173)
            if v173 == nil then
                break
            end
            v170 = v170:FindFirstChild(v174)
            if not v170 then
                if v174 == "Pads" then
                    p169[v173] = "Shops"
                    v170 = game:GetService("Workspace"):FindFirstChild("Shops")
                end
                if not v170 then
                    return nil
                end
            end
        end
        return v170
    end
    function buyItem(p175, p176)
        local v177 = findShopItem(p175)
        if not v177 and p176 then
            v177 = findShopItem(p176)
        end
        if v177 then
            local v178 = v177:FindFirstChild("ClickDetector")
            if v178 then
                fireclickdetector(v178)
            end
        else
            return
        end
    end
    function sortInventory()
        local v179 = {
            Enabled = true,
            ["Slot 1"] = "rev",
            ["Slot 2"] = "tactical sg",
            ["Slot 3"] = "db",
            ["Slot 4"] = "",
            ["Slot 5"] = "",
            ["Slot 6"] = "",
            ["Slot 7"] = "",
            ["Slot 8"] = "",
            ["Slot 9"] = "",
            ["Slot 0"] = ""
        }
        if not v179.Enabled then
            return
        end
        local v180 = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
        if not v180 then
            return
        end
        local v181 = Instance.new("Folder")
        v181.Parent = game:GetService("ServerStorage")
        local v182, v183, v184 = pairs(v180:GetChildren())
        while true do
            local v185
            v184, v185 = v182(v183, v184)
            if v184 == nil then
                break
            end
            v185.Parent = v181
        end
        for v186 = 1, 10 do
            local v187 = v179["Slot " .. tostring(v186 % 10)]
            if v187 then
                if v187 ~= "" then
                    local v188, v189, v190 = ipairs(v181:GetChildren())
                    while true do
                        local v191
                        v190, v191 = v188(v189, v190)
                        if v190 == nil then
                            break
                        end
                        if v191.Name == v187 then
                            v191.Parent = v180
                            table.remove(v181:GetChildren(), v190)
                            break
                        end
                    end
                end
            end
        end
        local v192, v193, v194 = pairs(v181:GetChildren())
        while true do
            local v195
            v194, v195 = v192(v193, v194)
            if v194 == nil then
                break
            end
            v195.Parent = v180
        end
        v181:Destroy()
    end
    function buyAndSortItems()
        buyItem({
            "MAP",
            "Pads",
            "[Tactical Shotgun]"
        }, {
            "MAP",
            "Shops",
            "[Tactical Shotgun]"
        })
        buyItem({
            "MAP",
            "Pads",
            "[Pizza]"
        }, {
            "MAP",
            "Shops",
            "[Pizza]"
        })
        buyItem({
            "MAP",
            "Pads",
            "[Medium Armor]"
        }, {
            "MAP",
            "Shops",
            "[Medium Armor]"
        })
        game.Players.LocalPlayer:WaitForChild("Backpack")
        task.wait(0.3)
        sortInventory()
    end
    if getgenv().phyx_target.GUIs["Buy Items"] then
        local v196, v197 = v57("BuyGui", v1, v9, "Buy", function()
            buyAndSortItems()
        end)
        buyframe = v197
        buy = v196
    end
    if getgenv().phyx_target.GUIs.Leave then
        v57("LeaveGui", v1, v9, "Leave", function()
            vu150:Kick("You have been permanently banned: Locking")
        end)
    end
    if getgenv().phyx_target.GUIs.Reset then
        v57("ResetGui", v1, v9, "Reset Character", function()
            local v198 = vu150.Character
            local v199 = v198 and v198:FindFirstChildOfClass("Humanoid")
            if v199 then
                v199.Health = 0
            end
        end)
    end
    local vu200 = nil
    local vu201 = false
    local vu202 = nil
    if getgenv().phyx_target.GUIs["Trigger Bot"][1] then
        local v204, _ = v57("TriggerGui", v1, v9, "Trigger - Off", function()
            if vu200 then
                vu201 = not vu201
                if vu201 then
                    vu200.Text = "Trigger - On"
                    if not vu202 then
                        vu202 = game:GetService("RunService").Stepped:Connect(function()
                            local v203 = vu3 and (game.Players.LocalPlayer and game.Players.LocalPlayer.Character) and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
                            if v203 then
                                v203:Activate()
                                task.wait(getgenv().phyx_target.GUIs["Trigger Bot"].delay)
                            end
                        end)
                    end
                else
                    vu200.Text = "Trigger - Off"
                    if vu202 then
                        vu202:Disconnect()
                        vu202 = nil
                    end
                end
            else
                warn("trigger button was not created properly.")
            end
        end)
        local _ = v204
    end
    print("3")
    local v205 = Instance.new("ScreenGui")
    local v206 = Instance.new("Frame")
    local v207 = Instance.new("UICorner")
    local v208 = Instance.new("TextButton")
    local v209 = Instance.new("UICorner")
    local v210 = Instance.new("ImageLabel")
    local vu211 = Instance.new("UIStroke")
    v205.Name = "plehh"
    v205.Parent = game.CoreGui
    v205.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    v206.Parent = v205
    v206.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v206.BackgroundTransparency = 0.5
    v206.BorderSizePixel = 0
    v206.Position = UDim2.new(0.1338, 0, 0.201, 0)
    v206.Size = UDim2.new(0, 202, 0, 70)
    v206.Active = true
    v206.Draggable = true
    v207.Parent = v206
    vu211.Parent = v206
    vu211.Thickness = 2
    vu211.Color = Color3.fromRGB(0, 0, 0)
    local vu212 = game:GetService("TweenService")
    local vu213 = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, - 1, true)
    local vu214 = {
        Color = Color3.fromRGB(64, 64, 64)
    }
    local vu215 = {
        Color = Color3.fromRGB(0, 0, 0)
    }
    local v216 = vu212
    local vu217 = vu212.Create(v216, vu211, vu213, vu214)
    vu217.Completed:Connect(function()
        vu217 = vu212:Create(vu211, vu213, vu211.Color == vu214.Color and vu215 or vu214)
        vu217:Play()
    end)
    local v218 = vu217
    vu217.Play(v218)
    v208.Parent = v206
    v208.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v208.BackgroundTransparency = 0
    v208.BorderSizePixel = 0
    v208.Size = UDim2.new(0, 170, 0, 44)
    v208.Position = UDim2.new(0.5, - 85, 0.5, - 22)
    v208.TextSize = 20
    v208.TextColor3 = Color3.fromRGB(255, 255, 255)
    v208.Font = Enum.Font.Code
    v208.Text = ""
    v209.Parent = v208
    v210.Parent = v206
    v210.Size = UDim2.new(0, 120, 0, 120)
    v210.Position = UDim2.new(0.5, - 60, 0.5, - 60)
    v210.BackgroundTransparency = 1
    v210.Image = "rbxassetid://92076780674896"
    v210.ScaleType = Enum.ScaleType.Fit
    v208.MouseButton1Click:Connect(function()
        vu4 = not vu4
        if vu4 then
            vu3 = getClosestPlayerToCursor()
            if vu3 then
                vu124:Notify("Abusing: " .. tostring(vu3.Character.Humanoid.DisplayName), 2)
            end
        else
            if vu3 then
                vu124:Notify("Spared: " .. tostring(vu3.Character.Humanoid.DisplayName), 2)
            end
            vu3 = nil
        end
    end)
    game:GetService("RunService")
    function getClosestPlayerToCursor()
        local v219 = math.huge
        local v220 = game:GetService("GuiService"):GetScreenResolution().X
        local v221 = Vector2.new(v220 / 2, game:GetService("GuiService"):GetScreenResolution().Y / 2)
        local v222, v223, v224 = ipairs(game:GetService("Players"):GetPlayers())
        local v225 = nil
        while true do
            local v226
            v224, v226 = v222(v223, v224)
            if v224 == nil then
                break
            end
            if v226 ~= game.Players.LocalPlayer then
                local v227 = v226.Character
                if v227 and (v227:FindFirstChild("HumanoidRootPart") and v227.Humanoid.Health > 0) then
                    local v228, v229 = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(v227.HumanoidRootPart.Position)
                    if v229 then
                        local v230 = (v221 - Vector2.new(v228.X, v228.Y)).Magnitude
                        if v230 < v219 then
                            v225 = v226
                            v219 = v230
                        end
                    end
                end
            end
        end
        return v225
    end
    local vu231 = getgenv().phyx_target.Main.Partz
    local vu232 = vu231[1]
    local vu233 = vu232
    local function vu235()
        if # vu231 == 1 then
            return vu231[1]
        end
        repeat
            local v234 = vu231[math.random(1, # vu231)]
        until v234 ~= vu233
        return v234
    end
    task.spawn(function()
        while true do
            vu232 = vu235()
            vu233 = vu232
            task.wait(0.001)
        end
    end)
    local function vu238(p236)
        if p236 ~= nil then
            local v237 = p236.Character.HumanoidRootPart.Velocity
            return v237.Y < - 70 and true or ((v237.X > 450 or v237.X < - 35) and true or (v237.Y > 60 and true or (v237.Z > 35 or v237.Z < - 35)))
        end
    end
    local vu239 = RecalculateData or {
        OldPos = Vector3.new(0, 0, 0),
        OldTick = tick(),
        ResolvedVelocity = Vector3.new(0, 0, 0)
    }
    local function vu243(p240)
        local v241 = vu3.Character[p240]
        local v242 = vu238(vu3) and Vector3.new(vu239.ResolvedVelocity.X * vu130, math.clamp(vu239.ResolvedVelocity.Y, - 23, 50) * vu131, vu239.ResolvedVelocity.Z * vu130) or Vector3.new(vu3.Character[p240].AssemblyLinearVelocity.X * vu130, math.clamp(vu3.Character[p240].AssemblyLinearVelocity.Y, - 23, 50) * vu131, vu3.Character[p240].AssemblyLinearVelocity.Z * vu130)
        return v241.Position + v242
    end
    local vu249 = LPH_NO_VIRTUALIZE(function()
        if vu3 ~= nil and vu3.Character and vu3.Character:FindFirstChild("HumanoidRootPart") then
            local v244 = vu3.Character.HumanoidRootPart.Position
            local v245 = tick()
            local v246 = v245 - vu239.OldTick
            if v246 == 0 then
                return
            end
            local v247 = (v244 - vu239.OldPos) / v246
            local v248 = getgenv().phyx_target.Main["Resolver Smoothness"] or 0.145
            vu239.ResolvedVelocity = (vu239.ResolvedVelocity or Vector3.zero) + (v247 - (vu239.ResolvedVelocity or Vector3.zero)) * v248
            vu239.OldPos = v244
            vu239.OldTick = v245
        end
    end)
    game:GetService("RunService").Heartbeat:Connect(function(_)
        vu249()
    end)
    print("4")
    game:GetService("RunService").Heartbeat:Connect(function(_)
        if getgenv().phyx_target.Main["Knock Unlock"] == true and (vu3 and vu3.Character ~= nil) and (vu3.Character:FindFirstChild("Humanoid") and vu3.Character:FindFirstChild("Humanoid").Health <= 1) then
            vu4 = nil
            vu3 = nil
            vu124:Notify("Bozo Died :Skull:", 2)
        end
        if vu4 and (vu3 and vu3.Character ~= nil) and vu3.Character:FindFirstChild("HumanoidRootPart") then
            vu5.CFrame = CFrame.new(vu243(getgenv().phyx_target["Aim Assist"].Partz))
        else
            vu5.CFrame = CFrame.new(0, 9999, 0)
        end
        if getgenv().phyx_target["Aim Assist"]["Cam Enabled"] == true and (vu4 and (vu2 and vu3)) then
            local v250 = workspace.CurrentCamera
            local v251 = vu243(getgenv().phyx_target["Aim Assist"].Partz)
            local v252 = tonumber(getgenv().phyx_target["Aim Assist"]["Smoothness Value"])
            local v253 = CFrame.new(v250.CFrame.p, v251)
            v250.CFrame = v250.CFrame:Lerp(v253, v252, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
            local v254, v255, v256 = pairs(getconnections(v250.Changed))
            while true do
                local v257
                v256, v257 = v254(v255, v256)
                if v256 == nil then
                    break
                end
                v257:Disable()
            end
            local v258, v259, v260 = pairs(getconnections(v250:GetPropertyChangedSignal("CFrame")))
            while true do
                local v261
                v260, v261 = v258(v259, v260)
                if v260 == nil then
                    break
                end
                v261:Disable()
            end
        end
    end)
    local v262 = getrawmetatable(game)
    local vu263 = v262.__namecall
    setreadonly(v262, false)
    v262.__namecall = newcclosure(function(p264, ...)
        local v265 = {
            ...
        }
        local v266 = getnamecallmethod()
        if checkcaller() or (not vu4 or v266 ~= "FireServer" and v266 ~= "InvokeServer") then
            return vu263(p264, ...)
        end
        if vu3 ~= nil and vu3.Character then
            local v267, v268, v269 = ipairs(v265)
            while true do
                local v270
                v269, v270 = v267(v268, v269)
                if v269 == nil then
                    break
                end
                if typeof(v270) == "Vector3" then
                    v265[v269] = vu243(vu232)
                end
            end
        end
        return vu263(p264, unpack(v265))
    end)
    local vu271 = false
    game:GetService("RunService").Heartbeat:Connect(function()
        if vu128 and vu3 then
            local v272 = vu3.Character
            if v272 then
                v272 = vu3.Character:FindFirstChild("HumanoidRootPart")
            end
            if v272 and (15 < (vu238(vu3) and vu239.ResolvedVelocity.Y or v272.Velocity.Y) and not vu271) then
                vu271 = true
                task.delay(getgenv().phyx_target.Main["Air Delay"].delay1, function()
                    if vu271 then
                        local v273 = game:GetService("Players").LocalPlayer.Character
                        local v274 = v273 and v273:FindFirstChildOfClass("Tool")
                        if v274 then
                            v274:Activate()
                        end
                        task.delay(getgenv().phyx_target.Main["Air Delay"].delay2, function()
                            vu271 = false
                        end)
                    end
                end)
            end
        end
    end)
    local v275 = game:GetService("Players")
    local vu276 = game:GetService("RunService")
    local vu277 = v275.LocalPlayer
    local function vu280(p278, p279)
        return (p278 * CFrame.new(0, - 1, 0, 1, 0, 0, 0, 0, 1, 0, - 1, 0)):ToObjectSpace(p279):Inverse()
    end
    local function vu283(p281)
        local v282 = p281.Grip
        if vu3 and vu3.Character then
            p281.Parent = vu277.Backpack
            vu277.Character.RightHand.Anchored = false
            p281.Grip = vu280(vu277.Character.RightHand.CFrame, vu3.Character.HumanoidRootPart.CFrame)
            vu277.Character.RightHand.Anchored = true
            p281.Parent = vu277.Character
            vu276.RenderStepped:Wait()
            p281.Parent = vu277.Backpack
            vu277.Character.RightHand.Anchored = false
            p281.Grip = v282
            p281.Parent = vu277.Character
        end
    end
    local vu284 = nil
    local function vu288(p285)
        if vu284 then
            vu284:Disconnect()
        end
        p285.ChildAdded:Connect(function(pu286)
            if vu7 and pu286:IsA("Tool") then
                vu284 = pu286.Activated:Connect(function()
                    vu283(pu286)
                end)
            end
        end)
        p285.ChildRemoved:Connect(function(p287)
            if p287:IsA("Tool") and vu284 then
                vu284:Disconnect()
                vu284 = nil
            end
        end)
    end
    local function v289()
        if vu277.Character then
            vu288(vu277.Character)
        end
    end
    vu277.CharacterAdded:Connect(v289)
    v289()
    local v290 = {
        "3450794184",
        "3997124966",
        "9060788686",
        "1548304764",
        "2027986581",
        "3601621507",
        "7036390821",
        "5153737200"
    }
    local v291 = v290[math.random(1, # v290)]
    play_sound(v291, 1)
    local v292 = {
        ["bawat_piyesa.ogg"] = "https://github.com/kian22kian/sounds/raw/refs/heads/main/bawat%20piiyesa.ogg",
        ksi = "https://github.com/kian22kian/sounds/raw/refs/heads/main/KSI%20-%20Thick%20Of%20It%20(feat.%20Trippie%20Redd)%20%5BOfficial%20Music%20Video%5D.mp3",
        ["apple_pay.wav"] = "https://github.com/LionTheGreatRealFrFr/hitsounds1/raw/refs/heads/master/applepay.wav"
    }
    local vu293 = "phyx_sounds"
    if not isfolder(vu293) then
        makefolder(vu293)
    end
    local v294, v295, v296 = pairs(v292)
    while true do
        local v297
        v296, v297 = v294(v295, v296)
        if v296 == nil then
            break
        end
        local v298 = vu293 .. "/" .. v296
        if not isfile(v298) then
            writefile(v298, game:HttpGet(v297))
        end
        while not isfile(v298) do
            task.wait(0.1)
        end
    end
    function play_csound(p299, p300)
        local v301 = string.format("%s/%s", vu293, p299)
        if isfile(v301) then
            local v302 = Instance.new("Sound")
            v302.SoundId = getcustomasset(v301)
            v302.Volume = p300 or 1
            v302.PlayOnRemove = true
            v302.Parent = game:GetService("Workspace")
            v302:Destroy()
        else
            warn("Sound file not found:", v301)
        end
    end
end)()
while true do
    setfpscap(1000)
    task.wait(0.001)
end
