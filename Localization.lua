-- AdiBags_lootboxes - Adds various chests to AdiBags virtual groups

local addonName, addon = ...

local N = setmetatable({}, {
	__index = function(self, key)
		if key then
			rawset(self, key, tostring(key))
		end
		return tostring(key)
	end,
})
addon.N = N

local locale = GetLocale()

if locale == "ruRU" then
--Translation missing
-- N["Emissary chests, Legionfall Recompense bags and Paragon chests."] = ""
--Translation missing
-- N["Legionfall"] = ""
--Translation missing
-- N["Show Legionfall Recompense bags in this group."] = ""
--Translation missing
-- N["Paragon"] = ""
--Translation missing
-- N["Show Paragon chests in this group."] = ""
--Translation missing
-- N["Emissary, Recompense and Paragon"] = ""

elseif locale == "deDE" then
N["Lockboxes and Chests."] = "Schliesskassetten und Kisten."
N["Legionfall"] = "Legionsrichter"
N["Show Legionfall Recompense bags in this group."] = "Zeigt Anerkennung der Legionsrichter in dieser Gruppe."
N["Paragon"] = "Paragon"
N["Show Paragon chests in this group"] = "Zeigt Paragon Kisten in dieser Gruppe."
N["Lockboxes and Chests"] = "Schliesskassetten und Kisten"
--Translation missing
-- N["Rogue Lockboxes"] = ""
--Translation missing
-- N["Show Rogue lockboxes in this group."] = ""

elseif locale == "itIT" then
--Translation missing
-- N["Emissary chests, Legionfall Recompense bags and Paragon chests."] = ""
--Translation missing
-- N["Legionfall"] = ""
--Translation missing
-- N["Show Legionfall Recompense bags in this group."] = ""
--Translation missing
-- N["Paragon"] = ""
--Translation missing
-- N["Show Paragon chests in this group."] = ""
--Translation missing
-- N["Emissary, Recompense and Paragon"] = ""

elseif locale == "frFR" then
	N["Lockboxes and Chests."] = "Coffres."
	N["Legionfall"] = "Déclin de la Légion"
	N["Show Legionfall Recompense bags in this group."] = "Afficher les coffres du Déclin de la Légion dans ce groupe."
	N["Paragon"] = "Paragon"
	N["Show Paragon chests in this group."] = "Afficher les coffres Paragon dans ce groupe."
	N["Lockboxes and Chests"] = "Coffres"
	N["Rogue Lockboxes"] = "Coffres des Voleurs"
	N["Show Rogue lockboxes in this group."] = "Afficher les coffres des Voleurs dans ce groupe."
	N["Emissary chests, Legionfall Recompense bags, Paragon chests and Rogue lockboxes."] = "Coffres d'émissaire, du Déclin de la Légion, Parangon et de Voleurs."

elseif locale == "koKR" then
--Translation missing
-- N["Emissary chests, Legionfall Recompense bags and Paragon chests."] = ""
--Translation missing
-- N["Legionfall"] = ""
--Translation missing
-- N["Show Legionfall Recompense bags in this group."] = ""
--Translation missing
-- N["Paragon"] = ""
--Translation missing
-- N["Show Paragon chests in this group."] = ""
--Translation missing
-- N["Emissary, Recompense and Paragon"] = ""

elseif locale == "zhCN" then
--Translation missing
-- N["Emissary chests, Legionfall Recompense bags and Paragon chests."] = ""
--Translation missing
-- N["Legionfall"] = ""
--Translation missing
-- N["Show Legionfall Recompense bags in this group."] = ""
--Translation missing
-- N["Paragon"] = ""
--Translation missing
-- N["Show Paragon chests in this group."] = ""
--Translation missing
-- N["Emissary, Recompense and Paragon"] = ""

elseif locale == "ptBR" then
--Translation missing
-- N["Emissary chests, Legionfall Recompense bags and Paragon chests."] = ""
--Translation missing
-- N["Legionfall"] = ""
--Translation missing
-- N["Show Legionfall Recompense bags in this group."] = ""
--Translation missing
-- N["Paragon"] = ""
--Translation missing
-- N["Show Paragon chests in this group."] = ""
--Translation missing
-- N["Emissary, Recompense and Paragon"] = ""

elseif locale == "zhTW" then
--Translation missing
-- N["Emissary chests, Legionfall Recompense bags and Paragon chests."] = ""
--Translation missing
-- N["Legionfall"] = ""
--Translation missing
-- N["Show Legionfall Recompense bags in this group."] = ""
--Translation missing
-- N["Paragon"] = ""
--Translation missing
-- N["Show Paragon chests in this group."] = ""
--Translation missing
-- N["Emissary, Recompense and Paragon"] = ""

elseif locale == "esES" then
--Translation missing
-- N["Emissary chests, Legionfall Recompense bags and Paragon chests."] = ""
--Translation missing
-- N["Legionfall"] = ""
--Translation missing
-- N["Show Legionfall Recompense bags in this group."] = ""
--Translation missing
-- N["Paragon"] = ""
--Translation missing
-- N["Show Paragon chests in this group."] = ""
--Translation missing
-- N["Emissary, Recompense and Paragon"] = ""

elseif locale == "esMX" then
--Translation missing
-- N["Emissary chests, Legionfall Recompense bags and Paragon chests."] = ""
--Translation missing
-- N["Legionfall"] = ""
--Translation missing
-- N["Show Legionfall Recompense bags in this group."] = ""
--Translation missing
-- N["Paragon"] = ""
--Translation missing
-- N["Show Paragon chests in this group."] = ""
--Translation missing
-- N["Emissary, Recompense and Paragon"] = ""


else
-- enUS default
N["Lockboxes and Chests."] = true
N["Legionfall"] = true
N["Show Legionfall Recompense bags in this group."] = true
N["Paragon"] = true
N["Show Paragon chests in this group."] = true
N["Lockboxes and Chests"] = true
N["Rogue Lockboxes"] = true
N["Show Rogue lockboxes in this group."] = true
end

-- Replace remaining true values by their key
for k,v in pairs(N) do
	if v == true then
		N[k] = k
	end
end
