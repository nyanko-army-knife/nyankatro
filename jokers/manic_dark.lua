SMODS.Joker {
	key = 'manic_dark_cat',
	config = { extra = { cards = 4 } },
	rarity = 2,
	nyanko_rarity = NYANKO_RARITY.SUPER_RARE,
	pools = { nyankatro_gacha = false },
	atlas = 'Nyanko',
	pos = { x = 2, y = 12 },
	cost = 6,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.cards } }
	end,
	calculate = function(self, card, context)
		if context.setting_blind then
			G.E_MANAGER:add_event(Event({
				func = function()
					G.GAME.round_resets.temp_handsize = card.ability.extra.cards * G.GAME.current_round.discards_left
					G.hand:change_size(card.ability.extra.cards * G.GAME.current_round.discards_left)
					ease_discard(-G.GAME.current_round.discards_left, nil, true)
					return true
				end
			}))
			return nil, true -- This is for Joker retrigger purposes
		end
	end
}
