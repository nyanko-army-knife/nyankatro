SMODS.Blind {
	key = "hannya",
	atlas = "NyankoBoss",
	pos = { x = 0, y = 4 },
	boss_colour = HEX("702c32"),
	dollars = 5,
	boss = { min = 2 },
	mult = 2,
	calculate = function(self, blind, context)
		if blind.disabled or not context.modify_hand then return end
		hand_chips = mod_chips(math.floor(hand_chips * 0.25))
		update_hand_text({ sound = 'chips2', modded = true }, { chips = hand_chips })
	end
}
