/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2919.gsc
***************************************/

_id_DBCA() {
  precacheshader("hud_radar_background");
  precacheshader("hud_radar_background_yz");
  precacheshader("hud_radar_friendly");
  precacheshader("hud_radar_enemy");
  precacheshader("hud_radar_capital_ship");
}

_id_DBC9() {
  self._id_DBC5 = spawnstruct();
  self._id_DBC5._id_26F0 = 0;
  self._id_DBC5._id_1D2C = 0;
  self._id_DBC5._id_26E3 = 0;
  self._id_DBC5._id_1CC7 = 0;
  self._id_DBC6 = [];
  setdvarifuninitialized("radar_color_dist_scaled", 1);
  setdvarifuninitialized("radar_yz", 1);
}

_id_DBCC() {
  level._id_DBD5 = 1;

  if (!isdefined(self._id_DBC1)) {
  self._id_DBC1 = _id_0B3F::_id_499B("hud_radar_background", 100, 100);
  self._id_DBC1 _id_0B3F::_id_F801("BOTTOMRIGHT", "BOTTOMRIGHT", -10, -10, 0);
  self._id_DBC1._id_02A4 = -10;
  self._id_DBC1._id_FC44 = "hud_radar_background";
  } else {
  self._id_DBC1.alpha = 1.0;

  foreach (var_1 in self._id_DBC6)
  var_1._id_DBC2.alpha = 1.0;
  }

  thread _id_DBCD();
}

_id_DBCD() {
  self endon("radar_remove");

  for (;;) {
  if (scripts\engine\utility::_id_9CEE(self._id_DBC5._id_26F0) || scripts\engine\utility::_id_9CEE(self._id_DBC5._id_1D2C)) {
  foreach (var_1 in _id_0B91::_id_81FF()) {
  var_2 = var_1 _id_DBC7();

  if (isdefined(var_2) && (var_2 == "axis" && scripts\engine\utility::_id_9CEE(self._id_DBC5._id_26F0) || var_2 == "allies" && scripts\engine\utility::_id_9CEE(self._id_DBC5._id_1D2C)))
  _id_DBC0(var_1);
  }
  }

  if (scripts\engine\utility::_id_9CEE(self._id_DBC5._id_26E3)) {
  foreach (var_5 in _func_072("axis"))
  _id_DBC0(var_5);
  }

  if (scripts\engine\utility::_id_9CEE(self._id_DBC5._id_1CC7)) {
  foreach (var_5 in _func_072("allies"))
  _id_DBC0(var_5);
  }

  var_9 = anglestoforward(self getplayerangles());
  var_10 = anglestoup(self getplayerangles());
  var_11 = anglestoright(self getplayerangles());
  var_12 = self geteye();

  if (isdefined(self _meth_8473()))
  var_12 = self _meth_8473() gettagorigin("tag_camera");

  foreach (var_14 in self._id_DBC6) {
  var_15 = var_14.origin - var_12;

  if (getdvarint("radar_yz") == 0) {
  _id_DBC3(var_14, var_9, var_11, var_10, var_15);
  continue;
  }

  _id_DBC4(var_14, var_9, var_11, var_10, var_15);
  }

  if (getdvarint("radar_yz") >= 1 && self._id_DBC1._id_FC44 != "hud_radar_background_yz") {
  self._id_DBC1 setshader("hud_radar_background_yz", 100, 100);
  self._id_DBC1._id_FC44 = "hud_radar_background_yz";
  }
  else if (getdvarint("radar_yz") == 0 && self._id_DBC1._id_FC44 != "hud_radar_background") {
  self._id_DBC1 setshader("hud_radar_background", 100, 100);
  self._id_DBC1._id_FC44 = "hud_radar_background";
  }

  wait 0.05;
  }
}

