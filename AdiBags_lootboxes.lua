-- AdiBags_lootboxes - Adds various chests to AdiBags virtual groups

local addonName, addon = ...
local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")

local N = addon.N
local MatchIDs
local MatchIDs2
local Tooltip
local Result = {}
local Result2 = {}

local function AddToSet(Set, List)
	for _, v in ipairs(List) do
		Set[v] = true
	end
end

local emissary = {
	146747,		-- Dreamweaver 7.2
	151464,		-- Dreamweaver 7.2.5
	146750,		-- Farondis 7.2
	151467,		-- Farondis 7.2.5
	146748,		-- Highmountain 7.2
	151465,		-- Highmountain 7.2.5
	146753,		-- Kirin Tor 7.2
	151470,		-- Kirin Tor 7.2.5
	146751,		-- Nightfallen 7.2
	151468,		-- Nightfallen 7.2.5
	146749,		-- Valarjar 7.2
	151466,		-- Valarjar 7.2.5
	146752,		-- Warden 7.2
	151469,		-- Warden 7.2.5
	152652,		-- Army of the Light 7.3
	152650,		-- Argussian Reach 7.3
}

local legionfall = {
	147384,		-- Legionfall 7.2
	151471,		-- Legionfall 7.2.5
	152649,		-- Legionfall 7.3
}
local paragon = {
	146897,		-- Farondis 7.2
	152102,		-- Farondis 7.2.5
	146900,		-- Nightfallen 7.2
	152105,		-- Nightfallen 7.2.5
	147361,		-- Legionfall 7.2
	152108,		-- Legionfall 7.2.5
	146902,		-- Warden 7.2
	152107,		-- Warden 7.2.5
	146901,		-- Valarjar 7.2
	152106,		-- Valarjar 7.2.5
	146899,		-- Highmountain 7.2
	152104,		-- Highmountain 7.2.5
	146898,		-- Dreamweaver 7.2
	152103,		-- Dreamweaver 7.2.5
	152923,		-- Army of the Light 7.3
	152922,		-- Argussian Reach 7.3
}

local roguebox = {
	121331,
	116920,
	88567,
	68729,
	45986,
	43624,
	43622,
	31952,
	5760,
	5759,
	5758,
	4638,
	4637,
	4636,
	4634,
	4633,
	4632,
}

local function MatchIDs_Init(self)
	wipe(Result)

	AddToSet(Result, emissary)

	if self.db.profile.moveLegionfall then
		AddToSet(Result, legionfall)
	end

	if self.db.profile.moveParagon then
		AddToSet(Result, paragon)
	end

	return Result
	end

local function MatchIDs2_Init(self)
	wipe(Result2)

	AddToSet(Result2, roguebox)

	if self.db.profile.moveRogueboxes then
		AddToSet(Result2, roguebox)
	end

	return Result2

 end

local function Tooltip_Init()
	local tip, leftside = CreateFrame("GameTooltip"), {}
	for i = 1, 6 do
		local Left, Right = tip:CreateFontString(), tip:CreateFontString()
		Left:SetFontObject(GameFontNormal)
		Right:SetFontObject(GameFontNormal)
		tip:AddFontStrings(Left, Right)
		leftside[i] = Left
	end
	tip.leftside = leftside
	return tip
end

local setFilter = AdiBags:RegisterFilter("Lockboxes and Chests", 96, "ABEvent-1.0")
setFilter.uiName = N["Lockboxes and Chests"]
setFilter.uiDesc = N["Emissary chests, Legionfall Recompense bags, Paragon chests and Rogue lockboxes."]

function setFilter:OnInitialize()
	self.db = AdiBags.db:RegisterNamespace("Chests and Bags", {
		profile = {
			moveLegionfall = true,
			moveParagon = true,
		}
	})
	self.db = AdiBags.db:RegisterNamespace("Rogue Lockboxes", {
		profile = {
			moveRogueboxes = true,
			}
	})
end

function setFilter:Update()
	MatchIDs = nil
	self:SendMessage("AdiBags_FiltersChanged")
end

function setFilter:OnEnable()
	AdiBags:UpdateFilters()
end

function setFilter:OnDisable()
	AdiBags:UpdateFilters()
end

function setFilter:Filter(slotData)
	MatchIDs = MatchIDs or MatchIDs_Init(self)
	MatchIDs2 = MatchIDs2 or MatchIDs2_Init(self)
	if MatchIDs[slotData.itemId] then
		return N["Lockboxes and Chests."]
	end
	if MatchIDs2[slotData.itemId] then
		return N["Rogue Lockboxes"]
	end


	Tooltip = Tooltip or Tooltip_Init()
	Tooltip:SetOwner(UIParent,"ANCHOR_NONE")
	Tooltip:ClearLines()

	if slotData.bag == BANK_CONTAINER then
		Tooltip:SetInventoryItem("player", BankButtonIDToInvSlotID(slotData.slot, nil))
	else
		Tooltip:SetBagItem(slotData.bag, slotData.slot)
	end

	Tooltip:Hide()
end

function setFilter:GetOptions()
	return {
		moveLegionfall = {
			name  = N["Legionfall"],
			desc  = N["Show Legionfall Recompense bags in this group."],
			type  = "toggle",
			order = 10
		},
		moveParagon = {
			name  = N["Paragon"],
			desc  = N["Show Paragon chests in this group."],
			type  = "toggle",
			order = 20
		},
		moveRogueboxes = {
			name  = N["Rogue Lockboxes"],
			desc  = N["Show Rogue lockboxes in seperate group."],
			type  = "toggle",
			order = 30
		},
	},
	AdiBags:GetOptionHandler(self, false, function()
		return self:Update()
	end)
end
