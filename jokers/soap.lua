SMODS.Joker {
	key = 'soap_cat',
	config = { extra = { chips_loss = 20, chips = 120 } },
	rarity = 2,
	nyanko_rarity = NYANKO_RARITY.SUPER_RARE,
	pools = { nyankatro_gacha = false },
	atlas = 'Nyanko',
	pos = { x = 1, y = 3 },
	cost = 5,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.chips_loss } }
	end,
	calculate = function(self, card, context)
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			if card.ability.extra.chips - card.ability.extra.chips_loss <= 0 then
				SMODS.destroy_cards(card, nil, nil, true)
				return {
					message = localize('k_eaten_ex'),
					colour = G.C.BLUE
				}
			else
				card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chips_loss
				return {
					message = localize { type = 'variable', key = 'a_chips_minus', vars = { card.ability.extra.chips_loss } },
					colour = G.C.CHIPS
				}
			end
		end
		if context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		end
	end,
}
