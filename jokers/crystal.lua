SMODS.Joker {
	key = "crystal_cat",
	blueprint_compat = false,
	rarity = 1,
	nyanko_rarity = NYANKO_RARITY.RARE,
	atlas = 'Nyanko',
	cost = 7,
	pos = { x = 2, y = 7 },
	loc_vars = function(_, info_queue, _)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
	end,
	calculate = function(_, _, context)
		if not context.before or context.blueprint then return end
		if #context.scoring_hand ~= 1 then return end

		local card = context.scoring_hand[1]
		card:set_ability('m_glass', nil, true)
		G.E_MANAGER:add_event(Event({
			func = function()
				card:juice_up()
				return true
			end
		}))

		return {
			message = 'Glass!',
		}
	end
}
