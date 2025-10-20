SMODS.Joker {
	key = 'cataur',
	config = { extra = { xmult = 0.1, cost = 6 } },
	pools = { nyankatro_gacha = true, nyankatro_gacha_rare = true },
	rarity = 1,
	nyanko_rarity = NYANKO_RARITY.RARE,
	atlas = 'Nyanko',
	pos = { x = 3, y = 11 },
	cost = 5,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, card.ability.extra.cost } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				xmult = 1 + card.ability.extra.xmult *
						(math.max(0, (G.GAME.dollars + (G.GAME.dollar_buffer or 0))) / card.ability.extra.cost)
			}
		end
	end
}
