SMODS.Blind {
	key = "wanwan",
	atlas = "NyankoBoss",
	pos = { x = 0, y = 8 },
	boss_colour = HEX("62C5DA"),
	dollars = 5,
	boss = { min = 1 },
	mult = 2,
	calculate = function(self, blind, context)
		if blind.disabled then return end
		if not context.press_play then return end
		if G.GAME.current_round.hands_played == 2 then
			G.hand:change_size(-G.hand.config.card_limit + math.max(10 - G.hand.config.card_limit, 1))
			return
		end
		if G.GAME.current_round.hands_played ~= 1 then return end
		G.E_MANAGER:add_event(Event({
			func = function()
				for i, playing_card in ipairs(G.hand.cards) do
					if i > 5 then break end
					G.hand:add_to_highlighted(playing_card, true)
					play_sound('card1', 1)
				end
				if #G.hand.cards > 0 then G.FUNCS.discard_cards_from_highlighted(nil, true) end
				return true
			end
		}))
		G.hand:change_size(-G.hand.config.card_limit + math.max(10 - G.hand.config.card_limit, 1))
	end,
	disable = function(self)
		if G.GAME.current_round.hands_played == 1 then
			G.hand:change_size(-G.hand.config.card_limit + math.max(10 - G.hand.config.card_limit, 1))
			return
		end
	end,
	defeat = function(self)
		if G.GAME.blind.disabled then return end
		if G.GAME.current_round.hands_played == 1 then
			G.hand:change_size(-G.hand.config.card_limit + math.max(10 - G.hand.config.card_limit, 1))
			return
		end
	end
}
