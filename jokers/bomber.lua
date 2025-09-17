SMODS.Joker {
  key = "bombercat",
  blueprint_compat = false,
  rarity = 2,
  cost = 6,
  atlas = 'Nyanko',
  pos = { x = 2, y = 2 },
  config = { extra = { dollars = 3 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.dollars } }
  end,
  calculate = function(self, card, context)
    if context.first_hand_drawn then
      local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
      juice_card_until(card, eval, true)
    end
    if (context.cardarea == G.hand and context.individual and not context.end_of_round) and
        (context.other_card:is_suit('Clubs') or context.other_card:is_suit('Spades')) and
        not context.blueprint and G.GAME.current_round.hands_played <= 0 then
      return {
        dollars = card.ability.extra.dollars,
        remove = true
      }
    end
  end
}
