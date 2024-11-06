/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2895.gsc
***************************************/

_id_967C() {
  level._id_B6C2["easy"]["convergenceTime"] = 2.5;
  level._id_B6C2["easy"]["suppressionTime"] = 3.0;
  level._id_B6C2["easy"]["accuracy"] = 0.38;
  level._id_B6C2["easy"]["aiSpread"] = 2;
  level._id_B6C2["easy"]["playerSpread"] = 0.5;
  level._id_B6C2["medium"]["convergenceTime"] = 1.5;
  level._id_B6C2["medium"]["suppressionTime"] = 3.0;
  level._id_B6C2["medium"]["accuracy"] = 0.38;
  level._id_B6C2["medium"]["aiSpread"] = 2;
  level._id_B6C2["medium"]["playerSpread"] = 0.5;
  level._id_B6C2["hard"]["convergenceTime"] = 0.8;
  level._id_B6C2["hard"]["suppressionTime"] = 3.0;
  level._id_B6C2["hard"]["accuracy"] = 0.38;
  level._id_B6C2["hard"]["aiSpread"] = 2;
  level._id_B6C2["hard"]["playerSpread"] = 0.5;
  level._id_B6C2["fu"]["convergenceTime"] = 0.4;
  level._id_B6C2["fu"]["suppressionTime"] = 3.0;
  level._id_B6C2["fu"]["accuracy"] = 0.38;
  level._id_B6C2["fu"]["aiSpread"] = 2;
  level._id_B6C2["fu"]["playerSpread"] = 0.5;
}

main() {
  if (getdvar("mg42") == "")
  setdvar("mgTurret", "off");

  level._id_B153 = 24;
  var_0 = getentarray("turretInfo", "targetname");

  for (var_1 = 0; var_1 < var_0.size; var_1++)
  var_0[var_1] delete();

  scripts\engine\utility::_id_4914("mg42_drones");
  scripts\engine\utility::_id_4914("mg42_drones_target_trace");
}

_id_D66E() {
  self _meth_8096("weapon_mg42_carry", "tag_origin");
  self endon("death");
  self._id_015C = level._id_4FF6;

  if (isdefined(self._id_0334)) {
  var_0 = getnode(self._id_0334, "targetname");

  if (isdefined(var_0)) {
  if (isdefined(var_0.radius))
  self._id_015C = var_0.radius;

  self _meth_82EE(var_0);
  }
  }

  while (!isdefined(self._id_0205))
  wait 0.05;

  var_1 = undefined;

  if (isdefined(self._id_0334)) {
  var_0 = getnode(self._id_0334, "targetname");
  var_1 = var_0;
  }

  if (!isdefined(var_1))
  var_1 = self._id_0205;

  if (!isdefined(var_1))
  return;

  if (var_1.type != "Turret")
  return;

  var_2 = _id_8194();
  var_2[self._id_0205.origin + ""] = undefined;

  if (isdefined(var_2[var_1.origin + ""]))
  return;

  var_3 = var_1._id_129B9;

  if (isdefined(var_3._id_E1CA))
  return;

  _id_E1C9(var_3);

  if (var_3._id_9F46)
  _id_AB14(var_3);
  else
  _id_E826(var_3);

  _id_0B4E::_id_8715(var_1._id_129B9);
}

_id_B6AB() {
  self waittill("trigger");
  level notify(self._id_0336);
  level._id_B6AB[self._id_0336] = 1;
  self delete();
}

_id_B6BE(var_0) {
  var_0 waittill("trigger");
  var_1 = _func_072("bad_guys");

  for (var_2 = 0; var_2 < var_1.size; var_2++) {
  if (isdefined(var_1[var_2]._id_EE13) && var_0._id_EE13 == var_1[var_2]._id_EE13)
  var_1[var_2] notify("auto_ai");
  }

  var_3 = _func_0C8();

  for (var_2 = 0; var_2 < var_3.size; var_2++) {
  if (isdefined(var_3[var_2]._id_EE13) && var_0._id_EE13 == var_3[var_2]._id_EE13)
  var_3[var_2]._id_19C1 = "auto_ai";
  }

  _id_0B77::_id_A622(var_0);
}

_id_B6A8(var_0) {
  self endon("death");
  self endon("stop_suppressionFire");

  if (!isdefined(self._id_112C7))
  self._id_112C7 = 1;

  for (;;) {
  while (self._id_112C7) {
  self settargetentity(var_0[randomint(var_0.size)]);
  wait(2 + randomfloat(2));
  }

  self cleartargetentity();

  while (!self._id_112C7)
  wait 1;
  }
}

_id_B31A(var_0) {
  var_1 = self.origin;
  self waittill("auto_ai");
  var_0 notify("stopfiring");
  var_0 _meth_830F("auto_ai");
  var_0 settargetentity(level.player);
}

_id_32B6(var_0) {
  if (var_0 == "delay")
  return 0.2;
  else if (var_0 == "delay_range")
  return 0.5;
  else if (var_0 == "burst")
  return 0.5;
  else if (var_0 == "burst_fire_rate")
  return 0.1;
  else
  return 1.5;
}

