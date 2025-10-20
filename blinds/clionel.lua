SMODS.Blind {
	key = "clionel",
	atlas = "NyankoBoss",
	pos = { x = 0, y = 11 },
	boss_colour = HEX("ddccbb"),
	dollars = 5,
	boss = { min = 1 },
	mult = 2,
	calculate = function(_, blind, context)
		if blind.disabled or not context.debuff_card then return end

		if context.debuff_card.area ~= G.jokers and context.debuff_card:is_face(true) then
			return { debuff = true }
		end
	end
}
