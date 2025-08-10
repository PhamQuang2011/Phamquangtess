-- ⚙️ Khởi tạo dịch vụ
repeat wait() until game:IsLoaded()
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "PHẠMQUANG [ TỔNG HỢP ]"

-- 🌈 Tạo nút ImageButton cực đẹp
local button = Instance.new("ImageButton")
button.Size = UDim2.new(0, 20, 0, 20)
button.Position = UDim2.new(0.1, 0, 0.15, 0)
button.BackgroundColor3 = Color3.fromRGB(255, 102, 204)
button.Image = "http://www.roblox.com/asset/?id=1391470958"
button.BorderSizePixel = 0
button.Draggable = true
button.Name = "GlowButton"
button.Parent = gui

-- 🔘 Bo góc
local corner = Instance.new("UICorner", button)
corner.CornerRadius = UDim.new(0, 5)

-- ✨ Aura glow
local aura = Instance.new("ImageLabel", button)
aura.Image = "rbxassetid://10859710115"
aura.BackgroundTransparency = 1
aura.Size = UDim2.new(2, 0, 2, 0)
aura.Position = UDim2.new(-0.5, 0, -0.5, 0)
aura.ImageColor3 = Color3.new(1, 1, 1)
aura.ImageTransparency = 0.6
aura.ZIndex = 0

-- 🌈 Viền cầu vồng
local stroke = Instance.new("UIStroke", button)
stroke.Thickness = 10
stroke.Transparency = 0.3

-- 🌀 Gradient wave
local gradient = Instance.new("UIGradient", stroke)
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 0, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
}

-- 🖤 Shadow động
local shadow = Instance.new("ImageLabel", button)
shadow.Size = UDim2.new(1.5, 0, 1.5, 0)
shadow.Position = UDim2.new(-0.25, 0, -0.25, 4)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://10859710115"
shadow.ImageColor3 = Color3.new(0, 0, 0)
shadow.ImageTransparency = 0.8
shadow.ZIndex = 0

-- 💥 Particle click
local particle = Instance.new("ParticleEmitter")
particle.Name = "ClickEffect"
particle.Rate = 0
particle.Lifetime = NumberRange.new(0.3)
particle.Speed = NumberRange.new(5, 10)
particle.SpreadAngle = Vector2.new(360, 360)
particle.Texture = "rbxassetid://243098098"
particle.Size = NumberSequence.new(0.5)
particle.LightEmission = 1
particle.Parent = button

-- 💡 Hiệu ứng sáng tối viền
task.spawn(function()
    while true do
        TweenService:Create(stroke, TweenInfo.new(0.5), {Transparency = 0.05}):Play()
        task.wait(0.5)
        TweenService:Create(stroke, TweenInfo.new(0.5), {Transparency = 0.3}):Play()
        task.wait(0.5)
    end
end)

-- 🌈 Đổi màu nền + wave gradient
task.spawn(function()
    while true do
        local hue = (tick() % 5) / 5
        local color = Color3.fromHSV(hue, 1, 1)
        button.BackgroundColor3 = color
        stroke.Color = ColorSequence.new(color)
        gradient.Rotation = (gradient.Rotation + 1) % 360
        task.wait(0.02)
    end
end)

-- 🔄 Xoay nút liên tục
task.spawn(function()
    while true do
        button.Rotation += 2
        if button.Rotation >= 360 then button.Rotation = 0 end
        task.wait(0.02)
    end
end)

-- 💓 Pulse nhẹ co giãn
task.spawn(function()
    while true do
        TweenService:Create(button, TweenInfo.new(0.6, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 24, 0, 24)}):Play()
        task.wait(0.6)
        TweenService:Create(button, TweenInfo.new(0.6, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 20, 0, 20)}):Play()
        task.wait(0.6)
    end
end)

-- 🖱 Click glow + rung + gửi phím mở GUI
button.MouseButton1Down:Connect(function()
    TweenService:Create(button, TweenInfo.new(0.1), {
        Size = UDim2.new(0, 16, 0, 16),
        Rotation = 20
    }):Play()
    TweenService:Create(stroke, TweenInfo.new(0.1), {Transparency = 0.1}):Play()
    particle:Emit(15)
    task.wait(0.1)
    TweenService:Create(button, TweenInfo.new(0.1), {
        Size = UDim2.new(0, 20, 0, 20),
        Rotation = 0
    }):Play()
    TweenService:Create(stroke, TweenInfo.new(0.3), {Transparency = 0.3}):Play()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game)
end)

