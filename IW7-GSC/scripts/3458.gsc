/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3458.gsc
***************************************/

init() {
  level._id_153E = 40;
  _id_1E73();
  level._effect["cloud"] = loadfx("vfx/misc/ac130_cloud");
  level._effect["beacon"] = loadfx("vfx/misc/ir_beacon_coop");
  level._effect["ac130_explode"] = loadfx("vfx/core/expl/aerial_explosion_ac130_coop");
  level._effect["ac130_flare"] = loadfx("vfx/misc/flares_cobra");
  level._effect["ac130_light_red"] = loadfx("vfx/core/vehicles/aircraft_light_wingtip_red");
  level._effect["ac130_light_white_blink"] = loadfx("vfx/core/vehicles/aircraft_light_white_blink");
  level._effect["ac130_light_red_blink"] = loadfx("vfx/core/vehicles/aircraft_light_red_blink");
  level._effect["ac130_engineeffect"] = loadfx("vfx/misc/jet_engine_ac130");
  level._effect["coop_muzzleflash_105mm"] = loadfx("vfx/core/muzflash/ac130_105mm");
  level._effect["coop_muzzleflash_40mm"] = loadfx("vfx/core/muzflash/ac130_40mm");
  level._id_DBFC = [];
  level._id_63AB = 0;
  level._id_A9D7 = gettime();
  level._id_00B9["white"] = (1, 1, 1);
  level._id_00B9["red"] = (1, 0, 0);
  level._id_00B9["blue"] = (0.1, 0.3, 1);
  level._id_46A1 = [];
  level._id_46A1["45"] = cos(45);
  level._id_46A1["5"] = cos(5);
  level._id_CB11["ac130_25mm_mp"] = 60;
  level._id_CB11["ac130_40mm_mp"] = 600;
  level._id_CB11["ac130_105mm_mp"] = 1000;
  level._id_CB10["ac130_25mm_mp"] = 0;
  level._id_CB10["ac130_40mm_mp"] = 3.0;
  level._id_CB10["ac130_105mm_mp"] = 6.0;
  level._id_13CC1["ac130_25mm_mp"] = 1.5;
  level._id_13CC1["ac130_40mm_mp"] = 3.0;
  level._id_13CC1["ac130_105mm_mp"] = 5.0;
  level._id_153D["move"] = 250;
  level._id_153D["rotate"] = 70;
  scripts\engine\utility::_id_6E39("allow_context_sensative_dialog");
  scripts\engine\utility::_id_6E3E("allow_context_sensative_dialog");
  var_0 = getentarray("minimap_corner", "targetname");
  var_1 = (0, 0, 0);

  if (var_0.size)
  var_1 = scripts\mp\spawnlogic::findboxcenter(var_0[0].origin, var_0[1].origin);

  level._id_1537 = spawn("script_model", var_1);
  level._id_1537 setmodel("c130_zoomRig");
  level._id_1537.angles = (0, 115, 0);
  level._id_1537.owner = undefined;
  level._id_1537._id_1177A = "ac130_thermal_mp";
  level._id_1537._id_65D1 = "ac130_enhanced_mp";
  level._id_1537._id_0336 = "ac130rig_script_model";
  level._id_1537 hide();
  level._id_1540 = 0;
  thread _id_E72F("on");
  thread _id_153C();
  thread _id_C56E();
  scripts\mp\killstreaks\killstreaks::registerkillstreak("ac130", ::_id_128D2);
  level._id_1542 = [];
}

_id_128D2(var_0, var_1) {
  if (isdefined(level._id_1541) || level._id_1540) {
  self iprintlnbold(&"KILLSTREAKS_AIR_SPACE_TOO_CROWDED");
  return 0;
  }

  if (scripts\mp\utility\game::isusingremote())
  return 0;

  if (scripts\mp\utility\game::_id_9E68())
  return 0;

  scripts\mp\utility\game::_id_FB09("ac130");
  var_2 = scripts\mp\killstreaks\killstreaks::_id_98C2(var_1);

  if (var_2 != "success") {
  if (var_2 != "disconnect")
  scripts\mp\utility\game::_id_41E9();

  return 0;
  }

  var_2 = _id_F62A(self);

  if (isdefined(var_2) && var_2) {
  level._id_1537._id_CC44._id_4824 = undefined;
  level._id_1540 = 1;
  }
  else
  scripts\mp\utility\game::_id_41E9();

  return isdefined(var_2) && var_2;
}

