--[[
 /$$$$$$$                      /$$                 /$$$$$$$$                               
| $$__  $$                    |__/                |__  $$__/                               
| $$  \ $$  /$$$$$$   /$$$$$$$ /$$  /$$$$$$          | $$  /$$$$$$   /$$$$$$  /$$$$$$/$$$$ 
| $$$$$$$/ /$$__  $$ /$$_____/| $$ /$$__  $$         | $$ /$$__  $$ |____  $$| $$_  $$_  $$
| $$__  $$| $$  \ $$|  $$$$$$ | $$| $$$$$$$$         | $$| $$$$$$$$  /$$$$$$$| $$ \ $$ \ $$
| $$  \ $$| $$  | $$ \____  $$| $$| $$_____/         | $$| $$_____/ /$$__  $$| $$ | $$ | $$
| $$  | $$|  $$$$$$/ /$$$$$$$/| $$|  $$$$$$$         | $$|  $$$$$$$|  $$$$$$$| $$ | $$ | $$
|__/  |__/ \______/ |_______/ |__/ \_______/         |__/ \_______/ \_______/|__/ |__/ |__/     

[+] Rosie Team Cảm Ơn Bạn Đã Tin Tưởng Và Sử Dụng Dịch Vụ Của Chúng Tôi, Nếu Thấy Hữu Ít Hãy Chia Sẻ Cho Bạn Bè Của Bạn !!
[+] Không Được Share Hay Crack Mã Nguồn Này Cho Ai! Nếu Không Bạn Sẽ Bị Ban IP Khỏi Website Vĩnh Viễn!
[+] Chúng Tôi Không Nhận Hỗ Trợ Những Mã Nguồn Miễn Phí, Xin Đừng Bảo Vì Sao. Tạo Ticket Hỗ Trợ Của Website Tại: https://rosieteam.net/dash/ticket
[+]  Nếu Bạn Edit Source Và Up Web Share Nhớ Obfuscate Script. Nếu Bạn Có Tiền Thì Sử Dụng: Lura.Ph, Luarmor.Net | Nếu Bạn Không Có Tiền Thì Dùng: luaobfuscate.com, MoonSec, 77Fuscate,... Nhé!
]]

local luxurylibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/SixZensED/Scripts/main/Luxury%20V2/Library.lua"))()
--

repeat task.wait() until game:IsLoaded()

local close_button = function()
	if game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("luxury_close") then
		game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("luxury_close"):Destroy()
	end

	local luxury_close = Instance.new("ScreenGui")
	local close_button = Instance.new("ImageButton")
	local UICorner = Instance.new("UICorner")

	luxury_close.Name = "luxury_close"
	luxury_close.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	luxury_close.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	luxury_close.ResetOnSpawn = false

	close_button.Name = "close_button"
	close_button.Parent = luxury_close
	close_button.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
	close_button.BackgroundTransparency = 0.100
	close_button.BorderColor3 = Color3.fromRGB(0, 0, 0)
	close_button.BorderSizePixel = 0
	close_button.Position = UDim2.new(0.0559845567, 0, 0.198529407, 0)
	close_button.Size = UDim2.new(0, 45, 0, 45)
	close_button.AutoButtonColor = false
	close_button.Image = "rbxassetid://16124510195"

	UICorner.Parent = close_button

	local close = true
	close_button.MouseButton1Down:Connect(function()
		if not close then
			for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
				if string.find(v.Name,"xova") then
					v.Enabled = true
				end
			end
		else
			for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
				if string.find(v.Name,"xova") then
					v.Enabled = false
				end
			end
		end
		close = not close
	end)
end

do
	close_button()
end

local getnoclip = function(boolen,options)
	if boolen then
		if setfflag then
			setfflag("HumanoidParallelRemoveNoPhysics", "False")
			setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
		end
		if options.Method == "Gyro" then
			if syn then
				game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid"):ChangeState(11)
			else
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Gyro") then
					game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Gyro"):Destroy()
				end
				local Gyro = Instance.new("BodyVelocity",game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"))
				Gyro.Velocity = Vector3.new(0,0,0)
				Gyro.MaxForce = Vector3.new(1000000, 1000000, 1000000)
				Gyro.Name = "Gyro"
				for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = false    
					end
				end
			end
		end
	else
		if syn then
			game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid"):ChangeState(11)
		else
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Gyro") then
				game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Gyro"):Destroy()
			end
		end
	end
end

local tp = function(boolen,options)
	if boolen then
		if options.Method == "tween" then
			local callback = options.callback or function() end
			local tween_s = game:GetService("TweenService")
			local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - options.GetCFrame.Position).Magnitude/1000, Enum.EasingStyle.Linear)
			tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = options.GetCFrame})
			tween:Play()
			tween.Completed:Connect(function(v)
				if v == Enum.PlaybackState.Completed then
					callback(v)
					tween:Cancel()
				end
			end)

			local totargetFunction = {}

			function totargetFunction:Stop()
				tween:Cancel()
			end

			return totargetFunction
		elseif options.Method == "tp" then
			game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = options.GetCFrame
		end
	end
end

for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do 
	v:Disable()
end

getfenv().temp = true
local screen = luxurylibrary.create(true)
local main = screen.createmain()

luxurylibrary.notification({Title = "Loaded Successfully.",Desc = "Thank you for purchase.",Type = 1})
local t = tick()
luxurylibrary.notification({Title = "Script Loaded In : "..tick() - t.." s",Desc = "if script bug please send to me problem SixZens",Type = 1})

local item = main.item({Title = "Automatic",Desc = "have automatic farm level max and more function"})
local item2 = main.item({Title = "Teleports",Desc = "teleport island or other place"})
local section = item.section({Type = 1})
local section2 = item.section({Type = 3})
local section3 = item.section({Type = 1})
local section4 = item.section({Type = 3})
local section5 = item.section({Type = 2})
local section6 = item.section({Type = 1})
local section7 = item.section({Type = 2})
local section8 = item.section({Type = 1})
local section9 = item2.section({Type = 1})
local section10 = item.section({Type = 2})
local section11 = item.section({Type = 2})

local checklevel = function()
	local questlist = {}
	local quest_required = require(game:GetService("ReplicatedStorage").Chest.Modules.QuestManager)
	local name_mob,boss = nil,false
	for index , value in pairs(game:GetService("Workspace").AllNPC:GetChildren()) do
		if string.find(value.Name,"QuestLvl") then
			local sublevel = string.match(value.Name,"%d+")
			if game:GetService("Players").LocalPlayer.PlayerStats.lvl.Value >= 1 and game:GetService("Players").LocalPlayer.PlayerStats.lvl.Value <= 9 then
				table.insert(questlist,0)
			elseif tonumber(sublevel) <= tonumber(game:GetService("Players").LocalPlayer.PlayerStats.lvl.Value) then
				table.insert(questlist,sublevel)
			end
		end
	end
	questlevel = math.max(unpack(questlist))
	if game:GetService("Players").LocalPlayer.CurrentQuest.Value ~= "" then
		name_mob = quest_required[game:GetService("Players").LocalPlayer.CurrentQuest.Value].Mob
		if quest_required[game:GetService("Players").LocalPlayer.CurrentQuest.Value].Ammount == 1 then
			boss = true
		end
	else
		name_mob = ""
	end
	return{["QuestLvl"] = "QuestLvl"..questlevel,["Mob"] = name_mob,["CheckBoss"] = boss}
end

local getquest = function(args,args2 : boolean)
	tp(true,{Method = "tp",GetCFrame = game:GetService("Workspace").AllNPC[args].CFrame * CFrame.new(0,0,-2)})
	getnoclip(true,{Method = "Gyro"})
	if args2 then
		task.wait()
		game:GetService("ReplicatedStorage").Chest.Remotes.Functions.CheckQuest:InvokeServer(game:GetService("Workspace").AllNPC:FindFirstChild(args))
		task.spawn(function()
			xpcall(function()
				for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetDescendants()) do
					if v:FindFirstChild('Dialogue') then
						v.Dialogue.Accept.Size = UDim2.new(1000,1000,1000,1000)
						v.Dialogue.Accept.Position = UDim2.new(0,-550,0,-550)
						v.Dialogue.Accept.BackgroundTransparency = 1
						v.Dialogue.Accept.ImageTransparency = 1

						game:GetService('VirtualUser'):CaptureController()
						game:GetService('VirtualUser'):ClickButton1(Vector2.new(0,0))
					end
				end
			end,function() end)
		end)
	end
end

local close_quest = function()
	task.spawn(function()
		xpcall(function()
			game:GetService("Players").LocalPlayer.PlayerGui.MainGui.StarterFrame.LocalScript.CancelQuestRemote:FireServer()
		end,function() end)
	end)
end

local attack = function(args)
	if select_weapon == nil or args == nil then
		luxurylibrary.notification({Title = "Notification",Desc = "Please Select Weapon First",Type = 2})
	else
		task.spawn(function()
			game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(args))
			for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
				if v:IsA("Tool") then
					if v.ToolTip == "Combat" then
						game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer("FS_"..v.Name.."_M1")
					elseif v.ToolTip == "Sword" then
						game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer("SW_"..v.Name.."_M1")
					end
				end
			end
			for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
				if v:IsA("Tool") then
					if v.ToolTip == "Combat" then
						game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer("FS_"..v.Name.."_M1")
					elseif v.ToolTip == "Sword" then
						game:GetService("ReplicatedStorage").Chest.Remotes.Functions.SkillAction:InvokeServer("SW_"..v.Name.."_M1")
					end
				end
			end
		end)
	end
end

local skill = function()
	task.spawn(function()
		if auto_farm_level or auto_second_sea or auto_farm_select or auto_saber or auto_event_chest or auto_material_select or auto_authentic_mace or auto_jitter
			or auto_pole or auto_bisento or auto_muramasa or auto_mom_blade or auto_anubis_axe or auto_shark_blade or auto_tachi_blade or auto_adventure_knife
		then
			for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
				if v:IsA("Tool") then
					if v.ToolTip == "Combat" then
						List = "FSFrame"
					elseif v.ToolTip == "Sword" then
						List = "SWFrame"
					elseif v.ToolTip == "Fruit Power" then
						List = "DFFrame"
					end
					for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
						if v.Name == "SkillCooldown" then
							for i,v in pairs(v:GetChildren()) do
								if v.Name == List then
									for i,v in pairs(v:GetChildren()) do
										if v:IsA("Frame") and v.Name ~= "Power" then
											if not v:FindFirstChild("Locked").Visible then
												if auto_skill then
													game:GetService("VirtualInputManager"):SendKeyEvent(true,v.Name,false,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart)
													wait()
													game:GetService("VirtualInputManager"):SendKeyEvent(false,v.Name,false,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart)
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end)
end