_id_32B7() {
  self endon("death");
  self endon("stop_burst_fire_unmanned");

  if (isdefined(self._id_ED50))
  var_0 = self._id_ED50;
  else
  var_0 = _id_32B6("delay");

  if (isdefined(self._id_ED4F))
  var_1 = self._id_ED4F - var_0;
  else
  var_1 = _id_32B6("delay_range");

  if (isdefined(self._id_ED26))
  var_2 = self._id_ED26;
  else
  var_2 = _id_32B6("burst");

  if (isdefined(self._id_ED25))
  var_3 = self._id_ED25 - var_2;
  else
  var_3 = _id_32B6("burst_range");

  if (isdefined(self._id_ED24))
  var_4 = self._id_ED24;
  else
  var_4 = _id_32B6("burst_fire_rate");

  var_5 = gettime();
  var_6 = "start";

  if (isdefined(self._id_FC63))
  thread _id_12A2F();

  for (;;) {
  var_7 = (var_5 - gettime()) * 0.001;

  if (self _meth_81A0() && var_7 <= 0) {
  if (var_6 != "fire") {
  var_6 = "fire";
  thread _id_5AAA(var_4);
  }

  var_7 = var_2 + randomfloat(var_3);
  thread _id_12A99(var_7);
  self waittill("turretstatechange");
  var_7 = var_0 + randomfloat(var_1);
  var_5 = gettime() + int(var_7 * 1000);
  continue;
  }

  if (var_6 != "aim")
  var_6 = "aim";

  thread _id_12A99(var_7);
  self waittill("turretstatechange");
  }
}

_id_5AAA(var_0) {
  self endon("death");
  self endon("turretstatechange");
  var_1 = 0.1;

  if (isdefined(var_0))
  var_1 = var_0;

  for (;;) {
  self shootturret();
  wait(var_1);
  }
}

_id_12A2F() {
  self endon("death");
  self endon("stop_burst_fire_unmanned");

  if (isdefined(self._id_FC65))
  self._id_FC66 = 1;

  for (;;) {
  self waittill("turret_fire");
  playfxontag(self._id_FC63, self, "tag_origin");

  if (isdefined(self._id_FC66) && self._id_FC66)
  thread _id_12A30();
  }
}

_id_12A30() {
  self endon("death");
  self._id_FC66 = 0;
  var_0 = self gettagorigin("tag_origin");
  var_1 = scripts\engine\utility::_id_5D14(var_0, -30);
  var_2 = var_0[2] - var_1[2];
  var_3 = var_2 / 300;
  wait(var_3);
  _func_178(self._id_FC65, var_1);
  wait 1;
  self._id_FC66 = 1;
}

_id_12A99(var_0) {
  if (var_0 <= 0)
  return;

  self endon("turretstatechange");
  wait(var_0);

  if (isdefined(self))
  self notify("turretstatechange");
}

_id_DC9D(var_0) {
  self endon("death");
  self notify("stop random_spread");
  self endon("stop random_spread");
  self endon("stopfiring");
  self settargetentity(var_0);

  for (;;) {
  if (isplayer(var_0))
  var_0.origin = self._id_B319 _meth_814F();
  else
  var_0.origin = self._id_B319.origin;

  var_0.origin = var_0.origin + (20 - randomfloat(40), 20 - randomfloat(40), 20 - randomfloat(60));
  wait 0.2;
  }
}

_id_B6A3(var_0) {
  self notify("stop_using_built_in_burst_fire");
  self endon("stop_using_built_in_burst_fire");
  var_0 _meth_83A3();

  for (;;) {
  var_0 waittill("startfiring");
  thread _id_32B5(var_0);
  var_0 _meth_8398();
  var_0 waittill("stopfiring");
  var_0 _meth_83A3();
  }
}

_id_32B5(var_0, var_1) {
  var_0 endon("entitydeleted");
  var_0 endon("stopfiring");
  self endon("stop_using_built_in_burst_fire");

  if (isdefined(var_0._id_ED50))
  var_2 = var_0._id_ED50;
  else
  var_2 = _id_32B6("delay");

  if (isdefined(var_0._id_ED4F))
  var_3 = var_0._id_ED4F - var_2;
  else
  var_3 = _id_32B6("delay_range");

  if (isdefined(var_0._id_ED26))
  var_4 = var_0._id_ED26;
  else
  var_4 = _id_32B6("burst");

  if (isdefined(var_0._id_ED25))
  var_5 = var_0._id_ED25 - var_4;
  else
  var_5 = _id_32B6("burst_range");

  for (;;) {
  var_0 _meth_8398();

  if (isdefined(var_1))
  var_0 thread _id_DC9D(var_1);

  wait(var_4 + randomfloat(var_5));
  var_0 _meth_83A3();
  wait(var_2 + randomfloat(var_3));
  }
}

_id_140E() {
  if (!isdefined(self._id_6E66))
  self._id_6E66 = 0;

  if (!isdefined(self._id_0336))
  return;

  var_0 = getnode(self._id_0336, "target");

  if (!isdefined(var_0))
  return;

  if (!isdefined(var_0._id_EE12))
  return;

  if (!isdefined(var_0._id_B6A2))
  var_0._id_B6A2 = 1;

  self._id_EE12 = var_0._id_EE12;
  var_1 = 1;

  for (;;) {
  if (var_1) {
  var_1 = 0;

  if (isdefined(var_0._id_0336) || self._id_6E66)
  self waittill("get new user");
  }

  if (!var_0._id_B6A2) {
  var_0 waittill("enable mg42");
  var_0._id_B6A2 = 1;
  }

  var_2 = [];
  var_3 = _func_072();

  for (var_4 = 0; var_4 < var_3.size; var_4++) {
  var_5 = 1;

  if (isdefined(var_3[var_4]._id_EE12) && var_3[var_4]._id_EE12 == self._id_EE12)
  var_5 = 0;

  if (isdefined(var_3[var_4]._id_1305C))
  var_5 = 1;

  if (var_5)
  var_2[var_2.size] = var_3[var_4];
  }

  if (var_2.size)
  var_3 = _id_0B91::_id_78AB(var_0.origin, undefined, var_2);
  else
  var_3 = _id_0B91::_id_78AA(var_0.origin, undefined);

  var_2 = undefined;

  if (isdefined(var_3)) {
  var_3 notify("stop_going_to_node");
  var_3 thread _id_0B77::_id_8409(var_0);
  var_3 waittill("death");
  continue;
  }

  self waittill("get new user");
  }
}

