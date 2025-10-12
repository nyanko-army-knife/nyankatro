SMODS.Joker {
	key = 'lion_cat',
	config = { extra = { discards = 1 } },
	rarity = 1,
	nyanko_rarity = NYANKO_RARITY.BASIC,
	atlas = 'Nyanko',
	pos = { x = 0, y = 4 },
	cost = 3,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.discards } }
	end,
	add_to_deck = function(self, card, from_debuff)
		G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discards
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discards
	end,
}
