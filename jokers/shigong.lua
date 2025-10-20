SMODS.Joker {
	key = 'shigong_cat',
	pools = { nyankatro_gacha = true, nyankatro_gacha_rare = true },
	rarity = 1,
	nyanko_rarity = NYANKO_RARITY.RARE,
	atlas = 'Nyanko',
	pos = { x = 2, y = 11 },
	cost = 4,
	calculate = function(self, card, context)
		if context.repetition and context.cardarea == G.play then
			if context.other_card:get_id() == 2 or
					context.other_card:get_id() == 3 or
					context.other_card:get_id() == 14 then
				return {
					repetitions = 1
				}
			end
		end
	end
}
