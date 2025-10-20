SMODS.Joker {
	key = 'mushroom_cat',
	config = { extra = { chips = 0, chips_mod = 3 } },
	rarity = 1,
	nyanko_rarity = NYANKO_RARITY.RARE,
	pools = { nyankatro_gacha = false },
	atlas = 'Nyanko',
	pos = { x = 3, y = 7 },
	cost = 4,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.chips_mod } }
	end,
	calculate = function(self, card, context)
		if (context.cardarea == G.hand and context.individual and not context.end_of_round) and
				(context.other_card:get_id() >= 2 and context.other_card:get_id() <= 4) and (context.other_card:is_suit('Spades') or context.other_card:is_suit('Clubs')) then
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod

			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.CHIPS
			}
		elseif context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		end
	end
}
