/***********************************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\scripts\sp\maps\phspace\phspace_dps.gsc
***********************************************************/

_id_107B7() {
  if (!isdefined(level._id_12B67))
  level._id_12B67 = _id_0B93::_id_1080C("un_retribution");

  level._id_12B67 _id_0B93::_id_8441();
  level._id_12B67._id_1FBB = "retribution";
}

_id_A0F0() {
  scripts\engine\utility::_id_6E39("jackals_in_view");
  thread _id_A0EF();
  level._id_D127 = _id_0B93::_id_1080C("jackal_player");
  level._id_D127 _meth_8209();
  level._id_D127 _id_0BDC::_id_104A6(0);
  level._id_D127 _id_0BDC::_id_F5BD("phspace_launch");
  level._id_D127 _id_0BDC::_id_F420(500, 135, -30, 0, 1);
  level._id_D127 _id_0BDC::_id_A19F();
  _id_107C1();
  var_0 = scripts\engine\utility::_id_817E("jackal_callin_launch_animnode", "targetname");
  var_0 = scripts\engine\utility::_id_107E6(var_0.origin, var_0.angles);
  var_1 = "jackal_callin";

  if (getdvarint("E3", 0))
  var_1 = "jackal_callin_dps";

  wait 0.1;
  _id_0B95::_id_31C6("script_vehicle_jackal_friendly_pearl", "default", "vfx/iw7/core/vehicle/jackal/vfx_jackal_wash_concrete.vfx", 1);
  _id_0B95::_id_31C6("script_vehicle_jackal_friendly", "default", "vfx/iw7/core/vehicle/jackal/vfx_jackal_wash_concrete.vfx", 1);
  var_0 thread _id_376C(level._id_D127, var_1);
  var_0 thread _id_376E(level._id_EA99, var_1);

  if (!isdefined(level._id_10256)) {
  level waittill("jackals_landed");
  level._id_D127 _id_0BDC::_id_6B4C("none", 0);
  level._id_D127 _id_0BDC::_id_104A6(1);

  if (getdvarint("E3", 0))
    _id_0B91::_id_15F5("jackals_salter_to_jackal_dps");
  else
    _id_0B91::_id_15F5("jackals_salter_to_jackal");

  _id_0BDC::_id_137CF();
  }

  if (getdvarint("e3", 0))
  thread _id_1358D();

  level._id_D127 _id_0BDC::_id_A167();
  _id_0BDC::_id_A153(1);
  _func_1C5("r_MBEnable", 0);
  var_0 notify("stop_idle");
  thread _id_F5A5();
  thread _id_55FB();
}

_id_1358D() {
  wait 3;
  _id_0B91::_id_12641("phspace_ground_tr");
  _func_1C5("r_usePrebuiltSunShadow", 2);
  wait 0.5;
  _func_1C5("r_usePrebuiltSunShadow", 1);
}

_id_55FB() {
  _id_0BDC::_id_137DA();
  _id_0BDC::_id_A156(1);
}

_id_6271() {
  wait 7.0;
  _func_1C5("r_MBEnable", 1);
}

_id_F5A5() {
  wait 4.0;
  _id_1050B();
}

_id_1050B() {
  _func_1C5("r_transShadowEnable", 1);
  _func_1C5("r_heightfieldSunShadow", 0);
  _func_1C5("sm_sunSampleSizeNear", 1.1);
  _func_1C5("sm_sunCascadeSizeMultiplier2", 3);
}

_id_A0EF() {
  scripts\engine\utility::_id_6E4C("jackals_in_view");
  _id_0B91::_id_10350("dps_s31_jackalstouching");
  scripts\engine\utility::_id_6E4C("jackals_landed");
  wait 2.2;
  _id_0BDC::_id_137CF();
}

_id_8A02() {
  level.player endon("flag_player_has_jackal");
  wait 8;
  level._id_002E["salter"] _id_0B91::_id_10346("phspace_slt_letsgetamoveont");
  wait 6;
  level._id_002E["salter"] _id_0B91::_id_10346("phspace_slt_hopinletsgetbac");
  wait 10;
  level._id_002E["eth3n"] _id_0B91::_id_10346("phspace_eth_itsmyfirsttimei");
}

