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
	self.s = FW.Settings[self.name] or FW.Settings;
	-- lock it
	self.s.lock = true
	if FW.Settings.GlobalFrameNames then
		_G["FX_"..self.name] = self;
	end
	if self.s.Enable then
		self:EnableMouse(not self.s.lock);
		self:SetAlpha(self.s.alpha);
		self:SetScale(self.s.scale);

		self.back:SetTexture(self.s.Texture);
		self.back:SetVertexColor(unpack(self.s.BarColor));
		FW:SetBackdrop(self,unpack(self.s.Backdrop));
		self:SetBackdropColor(unpack(self.s.BgColor));
		self:SetBackdropBorderColor(unpack(self.s.BgColor));
			
		--[[if self.s.Vertical then
			self:SetWidth(self.s.Height+self.s.Backdrop[6]*2);
			self:SetHeight(self.s.Width+self.s.Backdrop[6]*2);
			self.back:SetTexCoord(1,0, 0,0, 1,1, 0,1);
		else]]
			--self:SetWidth(self.s.Width+self.s.Backdrop[6]*2);
			self:SetWidth(TukuiDB:Scale(ActionBarBackground:GetWidth() - 2))
			self:SetHeight(self.s.Height+self.s.Backdrop[6]*2);
			self.s.Width = self:GetWidth()
			self.s.x = 615
			self.s.y = 37
			self.back:SetTexCoord(0,0, 0,1, 1,0, 1,1);
		--end	
		for b, bar in ipairs(self.bars) do
			bar:Update();
		end
		self:SetTimeTags();
		--FW:CorrectPosition(self);
		self:SetFrameStrata(FW.Settings.CooldownStrata);
		self:Show();
	else
		self:Hide();
	end
	self:SetPoint("TOPLEFT", ActionBarBackground, "TOPLEFT", TukuiDB:Scale(1), TukuiDB:Scale(-2))
end

local frame2 = FW:GetFrame("Timer")
frame2.Update_ = frame2.Update
frame2.Update = function(self)
	self:Update_(self)
	self:EnableMouse(false)
	self:SetWidth(oUF_Tukz_player:GetWidth())
	self:SetPoint("BOTTOMLEFT", oUF_Tukz_player, "TOPLEFT", 0, TukuiDB:Scale(5))
end