_id_9751() {
  level._id_EC94["foo"]["bar"] = "";
  _id_16B1("ai", "in_sight", 0, "ac130_fco_moreenemy");
  _id_16B1("ai", "in_sight", 1, "ac130_fco_getthatguy");
  _id_16B1("ai", "in_sight", 2, "ac130_fco_guymovin");
  _id_16B1("ai", "in_sight", 3, "ac130_fco_getperson");
  _id_16B1("ai", "in_sight", 4, "ac130_fco_guyrunnin");
  _id_16B1("ai", "in_sight", 5, "ac130_fco_gotarunner");
  _id_16B1("ai", "in_sight", 6, "ac130_fco_backonthose");
  _id_16B1("ai", "in_sight", 7, "ac130_fco_gonnagethim");
  _id_16B1("ai", "in_sight", 8, "ac130_fco_personnelthere");
  _id_16B1("ai", "in_sight", 9, "ac130_fco_nailthoseguys");
  _id_16B1("ai", "in_sight", 11, "ac130_fco_lightemup");
  _id_16B1("ai", "in_sight", 12, "ac130_fco_takehimout");
  _id_16B1("ai", "in_sight", 14, "ac130_plt_yeahcleared");
  _id_16B1("ai", "in_sight", 15, "ac130_plt_copysmoke");
  _id_16B1("ai", "in_sight", 16, "ac130_fco_rightthere");
  _id_16B1("ai", "in_sight", 17, "ac130_fco_tracking");
  _id_16B1("ai", "in_sight", 0, "ac130_fco_getthatguy");
  _id_16B1("ai", "in_sight", 1, "ac130_fco_guymovin");
  _id_16B1("ai", "in_sight", 2, "ac130_fco_getperson");
  _id_16B1("ai", "in_sight", 3, "ac130_fco_guyrunnin");
  _id_16B1("ai", "in_sight", 4, "ac130_fco_gotarunner");
  _id_16B1("ai", "in_sight", 5, "ac130_fco_backonthose");
  _id_16B1("ai", "in_sight", 6, "ac130_fco_gonnagethim");
  _id_16B1("ai", "in_sight", 7, "ac130_fco_nailthoseguys");
  _id_16B1("ai", "in_sight", 8, "ac130_fco_lightemup");
  _id_16B1("ai", "in_sight", 9, "ac130_fco_takehimout");
  _id_16B1("ai", "in_sight", 10, "ac130_plt_yeahcleared");
  _id_16B1("ai", "in_sight", 11, "ac130_plt_copysmoke");
  _id_16B1("ai", "in_sight", 0, "ac130_fco_moreenemy");
  _id_16B1("ai", "in_sight", 1, "ac130_fco_getthatguy");
  _id_16B1("ai", "in_sight", 2, "ac130_fco_guymovin");
  _id_16B1("ai", "in_sight", 3, "ac130_fco_getperson");
  _id_16B1("ai", "in_sight", 4, "ac130_fco_guyrunnin");
  _id_16B1("ai", "in_sight", 5, "ac130_fco_gotarunner");
  _id_16B1("ai", "in_sight", 6, "ac130_fco_backonthose");
  _id_16B1("ai", "in_sight", 7, "ac130_fco_gonnagethim");
  _id_16B1("ai", "in_sight", 8, "ac130_fco_personnelthere");
  _id_16B1("ai", "in_sight", 9, "ac130_fco_nailthoseguys");
  _id_16B1("ai", "in_sight", 11, "ac130_fco_lightemup");
  _id_16B1("ai", "in_sight", 12, "ac130_fco_takehimout");
  _id_16B1("ai", "in_sight", 14, "ac130_plt_yeahcleared");
  _id_16B1("ai", "in_sight", 15, "ac130_plt_copysmoke");
  _id_16B1("ai", "in_sight", 16, "ac130_fco_rightthere");
  _id_16B1("ai", "in_sight", 17, "ac130_fco_tracking");
  _id_16B1("ai", "wounded_crawl", 0, "ac130_fco_movingagain");
  _id_16B2("ai", "wounded_crawl", undefined, 6);
  _id_16B1("ai", "wounded_pain", 0, "ac130_fco_doveonground");
  _id_16B1("ai", "wounded_pain", 1, "ac130_fco_knockedwind");
  _id_16B1("ai", "wounded_pain", 2, "ac130_fco_downstillmoving");
  _id_16B1("ai", "wounded_pain", 3, "ac130_fco_gettinbackup");
  _id_16B1("ai", "wounded_pain", 4, "ac130_fco_yepstillmoving");
  _id_16B1("ai", "wounded_pain", 5, "ac130_fco_stillmoving");
  _id_16B2("ai", "wounded_pain", undefined, 12);
  _id_16B1("weapons", "105mm_ready", 0, "ac130_gnr_gunready1");
  _id_16B1("weapons", "105mm_fired", 0, "ac130_gnr_shot1");
  _id_16B1("plane", "rolling_in", 0, "ac130_plt_rollinin");
  _id_16B1("explosion", "secondary", 0, "ac130_nav_secondaries1");
  _id_16B2("explosion", "secondary", undefined, 7);
  _id_16B1("kill", "single", 0, "ac130_plt_gottahurt");
  _id_16B1("kill", "single", 1, "ac130_fco_iseepieces");
  _id_16B1("kill", "single", 2, "ac130_fco_oopsiedaisy");
  _id_16B1("kill", "single", 3, "ac130_fco_goodkill");
  _id_16B1("kill", "single", 4, "ac130_fco_yougothim");
  _id_16B1("kill", "single", 5, "ac130_fco_yougothim2");
  _id_16B1("kill", "single", 6, "ac130_fco_thatsahit");
  _id_16B1("kill", "single", 7, "ac130_fco_directhit");
  _id_16B1("kill", "single", 8, "ac130_fco_rightontarget");
  _id_16B1("kill", "single", 9, "ac130_fco_okyougothim");
  _id_16B1("kill", "single", 10, "ac130_fco_within2feet");
  _id_16B1("kill", "small_group", 0, "ac130_fco_nice");
  _id_16B1("kill", "small_group", 1, "ac130_fco_directhits");
  _id_16B1("kill", "small_group", 2, "ac130_fco_iseepieces");
  _id_16B1("kill", "small_group", 3, "ac130_fco_goodkill");
  _id_16B1("kill", "small_group", 4, "ac130_fco_yougothim");
  _id_16B1("kill", "small_group", 5, "ac130_fco_yougothim2");
  _id_16B1("kill", "small_group", 6, "ac130_fco_thatsahit");
  _id_16B1("kill", "small_group", 7, "ac130_fco_directhit");
  _id_16B1("kill", "small_group", 8, "ac130_fco_rightontarget");
  _id_16B1("kill", "small_group", 9, "ac130_fco_okyougothim");
  _id_16B1("misc", "action", 0, "ac130_fco_tracking");
  _id_16B2("misc", "action", 0, 70);
  _id_16B1("misc", "action", 1, "ac130_fco_moreenemy");
  _id_16B2("misc", "action", 1, 80);
  _id_16B1("misc", "action", 2, "ac130_random");
  _id_16B2("misc", "action", 2, 55);
  _id_16B1("misc", "action", 3, "ac130_fco_rightthere");
  _id_16B2("misc", "action", 3, 100);
}

_id_16B1(var_0, var_1, var_2, var_3) {
  var_4 = scripts\mp\teams::_id_81BC("allies") + var_3;
  var_4 = scripts\mp\teams::_id_81BC("axis") + var_3;

  if (!isdefined(level._id_EC94[var_0]) || !isdefined(level._id_EC94[var_0][var_1]) || !isdefined(level._id_EC94[var_0][var_1][var_2])) {
  level._id_EC94[var_0][var_1][var_2] = spawnstruct();
  level._id_EC94[var_0][var_1][var_2]._id_CF2C = 0;
  level._id_EC94[var_0][var_1][var_2]._id_1047D = [];
  }

  var_5 = level._id_EC94[var_0][var_1][var_2]._id_1047D.size;
  level._id_EC94[var_0][var_1][var_2]._id_1047D[var_5] = var_3;
}

_id_16B2(var_0, var_1, var_2, var_3) {
  if (!isdefined(level._id_45A2))
  level._id_45A2 = [];

  var_4 = 0;

  if (!isdefined(level._id_45A2[var_0]))
  var_4 = 1;
  else if (!isdefined(level._id_45A2[var_0][var_1]))
  var_4 = 1;

  if (var_4)
  level._id_45A2[var_0][var_1] = spawnstruct();

  if (isdefined(var_2)) {
  level._id_45A2[var_0][var_1]._id_86A3 = [];
  level._id_45A2[var_0][var_1]._id_86A3[_id_11145(var_2)] = spawnstruct();
  level._id_45A2[var_0][var_1]._id_86A3[_id_11145(var_2)].v["timeoutDuration"] = var_3 * 1000;
  level._id_45A2[var_0][var_1]._id_86A3[_id_11145(var_2)].v["lastPlayed"] = var_3 * -1000;
  } else {
  level._id_45A2[var_0][var_1].v["timeoutDuration"] = var_3 * 1000;
  level._id_45A2[var_0][var_1].v["lastPlayed"] = var_3 * -1000;
  }
}

_id_CE2F(var_0) {
  scripts\mp\utility\game::_id_CE31(var_0);
}