_id_376C(var_0, var_1) {
  if (!isdefined(level._id_10256)) {
  var_0 scripts\engine\utility::delaythread(1, _id_0BDC::_id_6B4C, "fly", 1);
  var_0._id_1FBB = "player_jackal";
  var_0 _id_0B06::_id_F64A();
  var_0 _id_0BDC::_id_A2DE(1);
  var_0 scripts\engine\utility::delaythread(4.1, _id_0B91::_id_CE31, "phstreets_jackal_land_plr", "j_canopy");
  var_0 scripts\engine\utility::delaythread(13.8, _id_0B91::_id_CE31, "phstreets_jackal_land_swt", "j_canopy");
  level.player thread _id_CA93();
  var_0 scripts\engine\utility::delaythread(11, _id_0BDC::_id_A1DD, "hover");
  var_0 scripts\engine\utility::delaythread(8.5, _id_0BDC::_id_6B4C, "hover", 1);
  thread _id_0B06::_id_1F35(var_0, var_1);
  var_2 = getanimlength(level._id_EC85["player_jackal"][var_1]);
  thread _id_C12F(var_2);
  scripts\engine\utility::delaythread(var_2 - 4, ::_id_1130D, "jackal_callin_player_clip_e3");
  var_2 = getanimlength(level._id_EC85["player_jackal"][var_1]);
  scripts\engine\utility::delaythread(var_2 - 9, scripts\engine\utility::_id_6E3E, "jackals_in_view");
  wait(var_2);
  scripts\engine\utility::_id_6E3E("jackals_landed");
  } else {
  var_0._id_1FBB = "player_jackal";
  var_0 _id_0B06::_id_F64A();
  var_0 _id_0BDC::_id_A2DE(1);
  _id_0BDC::_id_10CD1(var_0, undefined, "land", "phspace_launch");
  }
}

_id_376E(var_0, var_1) {
  var_0._id_1FBB = "salter_jackal";
  var_0 _id_0B06::_id_F64A();

  if (!isdefined(level._id_10256)) {
  var_0 scripts\engine\utility::delaythread(10, _id_0BDC::_id_6B4C, "hover", 1);
  var_0 _id_0BDC::_id_19A0();
  var_2 = getanimlength(level._id_EC85["salter_jackal"][var_1]);
  thread _id_C12F(var_2);
  scripts\engine\utility::delaythread(var_2 - 4, ::_id_1130D, "jackal_callin_salter_clip_e3");
  _id_0B06::_id_1F35(var_0, var_1);
  var_0 _id_0BDC::_id_19A0();
  var_0 _id_0BDC::_id_6B4C("landed_mode", 1);
  thread _id_0B06::_id_1EEA(var_0, "jackal_callin_dps_idle", "stop_idle");
  } else {
  var_0 _id_0BDC::_id_19A0();
  var_0 _id_0BDC::_id_6B4C("landed_mode", 1);
  thread _id_0B06::_id_1EEA(var_0, "jackal_callin_dps_idle", "stop_idle");
  }
}

_id_C12F(var_0) {
  wait(var_0 - 7);
  level notify("dc_e3_path");
}

_id_1130D(var_0) {
  var_1 = getent(var_0, "targetname");

  if (!isdefined(var_1))
  return;

  if (level.player istouching(var_1))
  level.player _meth_81D0();

  var_1 solid();
  _id_0BDC::_id_137CF();
  wait 0.1;
  var_1 delete();
}

_id_376D(var_0, var_1) {
  var_0._id_1FBB = "retribution";
  var_0 _id_0B06::_id_F64A();

  if (!isdefined(level._id_10256))
  _id_0B06::_id_1F35(var_0, var_1);
  else
  {
  thread _id_0B06::_id_1F35(var_0, var_1);
  var_2 = [var_0];
  _id_0B06::_id_1F2A(var_2, var_1, 1);
  }
}

_id_CA93() {
  for (;;) {
  if (scripts\engine\utility::_id_D11B()) {
    level.player _meth_82C0("jackal_cockpit", 2);
    level waittill("jackal_landing");
    level.player playsound("jackal_landing_plr");
    level._id_D127 waittill("jackal_touchdown");
    level.player playsound("jackal_landed");
    level.player _meth_8070(2.0);
    wait 2;
  } else {
    level waittill("jackal_enter");
    wait 1;
    level.player waittill("jackal_vtol_takeoff_plr");
    level.player playsound("jackal_vtol_takeoff_plr");
    wait 2;
  }

  wait 0.1;
  }
}

_id_107C1() {
  if (!isdefined(level._id_EA99))
  level._id_EA99 = _id_0B93::_id_1080C("jackal_salter");

  level._id_EA99._id_1FBB = "salter_jackal";
  level._id_EA99._id_12BA4 = "jackal";
  level._id_EA99 _id_0BDC::_id_6B4C("fly", 1);
}
