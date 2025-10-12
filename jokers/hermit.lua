SMODS.Joker {
	key = "hermit_cat",
	blueprint_compat = true,
	rarity = 3,
	nyanko_rarity = NYANKO_RARITY.SPECIAL,
	cost = 8,
	atlas = 'Nyanko',
	pos = { x = 3, y = 2 },
	config = { extra = { d_dollars = 4 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.d_dollars } }
	end,
	calculate = function(self, card, context)
		if not (context.blind) then return {} end;
		G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
		G.E_MANAGER:add_event(Event({
			func = (function()
				SMODS.add_card { set = 'Tarot', key = 'c_hermit', key_append = 'nyankatro_hermit_cat' }
				G.GAME.consumeable_buffer = 0
				return true
			end)
		}))
		return {
			message = localize('k_plus_tarot'),
			dollars = -card.ability.extra.d_dollars,
		}
	end,
}
