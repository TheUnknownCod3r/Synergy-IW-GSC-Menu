/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2852.gsc
***************************************/

_id_5C21() {
  _id_23C7();
  self _meth_839E();

  if (isdefined(self._id_EE2C))
  self._id_BCD6 = self._id_EE2C;
  else
  self._id_BCD6 = 1;

  if (self.team == "allies") {
  _id_0B55::_id_7B05();
  self _meth_8307(self.name, &"");
  }

  if (isdefined(level._id_5CA7))
  self thread [[level._id_5CA7]]();

  if (!isdefined(self._id_EDB7))
  level thread _id_0B32::_id_73B1(self);

  if (!isdefined(level._id_193D))
  _id_1177B();
}

_id_1177B() {
  if (!isdefined(level._id_5CCB))
  level._id_5CCB = "all";

  var_0 = 0;

  switch (level._id_5CCB) {
  case "all":
  var_0 = 1;
  break;
  case "axis":
  var_0 = self.team == "axis";
  break;
  default:
  break;
  }

  if (var_0)
  self _meth_83BC();
}

_id_5C3A() {
  if (!isdefined(self._id_0334))
  return;

  if (isdefined(level._id_5C63[self._id_0334]))
  return;

  level._id_5C63[self._id_0334] = 1;
  var_0 = self._id_0334;
  var_1 = scripts\engine\utility::_id_817E(var_0, "targetname");

  if (!isdefined(var_1))
  return;

  var_2 = [];
  var_3 = [];
  var_4 = var_1;

  for (;;) {
  var_1 = var_4;
  var_5 = 0;

  for (;;) {
  if (!isdefined(var_1._id_0334))
  break;

  var_6 = scripts\engine\utility::_id_8180(var_1._id_0334, "targetname");

  if (var_6.size)
  break;

  var_7 = undefined;

  foreach (var_9 in var_6) {
  if (isdefined(var_3[var_9.origin + ""]))
  continue;

  var_7 = var_9;
  break;
  }

  if (!isdefined(var_7))
  break;

  var_3[var_7.origin + ""] = 1;
  var_2[var_1._id_0336] = var_7.origin - var_1.origin;
  var_1.angles = vectortoangles(var_2[var_1._id_0336]);
  var_1 = var_7;
  var_5 = 1;
  }

  if (!var_5)
  break;
  }

  var_0 = self._id_0334;
  var_1 = scripts\engine\utility::_id_817E(var_0, "targetname");
  var_11 = var_1;
  var_3 = [];

  for (;;) {
  var_1 = var_4;
  var_5 = 0;

  for (;;) {
  if (!isdefined(var_1._id_0334))
  return;

  if (!isdefined(var_2[var_1._id_0336]))
  return;

  var_6 = scripts\engine\utility::_id_8180(var_1._id_0334, "targetname");

  if (var_6.size)
  break;

  var_7 = undefined;

  foreach (var_9 in var_6) {
  if (isdefined(var_3[var_9.origin + ""]))
  continue;

  var_7 = var_9;
  break;
  }

  if (!isdefined(var_7))
  break;

  if (isdefined(var_1.radius)) {
  var_14 = var_2[var_11._id_0336];
  var_15 = var_2[var_1._id_0336];
  var_16 = (var_14 + var_15) * 0.5;
  var_1.angles = vectortoangles(var_16);
  }

  var_5 = 1;
  var_11 = var_1;
  var_1 = var_7;
  }

  if (!var_5)
  break;
  }
}

_id_23C7() {
  if (isdefined(self.type)) {
  if (self.type == "dog")
  _id_23B5();
  else
  _id_23C9();
  }
}

#using_animtree("generic_human");

_id_23C9() {
  self _meth_83D0(#animtree);
}

#using_animtree("animals");

_id_23B5() {
  self _meth_83D0(#animtree);
}
