/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2734.gsc
***************************************/

_id_EE8B() {
  if (!isdefined(self._id_EDBB) || !isdefined(self._id_EDBA) || !isdefined(self._id_027B)) {
  self delete();
  return;
  }

  if (isdefined(self._id_0334))
  var_0 = getent(self._id_0334).origin;
  else
  var_0 = "undefined";

  if (self._id_EDBA == "OneShotfx") {}

  if (self._id_EDBA == "loopfx") {}

  if (self._id_EDBA == "loopsound")
  return;
}

_id_85BB(var_0) {
  playfx(level._effect["mechanical explosion"], var_0);
  earthquake(0.15, 0.5, var_0, 250);
}

_id_1047A(var_0, var_1, var_2) {
  var_3 = spawn("script_origin", (0, 0, 0));
  var_3.origin = var_1;
  var_3 playloopsound(var_0);

  if (isdefined(var_2))
  var_3 thread _id_1047B(var_2);
}

_id_1047B(var_0) {
  level waittill(var_0);
  self delete();
}

_id_74CB() {
  var_0 = [];
  var_1 = [];
  var_2 = getentarray("vfx_custom_glass", "targetname");

  foreach (var_4 in var_2) {
  if (isdefined(var_4.script_noteworthy)) {
  var_5 = getglass(var_4.script_noteworthy);

  if (isdefined(var_5)) {
  var_1[var_5] = var_4;
  var_0[var_0.size] = var_5;
  }
  }
  }

  var_7 = var_0.size;
  var_8 = var_0.size;
  var_9 = 5;
  var_10 = 0;

  while (var_7 != 0) {
  var_11 = var_10 + var_9 - 1;

  if (var_11 > var_8)
  var_11 = var_8;

  if (var_10 == var_8)
  var_10 = 0;

  while (var_10 < var_11) {
  var_12 = var_0[var_10];
  var_4 = var_1[var_12];

  if (isdefined(var_4)) {
  if (isglassdestroyed(var_12)) {
  var_4 delete();
  var_7--;
  var_1[var_12] = undefined;
  }
  }

  var_10++;
  }

  wait 0.05;
  }
}

_id_2B85(var_0) {
  self waittill("death");
  var_0 delete();
}
