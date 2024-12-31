local addonName, addonTable = ...

local GBidRaidAssist = LibStub("AceAddon-3.0"):NewAddon("GBidRaidAssist", "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0")
local GBidRaidAssistGUI = LibStub("AceGUI-3.0")
local GBidRaidAssistDB = LibStub("AceDB-3.0")
local LDB = LibStub("LibDataBroker-1.1")
local LDBIcon = LibStub("LibDBIcon-1.0")

local GBidRaidAssistLDB = LDB:NewDataObject("GBidRaidAssist", {
    type = "launcher",
    text = "GBidRaidAssist",
    icon = "Interface\\AddOns\\GBidRaidAssist\\gbrm.tga",
    OnClick = function(_, button)
        if button == "LeftButton" then
            GBidRaidAssist:ToggleMainFrame()
        elseif button == "RightButton" then
            GBidRaidAssist:OpenSettings()
        end
    end,
    OnTooltipShow = function(tooltip)
        tooltip:AddLine("Loot Reserves")
        tooltip:AddLine("Left-click: Open main frame", 1, 1, 1)
        tooltip:AddLine("Right-click: Open settings", 1, 1, 1)
    end,
})


function GBidRaidAssist:OnInitialize()
    self.db = GBidRaidAssistDB:New("GBidRaidAssistDB", {
        profile = {
            minimap = { hide = false },
        }
    }, true)

    if not LDBIcon:IsRegistered("GBidRaidAssist") then
        LDBIcon:Register("GBidRaidAssist", GBidRaidAssistLDB, self.db.profile.minimap)
    end
    LDBIcon:Refresh("GBidRaidAssist", self.db.profile.minimap)

    --self:CreateMainFrame()
    --self:RegisterChatCommand("rdrop", "ClearAllReserves")
    --self:RegisterChatCommand("rshow", "ShowFrame")
    --self:RegisterChatCommand("rannounce", "AnnounceReserves")
    --self:RegisterChatCommand("showmembers", "ShowMembersReservations")
    --self:RegisterChatCommand("showreserves", "ShowReservedItems")
    --self:RegisterEvent("CHAT_MSG_WHISPER")
end


function GBidRaidAssist:ToggleMainFrame()
    --if self.frame and self.frame:IsShown() then
    --    self.frame:Hide()
    --else
    --    self.frame:Show()
    --end
    print("aaaaa")
end

function GBidRaidAssist:OpenSettings()
    print("Settings menu would open here (to be implemented).")
end

function GBidRaidAssist:ToggleMinimapIcon()
    local shouldHide = not self.db.profile.minimap.hide
    self.db.profile.minimap.hide = shouldHide
    if shouldHide then
        LDBIcon:Hide("LootReserves")
    else
        LDBIcon:Show("LootReserves")
    end
end

LootReserves:OnInitialize()