SMODS.Joker {
	key = 'immortal_nobunaga',
	rarity = 3,
	nyanko_rarity = NYANKO_RARITY.UBER_RARE,
	atlas = 'Nyanko',
	pos = { x = 0, y = 9 },
	cost = 8,
	calculate = function(self, card, context)
		if context.joker_main then
			if G.GAME.blind.chips / (hand_chips * mult) >= 10 then
				for _, played_card in ipairs(G.play.cards) do
					if not played_card:is_suit('Spades') and not played_card:is_suit('Clubs') then
						sendInfoMessage(played_card.center.suit)
						return
					end
				end
				ease_hands_played(1)
				return {
					message = "freeze!",
					colour = G.C.BLACK
				}
			end
		end
	end
}
