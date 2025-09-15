SMODS.Joker {
	key = 'eraser_cat',
	config = { extra = { chips = 30 } },
	rarity = 1,
	atlas = 'Nyanko',
	pos = { x = 1, y = 0 },
	cost = 3,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
				chip_mod = card.ability.extra.chips
			}
		end
	end
}