-- 🪟 GUI Fluent đẹp
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
    Title = "HNC Roblox [ Tổng Hợp ]",
    SubTitle = "By @hnc_roblox",
    TabWidth = 157,
    Size = UDim2.fromOffset(400, 250),
    Acrylic = true,
    Theme = "Rose",
    MinimizeKey = Enum.KeyCode.End
})

-- 🧩 Tabs
local Tabs = {
    Main0 = Window:AddTab({ Title = "Về Script" }),
    Main1 = Window:AddTab({ Title = "Script Chức Năng" }),
    Main2 = Window:AddTab({ Title = "Script Nhặt Rương" }),
    Main3 = Window:AddTab({ Title = "Script Kaitun" }),
    Main4 = Window:AddTab({ Title = "Script Hop Server" }),
    Main5 = Window:AddTab({ Title = "Script Tăng Hitbox" }),
    Main6 = Window:AddTab({ Title = "Script Aimbot" }),
    Main7 = Window:AddTab({ Title = "Script Nhặt Trái" }),
    Main8 = Window:AddTab({ Title = "Script Fix Lag" }),
    Main9 = Window:AddTab({ Title = "Làm Đồ Hoạ Đẹp Hơn" }),
    Main10 = Window:AddTab({ Title = "Báo Cáo Lỗi" }),
}
    Tabs.Main0:AddButton({
    Title = "Discord Tuiii💕",
    Description = "Vô Discord Giao Lưu Vui Vẻ Nha!!! Anh Em Bấm Vào Đây Để Coppy Link Nha!!!",
    Callback = function()
        setclipboard("https://discord.gg/zjHtFXZx")
    end
})

    Tabs.Main0:AddButton({
    Title = "Tik Tok: @hnc_roblox",
    Description = "Anh Em Follow Ủng Hộ Tui Nha",
    Callback = function()
        setclipboard("https://www.tiktok.com/@hnc_roblox")
    end
})

    Tabs.Main0:AddButton({
    Title = "TikTok: HNC Roblox",
    Description = "@hnc_roblox",
    Callback = function()
        setclipboard("https://www.tiktok.com/@hnc_roblox")
    end
})
    
    Tabs.Main1:AddButton({
    Title="Redz Hub",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))()
  end
})

Tabs.Main1:AddButton({
    Title="Min Gaming Hub (Menu Redz)",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Min/refs/heads/main/MinBE"))()
  end
})

    Tabs.Main1:AddButton({
    Title="Min Gaming Hub",
    Description="",
    Callback=function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Min/refs/heads/main/MinXoE"))()
  end
})

    Tabs.Main1:AddButton({
    Title="Bắp Red Hub",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/BapRed/main/BapRedHub"))()
  end
})

    Tabs.Main1:AddButton({
    Title="Min Gaming Hub (Menu Khác)",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Min/refs/heads/main/MinAV"))()
  end
})

    Tabs.Main1:AddButton({
    Title="Astral Hub",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/Overgustx2/Main/refs/heads/main/BloxFruits_25.html"))()
  end
})

    Tabs.Main1:AddButton({
    Title="Vocano Hub",
    Description="",
    Callback=function()
	  loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/indexeduu/BF-NewVer/refs/heads/main/V3New.lua"))()
  end
})

    Tabs.Main1:AddButton({
    Title="Banana Hub Free",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/Banana-Hub/refs/heads/main/Banana-Free.lua"))()
  end
})

    Tabs.Main1:AddButton({
    Title="Maru Hub Free",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/KimP/refs/heads/main/MaruHub"))()
  end
})

    Tabs.Main1:AddButton({
    Title="Rubu Hub English (Menu Redz)",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/RubuRoblox/refs/heads/main/RubuRz"))()
  end
})

    Tabs.Main1:AddButton({
    Title="Rubu Hub Tiếng Việt (Menu Redz)",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/RubuRoblox/refs/heads/main/RuBuRzVn"))()
  end
})

    Tabs.Main1:AddButton({
    Title="Xeter Hub V1",
    Description="",
    Callback=function()
	  getgenv().Version = "V1"
loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Loader/main/Xeter.lua"))()
  end
})

    Tabs.Main1:AddButton({
    Title="Rubu Hub V4",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/Bubu2k/Rubutv/refs/heads/main/RuBuV4.lua"))()
  end
})

Tabs.Main1:AddButton({
    Title="Xeter Hub V2",
    Description="",
    Callback=function()
    getgenv().Version = "V2"  loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Loader/main/Xeter.lua"))()
  end
})

