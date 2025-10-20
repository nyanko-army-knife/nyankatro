SMODS.Voucher {
	key = 'cybears_revenge',
	atlas = 'NyankoVoucher',
	pos = { x = 1, y = 0 },
	config = { extra = { creates = 5 } },
	unlocked = false,
	requires = { 'v_nyankatro_facing_danger' },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.creates } }
	end,
	calculate = function(self, card, context)
		if not context.setting_blind or #G.jokers.cards + G.GAME.joker_buffer > G.jokers.config.card_limit then return end

		local jokers_to_create = math.min(card.ability.extra.creates,
			G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
		G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
		G.E_MANAGER:add_event(Event({
			func = function()
				for _ = 1, jokers_to_create do
					SMODS.add_card({ set = 'nyankatro_basic' })
					G.GAME.joker_buffer = 0
				end
				return true
			end
		}))
		return {
			message = localize('k_plus_joker'),
			colour = G.C.BLUE,
		}
	end
}
