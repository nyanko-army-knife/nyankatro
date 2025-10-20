SMODS.Blind {
	key = "okame",
	atlas = "NyankoBoss",
	pos = { x = 0, y = 3 },
	boss_colour = HEX("701c32"),
	dollars = 5,
	boss = { min = 2 },
	mult = 2,
	calculate = function(_, blind, context)
		if blind.disabled or not context.modify_hand then return end
		mult = mod_mult(math.floor(mult * 0.25))
		update_hand_text({ sound = 'chips2', modded = true }, { mult = mult })
	end
}