Tabs.Main1:AddButton({
    Title="Tuấn Anh IOS Hub Premium",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS.lua"))()
  end
})

Tabs.Main1:AddButton({
    Title="Xero Hub V1",
    Description="",
    Callback=function()
	  getgenv().Team = "Marines"
getgenv().Hide_Menu = false
getgenv().Auto_Execute = false
loadstring(game:HttpGet("https://raw.githubusercontent.com/Xero2409/XeroHub/refs/heads/main/main.lua"))()
  end
})

Tabs.Main1:AddButton({
    Title="Xero Hub V2",
    Description="",
    Callback=function()
	  getgenv().Version = "V2"
 loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Loader/main/Xeter.lua"))()
  end
})

Tabs.Main1:AddButton({
    Title="BlueX Hub",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/refs/heads/main/Main.lua"))()
  end
})

Tabs.Main1:AddButton({
    Title="Cokka Hub",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet"https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/CokkaHub.lua")()
  end
})

Tabs.Main1:AddButton({
    Title="Tsuo Hub",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/Tsuo7/TsuoHub/main/Tsuoscripts"))()
  end
})

Tabs.Main1:AddButton({
    Title="Zinner Hub",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/HoangNguyenk8/Roblox/refs/heads/main/BF-Main.luau"))()
  end
})

Tabs.Main1:AddButton({
    Title="Master Hub",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/obfmoonsec/Masterhub/refs/heads/main/obf"))()
  end
})

Tabs.Main1:AddButton({
    Title="Hiru Hub V2",
    Description="",
    Callback=function()
	  getgenv().Team = "Pirates"
loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaStupid/Source/main/HiruHubVeriV2.lua"))()
  end
})

Tabs.Main1:AddButton({
    Title="Marry Hub",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://github.com/MerrySubs4t/Softwork/blob/main/Fetching/dll?raw=true"))()
  end
})

Tabs.Main2:AddButton({
    Title="Skull Hub V2",
    Description="",
    Callback=function()
	  getgenv().SH_Settings = {
        ["MainConfig"] = {
            ["Enable Farm"] = true,
            ["Version Farm"] = "1", -- Version 1 Very Fast 2 Slow But Safe
            ["Sniper Legendary Item"] = false
        },
        ["Settings"] = {
            ["Choose Team"] = "Marines",
            ["White Screen"] = false,
            ["Reset Anti Detect"] = true,
            ["Time Checker"] = 300, -- Check Time For Next Server
            ["Hop 2"] = false,
            ["Webhook"] = {
                ["Enable Webhook"] = false,
                ["Link"] = "", -- Discord Webhook Link
                ["Thumbnail"] = "",
                ["Lock Beli"] = 1000000000,
                ["Ping User ID"] = "everyone" -- Only ID
            }
        },
        ["FruitSniper"] = {
            ["Enable Sniper Fruit"] = true,
            ["Fruit"] = {
                "Leopard-Leopard",
                "Kitsune-Kitsune",
                "Dragon-Dragon",
                "Yeti-Yeti"
            }
        },
        ["Legendary Sword"] = {
            ["Enable Auto Buy"] = true
        },
        ["Aura Haki"] = {
            ["Enable Auto Buy"] = true
        }
    }
loadstring(game:HttpGet("https://raw.githubusercontent.com/xxhumggxx/SkullHub/refs/heads/main/ChestV2.lua"))()
  end
})

Tabs.Main2:AddButton({
    Title="Vxeze Hub ",
    Description="",
    Callback=function()
	  getgenv().config = {
    Setting = {
        ["Team"] = "Marines",         --Pirates\Marines
        ["Disabled Notify"] = false,
        ["Boots FPS"] = false,
        ["White Screen"] = false,
        ["No Stuck Chair"] = true, 
        ["Auto Rejoin"] = true,
    },
    ChestFarm = {
        ["Start Farm Chest"] = true,
        ["Stop When Have Item"] = true, 
    },
    Webhook = {
        ["Webhook Url"] = "",
        ["Send Webhook"] = true,
    },
}loadstring(game:HttpGet("https://raw.githubusercontent.com/Dex-Bear/Vxezehub/refs/heads/main/VxezeHubAutoChest.lua"))()
  end
})

