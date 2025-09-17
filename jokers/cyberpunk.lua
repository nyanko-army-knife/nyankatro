SMODS.Joker {
  key = 'cyberpunk_cat',
  config = { extra = { reduce_d = 1 } },
  rarity = 2,
  blueprint_compat = false,
  atlas = 'Nyanko',
  pos = { x = 0, y = 1 },
  cost = 6,
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.reduce_d } }
  end,
  calculate = function(self, card, context)
    if context.mod_probability and not context.blueprint then
      return {
        denominator = math.max(1, context.denominator - 1)
      }
    end
  end
}
