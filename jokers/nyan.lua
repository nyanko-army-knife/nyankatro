SMODS.Joker {
	key = 'nyan_cat',
	config = { extra = { mult = 4 } },
	rarity = 4,
	nyanko_rarity = NYANKO_RARITY.LEGEND_RARE,
	pools = { nyankatro_gacha = false },
	atlas = 'Nyanko',
	pos = { x = 0, y = 6 },
	cost = 10,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			hand_chips = mod_chips(mult * hand_chips)
			mult = mod_mult(4)
			return {
				message = "Nyan!",
				colour = G.C.PURPLE
			}
		end
	end
}
