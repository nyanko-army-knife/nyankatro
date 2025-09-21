SMODS.Joker {
  key = 'cats_in_the_cradle',
  rarity = 3,
  atlas = 'Nyanko',
  pos = { x = 2, y = 3 },
  cost = 8,
  config = { extra = { Xmult = 2, type = 'Flush' } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult, localize(card.ability.extra.type, 'poker_hands') } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
      return {
        xmult = card.ability.extra.Xmult
      }
    end
  end,
}
