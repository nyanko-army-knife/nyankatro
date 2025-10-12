SMODS.Back {
	key = "nyanko",
	atlas = 'NyankoBack',
	pos = { x = 0, y = 0 },
	unlocked = true,
	loc_vars = function(self, info_queue, back)
		return {}
	end,
	add_to_pool = function(self, prototype_obj, args)
		if (prototype_obj ~= nil and prototype_obj.key ~= nil)
				and (prototype_obj.key:find("^j_") or prototype_obj.key:find("^bl_"))
				and not prototype_obj.key:find('nyankatro') then
			return false
		end
		return true
	end
}
