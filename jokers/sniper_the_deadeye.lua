SMODS.Joker {
	key = "sniper_the_deadeye",
	blueprint_compat = false,
	eternal_compat = false,
	rarity = 2,
	nyanko_rarity = NYANKO_RARITY.SUPER_RARE,
	cost = 5,
	atlas = 'Nyanko',
	pos = { x = 0, y = 8 },
	calculate = function(self, card, context)
		if not (context.end_of_round and context.game_over and context.main_eval) then return end
		if G.GAME.chips / G.GAME.blind.chips > 0.01 then return end

		G.E_MANAGER:add_event(Event({
			func = function()
				G.hand_text_area.blind_chips:juice_up()
				G.hand_text_area.game_chips:juice_up()
				play_sound('tarot1')
				card:start_dissolve()
				return true
			end
		}))

		return {
			message = localize('k_saved_ex'),
			saved = 'saved by sniper the deadeye',
			colour = G.C.RED
		}
	end,
}
