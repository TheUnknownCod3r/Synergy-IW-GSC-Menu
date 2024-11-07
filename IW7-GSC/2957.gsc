/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2957.gsc
***************************************/

init() {
  level.player _id_41BB();
  level.player thread _id_10FA0();
  level.player thread stringemissilefired();
  level.player thread _id_10FAC();
  level.player thread _id_10F9E();
}

_id_41BB() {
  if (!isdefined(self._id_10F9D))
  self._id_10F9D = spawnstruct();

  self._id_10F9D._id_10FA6 = 0;
  self._id_10F9D._id_10FA5 = 0;
  self._id_10F9D._id_10FA3 = 0;

  if (isdefined(self._id_10F9D._id_10FAA))
  _id_41E3(_id_8195(self._id_10F9D._id_10FAA));

  self._id_10F9D._id_10FAA = undefined;
  self notify("stinger_irt_cleartarget");
  self notify("stop_lockon_sound");
  self notify("stop_locked_sound");
  self._id_10F9D._id_10FA4 = undefined;
  self _meth_8403();
  self _meth_8406(0);
  self _meth_8404(0);
}

_id_10FA0() {
  for (;;) {
  self waittill("weapon_fired");
  var_0 = getweaponbasename(self getcurrentweapon());

  if (!isdefined(var_0) || var_0 != "iw7_lockon")
  continue;

  self notify("stinger_fired");
  }
}

stringemissilefired() {
  for (;;) {
  self waittill("missile_fire", var_0, var_1);

  if (isdefined(var_0)) {
  var_2 = self._id_10F9D._id_10FAA;

  if (_id_9F7A(var_2)) {
  if (isdefined(var_2._id_12BA4) && !scripts\engine\utility::_id_9CEE(var_2._id_02A6)) {
  if (var_2._id_12BA4 == "soldier" || var_2._id_12BA4 == "c6")
  var_0 _meth_8206(self._id_10F9D._id_10FAA, (0, 0, 38));
  else if (var_2._id_12BA4 == "c8")
  var_0 _meth_8206(self._id_10F9D._id_10FAA, (0, 0, 60));
  }
  }
  }
  }
}

_id_10FAC() {
  self endon("death");

  for (;;) {
  while (!_id_D42E())
  wait 0.05;

  setomnvar("ui_lockon_ads", 1);
  self._id_10F9D._id_AF2F = [];
  self._id_10F9D._id_11565 = ["0", "1", "2", "3"];
  thread _id_10FA2();

  while (_id_D42E())
  wait 0.05;

  setomnvar("ui_lockon_ads", 0);
  self notify("stinger_IRT_off");
  _id_41BB();

  foreach (var_1 in self._id_10F9D._id_AF2F)
  _id_41E3(var_1);

  self._id_10F9D._id_AF2F = undefined;
  self._id_10F9D._id_11565 = undefined;
  }
}

_id_10F9E() {
  self waittill("death");

  if (isdefined(self._id_10F9D._id_AF2F)) {
  setomnvar("ui_lockon_ads", 0);

  foreach (var_1 in self._id_10F9D._id_AF2F)
  _id_41E3(var_1);
  }
}

_id_10FA2() {
  self endon("death");
  self endon("stinger_IRT_off");

  for (;;) {
  wait 0.05;

  if (self._id_10F9D._id_10FA3) {
  if (!_id_9F7A(self._id_10F9D._id_10FAA)) {
  _id_41BB();
  continue;
  }

  var_0 = _id_8195(self._id_10F9D._id_10FAA);

  if (isdefined(var_0._id_65D3._id_3508))
  setomnvar("ui_lockon_target_health_" + var_0._id_92B8, var_0._id_65D3._id_8CB0);

  _id_F875(self._id_10F9D._id_10FAA);
  continue;
  }

  if (self._id_10F9D._id_10FA5) {
  if (!_id_9F7A(self._id_10F9D._id_10FAA)) {
  _id_41BB();
  continue;
  }

  var_0 = _id_8195(self._id_10F9D._id_10FAA);

  if (isdefined(var_0._id_65D3._id_3508))
  setomnvar("ui_lockon_target_health_" + var_0._id_92B8, var_0._id_65D3._id_8CB0);

  var_1 = gettime() - self._id_10F9D._id_10FA6;

  if (var_1 < 500)
  continue;

  self notify("stop_lockon_sound");
  self._id_10F9D._id_10FA3 = 1;
  self _meth_8402(self._id_10F9D._id_10FAA);
  _id_F875(self._id_10F9D._id_10FAA);
  setomnvar("ui_lockon_target_state_" + var_0._id_92B8, 2);
  continue;
  }

  var_2 = _id_7E04();

  if (!isdefined(var_2))
  continue;

  setomnvar("ui_lockon_target_state_" + var_2._id_92B8, 1);
  self._id_10F9D._id_10FAA = var_2._id_65D3;
  self._id_10F9D._id_10FA6 = gettime();
  self._id_10F9D._id_10FA5 = 1;
  }
}

