/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2874.gsc
***************************************/

_id_83D8(var_0, var_1, var_2, var_3, var_4) {
  init();
  level._id_83D8[var_0] = var_3;
  var_5 = _id_0B91::_id_8181(var_0, "targetname");

  if (!isdefined(var_5))
  return;

  if (!var_5.size)
  return;

  if (!isdefined(var_3))
  var_3 = var_1;

  if (!isdefined(var_2))
  var_2 = randomfloatrange(-20, -15);

  foreach (var_7 in var_5) {
  if (!isdefined(level._effect[var_3]))
  level._effect[var_3] = loadfx(var_1);

  if (!isdefined(var_7.angles))
  var_7.angles = (0, 0, 0);

  var_8 = scripts\engine\utility::_id_49FA(var_3);
  var_8.v["origin"] = var_7.origin;
  var_8.v["angles"] = var_7.angles;
  var_8.v["fxid"] = var_3;
  var_8.v["delay"] = var_2;

  if (isdefined(var_4))
  var_8.v["soundalias"] = var_4;

  if (!isdefined(var_7.script_noteworthy))
  continue;

  var_9 = var_7.script_noteworthy;

  if (!isdefined(level._id_12C7[var_9]))
  level._id_12C7[var_9] = [];

  level._id_12C7[var_9][level._id_12C7[var_9].size] = var_8;
  }
}

init() {
  if (!scripts\engine\utility::_id_16F3("global_FX", ::init))
  return;

  if (!isdefined(level._effect))
  level._effect = [];

  if (!isdefined(level._id_83D8))
  level._id_83D8 = [];

  level._id_12C7 = [];
}
