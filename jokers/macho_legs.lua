SMODS.Joker {
  key = 'macho_legs_cat',
  config = { extra = { hands = 1 } },
  rarity = 1,
  atlas = 'Nyanko',
  pos = { x = 1, y = 2 },
  cost = 3,
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.hands } }
  end,
  add_to_deck = function(self, card, from_debuff)
    G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
  end,
}