stinger_get_closest_to_player_view(var_0, var_1, var_2, var_3) {
  if (!var_0.size)
  return;

  if (!isdefined(var_1))
  var_1 = level.player;

  if (!isdefined(var_3))
  var_3 = -1;

  var_4 = var_1.origin;

  if (isdefined(var_2) && var_2)
  var_4 = var_1 geteye();

  var_5 = undefined;
  var_6 = var_1 getplayerangles();
  var_7 = anglestoforward(var_6);
  var_8 = -1;

  foreach (var_10 in var_0) {
  var_11 = vectortoangles(var_10.origin - var_4);
  var_12 = anglestoforward(var_11);
  var_13 = vectordot(var_7, var_12);
  var_14 = distancesquared(var_4, var_10.origin);
  var_15 = 1 - _id_0B4D::_id_C097(squared(250), squared(5000), var_14);
  var_13 = var_13 * var_15;

  if (var_13 < var_8)
  continue;

  if (var_13 < var_3)
  continue;

  var_8 = var_13;
  var_5 = var_10;
  }

  return var_5;
}

_id_7E04() {
  var_0 = _id_7E4B();
  var_1 = self._id_10F9D._id_AF2F;

  if (isdefined(self._id_10F9D._id_10FAA)) {
  var_0 = scripts\engine\utility::array_remove(var_0, self._id_10F9D._id_10FAA);
  var_1 = scripts\engine\utility::array_remove(var_1, _id_8195(self._id_10F9D._id_10FAA));
  }

  var_2 = [];

  for (var_3 = 0; var_3 < var_0.size; var_3++) {
  var_4 = var_0[var_3];

  if (_id_8C0A(var_4)) {
  var_2[var_2.size] = var_4;
  continue;
  }

  var_5 = _id_8195(var_4);

  if (isdefined(var_5))
  _id_41E3(var_5);
  }

  if (var_2.size == 0)
  return undefined;

  var_6 = [];
  var_7 = 4;

  if (isdefined(self._id_10F9D._id_10FAA))
  var_7--;

  for (var_8 = 0; var_8 < var_7; var_8++) {
  var_4 = stinger_get_closest_to_player_view(var_2, level.player, 1);
  var_6[var_8] = var_4;
  var_2 = scripts\engine\utility::array_remove(var_2, var_4);

  if (var_2.size == 0)
  break;
  }

  var_9 = var_6;

  foreach (var_5 in var_1) {
  if (!scripts\engine\utility::array_contains(var_9, var_5._id_65D3)) {
  _id_41E3(var_5);
  continue;
  }

  var_9 = scripts\engine\utility::array_remove(var_9, var_5._id_65D3);
  }

  foreach (var_4 in var_9)
  _id_1833(var_4);

  foreach (var_15 in var_6) {
  if (_id_9922(var_15))
  return _id_8195(var_15);
  }

  return undefined;
}

_id_7E4B() {
  var_0 = _func_072("axis");

  foreach (var_2 in var_0) {
  if (isdefined(var_2._id_12BA4) && var_2._id_12BA4 == "c12") {
  var_0 = scripts\engine\utility::array_remove(var_0, var_2);
  var_3 = var_2._id_C925;

  if (isdefined(var_3["right_leg"]) && !isdefined(var_3["left_leg"]))
  var_3 = _id_0B91::_id_22B2(var_3, "right_leg");
  else if (isdefined(var_3["left_leg"]) && !isdefined(var_3["right_leg"]))
  var_3 = _id_0B91::_id_22B2(var_3, "left_leg");

  var_0 = scripts\engine\utility::_id_227F(var_0, var_3);
  }
  }

  return var_0;
}

_id_8195(var_0) {
  foreach (var_2 in self._id_10F9D._id_AF2F) {
  if (var_2._id_65D3 == var_0)
  return var_2;
  }

  return undefined;
}