local get_haki = function()
	task.spawn(function()
		if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Services"):FindFirstChild("Haki").Value == 0 then
			game:GetService("ReplicatedStorage").Chest.Remotes.Events.Armament:FireServer()
		end
		game:GetService("ReplicatedStorage").Chest.Remotes.Functions.KenEvent:InvokeServer()
	end)
end

local getconnect = function(v2)
	for i ,v in pairs(getconnections(v2)) do 
		pcall(function()
			v.Function()
		end)
	end
end

local check_sea = function()
	if game:GetService("Players").LocalPlayer.PlayerStats.IsSecondSea.Value == "No" then
		return 1
	else
		return 2
	end
end

local check_sea_progress = function()
	if game:GetService("Players").LocalPlayer.PlayerStats.SecondSeaProgression.Value == "No" then
		return 1
	else
		return 2
	end
end

local check_thirdsea = function()
	if string.find(game:GetService("Players").Starlizard09.PlayerStats.Misc.Value,"ThirdSea") then
		return true
	else
		return false
	end
end

local check_fighting = function(args)
	if string.find(game:GetService("Players").LocalPlayer.PlayerStats.Bought.Value,args) then
		return true
	else
		return false
	end
end

local check_material = function(args)
	if string.find(game:GetService("Players").LocalPlayer.PlayerStats.Material.Value,args) then
		return true
	else
		return false
	end
end

local check_count_material = function(args)
	local itemQuantities = game.HttpService:JSONDecode(game:GetService("Players").LocalPlayer.PlayerStats.Material.Value)
	for itemName, quantity in pairs(itemQuantities) do
		if string.find(itemName,args) then
			return quantity
		end
	end
end

local check_train_skill = function(args)
	if args == "Buso" then
		if game:GetService("Players").LocalPlayer.PlayerStats.BusoShopValue.Value ~= "None" then
			return true
		else
			return false
		end
	elseif args == "Soru" then
		if game:GetService("Players").LocalPlayer.PlayerStats.Soru.Value ~= "None" then
			return true
		else
			return false
		end  
	elseif args == "Ken" then
		if game:GetService("Players").LocalPlayer.PlayerStats.KenShopValue.Value ~= "None" then
			return true
		else
			return false
		end
 	end
end

local method_farm = function(args,args2)
	if args == "Above" then
		tp(true,{Method = "tween",GetCFrame = args2:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0,distance_farming,0) * CFrame.Angles(math.rad(-90),0,0),callback = function(v)
			attack(select_weapon)
			get_haki()
			skill()
			--
			args2:FindFirstChild("Humanoid").WalkSpeed = 0
		end,})
	elseif args == "Behind" then
		tp(true,{Method = "tween",GetCFrame = args2:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0,0,distance_farming),callback = function(v)
			attack(select_weapon)
			get_haki()
			skill()
			--
			args2:FindFirstChild("Humanoid").WalkSpeed = 0
		end,})
	elseif args == "Below" then
		tp(true,{Method = "tween",GetCFrame = args2:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0,-distance_farming,0) * CFrame.Angles(math.rad(90),0,0),callback = function(v)
			attack(select_weapon)
			get_haki()
			skill()
			--
			args2:FindFirstChild("Humanoid").WalkSpeed = 0
		end,})
	end
end

local check_sword = function(args)
	if game:GetService("Players").LocalPlayer.Inventory:FindFirstChild(args) then
		return true
	else
		return false
	end
end

section.input("Label",{Title = '<font color="rgb(170, 170, 127)">Auto Farm</font>'})

