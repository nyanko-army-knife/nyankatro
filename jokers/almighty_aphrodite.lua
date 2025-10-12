SMODS.Joker {
	key = "almighty_aphrodite",
	config = { extra = { xmult = 4, target_min = 4, target_max = 2 } },
	rarity = 3,
	nyanko_rarity = NYANKO_RARITY.UBER_RARE,
	atlas = 'Nyanko',
	pos = { x = 3, y = 8 },
	cost = 8,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, card.ability.extra.target_min, card.ability.extra.target_max } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			local ratio = G.GAME.blind.chips / G.GAME.chips
			if card.ability.extra.target_max <= ratio and ratio <= card.ability.extra.target_min then
				return {
					xmult = card.ability.extra.xmult
				}
			end
		end
	end
}
