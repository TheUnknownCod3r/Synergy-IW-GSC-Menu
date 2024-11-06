/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2897.gsc
***************************************/

_id_B8CB() {
  if (!isdefined(level._id_FD6E))
  level._id_FD6E = spawnstruct();

  return level._id_FD6E;
}

_id_E3C6(var_0, var_1, var_2, var_3, var_4) {
  level notify("stop jackal landing");
  level endon("stop jackal landing");

  if (getdvarint("skip_nextmission", 0))
  var_0 = 0;
  else if (!isdefined(var_0))
  var_0 = 1;

  if (!isdefined(var_1))
  var_1 = 1;

  _id_0BDC::_id_137CF();
  level._id_FD6E._id_E35D thread _id_0BDB::_id_A2F2(undefined, var_4);
  level waittill("player_jackal_drone_dock");

  if (var_1) {
  if (isdefined(var_2)) {
  if (isdefined(level._id_B8D2._id_ABFA[_id_0B28::_id_7F6B(var_2)]._id_D845)) {
  var_5 = scripts\engine\utility::_id_2279(level._id_B8D2._id_ABFA[_id_0B28::_id_7F6B(var_2)]._id_D845, var_2);
  _func_27E(var_5);
  }
  else
  _func_27E(var_2);
  }
  else
  level thread _id_0B91::_id_BF97();
  }

  level waittill("jackal_taxi_complete");

  if (var_0) {
  if (isdefined(var_2)) {
  _func_1C5("bg_cinematicAboveUI", "0");
  _func_1C5("bg_cinematicFullScreen", "1");
  _func_1C5("bg_cinematicCanPause", "1");
  var_6 = level._id_B8D2._id_ABFA[_id_0B28::_id_7F6B(var_2)]._id_2AD3;
  setdvar("last_transition_movie", var_6);
  _func_03D(var_6, 0, 1);
  _func_039(var_2);
  }
  else
  _id_0B91::_id_BF95();
  }
}

_id_E3C7(var_0) {
  level.player endon("death");
  var_1 = level._id_FD6E._id_E35D._id_12BA3;

  if (!isdefined(level._id_FD6E._id_E35D._id_12BA3))
  var_1 = "_ignore_last_sparam";

  var_2 = _id_0EFB::_id_7994("ret_jackal_spawner_1", "targetname", var_1);

  if (var_2.size != 1)
  return;

  switch (var_0) {
  case "player":
  var_3 = _id_0EFB::_id_798E("ret_jackal_spawner_1", "targetname", var_1);
  var_4 = var_3 _id_0B91::_id_10808();
  var_4 _meth_83E7(level._id_FD6E._id_E35D._id_A0C9.origin + (0, 0, -138), level._id_FD6E._id_E35D._id_A0C9.angles);
  var_4 _id_0BDC::_id_6B4C("none");
  var_4 _id_0BDC::_id_F43D("player");
  var_4 scripts\engine\utility::delaythread(0.0, _id_0BDC::_id_A167);
  level thread _id_0BDC::_id_10CD1(var_4, undefined, "retribution");
  break;
  case "jackal_bay_1":
  break;
  case "jackal_bay_2":
  break;
  case "jackal_bay_3":
  break;
  case "jackal_bay_4":
  break;
  }
}

_id_B8CA(var_0) {
  _id_B8CB();
  level._id_FD6E._id_E35D = _id_973A("retribution", var_0);
  level._id_FD6E._id_E35D._id_12BA3 = var_0;
}

_id_ACE8() {
  while (!isdefined(level._id_D127))
  wait 0.05;
}

#using_animtree("script_model");