_id_22B5(var_0, var_1) {
  var_2 = [];

  for (var_3 = 0; var_3 < var_0.size; var_3++) {
  if (var_0[var_3] != var_1)
  var_2[var_2.size] = var_0[var_3];
  }

  return var_2;
}

_id_11145(var_0) {
  return "" + var_0;
}

_id_C56E() {
  for (;;) {
  level waittill("connected", var_0);
  var_0 thread onplayerspawned();
  }
}

onplayerspawned() {
  self endon("disconnect");

  for (;;)
  self waittill("spawned_player");
}

_id_51BD() {
  level waittill("ac130player_removed");
  self delete();
}

_id_B9F1() {
  level endon("game_ended");
  level endon("ac130player_removed");
  self endon("disconnect");
  level._id_1537 thread scripts\mp\killstreaks\killstreaks::_id_1CA5();
  level._id_1537 waittill("killstreakExit");

  if (isdefined(level._id_1537.owner))
  level thread _id_E0B5(level._id_1537.owner, 0);
}

_id_F62A(var_0) {
  self endon("ac130player_removed");

  if (isdefined(level._id_1541))
  return 0;

  _id_9751();
  level._id_1541 = var_0;
  level._id_1537.owner = var_0;
  level._id_1537._id_CC44 show();
  level._id_1537._id_CC44 thread _id_CE9F();
  level._id_1537._id_93DA = 0;
  level._id_1537._id_CC44 playloopsound("veh_ac130iw6_ext_dist");
  level._id_1537._id_CC44 thread _id_4D72();
  thread _id_89B5();
  level._id_1537._id_CC44 _meth_83BC();
  var_1 = spawnplane(var_0, "script_model", level._id_1537._id_CC44.origin, "compass_objpoint_c130_friendly", "compass_objpoint_c130_enemy");
  var_1 notsolid();
  var_1 linkto(level._id_1537, "tag_player", (0, 80, 32), (0, -90, 0));
  var_1 thread _id_51BD();
  thread scripts\mp\utility\game::_id_115DE("used_ac130", var_0);
  var_0 thread _id_13714(1.0);
  var_0 thread scripts\mp\utility\game::_id_DF2E(level._id_1537._id_CC44);

  if (getdvarint("camera_thirdPerson"))
  var_0 scripts\mp\utility\game::_id_F887(0);

  var_0 scripts\mp\utility\game::_id_12C6("ac130_105mm_mp");
  var_0 scripts\mp\utility\game::_id_12C6("ac130_40mm_mp");
  var_0 scripts\mp\utility\game::_id_12C6("ac130_25mm_mp");
  var_0 scripts\mp\utility\game::_id_141A("ac130_105mm_mp");
  var_0 thread _id_E0B6(level._id_153E * var_0._id_A6AD);
  var_0 setclientomnvar("ui_ac130_hud", 1);
  var_0 thread _id_C7FE();
  var_0 setblurforplayer(1.2, 0);
  var_0 thread _id_24A4(var_0);
  var_0 thread _id_3C5E();
  var_0 thread _id_13C88();
  var_0 thread _id_4594();
  var_0 thread _id_FEF6();
  var_0 thread _id_42CF();

  if (isbot(self)) {
  self._id_131B5 = level._id_1537;
  var_0 thread _id_1539();
  }

  var_0 thread _id_13AA2();
  var_0 thread _id_E0BA();
  var_0 thread _id_E0B7();
  var_0 thread _id_E0BD();
  var_0 thread _id_E0B8();
  var_0 thread _id_E0BB();
  var_0 thread _id_B9F1();
  thread _id_1538();
  return 1;
}

_id_97BC() {
  self setclientomnvar("ui_ac130_hud", 1);
  scripts\engine\utility::waitframe();
  scripts\mp\utility\game::_id_141A("ac130_105mm_mp");
  scripts\engine\utility::waitframe();
  self setclientomnvar("ui_ac130_weapon", 0);
  scripts\engine\utility::waitframe();
  self setclientomnvar("ui_ac130_105mm_ammo", self getweaponammoclip("ac130_105mm_mp"));
  scripts\engine\utility::waitframe();
  self setclientomnvar("ui_ac130_40mm_ammo", self getweaponammoclip("ac130_40mm_mp"));
  scripts\engine\utility::waitframe();
  self setclientomnvar("ui_ac130_25mm_ammo", self getweaponammoclip("ac130_25mm_mp"));
  scripts\engine\utility::waitframe();
  thread _id_C7FE();
}

_id_13AA2() {
  self endon("disconnect");
  self endon("joined_team");
  self endon("joined_spectators");
  level endon("game_ended");
  self endon("death");

  for (;;) {
  level waittill("host_migration_end");
  _id_97BC();
  }
}

_id_13714(var_0) {
  self endon("disconnect");
  level endon("ac130player_removed");
  wait(var_0);
  self _meth_8401(game["thermal_vision"], 0);
  self _meth_83BE();
  thread _id_1177C();
}

_id_CE9F() {
  wait 0.05;
  playfxontag(level._effect["ac130_light_red_blink"], self, "tag_light_belly");
  playfxontag(level._effect["ac130_engineeffect"], self, "tag_body");
  wait 0.5;
  playfxontag(level._effect["ac130_light_white_blink"], self, "tag_light_tail");
  playfxontag(level._effect["ac130_light_red"], self, "tag_light_top");
  wait 0.5;
  playfxontag(level._id_7546, self, "tag_light_L_wing");
  playfxontag(level._id_7546, self, "tag_light_R_wing");
}

_id_1538() {
  foreach (var_1 in level.players) {
  if (var_1 != level._id_1541 && var_1.team == level._id_1541.team)
  var_1 thread scripts\mp\utility\game::_id_F63E(level._id_1537._id_37C4, "tag_origin", 20);
  }
}

_id_E0BC() {
  self endon("ac130player_removed");
  level waittill("game_ended");
  level thread _id_E0B5(self, 0);
}

_id_E0BB() {
  self endon("ac130player_removed");
  level waittill("game_cleanup");
  level thread _id_E0B5(self, 0);
}

_id_E0B9() {
  self endon("ac130player_removed");
  self waittill("death");
  level thread _id_E0B5(self, 0);
}

_id_E0B8() {
  self endon("ac130player_removed");
  level._id_1537._id_CC44 waittill("crashing");
  level thread _id_E0B5(self, 0);
}

_id_E0BA() {
  self endon("ac130player_removed");
  self waittill("disconnect");
  level thread _id_E0B5(self, 1);
}

_id_E0B7() {
  self endon("ac130player_removed");
  self waittill("joined_team");
  level thread _id_E0B5(self, 0);
}

_id_E0BD() {
  self endon("ac130player_removed");
  scripts\engine\utility::waittill_any("joined_spectators", "spawned");
  level thread _id_E0B5(self, 0);
}