_id_B6AA() {
  if (!isdefined(self._id_19C1))
  self._id_19C1 = "manual_ai";

  var_0 = getnode(self._id_0334, "targetname");

  if (!isdefined(var_0))
  return;

  var_1 = getent(var_0._id_0334, "targetname");
  var_1._id_C6EA = var_0.origin;

  if (isdefined(var_1._id_0334)) {
  if (!isdefined(level._id_B6AB) || !isdefined(level._id_B6AB[var_1._id_0334])) {
  level._id_B6AB[var_1._id_0334] = 0;
  getent(var_1._id_0334, "targetname") thread _id_B6AB();
  }

  var_2 = 1;
  }
  else
  var_2 = 0;

  for (;;) {
  if (self._id_00C1 == 0)
  return;

  var_3 = undefined;

  while (!isdefined(var_3)) {
  var_3 = self _meth_80B5();
  wait 1;
  }

  var_3 thread _id_B6A5(var_1, var_2, self._id_19C1);
  var_3 thread _id_B6A3(var_1);
  var_3 waittill("death");

  if (isdefined(self._id_027B)) {
  wait(self._id_027B);
  continue;
  }

  if (isdefined(self._id_ED50) && isdefined(self._id_ED4F)) {
  wait(self._id_ED50 + randomfloat(self._id_ED4F - self._id_ED50));
  continue;
  }

  wait 1;
  }
}

_id_A5F9(var_0, var_1, var_2, var_3) {
  var_0 waittill(var_1);

  if (isdefined(var_2))
  var_2 delete();

  if (isdefined(var_3))
  var_3 delete();
}

_id_B6A5(var_0, var_1, var_2) {
  self endon("death");

  if (var_2 == "manual_ai") {
  for (;;) {
  thread _id_B6A4(var_0, var_1);
  self waittill("auto_ai");
  _id_BC9D(var_0, "auto_ai");
  self waittill("manual_ai");
  }
  } else {
  for (;;) {
  _id_BC9D(var_0, "auto_ai", level.player);
  self waittill("manual_ai");
  thread _id_B6A4(var_0, var_1);
  self waittill("auto_ai");
  }
  }
}

_id_D279() {
  if (!isdefined(level._id_CFE7))
  return 0;

  if (level.player getstance() == "prone")
  return 1;

  if (level._id_CFE8 == "cow" && level.player getstance() == "crouch")
  return 1;

  return 0;
}

_id_10B5A() {
  if (level.player getstance() == "prone")
  return (0, 0, 5);
  else if (level.player getstance() == "crouch")
  return (0, 0, 25);

  return (0, 0, 50);
}

