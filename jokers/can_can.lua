SMODS.Joker {
  key = 'can_can_cat',
  config = { extra = { mult = 50, neg_mult = -10 } },
  rarity = 2,
  atlas = 'Nyanko',
  pos = { x = 1, y = 1 },
  cost = 5,
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult, card.ability.extra.neg_mult } }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      if context.scoring_name == "High Card" then
        return { mult = card.ability.extra.mult }
      else
        return { mult = card.ability.extra.neg_mult }
      end
    end
  end
}
