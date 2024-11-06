/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2894.gsc
***************************************/

_id_8715(var_0) {
  if (!isdefined(level._id_FC5D))
  level._id_FC5D = [];

  self endon("death");
  self notify("end_mg_behavior");
  self endon("end_mg_behavior");
  self._id_381C = 1;
  self._id_138DC = 0;

  if (!_id_0B4F::_id_13030(var_0)) {
  self notify("continue_cover_script");
  return;
  }

  self._id_A8BB = undefined;
  thread _id_DDE5();
  var_1 = anglestoforward(var_0.angles);
  var_2 = spawn("script_origin", (0, 0, 0));
  thread _id_11513(var_2);
  var_2.origin = var_0.origin + var_1 * 500;

  if (isdefined(self._id_A8BB))
  var_2.origin = self._id_A8BB;

  var_0 settargetentity(var_2);
  var_3 = undefined;

  for (;;) {
  if (!isalive(self._id_4B6D)) {
  _id_10FF2();
  self waittill("new_enemy");
  }

  _id_10C4E();
  _id_FE5E(var_2);

  if (!isalive(self._id_4B6D))
  continue;

  if (self _meth_805F(self._id_4B6D))
  continue;

  self waittill("saw_enemy");
  }
}

_id_11513(var_0) {
  scripts\engine\utility::_id_13762("death", "end_mg_behavior");
  var_0 delete();
}

_id_FE5E(var_0) {
  self endon("death");
  self endon("new_enemy");
  self._id_4B6D endon("death");
  var_1 = self._id_4B6D;

  while (self _meth_805F(var_1)) {
  var_2 = vectortoangles(var_1 geteye() - var_0.origin);
  var_2 = anglestoforward(var_2);
  var_0 moveto(var_0.origin + var_2 * 12, 0.1);
  wait 0.1;
  }

  if (isplayer(var_1)) {
  self endon("saw_enemy");
  var_3 = var_1 geteye();
  var_2 = vectortoangles(var_3 - var_0.origin);
  var_2 = anglestoforward(var_2);
  var_4 = 150;
  var_5 = distance(var_0.origin, self._id_A8BB) / var_4;

  if (var_5 > 0) {
  var_0 moveto(self._id_A8BB, var_5);
  wait(var_5);
  }

  var_6 = var_0.origin + var_2 * 180;
  var_7 = _id_7CC5(self geteye(), var_0.origin, var_6);

  if (!isdefined(var_7))
  var_7 = var_0.origin;

  var_0 moveto(var_0.origin + var_2 * 80 + (0, 0, randomfloatrange(15, 50) * -1), 3, 1, 1);
  wait 3.5;
  var_0 moveto(var_7 + var_2 * -20, 3, 1, 1);
  }

  wait(randomfloatrange(2.5, 4));
  _id_10FF2();
}

_id_F39D(var_0) {
  if (var_0) {
  self._id_381C = 1;

  if (self._id_138DC)
  self._id_129B9 notify("startfiring");
  } else {
  self._id_381C = 0;
  self._id_129B9 notify("stopfiring");
  }
}

_id_10FF2() {
  self._id_138DC = 0;
  self._id_129B9 notify("stopfiring");
}

_id_10C4E() {
  self._id_138DC = 1;

  if (self._id_381C)
  self._id_129B9 notify("startfiring");
}

_id_491C() {
  if (isdefined(level._id_B6B2)) {
  level._id_B6B2[level._id_B6B2.size] = self;
  return;
  }

  level._id_B6B2 = [];
  level._id_B6B2[level._id_B6B2.size] = self;
  waittillframeend;
  var_0 = spawnstruct();
  scripts\engine\utility::_id_22D2(level._id_B6B2, ::_id_B6B1, var_0);
  var_1 = level._id_B6B2;
  level._id_B6B2 = undefined;
  var_0 waittill("gunner_died");

  for (var_2 = 0; var_2 < var_1.size; var_2++) {
  if (!isalive(var_1[var_2]))
  continue;

  var_1[var_2] notify("stop_using_built_in_burst_fire");
  var_1[var_2] thread _id_103FD();
  }
}

_id_B6B1(var_0) {
  self waittill("death");
  var_0 notify("gunner_died");
}

_id_103FE(var_0) {
  var_1 = undefined;

  for (var_2 = 0; var_2 < var_0.size; var_2++) {
  if (!isalive(var_0[var_2]))
  continue;

  var_1 = var_0[var_2];
  break;
  }

  if (!isdefined(var_1))
  return;
}

_id_103FD() {
  self endon("death");

  for (;;) {
  self._id_129B9 _meth_8398();
  wait(randomfloatrange(0.3, 0.7));
  self._id_129B9 _meth_83A3();
  wait(randomfloatrange(0.1, 1.1));
  }
}

_id_5F0C(var_0) {
  for (var_1 = 0; var_1 < var_0.size; var_1++)
  var_0[var_1] endon("death");

  var_2 = 0;
  var_3 = 1;

  for (;;) {
  if (isalive(var_0[var_2]))
  var_0[var_2] _id_F39D(1);

  if (isalive(var_0[var_3]))
  var_0[var_3] _id_F39D(0);

  var_4 = var_2;
  var_2 = var_3;
  var_3 = var_4;
  wait(randomfloatrange(2.3, 3.5));
  }
}

_id_7CC5(var_0, var_1, var_2) {
  var_3 = distance(var_1, var_2) * 0.05;

  if (var_3 < 5)
  var_3 = 5;

  if (var_3 > 20)
  var_3 = 20;

  var_4 = var_2 - var_1;
  var_4 = (var_4[0] / var_3, var_4[1] / var_3, var_4[2] / var_3);
  var_5 = (0, 0, 0);
  var_6 = undefined;

  for (var_7 = 0; var_7 < var_3 + 2; var_7++) {
  var_8 = bullettrace(var_0, var_1 + var_5, 0, undefined);

  if (var_8["fraction"] < 1) {
  var_6 = var_8["position"];
  break;
  }

  var_5 = var_5 + var_4;
  }

  return var_6;
}

_id_DDE5() {
  self endon("death");
  self endon("end_mg_behavior");
  self._id_4B6D = undefined;

  for (;;) {
  _id_DDEB();
  wait 0.05;
  }
}

_id_DDEB() {
  if (!isalive(self._id_010C))
  return;

  if (!self _meth_805F(self._id_010C))
  return;

  self._id_A8BB = self._id_010C geteye();
  self notify("saw_enemy");

  if (!isalive(self._id_4B6D) || self._id_4B6D != self._id_010C) {
  self._id_4B6D = self._id_010C;
  self notify("new_enemy");
  }
}
