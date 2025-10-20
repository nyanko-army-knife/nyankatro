SMODS.Blind {
	key = "zonel",
	atlas = "NyankoBoss",
	pos = { x = 0, y = 12 },
	boss_colour = HEX("221144"),
	dollars = 5,
	boss = { min = 1 },
	mult = 2,
	calculate = function(_, blind, context)
		if blind.disabled or not context.debuff_card then return end

		if context.debuff_card.area ~= G.jokers and not context.debuff_card:is_face(true) then
			return { debuff = true }
		end
	end
}
