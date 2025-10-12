SMODS.Joker {
	key = 'awakened_bahamut_cat',
	config = { extra = { chips = 250 } },
	rarity = 3,
	nyanko_rarity = NYANKO_RARITY.SPECIAL,
	atlas = 'Nyanko',
	pos = { x = 3, y = 4 },
	cost = 6,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips } }
	end,
	calculate = function(self, card, context)
		if context.hand_drawn and not context.first_hand_drawn then
			SMODS.destroy_cards({ card })
			return {
				message = "ZORK"
			}
		end
		if context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		end
	end
}
