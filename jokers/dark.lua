SMODS.Joker {
  key = 'dark_cat',
  config = { extra = { h_size = 1 } },
  rarity = 1,
  atlas = 'Nyanko',
  pos = { x = 0, y = 2 },
  cost = 3,
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.h_size } }
  end,
  add_to_deck = function(self, card, from_debuff)
    G.hand:change_size(card.ability.extra.h_size)
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.hand:change_size(-card.ability.extra.h_size)
  end,
}
