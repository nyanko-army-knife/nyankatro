SMODS.Joker {
	key = "lumina",
	rarity = 4,
	nyanko_rarity = NYANKO_RARITY.LEGEND_RARE,
	atlas = 'Nyanko',
	config = { extra = { odds = 4, scale = 0.5 } },
	pos = { x = 2, y = 9 },
	cost = 10,
	loc_vars = function(self, info_queue, card)
		local _, d = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'gaia_the_creator')
		return { vars = { card.ability.extra.scale, d } }
	end,
	calculate = function(self, card, context)
		if context.before and SMODS.pseudorandom_probability(card, 'nyankatro_lumina', 1, card.ability.extra.odds) then
			return {
				level_up = true,
				message = localize('k_level_up_ex')
			}
		end

		if context.joker_main then
			return {
				xmult = G.GAME.hands[context.scoring_name].level * card.ability.extra.scale
			}
		end
	end
}
