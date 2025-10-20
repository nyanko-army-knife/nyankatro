SMODS.Joker {
	key = 'thaumaturge_cat',
	pools = { nyankatro_gacha = true, nyankatro_gacha_rare = true },
	rarity = 1,
	nyanko_rarity = NYANKO_RARITY.RARE,
	atlas = 'Nyanko',
	pos = { x = 0, y = 11 },
	cost = 5,
	calculate = function(self, card, context)
		if not context.setting_blind or #G.consumeables.cards + G.GAME.consumeable_buffer > G.consumeables.config.card_limit then return end

		G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
		G.E_MANAGER:add_event(Event({
			func = (function()
				G.E_MANAGER:add_event(Event({
					func = function()
						SMODS.add_card { set = 'Tarot', key_append = 'nyankatro_thaumaturge_cat' }
						G.GAME.consumeable_buffer = 0
						return true
					end
				}))
				SMODS.calculate_effect({ message = localize('k_plus_tarot'), colour = G.C.PURPLE },
					context.blueprint_card or card)
				return true
			end)
		}))
		return nil, true
	end
}