_id_B6A4(var_0, var_1) {
  self endon("death");
  self endon("auto_ai");
  self._id_0223 = 1;
  self _meth_82EF(var_0._id_C6EA);
  self._id_015C = level._id_B153;
  self waittill("goal");

  if (var_1) {
  if (!level._id_B6AB[var_0._id_0334])
  level waittill(var_0._id_0334);
  }

  self._id_0223 = 0;
  var_0 _meth_830F("auto_ai");
  var_0 cleartargetentity();
  var_2 = spawn("script_origin", (0, 0, 0));
  var_3 = spawn("script_model", (0, 0, 0));
  var_3._id_EB9C = 3;

  if (getdvar("mg42") != "off")
  var_3 setmodel("temp");

  var_3 thread _id_116C2(var_0, var_2);
  level thread _id_A5F9(self, "death", var_2, var_3);
  level thread _id_A5F9(self, "auto_ai", var_2, var_3);
  var_0._id_D2F7 = 0;
  var_4 = 0;
  var_5 = getentarray("mg42_target", "targetname");

  if (var_5.size > 0) {
  var_6 = 1;
  var_7 = var_5[randomint(var_5.size)].origin;
  thread _id_FE6F(var_5);
  _id_BC9D(var_0);
  self._id_11515 = var_2;
  var_0 _meth_830F("manual_ai");
  var_0 settargetentity(var_2);
  var_0 notify("startfiring");
  var_8 = 15;
  var_9 = 0.08;
  var_10 = 0.05;
  var_2.origin = var_5[randomint(var_5.size)].origin;
  var_11 = 0;

  while (!isdefined(level._id_CFE7)) {
  var_7 = var_2.origin;

  if (distance(var_7, var_5[self._id_86EA].origin) > var_8) {
  var_12 = vectornormalize(var_5[self._id_86EA].origin - var_7);
  var_12 = var_12 * var_8;
  var_7 = var_7 + var_12;
  }
  else
  self notify("next_target");

  var_2.origin = var_7;
  wait 0.1;
  }

  for (;;) {
  for (var_13 = 0; var_13 < 1; var_13 = var_13 + var_10) {
  var_2.origin = var_7 * (1.0 - var_13) + (level.player _meth_814F() + _id_10B5A()) * var_13;

  if (_id_D279())
  var_13 = 2;

  wait(var_9);
  }

  var_14 = level.player _meth_814F();

  while (!_id_D279()) {
  var_2.origin = level.player _meth_814F();
  var_15 = var_2.origin - var_14;
  var_2.origin = var_2.origin + var_15 + _id_10B5A();
  var_14 = level.player _meth_814F();
  wait 0.1;
  }

  if (_id_D279()) {
  var_11 = gettime() + 1500 + randomfloat(4000);

  while (_id_D279() && isdefined(level._id_CFE7._id_0334) && gettime() < var_11) {
  var_16 = getentarray(level._id_CFE7._id_0334, "targetname");
  var_16 = var_16[randomint(var_16.size)];
  var_2.origin = var_16.origin + (randomfloat(30) - 15, randomfloat(30) - 15, randomfloat(40) - 60);
  wait 0.1;
  }
  }

  self notify("next_target");

  while (_id_D279()) {
  var_7 = var_2.origin;

  if (distance(var_7, var_5[self._id_86EA].origin) > var_8) {
  var_12 = vectornormalize(var_5[self._id_86EA].origin - var_7);
  var_12 = var_12 * var_8;
  var_7 = var_7 + var_12;
  }
  else
  self notify("next_target");

  var_2.origin = var_7;
  wait 0.1;
  }
  }
  } else {
  for (;;) {
  _id_BC9D(var_0);

  while (!isdefined(level._id_CFE7)) {
  if (!var_0._id_D2F7) {
  var_0 settargetentity(level.player);
  var_0._id_D2F7 = 1;
  var_3._id_114F2 = level.player;
  }

  wait 0.2;
  }

  var_0 _meth_830F("manual_ai");
  _id_BC9D(var_0);
  var_0 notify("startfiring");
  var_11 = gettime() + 1500 + randomfloat(4000);

  while (var_11 > gettime()) {
  if (isdefined(level._id_CFE7)) {
  var_16 = getentarray(level._id_CFE7._id_0334, "targetname");
  var_16 = var_16[randomint(var_16.size)];
  var_2.origin = var_16.origin + (randomfloat(30) - 15, randomfloat(30) - 15, randomfloat(40) - 60);
  var_0 settargetentity(var_2);
  var_3._id_114F2 = var_2;
  wait(randomfloat(1));
  continue;
  }

  break;
  }

  var_0 notify("stopfiring");
  _id_BC9D(var_0);

  if (var_0._id_D2F7) {
  var_0 _meth_830F("auto_ai");
  var_0 cleartargetentity();
  var_0._id_D2F7 = 0;
  var_3._id_114F2 = var_3;
  var_3.origin = (0, 0, 0);
  }

  while (isdefined(level._id_CFE7))
  wait 0.2;

  wait(0.75 + randomfloat(0.2));
  }
  }
}

_id_FE6F(var_0) {
  self endon("death");

  for (;;) {
  var_1 = [];

  for (var_2 = 0; var_2 < var_0.size; var_2++)
  var_1[var_2] = 0;

  for (var_2 = 0; var_2 < var_0.size; var_2++) {
  self._id_86EA = randomint(var_0.size);
  self waittill("next_target");

  while (var_1[self._id_86EA]) {
  self._id_86EA++;

  if (self._id_86EA >= var_0.size)
  self._id_86EA = 0;
  }

  var_1[self._id_86EA] = 1;
  }
  }
}

_id_BC9D(var_0, var_1, var_2) {
  self _meth_82EF(var_0._id_C6EA);
  self._id_015C = level._id_B153;
  self waittill("goal");

  if (isdefined(var_1) && var_1 == "auto_ai") {
  var_0 _meth_830F("auto_ai");

  if (isdefined(var_2))
  var_0 settargetentity(var_2);
  else
  var_0 cleartargetentity();
  }

  self _meth_83D7(var_0);
}

_id_116C2(var_0, var_1) {
  if (getdvar("mg42") == "off")
  return;

  self._id_114F2 = self;

  for (;;) {
  self.origin = var_1.origin;
  wait 0.1;
  }
}

_id_12A42(var_0) {
  var_1 = getent(var_0._id_263A, "targetname");
  var_2 = 0.5;

  if (isdefined(var_1._id_EEF6))
  var_2 = var_1._id_EEF6;

  var_3 = 2;

  if (isdefined(var_1._id_EEF5))
  var_2 = var_1._id_EEF5;

  for (;;) {
  var_1 waittill("turret_deactivate");
  wait(var_2 + randomfloat(var_3 - var_2));

  while (!_func_11B(var_1)) {
  _id_129EA(var_0, var_1);
  wait 1.0;
  }
  }
}

_id_129EA(var_0, var_1) {
  var_2 = _func_072();

  for (var_3 = 0; var_3 < var_2.size; var_3++) {
  if (var_2[var_3] _meth_81A5(var_0.origin) && var_2[var_3] _meth_8063(var_1)) {
  var_4 = var_2[var_3]._id_01A4;
  var_2[var_3]._id_01A4 = 0;

  if (!var_2[var_3] _meth_83D4(var_0))
  var_2[var_3]._id_01A4 = var_4;
  }
  }
}

_id_F6C3() {
  _id_967C();
  var_0 = getentarray("misc_turret", "code_classname");
  var_1 = _id_0B91::_id_7E72();

  for (var_2 = 0; var_2 < var_0.size; var_2++) {
  if (isdefined(var_0[var_2]._id_EEAB)) {
  switch (var_0[var_2]._id_EEAB) {
  case "easy":
  var_1 = "easy";
  break;
  case "medium":
  var_1 = "medium";
  break;
  case "hard":
  var_1 = "hard";
  break;
  case "fu":
  var_1 = "fu";
  break;
  default:
  continue;
  }
  }

  _id_B6A7(var_0[var_2], var_1);
  }
}