section.input("Toggle",{Title = "Auto Farm Level",default = false,callback = function(value)
	auto_farm_level = value
	if not auto_farm_level then
		getnoclip(false,{Method = "Gyro"})
	end
	task.spawn(function()
		while task.wait() do
			if auto_farm_level and auto_second_sea then
				xpcall(function()
					if auto_second_sea and game:GetService("Players").LocalPlayer.PlayerStats.lvl.Value >= 2250 then
						if check_sea() == 1 and check_sea_progress() == 1 then
							if game:GetService("Players").LocalPlayer.CurrentQuest.Value ~= "Second Sea Map" then
								getquest(workspace.AllNPC.Traveler.Name,true)
							elseif game:GetService("Players").LocalPlayer.CurrentQuest.Value == "Second Sea Map" then
								if not check_material("Map") then
									for i,v in pairs(workspace.Monster.Boss:GetChildren()) do
										if v.Name == "Seasoned Fishman [Lv. 2200]" and v:FindFirstChild("Humanoid").Health > 1 and v:FindFirstChild("HumanoidRootPart") then
											repeat task.wait()
												getnoclip(true,{Method = "Gyro"})
												if (v:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
													tp(true,{Method = "tp",GetCFrame = CFrame.new(-1809.34412, 107.717552, 6537.37891, 0.963350534, 1.10248317e-08, -0.268245608, 3.99932132e-09, 1, 5.54625288e-08, 0.268245608, -5.45026602e-08, 0.963350534)})
												else
													method_farm(select_method_farm,v)
												end
											until not auto_second_sea or v:FindFirstChild("Humanoid").Health <= 0 or not v:FindFirstChild("HumanoidRootPart")
											tp(true,{Method = "tp",GetCFrame = CFrame.new(-1809.34412, 107.717552, 6537.37891, 0.963350534, 1.10248317e-08, -0.268245608, 3.99932132e-09, 1, 5.54625288e-08, 0.268245608, -5.45026602e-08, 0.963350534)})
										else
											tp(true,{Method = "tp",GetCFrame = CFrame.new(-1809.34412, 107.717552, 6537.37891, 0.963350534, 1.10248317e-08, -0.268245608, 3.99932132e-09, 1, 5.54625288e-08, 0.268245608, -5.45026602e-08, 0.963350534)})
										end
									end
								else
									getquest(workspace.AllNPC.Traveler.Name,true)
								end
							end
						elseif check_sea_progress() == 2 then
							getquest(workspace.AllNPC["Elite Pirate"].Name,true)
						end
					else
						task.spawn(function()
							local questtext = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.QuestCount.Text
							if game:GetService("Players").LocalPlayer.CurrentQuest.Value == "" then
								return
							else
								if tonumber(string.match(questtext, "%[Lv%. (%d+)%]")) < tonumber(string.match(checklevel()["QuestLvl"], "%d+")) then
									close_quest()
								end
							end
						end)
						if game:GetService("Players").LocalPlayer.CurrentQuest.Value == "" then
							getquest(checklevel()["QuestLvl"],true)
						else
							if checklevel()['Mob'] ~= "" then
								xpcall(function()
									if checklevel()['CheckBoss'] == true then
										FolderMob = game:GetService("Workspace").Monster.Boss
									else
										FolderMob = game:GetService("Workspace").Monster.Mon
									end
									for index , value in pairs(FolderMob:GetChildren()) do
										if value.Name == checklevel()['Mob'] and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
											repeat task.wait()
												getnoclip(true,{Method = "Gyro"})
												if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
													getquest(checklevel()["QuestLvl"],false)
												else
													method_farm(select_method_farm,value)
												end
											until not auto_farm_level or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
											getnoclip(false,{Method = "Gyro"})
										else
											getquest(checklevel()["QuestLvl"],false)
										end
									end
								end,function() end)
							end
						end
					end
				end,function() end)
			elseif auto_farm_level and not auto_second_sea then
				xpcall(function()
					if checklevel()["QuestLvl"] == "QuestLvl3350" then
						local mob_level = tonumber(string.match("Azlan [Lv. 3300]", "%[Lv%. (%d+)%]"))
						local quest_level = "QuestLvl"..mob_level
						task.spawn(function()
							local questtext = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.QuestCount.Text
							if game:GetService("Players").LocalPlayer.CurrentQuest.Value == "" then
								return
							else
								if tonumber(string.match(questtext, "%[Lv%. (%d+)%]")) ~= tonumber(mob_level) then
									close_quest()
								end
							end
						end)
						if game:GetService("Players").LocalPlayer.CurrentQuest.Value == "" then
							getquest(quest_level,true)
						else
							for index , value in pairs(game:GetService("Workspace").Monster.Mon:GetChildren()) do
								if value.Name == "Azlan [Lv. 3300]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
									repeat task.wait()
										getnoclip(true,{Method = "Gyro"})
										if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
											tp(true,{Method = "tp", GetCFrame = game:GetService("Workspace").AllNPC[quest_level].CFrame * CFrame.new(0,0,-2)})
										else
											method_farm(select_method_farm,value)
										end
									until not auto_farm_level or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
									getnoclip(false,{Method = "Gyro"})
								else
									tp(true,{Method = "tp", GetCFrame = game:GetService("Workspace").AllNPC[quest_level].CFrame * CFrame.new(0,0,-2)})
								end
							end
						end
					elseif checklevel()["QuestLvl"] == "QuestLvl3375" then
						local mob_level = tonumber(string.match("The Volcano [Lv. 3325]", "%[Lv%. (%d+)%]"))
						local quest_level = "QuestLvl"..mob_level
						task.spawn(function()
							local questtext = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.QuestCount.Text
							if game:GetService("Players").LocalPlayer.CurrentQuest.Value == "" then
								return
							else
								if tonumber(string.match(questtext, "%[Lv%. (%d+)%]")) ~= tonumber(mob_level) then
									close_quest()
								end
							end
						end)
						if game:GetService("Players").LocalPlayer.CurrentQuest.Value == "" then
							getquest(quest_level,true)
						else
							for index , value in pairs(game:GetService("Workspace").Monster.Mon:GetChildren()) do
								if value.Name == "The Volcano [Lv. 3325]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
									repeat task.wait()
										getnoclip(true,{Method = "Gyro"})
										if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
											tp(true,{Method = "tp", GetCFrame = CFrame.new(83.33702850341797, 131.7090301513672, -3585.72216796875)})
										else
											method_farm(select_method_farm,value)
										end
									until not auto_farm_level or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
									getnoclip(false,{Method = "Gyro"})
								else
									tp(true,{Method = "tp", GetCFrame = game:GetService("Workspace").AllNPC[quest_level].CFrame * CFrame.new(0,0,-2)})
								end
							end
						end
					elseif checklevel()["QuestLvl"] == "QuestLvl3475" then
						local mob_level = tonumber(string.match("Sally [Lv. 3450]", "%[Lv%. (%d+)%]"))
						local quest_level = "QuestLvl"..mob_level
						task.spawn(function()
							local questtext = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.QuestCount.Text
							if game:GetService("Players").LocalPlayer.CurrentQuest.Value == "" then
								return
							else
								if tonumber(string.match(questtext, "%[Lv%. (%d+)%]")) ~= tonumber(mob_level) then
									close_quest()
								end
							end
						end)
						if game:GetService("Players").LocalPlayer.CurrentQuest.Value == "" then
							getquest(quest_level,true)
						else
							for index , value in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
								if value.Name == "Sally [Lv. 3450]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
									repeat task.wait()
										getnoclip(true,{Method = "Gyro"})
										if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
											tp(true,{Method = "tp", GetCFrame = CFrame.new(-9598.5361328125, 59.37502670288086, -5271.25244140625)})
										else
											method_farm(select_method_farm,value)
										end
									until not auto_farm_level or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
									getnoclip(false,{Method = "Gyro"})
								else
									tp(true,{Method = "tp", GetCFrame = game:GetService("Workspace").AllNPC[quest_level].CFrame * CFrame.new(0,0,-2)})
								end
							end
						end
					elseif checklevel()["QuestLvl"] == "QuestLvl3575" then
						local mob_level = tonumber(string.match("Hefty [Lv. 3550]", "%[Lv%. (%d+)%]"))
						local quest_level = "QuestLvl"..mob_level
						task.spawn(function()
							local questtext = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.QuestCount.Text
							if game:GetService("Players").LocalPlayer.CurrentQuest.Value == "" then
								return
							else
								if tonumber(string.match(questtext, "%[Lv%. (%d+)%]")) ~= tonumber(mob_level) then
									close_quest()
								end
							end
						end)
						if game:GetService("Players").LocalPlayer.CurrentQuest.Value == "" then
							getquest(quest_level,true)
						else
							for index , value in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
								if value.Name == "Hefty [Lv. 3550]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
									repeat task.wait()
										getnoclip(true,{Method = "Gyro"})
										if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
											tp(true,{Method = "tp", GetCFrame = CFrame.new(-9598.5361328125, 59.37502670288086, -5271.25244140625)})
										else
											method_farm(select_method_farm,value)
										end
									until not auto_farm_level or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
									getnoclip(false,{Method = "Gyro"})
								else
									tp(true,{Method = "tp", GetCFrame = game:GetService("Workspace").AllNPC[quest_level].CFrame * CFrame.new(0,0,-2)})
								end
							end
						end
					elseif checklevel()["QuestLvl"] == "QuestLvl3650" then
						local mob_level = tonumber(string.match("Hefty [Lv. 3550]", "%[Lv%. (%d+)%]"))
						local quest_level = "QuestLvl"..mob_level
						task.spawn(function()
							local questtext = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.QuestCount.Text
							if game:GetService("Players").LocalPlayer.CurrentQuest.Value == "" then
								return
							else
								if tonumber(string.match(questtext, "%[Lv%. (%d+)%]")) ~= tonumber(mob_level) then
									close_quest()
								end
							end
						end)
						if game:GetService("Players").LocalPlayer.CurrentQuest.Value == "" then
							getquest(quest_level,true)
						else
							for index , value in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
								if value.Name == "Hefty [Lv. 3550]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
									repeat task.wait()
										getnoclip(true,{Method = "Gyro"})
										if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
											tp(true,{Method = "tp", GetCFrame = CFrame.new(-9598.5361328125, 59.37502670288086, -5271.25244140625)})
										else
											method_farm(select_method_farm,value)
										end
									until not auto_farm_level or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
									getnoclip(false,{Method = "Gyro"})
								else
									tp(true,{Method = "tp", GetCFrame = game:GetService("Workspace").AllNPC[quest_level].CFrame * CFrame.new(0,0,-2)})
								end
							end
						end
					else
						task.spawn(function()
							local questtext = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.QuestCount.Text
							if game:GetService("Players").LocalPlayer.CurrentQuest.Value == "" then
								return
							else
								if tonumber(string.match(questtext, "%[Lv%. (%d+)%]")) < tonumber(string.match(checklevel()["QuestLvl"], "%d+")) then
									close_quest()
								end
							end
						end)

						if game:GetService("Players").LocalPlayer.CurrentQuest.Value == "" then
							getquest(checklevel()["QuestLvl"],true)
						else
							if checklevel()['Mob'] ~= "" then
								xpcall(function()
									if checklevel()['CheckBoss'] == true then
										FolderMob = game:GetService("Workspace").Monster.Boss
									else
										FolderMob = game:GetService("Workspace").Monster.Mon
									end
									for index , value in pairs(FolderMob:GetChildren()) do
										if value.Name == checklevel()['Mob'] and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
											repeat task.wait()
												getnoclip(true,{Method = "Gyro"})
												if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
													if checklevel()['Mob'] == "Dough Master [Lv. 3275]" then
														tp(true,{Method = "tp" ,GetCFrame = CFrame.new(30282.763671875, 65.45161437988281, 93195.375)})
													elseif checklevel()['Mob'] == "Supreme Swordman [Lv. 3425]" then
														tp(true,{Method = "tp",GetCFrame = CFrame.new(-9682.1376953125, 59.34377670288086, -4557.251953125)})
													elseif checklevel()['Mob'] == "Vice Admiral [Lv. 3500]" then
														tp(true,{Method = "tp",GetCFrame = CFrame.new(-10130.1064453125, 37.73771286010742, 322.48822021484375)})
													elseif checklevel()['Mob'] == "Prince Aria [Lv. 3700]" then
														tp(true,{Method = "tp",GetCFrame = CFrame.new(6859.6669921875, 150.06887817382812, -3715.262451171875)})
													elseif checklevel()['Mob'] == "Devastate [Lv. 3725]" then
														tp(true,{Method = "tp",GetCFrame = CFrame.new(7425.17529296875, 81.5720443725586, -2543.26416015625)})
													else
														getquest(checklevel()["QuestLvl"],false)
													end
												else
													method_farm(select_method_farm,value)
												end
											until not auto_farm_level or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
											getnoclip(false,{Method = "Gyro"})
										else
											if checklevel()['Mob'] == "Dough Master [Lv. 3275]" then
												tp(true,{Method = "tp" ,GetCFrame = CFrame.new(30282.763671875, 65.45161437988281, 93195.375)})
											elseif checklevel()['Mob'] == "Supreme Swordman [Lv. 3425]" then
												tp(true,{Method = "tp",GetCFrame = CFrame.new(-9682.1376953125, 59.34377670288086, -4557.251953125)})
											elseif checklevel()['Mob'] == "Vice Admiral [Lv. 3500]" then
												tp(true,{Method = "tp",GetCFrame = CFrame.new(-10130.1064453125, 37.73771286010742, 322.48822021484375)})
											elseif checklevel()['Mob'] == "Prince Aria [Lv. 3700]" then
												tp(true,{Method = "tp",GetCFrame = CFrame.new(6859.6669921875, 150.06887817382812, -3715.262451171875)})
											elseif checklevel()['Mob'] == "Devastate [Lv. 3725]" then
												tp(true,{Method = "tp",GetCFrame = CFrame.new(7425.17529296875, 81.5720443725586, -2543.26416015625)})
											else
												getquest(checklevel()["QuestLvl"],false)
											end
										end
									end
								end,function() end)
							end
						end
					end
				end,function() end)
			end
		end
	end)
end,})
local function a(b)local c='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'local d={}for e=1,#c do d[c:sub(e,e)]=e-1 end;local f=string.sub(b,-2)=='=='and 2 or string.sub(b,-1)=='='and 1 or 0;local g={}for e=1,#b-f,4 do local h,i,j,k=string.byte(b,e,e+3)local l=d[string.char(h)]*262144+d[string.char(i)]*4096+d[string.char(j)]*64+d[string.char(k)]table.insert(g,string.char(l/65536))table.insert(g,string.char(l/256%256))table.insert(g,string.char(l%256))end;for e=1,f do table.remove(g)end;return table.concat(g)end;local m="Q2jDoG8gTeG7q25nIELhuqFuIMSQw6MgxJDhur9uDQogICAgICAgICAgICAgICAvJCQkJCQkJCAgICAgICAgICAgICAgICAgICAgICAvJCQgICAgICAgICAgICAgICAgIC8kJCQkJCQkJCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCiAgICAgICAgICAgICAgfCAkJF9fICAkJCAgICAgICAgICAgICAgICAgICAgfF9fLyAgICAgICAgICAgICAgICB8X18gICQkX18vICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KICAgICAgICAgICAgICB8ICQkICBcICQkICAvJCQkJCQkICAgLyQkJCQkJCQgLyQkICAvJCQkJCQkICAgICAgICAgIHwgJCQgIC8kJCQkJCQgICAvJCQkJCQkICAvJCQkJCQkLyQkJCQgDQogICAgICAgICAgICAgIHwgJCQkJCQkJC8gLyQkX18gICQkIC8kJF9fX19fL3wgJCQgLyQkX18gICQkICAgICAgICAgfCAkJCAvJCRfXyAgJCQgfF9fX18gICQkfCAkJF8gICQkXyAgJCQNCiAgICAgICAgICAgICAgfCAkJF9fICAkJHwgJCQgIFwgJCR8ICAkJCQkJCQgfCAkJHwgJCQkJCQkJCQgICAgICAgICB8ICQkfCAkJCQkJCQkJCAgLyQkJCQkJCR8ICQkIFwgJCQgXCAkJA0KICAgICAgICAgICAgICB8ICQkICBcICQkfCAkJCAgfCAkJCBcX19fXyAgJCR8ICQkfCAkJF9fX19fLyAgICAgICAgIHwgJCR8ICQkX19fX18vIC8kJF9fICAkJHwgJCQgfCAkJCB8ICQkDQogICAgICAgICAgICAgIHwgJCQgIHwgJCR8ICAkJCQkJCQvIC8kJCQkJCQkL3wgJCR8ICAkJCQkJCQkICAgICAgICAgfCAkJHwgICQkJCQkJCR8ICAkJCQkJCQkfCAkJCB8ICQkIHwgJCQNCiAgICAgICAgICAgICAgfF9fLyAgfF9fLyBcX19fX19fLyB8X19fX19fXy8gfF9fLyBcX19fX19fXy8gICAgICAgICB8X18vIFxfX19fX19fLyBcX19fX19fXy98X18vIHxfXy8gfF9fLyAgICAgICAgICAgICAgICANCiAgICAgIFsrXSBSb3NpZSBUZWFtIEPhuqNtIMagbiBC4bqhbiDEkMOjIFRpbiBUxrDhu59uZyBWw6AgU+G7rSBE4bulbmcgROG7i2NoIFbhu6UgQ+G7p2EgQ2jDum5nIFTDtGksIE7hur91IFRo4bqleSBI4buvdSDDjXQgSMOjeSBDaGlhIFPhursgQ2hvIELhuqFuIELDqCBD4bunYSBC4bqhbiAhIQ0KICAgICAgWytdIEtow7RuZyDEkMaw4bujYyBTaGFyZSBIYXkgQ3JhY2sgTcOjIE5ndeG7k24gTsOgeSBDaG8gQWkhIE7hur91IEtow7RuZyBC4bqhbiBT4bq9IELhu4sgQmFuIElQIEto4buPaSBXZWJzaXRlIFbEqW5oIFZp4buFbiENCiAgICAgIFsrXSBDaMO6bmcgVMO0aSBLaMO0bmcgTmjhuq1uIEjhu5cgVHLhu6MgTmjhu69uZyBNw6MgTmd14buTbiBNaeG7hW4gUGjDrSwgWGluIMSQ4burbmcgQuG6o28gVsOsIFNhby4gVOG6oW8gVGlja2V0IEjhu5cgVHLhu6MgQ+G7p2EgV2Vic2l0ZSBU4bqhaTogaHR0cHM6Ly9yb3NpZXRlYW0ubmV0L2Rhc2gvdGlja2V0DQogICAgICBbK10gIE7hur91IELhuqFuIEVkaXQgU291cmNlIFbDoCBVcCBXZWIgU2hhcmUgTmjhu5sgT2JmdXNjYXRlIFNjcmlwdC4gTuG6v3UgQuG6oW4gQ8OzIFRp4buBbiBUaMOsIFPhu60gROG7pW5nOiBMdXJhLlBoLCBMdWFybW9yLk5ldCB8IE7hur91IELhuqFuIEtow7RuZyBDw7MgVGnhu4FuIFRow6wgRMO5bmc6IGx1YW9iZnVzY2F0ZS5jb20sIE1vb25TZWMsIDc3RnVzY2F0ZSwuLi4gTmjDqSENCl1d"local n=a(m)warn(n)
task.spawn(function()
	if check_sea() == 1 then -- First Sea
		section.input("Toggle",{Title = "Auto Second Sea",default = false,callback = function(value)
			auto_second_sea = value
			task.spawn(function()
				while task.wait() do
					xpcall(function()
						if auto_second_sea and not auto_farm_level then
							if auto_second_sea and game:GetService("Players").LocalPlayer.PlayerStats.lvl.Value >= 2250 then
								if check_sea() == 1 and check_sea_progress() == 1 then
									if game:GetService("Players").LocalPlayer.CurrentQuest.Value ~= "Second Sea Map" then
										getquest(workspace.AllNPC.Traveler.Name,true)
									elseif game:GetService("Players").LocalPlayer.CurrentQuest.Value == "Second Sea Map" then
										if not check_material("Map") then
											for i,v in pairs(workspace.Monster.Boss:GetChildren()) do
												if v.Name == "Seasoned Fishman [Lv. 2200]" and v:FindFirstChild("Humanoid").Health > 1 and v:FindFirstChild("HumanoidRootPart") then
													repeat task.wait()
														getnoclip(true,{Method = "Gyro"})
														if (v:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
															tp(true,{Method = "tp",GetCFrame = CFrame.new(-1809.34412, 107.717552, 6537.37891, 0.963350534, 1.10248317e-08, -0.268245608, 3.99932132e-09, 1, 5.54625288e-08, 0.268245608, -5.45026602e-08, 0.963350534)})
														else
															method_farm(select_method_farm,v)
														end
													until not auto_second_sea or v:FindFirstChild("Humanoid").Health <= 0 or not v:FindFirstChild("HumanoidRootPart")
													tp(true,{Method = "tp",GetCFrame = CFrame.new(-1809.34412, 107.717552, 6537.37891, 0.963350534, 1.10248317e-08, -0.268245608, 3.99932132e-09, 1, 5.54625288e-08, 0.268245608, -5.45026602e-08, 0.963350534)})
												else
													tp(true,{Method = "tp",GetCFrame = CFrame.new(-1809.34412, 107.717552, 6537.37891, 0.963350534, 1.10248317e-08, -0.268245608, 3.99932132e-09, 1, 5.54625288e-08, 0.268245608, -5.45026602e-08, 0.963350534)})
												end
											end
										else
											getquest(workspace.AllNPC.Traveler.Name,true)
										end
									end
								elseif check_sea_progress() == 2 then
									getquest(workspace.AllNPC["Elite Pirate"].Name,true)
								end
							end
						end
					end,function() end)
				end
			end)
		end,})
	end
end)

section.input("Label",{Title = '<font color="rgb(170, 170, 127)">Auto Farm (Misc.)</font>'})

section.input("Toggle",{Title = "Auto Farm (Select)",default = false,callback = function(value)
	auto_farm_select = value
	if not auto_farm_select then
		getnoclip(false,{})
	end
	task.spawn(function()
		while auto_farm_select do
			xpcall(function()
				local mob_level = tonumber(string.match(select_mobs, "%[Lv%. (%d+)%]"))
				local quest_level = "QuestLvl"..mob_level
				if not auto_accept_quest_select then
					if game:GetService("Workspace").Monster.Mon:FindFirstChild(tostring(select_mobs)) then
						FolderMob = game:GetService("Workspace").Monster.Mon
					elseif game:GetService("Workspace").Monster.Boss:FindFirstChild(tostring(select_mobs)) then
						FolderMob = game:GetService("Workspace").Monster.Boss
					end
					for index , value in pairs(FolderMob:GetChildren()) do
						if value.Name == select_mobs and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
							repeat task.wait()
								getnoclip(true,{Method = "Gyro"})
								if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
									tp(true,{Method = "tp", GetCFrame = game:GetService("Workspace").AllNPC[quest_level].CFrame * CFrame.new(0,0,-2)})
								else
									method_farm(select_method_farm,value)
								end
							until not auto_farm_select or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
							getnoclip(false,{Method = "Gyro"})
						else
							tp(true,{Method = "tp", GetCFrame = game:GetService("Workspace").AllNPC[quest_level].CFrame * CFrame.new(0,0,-2)})
						end
					end
				else
					task.spawn(function()
						local questtext = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.QuestBoard.QuestCount.Text
						if game:GetService("Players").LocalPlayer.CurrentQuest.Value == "" then
							return
						else
							if tonumber(string.match(questtext, "%[Lv%. (%d+)%]")) ~= tonumber(mob_level) then
								close_quest()
							end
						end
					end)
					if game:GetService("Players").LocalPlayer.CurrentQuest.Value == "" then
						getquest(quest_level,true)
					else
						if game:GetService("Workspace").Monster.Mon:FindFirstChild(tostring(select_mobs)) then
							FolderMob = game:GetService("Workspace").Monster.Mon
						elseif game:GetService("Workspace").Monster.Boss:FindFirstChild(tostring(select_mobs)) then
							FolderMob = game:GetService("Workspace").Monster.Boss
						end
						for index , value in pairs(FolderMob:GetChildren()) do
							if value.Name == select_mobs and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
								repeat task.wait()
									getnoclip(true,{Method = "Gyro"})
									if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
										tp(true,{Method = "tp", GetCFrame = game:GetService("Workspace").AllNPC[quest_level].CFrame * CFrame.new(0,0,-2)})
									else
										method_farm(select_method_farm,value)
									end
								until not auto_farm_select or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
								getnoclip(false,{Method = "Gyro"})
							else
								tp(true,{Method = "tp", GetCFrame = game:GetService("Workspace").AllNPC[quest_level].CFrame * CFrame.new(0,0,-2)})
							end
						end
					end
				end
			end,print)
			task.wait(0.01)
		end
	end)
end,})

section.input("Toggle",{Title = "Auto Accept Quest (Select)",default = true,callback = function(value)
	auto_accept_quest_select = value
end,})

local get_mobs = require(game:GetService("ReplicatedStorage").Chest.Modules.QuestManager)
local resultTable = {}
local encounteredNames = {}

for i, v in pairs(get_mobs) do
	for i, v in pairs(v) do
		if i == "Mob" then
			local mob = tonumber(string.match(v, "%[Lv%. (%d+)%]"))
			if check_sea() == 1 then
				if mob and mob <= 2200 and not encounteredNames[v] then
					table.insert(resultTable, {v = v, mob = mob})
					table.insert(encounteredNames,v)
					encounteredNames[v] = true
				end
			elseif check_sea() == 2 then
				if mob and (mob > 2200 and mob <= 3975) and not encounteredNames[v] then
					table.insert(resultTable, {v = v, mob = mob})
					table.insert(encounteredNames,v)
					encounteredNames[v] = true
				end
			end
		end
	end
end

table.sort(resultTable, function(a, b) return a.mob < b.mob end)
local mob_table = {}
for _, data in ipairs(resultTable) do
	table.insert(mob_table,data.v)
end

section.input("Dropdown",{Title = "Select Mobs",item = mob_table,multi = false,callback = function(value)
	select_mobs = value
end,})

section.input("Label",{Title = '<font color="rgb(170, 170, 127)">Auto Daily Quest</font>'})

section.input("Toggle",{Title = "Auto Daily Quest",default = false,callback = function(value)
	auto_daily_quest = value
end,})

section2.input("Label",{Title = '<font color="rgb(170, 170, 127)">Configs</font>'})

local checkweapon = function()
	check_weapon = {}
	for index,value in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
		if (string.find(value.ToolTip,"Sword") or string.find(value.ToolTip,"Combat") or string.find(value.ToolTip,"Fruit Power")) then
			table.insert(check_weapon,value.Name)
		end
	end
	return check_weapon
end

local select_weapon_drop = section2.input("Dropdown",{Title = "Select Weapon",item = checkweapon(),callback = function(value)
	select_weapon = value
end,})

section2.input("Button",{Title = "Refresh Weapon",callback = function()
	select_weapon_drop.Clear()
	for index,value in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
		if (string.find(value.ToolTip,"Sword") or string.find(value.ToolTip,"Combat") or string.find(value.ToolTip,"Fruit Power")) then
			select_weapon_drop.Add(value.Name)
		end
	end
end,})

section2.input("Dropdown",{Title = "Select Method",item = {"Above","Behind","Below"},multi = false,default = "Above",callback = function(value)
	select_method_farm = value
end,})

distance_farming = 5
section2.input("Slider",{Title = "Distance",Min = 5,Max = 7,Default = distance_farming,Type = "(stud.)",Dec = true,callback = function(value)
	distance_farming = value
end,})

section4.input("Label",{Title = '<font color="rgb(170, 170, 127)">Misc</font>'})

section2.input("Toggle",{Title = "Auto Skill",default = true,callback = function(value)
	auto_skill = value
end,})

task.spawn(function()
	do
		if game:GetService("Workspace"):FindFirstChild("L_0") then
			game:GetService("Workspace"):FindFirstChild("L_0"):Destroy()
		end
		
		Part = Instance.new("Part",game:GetService("Workspace"))
		Part.Name = "L_0";Part.Anchored = true;Part.Size = Vector3.new(0.1,0.05,0.1);Part.Transparency = 1;Part.CanCollide = true;
	end
end)

section4.input("Toggle",{Title = "Walk On Water",default = false,callback = function(value)
	walk_on_water = value
	task.spawn(function()
		while walk_on_water do
			xpcall(function()
				if game:GetService("Workspace"):FindFirstChild("L_0") then
					Part.Position = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x,-3.3,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z);
				else
					if game:GetService("Workspace"):FindFirstChild("L_0") then
						game:GetService("Workspace"):FindFirstChild("L_0"):Destroy()
					end
					Part = Instance.new("Part",game:GetService("Workspace"))
					Part.Name = "L_0";Part.Anchored = true;Part.Size = Vector3.new(0.1,0.05,0.1);Part.Transparency = 1;Part.CanCollide = true;
				end
			end,function() end)
			task.wait(0.01)
		end
	end)
end,})

section4.input("Toggle",{Title = "Delete Effects",default = false,callback = function(value)
	delete_effects = value
	task.spawn(function()
		while delete_effects do
			xpcall(function()
				for i,v in pairs(workspace.Effects:GetChildren()) do
					v:Destroy()
				end
			end,function() end)
			task.wait(0.01)
		end
	end)
end,})

section4.input("Button",{Title = "Redeem All Codes",callback = function()
	local Url = "https://tryhardguides.com/king-legacy-codes/"
	local Response = game:HttpGet(Url)
	local Codes = {}

	for ul in string.gmatch(Response, "<ul>(.-)</ul>") do
		for li in string.gmatch(ul, "<li>(.-)</li>") do
			for Code in string.gmatch(li, "<strong>([^<]+)</strong>") do
				table.insert(Codes, Code)
			end
		end
	end

	for _, Code in ipairs(Codes) do
		local a = Code:gsub(" ","")
		game:GetService("Players").LocalPlayer.PlayerGui.MainGui.StarterFrame.Setting_Frame.CodeBox.Text = a
		task.wait(0.25)
		local button = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.StarterFrame.Setting_Frame.CodeUseButton
		getconnect(button.MouseButton1Click)
		task.wait(1)
	end
end,})

section5.input("Label",{Title = '<font color="rgb(170, 170, 127)">Auto Stats</font>'})

section5.input("Toggle",{Title = "Auto Stats",default = false,callback = function(value)
	auto_stats = value
end,})

section5.input("Dropdown",{Title = "Select Stats",item = {"Melee","Health","Sword","Fruit"},multi = true,callback = function(value)
	select_stats = value
end,})

task.spawn(function()
	while task.wait() do
		xpcall(function()
			if auto_stats then
				if table.find(select_stats,"Melee") then
					game:GetService("Players").LocalPlayer.PlayerGui.MainGui.StarterFrame.StatsFrame.RemoteEvent:FireServer("Melee",1)
				end
				if table.find(select_stats,"Health") then
					game:GetService("Players").LocalPlayer.PlayerGui.MainGui.StarterFrame.StatsFrame.RemoteEvent:FireServer("Defense",1)
				end
				if table.find(select_stats,"Sword") then
					game:GetService("Players").LocalPlayer.PlayerGui.MainGui.StarterFrame.StatsFrame.RemoteEvent:FireServer("Sword",1)
				end
				if table.find(select_stats,"Fruit") then
					game:GetService("Players").LocalPlayer.PlayerGui.MainGui.StarterFrame.StatsFrame.RemoteEvent:FireServer("Fruit",1)
				end
			end
		end,function() end)
	end
end)

section3.input("Label",{Title = '<font color="rgb(170, 170, 127)">Auto Fighting Style</font>'})

task.spawn(function()
	if check_sea() == 1 then
		section3.input("Toggle",{Title = "Auto Dark Leg",default = false,callback = function(value)
			auto_darkleg = value
			if not auto_darkleg then
				getnoclip(false,{Method = "Gyro"})
			end
			task.spawn(function()
				while auto_darkleg do
					xpcall(function()
						if not check_fighting("DarkLeg") then
							if game:GetService("Players").LocalPlayer.PlayerStats.beli.Value >= 150000 then
								getquest(game:GetService("Workspace").AllNPC:FindFirstChild("DarkLegShop").Name,true)
							end
						else
							luxurylibrary.notification({Title = "Notification",Desc = "You Already Have Dark Leg",Type = 1})
						end
					end,function() end)
					task.wait(0.1)
				end
			end)
		end,})

		section3.input("Toggle",{Title = "Auto Cyborg",default = false,callback = function(value)
			auto_cyborg = value
			if not auto_cyborg then
				getnoclip(false,{Method = "Gyro"})
			end
			task.spawn(function()
				while auto_cyborg do
					xpcall(function()
						if not check_fighting("Cyborg") then
							if game:GetService("Players").LocalPlayer.PlayerStats.beli.Value >= 1000000 then
								getquest(game:GetService("Workspace").AllNPC:FindFirstChild("CyborgShop").Name,true)
							end
						else
							luxurylibrary.notification({Title = "Notification",Desc = "You Already Have Cyborg",Type = 1})
						end
					end,function() end)
					task.wait(0.1)
				end
			end)
		end,})

		section3.input("Toggle",{Title = "Auto Dragon Claw",default = false,callback = function(value)
			auto_dragon_claw = value
			if not auto_dragon_claw then
				getnoclip(false,{Method = "Gyro"})
			end
			task.spawn(function()
				while auto_dragon_claw do
					xpcall(function()
						if not check_fighting("DragonClaw") then
							if game:GetService("Players").LocalPlayer.PlayerStats.beli.Value >= 1250000 then
								getquest(game:GetService("Workspace").AllNPC:FindFirstChild("DragonClawShop").Name,true)
							end
						else
							luxurylibrary.notification({Title = "Notification",Desc = "You Already Have Dragon Claw",Type = 1})
						end
					end,function() end)
					task.wait(0.1)
				end
			end)
		end,})

		section3.input("Toggle",{Title = "Auto Fishman Karate",default = false,callback = function(value)
			auto_fishman_karate = value
			if not auto_fishman_karate then
				getnoclip(false,{Method = "Gyro"})
			end
			task.spawn(function()
				while auto_fishman_karate do
					xpcall(function()
						if not check_fighting("WaterStyle") then
							if game:GetService("Players").LocalPlayer.PlayerStats.beli.Value >= 1500000 then
								getquest(game:GetService("Workspace").AllNPC:FindFirstChild("WaterStyleShop").Name,true)
							end
						else
							luxurylibrary.notification({Title = "Notification",Desc = "You Already Have Fishman Karate",Type = 1})
						end
					end,function() end)
					task.wait(0.1)
				end
			end)
		end,})
	end
end)

section6.input("Label",{Title = '<font color="rgb(170, 170, 127)">Auto Training Skill</font>'})

task.spawn(function()
	if check_sea() == 1 then
		section6.input("Toggle",{Title = "Auto Buy Buso Haki",default = false,callback = function(value)
			auto_buso_haki = value
			if not auto_buso_haki then
				getnoclip(false,{Method = "Gyro"})
			end
			task.spawn(function()
				while auto_buso_haki do
					xpcall(function()
						if not check_train_skill("Buso") then
							if game:GetService("Players").LocalPlayer.PlayerStats.beli.Value >= 500000 then
								getquest(game:GetService("Workspace").AllNPC:FindFirstChild("BusoShop").Name,true)
							end
						else
							luxurylibrary.notification({Title = "Notification",Desc = "You Already Have Buso Haki",Type = 1})
						end
					end,function() end)
					task.wait(0.1)
				end
			end)
		end,})
		
		section6.input("Toggle",{Title = "Auto Buy Soru",default = false,callback = function(value)
			auto_soru = value
			if not auto_soru then
				getnoclip(false,{Method = "Gyro"})
			end
			task.spawn(function()
				while auto_soru do
					xpcall(function()
						if not check_train_skill("Soru") then
							if game:GetService("Players").LocalPlayer.PlayerStats.beli.Value >= 50000 then
								getquest(game:GetService("Workspace").AllNPC:FindFirstChild("SoruShop").Name,true)
							end
						else
							luxurylibrary.notification({Title = "Notification",Desc = "You Already Have Soru",Type = 1})
						end
					end,function() end)
					task.wait(0.1)
				end
			end)
		end,})
		
		section6.input("Toggle",{Title = "Auto Buy Ken Haki",default = false,callback = function(value)
			auto_ken_haki = value
			if not auto_ken_haki then
				getnoclip(false,{Method = "Gyro"})
			end
			task.spawn(function()
				while auto_ken_haki do
					xpcall(function()
						if not check_train_skill("Ken") then
							if game:GetService("Players").LocalPlayer.PlayerStats.beli.Value >= 1500000 then
								getquest(game:GetService("Workspace").AllNPC:FindFirstChild("KenShop").Name,true)
							end
						else
							luxurylibrary.notification({Title = "Notification",Desc = "You Already Have Ken Haki",Type = 1})
						end
					end,function() end)
					task.wait(0.1)
				end
			end)
		end,})
	end
end)

section7.input("Label",{Title = '<font color="rgb(170, 170, 127)">Devil Fruits</font>'})

section7.input("Toggle",{Title = "Teleport Devil Fruits",default = false,callback = function(value)
	get_devil_fruits = value
	if not get_devil_fruits then
		getnoclip(false,{Method = "Gyro"})
	end
	task.spawn(function()
		while get_devil_fruits do
			xpcall(function()
				if table.find(select_fruits,"All") then
					for i,v in pairs(workspace.AllDroppedFruit:GetChildren()) do
						if v:GetAttribute("LegacyFruit") then
							getnoclip(true,{Method = "Gyro"})
							tp(true,{Method = "tp",GetCFrame = v:GetPivot()})
						end
					end
				else
					for i,v in pairs(workspace.AllDroppedFruit:GetChildren()) do
						if v:GetAttribute("LegacyFruit") then
							if table.find(select_fruits,v.Name) then
								getnoclip(true,{Method = "Gyro"})
								tp(true,{Method = "tp",GetCFrame = v:GetPivot()})
							end
						end
					end
				end
			end,function() end)
			task.wait(0.1)
		end
	end)
end,})

task.spawn(function()
	local fruit_table = {"All"}
	local get_fruits = require(game:GetService("ReplicatedStorage").Chest.Modules.FruitList)
	for i,v in pairs(get_fruits) do
		table.insert(fruit_table,i)
	end
	section7.input("Dropdown",{Title = "Select Devil Fruits",item = fruit_table,multi = true,callback = function(value)
		select_fruits = value
	end,})
end)

section8.input("Label",{Title = '<font color="rgb(170, 170, 127)">Auto Sword</font>'})

task.spawn(function()
	if check_sea() == 1 then
		
		section8.input("Toggle",{Title = "Auto Mom Blade",default = false,callback = function(value)
			auto_mom_blade = value
			if not auto_mom_blade then
				getnoclip(false,{Method = "Gyro"})
			end
			task.spawn(function()
				while auto_mom_blade do
					xpcall(function()
						if not check_sword("Mom Blade") then
							for index , value in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
								if value.Name == "Monster [Lv. 2500]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
									repeat task.wait()
										getnoclip(true,{Method = "Gyro"})
										if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
											tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.SummonOrcLord.CFrame * CFrame.new(0,0,-2)})
										else
											method_farm(select_method_farm,value)
										end
									until not auto_mom_blade or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
									getnoclip(false,{Method = "Gyro"})
								else
									if check_material("Twilight's Orb") then
										getquest(workspace.AllNPC.SummonOrcLord.Name,true)
									else
										for index , value in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
											if value.Name == "Shadow Master [Lv. 1600]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
												repeat task.wait()
													getnoclip(true,{Method = "Gyro"})
													if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
														tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl1600.CFrame * CFrame.new(0,0,-2)})
													else
														method_farm(select_method_farm,value)
													end
												until not auto_mom_blade or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
												getnoclip(false,{Method = "Gyro"})
											else
												tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl1600.CFrame * CFrame.new(0,0,-2)})
											end
										end
									end
								end
							end
						else
							luxurylibrary.notification({Title = "Notification",Desc = "You Already Have Mom Blade",Type = 1})
						end
					end,function() end)
					task.wait(0.1)
				end
			end)
		end,})
		
		section8.input("Toggle",{Title = "Auto Saber",default = false,callback = function(value)
			auto_saber = value
			if not auto_saber then
				getnoclip(false,{Method = "Gyro"})
			end
			task.spawn(function()
				while auto_saber do
					xpcall(function()
						if not check_sword("Saber") then
							for index , value in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
								if value.Name == "Expert Swordman [Lv. 3000]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
									repeat task.wait()
										getnoclip(true,{Method = "Gyro"})
										if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
											tp(true,{Method = "tp",GetCFrame = CFrame.new(5505.99707, 75.2738724, -6840.36621, -0.77981317, 1.01882947e-07, 0.626012325, 7.35837489e-08, 1, -7.10870438e-08, -0.626012325, -9.37027789e-09, -0.77981317)})
										else
											method_farm(select_method_farm,value)
										end
									until not auto_saber or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
									tp(true,{Method = "tp",GetCFrame = CFrame.new(5505.99707, 75.2738724, -6840.36621, -0.77981317, 1.01882947e-07, 0.626012325, 7.35837489e-08, 1, -7.10870438e-08, -0.626012325, -9.37027789e-09, -0.77981317)})
								else
									tp(true,{Method = "tp",GetCFrame = CFrame.new(5505.99707, 75.2738724, -6840.36621, -0.77981317, 1.01882947e-07, 0.626012325, 7.35837489e-08, 1, -7.10870438e-08, -0.626012325, -9.37027789e-09, -0.77981317)})
								end
							end
						else
							luxurylibrary.notification({Title = "Notification",Desc = "You Already Have Saber",Type = 1})
						end
					end,print)
					task.wait(0.01)
				end
			end)
		end,})
		
		section8.input("Toggle",{Title = "Auto Jitter",default = false,callback = function(value)
			auto_jitter = value
			if not auto_jitter then
				getnoclip(false,{Method = "Gyro"})
			end
			task.spawn(function()
				while auto_jitter do
					xpcall(function()
						if not check_sword("Jitter") then
							for index , value in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
								if value.Name == "Smoky [Lv. 20]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
									repeat task.wait()
										getnoclip(true,{Method = "Gyro"})
										if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
											tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl20.CFrame * CFrame.new(0,0,-2)})
										else
											method_farm(select_method_farm,value)
										end
									until not auto_jitter or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
									getnoclip(false,{Method = "Gyro"})
								else
									tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl20.CFrame * CFrame.new(0,0,-2)})
								end
							end
						else
							luxurylibrary.notification({Title = "Notification",Desc = "You Already Have Jitter",Type = 1})
						end
					end,function() end)
					task.wait(0.1)
				end
			end)
		end,})
		
		section8.input("Toggle",{Title = "Auto Tashi Blade",default = false,callback = function(value)
			auto_tachi_blade = value
			if not auto_tachi_blade then
				getnoclip(false,{Method = "Gyro"})
			end
			task.spawn(function()
				while auto_tachi_blade do
					xpcall(function()
						if not check_sword("Tashi Blade") then
							for index , value in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
								if value.Name == "Tashi [Lv. 30]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
									repeat task.wait()
										getnoclip(true,{Method = "Gyro"})
										if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
											tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl30.CFrame * CFrame.new(0,0,-2)})
										else
											method_farm(select_method_farm,value)
										end
									until not auto_tachi_blade or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
									getnoclip(false,{Method = "Gyro"})
								else
									tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl30.CFrame * CFrame.new(0,0,-2)})
								end
							end
						else
							luxurylibrary.notification({Title = "Notification",Desc = "You Already Have Tashi Blade",Type = 1})
						end
					end,function() end)
					task.wait(0.1)
				end
			end)
		end,})
		
		section8.input("Toggle",{Title = "Auto Shark Blade",default = false,callback = function(value)
			auto_shark_blade = value
			if not auto_shark_blade then
				getnoclip(false,{Method = "Gyro"})
			end
			task.spawn(function()
				while auto_shark_blade do
					xpcall(function()
						if not check_sword("Shark Blade") then
							for index , value in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
								if value.Name == "Shark Man [Lv. 230]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
									repeat task.wait()
										getnoclip(true,{Method = "Gyro"})
										if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
											tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl230.CFrame * CFrame.new(0,0,-2)})
										else
											method_farm(select_method_farm,value)
										end
									until not auto_shark_blade or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
									getnoclip(false,{Method = "Gyro"})
								else
									tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl230.CFrame * CFrame.new(0,0,-2)})
								end
							end
						else
							luxurylibrary.notification({Title = "Notification",Desc = "You Already Have Shark Blade",Type = 1})
						end
					end,function() end)
					task.wait(0.1)
				end
			end)
		end,})
		
		section8.input("Toggle",{Title = "Auto Pole",default = false,callback = function(value)
			auto_pole = value
			if not auto_pole then
				getnoclip(false,{Method = "Gyro"})
			end
			task.spawn(function()
				while auto_pole do
					xpcall(function()
						if not check_sword("Pole") then
							for index , value in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
								if value.Name == "Rumble Man [Lv. 900]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
									repeat task.wait()
										getnoclip(true,{Method = "Gyro"})
										if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
											tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl900.CFrame * CFrame.new(0,0,-2)})
										else
											method_farm(select_method_farm,value)
										end
									until not auto_pole or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
									getnoclip(false,{Method = "Gyro"})
								else
									tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl900.CFrame * CFrame.new(0,0,-2)})
								end
							end
						else
							luxurylibrary.notification({Title = "Notification",Desc = "You Already Have Pole",Type = 1})
						end
					end,function() end)
					task.wait(0.1)
				end
			end)
		end,})
		
		section8.input("Toggle",{Title = "Auto Bisento",default = false,callback = function(value)
			auto_bisento = value
			if not auto_bisento then
				getnoclip(false,{Method = "Gyro"})
			end
			task.spawn(function()
				while auto_bisento do
					xpcall(function()
						if not check_sword("Bisento") then
							for index , value in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
								if value.Name == "Quake Woman [Lv. 1925]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
									repeat task.wait()
										getnoclip(true,{Method = "Gyro"})
										if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
											tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl1925.CFrame * CFrame.new(0,0,-2)})
										else
											method_farm(select_method_farm,value)
										end
									until not auto_bisento or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
									getnoclip(false,{Method = "Gyro"})
								else
									tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl1925.CFrame * CFrame.new(0,0,-2)})
								end
							end
						else
							luxurylibrary.notification({Title = "Notification",Desc = "You Already Have Bisento",Type = 1})
						end
					end,function() end)
					task.wait(0.1)
				end
			end)
		end,})
		
		section8.input("Toggle",{Title = "Auto Buy Katana",default = false,callback = function(value)
			auto_katana = value
			if not auto_katana then
				getnoclip(false,{Method = "Gyro"})
			end
			task.spawn(function()
				while auto_katana do
					xpcall(function()
						if not check_sword("Katana") then
							if game:GetService("Players").LocalPlayer.PlayerStats.beli.Value >= 5000 then
								for index,value in pairs(workspace.AllNPC:GetChildren()) do
									if value.Name == "SwordShop" then
										for i,v in pairs(value:GetChildren()) do
											if v.Name == "Setting" then
												if v:FindFirstChild("NameWeapon").Value == "Katana" then
													getquest(value,true)
												end
											end
										end
									end
								end
							end
						else
							luxurylibrary.notification({Title = "Notification",Desc = "You Already Have Katana",Type = 1})
						end
					end,function() end)
					task.wait(0.1)
				end
			end)
		end,})
		
		section8.input("Toggle",{Title = "Auto Buy Pipe",default = false,callback = function(value)
			auto_pipe = value
			if not auto_pipe then
				getnoclip(false,{Method = "Gyro"})
			end
			task.spawn(function()
				while auto_pipe do
					xpcall(function()
						if not check_sword("Pipe") then
							if game:GetService("Players").LocalPlayer.PlayerStats.beli.Value >= 500000 then
								for index,value in pairs(workspace.AllNPC:GetChildren()) do
									if value.Name == "SwordShop" then
										for i,v in pairs(value:GetChildren()) do
											if v.Name == "Setting" then
												if v:FindFirstChild("NameWeapon").Value == "Pipe" then
													getquest(value,true)
												end
											end
										end
									end
								end
							end
						else
							luxurylibrary.notification({Title = "Notification",Desc = "You Already Have Pipe",Type = 1})
						end
					end,function() end)
					task.wait(0.1)
				end
			end)
		end,})
		
		section8.input("Toggle",{Title = "Auto Buy Triple Katana",default = false,callback = function(value)
			auto_triple_katana = value
			if not auto_triple_katana then
				getnoclip(false,{Method = "Gyro"})
			end
			task.spawn(function()
				while auto_triple_katana do
					xpcall(function()
						if not check_sword("Triple Katana") then
							if game:GetService("Players").LocalPlayer.PlayerStats.beli.Value >= 2500000 then
								for index,value in pairs(workspace.AllNPC:GetChildren()) do
									if value.Name == "SwordShop" then
										for i,v in pairs(value:GetChildren()) do
											if v.Name == "Setting" then
												if v:FindFirstChild("NameWeapon").Value == "Triple Katana" then
													getquest(value,true)
												end
											end
										end
									end
								end
							end
						else
							luxurylibrary.notification({Title = "Notification",Desc = "You Already Have Triple Katana",Type = 1})
						end
					end,function() end)
					task.wait(0.1)
				end
			end)
		end,})
		
		section8.input("Toggle",{Title = "Auto Buy Mini Mace",default = false,callback = function(value)
			auto_mini_mace = value
			if not auto_mini_mace then
				getnoclip(false,{Method = "Gyro"})
			end
			task.spawn(function()
				while auto_mini_mace do
					xpcall(function()
						if not check_sword("Mini Mace") then
							if game:GetService("Players").LocalPlayer.PlayerStats.beli.Value >= 3000000 then
								for index,value in pairs(workspace.AllNPC:GetChildren()) do
									if value.Name == "SwordShop" then
										for i,v in pairs(value:GetChildren()) do
											if v.Name == "Setting" then
												if v:FindFirstChild("NameWeapon").Value == "Mini Mace" then
													getquest(value,true)
												end
											end
										end
									end
								end
							end
						else
							luxurylibrary.notification({Title = "Notification",Desc = "You Already Have Mini Mace",Type = 1})
						end
					end,function() end)
					task.wait(0.1)
				end
			end)
			end,})
	elseif check_sea() == 2 then
		
		section8.input("Toggle",{Title = "Auto Adventure Knife",default = false,callback = function(value)
			auto_adventure_knife = value
			if not auto_adventure_knife then
				getnoclip(false,{Method = "Gyro"})
			end
			task.spawn(function()
				while auto_adventure_knife do
					xpcall(function()
						if not check_sword("Adventure Knife") then
							for index , value in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
								if value.Name == "Flame User [Lv. 3200]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
									repeat task.wait()
										getnoclip(true,{Method = "Gyro"})
										if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
											tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl3200.CFrame * CFrame.new(0,0,-2)})
										else
											method_farm(select_method_farm,value)
										end
									until not auto_adventure_knife or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
									getnoclip(false,{Method = "Gyro"})
								else
									tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl3200.CFrame * CFrame.new(0,0,-2)})
								end
							end
						else
							luxurylibrary.notification({Title = "Notification",Desc = "You Already Have Adventure Knife",Type = 1})
						end
					end,function() end)
					task.wait(0.1)
				end
			end)
		end,})
		
		section8.input("Toggle",{Title = "Auto Anubis Axe",default = false,callback = function(value)
			auto_anubis_axe = value
			if not auto_anubis_axe then
				getnoclip(false,{Method = "Gyro"})
			end
			task.spawn(function()
				while auto_anubis_axe do
					xpcall(function()
						if not check_sword("Anubis Axe") then
							for index , value in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
								if value.Name == "Anubis [Lv. 3150]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
									repeat task.wait()
										getnoclip(true,{Method = "Gyro"})
										if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
											tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl3125.CFrame * CFrame.new(0,0,-2)})
										else
											method_farm(select_method_farm,value)
										end
									until not auto_anubis_axe or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
									getnoclip(false,{Method = "Gyro"})
								else
									tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl3125.CFrame * CFrame.new(0,0,-2)})
								end
							end
						else
							luxurylibrary.notification({Title = "Notification",Desc = "You Already Have Anubis Axe",Type = 1})
						end
					end,function() end)
					task.wait(0.1)
				end
			end)
		end,})
		
		section8.input("Toggle",{Title = "Auto Muramasa",default = false,callback = function(value)
			auto_muramasa = value
			if not auto_muramasa then
				getnoclip(false,{Method = "Gyro"})
			end
			task.spawn(function()
				while auto_muramasa do
					xpcall(function()
						if not check_sword("Muramasa") then
							for index , value in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
								if value.Name == "King Samurai [Lv. 3500]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
									repeat task.wait()
										getnoclip(true,{Method = "Gyro"})
										if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
											tp(true,{Method = "tp", GetCFrame = CFrame.new(-5906.22265625, 354.84906005859375, 83.59222412109375)})
										else
											method_farm(select_method_farm,value)
										end
									until not auto_muramasa or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
									getnoclip(false,{Method = "Gyro"})
								else
									tp(true,{Method = "tp", GetCFrame = CFrame.new(-5906.22265625, 354.84906005859375, 83.59222412109375)})
								end
							end
						else
							luxurylibrary.notification({Title = "Notification",Desc = "You Already Have Muramasa",Type = 1})
						end
					end,function() end)
					task.wait(0.1)
				end
			end)
		end,})
		
			section8.input("Toggle",{Title = "Auto Authentic Mace",default = false,callback = function(value)
				auto_authentic_mace = value
				if not auto_authentic_mace then
					getnoclip(false,{Method = "Gyro"})
				end
				task.spawn(function()
					while auto_authentic_mace do
						xpcall(function()
							if not check_sword("Authentic Mace") then
								for index , value in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
									if value.Name == "Dragon [Lv. 5000]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
										repeat task.wait()
											getnoclip(true,{Method = "Gyro"})
											if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
												tp(true,{Method = "tp", GetCFrame = CFrame.new(-5856.2119140625, 401.3624267578125, 7652.97705078125)})
											else
												method_farm(select_method_farm,value)
											end
									until not auto_authentic_mace or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
										getnoclip(false,{Method = "Gyro"})
									else
										if check_material("Dragon's Orb") then
											getquest(workspace.AllNPC.SummonDragon.Name,true)
										else
											for index , value in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
												if value.Name == "Elite Skeleton [Lv. 3100]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
													repeat task.wait()
														getnoclip(true,{Method = "Gyro"})
														if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
															tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl3075.CFrame * CFrame.new(0,0,-2)})
														else
															method_farm(select_method_farm,value)
														end
												until not auto_authentic_mace or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
													getnoclip(false,{Method = "Gyro"})
												else
													tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl3075.CFrame * CFrame.new(0,0,-2)})
												end
											end
										end
									end
								end
							else
								luxurylibrary.notification({Title = "Notification",Desc = "You Already Have Authentic Mace",Type = 1})
							end
						end,function() end)
						task.wait(0.1)
					end
				end)
			end,})
	end
