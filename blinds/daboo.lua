SMODS.Blind {
	key = "daboo",
	atlas = "NyankoBoss",
	pos = { x = 0, y = 0 },
	boss_colour = HEX("39127A"),
	dollars = 5,
	boss = { min = 2 },
	mult = 4,
	disable = function(self)
		G.GAME.blind.chips = G.GAME.blind.chips / 2
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
	end,
}
