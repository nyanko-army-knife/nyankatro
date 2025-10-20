SMODS.Joker {
	key = 'flying_cat',
	config = { extra = { mult = 3 } },
	rarity = 1,
	nyanko_rarity = NYANKO_RARITY.BASIC,
	pools = { nyankatro_gacha = false, nyankatro_basic = true },
	atlas = 'Nyanko',
	pos = { x = 1, y = 4 },
	cost = 3,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Clubs") then
			return {
				mult = card.ability.extra.mult
			}
		end
	end
}
