SMODS.Consumable {
	key = 'platinum',
	set = 'Spectral',
	atlas = 'NyankoTarot',
	pos = { x = 7, y = 5 },
	use = function(self, card, area, copier)
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = 0.4,
			func = function()
				play_sound('timpani')
				SMODS.add_card({ set = 'nyankatro_gacha_uber_rare' })
				card:juice_up(0.3, 0.5)
				return true
			end
		}))
		delay(0.6)
	end,
	can_use = function(self, card)
		return #G.jokers.cards < G.jokers.config.card_limit or card.area == G.jokers
	end,
}