_id_E0B6(var_0) {
  self endon("ac130player_removed");
  var_1 = var_0;
  self setclientomnvar("ui_ac130_use_time", var_1 * 1000 + gettime());
  scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause(var_1);
  self setclientomnvar("ui_ac130_use_time", 0);
  level thread _id_E0B5(self, 0);
}

_id_E0B5(var_0, var_1) {
  var_0 notify("ac130player_removed");
  level notify("ac130player_removed");
  level._id_1537._id_37C4 notify("death");
  waittillframeend;

  if (!var_1) {
  var_0 scripts\mp\utility\game::_id_41E9();
  var_0 stopolcalsound("missile_incoming");
  var_0 stoploopsound();
  var_0 show();
  var_0 unlink();

  if (isbot(var_0)) {
  var_0 _meth_808E();
  var_0 cameraunlink();
  var_0._id_131B5 = undefined;
  }

  var_0 thermalvisionoff();
  var_0 thermalvisionfofoverlayoff();
  var_0 _meth_8401(level._id_1537._id_1177A, 0);
  var_0._id_AA42 = level._id_1537._id_1177A;
  var_0 setblurforplayer(0, 0);

  if (getdvarint("camera_thirdPerson"))
  var_0 scripts\mp\utility\game::_id_F887(1);

  var_2 = scripts\mp\utility\game::_id_7F55("ac130");
  var_0 scripts\mp\utility\game::_id_141E(var_2);
  var_0 scripts\mp\utility\game::_id_141E("ac130_105mm_mp");
  var_0 scripts\mp\utility\game::_id_141E("ac130_40mm_mp");
  var_0 scripts\mp\utility\game::_id_141E("ac130_25mm_mp");
  var_0 setclientomnvar("ui_ac130_hud", 0);
  }

  _id_E110();
  wait 0.5;
  level._id_1537._id_CC44 playsound("veh_ac130iw6_ext_dist_fade");
  wait 0.5;
  level._id_1541 = undefined;
  level._id_1537._id_CC44 hide();
  level._id_1537._id_CC44 stoploopsound();

  if (isdefined(level._id_1537._id_CC44._id_4824)) {
  level._id_1540 = 0;
  return;
  }

  var_3 = spawn("script_model", level._id_1537._id_CC44 gettagorigin("tag_origin"));
  var_3.angles = level._id_1537._id_CC44.angles;
  var_3 setmodel("vehicle_y_8_gunship_mp");
  var_4 = var_3.origin + anglestoright(var_3.angles) * 20000;
  var_4 = var_4 + (0, 0, 10000);
  var_3 thread _id_CE9F();
  var_3 moveto(var_4, 40.0, 0.0, 0.0);
  var_5 = (0, var_3.angles[1], -20);
  var_3 rotateto(var_5, 30, 1, 1);
  var_3 thread _id_5231(1);
  wait 5.0;
  var_3 thread _id_5231(1);
  wait 5.0;
  var_3 thread _id_5231(1);
  level._id_1540 = 0;
  wait 30.0;
  var_3 delete();
}

_id_E110() {
  var_0 = level._id_1537._id_CC44 getentitynumber();
  level._id_AD8B[var_0] = undefined;
}

