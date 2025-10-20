SMODS.Joker {
	key = 'cyborg_cat',
	config = { extra = { chips = 20, mult = 4, cost = 9 } },
	pools = { nyankatro_gacha = true, nyankatro_gacha_rare = true },
	rarity = 1,
	nyanko_rarity = NYANKO_RARITY.RARE,
	atlas = 'Nyanko',
	pos = { x = 0, y = 10 },
	cost = 4,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.cost } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chips = card.ability.extra.chips *
						(math.max(0, (G.GAME.dollars + (G.GAME.dollar_buffer or 0))) / card.ability.extra.cost),
				mult = card.ability.extra.mult *
						(math.max(0, (G.GAME.dollars + (G.GAME.dollar_buffer or 0))) / card.ability.extra.cost)
			}
		end
	end
}
