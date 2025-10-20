SMODS.Joker {
	key = 'holy_valkyrie_cat',
	config = { extra = { mult = 10, last_hand_mult = 20 } },
	rarity = 1,
	nyanko_rarity = NYANKO_RARITY.SPECIAL,
	pools = { nyankatro_gacha = false },
	atlas = 'Nyanko',
	pos = { x = 2, y = 4 },
	cost = 4,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.last_hand_mult } }
	end,
	calculate = function(self, card, context)
		if not context.joker_main then return end
		local m = card.ability.extra.mult
		if G.GAME.current_round.hands_left == 0 then
			m = card.ability.extra.last_hand_mult
		end
		return {
			mult = m
		}
	end
}