Tabs.Main3:AddButton({
    Title="RoyX Hub Premium",
    Description="LƯU Ý: Script Này Sẽ Tự Động Ăn Một Trái Hệ Logia Để Farm Dễ Hơn Nên Anh Em Không Nên Bật Ở Acc Chính Hay Các Acc Có Trái Xịn Kẻo Mất Trái!!! Anh Em Nên Bật Ở Acc Lv 1 Hoặc Acc Cùi Thì Nó Sẽ Farm Lv Và Lấy Godhuman,Đồ Vip ... Nha",
    Callback=function()
	  getgenv().ConfigsKaitun = {
["Safe Mode"] = false, -- Will be pass all anti cheat (but slow farm)
["Melee"] = {
["Death Step"] = true,
["Electric Claw"] = true,
["Dragon Talon"] = true,
["Sharkman Karate"] = true,
["Superhuman"] = true,
["God Human"] = true,
},
["Sword"] = {
-- : World 1
["Saber"] = true,
["Pole"] = true,
-- : World 2
["Midnight Blade"] = true,
["Shisui"] = true,
["Saddi"] = true,
["Wando"] = true,
["Rengoku"] = true,
["True Triple Katana"] = true,
-- : World 3
["Yama"] = true,
["Tushita"] = true,
["Canvander"] = true,
["Buddy Sword"] = true,
["Twin Hooks"] = true,
["Hallow Scythe"] = true,
["Cursed Dual Katana"] = true,
},
["Gun"] = {
-- : World 2
["Kabucha"] = false,
-- : World 3
["Venom Bow"] = true,
["Skull Guitar"] = true,
},
["Mastery"] = {
["Melee"] = true,
["Sword"] = true,
["Devil Fruits"] = false,
["Configs"] = {
["Selected All Sword"] = true,
["Select Sword"] = {"Cursed Dual Katana"},
}
},
["Race"] = {
["v2"] = true,
["v3"] = true,
["Locked"] = {
["Mink"] = true,
["Human"] = true,
["Skypiea"] = true,
["Fishman"] = false,
},
},
["Fruit"] = {
["Main Fruit"] = {"Dragon-Dragon"},
["Sec Fruit"] = {"Dragon-Dragon"},
["Safe Fruit"] = {
"Dough-Dough",
"Dragon-Dragon"
},
},
["Quest"] = {
["Rainbow Haki"] = true,
["Pull Lever"] = true,
["Musketeer Hat"] = true,
["Dough Mirror"] = true,
["Shark Anchor"] = {
["Enable"] = false,
["Money"] = 25_000_000,
},
},
["Currency"] = {
["Lock Fragment"] = 25_000,
},
["Performance"] = {
["White Screen"] = false,
["Booster FPS"] = false,
["Lock FPS"] = 240,
["AFK Timeout"] = 150,
},
}
loadstring(game:HttpGet("https://api.realaya.xyz/v1/files/l/73mkp0aqyfo4ypy8hvl0nz10lq49fey5.lua"))()
  end
})

Tabs.Main3:AddButton({
    Title="Quartyz Hub",
    Description="Phải Get Key",
    Callback=function()
	  getgenv().Mode = "OneClick"
getgenv().Setting = {
    ["Team"] = "Pirates", -- Options "Pirates", "Marines"
    ["FucusOnLevel"] = true,
    ["Fruits"] = {  -- setting for fruits u want
        ["Primary"] = { -- if current fruit is not in this list, eat/buy
            "Dough-Dough",
            "Dragon-Dragon",
            "Buddha-Buddha",
            -- u can configs add mores/remove and must end with , (comma symbol)
        },
        ["Normal"] = { -- it just a normal fruit list
            "Flame-Flame",
            "Light-Light",
            "Magma-Magma",
            -- u can configs add mores/remove and must end with , (comma symbol)
        }
        -- run this for get all fruit name `local t={};for _,v in pairs(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("GetFruits"))do table.insert(t,`"{v.Name}"`)end;setclipboard(table.concat(t, "\n"))`
    },
    ["IdleCheck"] = 150, -- every (x) seconds if not moving rejoin
};
loadstring(game:HttpGet("https://raw.githubusercontent.com/xQuartyx/QuartyzScript/main/Loader.lua"))()
  end
})

Tabs.Main4:AddButton({
    Title="W-WB Hub (Rip_indra)",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/skibidip1/Hack/refs/heads/main/Rip_indra"))()
  end
})

Tabs.Main4:AddButton({
    Title="W-WB Hub (Tyrant)",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/skibidip1/Hack/refs/heads/main/Tyrant%20of%20the%20Skies"))()
  end
})

