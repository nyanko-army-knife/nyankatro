SMODS.Joker {
	key = 'catellite',
	pools = { nyankatro_gacha = true, nyankatro_gacha_rare = true },
	rarity = 1,
	nyanko_rarity = NYANKO_RARITY.RARE,
	atlas = 'Nyanko',
	pos = { x = 1, y = 11 },
	cost = 4,
	calculate = function(self, card, context)
		calculate = function(self, card, context)
			if context.joker_main then
				return {
					mult = G.GAME.hands[context.scoring_name].played
				}
			end
		end
	end
}
