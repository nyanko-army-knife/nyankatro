SMODS.Joker {
	key = "jester_queen_deale",
	rarity = 3,
	nyanko_rarity = NYANKO_RARITY.UBER_RARE,
	blueprint_compat = false,
	atlas = 'Nyanko',
	pos = { x = 1, y = 9 },
	cost = 8,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
		info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
	end,
	calculate = function(self, _, context)
		if not context.before or context.blueprint then return end

		for _, card in ipairs(context.scoring_hand) do
			if SMODS.has_enhancement(card, 'm_bonus') then
				card:set_ability('m_mult', nil, true)
			elseif SMODS.has_enhancement(card, 'm_mult') then
				card:set_ability('c_base', nil, true)
			elseif not next(SMODS.get_enhancements(card)) then
				card:set_ability('m_bonus', nil, true)
			end
		end
	end
}
