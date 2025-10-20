local pre_eval_card = eval_card
function eval_card(card, context)
	local ret = {}
	local post_trig = {}
	if (context.repetition and context.cardarea == G.play) then
		if G.GAME.blind.config.blind.block_retrigger ~= nil then
			if G.GAME.blind.config.blind:block_retrigger(card, context) then return ret, post_trig end
		end
	end
	return pre_eval_card(card, context)
end
