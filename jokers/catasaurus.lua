SMODS.Joker {
	key = 'catasaurus',
	config = { extra = { mult = 15 } },
	pools = { nyankatro_gacha = true, nyankatro_gacha_rare = true },
	rarity = 1,
	nyanko_rarity = NYANKO_RARITY.RARE,
	atlas = 'Nyanko',
	pos = { x = 1, y = 10 },
	cost = 4,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:get_id() == 11 then
			if context.other_card.debuff then
				return {
					message = localize('k_debuffed'),
					colour = G.C.RED
				}
			else
				return {
					mult = card.ability.extra.mult
				}
			end
		end
	end
}