_id_4D72() {
  self endon("death");
  self endon("crashing");
  level endon("game_ended");
  level endon("ac130player_removed");
  self.health = 999999;
  self.maxhealth = 1000;
  self._id_00E1 = 0;
  self.team = level._id_1541.team;
  scripts\mp\killstreaks\helicopter::_id_1852();
  self._id_2550 = missile_createattractorent(self, 1000, 4096);

  for (;;) {
  self waittill("damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9);

  if (isdefined(level._id_1541) && level.teambased && isplayer(var_1) && var_1.team == level._id_1541.team && !isdefined(level._id_C1BB))
  continue;

  if (var_4 == "MOD_RIFLE_BULLET" || var_4 == "MOD_PISTOL_BULLET" || var_4 == "MOD_EXPLOSIVE_BULLET")
  continue;

  self._id_1390B = 1;
  var_10 = var_0;

  if (isplayer(var_1))
  var_1 scripts\mp\damagefeedback::updatedamagefeedback("ac130");

  scripts\mp\killstreaks\killstreaks::_id_A6A0(var_1, var_9, level._id_1537);

  if (isdefined(var_1.owner) && isplayer(var_1.owner))
  var_1.owner scripts\mp\damagefeedback::updatedamagefeedback("ac130");

  self._id_00E1 = self._id_00E1 + var_10;

  if (self._id_00E1 >= self.maxhealth) {
  if (isplayer(var_1)) {
  thread scripts\mp\utility\game::_id_115DE("callout_destroyed_ac130", var_1);
  var_1 thread scripts\mp\utility\game::_id_83B4("kill", var_9, 400);
  var_1 notify("destroyed_killstreak");
  }

  level thread _id_482C(10.0);
  }
  }
}

_id_153C() {
  wait 0.05;
  var_0 = spawn("script_model", level._id_1537 gettagorigin("tag_player"));
  var_0 setmodel("vehicle_y_8_gunship_mp");
  var_0._id_0336 = "vehicle_y_8_gunship_mp";
  var_0 setcandamage(1);
  var_0.maxhealth = 1000;
  var_0.health = var_0.maxhealth;
  var_0 linkto(level._id_1537, "tag_player", (0, 80, 32), (-25, 0, 0));
  level._id_1537._id_CC44 = var_0;
  level._id_1537._id_CC44 hide();
  var_1 = spawn("script_model", level._id_1537 gettagorigin("tag_player"));
  var_1 setmodel("tag_origin");
  var_1 hide();
  var_1._id_0336 = "ac130CameraModel";
  var_1 linkto(level._id_1537, "tag_player", (0, 0, 32), (5, 0, 0));
  level._id_1537._id_37C4 = var_1;
}

_id_C7FE() {
  self endon("ac130player_removed");
  wait 0.05;
  thread _id_12EED();
  thread _id_12E57();
}

_id_12EED() {
  self endon("ac130player_removed");

  for (;;) {
  self setclientomnvar("ui_ac130_coord1_posx", abs(level._id_1537._id_CC44.origin[0]));
  self setclientomnvar("ui_ac130_coord1_posy", abs(level._id_1537._id_CC44.origin[1]));
  self setclientomnvar("ui_ac130_coord1_posz", abs(level._id_1537._id_CC44.origin[2]));
  wait 0.5;
  }
}

_id_12EF1() {
  self endon("ac130player_removed");
  scripts\engine\utility::waitframe();
  self setclientomnvar("ui_ac130_coord2_posx", abs(self.origin[0]));
  self setclientomnvar("ui_ac130_coord2_posy", abs(self.origin[1]));
  self setclientomnvar("ui_ac130_coord2_posz", abs(self.origin[2]));
}

_id_12E57() {
  self endon("ac130player_removed");

  for (;;) {
  var_0 = self geteye();
  var_1 = self getplayerangles();
  var_2 = anglestoforward(var_1);
  var_3 = var_0 + var_2 * 15000;
  var_4 = _func_16D(var_0, var_3);
  self setclientomnvar("ui_ac130_coord3_posx", abs(var_4[0]));
  self setclientomnvar("ui_ac130_coord3_posy", abs(var_4[1]));
  self setclientomnvar("ui_ac130_coord3_posz", abs(var_4[2]));
  wait 0.1;
  }
}

_id_1543() {
  self endon("ac130player_removed");
  level endon("post_effects_disabled");
  var_0 = 5;

  for (;;) {
  self shellshock("ac130", var_0);
  wait(var_0);
  }
}

_id_E72F(var_0) {
  level notify("stop_rotatePlane_thread");
  level endon("stop_rotatePlane_thread");

  if (var_0 == "on") {
  var_1 = 10;
  var_2 = level._id_153D["rotate"] / 360 * var_1;
  level._id_1537 _meth_8271(level._id_1537.angles[2] + var_1, var_2, var_2, 0);

  for (;;) {
  level._id_1537 _meth_8271(360, level._id_153D["rotate"]);
  wait(level._id_153D["rotate"]);
  }
  }
  else if (var_0 == "off") {
  var_3 = 10;
  var_2 = level._id_153D["rotate"] / 360 * var_3;
  level._id_1537 _meth_8271(level._id_1537.angles[2] + var_3, var_2, 0, var_2);
  }
}

_id_24A4(var_0) {
  if (isbot(var_0))
  var_0 cameralinkto(level._id_1537, "tag_player");

  self _meth_823E(level._id_1537._id_37C4, "tag_player", 1.0, 35, 35, 35, 35);
  self setplayerangles(level._id_1537 gettagangles("tag_player"));
}

_id_3C5E() {
  self endon("ac130player_removed");
  wait 0.05;
  self enableweapons();
  self enableweaponswitch();
  scripts\engine\utility::waitframe();
  self setclientomnvar("ui_ac130_105mm_ammo", self getweaponammoclip("ac130_105mm_mp"));
  scripts\engine\utility::waitframe();
  self setclientomnvar("ui_ac130_40mm_ammo", self getweaponammoclip("ac130_40mm_mp"));
  scripts\engine\utility::waitframe();
  self setclientomnvar("ui_ac130_25mm_ammo", self getweaponammoclip("ac130_25mm_mp"));

  for (;;) {
  self waittill("weapon_change", var_0);
  thread _id_CE2F("ac130iw6_weapon_switch");
  self notify("reset_25mm");
  self stoploopsound("ac130iw6_25mm_fire_loop");

  switch (var_0) {
  case "ac130_105mm_mp":
  self setclientomnvar("ui_ac130_weapon", 0);
  break;
  case "ac130_40mm_mp":
  self setclientomnvar("ui_ac130_weapon", 1);
  break;
  case "ac130_25mm_mp":
  self setclientomnvar("ui_ac130_weapon", 2);
  thread _id_D522();
  break;
  }
  }
}

_id_13C88() {
  self endon("ac130player_removed");

  for (;;) {
  self waittill("weapon_fired");
  var_0 = self getcurrentweapon();

  switch (var_0) {
  case "ac130_105mm_mp":
  thread _id_86D0();
  earthquake(0.2, 1, level._id_1537._id_CC44.origin, 1000);
  self setclientomnvar("ui_ac130_105mm_ammo", self getweaponammoclip(var_0));
  break;
  case "ac130_40mm_mp":
  earthquake(0.1, 0.5, level._id_1537._id_CC44.origin, 1000);
  self setclientomnvar("ui_ac130_40mm_ammo", self getweaponammoclip(var_0));
  break;
  case "ac130_25mm_mp":
  self setclientomnvar("ui_ac130_25mm_ammo", self getweaponammoclip(var_0));
  break;
  }

  if (self getweaponammoclip(var_0))
  continue;

  thread _id_13CC0(var_0);
  }
}

_id_13CC0(var_0) {
  self endon("ac130player_removed");
  wait(level._id_13CC1[var_0]);
  self setweaponammoclip(var_0, 9999);

  switch (var_0) {
  case "ac130_105mm_mp":
  self setclientomnvar("ui_ac130_105mm_ammo", self getweaponammoclip(var_0));
  break;
  case "ac130_40mm_mp":
  self setclientomnvar("ui_ac130_40mm_ammo", self getweaponammoclip(var_0));
  break;
  case "ac130_25mm_mp":
  self setclientomnvar("ui_ac130_25mm_ammo", self getweaponammoclip(var_0));
  break;
  }

  if (self getcurrentweapon() == var_0) {
  scripts\mp\utility\game::_id_141E(var_0);
  scripts\mp\utility\game::_id_12C6(var_0);
  scripts\mp\utility\game::_id_141A(var_0);
  }
}

_id_D522() {
  self endon("death");
  self endon("disconnect");
  level endon("game_ended");
  self endon("ac130player_removed");
  self endon("reset_25mm");
  var_0 = self getcurrentweapon();

  for (;;) {
  self waittill("weapon_fired");
  self stopolcalsound("ac130iw6_25mm_fire_loop_cooldown");
  self playloopsound("ac130iw6_25mm_fire_loop");

  while (self attackbuttonpressed() && self getweaponammoclip(var_0))
  wait 0.05;

  self stoploopsound();
  self playlocalsound("ac130iw6_25mm_fire_loop_cooldown");
  }
}

_id_1539() {
  self endon("ac130player_removed");
  var_0 = undefined;
  var_1 = undefined;
  var_2 = undefined;
  var_3 = 0;
  var_4 = 0;
  var_5 = undefined;
  var_6 = (self botgetdifficultysetting("minInaccuracy") + self botgetdifficultysetting("maxInaccuracy")) / 2;
  var_7 = 0;

  for (;;) {
  var_8 = 0;
  var_9 = 0;

  if (isdefined(var_1) && var_1.health <= 0 && gettime() - var_1.deathtime < 2000) {
  var_8 = 1;
  var_9 = 1;
  }
  else if (isalive(self._id_010C) && (self botcanseeentity(self._id_010C) || gettime() - self _meth_81DB(self._id_010C) <= 300)) {
  var_8 = 1;
  var_1 = self._id_010C;
  var_10 = var_1.origin;
  var_0 = self._id_010C.origin;

  if (self botcanseeentity(self._id_010C)) {
  var_7 = 0;
  var_9 = 1;
  var_11 = gettime();
  } else {
  var_7 = var_7 + 0.05;

  if (var_7 > 5.0)
  var_8 = 0;
  }
  }

  if (var_8) {
  if (isdefined(var_0))
  var_2 = var_0;

  if (var_9 && (scripts\mp\bots\bots_killstreaks_remote_vehicle::_id_2D16() || distancesquared(var_2, level._id_1537.origin) > level._id_CB11["ac130_105mm_mp"] * level._id_CB11["ac130_105mm_mp"]))
  self botpressbutton("attack");

  if (gettime() > var_4 + 500) {
  var_12 = randomfloatrange(-1 * var_6 / 2, var_6 / 2);
  var_13 = randomfloatrange(-1 * var_6 / 2, var_6 / 2);
  var_14 = randomfloatrange(-1 * var_6 / 2, var_6 / 2);
  var_5 = (150 * var_12, 150 * var_13, 150 * var_14);
  var_4 = gettime();
  }

  var_2 = var_2 + var_5;
  }
  else if (gettime() > var_3) {
  var_3 = gettime() + randomintrange(1000, 2000);
  var_2 = scripts\mp\bots\bots_killstreaks_remote_vehicle::_id_7BEE();
  }

  self botlookatpoint(var_2, 0.2, "script_forced");
  wait 0.05;
  }
}

_id_1177C() {
  self endon("ac130player_removed");
  self _meth_83C0();
  self _meth_8401(level._id_1537._id_65D1, 1);
  self._id_AA42 = level._id_1537._id_65D1;
  self _meth_8401(level._id_1537._id_1177A, 0.62);
  self._id_AA42 = level._id_1537._id_1177A;
  self setclientdvar("ui_ac130_thermal", 1);
}

_id_42CF() {
  self endon("ac130player_removed");
  wait 6;
  _id_42D0();

  for (;;) {
  wait(randomfloatrange(40, 80));
  _id_42D0();
  }
}

_id_42D0() {
  if (isdefined(level._id_D465) && issubstr(tolower(level._id_D465), "25"))
  return;

  playfxontagforclients(level._effect["cloud"], level._id_1537, "tag_player", level._id_1541);
}

_id_86D0() {
  self endon("ac130player_removed");
  level notify("gun_fired_and_ready_105mm");
  level endon("gun_fired_and_ready_105mm");
  wait 0.5;

  if (randomint(2) == 0)
  thread _id_459F("weapons", "105mm_fired");

  wait 5.0;
  thread _id_459F("weapons", "105mm_ready");
}

_id_FEF6() {
  self endon("ac130player_removed");

  for (;;) {
  self waittill("projectile_impact", var_0, var_1, var_2);

  if (issubstr(tolower(var_0), "105")) {
  earthquake(0.4, 1.0, var_1, 3500);
  self setclientomnvar("ui_ac130_darken", 1);
  }
  else if (issubstr(tolower(var_0), "40"))
  earthquake(0.2, 0.5, var_1, 2000);

  if (scripts\mp\utility\game::_id_7F1D("ac130_ragdoll_deaths", 0))
  thread _id_FEF7(var_1, var_0);

  wait 0.05;
  }
}

_id_FEF7(var_0, var_1) {
  wait 0.1;
  physicsexplosionsphere(var_0, level._id_CB11[var_1], level._id_CB11[var_1] / 2, level._id_CB10[var_1]);
}

_id_169F() {
  self endon("death");
  var_0 = 0.75;
  wait(randomfloat(3.0));

  for (;;) {
  if (level._id_1541)
  playfxontagforclients(level._effect["beacon"], self, "j_spine4", level._id_1541);

  wait(var_0);
  }
}

_id_4594() {
  thread _id_649A();
  thread _id_4597();
  thread _id_4596();
  thread _id_4599();
  thread _id_45A0();
  thread _id_459B();
  thread _id_459C();
  thread _id_4595();
}

_id_4597() {
  self endon("ac130player_removed");

  for (;;) {
  if (_id_4598())
  thread _id_459F("ai", "in_sight");

  wait(randomfloatrange(1, 3));
  }
}

_id_4598() {
  var_0 = [];

  foreach (var_2 in level.players) {
  if (!scripts\mp\utility\game::isreallyalive(var_2))
  continue;

  if (var_2.team == level._id_1541.team)
  continue;

  if (var_2.team == "spectator")
  continue;

  var_0[var_0.size] = var_2;
  }

  for (var_4 = 0; var_4 < var_0.size; var_4++) {
  if (!isdefined(var_0[var_4]))
  continue;

  if (!isalive(var_0[var_4]))
  continue;

  if (scripts\engine\utility::within_fov(level._id_1541 geteye(), level._id_1541 getplayerangles(), var_0[var_4].origin, level._id_46A1["5"]))
  return 1;

  wait 0.05;
  }

  return 0;
}

_id_4596() {
  self endon("ac130player_removed");

  for (;;) {
  level waittill("ai_crawling", var_0);
  thread _id_459F("ai", "wounded_crawl");
  }
}

_id_4599() {
  self endon("ac130player_removed");

  for (;;) {
  level waittill("ai_pain", var_0);
  thread _id_459F("ai", "wounded_pain");
  }
}

_id_45A0() {
  self endon("ac130player_removed");

  for (;;) {
  level waittill("player_destroyed_car", var_0, var_1);
  wait 1;
  thread _id_459F("explosion", "secondary");
  }
}

_id_649A() {
  self endon("ac130player_removed");

  for (;;) {
  level waittill("ai_killed", var_0);
  thread _id_459A(var_0, level._id_1541);
  }
}

_id_459A(var_0, var_1) {
  if (!isdefined(var_1))
  return;

  if (!isplayer(var_1))
  return;

  level._id_63AB++;
  level notify("enemy_killed");
}

_id_459B() {
  self endon("ac130player_removed");
  var_0 = 1;

  for (;;) {
  level waittill("enemy_killed");
  wait(var_0);
  var_1 = "kill";
  var_2 = undefined;

  if (level._id_63AB >= 2)
  var_2 = "small_group";
  else
  {
  var_2 = "single";

  if (randomint(3) != 1) {
  level._id_63AB = 0;
  continue;
  }
  }

  level._id_63AB = 0;
  thread _id_459F(var_1, var_2, 1);
  }
}

_id_459C() {
  scripts\engine\utility::_id_22D2(getentarray("context_dialog_car", "targetname"), ::_id_459D, "car");
  scripts\engine\utility::_id_22D2(getentarray("context_dialog_truck", "targetname"), ::_id_459D, "truck");
  scripts\engine\utility::_id_22D2(getentarray("context_dialog_building", "targetname"), ::_id_459D, "building");
  scripts\engine\utility::_id_22D2(getentarray("context_dialog_wall", "targetname"), ::_id_459D, "wall");
  scripts\engine\utility::_id_22D2(getentarray("context_dialog_field", "targetname"), ::_id_459D, "field");
  scripts\engine\utility::_id_22D2(getentarray("context_dialog_road", "targetname"), ::_id_459D, "road");
  scripts\engine\utility::_id_22D2(getentarray("context_dialog_church", "targetname"), ::_id_459D, "church");
  scripts\engine\utility::_id_22D2(getentarray("context_dialog_ditch", "targetname"), ::_id_459D, "ditch");
  thread _id_459E();
}

_id_459E() {
  self endon("ac130player_removed");

  for (;;) {
  level waittill("context_location", var_0);

  if (!isdefined(var_0))
  continue;

  if (!scripts\engine\utility::_id_6E25("allow_context_sensative_dialog"))
  continue;

  thread _id_459F("location", var_0);
  wait(5 + randomfloat(10));
  }
}

_id_459D(var_0) {
  self endon("ac130player_removed");

  for (;;) {
  self waittill("trigger", var_1);

  if (!isdefined(var_1))
  continue;

  if (!isdefined(var_1.team) || var_1.team != "axis")
  continue;

  level notify("context_location", var_0);
  wait 5;
  }
}

_id_45A4(var_0) {
  if (var_0._id_EEDE != "axis")
  return;

  thread _id_45A3(var_0);
  var_0 endon("death");

  while (!scripts\engine\utility::within_fov(level._id_1541 geteye(), level._id_1541 getplayerangles(), var_0.origin, level._id_46A1["45"]))
  wait 0.5;

  _id_459F("vehicle", "incoming");
}

_id_45A3(var_0) {
  var_0 waittill("death");
  thread _id_459F("vehicle", "death");
}

_id_4595() {
  self endon("ac130player_removed");

  for (;;) {
  if (isdefined(level._id_DBF7) && level._id_DBF7 == 1)
  level waittill("radio_not_in_use");

  var_0 = gettime();

  if (var_0 - level._id_A9D7 >= 3000) {
  level._id_A9D7 = var_0;
  thread _id_459F("misc", "action");
  }

  wait 0.25;
  }
}

_id_459F(var_0, var_1, var_2) {
  level endon("ac130player_removed");

  if (!isdefined(var_2))
  var_2 = 0;

  if (!scripts\engine\utility::_id_6E25("allow_context_sensative_dialog")) {
  if (var_2)
  scripts\engine\utility::_id_6E4C("allow_context_sensative_dialog");
  else
  return;
  }

  var_3 = undefined;
  var_4 = randomint(level._id_EC94[var_0][var_1].size);

  if (level._id_EC94[var_0][var_1][var_4]._id_CF2C == 1) {
  for (var_5 = 0; var_5 < level._id_EC94[var_0][var_1].size; var_5++) {
  var_4++;

  if (var_4 >= level._id_EC94[var_0][var_1].size)
  var_4 = 0;

  if (level._id_EC94[var_0][var_1][var_4]._id_CF2C == 1)
  continue;

  var_3 = var_4;
  break;
  }

  if (!isdefined(var_3)) {
  for (var_5 = 0; var_5 < level._id_EC94[var_0][var_1].size; var_5++)
  level._id_EC94[var_0][var_1][var_5]._id_CF2C = 0;

  var_3 = randomint(level._id_EC94[var_0][var_1].size);
  }
  }
  else
  var_3 = var_4;

  if (_id_45A1(var_0, var_1, var_3))
  return;

  level._id_EC94[var_0][var_1][var_3]._id_CF2C = 1;
  var_6 = randomint(level._id_EC94[var_0][var_1][var_3].size);
  _id_D530(level._id_EC94[var_0][var_1][var_3]._id_1047D[var_6], var_2);
}

_id_45A1(var_0, var_1, var_2) {
  if (!isdefined(level._id_45A2))
  return 0;

  if (!isdefined(level._id_45A2[var_0]))
  return 0;

  if (!isdefined(level._id_45A2[var_0][var_1]))
  return 0;

  if (isdefined(level._id_45A2[var_0][var_1]._id_86A3) && isdefined(level._id_45A2[var_0][var_1]._id_86A3[_id_11145(var_2)])) {
  var_3 = gettime();

  if (var_3 - level._id_45A2[var_0][var_1]._id_86A3[_id_11145(var_2)].v["lastPlayed"] < level._id_45A2[var_0][var_1]._id_86A3[_id_11145(var_2)].v["timeoutDuration"])
  return 1;

  level._id_45A2[var_0][var_1]._id_86A3[_id_11145(var_2)].v["lastPlayed"] = var_3;
  }
  else if (isdefined(level._id_45A2[var_0][var_1].v)) {
  var_3 = gettime();

  if (var_3 - level._id_45A2[var_0][var_1].v["lastPlayed"] < level._id_45A2[var_0][var_1].v["timeoutDuration"])
  return 1;

  level._id_45A2[var_0][var_1].v["lastPlayed"] = var_3;
  }

  return 0;
}

_id_D530(var_0, var_1, var_2) {
  if (!isdefined(level._id_DBF7))
  level._id_DBF7 = 0;

  if (!isdefined(var_1))
  var_1 = 0;

  if (!isdefined(var_2))
  var_2 = 0;

  var_2 = var_2 * 1000;
  var_3 = gettime();
  var_4 = 0;
  var_4 = _id_CEA7(var_0);

  if (var_4)
  return;

  if (!var_1)
  return;

  level._id_DBFC[level._id_DBFC.size] = var_0;

  while (!var_4) {
  if (level._id_DBF7)
  level waittill("radio_not_in_use");

  if (var_2 > 0 && gettime() - var_3 > var_2)
  break;

  if (!isdefined(level._id_1541))
  break;

  var_4 = _id_CEA7(level._id_DBFC[0]);

  if (!level._id_DBF7 && isdefined(level._id_1541) && !var_4) {}
  }

  level._id_DBFC = scripts\mp\utility\game::_id_22B0(level._id_DBFC, 0);
}

_id_CEA7(var_0) {
  if (level._id_DBF7)
  return 0;

  if (!isdefined(level._id_1541))
  return 0;

  level._id_DBF7 = 1;

  if (self.team == "allies" || self.team == "axis") {
  var_0 = scripts\mp\teams::_id_81BC(self.team) + var_0;
  level._id_1541 playlocalsound(var_0);
  }

  wait 4.0;
  level._id_DBF7 = 0;
  level._id_A9D7 = gettime();
  level notify("radio_not_in_use");
  return 1;
}

_id_4EBC(var_0, var_1, var_2, var_3, var_4, var_5) {
  var_6 = 16;
  var_7 = 360 / var_6;
  var_8 = [];

  for (var_9 = 0; var_9 < var_6; var_9++) {
  var_10 = var_7 * var_9;
  var_11 = cos(var_10) * var_1;
  var_12 = sin(var_10) * var_1;
  var_13 = var_0[0] + var_11;
  var_14 = var_0[1] + var_12;
  var_15 = var_0[2];
  var_8[var_8.size] = (var_13, var_14, var_15);
  }

  if (isdefined(var_4))
  wait(var_4);

  thread _id_4EBD(var_8, var_2, var_3, var_5, var_0);
}

_id_4EBD(var_0, var_1, var_2, var_3, var_4) {
  if (!isdefined(var_3))
  var_3 = 0;

  if (!isdefined(var_4))
  var_3 = 0;

  for (var_5 = 0; var_5 < var_0.size; var_5++) {
  var_6 = var_0[var_5];

  if (var_5 + 1 >= var_0.size)
  var_7 = var_0[0];
  else
  var_7 = var_0[var_5 + 1];

  thread _id_4EEE(var_6, var_7, var_1, var_2);

  if (var_3)
  thread _id_4EEE(var_4, var_6, var_1, var_2);
  }
}

_id_4EEE(var_0, var_1, var_2, var_3) {
  if (!isdefined(var_3))
  var_3 = (1, 1, 1);

  for (var_4 = 0; var_4 < var_2 * 20; var_4++)
  wait 0.05;
}

_id_89B5() {
  level endon("game_ended");
  level._id_1537._id_CC44 thread _id_6EAD(1);
}

_id_6EAD(var_0) {
  self._id_6EB4 = var_0;
  self._id_6EB3 = [];
  thread _id_A72B();
  thread _id_A729();
}

_id_D47A(var_0) {
  for (var_1 = 0; var_1 < var_0; var_1++) {
  thread _id_1E72();
  wait(randomfloatrange(0.1, 0.25));
  }
}

_id_5231(var_0) {
  self playsound("ac130iw6_flare_burst");

  if (!isdefined(var_0)) {
  var_1 = spawn("script_origin", level._id_1537._id_CC44.origin);
  var_1.angles = level._id_1537._id_CC44.angles;
  var_1 movegravity((0, 0, 0), 5.0);
  thread _id_D47A(10);
  self._id_6EB3[self._id_6EB3.size] = var_1;
  var_1 thread _id_51A6(5.0);
  return var_1;
  }
  else
  thread _id_D47A(5);
}

_id_6EA9(var_0) {
  return var_0._id_6EB4;
}

_id_6E9D(var_0) {
  _id_6E9E(var_0);
  return var_0._id_6EB4 > 0 || var_0._id_6EB3.size > 0;
}

_id_6EA8(var_0) {
  var_0._id_6EB4--;
  var_1 = var_0 _id_5231();
  return var_1;
}

_id_6E9E(var_0) {
  var_0._id_6EB3 = scripts\engine\utility::_id_22BC(var_0._id_6EB3);
}

_id_6EA7(var_0) {
  _id_6E9E(var_0);
  var_1 = undefined;

  if (var_0._id_6EB3.size > 0)
  var_1 = var_0._id_6EB3[var_0._id_6EB3.size - 1];

  return var_1;
}

_id_A72B() {
  level endon("game_ended");
  self endon("death");
  self endon("crashing");
  self endon("leaving");
  self endon("helicopter_done");

  while (_id_6E9D(self)) {
  level waittill("laserGuidedMissiles_incoming", var_0, var_1, var_2);

  if (!isdefined(var_2) || var_2 != self)
  continue;

  level._id_1541 playlocalsound("missile_incoming");
  level._id_1541 thread _id_A731(self, "missile_incoming");

  foreach (var_4 in var_1) {
  if (isvalidmissile(var_4))
  level thread _id_A72C(var_4, var_0, var_0.team, var_2);
  }
  }
}

_id_A72C(var_0, var_1, var_2, var_3) {
  var_3 endon("death");
  var_0 endon("death");
  var_0 endon("missile_targetChanged");

  while (_id_6E9D(var_3)) {
  if (!isdefined(var_3) || !isvalidmissile(var_0))
  break;

  var_4 = var_3 getpointinbounds(0, 0, 0);

  if (distancesquared(var_0.origin, var_4) < 4000000) {
  var_5 = _id_6EA7(var_3);

  if (!isdefined(var_5))
  var_5 = _id_6EA8(var_3);

  var_0 _meth_8206(var_5);
  var_0 notify("missile_pairedWithFlare");
  level._id_1541 stopolcalsound("missile_incoming");
  break;
  }

  scripts\engine\utility::waitframe();
  }
}

_id_A729() {
  level endon("game_ended");
  self endon("death");
  self endon("crashing");
  self endon("leaving");
  self endon("helicopter_done");

  while (_id_6E9D(self)) {
  self waittill("targeted_by_incoming_missile", var_0);

  if (!isdefined(var_0))
  continue;

  level._id_1541 playlocalsound("missile_incoming");
  level._id_1541 thread _id_A731(self, "missile_incoming");

  foreach (var_2 in var_0) {
  if (isvalidmissile(var_2))
  thread _id_A72A(var_2);
  }
  }
}

_id_A72A(var_0) {
  self endon("death");
  var_0 endon("death");

  for (;;) {
  if (!isdefined(self) || !isvalidmissile(var_0))
  break;

  var_1 = self getpointinbounds(0, 0, 0);

  if (distancesquared(var_0.origin, var_1) < 4000000) {
  var_2 = _id_6EA7(self);

  if (!isdefined(var_2) && self._id_6EB4 > 0)
  var_2 = _id_6EA8(self);

  if (isdefined(var_2)) {
  var_0 _meth_8206(var_2);
  var_0 notify("missile_pairedWithFlare");
  level._id_1541 stopolcalsound("missile_incoming");
  break;
  }
  }

  scripts\engine\utility::waitframe();
  }
}

_id_A731(var_0, var_1) {
  self endon("disconnect");
  var_0 waittill("death");
  self stopolcalsound(var_1);
}

_id_51A6(var_0) {
  wait(var_0);
  self delete();
}

_id_482C(var_0) {
  level._id_1537._id_CC44 notify("crashing");
  level._id_1537._id_CC44._id_4824 = 1;
  playfxontag(level._effect["ac130_explode"], level._id_1537._id_CC44, "tag_deathfx");
  wait 0.25;
  level._id_1537._id_CC44 hide();
}

_id_1E73() {
  level._effect["angel_flare_geotrail"] = loadfx("fx/smoke/angel_flare_geotrail");
  level._effect["angel_flare_swirl"] = loadfx("fx/smoke/angel_flare_swirl_runner");
}

_id_1E72() {
  var_0 = spawn("script_model", self.origin);
  var_0 setmodel("angel_flare_rig");
  var_0.origin = self gettagorigin("tag_flash_flares");
  var_0.angles = self gettagangles("tag_flash_flares");
  var_0.angles = (var_0.angles[0], var_0.angles[1] + 180, var_0.angles[2] + -90);
  var_1 = level._effect["angel_flare_geotrail"];
  var_0 scriptmodelplayanim("ac130_angel_flares0" + (randomint(3) + 1));
  wait 0.1;
  playfxontag(var_1, var_0, "flare_left_top");
  playfxontag(var_1, var_0, "flare_right_top");
  wait 0.05;
  playfxontag(var_1, var_0, "flare_left_bot");
  playfxontag(var_1, var_0, "flare_right_bot");
  wait 3.0;
  stopfxontag(var_1, var_0, "flare_left_top");
  stopfxontag(var_1, var_0, "flare_right_top");
  stopfxontag(var_1, var_0, "flare_left_bot");
  stopfxontag(var_1, var_0, "flare_right_bot");
  var_0 delete();
}
