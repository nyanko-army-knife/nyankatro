SMODS.Joker {
	key = 'manic_macho_legs_cat',
	config = { extra = { hands = 0, hands_inc = 1 } },
	rarity = 2,
	nyanko_rarity = NYANKO_RARITY.SUPER_RARE,
	pools = { nyankatro_gacha = false },
	atlas = 'Nyanko',
	pos = { x = 3, y = 12 },
	cost = 5,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.hands, card.ability.extra.hands_inc } }
	end,
	calculate = function(self, card, context)
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			if context.beat_boss and card.ability.extra.hands > 1 then
				G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
				card.ability.extra.hands = 0
				return {
					message = localize('k_reset'),
					colour = G.C.BLUE
				}
			else
				card.ability.extra.hands = card.ability.extra.hands + card.ability.extra.hands_inc
				G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands_inc
			end
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
	end,
}
