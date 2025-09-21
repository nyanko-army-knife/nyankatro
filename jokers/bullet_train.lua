SMODS.Joker {
  key = 'bullet_train_cat',
  rarity = 2,
  blueprint_compat = false,
  atlas = 'Nyanko',
  pos = { x = 3, y = 5 },
  cost = 6,
  config = { extra = { dollars = 2, dollars_first_hand = 8 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dollars, card.ability.extra.dollars_first_hand } }
  end,
  calc_dollar_bonus = function(self, card)
    if G.GAME.current_round.hands_played <= 1 then
      return card.ability.extra.dollars_first_hand
    else
      return card.ability.extra.dollars
    end
  end
}
