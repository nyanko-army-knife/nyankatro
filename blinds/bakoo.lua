SMODS.Blind {
	key = "bakoo",
	atlas = "NyankoBoss",
	pos = { x = 0, y = 9 },
	boss_colour = HEX("222266"),
	dollars = 5,
	boss = { min = 2 },
	mult = 2,
	loc_vars = function(self)
		return { vars = { localize(G.GAME.current_round.most_played_poker_hand, 'poker_hands') } }
	end,
	collection_loc_vars = function(self)
		return { vars = { localize('ph_most_played') } }
	end,
	calculate = function(self, blind, context)
		if blind.disabled or not context.debuff_hand then return end

		blind.triggered = false
		if context.scoring_name == G.GAME.current_round.most_played_poker_hand then
			blind.triggered = true
			if not context.check then
				ease_dollars(-G.GAME.dollars, true) -- `return {dollars = -G.GAME.dollars}` lacks the ability to set the amount instantly
				blind:wiggle()
			end
		end
	end
}
