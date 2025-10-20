SMODS.Challenge {
	key = 'stop_gacha',
	rules = { custom = { { id = "nyankatro_no_gacha" } } },
	jokers = {
		{ id = 'j_nyankatro_hermit_cat', pinned = false, eternal = true, edition = "negative" },
	},
	vouchers = {
		{ id = 'v_nyankatro_facing_danger' },
		{ id = 'v_nyankatro_cybears_revenge' },
	},
	add_to_pool = function(self, prototype_obj, args)
		if (prototype_obj ~= nil and prototype_obj.key ~= nil)
				and (prototype_obj.key:find("^j_") and prototype_obj.config.center ~= nil)
				and (prototype_obj.config.center.pools or {}).nyankatro_gacha then
			return false
		end
		if (prototype_obj ~= nil and prototype_obj.key ~= nil)
				and (prototype_obj.key:find("^j_") or prototype_obj.key:find("^bl_"))
				and not prototype_obj.key:find('nyankatro') then
			return false
		end
		return true
	end
}
