SMODS.Joker {
	key = 'cyberpunk_cat',
	config = { extra = { reduce_d = 1 } },
	rarity = 2,
	pools = { nyankatro_gacha = true, nyankatro_gacha_super_rare = true },
	nyanko_rarity = NYANKO_RARITY.SUPER_RARE,
	blueprint_compat = false,
	atlas = 'Nyanko',
	pos = { x = 0, y = 1 },
	cost = 6,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.reduce_d } }
	end,
	calculate = function(self, card, context)
		if context.mod_probability and not context.blueprint then
			return {
				denominator = math.max(1, context.denominator - 1)
			}
		end
	end
}
