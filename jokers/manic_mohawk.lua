SMODS.Joker {
	key = 'manic_mohawk_cat',
	config = { extra = { mult = 8 } },
	rarity = 2,
	nyanko_rarity = NYANKO_RARITY.SUPER_RARE,
	pools = { nyankatro_gacha = false },
	atlas = 'Nyanko',
	pos = { x = 0, y = 12 },
	cost = 6,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	calculate = function(self, card, context)
		if not context.joker_main then return end
		local rarities = {}
		for i = 1, #G.jokers.cards do
			rarities[G.jokers.cards[i].config.center.rarity] = true
		end
		return {
			mult = card.ability.extra.mult * #rarities
		}
	end
}
