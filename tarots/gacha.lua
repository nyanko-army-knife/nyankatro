SMODS.Consumable {
	key = 'gacha',
	set = 'Tarot',
	atlas = 'NyankoTarot',
	pos = { x = 6, y = 5 },
	use = function(self, card, area, copier)
		local x = math.random(10000)
		local set = 'nyankatro_gacha_rare'
		if x >= 9970 then
			set = 'nyankatro_gacha_legend_rare'
		elseif x >= 9300 then
			set = 'nyankatro_gacha_uber_rare'
		elseif x >= 6500 then
			set = 'nyankatro_gacha_super_rare'
		end
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = 0.4,
			func = function()
				play_sound('timpani')
				SMODS.add_card({ set = set })
				card:juice_up(0.3, 0.5)
				return true
			end
		}))
		delay(0.6)
	end,
	can_use = function(self, card)
		return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
	end
}
