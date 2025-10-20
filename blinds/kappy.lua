SMODS.Blind {
	key = "kappy",
	atlas = "NyankoBoss",
	pos = { x = 0, y = 13 },
	boss_colour = HEX("ccddbb"),
	dollars = 5,
	boss = { min = 1 },
	mult = 2,
	block_retrigger = function(self, card, context)
		return not G.GAME.blind.disabled
	end
}
