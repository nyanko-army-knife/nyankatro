SMODS.Blind {
	key = "uril",
	atlas = "NyankoBoss",
	pos = { x = 0, y = 6 },
	boss_colour = HEX("785734"),
	dollars = 8,
	boss = { showdown = true },
	mult = 2,
	debuff_hand = function(self, cards, hand, handname, check)
		for _, card in ipairs(cards) do
			if card:get_id() < 6 then return true end
		end
	end,
}
