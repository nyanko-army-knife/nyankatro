SMODS.Joker {
  key = 'pcat',
  rarity = 2,
  blueprint_compat = false,
  atlas = 'Nyanko',
  pos = { x = 2, y = 5 },
  cost = 6,
  config = { extra = { Xmult_gain = 0.15, Xmult = 1 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult_gain, card.ability.extra.Xmult } }
  end,
  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local enhanced = {}
      for _, scored_card in ipairs(context.scoring_hand) do
        if (next(SMODS.get_enhancements(scored_card, false)) and not scored_card.debuff and not scored_card.vampired)
            and (scored_card:is_suit('Diamonds') or scored_card:is_suit('Hearts')) then
          enhanced[#enhanced + 1] = scored_card
          scored_card.vampired = true
          scored_card:set_ability('c_base', nil, true)
          G.E_MANAGER:add_event(Event({
            func = function()
              scored_card:juice_up()
              scored_card.vampired = nil
              return true
            end
          }))
        end
      end

      if #enhanced > 0 then
        card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain * #enhanced
        return {
          message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } },
          colour = G.C.MULT
        }
      end
    end
    if context.joker_main then
      return { xmult = card.ability.extra.Xmult }
    end
  end,
}
