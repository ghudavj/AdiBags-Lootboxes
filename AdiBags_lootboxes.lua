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
	137560, 146747,	151464,	154903, 157822, -- Dreamweaver 7.3.5
	137563, 146750,	151467,	154906, 157825,	-- Farondis 7.3.5
	137561, 146748,	151465,	154904, 157823, -- Highmountain 7.3.5
	141350, 146753,	151470,	154909, 157828,	-- Kirin Tor 7.3.5
	137564, 146751,	151468,	154907, 157826,	-- Nightfallen 7.3.5
	137562, 146749,	151466,	154905,	157824,	-- Valarjar 7.3.5
	137565, 146752,	151469,	154908, 157827,	-- Warden 7.3.5
					152652,	154912, 157829,	-- Army of the Light 7.3.5
					152650,	154911,	157831,	-- Argussian Reach 7.3.5
	173372,									-- Black Empire Assault 8.3
	174961,									-- Amathet Assault 8.3
	174960,									-- Aqir Assault 8.3
	174958,									-- Mogu Assault 8.3	
	174959,									-- Endless Swarm Assault 8.3

}

local legionfall = {
	147384,		-- Legionfall 7.2
	151471,		-- Legionfall 7.2.5
	152649,		-- Legionfall 7.3
	154910,		-- Legionfall 7.3.2
	157830,		-- Legionfall 7.3.5
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
	166294,		-- Storm's Wake 8.0
	166300,		-- 7th Legion 8.0
	166297,		-- Order of Embers 8.0
	166295,		-- Proudmoore Admiralty 8.0
	166282,		-- Talanji's Expedition 8.0
	166299,		-- Honorbound 8.0
	166290,		-- Voldunai 8.0
	166292,		-- Zandalari Empire 8.0
	166245,		-- Tortollan 8.0
	166298,		-- Champion of Azeroth 8.0
	169940,		-- Unshackled 8.2
	169939,		-- Ankoan 8.2
	170061,		-- Rustbolt 8.2
	174484,		-- Uldum Accord 8.3
	174483,		-- Rajani 8.3
}

local roguebox = {
-- Miscellaneous/Junk
	186161,
	186160,
	180533,
	180532,
	180522,
	179311,
	169475,
	121331,
-- Miscellaneous/Other
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

local shadowlandsMisc = {
	187577,
	187576,
	187575,
	187574,
	187573,
	187572,
	187571,
	187570,
	187569,
	187503,
	187440,
	187354,
	187346,
	187278,
	187221,
	187182,
	187029,
	187028,
	186971,
	186970,
	186708,
	186707,
	186706,
	186705,
	186693,
	186692,
	186691,
	186690,
	186688,
	186680,
	186650,
	186533,
	186531,
	185972,
	185906,
	184869,
	184868,
	184843,
	184812,
	184811,
	184648,
	184647,
	184646,
	184645,
	184644,
	184643,
	184642,
	184641,
	184640,
	184639,
	184638,
	184637,
	184636,
	184635,
	184634,
	184633,
	184632,
	184631,
	184630,
	184589,
	184522,
	184444,
	184158,
	184048,
	184047,
	184046,
	184045,
	183703,
	183702,
	183701,
	183699,
	182591,
	182590,
	181767,
	180989,
	180988,
	180985,
	180984,
	180983,
	180981,
	180980,
	180979,
	180977,
	180976,
	180975,
	180974,
	180875,
	180649,
	180648,
	180647,
	180646,
	180442,
	180386,
	180380,
	180379,
	180378,
	180355,
	180085,
	178969,
	178968,
	178967,
	178966,
	178965,
	178513,
	178078,
	175095,
	174652,
	171211,
	171210,
	171209
}

local shadowlandsCons = {
	187817,
	187551,
	187543,
	187502,
	187494,
	187351,
	187254,
	187222,
	186196,
	185993,
	185992,
	185991,
	185990,
	185834,
	185833,
	185832,
	185765,
	184627,
	184395,
	184103,
	183886,
	183885,
	183884,
	183883,
	183882,
	183429,
	183428,
	183426,
	183424,
	181741,
	181739,
	181733,
	181732,
	181557,
	181556,
	181476,
	181475,
	181372,
	180128,
	179380
}

local holidays = {
	104319,
	116761,
	116762,
	117392,
	117393,
	117394,
	17685,
	17726,
	17727,
	21191,
	21216,
	21270,
	21271,
	21310,
	21327,
	21363,
	21640,
	21812,
	21975,
	21979,
	21980,
	21981,
	22154,
	22155,
	22156,
	22157,
	22158,
	22159,
	22160,
	22161,
	22162,
	22163,
	22164,
	22165,
	22166,
	22167,
	22168,
	22169,
	22170,
	22171,
	22172,
	22178,
	23022,
	34426,
	37586,
	43504,
	45072,
	46740,
	49909,
	50160,
	50161,
	54516,
	54535,
	54537,
	67443,
	70931,
	70938,
	73792,
	90892,
	93626
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

	if self.db.profile.moveShadowlandsMisc then
		AddToSet(Result, shadowlandsMisc)
	end

	if self.db.profile.moveShadowlandsCons then
		AddToSet(Result, shadowlandsCons)
	end

	if self.db.profile.moveHolidays then
		AddToSet(Result, holidays)
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
setFilter.uiDesc = N["Emissary chests, N'Zoth Assault, Legionfall Recompense bags, Paragon chests and Rogue lockboxes."]

function setFilter:OnInitialize()
	self.db = AdiBags.db:RegisterNamespace("Chests and Bags", {
		profile = {
			moveLegionfall = true,
			moveParagon = true,
			moveShadowlandsMisc = true,
			moveShadowlandsCons = true,
			moveHolidays = true,
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
		moveShadowlandsCons = {
			name  = N["Shadowlands Consumables"],
			desc  = N["Show Shadowlands Consumables chests in this group."],
			type  = "toggle",
			order = 24
		},
		moveShadowlandsMisc = {
			name  = N["Shadowlands Miscellaneous"],
			desc  = N["Show Shadowlands Miscellaneous chests in this group."],
			type  = "toggle",
			order = 25
		},
		moveHolidays = {
			name  = N["Holidays"],
			desc  = N["Show Holidays chests in this group."],
			type  = "toggle",
			order = 26
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
