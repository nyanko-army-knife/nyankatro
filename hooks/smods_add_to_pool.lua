local smods_add_to_pool = SMODS.add_to_pool
function SMODS.add_to_pool(prototype_obj, args)
	if G.GAME.selected_back_key ~= nil and G.GAME.selected_back_key.add_to_pool ~= nil then
		if not G.GAME.selected_back_key:add_to_pool(prototype_obj, args) then
			return false
		end
	end
	return smods_add_to_pool(prototype_obj, args)
end
