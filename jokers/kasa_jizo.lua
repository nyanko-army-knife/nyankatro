SMODS.Joker {
  key = "kasa_jizo",
  blueprint_compat = false,
  config = { extra = { xmult_mod = 1 } },
  rarity = 3,
  cost = 8,
  atlas = 'Nyanko',
  pos = { x = 1, y = 2 },
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        1 + card.ability.extra.xmult_mod * #SMODS.find_card('j_nyankatro_kasa_jizo', false),
        card.ability.extra.xmult_mod
      }
    }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        xmult = 1 + card.ability.extra.xmult_mod * #SMODS.find_card('j_nyankatro_kasa_jizo', false)
      }
    end
  end,
}

local smods_showman_ref = SMODS.showman
function SMODS.showman(card_key)
  if next(SMODS.find_card('j_nyankatro_kasa_jizo')) then
    return true
  end
  return smods_showman_ref(card_key)
end
