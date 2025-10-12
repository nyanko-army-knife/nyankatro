SMODS.Joker {
	key = 'roe_cat',
	config = { extra = { xmult_loss = 0.1, xmult = 1.5 } },
	rarity = 2,
	nyanko_rarity = NYANKO_RARITY.SUPER_RARE,
	atlas = 'Nyanko',
	pos = { x = 0, y = 3 },
	cost = 5,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_loss } }
	end,
	calculate = function(self, card, context)
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			if card.ability.extra.xmult - card.ability.extra.xmult_loss <= 0 then
				SMODS.destroy_cards(card, true, false, true)
				return {
					message = localize('k_eaten_ex'),
					colour = G.C.RED
				}
			else
				card.ability.extra.xmult = card.ability.extra.xmult - card.ability.extra.xmult_loss
				return {
					message = localize { type = 'variable', key = 'a_mult_minus', vars = { card.ability.extra.xmult_loss } },
					colour = G.C.MULT
				}
			end
		end
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult
			}
		end
	end,
}
