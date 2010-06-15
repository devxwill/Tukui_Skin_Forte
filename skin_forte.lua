--[[
    ForteXorcist skin for TukUI by Mankar - Runetotem
	Special thanks to Darth Android / Telroth-Black Dragonflight for their Editless Skins
    Skins ForteXorcist default Frames to fit TukUI
]]


if not TukuiDB then return end
local FW = FW
local _G = _G

if FW == nil then return end

local ABResized = false

local function IntegrateActionBar()
	-- Increase the size of the bottom actionBar
	if not ABResized then
		ActionBarBackground:SetHeight(ActionBarBackground:GetHeight() + TukuiDB:Scale(FW:GetFrame("Cooldown"):GetHeight() + 2))
        ABResized = true
        --FW.Frames["Cooldown"]:ClearAllPoints()
        --FW.Frames["Cooldown"]:SetPoint("TOPLEFT", ActionBarBackground, "CENTER", 0, 0)
	end
end

IntegrateActionBar()

local frame1 = FW:GetFrame("Cooldown")
frame1.Update_ = frame1.Update
frame1.Update = function(self)
	self:Update_(self)
	--TukuiDB:SetTemplate(self)
	self:EnableMouse(false)
	self:SetPoint("TOPLEFT", ActionBarBackground, "TOPLEFT", TukuiDB:Scale(1), TukuiDB:Scale(-2))
	self:SetWidth(TukuiDB:Scale(ActionBarBackground:GetWidth() - 2))
end

local frame2 = FW:GetFrame("Timer")
frame2.Update_ = frame2.Update
frame2.Update = function(self)
	self:Update_(self)
	self:EnableMouse(false)
	self:SetWidth(oUF_Tukz_player:GetWidth())
	self:SetPoint("BOTTOMLEFT", oUF_Tukz_player, "TOPLEFT", 0, TukuiDB:Scale(5))
end
