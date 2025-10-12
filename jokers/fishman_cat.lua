SMODS.Joker {
	key = "fishman_cat",
	blueprint_compat = false,
	rarity = 2,
	nyanko_rarity = NYANKO_RARITY.SUPER_RARE,
	cost = 7,
	atlas = 'Nyanko',
	pos = { x = 1, y = 8 },
	calculate = function(self, card, context)
		if not context.selling_self or context.blueprint then return end
		for _, playing_card in ipairs(G.hand.cards) do
			if playing_card:is_face() then
				SMODS.destroy_cards(playing_card, false, true)
			end
		end
		G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + 2
	end
}