_id_DBC3(var_0, var_1, var_2, var_3, var_4) {
  var_5 = vectordot(var_1, var_4);
  var_6 = vectordot(var_2, var_4);
  var_7 = vectordot(var_3, var_4);
  var_8 = (var_5, var_6, 0);
  var_9 = length(var_8);
  var_10 = vectornormalize(var_8);
  var_9 = _func_17B(min(var_9 / 63360, 1.0), 0.5);
  var_11 = var_9 * var_10[1] * (self._id_DBC1._id_039F - var_0._id_DBC2._id_039F * 2.0) / 2.0;
  var_12 = var_9 * var_10[0] * -1.0 * (self._id_DBC1.height - var_0._id_DBC2.height * 2.0) / 2.0;
  var_13 = clamp(scripts\engine\utility::_id_101EA(var_7) * abs(var_7) / 63360, -1.0, 1.0);
  var_0._id_DBC2 _id_0B3F::_id_F801("", undefined, var_11, var_12, 0.05);

  if (getdvarint("radar_color_dist_scaled") >= 1)
  var_0._id_DBC2._id_00B9 = (scripts\engine\utility::ter_op(var_13 >= 0, 1.0, _func_17B(1.0 + var_13, 4)), _func_17B(1.0 - abs(var_13), 1), scripts\engine\utility::ter_op(var_13 <= 0, 1.0, _func_17B(1.0 - var_13, 4))) * var_0._id_DBC2._id_439E;
  else
  var_0._id_DBC2._id_00B9 = (1, 0, 0) * var_0._id_DBC2._id_439E;

  var_0._id_DBC2.alpha = 1.0;

  if (scripts\engine\utility::_id_9CEE(var_0._id_DBC2._id_EB9C)) {
  var_14 = _func_17B(0.75 * (1.0 - var_9) + 0.25, 0.5);
  var_0._id_DBC2._id_039F = int(ceil(var_0._id_DBC2._id_13D1C * var_14));
  var_0._id_DBC2.height = int(ceil(var_0._id_DBC2._id_8D0C * var_14));
  var_0._id_DBC2 _meth_8276(0.25, var_0._id_DBC2._id_039F, var_0._id_DBC2.height);
  }

  if (scripts\engine\utility::_id_9CEE(var_0._id_DBC2._id_E6F5)) {
  var_15 = anglestoforward(var_0.angles);
  var_16 = vectordot(var_15, var_1);
  var_17 = vectordot(var_15, var_3);
  var_18 = vectordot(var_15, var_2);
  var_19 = vectornormalize(var_1 * var_16 + var_1 * var_17 + var_2 * var_18);
  var_5 = vectordot(var_1, var_19);
  var_6 = vectordot(var_2, var_19);
  var_0._id_DBC2._id_026E = acos(var_5) * scripts\engine\utility::_id_101EA(var_6);
  }
}

_id_DBC4(var_0, var_1, var_2, var_3, var_4) {
  var_5 = length(var_4);
  var_6 = vectordot(var_1, var_4);

  if (var_6 > 0.0)
  var_4 = vectornormalize(var_4);

  var_7 = vectordot(var_2, var_4);
  var_8 = vectordot(var_3, var_4);
  var_9 = (var_7, var_8, 0);

  if (var_6 <= 0.0)
  var_9 = vectornormalize(var_9);

  var_10 = var_9[0] * (self._id_DBC1._id_039F - var_0._id_DBC2._id_039F * 2.0) / 2.0;
  var_11 = var_9[1] * -1.0 * (self._id_DBC1.height - var_0._id_DBC2.height * 2.0) / 2.0;
  var_12 = clamp(var_5 / 63360, 0.0, 1.0);
  var_0._id_DBC2 _id_0B3F::_id_F801("", undefined, var_10, var_11, 0.05);

  if (getdvarint("radar_color_dist_scaled") >= 1)
  var_0._id_DBC2._id_00B9 = (0.5 * (1.0 - _func_17B(var_12, 0.5)) + 0.5, 0.0, 0.0) * var_0._id_DBC2._id_439E;
  else
  var_0._id_DBC2._id_00B9 = (1, 0, 0) * var_0._id_DBC2._id_439E;

  if (var_0._id_DBC2._id_FC44 == "hud_radar_capital_ship")
  var_0._id_DBC2._id_00B9 = (var_0._id_DBC2._id_00B9[0], var_0._id_DBC2._id_00B9[0], var_0._id_DBC2._id_00B9[0]);

  if (var_6 <= 0.0)
  var_0._id_DBC2.alpha = clamp(1.0 + vectordot(var_1, vectornormalize(var_4)), 0.0, 1.0);

  if (scripts\engine\utility::_id_9CEE(var_0._id_DBC2._id_EB9C)) {
  var_13 = _func_17B(0.75 * (1.0 - _func_17B(var_12, 2.0)) + 0.25, 0.5);
  var_0._id_DBC2._id_039F = int(ceil(var_0._id_DBC2._id_13D1C * var_13));
  var_0._id_DBC2.height = int(ceil(var_0._id_DBC2._id_8D0C * var_13));
  var_0._id_DBC2 _meth_8276(0.25, var_0._id_DBC2._id_039F, var_0._id_DBC2.height);
  }

  if (scripts\engine\utility::_id_9CEE(var_0._id_DBC2._id_E6F5)) {
  var_14 = anglestoforward(var_0.angles);
  var_15 = vectordot(var_14, var_1);
  var_16 = vectordot(var_14, var_3);
  var_17 = vectordot(var_14, var_2);
  var_18 = vectornormalize(var_3 * var_15 + var_3 * var_16 + var_2 * var_17);
  var_6 = vectordot(var_3, var_18);
  var_7 = vectordot(var_2, var_18);
  var_0._id_DBC2._id_026E = acos(clamp(var_6, -1.0, 1.0)) * scripts\engine\utility::_id_101EA(var_7);
  }
}

