SMODS.Joker {
	key = "gaia_the_creator",
	rarity = 4,
	nyanko_rarity = NYANKO_RARITY.LEGEND_RARE,
	pools = { nyankatro_gacha = true, nyankatro_gacha_legend_rare = true },
	atlas = 'Nyanko',
	config = { extra = { chips = 250, mult = 50, xmult = 5, money = 10 } },
	pos = { x = 3, y = 9 },
	cost = 10,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.xmult, card.ability.extra.money } }
	end,
	calculate = function(self, card, context)
		if context.joker_main and next(context.poker_hands['Straight Flush']) then
			return {
				chips = card.ability.extra.chips,
				mult = card.ability.extra.mult,
				xmult = card.ability.extra.xmult,
				dollars = card.ability.extra.money,
			}
		end
	end
}
