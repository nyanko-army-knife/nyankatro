SMODS.Joker {
  key = 'mizli',
  config = { extra = { xmult_mod = 0.1 } },
  rarity = 3,
  atlas = 'Nyanko',
  pos = { x = 0, y = 2 },
  cost = 8,
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult_mod } }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        xmult = 1 + 0.1 * G.GAME.hands[context.scoring_name].played
      }
    end
  end
}
