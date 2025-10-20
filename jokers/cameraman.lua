SMODS.Joker {
	key = 'cameraman_cat',
	config = { extra = { chips = 80, chips_loss = 5 } },
	pools = { nyankatro_gacha = true, nyankatro_gacha_rare = true },
	rarity = 1,
	nyanko_rarity = NYANKO_RARITY.RARE,
	atlas = 'Nyanko',
	pos = { x = 3, y = 10 },
	cost = 4,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.chips_loss } }
	end,
	calculate = function(self, card, context)
		if context.after and not context.blueprint then
			if card.ability.extra.chips - card.ability.extra.chips_loss <= 0 then
				SMODS.destroy_cards(card, nil, nil, true)
				return {
					message = localize('k_extinct_ex'),
					colour = G.C.RED
				}
			else
				card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chips_loss
				return {
					message = localize { type = 'variable', key = 'a_chips_minus', vars = { card.ability.extra.chips_loss } },
					colour = G.C.CHIPS
				}
			end
		elseif context.joker_main then
			return {
				mult = card.ability.extra.chips
			}
		end
	end
}
