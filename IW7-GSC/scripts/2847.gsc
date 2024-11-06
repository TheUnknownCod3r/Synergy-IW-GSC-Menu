/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2847.gsc
***************************************/

#using_animtree("script_model");

_id_95B6() {
  level._id_5A2B = [];
  _id_5983();
  _id_1AC1();
  var_0 = getentarray("generic_door", "script_noteworthy");

  foreach (var_2 in var_0) {
  if (isdefined(var_2._id_0336) && isdefined(level._id_5A2B[var_2._id_0336])) {
  if (!isdefined(level._id_FCD6) || level._id_FCD6 != 1)
  continue;
  }

  if (var_2.classname == "script_origin") {
  var_3 = var_2 scripts\engine\utility::_id_107E6();
  var_3._id_0336 = var_2._id_0336;
  var_3._id_EE79 = var_2._id_EE79;
  var_3._id_EDA0 = var_2._id_EDA0;
  var_2 = var_3;
  }

  if (isdefined(var_2._id_0336)) {
  level._id_5A2B[var_2._id_0336] = var_2;
  var_4 = getentarray(var_2._id_0336, "targetname");

  foreach (var_6 in var_4) {
  if (var_6.classname == "script_brushmodel")
  var_2._id_4381 = var_6;
  }
  }

  var_2._id_5A18 = var_2._id_0336;
  var_2._id_5A57 = var_2._id_EE79;
  var_2._id_1FBB = "door";
  var_2 _meth_83D0(#animtree);
  var_2 _id_0B91::_id_65E0("player_used_door");
  var_2 _id_0B91::_id_65E0("player_at_door");
  var_2 _id_0B91::_id_65E0("actor_at_door");
  var_2 _id_0B91::_id_65E0("begin_opening");
  var_2 _id_0B91::_id_65E0("door_opened");
  var_2 _id_0B91::_id_65E0("door_sequence_complete");
  var_2 _id_0B91::_id_65E0("no_anim_reach");
  var_2 _id_0B91::_id_65E0("skip_reach_on_use");

  if (isdefined(var_2._id_EDA0))
  var_2 _id_0B91::_id_65E0(var_2._id_EDA0);

  var_2 _id_0B91::_id_65E0("locked");
  var_2 thread _id_59F7();
  }

  thread _id_9530("door_peek_armory");
}

_id_59F7() {
  if (self._id_5A57 == "airlock" && self._id_01F1 == "sdf_door_airlock_01")
  _id_0B06::_id_1EC3(self, "airlock_open_player");

  if (isdefined(self._id_EDA0))
  _id_0B91::_id_65E3(self._id_EDA0);

  switch (self._id_5A57) {
  case "no_power":
  thread _id_315D();
  break;
  case "large_buddy":
  thread _id_A852();
  break;
  case "armory":
  self._id_0245 = "closed";
  thread _id_21E0();
  break;
  case "armory_door_peek":
  self._id_0245 = "closed";
  thread _id_21E0();
  break;
  case "airlock":
  thread _id_1AB0();
  break;
  case "bulkhead_door":
  thread _id_3232();
  }
}

_id_168A(var_0) {
  self._id_1684 = var_0;

  switch (self._id_5A57) {
  case "no_power":
  _id_3156(var_0);
  break;
  case "airlock":
  break;
  }
}

_id_AED6() {
  if (!_id_0B91::_id_65DB("locked")) {
  _id_0B91::_id_65E1("locked");
  _id_0E46::_id_DFE3();
  }
}

_id_12BD3() {
  if (_id_0B91::_id_65DB("locked")) {
  _id_0B91::_id_65DD("locked");
  _id_0E46::_id_48C4("tag_ui_front", (0, 0, -2));
  }
}

_id_599E() {
  return _id_0B91::_id_65DB("locked");
}

_id_1AB0() {
  var_0 = _id_0B91::_id_7A8F();
  scripts\engine\utility::_id_227D(var_0, ::linkto, self, "door_jnt");

  foreach (var_2 in var_0) {
  if (isdefined(var_2.script_noteworthy) && var_2.script_noteworthy == "player_clip")
  continue;

  self._id_C969 = var_2;
  }

  if (isdefined(self._id_EF20) && self._id_EF20 == "notplayer")
  return;

  self._id_DF3A = 1;
  _id_0E46::_id_48C4("tag_ui_front");
  self waittill("trigger", var_4);
  _id_0B91::_id_65E1("player_at_door");
  var_5 = _id_D0A6("airlock_open_player");
  _id_0B91::_id_65E1("begin_opening");
  var_6 = [self, var_5];

  if (soundexists("airlock_exit_door_open"))
  level.player thread _id_0B91::_id_CE2F("airlock_exit_door_open");

  _id_0B06::_id_1F2C(var_6, "airlock_open_player");

  if (scripts\engine\utility::_id_9CEE(self._id_DF3A)) {
  level.player _id_5990();
  level.player unlink();
  var_5 delete();
  }

  self._id_C969 connectpaths();
  self._id_C969 disconnectpaths();
  _id_0B91::_id_65E1("door_sequence_complete");
}

_id_1AC1() {
  level._id_1AE3 = [];
  scripts\engine\utility::_id_6E39("airlocks_setup");
  level._effect["vfx_airlock_light_green"] = loadfx("vfx/iw7/_requests/airlock/vfx_light_green.vfx");
  level._effect["vfx_airlock_light_orange"] = loadfx("vfx/iw7/_requests/airlock/vfx_light_orange.vfx");
  level._effect["vfx_airlock_light_red"] = loadfx("vfx/iw7/_requests/airlock/vfx_light_red.vfx");
  level._effect["vfx_airlock_vent_xtrlrg_press"] = loadfx("vfx/iw7/core/mechanics/airlock/vfx_airlock_vent_xtrlrg_press.vfx");
  level._effect["vfx_airlock_vents_air"] = loadfx("vfx/iw7/core/mechanics/airlock/vfx_airlock_vent_lrg_press.vfx");
  level._effect["vfx_airlock_air_fill"] = loadfx("vfx/iw7/core/mechanics/airlock/vfx_airlock_roomcenter_press.vfx");
  level._effect["vfx_airlock_camcentr_depress"] = loadfx("vfx/iw7/core/mechanics/airlock/vfx_airlock_camcentr_depress.vfx");
  level._effect["vfx_airlock_vent_lrg_depress"] = loadfx("vfx/iw7/core/mechanics/airlock/vfx_airlock_vent_lrg_depress.vfx");
  _id_1ACF();
  _id_1AAF();
  thread _id_1AD9();
}

_id_1AD9() {
  scripts\engine\utility::waitframe();
  var_0 = scripts\engine\utility::_id_8180("generic_airlock_assets", "script_noteworthy");

  foreach (var_2 in var_0) {
  if (!isdefined(var_2._id_0336))
  continue;

  var_2._id_ECCE = [];
  var_2._id_ECCE["front"] = [];
  var_2._id_ECCE["back"] = [];
  var_3 = getentitylessscriptablearrayinradius(var_2._id_0336, "targetname");

  foreach (var_5 in var_3) {
  var_6 = "back";

  if (isdefined(var_5.script_noteworthy) && var_5.script_noteworthy == "forward")
  var_6 = "front";

  var_2._id_ECCE[var_6] = scripts\engine\utility::_id_2279(var_2._id_ECCE[var_6], var_5);

  if (var_6 == "front") {
  var_5 setscriptablepartstate("root", "0");
  continue;
  }

  var_5 setscriptablepartstate("root", "12");
  }

  var_2 _id_1AAE();
  var_2 _id_0B91::_id_65E0("cycling");
  var_2 _id_0B91::_id_65E0("cycling_complete");
  thread scripts\engine\utility::_id_CD86("airlock_light_hum", var_2.origin);

  if (isdefined(var_2._id_0336))
  level._id_1AE3[var_2._id_0336] = var_2;
  }

  scripts\engine\utility::_id_6E3E("airlocks_setup");
}

_id_1AAE() {
  var_0 = "airlock_cycling_pressurize";
  var_1 = "airlock_cycling_depressurize";
  var_2 = [];
  var_2["pressurize"] = [];
  var_2["depressurize"] = [];

  foreach (var_4 in level.createfxent) {
  if (isdefined(var_4.v["exploder"])) {
  if (var_4.v["exploder"] == var_0) {
  var_2["pressurize"] = scripts\engine\utility::_id_2279(var_2["pressurize"], var_4);
  continue;
  }

  if (var_4.v["exploder"] == var_1)
  var_2["depressurize"] = scripts\engine\utility::_id_2279(var_2["depressurize"], var_4);
  }
  }

  self._id_4CD3["pressurize"] = [];
  self._id_4CD3["depressurize"] = [];
  var_6 = ["pressurize", "depressurize"];

  foreach (var_8 in var_6) {
  foreach (var_4 in var_2[var_8]) {
  var_10 = var_4.v["fxid"];
  var_11 = var_4.v["origin"];
  var_12 = var_4.v["angles"];
  var_13 = var_4.v["delay"];
  var_14 = spawnstruct();
  var_14._id_762C = var_4.v["fxid"];
  var_14.origin = var_4.v["origin"];
  var_14.angles = var_4.v["angles"];
  var_14._id_50AE = var_4.v["delay"];
  self._id_4CD3[var_8] = scripts\engine\utility::_id_2279(self._id_4CD3[var_8], var_14);
  }
  }
}

_id_1ACF() {
  var_0 = scripts\common\createfx::_id_49AF("vfx_airlock_air_fill", "airlock_cycling_pressurize");
  var_0 scripts\common\createfx::_id_F4AD((-2.34019, -5.35077, 10.1119), (270, 0, 0));
  var_0 = scripts\common\createfx::_id_49AF("vfx_airlock_vent_xtrlrg_press", "airlock_cycling_pressurize");
  var_0 scripts\common\createfx::_id_F4AD((71.5714, 90.1929, 22.4209), (327.999, 271.999, 0));
  var_0 = scripts\common\createfx::_id_49AF("vfx_airlock_vents_air", "airlock_cycling");
  var_0 scripts\common\createfx::_id_F4AD((71.7566, -88.0884, 130.896), (30.9999, 89.9989, 0));
  var_0.v["delay"] = 0.1;
  var_0 = scripts\common\createfx::_id_49AF("vfx_airlock_vents_air", "airlock_cycling_pressurize");
  var_0 scripts\common\createfx::_id_F4AD((23.7468, -91.7748, 133.02), (30.9999, 89.9989, 0));
  var_0 = scripts\common\createfx::_id_49AF("vfx_airlock_vents_air", "airlock_cycling_pressurize");
  var_0 scripts\common\createfx::_id_F4AD((-24.1032, -92.3938, 133.065), (30.9999, 89.9989, 0));
  var_0.v["delay"] = 0.9;
  var_0 = scripts\common\createfx::_id_49AF("vfx_airlock_vents_air", "airlock_cycling_pressurize");
  var_0 scripts\common\createfx::_id_F4AD((-67.9505, -94.0097, 132.632), (30.9999, 89.9989, 0));
  var_0.v["delay"] = 0.15;
  var_0 = scripts\common\createfx::_id_49AF("vfx_airlock_vents_air", "airlock_cycling_pressurize");
  var_0 scripts\common\createfx::_id_F4AD((-72.8097, 87.5459, 131.168), (34.9998, 273.999, 0));
  var_0.v["delay"] = 0.1;
  var_0 = scripts\common\createfx::_id_49AF("vfx_airlock_vents_air", "airlock_cycling_pressurize");
  var_0 scripts\common\createfx::_id_F4AD((-25.4342, 86.8056, 129.173), (34.9998, 273.999, 0));
  var_0.v["delay"] = 0.75;
  var_0 = scripts\common\createfx::_id_49AF("vfx_airlock_vents_air", "airlock_cycling_pressurize");
  var_0 scripts\common\createfx::_id_F4AD((25.3645, 88.4423, 130.479), (34.9998, 273.999, 0));
  var_0.v["delay"] = 0.05;
  var_0 = scripts\common\createfx::_id_49AF("vfx_airlock_vents_air", "airlock_cycling_pressurize");
  var_0 scripts\common\createfx::_id_F4AD((73.602, 88.8602, 130.599), (34.9998, 273.999, 0));
  var_0.v["delay"] = 0.1;
  var_0 = scripts\common\createfx::_id_49AF("vfx_airlock_vent_xtrlrg_press", "airlock_cycling_pressurize");
  var_0 scripts\common\createfx::_id_F4AD((23.2354, 93.3036, 20.1975), (327.999, 271.999, 0));
  var_0.v["delay"] = 0.4;
  var_0 = scripts\common\createfx::_id_49AF("vfx_airlock_vent_xtrlrg_press", "airlock_cycling_pressurize");
  var_0 scripts\common\createfx::_id_F4AD((-21.9721, 93.4224, 21.0276), (327.999, 271.999, 0));
  var_0.v["delay"] = 1;
  var_0 = scripts\common\createfx::_id_49AF("vfx_airlock_vent_xtrlrg_press", "airlock_cycling_pressurize");
  var_0 scripts\common\createfx::_id_F4AD((-72.7803, 94.2712, 19.7878), (327.999, 271.999, 0));
}

_id_1AAF() {
  var_0 = scripts\common\createfx::_id_49AF("vfx_airlock_vent_lrg_depress", "airlock_cycling_depressurize");
  var_0 scripts\common\createfx::_id_F4AD((73.2631, -85.4638, 129.046), (34.9998, 93.9989, 0));
  var_0 = scripts\common\createfx::_id_49AF("vfx_airlock_vent_lrg_depress", "airlock_cycling_depressurize");
  var_0 scripts\common\createfx::_id_F4AD((23.5765, -91.5693, 131.861), (34.9998, 93.9989, 0));
  var_0.v["delay"] = 0.2;
  var_0 = scripts\common\createfx::_id_49AF("vfx_airlock_vent_lrg_depress", "airlock_cycling_depressurize");
  var_0 scripts\common\createfx::_id_F4AD((-24.8883, -89.9546, 130.099), (34.9998, 93.9989, 0));
  var_0.v["delay"] = 0.3;
  var_0 = scripts\common\createfx::_id_49AF("vfx_airlock_vent_lrg_depress", "airlock_cycling_depressurize");
  var_0 scripts\common\createfx::_id_F4AD((-71.6661, -90.0395, 132.764), (34.9998, 93.9989, 0));
  var_0 = scripts\common\createfx::_id_49AF("vfx_airlock_vent_lrg_depress", "airlock_cycling_depressurize");
  var_0 scripts\common\createfx::_id_F4AD((-21.3988, 84.8157, 127.166), (35.9998, 267.999, 0));
  var_0 = scripts\common\createfx::_id_49AF("vfx_airlock_vent_lrg_depress", "airlock_cycling_depressurize");
  var_0 scripts\common\createfx::_id_F4AD((-72.5438, 88.4987, 130.708), (39.9702, 273.609, 1.67727));
  var_0.v["delay"] = 0.2;
  var_0 = scripts\common\createfx::_id_49AF("vfx_airlock_vent_lrg_depress", "airlock_cycling_depressurize");
  var_0 scripts\common\createfx::_id_F4AD((73.4549, 86.6092, 129.863), (39.8823, 264.784, -3.34982));
  var_0.v["delay"] = 0.1;
  var_0 = scripts\common\createfx::_id_49AF("vfx_airlock_vent_lrg_depress", "airlock_cycling_depressurize");
  var_0 scripts\common\createfx::_id_F4AD((25.3469, 86.5301, 129.677), (39.9457, 271.876, 2.07295));
  var_0.v["delay"] = 0.3;
  var_0 = scripts\common\createfx::_id_49AF("vfx_airlock_vent_lrg_depress", "airlock_cycling_depressurize");
  var_0 scripts\common\createfx::_id_F4AD((-23.1415, 99.9688, 14.9828), (317.999, 267.999, 0));
  var_0 = scripts\common\createfx::_id_49AF("vfx_airlock_vent_lrg_depress", "airlock_cycling_depressurize");
  var_0 scripts\common\createfx::_id_F4AD((24.8086, -96.6052, 16.5775), (323.999, 90.9985, 0));
  var_0.v["delay"] = 0.3;
  var_0 = scripts\common\createfx::_id_49AF("vfx_airlock_camcentr_depress", "airlock_cycling_depressurize");
  var_0 scripts\common\createfx::_id_F4AD((7.92258, -4.8918, 18.4052), (270, 0, 0));
}

_id_1AB7(var_0, var_1, var_2) {
  var_3 = "back";

  if (var_0)
  var_3 = "front";

  if (var_3 == "front") {
  if (isdefined(var_1))
  var_1 _id_1AB5(1);

  if (isdefined(var_2))
  var_2 _id_1AB5(0);
  } else {
  if (isdefined(var_1))
  var_1 _id_1AB5(0);

  if (isdefined(var_2))
  var_2 _id_1AB5(1);
  }
}

_id_1AB5(var_0) {
  if (self._id_01F1 != "sdf_door_airlock_01") {
  if (!isdefined(self._id_ACD5)) {
  self._id_ACD5 = [];
  var_1 = [15, -7];

  foreach (var_3 in var_1) {
  var_4 = scripts\engine\utility::_id_107E6();
  var_4 linkto(self, "door_jnt", (38.5, var_3, 16), (0, 0, 0));
  self._id_ACD5[self._id_ACD5.size] = var_4;
  }
  }
  }

  if (var_0)
  _id_1AB6("unlocked");
  else
  _id_1AB6("locked");
}

_id_1AB2(var_0) {
  if (isdefined(var_0._id_ACD5)) {
  foreach (var_2 in var_0._id_ACD5)
  var_2 delete();
  }

  var_0 delete();
}

_id_1AA9(var_0, var_1, var_2, var_3, var_4) {
  scripts\engine\utility::_id_6E4C("airlocks_setup");
  var_5 = scripts\engine\utility::_id_817E(var_0, "targetname");
  var_5 _id_0B91::_id_65DD("cycling_complete");
  var_5 _id_0B91::_id_65E1("cycling");
  var_6 = [];

  if (isdefined(var_2))
  var_6 = scripts\engine\utility::_id_2279(var_6, var_2);

  if (isdefined(var_3))
  var_6 = scripts\engine\utility::_id_2279(var_6, var_3);

  foreach (var_8 in var_6) {
  if (isdefined(var_8) && !isdefined(var_8._id_ACD5)) {
  var_8._id_ACD5 = [];
  var_9 = [15, -7];

  foreach (var_11 in var_9) {
  var_12 = var_8 scripts\engine\utility::_id_107E6();
  var_12 linkto(var_8, "door_jnt", (38.5, var_11, 16), (0, 0, 0));
  var_8._id_ACD5[var_8._id_ACD5.size] = var_12;
  }
  }
  }

  var_15 = "airlock_pressurize_lr";

  if (!isdefined(var_4) || var_4)
  setglobalsoundcontext("atmosphere", "", 2);
  else
  {
  var_15 = "airlock_depressurize_lr";
  setglobalsoundcontext("atmosphere", "space", 2);
  }

  var_16 = lookupsoundlength(var_15);
  var_5._id_4CD5 = 1;
  var_5 thread _id_1AD7(var_16, var_4);
  scripts\engine\utility::_id_22D2(var_6, ::_id_1AB1, var_5, "cycling");

  if (!isdefined(var_4))
  var_4 = 1;

  var_5 thread _id_1AAD(var_4);
  level.player _id_0B91::_id_CE2F(var_15);
  var_5._id_4CD5 = 0;
  var_17 = "back";

  if (var_1)
  var_17 = "front";

  var_18 = ["front", "back"];

  foreach (var_20 in var_18) {
  if (var_20 == var_17) {
  foreach (var_22 in var_5._id_ECCE[var_20])
  var_22 setscriptablepartstate("root", 12);

  continue;
  }

  foreach (var_22 in var_5._id_ECCE[var_20])
  var_22 setscriptablepartstate("root", 0);
  }

  if (var_17 == "front") {
  if (isdefined(var_2))
  var_2 _id_1AB6("locked");

  if (isdefined(var_3)) {
  var_3 _id_1AB6("unlocked");
  var_3 playsound("airlock_light_on");
  }
  } else {
  if (isdefined(var_2)) {
  var_2 _id_1AB6("unlocked");
  var_2 playsound("airlock_light_on");
  }

  if (isdefined(var_3))
  var_3 _id_1AB6("locked");
  }

  var_5 _id_0B91::_id_65E1("cycling_complete");
  var_5 _id_0B91::_id_65DD("cycling");
}

_id_1AAB(var_0, var_1, var_2, var_3) {
  var_4 = level._id_1AE3[var_0];
  var_4 _id_0B91::_id_65DD("cycling_complete");
  var_4 _id_0B91::_id_65E1("cycling");
  var_5 = [];

  if (isdefined(var_2))
  var_5 = scripts\engine\utility::_id_2279(var_5, var_2);

  if (isdefined(var_3))
  var_5 = scripts\engine\utility::_id_2279(var_5, var_3);

  var_4._id_4CD5 = 1;
  scripts\engine\utility::_id_22D2(var_5, ::_id_1AB1, var_4, "cycling");
  scripts\engine\utility::_id_CE2B("airlock_ext", var_4.origin);
  wait 8.408;
  var_4._id_4CD5 = 0;
  _id_1AD8(var_0, 0, var_2, var_3);
  var_4 _id_0B91::_id_65E1("cycling_complete");
  var_4 _id_0B91::_id_65DD("cycling");
}

_id_1374E(var_0) {
  scripts\engine\utility::_id_6E4C("airlocks_setup");
  var_1 = level._id_1AE3[var_0];
  var_1 _id_0B91::_id_65E3("cycling_complete");
}

_id_1AAD(var_0) {
  var_1 = "pressurize";

  if (!var_0)
  var_1 = "depressurize";

  foreach (var_3 in self._id_4CD3[var_1]) {
  var_4 = var_3._id_762C;
  var_5 = 0;

  if (isdefined(var_3._id_50AE))
  var_5 = var_3._id_50AE;

  var_6 = var_3.origin;
  var_7 = rotatepointaroundvector(anglestoup(self.angles), var_6, self.angles[1]);
  var_6 = var_7 + self.origin;
  var_8 = _func_048(var_3.angles, self.angles);
  var_9 = spawnstruct();
  var_9.origin = var_6;
  var_9.angles = var_8;
  scripts\engine\utility::_id_C0A6(var_5, ::playfx, scripts\engine\utility::_id_7ECB(var_4), var_6, anglestoforward(var_8), anglestoup(var_8));
  }
}

_id_1AAA(var_0) {
  scripts\engine\utility::_id_6E4C("airlocks_setup");
  var_1 = level._id_1AE3[var_0];
  var_2 = ["front", "back"];

  foreach (var_4 in var_2) {
  foreach (var_6 in var_1._id_ECCE[var_4])
  var_6 setscriptablepartstate("root", 13);
  }
}

_id_1AD6(var_0) {
  var_1 = ["front", "back"];
  var_2 = 0.75;

  while (self._id_4CD5) {
  foreach (var_4 in var_1) {
  foreach (var_6 in self._id_ECCE[var_4][var_0])
  var_6 show();
  }

  wait(var_2);

  foreach (var_4 in var_1) {
  foreach (var_6 in self._id_ECCE[var_4][var_0])
  var_6 hide();
  }

  wait(var_2);
  }

  self notify("blinking_complete");
}

_id_1AD7(var_0, var_1) {
  var_2 = var_0 / 1000 / 10;
  var_3 = 1;
  var_4 = 12;

  if (isdefined(var_1) && !var_1) {
  var_3 = 11;
  var_4 = 1;
  }

  var_5 = var_3;
  var_6 = ["front", "back"];

  while (var_5 != var_4) {
  foreach (var_8 in var_6) {
  foreach (var_10 in self._id_ECCE[var_8])
  var_10 setscriptablepartstate("root", var_5);
  }

  if (isdefined(var_1) && !var_1)
  var_5 = var_5 - 1;
  else
  var_5++;

  wait(var_2);
  }
}

_id_1AB1(var_0, var_1) {
  self endon("death");
  _id_1AB6("off");
  var_2 = 0.75;

  while (var_0._id_4CD5) {
  _id_1AB6(var_1);
  wait(var_2);
  _id_1AB6("off");
  wait(var_2);
  }
}

_id_1AD8(var_0, var_1, var_2, var_3) {
  scripts\engine\utility::_id_6E4C("airlocks_setup");
  var_4 = level._id_1AE3[var_0];
  var_5 = "back";

  if (var_1)
  var_5 = "front";

  var_6 = ["front", "back"];

  foreach (var_8 in var_6) {
  if (var_8 == var_5) {
  foreach (var_10 in var_4._id_ECCE[var_8])
  var_10 setscriptablepartstate("root", 12);

  continue;
  }

  foreach (var_10 in var_4._id_ECCE[var_8])
  var_10 setscriptablepartstate("root", 0);
  }

  if (isdefined(var_2))
  var_2 _id_1AB6("unlocked");

  if (isdefined(var_3))
  var_3 _id_1AB6("locked");
}

_id_1AB6(var_0) {
  if (self._id_01F1 != "sdf_door_airlock_01") {
  if (isdefined(self._id_4C07)) {
  foreach (var_2 in self._id_ACD5) {
  var_3 = _id_1AB4(self._id_4C07);

  if (isdefined(var_3))
  _func_121(scripts\engine\utility::_id_7ECB(var_3), var_2, "tag_origin");
  }
  }

  foreach (var_2 in self._id_ACD5) {
  var_3 = _id_1AB4(var_0);

  if (isdefined(var_3))
  playfxontag(scripts\engine\utility::_id_7ECB(var_3), var_2, "tag_origin");
  }
  }
  else if (var_0 != "unlocked") {
  if (_id_0B91::_id_8C32(self._id_01F1, "tag_screen_locked"))
  self _meth_8387("tag_screen_locked", self._id_01F1);

  if (_id_0B91::_id_8C32(self._id_01F1, "tag_screen_open"))
  self _meth_8187("tag_screen_open", self._id_01F1);
  } else {
  if (_id_0B91::_id_8C32(self._id_01F1, "tag_screen_locked"))
  self _meth_8187("tag_screen_locked", self._id_01F1);

  if (_id_0B91::_id_8C32(self._id_01F1, "tag_screen_open"))
  self _meth_8387("tag_screen_open", self._id_01F1);
  }

  self._id_4C07 = var_0;
}

_id_1AB4(var_0) {
  if (var_0 == "unlocked")
  return "vfx_airlock_light_green";
  else if (var_0 == "locked")
  return "vfx_airlock_light_red";
  else if (var_0 == "cycling")
  return "vfx_airlock_light_orange";
  else if (var_0 == "error")
  return undefined;
  else if (var_0 == "off")
  return undefined;
}

_id_A852() {
  var_0 = undefined;
  var_1 = [];
  var_2 = _id_0B91::_id_7A8F();

  foreach (var_4 in var_2) {
  if (var_4.classname == "script_model") {
  if (isdefined(var_4.script_noteworthy) && var_4.script_noteworthy == "player") {
  self._id_D45A = 1;
  var_1["player"] = var_4;
  } else {
  if (!isdefined(var_1["ai"]))
  var_1["ai"] = [];

  var_1["ai"] = scripts\engine\utility::_id_2279(var_1["ai"], var_4);
  }

  var_4 _meth_83D0(#animtree);
  continue;
  }

  var_0 = var_4;
  }

  self._id_454F = var_1;

  if (isdefined(var_0))
  var_0 waittill("trigger");

  if (isdefined(var_1["player"]))
  thread _id_A855();

  _id_0B91::_id_65E3("door_sequence_complete");
}

_id_A855() {
  var_0 = self._id_454F;
  var_0["player"]._id_1FBB = "console_plr";
  var_0["player"] _id_0E46::_id_48C4("override_box_jt", undefined, undefined, undefined, 5000, undefined, 0);
  var_0["player"] waittill("trigger", var_1);
  var_2 = var_0["player"] _id_D0A6("large_door_open_arrive");
  var_3 = [var_0["player"], var_2];
  var_0["player"] _id_0B06::_id_1F2C(var_3, "large_door_open_arrive");
  _id_0B91::_id_65E1("player_at_door");
  var_0["player"] thread _id_0B06::_id_1EE7(var_3, "large_door_open_idle");
  _id_0B91::_id_65E3("begin_opening");
  var_0["player"] notify("stop_loop");
  var_0["player"] _id_0B06::_id_1F2C(var_3, "large_door_open");
  var_1 _id_5990();
  var_1 unlink();
  var_2 delete();
}

_id_A854(var_0, var_1) {
  var_2 = [var_0];

  if (isdefined(var_1)) {
  if (var_1.size > 1) {}
  else
  var_1 = var_1[0];

  var_2 = scripts\engine\utility::_id_2279(var_2, var_1);
  }

  foreach (var_6, var_4 in var_2) {
  var_5 = self._id_454F["ai"][var_6];
  var_5._id_1FBB = "console_ai";
  var_4._id_A93B = var_4._id_1FBB;
  var_4._id_1FBB = "main";
  var_4 _id_0B91::_id_178D(_id_0B91::_id_137AA, "actor_at_door");
  thread _id_A853(var_4, var_5);
  }

  if (isdefined(self._id_454F["player"]))
  _id_0B91::_id_178D(_id_0B91::_id_65E3, "player_at_door");

  _id_0B91::_id_57D5();
  _id_0B91::_id_65E1("actor_at_door");

  if (isdefined(self._id_D45A))
  _id_0B91::_id_65E3("player_at_door");

  _id_0B91::_id_65E1("begin_opening");
  wait(getanimlength(var_0 _id_0B91::_id_7DC1("large_door_open")));

  foreach (var_4 in var_2)
  var_4._id_1FBB = var_4._id_A93B;

  _id_0B91::_id_65E1("door_sequence_complete");
}

_id_A853(var_0, var_1) {
  var_2 = [var_0, var_1];
  var_1 _id_0B06::_id_1F17(var_0, "large_door_open_arrive");
  var_1 _id_0B06::_id_1F2C(var_2, "large_door_open_arrive");
  var_1 thread _id_0B06::_id_1EE7(var_2, "large_door_open_idle");
  var_0 notify("actor_at_door");
  _id_0B91::_id_65E3("begin_opening");
  var_1 notify("stop_loop");
  var_0 _id_0A1E::_id_2386();
  var_1 thread _id_0B06::_id_1F2C(var_2, "large_door_open");
}

_id_315D() {
  _id_0B91::_id_65E0("secondary_actors_going_through");
  _id_0B91::_id_65E0("player_prying_open_door");
  thread _id_3160();
}

_id_3160() {
  var_0 = "tag_ui_back";

  if (isdefined(self._id_9027))
  var_0 = self._id_9027;

  self._id_9027 = var_0;
  var_1 = undefined;

  if (isdefined(self._id_901E))
  var_1 = self._id_901E;

  self._id_10247 = isdefined(self._id_10247);
  var_2 = undefined;

  if (isdefined(self._id_9333))
  var_2 = self._id_9333;

  _id_0E46::_id_48C4(var_0, var_1, undefined, undefined, undefined, undefined, var_2);
  self _meth_84A5(180);
  _id_0E46::_id_9016();
  _id_0B91::_id_65E1("player_used_door");
  var_3 = _id_D0A6(_id_5997("intro"));

  if (isdefined(self._id_9AEF))
  level.player thread _id_0B91::_id_CE2F(self._id_9AEF);

  level notify("buddydoor_player_intro");
  _id_59DE([self, var_3], _id_5997("intro"));
  level notify("buddydoor_player_idle");
  thread _id_59DE([self, var_3], _id_5997("idle"), 1);
  _id_0B91::_id_65E1("player_at_door");
  _id_0B91::_id_65E3("actor_at_door");
  _id_0B91::_id_65E1("begin_opening");
  var_4 = [self, var_3];

  foreach (var_6 in self._id_1684) {
  if (!var_6 _id_1FA3(_id_5997("pull")))
  continue;

  var_4 = scripts\engine\utility::_id_2279(var_4, var_6);
  }

  level notify("buddydoor_player_pry_open");
  _id_3161(var_4);
  _id_0B91::_id_65E1("door_opened");
  level notify("buddydoor_player_outro");
  self notify("buddydoor_outro");

  if (isdefined(self._id_427C))
  level.player thread _id_0B91::_id_CE2F(self._id_427C);

  var_4 = [self, var_3];
  _id_59DE(var_4, _id_5997("outro"));
  level.player _id_5990();
  level.player unlink();
  var_3 delete();
  _id_0B91::_id_65E1("door_sequence_complete");
  level notify("buddydoor_player_done");
}

_id_3161(var_0) {
  level.player notifyonplayercommand("bash_pressed", "+usereload");
  level.player notifyonplayercommand("bash_pressed", "+activate");
  thread _id_315B();

  if (!isdefined(self._id_C633))
  self._id_C633 = 1;

  var_1 = getanimlength(var_0[0] _id_0B91::_id_7DC1(_id_5997("pull")));
  var_2 = var_1 / self._id_C633;

  if (self._id_10247)
  thread _id_2643();

  for (;;) {
  level.player waittill("bash_pressed");
  level notify("buddydoor_pry_open_start");
  _id_0B91::_id_65E1("player_prying_open_door");
  level.player._id_2704 = 1;
  thread _id_3163();
  var_3 = _id_315A(0.5, 1);

  if (isdefined(var_3))
  continue;

  scripts\engine\utility::_id_22D2(var_0, ::_id_59F3, self);

  foreach (var_5 in var_0)
  var_5 _meth_83A1();

  _id_0B06::_id_1EC1(var_0, _id_5997("pull"));

  foreach (var_5 in var_0) {
  if (isai(var_5)) {
  var_5 _id_0A1E::_id_2307(::_id_3162, _id_0A1E::_id_2385);
  continue;
  }

  var_8 = var_5 _id_0B91::_id_7DC1(_id_5997("pull"));
  var_5 _meth_82A2(var_8, 1, 0.2, self._id_C633);
  }

  thread _id_3159(var_2);
  var_3 = _id_315A(var_2);

  if (!isdefined(var_3)) {
  level notify("buddydoor_pry_open_success");
  break;
  }

  level notify("buddydoor_pry_open_failed");

  if (isdefined(self._id_C62B))
  level.player thread _id_0B91::_id_CE2F(self._id_C62B);

  var_10 = 5;
  var_11 = var_0[0] islegacyagent(var_0[0] _id_0B91::_id_7DC1(_id_5997("pull")));
  var_12 = var_1 * var_11;
  var_12 = var_12 / var_10;

  foreach (var_5 in var_0)
  var_5 _meth_82B1(var_5 _id_0B91::_id_7DC1(_id_5997("pull")), var_10 * -1);

  wait(var_12);
  level.player playrumbleonentity("damage_heavy");
  self notify("stop_pry_anim");
  _id_0B91::_id_65DD("player_prying_open_door");
  level.player._id_2704 = 0;
  thread _id_59DE(var_0, _id_5997("idle"), 1);
  }

  if (isdefined(self._id_C62F))
  scripts\engine\utility::_id_11018(self._id_C62F);

  if (isdefined(self._id_C634))
  thread _id_0B91::_id_CE2F(self._id_C634);
}

_id_2643() {
  while (!_id_0B91::_id_65DB("door_opened")) {
  level.player notify("bash_pressed");
  wait 0.05;
  }
}

_id_3162() {
  self endon("stop_pry_anim");
  self endon("buddydoor_pull_complete");
  var_0 = _id_0B91::_id_7DC1(self._id_130FF _id_5997("pull"));
  var_1 = _id_0A1E::_id_2356("Knobs", "body");
  self _meth_806F(var_1, 0);
  self _meth_8016("noclip");
  self _meth_82A2(var_0, 1, 0.2, self._id_130FF._id_C633);
  level waittill("ever");
}

_id_3163() {
  self endon("buddydoor_pull_complete");

  if (isdefined(self._id_C625))
  self playsound(self._id_C625);

  wait 0.3;

  if (isdefined(self._id_C62F))
  thread scripts\engine\utility::_id_CD7F(self._id_C62F);

  self waittill("buddydoor_pull_failed");

  if (isdefined(self._id_C62F))
  thread scripts\engine\utility::_id_11018(self._id_C62F);

  if (isdefined(self._id_C625))
  self _meth_83AD();
}

_id_315A(var_0, var_1) {
  self endon("buddydoor_pull_complete");

  if (!isdefined(var_1))
  thread _id_315C();

  var_0 = var_0 * 1000;
  var_2 = gettime();

  for (;;) {
  if (gettime() - var_2 > var_0)
  return;

  var_3 = level.player scripts\engine\utility::_id_137B9("bash_pressed", 0.4);

  if (isdefined(var_3))
  break;
  }

  self notify("buddydoor_pull_failed");
  return 1;
}

_id_315C() {
  self endon("buddydoor_pull_complete");
  self endon("buddydoor_pull_failed");

  for (;;) {
  level.player playrumbleonentity("damage_light");
  earthquake(0.15, 0.1, level.player.origin, 5000);
  wait 0.05;
  }
}

_id_315B() {
  if (self._id_10247)
  return;

  var_0 = scripts\engine\utility::_id_107E6();
  var_1 = "left_door_01";

  if (isdefined(self._id_28B6))
  var_1 = self._id_28B6;

  var_0.origin = self gettagorigin(var_1);
  var_0 linkto(self, var_1);
  var_0 _id_0E46::_id_48C4(undefined, undefined, "", undefined, 1000, 1000, 1, 1);
  self waittill("buddydoor_pull_complete");
  var_0 _id_0E46::_id_DFE3();
}

_id_3159(var_0) {
  self endon("buddydoor_pull_failed");
  wait(var_0);
  self notify("buddydoor_pull_complete");
}

_id_3156(var_0) {
  foreach (var_2 in var_0) {
  var_2._id_130FF = self;
  var_3 = var_2._id_1FBB + "_door_sequence_complete";
  var_4 = var_2._id_1FBB + "_at_door";
  _id_0B91::_id_65E0(var_4);
  _id_0B91::_id_65E0(var_3);
  }

  scripts\engine\utility::_id_22D2(var_0, ::_id_598C);
  var_6 = [];

  foreach (var_2 in var_0) {
  if (!var_2 _id_1FA3(_id_5997("intro")))
  continue;

  var_6 = scripts\engine\utility::_id_2279(var_6, var_2);
  }

  scripts\engine\utility::_id_22D2(var_6, ::_id_3157, self, var_6);
  self waittill("buddydoor_outro");
  scripts\engine\utility::_id_22D2(var_0, ::_id_59F3, self);

  foreach (var_2 in var_0)
  thread _id_3158(var_2);
}

_id_3157(var_0, var_1) {
  level notify("buddydoor_actors_intro");
  var_0 thread _id_1162A(self);

  if (var_0 _id_0B91::_id_65DB("skip_reach_on_use"))
  _id_E9FF(var_0);
  else if (!var_0 _id_0B91::_id_65DB("no_anim_reach"))
  var_0 _id_0B06::_id_1F17(self, var_0 _id_5997("intro"));

  if (var_0 _id_0B91::_id_65DB("skip_reach_on_use")) {
  _id_E9FE(var_0);
  var_0 thread _id_59DE(self, var_0 _id_5997("idle"), 1);
  } else {
  var_0 _id_59DE(self, var_0 _id_5997("intro"));
  var_0 thread _id_59DE(self, var_0 _id_5997("idle"), 1);
  }

  self._id_2412 = 1;
  var_0 _id_0B91::_id_65E1(self._id_1FBB + "_at_door");

  foreach (var_3 in var_1) {
  if (!isdefined(var_3._id_2412))
  return;
  }

  var_0 _id_0B91::_id_65E1("actor_at_door");
}

_id_E9FF(var_0) {
  level.player endon("player_attached_to_door");
  var_0 _id_0B06::_id_1F17(self, var_0 _id_5997("intro"));
}

_id_E9FE(var_0) {
  level.player endon("player_attached_to_door");
  var_0 _id_59DE(self, var_0 _id_5997("intro"));
}

_id_3158(var_0) {
  var_0 endon("death");
  self endon("death");
  level notify("buddydoor_actors_outro");
  thread _id_59DE(var_0, _id_5997("outro"));
  var_0 waittill(_id_5997("outro"));
  var_0._id_130FF = undefined;
  var_0._id_2412 = undefined;
  var_0 _id_598F();
  var_1 = var_0._id_1FBB + "_door_sequence_complete";
  _id_0B91::_id_65E1(var_1);
  level notify("buddydoor_actors_outro_done");
}

_id_21E0() {
  var_0 = _id_0B91::_id_7A97();

  if (isdefined(var_0)) {
  foreach (var_2 in var_0) {
  if (isdefined(var_2._id_0336) && var_2._id_0336 == "loot_hint_struct")
  self._id_9026 = var_2;
  }
  }

  self._id_4381 = _id_0B91::_id_7A8E();

  if (!isdefined(level._id_21E2))
  level._id_21E2 = 0;

  thread _id_21E9(level._id_21E2);
  level._id_21E2++;
}

_id_21E9(var_0) {
  self endon("stop_door");

  if (isdefined(level._id_21E4))
  self [[level._id_21E4]]();

  self._id_9026 _id_0E46::_id_48C4();
  self._id_9026 _id_0E46::_id_9016();
  level notify("armory_door_start_open");
  _id_0B91::_id_65E1("player_at_door");
  _id_0B91::_id_65E1("begin_opening");
  self notify("stop_loop");
  thread _id_21E5();
  wait 0.7;
  thread _id_0B91::_id_CE2F("armory_door_open");
  _id_0B09::_id_489F(var_0);

  if (!_id_0A2F::_id_D9ED(var_0)) {
  _id_0A2F::_id_DA49(var_0, 1);
  _id_0B91::_id_9145("fluff_messages_loot_room");
  }
}

_id_21E5() {
  var_0 = self;
  var_0._id_1FBB = "loot_door";

  if (isdefined(self._id_4386))
  self._id_4381 linkto(self, self._id_4386);
  else
  self._id_4381 linkto(self, "j_handle");

  if (scripts\engine\utility::_id_9CEE(self._id_72D1)) {
  self notify("stop_door");
  _id_0E46::_id_DFE3();
  self notify("stop_loop");
  var_0 _id_0B06::_id_1EE0(var_0, "open_loot_door");
  self._id_4381 connectpaths();
  self._id_0245 = "open";

  if (_id_0B91::_id_8C32(self._id_01F1, "tag_locked"))
  self _meth_8187("tag_locked", self._id_01F1);

  if (_id_0B91::_id_8C32(self._id_01F1, "tag_unlocked"))
  self _meth_8387("tag_unlocked", self._id_01F1);
  } else {
  var_1 = var_0 _id_FA17("open_loot_door");
  var_0 thread _id_0B06::_id_1F35(var_1, "open_loot_door", "tag_origin");
  var_0 _id_0B06::_id_1F35(var_0, "open_loot_door", "tag_origin");
  self._id_4381 connectpaths();
  var_1 delete();
  level.player _id_5990();
  level.player unlink();
  self._id_0245 = "open";
  }

  level notify("armory_door_open");

  if (isdefined(self._id_21E6))
  self thread [[self._id_21E6]]();
}

_id_9530(var_0) {
  var_1 = scripts\engine\utility::_id_8180("door_peek_struct", "script_noteworthy");

  if (var_1.size > 0) {
  foreach (var_3 in var_1) {
  if (var_3._id_0336 == var_0)
  var_3 thread _id_13684(var_3._id_0336);
  }
  }
}

_id_13684(var_0) {
  var_1 = self;
  level waittill(var_0 + "door_peek_start");
  var_1 thread _id_0B09::_id_489F(0);
}

_id_FA17(var_0) {
  if (isdefined(level._id_E982) && level._id_E982 == 1)
  var_1 = _id_0B91::_id_10639("player_rig_disguise");
  else
  {
  var_1 = _id_0B91::_id_10639("player_arms");
  var_2 = level.player _meth_84C6("currentViewModel");

  if (isdefined(var_2))
  var_1 setmodel(var_2);
  }

  var_1 hide();
  level.player _meth_80AA();
  level.player _id_598D();
  var_3 = [var_1, self];
  thread _id_0B06::_id_1EC3(var_1, var_0);
  var_4 = 0.4;
  level.player _meth_823C(var_1, "tag_player", var_4, 0.15, 0.15);
  wait(var_4);
  var_1 show();
  return var_1;
}

_id_3232() {
  var_0 = _id_0B91::_id_7A8F();
  scripts\engine\utility::_id_227D(var_0, ::linkto, self, "j_hinge2");

  foreach (var_2 in var_0) {
  if (isdefined(var_2.script_noteworthy) && var_2.script_noteworthy == "player_clip")
  continue;

  self._id_C969 = var_2;
  }

  if (isdefined(self._id_EF20) && self._id_EF20 == "notplayer")
  return;

  _id_0E46::_id_48C4(undefined, (20, -50, 55));
  self waittill("trigger", var_4);
  _id_0B91::_id_65E1("player_at_door");
  self._id_C969 connectpaths();
  var_5 = scripts\engine\utility::_id_107E6(self.origin, self.angles + (0, 180, 0));
  var_6 = var_5 _id_D0A6("bulkhead_open");
  _id_0B91::_id_65E1("begin_opening");
  var_7 = [self, var_6];

  if (soundexists("airlock_exit_door_open"))
  level.player thread _id_0B91::_id_CE2F("airlock_exit_door_open");

  var_5 _id_0B06::_id_1F2C(var_7, "bulkhead_open");
  var_5 thread _id_0B06::_id_1F35(self, "bulkhead_open");
  var_5 _id_0B06::_id_1F2A([self], "bulkhead_open", 0.99);
  var_5 _id_0B06::_id_1F27([self], "bulkhead_open", 0);
  level.player _id_5990();
  level.player unlink();
  var_6 delete();
  _id_0B91::_id_65E1("door_sequence_complete");
}

_id_5982(var_0, var_1, var_2) {
  var_3 = self._id_5A18 + "_";
  var_4 = [[var_0]]();
  var_5 = [[var_1]]();
  var_6 = [[var_2]]();
  var_7 = [var_4, var_5, var_6];

  foreach (var_19, var_9 in var_7) {
  foreach (var_18, var_11 in var_9) {
  var_12 = 0;

  foreach (var_17, var_14 in var_11) {
  var_15 = getarraykeys(var_11)[var_12];
  var_16 = var_3 + var_15;

  if (var_15 == "idle")
  level._id_EC85[var_18][var_16][0] = var_11[var_15];
  else
  level._id_EC85[var_18][var_16] = var_11[var_15];

  var_12++;
  }
  }
  }
}

_id_59EB(var_0, var_1, var_2, var_3, var_4) {
  self._id_9AEF = var_0;
  self._id_C625 = var_1;
  self._id_C62F = var_2;
  self._id_C62B = var_3;
  self._id_C634 = var_4;
}

_id_598C() {
  if (isdefined(self._id_598E)) {
  _id_0B91::_id_61C7();
  self._id_598E = undefined;
  }
}

_id_598F() {
  if (isdefined(self._id_EDAD))
  self._id_598E = 1;
}

_id_D0A6(var_0) {
  var_1 = _id_0B91::_id_10639("door_player_rig");

  if (var_1._id_01F1 == "viewmodel_base_viewhands_iw7") {
  var_2 = level.player _meth_84C6("currentViewModel");

  if (isdefined(var_2))
  var_1 setmodel(var_2);
  }

  var_1 hide();
  level.player._id_59E1 = var_1;
  var_3 = [var_1, self];

  foreach (var_5 in var_3) {
  if (!isdefined(var_5._id_1FBB))
  continue;

  if (!var_5 _id_1FA3(var_0))
  continue;

  thread _id_0B06::_id_1EC3(var_5, var_0);
  }

  var_7 = level.player scripts\engine\utility::_id_107E6();
  var_7.origin = level.player.origin;
  var_7.angles = level.player getplayerangles();
  level.player _meth_823A(var_7, "tag_origin", 1, 0, 0, 0, 0, 0);
  var_8 = 0.45;

  if (isdefined(self._id_8483))
  var_8 = self._id_8483;

  if (length(level.player _meth_816B()) > 200)
  var_8 = 0.25;

  var_9 = var_8 / 4;
  var_10 = var_9;
  level.player _id_598D();
  wait 0.3;
  level.player _meth_823C(var_1, "tag_player", var_8, var_9, var_10);
  wait(var_8);
  level.player notify("player_attached_to_door");
  level.player _meth_823D(var_1, "tag_player", 1, 5, 5, 5, 5, 1);
  level.player _meth_8367(30, 30, 30, 30);
  var_1 show();
  var_7 delete();
  return var_1;
}

_id_1162A(var_0) {
  var_0 endon("anim_reach_complete");
  _id_0B91::_id_65E3("player_at_door");

  if (isdefined(self._id_D83A))
  var_1 = self._id_D83A;
  else
  var_1 = 200;

  if (distance(var_0.origin, self.origin) >= 200) {
  var_2 = undefined;

  if (isdefined(self._id_D83B))
  var_2 = self._id_D83B;
  else
  {
  var_3 = anglestoforward(self.angles);
  var_3 = var_3 * -1;
  var_2 = self.origin + var_3 * var_1;
  }

  var_0 _meth_80F1(var_2, self.angles, 10000);
  }
}

_id_598D() {
  level.player _meth_84FE();
  level.player _meth_80AA();
  level.player _meth_80F9(1);
  level.player setstance("stand");
  level.player scripts\engine\utility::_id_1C60(0);
  level.player scripts\engine\utility::_id_1C40(0);
  level.player _meth_8012(0);
  level.player _meth_80D1();
}

_id_5990() {
  level.player enableweapons();
  level.player _meth_8012(1);
  level.player _meth_80F9(0);
  level.player scripts\engine\utility::_id_1C60(1);
  level.player scripts\engine\utility::_id_1C40(1);
  level.player _meth_80A1();
  level.player _meth_84FD();
}

_id_5997(var_0) {
  return self._id_5A18 + "_" + var_0;
}

_id_59DE(var_0, var_1, var_2) {
  if (!isarray(var_0))
  var_0 = [var_0];

  var_3 = [];

  foreach (var_5 in var_0) {
  if (!var_5 _id_1FA3(var_1))
  continue;

  if (isdefined(var_2))
  thread _id_0B06::_id_1EEA(var_5, var_1, "stop_loop_" + var_5._id_1FBB);
  else
  thread _id_5981(var_5, var_1);

  var_3[var_3.size] = var_5;
  }

  if (!isdefined(var_2) && var_3.size > 0) {
  foreach (var_5 in var_3)
  var_5 _id_0B91::_id_178D(_id_0B91::_id_137AA, var_1);

  _id_0B91::_id_57D5();
  }
}

_id_5981(var_0, var_1) {
  _id_0B06::_id_1F35(var_0, var_1);
  var_0 notify(var_1);
}

_id_59F3(var_0) {
  var_0 notify("stop_loop_" + self._id_1FBB);
}

_id_1FA3(var_0) {
  var_1 = level._id_EC85[self._id_1FBB][var_0];

  if (isdefined(var_1))
  return 1;

  return 0;
}

_id_5983() {
  level._id_EC85["door"]["airlock_open_player"] = %airlock_open_door;
  level._id_EC85["door"]["bulkhead_open"] = %moon_2_31_secure_hangar_door;
  level._id_EC85["door"]["large_ally_door"] = %europa_armory_door_metal_bulkhead_double_01_open;
  level._id_EC85["console_plr"]["large_door_open_arrive"] = %europa_armory_override_l_plr_intro;
  level._id_EC85["console_plr"]["large_door_open_idle"][0] = %europa_armory_override_l_plr_idle;
  level._id_EC85["console_plr"]["large_door_open"] = %europa_armory_override_l_plr_pull_handle;
  level._id_EC85["console_ai"]["large_door_open_arrive"] = %europa_armory_override_r_str_intro;
  level._id_EC85["console_ai"]["large_door_open_idle"][0] = %europa_armory_override_r_str_idle;
  level._id_EC85["console_ai"]["large_door_open"] = %europa_armory_override_r_str_pull_handle;
  _id_599C();
  _id_59DF();
}

#using_animtree("generic_human");

_id_599C() {
  level._id_EC85["main"]["large_door_open_arrive"] = %europa_armory_str_override_r_intro;
  level._id_EC85["main"]["large_door_open_idle"][0] = %europa_armory_str_override_r_idle;
  level._id_EC85["main"]["large_door_open"] = %europa_armory_str_override_r_pull_handle;
}

#using_animtree("player");

_id_59DF() {
  level._id_EC87["door_player_rig"] = #animtree;
  level._id_EC8C["door_player_rig"] = "viewmodel_base_viewhands_iw7";
  level._id_EC85["door_player_rig"]["airlock_open_player"] = %airlock_open_player;
  level._id_EC85["door_player_rig"]["large_door_open_arrive"] = %europa_armory_plr_override_l_intro;
  level._id_EC85["door_player_rig"]["large_door_open_idle"][0] = %europa_armory_plr_override_l_idle;
  level._id_EC85["door_player_rig"]["large_door_open"] = %europa_armory_plr_override_l_pull_handle;
  level._id_EC85["door_player_rig"]["bulkhead_open"] = %moon_2_31_secure_hangar_plr;
}

_id_5A4B() {
  if (!isdefined(level._id_5A2B))
  level._id_5A2B = spawnstruct();

  return level._id_5A2B;
}
