SMODS.Joker {
	key = 'manic_eraser_cat',
	config = { extra = { chips = 25 } },
	rarity = 2,
	nyanko_rarity = NYANKO_RARITY.SUPER_RARE,
	pools = { nyankatro_gacha = false },
	atlas = 'Nyanko',
	pos = { x = 1, y = 12 },
	cost = 6,
	loc_vars = function(self, info_queue, card)
		local four_tally = 0
		if G.playing_cards then
			for _, playing_card in ipairs(G.playing_cards) do
				if playing_card:get_id() == 4 then four_tally = four_tally + 1 end
			end
		end
		return { vars = { card.ability.extra.chips, card.ability.extra.chips * four_tally } }
	end,
	calculate = function(self, card, context)
		if not context.joker_main then return end
		local four_tally = 0
		for _, playing_card in ipairs(G.playing_cards) do
			if playing_card:get_id() == 4 then four_tally = four_tally + 1 end
		end
		return {
			chips = card.ability.extra.chips * four_tally
		}
	end
}
