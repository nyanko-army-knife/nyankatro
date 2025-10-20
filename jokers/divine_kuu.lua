SMODS.Joker {
	key = "divine_kuu",
	config = { extra = { xmult = 1.4 } },
	atlas = 'Nyanko',
	rarity = 3,
	pools = { nyankatro_gacha = true, nyankatro_gacha_uber_rare = true },
	nyanko_rarity = NYANKO_RARITY.UBER_RARE,
	cost = 8,
	pos = { x = 2, y = 8 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and G.GAME.current_round.hands_left == 0 then
			return {
				xmult = card.ability.extra.xmult
			}
		end
	end
}
