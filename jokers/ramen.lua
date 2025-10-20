SMODS.Joker {
	key = 'ramen_cat',
	config = { extra = { mult = 20, mult_loss = 2 } },
	pools = { nyankatro_gacha = true, nyankatro_gacha_rare = true },
	rarity = 1,
	nyanko_rarity = NYANKO_RARITY.RARE,
	atlas = 'Nyanko',
	pos = { x = 2, y = 10 },
	cost = 4,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.mult_loss } }
	end,
	calculate = function(self, card, context)
		if context.after and not context.blueprint then
			if card.ability.extra.mult - card.ability.extra.mult_loss <= 0 then
				SMODS.destroy_cards(card, nil, nil, true)
				return {
					message = localize('k_extinct_ex'),
					colour = G.C.RED
				}
			else
				card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_loss
				return {
					message = localize { type = 'variable', key = 'a_mult_minus', vars = { card.ability.extra.mult_loss } },
					colour = G.C.MULT
				}
			end
		elseif context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end
	end
}
