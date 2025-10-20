SMODS.Blind {
	key = "yulala",
	atlas = "NyankoBoss",
	pos = { x = 0, y = 15 },
	boss_colour = HEX("552222"),
	dollars = 5,
	boss = { showdown = true },
	mult = 2,
	calculate = function(_, blind, context)
		if blind.disabled or not (context.press_play or context.pre_discard) then return end
		G.E_MANAGER:add_event(Event({
			func = function()
				local any_selected = nil
				local _cards = {}
				for _, playing_card in ipairs(G.hand.cards) do
					_cards[#_cards + 1] = playing_card
				end
				for i = 1, 5 do
					if G.hand.cards[i] then
						local selected_card, card_index = pseudorandom_element(_cards, 'nyankatro_yulala')
						G.hand:add_to_highlighted(selected_card, true)
						table.remove(_cards, card_index)
						any_selected = true
						play_sound('card1', 1)
					end
				end
				if any_selected then G.FUNCS.discard_cards_from_highlighted(nil, true) end
				return true
			end
		}))
	end
}
