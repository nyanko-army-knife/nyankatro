SMODS.Joker {
  key = 'green_shell_cat',
  config = { extra = { mult = 20 } },
  rarity = 1,
  atlas = 'Nyanko',
  pos = { x = 1, y = 5 },
  cost = 4,
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and G.jokers.cards[#G.jokers.cards] == card then
      return { mult = card.ability.extra.mult }
    end
  end
}
