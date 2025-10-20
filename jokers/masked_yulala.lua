SMODS.Joker {
	key = "masked_yulala",
	blueprint_compat = true,
	rarity = 3,
	nyanko_rarity = NYANKO_RARITY.SPECIAL,
	pools = { nyankatro_gacha = false },
	cost = 8,
	atlas = 'Nyanko',
	pos = { x = 0, y = 7 },
	calculate = function(self, card, context)
		if not (context.blind) then return {} end;

		local key = 'c_magician'
		if math.random() > 0.5 then
			key = 'c_hierophant'
		end

		G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
		G.E_MANAGER:add_event(Event({
			func = (function()
				SMODS.add_card {
					set = 'Tarot',
					key = key,
					key_append = 'nyankatro_masked_yulala'
				}
				G.GAME.consumeable_buffer = 0
				return true
			end)
		}))

		return {
			message = localize('k_plus_tarot'),
		}
	end,
}