_id_973A(var_0, var_1) {
  var_2 = getentarray(var_0 + "_shipcrib", "script_noteworthy");

  if (isdefined(var_1))
  var_2 = _id_0EFB::_id_7994(var_0 + "_shipcrib", "script_noteworthy", var_1);
  else
  var_1 = "_ignore_last_sparam";

  var_3 = var_2;
  var_4 = undefined;

  foreach (var_6 in var_2) {
  if (isdefined(var_6._id_EE52) && var_6._id_EE52 == "root") {
  var_4 = var_6;
  var_2 = scripts\engine\utility::array_remove(var_2, var_6);
  break;
  }
  }

  foreach (var_6 in var_2) {
  if (isdefined(var_6._id_EE52)) {
  switch (var_6._id_EE52) {
  case "jackal_runway":
  var_4._id_E8AD = var_6;
  var_4._id_E8AD linkto(var_4);
  break;
  case "jackal_runway_r":
  var_4._id_E8CB = var_6;
  var_4._id_E8CB linkto(var_4);
  break;
  case "refl_probe":
  var_6 linkto(var_4);
  break;
  }
  }
  }

  var_10 = [];
  var_11 = [];
  var_12 = [];
  var_13 = [];
  var_14 = [];
  var_15 = undefined;
  var_16 = undefined;

  foreach (var_6 in var_2) {
  if (isdefined(var_6._id_EE52)) {
  switch (var_6._id_EE52) {
  case "bink_klaxon":
  var_10 = scripts\engine\utility::_id_2279(var_10, var_6);
  break;
  case "bink_fill_lights":
  var_11 = scripts\engine\utility::_id_2279(var_11, var_6);
  break;
  case "bink_flashing_lights":
  var_12 = scripts\engine\utility::_id_2279(var_12, var_6);
  break;
  case "jackal_runway_final_dest":
  var_4._id_E8AD._id_6C1E = var_6;
  var_4._id_E8AD._id_6C1E linkto(var_4);
  var_4._id_E8CB._id_6C1E = var_6;
  break;
  case "runway_hangar_light":
  var_13 = scripts\engine\utility::_id_2279(var_13, var_6);
  var_6 linkto(var_4);
  break;
  case "trigger_flag_on_runway":
  var_6 _meth_80D2();
  var_6 linkto(var_4);
  var_4._id_E8AD._id_12713 = var_6;
  break;
  case "runway_light":
  if (!scripts\engine\utility::_id_7628("vfx_glow_red_light_400_strobe"))
  scripts\engine\utility::_id_16DE("vfx_glow_red_light_400_strobe", "vfx/misc/lights/vfx_glow_red_light_400_strobe.vfx");

  playfxontag(scripts\engine\utility::_id_7ECB("vfx_glow_red_light_400_strobe"), var_6, "light_on_LOD0");
  break;
  case "drone_receiver":
  var_14 = scripts\engine\utility::_id_2279(var_14, var_6);
  var_6 _meth_83D0(#animtree);
  var_6 _meth_82A2(%machinery_landing_drone_recovery, 1, 0, 0);
  var_6 linkto(var_4);
  break;
  case "ret_hangar_door":
  var_16 = var_6;
  var_6 linkto(var_4);
  break;
  case "ret_hangar_door_end":
  var_15 = var_6;
  var_6 notsolid();
  var_6 hide();
  var_6 linkto(var_4);
  break;
  }
  }
  }

  foreach (var_20 in var_10) {
  var_20 _meth_83D0(#animtree);
  var_20._id_ACC9 = [];
  var_21 = getentarray(var_20._id_0334, "targetname");

  foreach (var_23 in var_21) {
  if (var_23.code_classname == "light") {
  var_23 linkto(var_20, "j_spin");
  var_23._id_9C2E = 1;
  var_20._id_ACC9[var_20._id_ACC9.size] = var_23;
  }

  if (var_23.code_classname == "script_model") {
  var_20._id_A6EC = var_23;
  var_23._id_9C2E = 1;
  var_23 linkto(var_20);
  }
  }

  var_20 hide();
  var_20._id_A6EC show();
  }

  if (isdefined(var_16)) {
  var_16._id_10B89 = scripts\engine\utility::_id_107E6();
  var_16._id_10B89.origin = var_16.origin;
  var_16._id_10B89.angles = var_16.angles;
  var_16._id_10B89 linkto(var_4);
  var_16._id_62A3 = var_15;
  }

  var_4._id_E8AD._id_2ADB = var_10;
  var_4._id_E8CB._id_2ADB = var_10;
  var_4._id_E8AD._id_2AD8 = var_11;
  var_4._id_E8CB._id_2AD8 = var_11;
  var_4._id_E8AD._id_2ADA = var_12;
  var_4._id_E8CB._id_2ADA = var_12;
  var_4._id_E8AD._id_8A9D = var_13;
  var_4._id_E8CB._id_8A9D = var_13;
  var_4._id_E8AD._id_5C6C = var_14;
  var_4._id_E8CB._id_5C6C = var_14;
  var_4._id_E8AD._id_E311 = var_16;
  var_4._id_E8CB._id_E311 = var_16;

  foreach (var_6 in var_2) {
  switch (var_6.code_classname) {
  case "trigger_multiple":
  case "script_vehicle":
  break;
  case "light":
  case "script_model":
  case "script_brushmodel":
  default:
  if (isdefined(var_6._id_9C2E))
  break;

  var_6 linkto(var_4);
  break;
  }
  }

  var_28 = _id_0EFB::_id_7CC1("ret_jackal_bay_1", "script_noteworthy", var_1);
  var_29 = _id_0EFB::_id_7994("ret_jackal_bay_1", "script_noteworthy", var_1);
  var_30 = _id_0B91::_id_22A2(var_28, var_29);

  foreach (var_32 in var_30) {
  if (isdefined(var_32._id_EE52)) {
  switch (var_32._id_EE52) {
  case "clamp_pos1":
  var_4._id_A0C9 = var_32;
  break;
  case "clamp_pos2":
  var_4._id_A0CC = var_32;
  break;
  case "door_end_top":
  var_33 = getent(var_32._id_0334, "targetname");
  var_33 linkto(var_32);
  var_32 rotateto(var_32.angles + (110, 0, 0), 0.05);
  var_4._id_A0CB = var_32;
  break;
  case "door_end_bottom":
  var_33 = getent(var_32._id_0334, "targetname");
  var_33 linkto(var_32);
  var_32 rotateto(var_32.angles + (-110, 0, 0), 0.05);
  var_4._id_A0CA = var_32;
  break;
  }
  }
  }

  var_4 attach("veh_mil_air_un_retribution_rig");
  var_4._id_E505 = "veh_mil_air_un_retribution_rig";
  var_4 thread _id_10635();
  var_4._id_C92D = var_3;
  return var_4;
}

_id_B8C9() {
  _id_5192(level._id_FD6E._id_BA43);
  _id_5192(level._id_FD6E._id_118A8);
  _id_5192(level._id_FD6E._id_E35D);
}

_id_5192() {
  var_0 = getentarray(self.script_noteworthy, "script_noteworthy");
  scripts\engine\utility::_id_227D(var_0, ::delete);
}

_id_494F(var_0) {}

_id_FDCB(var_0) {
  var_1 = [];
  var_2 = ["trigger_multiple", "reflection_probe", "locator_volume"];

  foreach (var_4 in self._id_C92D) {
  if (!scripts\engine\utility::array_contains(var_2, var_4.code_classname))
  var_1 = scripts\engine\utility::_id_2279(var_1, var_4);
  }

  switch (var_0) {
  case "hide":
  scripts\engine\utility::_id_227D(var_1, ::hide);
  scripts\engine\utility::_id_227D(self._id_747F, ::hide);
  break;
  case "show":
  scripts\engine\utility::_id_227D(var_1, ::show);
  scripts\engine\utility::_id_227D(self._id_747F, ::show);
  break;
  case "solid":
  scripts\engine\utility::_id_227D(var_1, ::solid);
  break;
  case "notsolid":
  scripts\engine\utility::_id_227D(var_1, ::notsolid);
  break;
  }
}

_id_10635() {
  if (isdefined(level._id_E3FB))
  scripts\engine\utility::_id_6E4C(level._id_E3FB);

  self._id_74A1 = scripts\engine\utility::_id_107E6();
  self._id_74A1.origin = self._id_74A1.origin + anglestoforward(self.angles) * 13000;
  self._id_74A1.origin = self._id_74A1.origin + anglestoup(self.angles) * 1500;
  self._id_74A1 linkto(self);

  if (isdefined(self._id_E505))
  var_0 = self._id_E505;
  else
  var_0 = self._id_01F1;

  var_1 = _func_0BC(var_0);

  for (var_2 = 0; var_2 < var_1; var_2++) {
  var_3 = _func_0BF(var_0, var_2);

  if (getsubstr(var_3, 0, 4) == "mdl_") {
  var_4 = getsubstr(var_3, 4, var_3.size - 3);
  var_5 = spawn("script_model", self gettagorigin(var_3));
  var_5 _meth_83D0(#animtree);
  var_5.angles = self gettagangles(var_3);
  var_5 linkto(self, var_3);
  var_6 = getsubstr(var_3, var_3.size - 4, var_3.size);
  self._id_747F[var_6] = var_5;

  if (var_3[var_3.size - 1] == "r") {
  var_7 = "_r";
  var_8 = 1;
  self._id_747F[var_6]._id_101AD = "_r";
  } else {
  var_7 = "";
  var_8 = -1;
  self._id_747F[var_6]._id_101AD = "_l";
  }

  switch (var_4) {
  case "ftl_a":
  var_5 setmodel("veh_mil_air_un_retribution_ftl_a" + var_7);
  self._id_747F[var_6]._id_7601 = scripts\engine\utility::_id_107E6(var_5.origin + anglestoright(var_5.angles) * 700, var_5.angles);
  self._id_747F[var_6]._id_7601.origin = self._id_747F[var_6]._id_7601.origin + anglestoforward(var_5.angles) * 90 * var_8;
  self._id_747F[var_6]._id_7601.origin = self._id_747F[var_6]._id_7601.origin + anglestoup(var_5.angles) * -50;
  break;
  case "ftl_b":
  var_5 setmodel("veh_mil_air_un_retribution_ftl_b" + var_7);
  self._id_747F[var_6]._id_7601 = scripts\engine\utility::_id_107E6(var_5.origin + anglestoright(var_5.angles) * 480, var_5.angles);
  self._id_747F[var_6]._id_7601.origin = self._id_747F[var_6]._id_7601.origin + anglestoforward(var_5.angles) * 65 * var_8;
  self._id_747F[var_6]._id_7601.origin = self._id_747F[var_6]._id_7601.origin + anglestoup(var_5.angles) * -40;
  break;
  }

  self._id_747F[var_6]._id_7601.angles = self._id_747F[var_6]._id_7601.angles + (90, 0, 90);
  self._id_747F[var_6]._id_7601 linkto(var_5, "bone_door_hinge_main");
  }
  }

  self._id_747E = [];
  var_9 = getarraykeys(self._id_747F);

  foreach (var_11 in var_9) {
  var_12 = getsubstr(var_11, 0, 3);
  var_13 = getarraykeys(self._id_747E);

  if (isdefined(scripts\engine\utility::_id_2291(var_13, var_12))) {
  if (getsubstr(var_12, 0, 1) == "a")
  self._id_747F[var_11]._id_EB9C = "_small";
  else
  self._id_747F[var_11]._id_EB9C = "_large";

  self._id_747E[var_12] = scripts\engine\utility::_id_2279(self._id_747E[var_12], self._id_747F[var_11]);
  continue;
  }

  if (getsubstr(var_12, 0, 1) == "a")
  self._id_747F[var_11]._id_EB9C = "_small";
  else
  self._id_747F[var_11]._id_EB9C = "_large";

  self._id_747E[var_12] = [self._id_747F[var_11]];
  }
}

_id_E403() {
  self endon("death");

  for (;;)
  scripts\engine\utility::_id_6E5A(level.script + "_prime_tr");
}

_id_C5FE(var_0) {
  foreach (var_2 in self._id_747E[var_0]) {
  var_2 _meth_82A4(%vh_mil_air_un_retribution_ftl_open);
  playfxontag(scripts\engine\utility::_id_7ECB("vfx_veh_retr_ftl_00_panel_aggregate_a_startup" + var_2._id_101AD), var_2._id_7601, "tag_origin");
  playfxontag(scripts\engine\utility::_id_7ECB("vfx_veh_retr_ftl_02_panel_cool_charge_a_startup" + var_2._id_EB9C), var_2._id_7601, "tag_origin");
  }

  var_4 = getanimlength(%vh_mil_air_un_retribution_ftl_open);
  wait(var_4);
}

_id_C5FF(var_0) {
  foreach (var_2 in self._id_747E[var_0]) {
  var_2 _meth_82A4(%vh_mil_air_un_retribution_ftl_open);
  var_2 _meth_82B0(%vh_mil_air_un_retribution_ftl_open, 1.0);
  }
}

_id_747B(var_0) {
  foreach (var_2 in self._id_747E[var_0]) {}
}

_id_4269(var_0) {
  foreach (var_2 in self._id_747E[var_0]) {
  var_2 _meth_82A4(%vh_mil_air_un_retribution_ftl_open, 1, 0.2, -1);
  stopfxontag(scripts\engine\utility::_id_7ECB("vfx_veh_retr_ftl_00_panel_aggregate_a_startup" + var_2._id_101AD), var_2._id_7601, "tag_origin");
  stopfxontag(scripts\engine\utility::_id_7ECB("vfx_veh_retr_ftl_02_panel_cool_charge_a_startup" + var_2._id_EB9C), var_2._id_7601, "tag_origin");
  }

  var_4 = getanimlength(%vh_mil_air_un_retribution_ftl_open);
  wait(var_4);
}

_id_747A(var_0) {
  foreach (var_2 in self._id_747E[var_0]) {
  stopfxontag(scripts\engine\utility::_id_7ECB("vfx_veh_retr_ftl_00_panel_aggregate_a_startup" + var_2._id_101AD), var_2._id_7601, "tag_origin");
  stopfxontag(scripts\engine\utility::_id_7ECB("vfx_veh_retr_ftl_02_panel_cool_charge_a_startup" + var_2._id_EB9C), var_2._id_7601, "tag_origin");
  }
}

_id_C5FC(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  thread _id_C5FE("b_a");
  wait(var_0);
  thread _id_C5FE("b_b");
  wait(var_0);
  thread _id_C5FE("b_c");
  wait(var_0);
  thread _id_C5FE("b_d");
  wait(var_0);
  thread _id_C5FE("b_e");
  wait(var_0);
  thread _id_C5FE("b_f");
  wait(var_0);
  thread _id_C5FE("b_g");
  wait(var_0);
  thread _id_C5FE("b_h");
  wait(var_0);
  thread _id_C5FE("b_i");
  wait(var_0);
  thread _id_C5FE("b_j");
  wait(var_0);
  thread _id_C5FE("a_a");
  wait(var_0);
  thread _id_C5FE("a_b");
  wait(var_0);
  thread _id_C5FE("a_c");
  wait(var_0);
  _id_C5FE("a_d");
}

_id_C5FD() {
  thread _id_C5FF("b_a");
  thread _id_C5FF("b_b");
  thread _id_C5FF("b_c");
  thread _id_C5FF("b_d");
  thread _id_C5FF("b_e");
  thread _id_C5FF("b_f");
  thread _id_C5FF("b_g");
  thread _id_C5FF("b_h");
  thread _id_C5FF("b_i");
  thread _id_C5FF("b_j");
  thread _id_C5FF("a_a");
  thread _id_C5FF("a_b");
  thread _id_C5FF("a_c");
  thread _id_C5FF("a_d");
}

_id_10C56() {
  var_0 = getarraykeys(self._id_747E);

  foreach (var_2 in var_0)
  thread _id_747B(var_2);
}

_id_4268(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  thread _id_4269("a_d");
  wait(var_0);
  thread _id_4269("a_c");
  wait(var_0);
  thread _id_4269("a_b");
  wait(var_0);
  thread _id_4269("a_a");
  wait(var_0);
  thread _id_4269("b_j");
  wait(var_0);
  thread _id_4269("b_i");
  wait(var_0);
  thread _id_4269("b_h");
  wait(var_0);
  thread _id_4269("b_g");
  wait(var_0);
  thread _id_4269("b_f");
  wait(var_0);
  thread _id_4269("b_e");
  wait(var_0);
  thread _id_4269("b_d");
  wait(var_0);
  thread _id_4269("b_c");
  wait(var_0);
  thread _id_4269("b_b");
  wait(var_0);
  _id_4269("b_a");
}

_id_10FF5() {
  var_0 = getarraykeys(self._id_747E);

  foreach (var_2 in var_0)
  thread _id_747A(var_2);
}

_id_8E84() {
  while (!isdefined(self._id_747F))
  scripts\engine\utility::waitframe();

  scripts\engine\utility::_id_227D(self._id_747F, ::hide);
}

_id_100DD() {
  while (!isdefined(self._id_747F))
  scripts\engine\utility::waitframe();

  scripts\engine\utility::_id_227D(self._id_747F, ::show);
}

_id_5155() {
  while (!isdefined(self._id_747F))
  scripts\engine\utility::waitframe();

  scripts\engine\utility::_id_227D(self._id_747F, ::delete);
}
