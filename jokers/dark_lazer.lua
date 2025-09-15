SMODS.Joker {
	key = 'dark_lazer',
	config = { extra = { retrigger_odds = 6 } },
	rarity = 1,
	atlas = 'Nyanko',
	pos = { x = 2, y = 0 },
	cost = 4,
	loc_vars = function(self, info_queue, card)
		local n, d = SMODS.get_probability_vars(card, 1, card.ability.extra.retrigger_odds, 'nyankatro_dark_lazer')
		return { vars = { n, d } }
	end,
	calculate = function(self, card, context)
		if (context.repetition and context.cardarea == G.play) and SMODS.pseudorandom_probability(card, 'nyankatro_dark_lazer', 1, card.ability.extra.retrigger_odds) then
			return {
				repetitions = 1
			}
		end
	end
}
