/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2839.gsc
***************************************/

_id_49B4() {
  if (!level.createfx_enabled)
  return;

  _func_2B0();
  level._id_74CF = ::_id_74CF;
  level._id_74D0 = ::_id_74D0;
  level._id_74D3 = scripts\common\createfx::_id_E2AB;
  level._id_74D2 = scripts\common\createfx::_id_D978;
  level._id_74CE = ::_id_74CE;
  level._id_BD5D = 0;
  scripts\engine\utility::_id_227D(_func_072(), ::delete);
  scripts\engine\utility::_id_227D(_func_0C8(), ::delete);
  var_0 = _func_072();
  scripts\engine\utility::_id_227D(var_0, ::delete);
  scripts\common\createfx::_id_49B9();
  thread scripts\common\createfx::_id_49CB();
  thread scripts\common\createfx::_id_74C7();
  level.player _meth_800A(0);
  level.player _meth_8010(0);
  _id_49C3();
  level waittill("eternity");
}

_id_49C3() {
  var_0 = [];
  var_0["trigger_multiple_createart_transient"] = _id_0B90::_id_1272E;

  foreach (var_4, var_2 in var_0) {
  var_3 = getentarray(var_4, "classname");
  scripts\engine\utility::_id_22A1(var_3, var_2);
  }
}

_id_74D0(var_0) {
  if (distancesquared(var_0, level.player.origin) > 4096) {
  setdvar("createfx_playerpos_x", level.player.origin[0]);
  setdvar("createfx_playerpos_y", level.player.origin[1]);
  setdvar("createfx_playerpos_z", level.player.origin[2]);
  }

  return level.player.origin;
}

_id_74CF() {
  var_0 = [];
  var_0[0] = getdvarint("createfx_playerpos_x");
  var_0[1] = getdvarint("createfx_playerpos_y");
  var_0[2] = getdvarint("createfx_playerpos_z");
  level.player setorigin((var_0[0], var_0[1], var_0[2]));
  level.player setplayerangles((0, level.player.angles[1], 0));
}

_id_74CE() {
  _func_1C5("g_speed", level._id_11B7._id_D2C7);
}
