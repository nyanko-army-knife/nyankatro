SMODS.Joker {
	key = "sodom",
	blueprint_compat = true,
	rarity = 3,
	nyanko_rarity = NYANKO_RARITY.UBER_RARE,
	cost = 8,
	atlas = 'Nyanko',
	pos = { x = 3, y = 3 },
	config = { extra = { Xmult = 1.2, h_size = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult, card.ability.extra.h_size } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			return {
				xmult = card.ability.extra.Xmult
			}
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		G.hand:change_size(-card.ability.extra.h_size)
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.hand:change_size(card.ability.extra.h_size)
	end,
}
