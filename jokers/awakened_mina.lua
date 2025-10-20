SMODS.Joker {
	key = 'awakened_mina',
	config = { extra = { mult_gain = 4, mult = 0 } },
	rarity = 1,
	nyanko_rarity = NYANKO_RARITY.SPECIAL,
	atlas = 'Nyanko',
	pools = { nyankatro_gacha = false },
	pos = { x = 1, y = 7 },
	cost = 5,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult_gain, card.ability.extra.mult } }
	end,
	calculate = function(self, card, context)
		if context.before and not context.blueprint and (next(context.poker_hands['Flush']) or next(context.poker_hands['Straight Flush'])) then
			-- TODO - check if hand contains flush instead
			card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.RED
			}
		end
		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end
	end
}