_id_B6A7(var_0, var_1) {
  var_0._id_00C0 = level._id_B6C2[var_1]["convergenceTime"];
  var_0._id_112CF = level._id_B6C2[var_1]["suppressionTime"];
  var_0._id_0010 = level._id_B6C2[var_1]["accuracy"];
  var_0._id_1B02 = level._id_B6C2[var_1]["aiSpread"];
  var_0._id_D427 = level._id_B6C2[var_1]["playerSpread"];
}

_id_B6A9(var_0, var_1, var_2) {
  if (!isdefined(var_2))
  var_2 = 0.88;

  self endon("death");
  self notify("stop_mg42_target_drones");
  self endon("stop_mg42_target_drones");
  self._id_5CAD = 0;

  if (!isdefined(self._id_ED98))
  self._id_ED98 = 0;

  if (!isdefined(var_0))
  var_0 = 0;

  self _meth_830F("manual_ai");
  var_3 = _id_0B91::_id_7E72();

  if (!isdefined(level._id_5CC3))
  var_4 = 1;
  else
  var_4 = 0;

  for (;;) {
  if (var_4) {
  if (isdefined(self._id_5CC6))
  self _meth_830F(self._id_5041);
  else if (var_0)
  self _meth_830F("auto_nonai");
  else
  self _meth_830F("auto_ai");

  level waittill("new_drone");
  }

  if (!isdefined(self._id_C3EA))
  self._id_C3EA = self._id_00C0;

  self._id_00C0 = 2;

  if (!var_0) {
  var_5 = self _meth_8165();

  if (!isalive(var_5) || isplayer(var_5)) {
  wait 0.05;
  continue;
  }
  else
  var_1 = var_5.team;
  }
  else
  var_5 = undefined;

  if (var_1 == "allies")
  var_6 = "axis";
  else
  var_6 = "allies";

  while (level._id_5CC3[var_6]._id_A9A1) {
  scripts\engine\utility::_id_AED4("mg42_drones");

  if (!level._id_5CC3[var_6]._id_A9A1) {
  scripts\engine\utility::_id_12BD1("mg42_drones");
  break;
  }

  var_7 = _id_7868(var_6, var_2);
  scripts\engine\utility::_id_12BD1("mg42_drones");

  if (!isdefined(self._id_ED98) || !self._id_ED98) {
  wait 0.05;
  break;
  }

  if (!isdefined(var_7)) {
  wait 0.05;
  break;
  }

  if (isdefined(self._id_1F5F))
  [[self._id_1F5F]]();

  if (var_0)
  self _meth_830F("manual");
  else
  self _meth_830F("manual_ai");

  self settargetentity(var_7, (0, 0, 32));
  _id_5C88(var_7, 1, var_2);
  self cleartargetentity();
  self _meth_83A3();

  if (!var_0 && !(isdefined(self _meth_8165()) && self _meth_8165() == var_5))
  break;
  }

  self._id_00C0 = self._id_C3EA;
  self._id_C3EA = undefined;
  self cleartargetentity();
  self _meth_83A3();

  if (level._id_5CC3[var_6]._id_A9A1) {
  var_4 = 0;
  continue;
  }

  var_4 = 1;
  }
}

_id_5C88(var_0, var_1, var_2) {
  self endon("death");
  var_0 endon("death");
  var_3 = gettime() + var_1 * 1000;
  var_4 = 0;

  while (var_3 > gettime() || var_4) {
  scripts\engine\utility::_id_AED4("mg42_drones_target_trace");
  var_5 = self getturrettarget(1);

  if (!bullettracepassed(self gettagorigin("tag_flash"), var_0.origin + (0, 0, 40), 0, var_0)) {
  scripts\engine\utility::_id_12BD1("mg42_drones_target_trace");
  break;
  }
  else if (isdefined(var_5) && distance(var_5.origin, self.origin) < distance(self.origin, var_0.origin)) {
  scripts\engine\utility::_id_12BD1("mg42_drones_target_trace");
  break;
  }

  if (!var_4) {
  self _meth_8398();
  var_4 = 1;
  }

  _id_0B91::_id_12BDD("mg42_drones_target_trace");
  }

  self _meth_83A3();
  _id_0B91::_id_11165(level._id_5CC3[var_0.team], 1);
}

_id_7868(var_0, var_1) {
  if (level._id_5CC3[var_0]._id_A9A1 < 1)
  return;

  var_2 = undefined;
  var_3 = anglestoforward(self.angles);

  for (var_4 = 0; var_4 < level._id_5CC3[var_0]._id_A9A1; var_4++) {
  if (!isdefined(level._id_5CC3[var_0]._id_2274[var_4]))
  continue;

  var_5 = vectortoangles(level._id_5CC3[var_0]._id_2274[var_4].origin - self.origin);
  var_6 = anglestoforward(var_5);

  if (vectordot(var_3, var_6) < var_1)
  continue;

  var_2 = level._id_5CC3[var_0]._id_2274[var_4];

  if (!bullettracepassed(self gettagorigin("tag_flash"), var_2 _meth_810C(), 0, var_2)) {
  var_2 = undefined;
  continue;
  }

  break;
  }

  var_7 = self getturrettarget(1);

  if (!isdefined(self._id_D836)) {
  if (isdefined(var_2) && isdefined(var_7) && distancesquared(self.origin, var_7.origin) < distancesquared(self.origin, var_2.origin))
  var_2 = undefined;
  }

  return var_2;
}

