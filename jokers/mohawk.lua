SMODS.Joker {
	key = 'mohawk_cat',
	config = { extra = { mult = 4 } },
	rarity = 1,
	nyanko_rarity = NYANKO_RARITY.BASIC,
	atlas = 'Nyanko',
	pos = { x = 0, y = 0 },
	cost = 3,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult
			}
		end
	end
}