_id_DBC7() {
  if (isdefined(self.team))
  return self.team;
  else if (isdefined(self._id_EEDE))
  return self._id_EEDE;

  return undefined;
}

_id_DBC8() {
  self._id_DBC1.alpha = 0.0;

  foreach (var_1 in self._id_DBC6)
  var_1._id_DBC2.alpha = 0;
}

_id_DBCB() {
  self notify("radar_remove");
  level._id_DBD5 = undefined;

  foreach (var_1 in self._id_DBC6)
  _id_DBD0(var_1);

  self._id_DBC1 destroy();
  self._id_DBC1 = undefined;
  self._id_DBC6 = [];
}

_id_DBC0(var_0, var_1, var_2, var_3, var_4, var_5, var_6) {
  if (scripts\engine\utility::array_contains(self._id_DBC6, var_0))
  return;

  var_7 = "hud_radar_enemy";
  var_8 = 3;
  var_9 = 3;
  var_10 = 1.0;

  if (isdefined(var_2))
  var_7 = var_2;
  else if (issubstr(var_0.classname, "capitalship")) {
  var_7 = "hud_radar_capital_ship";
  var_8 = 20;
  var_9 = 20;
  var_10 = 0.5;

  if (!isdefined(var_5))
  var_5 = 1;

  if (!isdefined(var_6))
  var_6 = 1;
  }
  else if (isdefined(var_1) && isenemyteam(var_1, self.team) || isdefined(var_0 _id_DBC7()) && isenemyteam(var_0 _id_DBC7(), self.team))
  var_7 = "hud_radar_friendly";

  if (isdefined(var_3))
  var_8 = var_3;

  if (isdefined(var_4))
  var_9 = var_4;

  if (!isdefined(self._id_DBC1))
  _id_DBCC();

  self._id_DBC6[self._id_DBC6.size] = var_0;
  var_0._id_DBC2 = _id_0B3F::_id_49D9(var_7, var_8, var_9);
  var_0._id_DBC2 _id_0B3F::_id_F801("", undefined, 0, 0);
  var_0._id_DBC2 _id_0B3F::_id_F7D6(self._id_DBC1);
  var_0._id_DBC2._id_00B9 = (1, 1, 1);
  var_0._id_DBC2._id_02A4 = 10;
  var_0._id_DBC2._id_FC44 = var_7;
  var_0._id_DBC2._id_E6F5 = var_5;
  var_0._id_DBC2._id_EB9C = var_6;
  var_0._id_DBC2._id_13D1C = var_8;
  var_0._id_DBC2._id_8D0C = var_9;
  var_0._id_DBC2._id_439E = var_10;

  if (var_8 > 3)
  var_0._id_DBC2._id_02A4 = var_0._id_DBC2._id_02A4 - 1;

  thread _id_DBCF(var_0);
}

_id_DBD0(var_0) {
  if (isdefined(var_0._id_DBC2)) {
  var_0._id_DBC2 destroy();
  var_0._id_DBC2 = undefined;
  }

  self._id_DBC6 = scripts\engine\utility::array_remove(self._id_DBC6, var_0);
  var_0 notify("radar_ent_removed");
}

_id_DBD3(var_0, var_1) {
  self._id_DBC5._id_26F0 = var_0;
  self._id_DBC5._id_1D2C = var_1;
}

_id_DBD2(var_0, var_1) {
  self._id_DBC5._id_26E3 = var_0;
  self._id_DBC5._id_1CC7 = var_1;
}

_id_DBCF(var_0) {
  var_0 endon("radar_ent_removed");
  self endon("radar_remove");
  var_0 scripts\engine\utility::waittill_any("death", "entitydeleted");
  thread _id_DBD0(var_0);
}