_id_EB7D() {
  var_0 = getentarray("misc_turret", "code_classname");
  var_1 = [];

  foreach (var_3 in var_0) {
  if (isdefined(var_3._id_0336))
  continue;

  if (isdefined(var_3._id_EEF4) && var_3._id_EEF4)
  continue;

  if (isdefined(var_3._id_9FF0))
  continue;

  var_1[var_1.size] = var_3;
  }

  if (!var_1.size)
  return;

  var_5 = var_1;

  foreach (var_7 in var_1) {
  foreach (var_9 in getnodesinradius(var_7.origin, 50, 0)) {
  if (var_9.type == "Path")
  continue;

  if (var_9.type == "Begin")
  continue;

  if (var_9.type == "End")
  continue;

  var_10 = anglestoforward((0, var_9.angles[1], 0));
  var_11 = anglestoforward((0, var_7.angles[1], 0));
  var_12 = vectordot(var_10, var_11);

  if (var_12 < 0.9)
  continue;

  var_5 = scripts\engine\utility::array_remove(var_5, var_7);
  var_9._id_12A72 = spawn("script_origin", var_7.origin);
  var_9._id_12A72.angles = var_7.angles;
  var_9._id_12A72._id_0205 = var_9;
  var_9._id_12A72._id_01B8 = 45;
  var_9._id_12A72._id_0269 = 45;
  var_9._id_12A72._id_0349 = 15;
  var_9._id_12A72._id_006B = 15;

  if (isdefined(var_7._id_01B8))
  var_9._id_12A72._id_01B8 = min(var_7._id_01B8, 45);

  if (isdefined(var_7._id_0269))
  var_9._id_12A72._id_0269 = min(var_7._id_0269, 45);

  if (isdefined(var_7._id_0349))
  var_9._id_12A72._id_0349 = min(var_7._id_0349, 15);

  if (isdefined(var_7._id_006B))
  var_9._id_12A72._id_006B = min(var_7._id_006B, 15);

  var_7 delete();
  }
  }
}

_id_263B() {
  var_0 = getentarray("misc_turret", "code_classname");
  var_1 = [];

  foreach (var_3 in var_0) {
  if (!isdefined(var_3._id_0336) || tolower(var_3._id_0336) != "auto_mgturret")
  continue;

  if (!isdefined(var_3._id_6A0B))
  continue;

  if (!isdefined(var_3._id_ED69))
  var_1[var_1.size] = var_3;
  }

  if (!var_1.size)
  return;

  var_5 = var_1;

  foreach (var_7 in var_1) {
  foreach (var_9 in getnodesinradius(var_7.origin, 70)) {
  if (var_9.type == "Path")
  continue;

  if (var_9.type == "Begin")
  continue;

  if (var_9.type == "End")
  continue;

  var_10 = anglestoforward((0, var_9.angles[1], 0));
  var_11 = anglestoforward((0, var_7.angles[1], 0));
  var_12 = vectordot(var_10, var_11);

  if (var_12 < 0.9)
  continue;

  var_5 = scripts\engine\utility::array_remove(var_5, var_7);
  var_9._id_129B9 = var_7;
  var_7._id_0205 = var_9;
  var_7._id_9F46 = 1;
  }
  }
}

_id_EB66() {
  self._id_FC5E = [];
  self._id_FC5E["connected"] = [];
  self._id_FC5E["ambush"] = [];

  if (!isdefined(self._id_6A0B))
  return;

  if (!isdefined(level._id_FC5D))
  level._id_FC5D = [];

  level._id_FC5D[self._id_6A0B] = self;

  if (isdefined(self._id_EEF7)) {
  var_0 = strtok(self._id_EEF7, " ");

  for (var_1 = 0; var_1 < var_0.size; var_1++)
  self._id_FC5E["connected"][var_0[var_1]] = 1;
  }

  if (isdefined(self._id_EEF3)) {
  var_0 = strtok(self._id_EEF3, " ");

  for (var_1 = 0; var_1 < var_0.size; var_1++)
  self._id_FC5E["ambush"][var_0[var_1]] = 1;
  }
}

_id_E2DA() {
  self notify("gun_placed_again");
  self endon("gun_placed_again");
  self waittill("restore_default_drop_pitch");
  wait 1;
  self _meth_8264();
}

_id_5EEF() {
  thread _id_5EF0();
}

_id_5EF0() {
  var_0 = spawn("script_model", (0, 0, 0));
  var_0.origin = self gettagorigin(level._id_D66F);
  var_0.angles = self gettagangles(level._id_D66F);
  var_0 setmodel(self._id_12A78);
  var_1 = anglestoforward(self.angles);
  var_1 = var_1 * 100;
  var_0 movegravity(var_1, 0.5);
  self _meth_8096(self._id_12A78, level._id_D66F);
  self._id_12A78 = undefined;
  wait 0.7;
  var_0 delete();
}

_id_12A60() {
  self endon("kill_turret_detach_thread");
  self endon("dropped_gun");
  self waittill("death");

  if (!isdefined(self))
  return;

  _id_5EEF();
}

_id_12A61() {
  self endon("death");
  self endon("kill_turret_detach_thread");
  self waittill("dropped_gun");
  self _meth_8096(self._id_12A78, level._id_D66F);
}

_id_E2DB() {
  self._id_E80C = undefined;
  _id_0B91::_id_F2A4(scripts\anim\init::_id_0104);
}

_id_E2E2() {
  self waittill("turret_deactivate");
  self _meth_8264();
}

_id_12DB9(var_0) {
  self endon("death");
  self endon("end_mg_behavior");
  self endon("stop_updating_enemy_target_pos");

  for (;;) {
  self waittill("saw_enemy");
  var_0.origin = self._id_A8BB;
  }
}