Tabs.Main4:AddButton({
    Title="Teddy Hub",
    Description="Key Là: teddyhubhopbossnew",
    Callback=function()
	  repeat task.wait() until game:IsLoaded() and game:GetService("Players") and game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("PlayerGui")
loadstring(game:HttpGet("https://raw.githubusercontent.com/Teddyseetink/Haidepzai/refs/heads/main/TEDDYHUB-FREEMIUM"))()
  end
})

Tabs.Main4:AddButton({
    Title="GreenZ Hub",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaAnarchist/GreenZ-Hub/refs/heads/main/KaitunDoughKing.lua"))()
  end
})

Tabs.Main5:AddButton({
    Title="Van Thanh IOS Hub",
    Description="Có Cả Aimbot",
    Callback=function()
	  loadstring(Game:HttpGet("https://raw.githubusercontent.com/VanThanhIOS/OniiChanVanThanhIOS/refs/heads/main/oniichanpakavanthanhios"))()
  end
})

Tabs.Main5:AddButton({
    Title="Tuan Anh IOS Hub",
    Description="Có Cả Aimbot",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/AimBotSkibidi/refs/heads/main/TuanAnhIOS-AIMBOT.Lua"))()
  end
})

Tabs.Main6:AddButton({
    Title="Ace Hub",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/Totocoems/Ace/main/Ace"))()
  end
})

Tabs.Main6:AddButton({
    Title="Presets Hub",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/Aepione/Prensado/refs/heads/main/Prensado%20camlock"))()
  end
})

Tabs.Main6:AddButton({
    Title="Blox On Hub",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/brosula123/CAMLOCK/main/SKIBIDI"))()
  end
})

Tabs.Main6:AddButton({
    Title="Camlock On Hub",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/HomeMadeScripts/Camlock-aimlock/main/obf_Wxr6QgzF76G1y2Ch77KN4Zt5Nz0A6GIl61gitv3mRR2t3V103al5d0g26s4KY04r.lua.txt"))()
  end
})

Tabs.Main7:AddButton({
    Title="Bluex Hub",
    Description="",
    Callback=function()
	  getgenv().Config = {
    ["Misc"] = {
        ["RandomFruits"] = true,
        ["BlackScreen"] = false,
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/refs/heads/main/FindFruits.lua"))()
  end
})

Tabs.Main7:AddButton({
    Title="Alchemy Hub",
    Description="",
    Callback=function()
	  _G.FruitFinder = true;
loadstring(game:HttpGet("https://scripts.alchemyhub.xyz"))()
  end
})

Tabs.Main7:AddButton({
    Title="Lion Hub",
    Description="",
    Callback=function()
	  getgenv().Config = {

Team = {

SelectTeam = "Marines"

},

BuyFruit = {

SelectFruit = {"Kitsune-Kitsune"},

BuySelected = false,

BuyRandom = true

},

Tween = {

TweenFruit = true,

SkipIfOwned = true,

StoreFruit = true

},

Shop = {

BuyZoroSword = false,

BuyHakiColor = false

},

Misc = {

SendWebhook = true,

WebhookURL = "your webhook",

DisableEffects = true

}

}

loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d734d024f3000caddd23122da89a6c3e.lua"))()
  end
})

Tabs.Main8:AddButton({
    Title="Turbo Lite Hub",
    Description="Game Nào Cũng Bật Được",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/TurboLite/Script/main/FixLag.lua"))()
  end
})

Tabs.Main9:AddButton({
    Title="Shade Hub",
    Description="Game Nào Cũng Bật Được",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/pshade-ultimate/refs/heads/main/src/cd.lua"))()
  end
})

Tabs.Main10:AddButton({
    Title = "Bạn Gặp Lỗi 🤨",
    Description = "Nếu Bạn Gặp Bất Kì Lỗi Script Nào Thì Hãy Nhắn Vào Tik Tok: @hnc_roblox Hoặc Discord Của HNC Để Được Tư Vấn Và Sửa Lỗi Nhé!!!",
    Callback = function()
        setclipboard("https://discord.gg/zjHtFXZx")
    end
})

Tabs.Main10:AddButton({
    Title = "Link Tik Tok👇👇👇",
    Description = "Nhấn Vào Đây Để Coppy Link Tik Tok",
    Callback = function()
        setclipboard("https://www.tiktok.com/@hnc_roblox")
    end
})

Tabs.Main10:AddButton({
    Title = "Link Discord👇👇👇",
    Description = "Nhấn Vào Đây Để Coppy Link Discord",
    Callback = function()
        setclipboard("https://discord.gg/zjHtFXZx")
    end
})