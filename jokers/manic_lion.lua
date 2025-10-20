SMODS.Joker {
	key = 'manic_lion_cat',
	config = { extra = { discs = 0, discs_inc = 1 } },
	blueprint_compat = false,
	rarity = 2,
	nyanko_rarity = NYANKO_RARITY.SUPER_RARE,
	pools = { nyankatro_gacha = false },
	atlas = 'Nyanko',
	pos = { x = 0, y = 13 },
	cost = 5,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.discs, card.ability.extra.discs_inc } }
	end,
	calculate = function(self, card, context)
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			if context.beat_boss and card.ability.extra.discs > 1 then
				G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discs
				card.ability.extra.discs = 0
				return {
					message = localize('k_reset'),
					colour = G.C.RED
				}
			else
				card.ability.extra.discs = card.ability.extra.discs + card.ability.extra.discs_inc
				G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discs_inc
			end
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discs
	end,
}