_id_BC78(var_0, var_1) {
  self endon("death");
  self endon("end_mg_behavior");
  self endon("stop_updating_enemy_target_pos");
  var_2 = self._id_129B9.origin + (0, 0, 16);
  var_3 = var_1.origin + (0, 0, 16);

  for (;;) {
  wait 0.05;

  if (sighttracepassed(var_0.origin, var_3, 0, undefined))
  continue;

  var_4 = vectortoangles(var_2 - var_0.origin);
  var_5 = anglestoforward(var_4);
  var_5 = var_5 * 8;
  var_0.origin = var_0.origin + var_5;
  }
}

_id_DDE3(var_0) {
  self endon("death");
  self endon("end_mg_behavior");
  self endon("stop_updating_enemy_target_pos");
  var_0._id_2FAE = [];

  for (;;) {
  var_0._id_2FAE[var_0._id_2FAE.size] = self.origin + (0, 0, 50);
  wait 0.35;
  }
}

_id_1A30(var_0, var_1) {
  if (!isalive(self._id_4B6D) && self _meth_805F(self._id_4B6D)) {
  var_1.origin = self._id_A8BB;
  return;
  }

  var_2 = anglestoforward(var_0.angles);

  for (var_3 = var_1._id_2FAE.size - 3; var_3 >= 0; var_3--) {
  var_4 = var_1._id_2FAE[var_3];
  var_5 = vectornormalize(var_4 - var_0.origin);
  var_6 = vectordot(var_2, var_5);

  if (var_6 < 0.75)
  continue;

  var_1.origin = var_4;

  if (sighttracepassed(var_0.origin, var_4, 0, undefined))
  continue;

  break;
  }
}

_id_6C73(var_0) {
  var_1 = _id_7BC7(var_0);
  var_2 = var_1["spot"];
  var_3 = var_1["type"];

  if (!isdefined(var_2))
  return;

  _id_E1C9(var_2);
  thread _id_12DB9(var_0);
  thread _id_BC78(var_0, var_2);

  if (var_3 == "ambush")
  thread _id_DDE3(var_0);

  if (var_2._id_9F46)
  _id_AB14(var_2);
  else
  {
  _id_CB35(var_2);
  _id_E826(var_2);
  }

  self notify("stop_updating_enemy_target_pos");

  if (var_3 == "ambush")
  _id_1A30(var_2, var_0);

  var_2 settargetentity(var_0);
}

_id_10389(var_0) {
  var_0 _meth_830F("manual");
  wait 0.5;
  var_0 _meth_830F("manual_ai");
}

_id_AB14(var_0) {
  self _meth_83AF();
  scripts\anim\shared::_id_CC2C(self.primaryweapon, "none");
  var_1 = _id_7D25(var_0);
  var_2 = _func_0CE(var_0.origin, var_0.angles, var_1);
  self _meth_8331(var_2);
  self waittill("runto_arrived");
  _id_13030(var_0);
}

_id_CB35(var_0) {
  self _meth_83AF();
  self._id_129B9 _id_8EAE();
}

_id_7D25(var_0) {
  var_1 = [];
  var_1["saw_bipod_stand"] = level._id_B6B0["bipod_stand_setup"];
  var_1["saw_bipod_crouch"] = level._id_B6B0["bipod_crouch_setup"];
  var_1["saw_bipod_prone"] = level._id_B6B0["bipod_prone_setup"];
  return var_1[var_0._id_039B];
}

_id_E826(var_0) {
  var_1 = self.health;
  var_0 endon("turret_deactivate");
  self._id_B6A1 = var_0;
  self endon("death");
  self endon("dropped_gun");
  var_2 = _id_7D25(var_0);
  self._id_12A78 = "weapon_mg42_carry";
  self notify("kill_get_gun_back_on_killanimscript_thread");
  scripts\anim\shared::_id_CC2C(self.weapon, "none");

  if (self isbadguy())
  self.health = 1;

  self attach(self._id_12A78, level._id_D66F);
  thread _id_12A60();
  var_3 = _func_0CE(var_0.origin, var_0.angles, var_2);
  self _meth_8331(var_3);
  wait 0.05;
  _id_0B91::_id_F2A4(scripts\anim\combat::_id_68C7);
  scripts\engine\utility::_id_414E("move");
  _id_0B91::_id_F398("cover_crouch", ::_id_906E);

  while (distance(self.origin, var_3) > 16) {
  self _meth_8331(var_3);
  wait 0.05;
  }

  self notify("kill_turret_detach_thread");

  if (self isbadguy())
  self.health = var_1;

  if (soundexists("weapon_setup"))
  _func_178("weapon_setup", self.origin);

  self _meth_8018("setup_done", var_0.origin, var_0.angles, var_2);
  _id_E2DB();
  self waittillmatch("setup_done", "end");
  var_0 notify("restore_default_drop_pitch");
  var_0 _id_10106();
  scripts\anim\shared::_id_CC2C(self.primaryweapon, "right");
  _id_13030(var_0);
  self _meth_8096(self._id_12A78, level._id_D66F);
  _id_0B91::_id_F2A4(scripts\anim\init::_id_0104);
  self notify("bcs_portable_turret_setup");
}

_id_BC92() {
  self _meth_8331(self._id_E894);
}

_id_906E() {
  self endon("killanimscript");
  self waittill("death");
}

_id_130FD() {
  if (!isdefined(self._id_129B9))
  return 0;

  return self._id_129B9.owner == self;
}

