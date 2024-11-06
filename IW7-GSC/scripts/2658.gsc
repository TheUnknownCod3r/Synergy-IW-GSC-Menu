/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2658.gsc
***************************************/

_id_C77A() {
  self endon("disconnect");
  level endon("game_ended");
  wait 2;

  for (;;) {
  _id_A02C();
  scripts\engine\utility::waitframe();
  }
}

_id_C776() {
  level._id_C785 = [];
}

_id_A02C() {
  self endon("refresh_outline");

  foreach (var_4, var_1 in level._id_C785) {
  if (!isdefined(var_1))
  continue;

  if (!isdefined(var_1._id_46A2))
  continue;

  var_2 = 1;
  var_3 = _id_7D69(var_1);

  if (var_3 == 3)
  _id_6220(var_1, self, _id_78CF(var_1, var_2), 1, 0, "high");
  else if (var_3 == 1)
  _id_6220(var_1, self, 4, 1, 0, "high");
  else
  _id_5561(var_1, self);

  if (var_4 & 0)
  scripts\engine\utility::waitframe();
  }
}

_id_78CF(var_0, var_1) {
  var_2 = var_0._id_46A2;

  if (isdefined(var_0.struct.weapon) && _id_0A6B::_id_8BBB(var_0.struct.weapon)) {
  if (isdefined(level._id_7D63)) {
  var_3 = self [[level._id_7D63]](var_0.struct.weapon);

  if (var_3 > 1)
  var_2 = 4500;
  else
  var_2 = var_0._id_46A2 * 0.5;
  }
  else
  var_2 = var_0._id_46A2 * 0.5;
  }

  if (_id_0A63::_id_D0BB(var_2) || scripts\engine\utility::_id_9CEE(var_0._id_6261))
  return 3;
  else
  return 1;
}

_id_7D69(var_0) {
  var_1 = distancesquared(self.origin, var_0.origin) < 1000000;

  if (!var_1)
  return 0;

  if (_id_0A77::_id_9C03())
  return 1;

  if (_id_0A77::_id_8BAE())
  return 1;

  return 3;
}

_id_D3DF() {
  self endon("disconnect");

  for (;;) {
  foreach (var_1 in level.players) {
  if (self == var_1)
  continue;

  if (_id_FF7F(var_1)) {
  _id_6220(var_1, self, _id_78D0(var_1), 0, 0, "high");
  continue;
  }

  _id_5561(var_1, self);
  }

  wait 0.2;
  }
}

_id_FF7F(var_0) {
  if (self._id_C016)
  return 0;

  if (!isalive(var_0) || !isdefined(var_0.maxhealth) || !var_0.maxhealth || var_0._id_C004)
  return 0;

  var_1 = distancesquared(self.origin, var_0.origin) > 2250000;

  if (var_1)
  return 1;

  var_2 = !bullettracepassed(self geteye(), var_0 geteye(), 0, self);
  return var_2;
}

_id_78D0(var_0) {
  var_1 = var_0.health / 100;

  if (var_1 <= 0.33 || _id_0A5B::_id_D0EF(var_0))
  return 4;
  else if (var_1 <= 0.66)
  return 5;
  else if (var_1 <= 1.0)
  return 3;
  else
  return 0;
}

_id_6221(var_0, var_1, var_2, var_3, var_4, var_5) {
  var_0 _meth_8190(var_1, var_2, var_3, var_4);
}

_id_6220(var_0, var_1, var_2, var_3, var_4, var_5) {
  var_0 _meth_818F(var_1, var_2, var_3, var_4);
}

_id_5562(var_0, var_1) {
  var_0 _meth_818D(var_1);
}

_id_5561(var_0, var_1) {
  var_0 _meth_818C(var_1);
}

_id_5560(var_0) {
  var_0 _meth_818B();
}

_id_621F(var_0, var_1, var_2, var_3) {
  var_0 _meth_818E(var_1, var_2, var_3);
}

_id_F4AE(var_0, var_1, var_2) {
  level endon("game_ended");
  level endon("outline_disabled");

  if (!isdefined(var_0))
  var_0 = 4;

  if (!isdefined(var_1))
  var_1 = 0;

  if (!isdefined(var_2))
  var_2 = 0;

  for (;;) {
  foreach (var_4 in _id_0A4A::_id_77FD()) {
  if (isdefined(var_4._id_4D32))
  continue;

  if (isdefined(var_4._id_B36D))
  continue;

  if (isdefined(var_4._id_6BD4)) {
  _id_6221(var_4, level.players, var_0, 1, var_2, "high");
  continue;
  }

  _id_6221(var_4, level.players, var_0, var_1, var_2, "high");
  }

  wait 0.5;
  }
}

_id_F4AF(var_0, var_1, var_2) {
  level endon("game_ended");
  self endon("outline_disabled");

  if (!isdefined(var_0))
  var_0 = 4;

  if (!isdefined(var_1))
  var_1 = 0;

  if (!isdefined(var_2))
  var_2 = 0;

  for (;;) {
  foreach (var_4 in _id_0A4A::_id_77FD()) {
  if (isdefined(var_4._id_4D32))
  continue;

  if (isdefined(var_4._id_B36D))
  continue;

  if (isdefined(var_4._id_6BD4)) {
  _id_6220(var_4, self, var_0, 1, var_2, "high");
  continue;
  }

  _id_6220(var_4, self, var_0, var_1, var_2, "high");
  }

  wait 0.5;
  }
}

_id_12C01() {
  foreach (var_1 in _id_0A4A::_id_77FD()) {
  if (isdefined(var_1._id_4D32))
  continue;

  if (isdefined(var_1._id_B36D))
  continue;

  _id_5562(var_1, level.players);
  level notify("outline_disabled");
  }
}

_id_12C02() {
  foreach (var_1 in _id_0A4A::_id_77FD()) {
  if (isdefined(var_1._id_4D32))
  continue;

  if (isdefined(var_1._id_B36D))
  continue;

  _id_5561(var_1, self);
  self notify("outline_disabled");
  }
}

_id_EB64() {
  var_0 = ["r_hudoutlineFillColor0", "r_hudoutlineFillColor1", "r_hudoutlinewidth", "r_hudoutlineOccludedOutlineColor", "r_hudoutlineOccludedInlineColor", "r_hudoutlineOccludedInteriorColor", "r_hudOutlineOccludedColorFromFill", "cg_hud_outline_colors_0", "cg_hud_outline_colors_1", "cg_hud_outline_colors_2", "cg_hud_outline_colors_3", "cg_hud_outline_colors_4", "cg_hud_outline_colors_5", "cg_hud_outline_colors_6"];

  if (!isdefined(level._id_91AD))
  level._id_91AD = [];

  foreach (var_2 in var_0)
  level._id_91AD[var_2] = getdvar(var_2);
}

_id_E2CA() {
  var_0 = ["r_hudoutlineFillColor0", "r_hudoutlineFillColor1", "r_hudoutlinewidth", "r_hudoutlineOccludedOutlineColor", "r_hudoutlineOccludedInlineColor", "r_hudoutlineOccludedInteriorColor", "r_hudOutlineOccludedColorFromFill", "cg_hud_outline_colors_0", "cg_hud_outline_colors_1", "cg_hud_outline_colors_2", "cg_hud_outline_colors_3", "cg_hud_outline_colors_4", "cg_hud_outline_colors_5", "cg_hud_outline_colors_6"];

  if (!isdefined(level._id_91AD))
  return;

  foreach (var_2 in var_0)
  setdvar(var_2, level._id_91AD[var_2]);
}
