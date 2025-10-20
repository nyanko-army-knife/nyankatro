SMODS.Blind {
	key = "kawano",
	atlas = "NyankoBoss",
	pos = { x = 0, y = 14 },
	boss_colour = HEX("ccddbb"),
	dollars = 5,
	boss = { min = 1 },
	mult = 2,
	block_retrigger = function(self, card, context)
		if G.GAME.blind.disabled then return false end
		return G.GAME.dollars >= 3
	end,
	calculate = function(self, card, context)
		if context.before then
			ease_dollars(math.max(-G.GAME.dollars, -3), true)
		end
	end
}