_id_1833(var_0) {
  var_1 = spawnstruct();
  var_1._id_65D3 = var_0;
  var_1._id_92B8 = self._id_10F9D._id_11565[0];
  setomnvar("ui_lockon_target_ent_" + var_1._id_92B8, var_0);
  setomnvar("ui_lockon_target_state_" + var_1._id_92B8, 0);

  if (isdefined(var_0._id_3508)) {
  setomnvar("ui_lockon_target_name_" + var_1._id_92B8, var_0.name);
  setomnvar("ui_lockon_target_health_" + var_1._id_92B8, var_1._id_65D3._id_8CB0);
  }

  self._id_10F9D._id_11565 = scripts\engine\utility::array_remove(self._id_10F9D._id_11565, var_1._id_92B8);
  self._id_10F9D._id_AF2F[self._id_10F9D._id_AF2F.size] = var_1;
}

_id_41E3(var_0) {
  self._id_10F9D._id_AF2F = scripts\engine\utility::array_remove(self._id_10F9D._id_AF2F, var_0);
  self._id_10F9D._id_11565[self._id_10F9D._id_11565.size] = var_0._id_92B8;
  setomnvar("ui_lockon_target_ent_" + var_0._id_92B8, undefined);
  setomnvar("ui_lockon_target_state_" + var_0._id_92B8, 0);
  setomnvar("ui_lockon_target_name_" + var_0._id_92B8, "none");
  setomnvar("ui_lockon_target_health_" + var_0._id_92B8, 0);
}

_id_9922(var_0) {
  return level.player _meth_8409(_id_7E9A(var_0), 65, 45);
}

_id_9920(var_0) {
  return level.player _meth_8409(_id_7E9A(var_0), 65, 75);
}

_id_9921(var_0) {
  return level.player _meth_8409(_id_7E9A(var_0), 65, 35);
}

_id_8C0A(var_0) {
  var_1 = self geteye();
  var_2 = [self, var_0];
  var_3 = _id_7E9A(var_0);

  if (isdefined(var_0._id_3508)) {
  var_2[var_2.size] = var_0._id_3508;

  if (isdefined(var_0._id_3508._id_E601))
  var_2[var_2.size] = var_0._id_3508._id_E601;
  }

  var_4 = scripts\engine\trace::_id_DCED(var_1, var_3, var_2);
  return distancesquared(var_4["position"], var_3) <= 1;
}

_id_7E9A(var_0) {
  var_1 = var_0.origin;

  if (!isdefined(var_0._id_3508)) {
  if (isdefined(var_0._id_12BA4) && tolower(var_0._id_12BA4) == "c8")
  var_2 = 60;
  else
  var_2 = 38;

  var_1 = var_1 + var_2 * anglestoup(var_0.angles);
  }

  return var_1;
}

_id_9F7A(var_0) {
  if (!isdefined(var_0))
  return 0;

  if (!isdefined(var_0._id_3508) && !isalive(var_0) || isdefined(var_0._id_3508) && !isalive(var_0._id_3508))
  return 0;

  if (!_id_9920(var_0))
  return 0;

  if (!_id_8C0A(var_0))
  return 0;

  if (_id_9921(self._id_10F9D._id_10FAA) || self._id_10F9D._id_10FA5 && !self._id_10F9D._id_10FA3)
  return 1;

  var_1 = _id_7E04();

  if (isdefined(var_1) && _id_9921(var_1._id_65D3))
  return 0;

  return 1;
}

_id_D42E() {
  var_0 = self getcurrentweapon();
  var_1 = getweaponbasename(var_0);

  if (!isdefined(var_1) || var_1 != "iw7_lockon")
  return 0;

  if (self getweaponammoclip(var_0) == 0)
  return 0;

  if (self playerads() == 1.0)
  return 1;

  return 0;
}

_id_F875(var_0) {
  var_1 = 250;

  if (!isdefined(var_0))
  return 0;

  var_2 = distance2d(self.origin, var_0.origin);

  if (var_2 < var_1) {
  self._id_10F9D._id_11588 = 1;
  self _meth_8406(1);
  } else {
  self._id_10F9D._id_11588 = 0;
  self _meth_8406(0);
  }
}

_id_B061(var_0, var_1) {
  self endon("stop_lockon_sound");
  self endon("death");

  for (;;) {
  self playlocalsound(var_0);
  wait(var_1);
  }
}

_id_B060(var_0, var_1) {
  self endon("stop_locked_sound");
  self endon("death");

  if (isdefined(self._id_10F9D._id_10FA4))
  return;

  self._id_10F9D._id_10FA4 = 1;

  for (;;) {
  self playlocalsound(var_0);
  wait(var_1 / 3);
  wait(var_1 / 3);
  wait(var_1 / 3);
  }

  self._id_10F9D._id_10FA4 = undefined;
}