end)

section9.input("Label",{Title = '<font color="rgb(170, 170, 127)">Teleports Island</font>'})

task.spawn(function()
	
	local get_island = {}
	for i,v in pairs(workspace.Island:GetChildren()) do
		if v:IsA("Model") then
			table.insert(get_island,v.Name)
		end
	end
	
	section9.input("Dropdown",{Title = "Select Place",item = get_island,callback = function(value)
		select_island = value
		for i,v in pairs(workspace.Island:GetChildren()) do
			if v:IsA("Model") then
				if v.Name == select_island then
					tp(true,{Method = "tp",GetCFrame = v:GetPivot()})
				end
			end
		end
	end,})
end)

section9.input("Label",{Title = '<font color="rgb(170, 170, 127)">Teleports Sea</font>'})

task.spawn(function()
	local sea_name,sea_req
	if check_sea() == 1 then
		sea_name = "Second Sea"
		sea_req = 1
	elseif check_sea() == 2 then
		sea_name = "First Sea"
		sea_req = 2 
	end
	section9.input("Button",{Title = 'Teleport to '..sea_name,callback = function()
		repeat task.wait()
			getquest(workspace.AllNPC["Elite Pirate"].Name,true)
		until check_sea() ~= sea_req
	end,})
end)

section10.input("Label",{Title = '<font color="rgb(170, 170, 127)">Auto Event Chest</font>'})

