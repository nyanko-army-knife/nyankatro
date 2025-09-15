SMODS.Joker {
	key = 'courier_cat',
	config = { extra = { mult = 0, mult_mod = 1 } },
	rarity = 1,
	atlas = 'Nyanko',
	pos = { x = 0, y = 1 },
	cost = 4,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.mult_mod } }
	end,
	calculate = function(self, card, context)
		if (context.cardarea == G.hand and context.individual and not context.end_of_round) and
				(context.other_card:is_face() and (context.other_card:is_suit('Hearts') or context.other_card:is_suit('Diamonds'))) then
			card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
			card_eval_status_text(card, 'extra', nil, nil, nil, {
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult_mod } },
				colour = G.C.IMPORTANT
			})
		elseif context.joker_main then
			return {
				-- message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
				mult_mod = card.ability.extra.mult
			}
		end
	end
}
