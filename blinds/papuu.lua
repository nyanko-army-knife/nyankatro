SMODS.Blind {
	key = "papuu",
	atlas = "NyankoBoss",
	pos = { x = 0, y = 4 },
	boss_colour = HEX("DDDDDD"),
	dollars = 5,
	boss = { min = 2 },
	mult = 2,
	calculate = function(self, blind, context)
		if blind.disabled or not context.after then return end
		G.GAME.chips = G.GAME.chips * 0.7
	end
}
