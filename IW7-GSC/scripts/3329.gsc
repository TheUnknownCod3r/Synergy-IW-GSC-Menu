/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3329.gsc
***************************************/

_id_952D() {
  scripts\engine\utility::_id_6E39("armageddon_active");
  _id_E1D2();
  _id_952E();
  level._id_B756 = 0.2;
  level._id_B46F = 0.4;
  level._id_5FCC = 10.0;
  level._id_2174 = 20;
  level._id_2175 = 0.15;
}

_id_2179() {
  _id_1755(level._id_2174);
  level thread _id_576A(level._id_2174);

  if (scripts\engine\utility::_id_6E25("armageddon_active"))
  return;

  scripts\engine\utility::_id_6E3E("armageddon_active");
  level thread _id_2178();
  level thread _id_10BA5(self);
}

_id_1755(var_0) {
  level._id_2177 = level._id_2177 + var_0;
}

_id_2178() {
  level endon("game_ended");

  while (level._id_2177 > 0) {
  wait 1;
  level._id_2177--;
  }

  _id_E1D2();
  scripts\engine\utility::_id_6E2A("armageddon_active");
  level notify("armageddon_timeout");
}

_id_10BA5(var_0) {
  level endon("game_ended");
  level endon("armageddon_timeout");

  for (;;) {
  var_1 = _id_DCB4();

  foreach (var_3 in var_1) {
  _id_5CFA(var_3, var_0);
  wait(randomfloatrange(level._id_B756, level._id_B46F));
  }
  }
}

_id_DCB4() {
  var_0 = scripts\engine\utility::_id_22A7(level._id_2173);
  var_1 = [];
  var_2 = [];

  foreach (var_4 in var_0) {
  if (_id_2131(var_4)) {
  var_1[var_1.size] = var_4;
  continue;
  }

  var_2[var_2.size] = var_4;
  }

  var_0 = scripts\engine\utility::_id_227F(var_1, var_2);
  return var_0;
}

_id_2131(var_0) {
  var_1 = min(var_0[0][0], var_0[1][0]);
  var_2 = max(var_0[0][0], var_0[1][0]);
  var_3 = min(var_0[0][1], var_0[1][1]);
  var_4 = max(var_0[0][1], var_0[1][1]);

  foreach (var_6 in level._id_1084F) {
  if (var_1 <= var_6.origin[0] && var_6.origin[0] <= var_2 && (var_3 <= var_6.origin[1] && var_6.origin[1] <= var_4))
  return 1;
  }

  return 0;
}

_id_5CFA(var_0, var_1) {
  var_2 = _id_796B(var_0);

  if (isdefined(var_1) && isplayer(var_1))
  magicbullet("iw7_armageddonmeteor_mp", var_2._id_10B89, var_2._id_62A3, var_1);
  else
  magicbullet("iw7_armageddonmeteor_mp", var_2._id_10B89, var_2._id_62A3, level.players[0]);
}

_id_796B(var_0) {
  if (_id_2131(var_0))
  return _id_7982(var_0);
  else
  return _id_7BE6(var_0);
}

_id_7982(var_0) {
  var_1 = spawnstruct();
  var_2 = min(var_0[0][0], var_0[1][0]);
  var_3 = max(var_0[0][0], var_0[1][0]);
  var_4 = min(var_0[0][1], var_0[1][1]);
  var_5 = max(var_0[0][1], var_0[1][1]);

  foreach (var_7 in level._id_1084F) {
  if (var_2 <= var_7.origin[0] && var_7.origin[0] <= var_3 && (var_4 <= var_7.origin[1] && var_7.origin[1] <= var_5)) {
  var_1._id_10B89 = (var_7.origin[0] + randomfloatrange(-2000, 2000), var_7.origin[1] + randomfloatrange(-2000, 2000), 8000 + randomfloatrange(-1000, 1000));
  var_1._id_62A3 = var_7.origin;
  return var_1;
  }
  }
}

_id_7BE6(var_0) {
  var_1 = spawnstruct();
  var_2 = min(var_0[0][0], var_0[1][0]);
  var_3 = max(var_0[0][0], var_0[1][0]);
  var_4 = min(var_0[0][1], var_0[1][1]);
  var_5 = max(var_0[0][1], var_0[1][1]);
  var_6 = randomfloatrange(var_2, var_3);
  var_7 = randomfloatrange(var_4, var_5);
  var_1._id_10B89 = (var_6, var_7, 8000 + randomfloatrange(-1000, 1000));
  var_1._id_62A3 = scripts\engine\utility::_id_5D14((var_6 + randomfloatrange(-2000, 2000), var_7 + randomfloatrange(-2000, 2000), -8000), 72, -100) + (0, 0, 16);
  return var_1;
}

_id_E1D2() {
  level._id_2177 = 0;
}

_id_9DF5(var_0) {
  if (!(isdefined(var_0) && var_0 == "iw7_armageddonmeteor_mp"))
  return 0;

  return !scripts\engine\utility::_id_9CEE(self._id_6F2D);
}

_id_6F33(var_0, var_1, var_2) {
  if (scripts\engine\utility::_id_9CEE(self._id_6F2D))
  return;

  self endon("death");
  self._id_6F2D = 1;
  self._id_5793 = 1;
  self._id_4C87 = 1;
  var_3 = (self.origin - var_0) * (1, 1, 0);
  var_3 = vectornormalize(var_3);
  var_3 = vectornormalize(var_3 + (0, 0, 1)) * 600;
  self _meth_8366(var_3);
  wait 0.5;
  self._id_6F2D = 0;
  self _meth_80B0(self.maxhealth + 10000, var_1);
}

_id_576A(var_0) {
  wait 1.5;
  earthquake(level._id_2175, var_0 + level._id_5FCC, (742, -853, -85), 5000);
}

_id_952E() {
  level._id_2173 = [];
  var_0 = scripts\engine\utility::_id_8180("armageddon_area_marker", "targetname");

  foreach (var_2 in var_0) {
  var_3 = [];
  var_4 = scripts\engine\utility::_id_817E(var_2._id_0334, "targetname");
  var_3[var_3.size] = var_2.origin;
  var_3[var_3.size] = var_4.origin;
  level._id_2173[level._id_2173.size] = var_3;
  }
}