_id_12A4E() {
  if (!_id_130FD()) {
  scripts\engine\utility::_id_414E("move");
  return;
  }

  var_0 = _id_6C84("connected");
  var_1 = var_0["spots"];

  if (!var_1.size) {
  scripts\engine\utility::_id_414E("move");
  return;
  }

  var_2 = self._id_0205;

  if (!isdefined(var_2) || !scripts\engine\utility::array_contains(var_1, var_2)) {
  var_3 = _id_8194();

  for (var_4 = 0; var_4 < var_1.size; var_4++) {
  var_2 = scripts\engine\utility::_id_DC6B(var_1);

  if (isdefined(var_3[var_2.origin + ""]))
  return;
  }
  }

  var_5 = var_2._id_129B9;

  if (isdefined(var_5._id_E1CA))
  return;

  _id_E1C9(var_5);

  if (var_5._id_9F46)
  _id_AB14(var_5);
  else
  _id_E826(var_5);

  _id_0B4E::_id_8715(var_2._id_129B9);
}

_id_13030(var_0) {
  var_1 = self _meth_83D7(var_0);

  if (var_1) {
  _id_0B91::_id_F398("move", ::_id_12A4E);
  self._id_129B9 = var_0;
  thread _id_B6A3(var_0);
  var_0 _meth_830F("manual_ai");
  var_0 thread _id_E2E2();
  self._id_129B9 = var_0;
  var_0.owner = self;
  return 1;
  } else {
  var_0 _meth_8264();
  return 0;
  }
}

_id_7BC7(var_0) {
  var_1 = [];
  var_1[var_1.size] = ::_id_6C8D;
  var_1[var_1.size] = ::_id_6C90;
  var_1 = scripts\engine\utility::_id_22A7(var_1);

  for (var_2 = 0; var_2 < var_1.size; var_2++) {
  var_3 = [[var_1[var_2]]](var_0);

  if (!isdefined(var_3["spots"]))
  continue;

  var_3["spot"] = scripts\engine\utility::_id_DC6B(var_3["spots"]);
  return var_3;
  }
}

_id_8194() {
  var_0 = [];
  var_1 = _func_072();

  for (var_2 = 0; var_2 < var_1.size; var_2++) {
  if (!isdefined(var_1[var_2]._id_0205))
  continue;

  var_0[var_1[var_2]._id_0205.origin + ""] = 1;
  }

  return var_0;
}

_id_6C84(var_0) {
  var_1 = level._id_FC5D;
  var_2 = [];
  var_3 = getarraykeys(var_1);
  var_4 = _id_8194();
  var_4[self._id_0205.origin + ""] = undefined;

  for (var_5 = 0; var_5 < var_3.size; var_5++) {
  var_6 = var_3[var_5];

  if (var_1[var_6] == self._id_129B9)
  continue;

  var_7 = getarraykeys(self._id_129B9._id_FC5E[var_0]);

  for (var_8 = 0; var_8 < var_7.size; var_8++) {
  if (var_1[var_6]._id_6A0B + "" != var_7[var_8])
  continue;

  if (isdefined(var_1[var_6]._id_E1CA))
  continue;

  if (isdefined(var_4[var_1[var_6]._id_0205.origin + ""]))
  continue;

  if (distance(self._id_015B, var_1[var_6].origin) > self._id_015C)
  continue;

  var_2[var_2.size] = var_1[var_6];
  }
  }

  var_9 = [];
  var_9["type"] = var_0;
  var_9["spots"] = var_2;
  return var_9;
}

_id_6C90(var_0) {
  return _id_6C84("ambush");
}

_id_6C8D(var_0) {
  var_1 = _id_6C84("connected");
  var_2 = var_1["spots"];

  if (!var_2.size)
  return;

  var_3 = [];

  for (var_4 = 0; var_4 < var_2.size; var_4++) {
  if (!scripts\engine\utility::within_fov(var_2[var_4].origin, var_2[var_4].angles, var_0.origin, 0.75))
  continue;

  if (!sighttracepassed(var_0.origin, var_2[var_4].origin + (0, 0, 16), 0, undefined))
  continue;

  var_3[var_3.size] = var_2[var_4];
  }

  var_1["spots"] = var_3;
  return var_1;
}

_id_D670() {
  _id_EB66();
  var_0 = 1;
  self._id_9F46 = 1;
  self._id_E1CA = undefined;

  if (isdefined(self._id_9FF0))
  return;

  if (self._id_02AF & var_0)
  return;

  _id_8EAE();
}

_id_8EAE() {
  self notify("stop_checking_for_flanking");
  self._id_9F46 = 0;
  self hide();
  self._id_103FB = 0;
  self makeunusable();
  self setdefaultdroppitch(0);
  thread _id_E2DA();
}

_id_10106() {
  self show();
  self._id_103FB = 1;
  self makeusable();
  self._id_9F46 = 1;
  thread _id_1101D();
}

_id_1101D() {
  self endon("stop_checking_for_flanking");
  self waittill("turret_deactivate");

  if (isalive(self.owner))
  self.owner notify("end_mg_behavior");
}

_id_12A05(var_0) {
  var_1 = var_0 _meth_8165();

  if (!isdefined(var_1))
  return 0;

  return var_1 == self;
}

_id_6304(var_0) {
  _id_13818(var_0);
  var_0._id_E1CA = undefined;
}

_id_13818(var_0) {
  var_0 endon("turret_deactivate");
  self endon("death");
  self waittill("end_mg_behavior");
}

_id_E1C9(var_0) {
  var_0._id_E1CA = self;
  thread _id_6304(var_0);
}
