SMODS.Joker {
	key = 'stone_cat',
	rarity = 1,
	nyanko_rarity = NYANKO_RARITY.RARE,
	pools = { nyankatro_gacha = false},
	blueprint_compat = false,
	atlas = 'Nyanko',
	pos = { x = 0, y = 5 },
	cost = 4,
	calculate = function(self, card, context)
		if context.before and not context.blueprint and G.GAME.current_round.hands_played == 0 then
			local last_card = context.scoring_hand[#context.scoring_hand]
			if not last_card:is_face() then return end
			last_card:set_ability('m_stone', nil, false)
			G.E_MANAGER:add_event(Event({
				func = function()
					last_card:juice_up()
					return true
				end
			}))
		end
	end,
}