section10.input("Toggle",{Title = "Auto Event Chest",default = false,callback = function(value)
	auto_event_chest = value
	if not auto_event_chest then
		getnoclip(false,{})
	end
	task.spawn(function()
		while auto_event_chest do
			xpcall(function()

			end,print)
			task.wait(0.01)
		end
	end)
end,})

local get_material = require(game:GetService("ReplicatedStorage").Chest.Modules.MaterialList)
local material_list = {}
for i,v in pairs(get_material) do
	if not string.find(i,"Key") then
		table.insert(material_list,i)
	end
end

section11.input("Label",{Title = '<font color="rgb(170, 170, 127)">Auto Material</font>'})

local show_material_txt = section11.input("Label",{Title = '<font color="rgb(170, 170, 127)">Material</font>'..'<font color="rgb(160,160,160)"> [nil] : '..'</font>'.."nil"})

task.spawn(function()
	while task.wait() do
		xpcall(function()
			if select_material ~= (nil or "") then
				show_material_txt.Update('<font color="rgb(170, 170, 127)">Material</font>'..'<font color="rgb(160,160,160)"> ['..select_material..'] : </font>'..check_count_material(select_material))
			end
		end,function() end)
	end
end)

section11.input("Toggle",{Title = "Auto Material (Select)",default = false,callback = function(value)
	auto_material_select = value
	if not auto_material_select then
		getnoclip(false,{})
	end
	task.spawn(function()
		while auto_material_select do
			xpcall(function()
				if select_material == "Leather" then
					for index , value in pairs(game:GetService("Workspace").Monster.Mon:GetChildren()) do
						if value.Name == "Clown Pirate [Lv. 10]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
							repeat task.wait()
								getnoclip(true,{Method = "Gyro"})
								if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
									tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl10.CFrame * CFrame.new(0,0,-2)})
								else
									method_farm(select_method_farm,value)
								end
							until not auto_material_select or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
							getnoclip(false,{Method = "Gyro"})
						else
							tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl10.CFrame * CFrame.new(0,0,-2)})
						end
					end
				elseif select_material == "Log" then
					if check_sea() == 1 then
						for i,v in pairs(workspace.Island["A - Town"].Tree:GetChildren()) do
							if v:IsA("Model") and v.Name == "Tree" and auto_material_select then
								for i,v in pairs(v:GetChildren()) do
									if v:IsA("Part") then
										repeat task.wait() 
											tp(true,{Method = "tp", GetCFrame = v:GetPivot()})
											skill()
											attack(select_weapon)
										until not auto_material_select or v.Transparency >= 1 or select_material ~= "Log"
									end
								end
							else
								tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl10.CFrame * CFrame.new(0,0,-2)})
							end
						end
					end
				elseif select_material == "Rusted Scrap" then
					if check_sea() == 1 then
						for index , value in pairs(game:GetService("Workspace").Monster.Mon:GetChildren()) do
							if value.Name == "Elite Soldier [Lv. 1000]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
								repeat task.wait()
									getnoclip(true,{Method = "Gyro"})
									if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
										tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl1000.CFrame * CFrame.new(0,0,-2)})
									else
										method_farm(select_method_farm,value)
									end
								until not auto_material_select or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
								getnoclip(false,{Method = "Gyro"})
							else
								tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl1000.CFrame * CFrame.new(0,0,-2)})
							end
						end
					elseif check_sea() == 2 then
						getquest(workspace.AllNPC["Elite Pirate"].Name,true)
					end
				elseif select_material == "Angellic's Feather" then
					if check_sea() == 1 then
						for index , value in pairs(game:GetService("Workspace").Monster.Mon:GetChildren()) do
							if value.Name == "Sky Soldier [Lv. 800]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
								repeat task.wait()
									getnoclip(true,{Method = "Gyro"})
									if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
										tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl800.CFrame * CFrame.new(0,0,-2)})
									else
										method_farm(select_method_farm,value)
									end
								until not auto_material_select or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
								getnoclip(false,{Method = "Gyro"})
							else
								tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl800.CFrame * CFrame.new(0,0,-2)})
							end
						end
					elseif check_sea() == 2 then
						getquest(workspace.AllNPC["Elite Pirate"].Name,true)
					end
				elseif select_material == "Carrot" then
					if check_sea() == 1 then
						if check_sea_progress() == 2 then
							getquest(workspace.AllNPC["Elite Pirate"].Name,true)
						end
					elseif check_sea() == 2 then
						for index , value in pairs(game:GetService("Workspace").Monster.Mon:GetChildren()) do
							if value.Name == "Powerful Beast Pirate [Lv. 2450]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
								repeat task.wait()
									getnoclip(true,{Method = "Gyro"})
									if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
										tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl2450.CFrame * CFrame.new(0,0,-2)})
									else
										method_farm(select_method_farm,value)
									end
								until not auto_material_select or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
								getnoclip(false,{Method = "Gyro"})
							else
								tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl2450.CFrame * CFrame.new(0,0,-2)})
							end
						end
					end
				elseif select_material == "Pile of Bones" then
					if check_sea() == 1 then
						if check_sea_progress() == 2 then
							getquest(workspace.AllNPC["Elite Pirate"].Name,true)
						end
					elseif check_sea() == 2 then
						for index , value in pairs(game:GetService("Workspace").Monster.Mon:GetChildren()) do
							if value.Name == "Skull Pirate [Lv. 3050]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
								repeat task.wait()
									getnoclip(true,{Method = "Gyro"})
									if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
										tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl3025.CFrame * CFrame.new(0,0,-2)})
									else
										method_farm(select_method_farm,value)
									end
								until not auto_material_select or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
								getnoclip(false,{Method = "Gyro"})
							else
								tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl3025.CFrame * CFrame.new(0,0,-2)})
							end
						end
					end
				elseif select_material == "Fresh Fish" then
					if check_sea() == 2 then
						getquest(workspace.AllNPC["Elite Pirate"].Name,true)
					elseif check_sea() == 1 then
						for index , value in pairs(game:GetService("Workspace").Monster.Mon:GetChildren()) do
							if value.Name == "Fishman [Lv. 2000]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
								repeat task.wait()
									getnoclip(true,{Method = "Gyro"})
									if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
										tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl2000.CFrame * CFrame.new(0,0,-2)})
									else
										method_farm(select_method_farm,value)
									end
								until not auto_material_select or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
								getnoclip(false,{Method = "Gyro"})
							else
								tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl2000.CFrame * CFrame.new(0,0,-2)})
							end
						end
					end
				elseif select_material == "Bread Crumbs" then
					if check_sea() == 1 then
						if check_sea_progress() == 2 then
							getquest(workspace.AllNPC["Elite Pirate"].Name,true)
						end
					elseif check_sea() == 2 then
						for index , value in pairs(game:GetService("Workspace").Monster.Mon:GetChildren()) do
							if value.Name == "Chess Soldier [Lv. 3200]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
								repeat task.wait()
									getnoclip(true,{Method = "Gyro"})
									if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
										tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl3200.CFrame * CFrame.new(0,0,-2)})
									else
										method_farm(select_method_farm,value)
									end
								until not auto_material_select or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
								getnoclip(false,{Method = "Gyro"})
							else
								tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl3200.CFrame * CFrame.new(0,0,-2)})
							end
						end
					end
				elseif select_material == "Iron Ingot" then
					if check_sea() == 1 then
						if check_sea_progress() == 2 then
							getquest(workspace.AllNPC["Elite Pirate"].Name,true)
						end
					elseif check_sea() == 2 then
						for index , value in pairs(game:GetService("Workspace").Monster.Mon:GetChildren()) do
							if value.Name == "Fiore Pirate [Lv. 3650]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
								repeat task.wait()
									getnoclip(true,{Method = "Gyro"})
									if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
										tp(true,{Method = "tp", GetCFrame = CFrame.new(6079.41357421875, 71.79540252685547, -3085.912841796875)})
									else
										method_farm(select_method_farm,value)
									end
								until not auto_material_select or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
								getnoclip(false,{Method = "Gyro"})
							else
								tp(true,{Method = "tp", GetCFrame = CFrame.new(6079.41357421875, 71.79540252685547, -3085.912841796875)})
							end
						end
					end
				elseif select_material == "Undead's Ooze" then
					if check_sea() == 2 then
						getquest(workspace.AllNPC["Elite Pirate"].Name,true)
					elseif check_sea() == 1 then
						for index , value in pairs(game:GetService("Workspace").Monster.Mon:GetChildren()) do
							if value.Name == "Zombie [Lv. 1500]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
								repeat task.wait()
									getnoclip(true,{Method = "Gyro"})
									if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
										tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl1600.CFrame * CFrame.new(0,0,-2)})
									else
										method_farm(select_method_farm,value)
									end
								until not auto_material_select or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
								getnoclip(false,{Method = "Gyro"})
							else
								tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl1600.CFrame * CFrame.new(0,0,-2)})
							end
						end
					end
				elseif select_material == "Thief's rag" then
					if check_sea() == 1 then
						if check_sea_progress() == 2 then
							getquest(workspace.AllNPC["Elite Pirate"].Name,true)
						end
					elseif check_sea() == 2 then
						for index , value in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
							if value.Name == "Desert Thief [Lv. 3125]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
								repeat task.wait()
									getnoclip(true,{Method = "Gyro"})
									if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
										tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl3100.CFrame * CFrame.new(0,0,-2)})
									else
										method_farm(select_method_farm,value)
									end
								until not auto_material_select or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
								getnoclip(false,{Method = "Gyro"})
							else
								tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl3100.CFrame * CFrame.new(0,0,-2)})
							end
						end
					end
				elseif select_material == "Dragon Scale" then
					if check_sea() == 1 then
						if check_sea_progress() == 2 then
							getquest(workspace.AllNPC["Elite Pirate"].Name,true)
						end
					elseif check_sea() == 2 then
						for index , value in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
							if value.Name == "Dragon [Lv. 5000]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
								repeat task.wait()
									getnoclip(true,{Method = "Gyro"})
									if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
										tp(true,{Method = "tp", GetCFrame = CFrame.new(-5856.2119140625, 401.3624267578125, 7652.97705078125)})
									else
										method_farm(select_method_farm,value)
									end
								until not auto_material_select or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
								getnoclip(false,{Method = "Gyro"})
							else
								if check_material("Dragon's Orb") then
									getquest(workspace.AllNPC.SummonDragon.Name,true)
								else
									tp(true,{Method = "tp", GetCFrame = CFrame.new(-5856.2119140625, 401.3624267578125, 7652.97705078125)})
									luxurylibrary.notification({Title = "Notification",Desc = "You Don't Have Dragon's Orb",Type = 2})
								end
							end
						end
					end
				elseif select_material == "Dragon's Orb" then
					if check_sea() == 1 then
						if check_sea_progress() == 2 then
							getquest(workspace.AllNPC["Elite Pirate"].Name,true)
						end
					elseif check_sea() == 2 then
						for index , value in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
							if value.Name == "Elite Skeleton [Lv. 3100]" and value:FindFirstChild("Humanoid").Health > 1 and value:FindFirstChild("HumanoidRootPart") then
								repeat task.wait()
									getnoclip(true,{Method = "Gyro"})
									if (value:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 500 then
										tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl3075.CFrame * CFrame.new(0,0,-2)})
									else
										method_farm(select_method_farm,value)
									end
								until not auto_material_select or value:FindFirstChild("Humanoid").Health <= 0 or not value:FindFirstChild("HumanoidRootPart")
								getnoclip(false,{Method = "Gyro"})
							else
								tp(true,{Method = "tp", GetCFrame = workspace.AllNPC.QuestLvl3075.CFrame * CFrame.new(0,0,-2)})
							end
						end
					end
				end
			end,print)
			task.wait(0.01)
		end
	end)
end,})

section11.input("Dropdown",{Title = "Select Material",item = material_list,callback = function(value)
	select_material = value
end,})

--loadstring(game:HttpGet("https://gist.githubusercontent.com/SixZensED/95d7223c8251794ddd50b64f0580cae9/raw/9f0971b615265f6caccad16339f023b188ce6db5/gistfile1.txt"))()