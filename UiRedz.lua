local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()

local Window = redzlib:MakeWindow({
  Title = "redz Hub : Blox Fruits",
  SubTitle = "by redz9999",
  SaveFolder = "testando | redz lib v5.lua"
})
local Tab1 = Window:MakeTab({"Um", "cherry"})
local Tab2 = Window:MakeTab({"Dois", "swords"})
local Tab3 = Window:MakeTab({"Três", "user"})

Tab1:AddButton({"Dark Theme", function()
  redzlib:SetTheme("Dark")
end})

Tab1:AddButton({"Darker Theme", function()
  redzlib:SetTheme("Darker")
end})

Tab1:AddButton({"Dark Purple", function()
  redzlib:SetTheme("Purple")
end})

Window:SelectTab(Tab2)
local Section = Tab2:AddSection({"Section"})
local Paragraph = Tab2:AddParagraph({"Paragraph", "This is a Paragraph\nSecond Line"})

local Number = 0
local Button = Tab2:AddButton({"Button", function()
  Number = Number + 1
  Section:Set("Number : " .. tostring(Number))
  local Dialog = Window:Dialog({
    Title = "Dialog",
    Text = "This is a Dialog",
    Options = {
      {"Confirm", function()
        
      end},
      {"Maybe", function()
        
      end},
      {"Cancel", function()
        
      end}
    }
  })
end})

local Button = Tab2:AddButton({
  Name = "Invisible Toggle",
  Description = "Makes the Toggles Invisible"
})

local Toggle1 = Tab2:AddToggle({
  Name = "Toggle 1",
  Description = "This is a <font color='rgb(88, 101, 242)'>Toggle</font> Example",
  Default = false
})

local Toggle2 = Tab2:AddToggle({
  Name = "Toggle 2",
  Default = true
})

Button:Callback(Toggle1.Visible)
Button:Callback(Toggle2.Visible)

Toggle1:Callback(function(Value)
  Toggle2:Set(false)
end)
Toggle2:Callback(function(Value)
  Toggle1:Set(false)
end)

Tab2:AddSlider({
  Name = "Slider",
  Min = 1,
  Max = 10,
  Increase = 1,
  Default = 5,
  Callback = function(Value)
    
  end
})

-- local Button = Tab2:AddButton({"Refresh Dropdown"})

local Dropdown = Tab2:AddDropdown({
  Name = "Players List",
  Description = "Select the <font color='rgb(88, 101, 242)'>Number</font>",
  Options = {"one", "two", "three"},
  Default = "two",
  Flag = "dropdown teste",
  Callback = function(Value)
    
  end
})]]

--[[Button:Callback(function()
  Dropdown:Set(game.Players:GetPlayers())
  Dropdown:Remove(game.Players.LocalPlayer.Name)
end)

Dropdown:Remove(Player.Name)
Dropdown:Select(1)]]

--[[Tab2:AddTextBox({
  Name = "Textbox",
  Description = "this is a Text box",
  Default = "Text",
  Callback = function(Value)
    
  end
})

Tab3:AddDiscordInvite({
  Name = "redz Hub | Community",
  Logo = "rbxassetid://15298567397",
  Invite = "https://discord.gg/7aR7kNVt4g"
})

-- Simple example ;)
-- More in soon...


local Tab1 = Window:MakeTab({"Setting", "cherry"})
local Tab2 = Window:MakeTab({"Main", "swords"})
local Tab3 = Window:MakeTab({"Shop", "user"})
local Tab4 = Window:MakeTab({"Status", "user"})
local Tab5 = Window:MakeTab({"Misc", "user"})
local Tab6 = Window:MakeTab({"Local Player", "user"})
local Tab7 = Window:MakeTab({"Sea Event", "user"})
local Tab8 = Window:MakeTab({"Race V4", "user"})
local Tab9 = Window:MakeTab({"Quest & Item", "user"})
local Tab10 = Window:MakeTab({"Profile", "user"})


