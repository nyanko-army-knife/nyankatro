SMODS.Joker {
	key = 'headmistress_jeanne',
	config = { extra = { xmult = 1.5 } },
	rarity = 4,
	nyanko_rarity = NYANKO_RARITY.LEGEND_RARE,
	pools = { nyankatro_gacha = true, nyankatro_gacha_legend_rare = true },
	atlas = 'Nyanko',
	pos = { x = 1, y = 13 },
	cost = 4,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			return { xmult = card.ability.extra.xmult }
		end
	end
}

local card_is_suit_ref = Card.is_suit
function Card:is_suit(suit, bypass_debuff, flush_calc)
	if not SMODS.has_no_suit(self) and next(SMODS.find_card("j_nyankatro_headmistress_jeanne")) then
		return true
	end
	return card_is_suit_ref(self, suit, bypass_debuff, flush_calc)
end
