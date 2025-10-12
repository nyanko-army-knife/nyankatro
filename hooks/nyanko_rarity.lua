local json = dofile(SMODS.current_mod.path .. 'scripts/json.lua')

NYANKO_RARITIES = {
	[1] = { name = "Basic", colour_bg = G.C.GREY, colour_fg = G.C.WHITE },
	[2] = { name = "Special", colour_bg = G.C.MONEY, colour_fg = G.C.WHITE },
	[3] = { name = "Rare", colour_bg = G.C.BLUE, colour_fg = G.C.WHITE },
	[4] = { name = "Super Rare", colour_bg = G.C.GREEN, colour_fg = G.C.WHITE },
	[5] = { name = "Uber Rare", colour_bg = G.C.RED, colour_fg = G.C.WHITE },
	[6] = { name = "Legend Rare", colour_bg = G.C.PURPLE, colour_fg = G.C.WHITE },
}

NYANKO_RARITY = {
	BASIC = 1,
	SPECIAL = 2,
	RARE = 3,
	SUPER_RARE = 4,
	UBER_RARE = 5,
	LEGEND_RARE = 6
}



local pre__card_type_badge = SMODS.Joker.set_card_type_badge
function SMODS.Joker.set_card_type_badge(self, card, _badges)
	if pre__card_type_badge ~= nil then return pre__card_type_badge(self, card, _badges) end
	local badges = {}

	if self.nyanko_rarity ~= nil then
		local r = NYANKO_RARITIES[self.nyanko_rarity]
		badges[#badges + 1] = create_badge(r.name, r.colour_bg, r.colour_fg, 1.2)
	end

	for i, item in ipairs(badges) do
		_badges[i] = item
	end
end

-- local pre__index = SMODS.Joker.__index
-- SMODS.Joker.__index = function(t, k)
-- 	-- if k == "create_card_type_badge" then
-- 	-- 	local badges = {}

-- 	-- 	if rawget(t, "nyanko_rarity") ~= nil then
-- 	-- 		badges[#badges + 1] = create_badge(rawget(t, "nyanko_rarity"), "FFBB33", nil, 1.2)
-- 	-- 	end

-- 	-- 	if #badges > 0 then return badges end
-- 	-- end
-- 	return pre__index(t, k)
-- end

-- local mt = getmetatable(SMODS.Joker)
-- local pre__index = mt.__index
-- mt.__index = function(t, k)
-- 	sendInfoMessage(json.encode(k))
-- 	return rawget(t, k)
-- end
-- setmetatable(SMODS.Joker, mt)

-- pre__merge_defaults = SMODS.merge_defaults

-- function SMODS.merge_defaults(t, defaults)
-- 	sendInfoMessage(json.encode(t))
-- 	local badges = {}

-- 	if t.nyanko_rarity ~= nil then
-- 		sendInfoMessage("here?")
-- 		badges[#badges + 1] = create_badge(t.nyanko_rarity, "FFBB33", nil, 1.2)
-- 	end

-- 	if #badges > 0 then
-- 		sendInfoMessage("here")
-- 		t.set_card_type_badge = function(self, card, badges_)
-- 			sendInfoMessage("here!!")
-- 			badges_[1] = badges[1]
-- 		end
-- 	end
-- 	return pre__merge_defaults(t, defaults)
-- end
