SMODS.Rarity {
  key = "Basic",
  default_weight = 0,
  badge_colour = HEX('009dff'),
  get_weight = function(self, weight, object_type)
    return weight
  end,
}

SMODS.Rarity {
  key = "Special",
  default_weight = 0.35,
  badge_colour = HEX("4BC292"),
  get_weight = function(self, weight, object_type)
    return weight
  end,
}

SMODS.Rarity {
  key = "Rare",
  default_weight = 0.35,
  badge_colour = HEX('fe5f55'),
  get_weight = function(self, weight, object_type)
    return weight
  end,
}

SMODS.Rarity {
  key = "Super Rare",
  default_weight = 0.25,
  badge_colour = HEX('fe5f55'),
  get_weight = function(self, weight, object_type)
    return weight
  end,
}

SMODS.Rarity {
  key = "Uber Super Rare",
  default_weight = 0.05,
  badge_colour = HEX('fe5f55'),
  get_weight = function(self, weight, object_type)
    return weight
  end,
}

SMODS.Rarity {
  key = "Legend Rare",
  default_weight = 0,
  badge_colour = HEX("b26cbb"),
  get_weight = function(self, weight, object_type)
    return weight
  end,
}
