SMODS.Atlas {
	key = "Nyanko",
	path = "Nyanko.png",
	px = 71,
	py = 95
}


local mod_dir = '' .. SMODS.current_mod.path

for _, file in ipairs(NFS.getDirectoryItems(mod_dir .. "jokers")) do
	sendDebugMessage("loading joker" .. file)
	local joker, load_error = SMODS.load_file("jokers/" .. file)
	if load_error or joker == nil then
		sendErrorMessage("The error is: " .. load_error)
	else
		joker()
	end
end

assert(SMODS.load_file("rarities.lua"))()
