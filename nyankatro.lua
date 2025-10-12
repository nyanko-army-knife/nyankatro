for _, k in ipairs({ "Nyanko", "NyankoTarot", "NyankoVoucher" }) do
	SMODS.Atlas {
		key = k,
		path = k .. ".png",
		px = 71,
		py = 95
	}
end

SMODS.Atlas({
	atlas_table = 'ANIMATION_ATLAS',
	key = "NyankoBoss",
	path = "NyankoBoss.png",
	frames = 21,
	px = 34,
	py = 34
})

local mod_dir = '' .. SMODS.current_mod.path

for _, sub_dir in ipairs({ "hooks", "blinds", "jokers", "tarots", "vouchers", "backs", "challenges" }) do
	for _, file in ipairs(NFS.getDirectoryItems(mod_dir .. sub_dir)) do
		local joker, load_error = SMODS.load_file(sub_dir .. "/" .. file)
		if load_error or joker == nil then
			sendErrorMessage("The error is: " .. load_error)
		else
			joker()
		end
	end
end

assert(SMODS.load_file("rarities.lua"))()
