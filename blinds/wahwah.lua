SMODS.Blind {
  key = "wahwah",
  atlas = "NyankoBoss",
  pos = { x = 0, y = 7 },
  boss_colour = HEX("CCCCCC"),
  dollars = 5,
  boss = { min = 1 },
  mult = 2,
  calculate = function(self, blind, context)
    if blind.disabled then return end
    if not context.pre_discard then return end
    if G.GAME.current_round.discards_used ~= 1 then return end
    G.GAME.current_round.hands_left = G.GAME.current_round.hands_left - 1
    G.GAME.current_round.discards_left = G.GAME.current_round.discards_left - 1
  end
}
