SMODS.Blind {
  key = "motherv",
  atlas = "NyankoBoss",
  pos = { x = 0, y = 2 },
  boss_colour = HEX("EE4444"),
  dollars = 5,
  boss = { min = 1 },
  mult = 2,
  calculate = function(self, blind, context)
    if blind.disabled then return end
    if not (context.before) then return end
    -- sendInfoMessage("here", "nyankatro")
    SMODS.debuff_card(G.play.cards[#G.play.cards], true, "bl_nyankatro_motherv")
    -- sendInfoMessage(#G.play.cards, "nyankatro")
    if #G.play.cards >= 2 then
      SMODS.debuff_card(G.play.cards[#G.play.cards - 1], true, "bl_nyankatro_motherv")
    end
  end
}
