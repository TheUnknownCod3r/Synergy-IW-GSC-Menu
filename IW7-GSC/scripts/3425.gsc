/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3425.gsc
***************************************/

_id_6512() {
  _id_97B9();
  _id_97AE();
  _id_97B8();
  level._id_5F90 = [];
  level._id_10E44 = [];
  level._id_4B95 = 0;
  level._id_4B6B = 0;
  level._id_E1CC = 0;
  level._id_50F8 = 0;
  level._id_E299 = 0;
  level._id_5274 = 0;
  level._id_4B6E = 0;
  level._id_B467 = 0;
  level._id_B432 = 0;
  level._id_5F7F = ["generic_zombie"];
  level._id_BFB7 = 200;
  level._id_1BF5 = scripts\engine\utility::_id_8180("spawner_location", "targetname");
  level._id_1002D = ::_id_FF55;
  level._id_11046 = 1;
  level._id_B433 = 20;
  level._id_1084F = [];
  level._id_8CB3 = [];
  level.respawn_enemy_list = [];
  kvp_update_init();

  if (isdefined(level.patch_update_spawners))
  [[level.patch_update_spawners]]();

  _id_975C();
  _id_9757();
  level thread _id_F8A7();
  level thread _id_F5EC();
  level thread _id_7D87();
  level._id_17C4 = [];
  level._id_17C4[1] = 0;
  level._id_17C4[2] = 0;
  level._id_17C4[3] = 0;
  level._id_17C4[4] = 0;
  level._id_CA07 = 0;
  level._id_CA06 = 0;
  level._id_CA05 = 0;
  level._id_4CC7 = 0;

  if (!isdefined(level._id_106DB))
  level._id_106DB = [];

  level._id_1646 = [];
  level._id_1647 = [];
  level._id_162C = [];
  level._id_4BB5 = 0;
  level._id_10725 = [];
  level._id_108E1 = ::_id_12E29;
  level._id_13F39 = "zmb_vo_base_male_";
  level._id_13F3A = "zmb_vo_base_male2_";
  level._id_13F24 = "zmb_vo_base_female_";
  level._id_13F14 = "zmb_vo_brute_";
  level._id_13F1A = "zmb_vo_cop_";
  level._id_13F18 = "zmb_vo_clown_";
  level.last_clown_spawn_time = gettime();
  level.wait_for_music_clown_wave = 0;
  level.last_mini_zone_fail = 0;
}

_id_97B9() {
  scripts\engine\utility::_id_6E39("init_spawn_volumes_done");
  scripts\engine\utility::_id_6E39("init_adjacent_volumes_done");
  scripts\engine\utility::_id_6E39("force_spawn_boss");
  scripts\engine\utility::_id_6E39("pause_wave_progression");
}

_id_97B8() {
  level._effect["drone_ground_spawn"] = loadfx("vfx/old/_requests/cp_titan/vfx_alien_drone_ground_spawn_titan.vfx");
}

_id_97AE() {
  _id_0D48::_id_97AF();
}

_id_975C() {
  level._id_10816 = getentarray("spawn_volume", "targetname");
  level._id_9B0B = getentarray("invalid_playspace", "targetname");
  level._id_163E = [];
  var_0 = [];

  foreach (var_2 in level._id_10816) {
  var_2._id_28AB = _id_7859(var_2);
  level._id_10817[var_2._id_28AB] = var_2;

  if (!_id_0A77::_id_9BD8()) {
  var_2 _id_7C8E();
  var_2 _id_7999();
  }

  var_2._id_0019 = 0;
  var_0[var_2._id_28AB] = var_2;
  wait 0.1;
  }

  level._id_10816 = var_0;
  scripts\engine\utility::_id_6E3E("init_spawn_volumes_done");
}

_id_F8A7() {
  _id_94D5();
}

_id_975D() {
  if (!scripts\engine\utility::_id_6E25("init_spawn_volumes_done"))
  scripts\engine\utility::_id_6E4C("init_spawn_volumes_done");

  level._id_10818 = getentarray("spawn_volume_trigger", "targetname");

  if (!isdefined(level._id_10818))
  return;

  foreach (var_1 in level._id_10818) {
  var_1 thread _id_15FD();
  wait 0.1;
  }
}

_id_15FD() {
  level endon("game_ended");
  self._id_13538 = self._id_ECFA;

  for (;;) {
  self waittill("trigger", var_0);

  if (!isplayer(var_0))
  continue;

  break;
  }

  _id_15FC(self._id_13538);
}

_id_A5BC() {
  foreach (var_1 in level._id_1084F)
  var_1 _meth_80B0(var_1.health + 990, var_1.origin, var_1, var_1, "MOD_SUICIDE");
}

_id_7859(var_0) {
  var_1 = strtok(var_0._id_027C, "_");

  if (var_1.size < 2)
  var_2 = var_1[0];
  else if (scripts\engine\utility::string_starts_with(var_1[0], "pf")) {
  var_2 = var_1[1];

  for (var_3 = 2; var_3 < var_1.size; var_3++)
  var_2 = var_2 + "_" + var_1[var_3];
  }
  else
  var_2 = var_0._id_027C;

  return var_2;
}

_id_9757() {
  level._id_106E2 = 0;
  level._id_A8BC = 0;
  level._id_1096B = 0;
  level._id_13F36 = ::_id_5CF7;
  init_event_waves();
  _id_9605();
}

init_event_waves() {
  level._id_6840 = [];

  if (isdefined(level.event_funcs_init))
  [[level.event_funcs_init]]();
  else
  {
  level._id_6840["goon"] = ::_id_8453;
  _id_9608();
  }
}

_id_B26D() {
  if (!_id_9C13(level._id_162C, self))
  level._id_162C[level._id_162C.size] = self;

  self._id_0019 = 1;
  self._id_93A8 = 0;
}

_id_B26E() {
  self._id_0019 = 0;
}

_id_8453() {
  level._id_10E3C = _id_79EB();
  level._id_5F7F = [];
  level._id_B467 = 24;
  level._id_B432 = 0;
  level._id_5274 = _id_8455();
  level._id_4B6E = 0;

  while (level.wait_for_music_clown_wave == 0)
  wait 0.1;

  _id_1071B();
}

_id_5CF7(var_0, var_1, var_2) {
  if (isdefined(level._id_726C)) {
  level thread _id_0A76::_id_5CF6(var_1, var_2, level._id_726C);
  level._id_726C = undefined;
  return 1;
  }

  if (level._id_106E2 == 1) {
  if (level._id_5274 == level._id_4B6E) {
  level thread _id_0A76::_id_5CF6(var_1, var_2, "ammo_max");
  return 1;
  }
  else
  return 0;
  }
  else
  return 0;
}

_id_79EB() {
  return ["generic_zombie"];
}

_id_79E9() {
  return ["zombie_ghost"];
}

_id_8454(var_0, var_1) {
  var_2 = 1.5;

  switch (level._id_1096B) {
  case 0:
  var_2 = 3;
  break;
  case 1:
  var_2 = 2;
  break;
  case 2:
  var_2 = 1.5;
  break;
  case 3:
  var_2 = 1;
  break;
  default:
  var_2 = 1;
  }

  var_2 = var_2 - var_0 / var_1;
  var_2 = max(var_2, 0.05);
  return var_2;
}

_id_826F() {
  var_0 = 0.5;
  return var_0;
}

_id_8455() {
  var_0 = level.players.size;
  var_1 = var_0 * 6;
  var_2 = 2;

  switch (level._id_1096B) {
  case 0:
  var_1 = var_0 * 6;
  break;
  case 1:
  var_1 = var_0 * 9;
  break;
  case 2:
  var_1 = var_0 * 12;
  break;
  case 3:
  var_1 = var_0 * 12;
  var_2 = 3;
  break;
  default:
  var_1 = var_0 * 15;
  var_2 = 3;
  }

  var_1 = var_1 * var_2;
  return var_1;
}

_id_8270() {
  var_0 = level.players.size;
  return 8 + 4 * var_0;
}

_id_1071B() {
  level endon("force_spawn_wave_done");
  level endon("game_ended");
  level._id_E299 = 0;
  level._id_C1E8 = 0;
  level._id_4BB5 = 0;
  level._id_10725 = [];
  var_0 = 0;

  while (level._id_4B6E < level._id_5274) {
  while (scripts\engine\utility::_id_9CEE(level._id_13FA3) || scripts\engine\utility::_id_9CEE(level.nuke_zombies_paused))
  scripts\engine\utility::waitframe();

  var_1 = _id_C1E9();
  var_2 = get_spawner_and_spawn_goons(var_1);
  var_0 = var_0 + var_2;

  if (var_2 > 0) {
  wait(_id_8454(var_0, level._id_5274));
  continue;
  }

  wait 0.1;
  }

  level._id_B467 = 0;
  level._id_B432 = 0;
  level._id_11046 = 1;
}

get_spawner_and_spawn_goons(var_0) {
  if (isdefined(level.special_zombie_spawn_func)) {
  var_1 = [[level.special_zombie_spawn_func]](var_0);
  return var_1;
  }

  var_2 = 0;

  if (var_0 <= 0) {
  if (var_0 < 0)
  _id_A5FA(abs(var_0));

  return 0;
  }

  var_1 = min(var_0, 2);
  _id_1071C(var_1);
  return var_1;
}

_id_10717() {
  level endon("game_ended");
  level endon("stop_ghost_spawn");
  var_0 = 24;
  var_1 = _id_826F();

  for (;;) {
  var_2 = _id_7C2D();

  if (isdefined(var_2)) {
  var_2._id_93A8 = 1;
  var_2.lastspawntime = gettime();
  var_3 = var_0 - level._id_13F2D.size;
  level thread _id_10718(var_2, var_3);
  }

  wait(var_1);
  }
}

_id_1071C(var_0) {
  var_1 = 0.3;
  var_2 = 0.7;

  if (var_0 > 0) {
  _id_93E6(var_0);
  var_3 = [];
  var_4 = scripts\engine\utility::_id_817E("brute_hide_org", "targetname");
  var_5 = 0;

  while (var_5 < var_0) {
  var_6 = _id_10719(var_4);

  if (isdefined(var_6)) {
  var_5++;
  var_6 _meth_82EF(var_6.origin);
  var_6 scripts\anim\notetracks_mp::_id_F85E(1, "spawn_in_box");
  var_6._id_0180 = 1;
  var_6._id_0184 = 1;
  var_6._id_EF64 = 1;
  var_3[var_3.size] = var_6;
  }

  wait 0.1;
  }

  var_7 = _id_7C2E();
  var_7._id_93A8 = 1;
  var_7.lastspawntime = gettime();
  thread _id_0A77::_id_D52A("zombie_spawn_lightning", var_7.origin);

  for (var_8 = 0; var_8 < var_3.size; var_8++) {
  var_6 = var_3[var_8];
  var_9 = _id_772C(var_7.origin, var_7.angles);
  var_6._id_02AE = var_9;
  _id_1B99(var_6._id_02AE);
  var_6 _id_BC94(var_6._id_02AE);
  var_6._id_0184 = 0;
  var_6._id_EF64 = 0;
  var_6 scripts\anim\notetracks_mp::_id_F85E(0, "spawn_in_box");
  var_9 = undefined;
  _id_4FB6(1);
  wait(randomfloatrange(var_1, var_2));
  }

  var_7._id_93A8 = 0;
  }
}

_id_BC94(var_0) {
  var_1 = getclosestpointonnavmesh(var_0.origin);
  self dontinterpolate();
  self setorigin(var_0.origin, 1);
  self _meth_8286(var_0.origin);
  self._id_0180 = 0;
}

_id_10718(var_0, var_1) {
  level endon("game_ended");
  level endon("stop_ghost_spawn");
  var_2 = 1;
  var_3 = 1;
  var_4 = 0.3;
  var_5 = 0.7;
  var_6 = var_0.origin;
  var_7 = var_0.angles;
  var_8 = min(var_1, randomintrange(var_2, var_3 + 1));

  for (var_9 = 0; var_9 < var_8; var_9++) {
  _id_10713(var_0);
  wait(randomfloatrange(var_4, var_5));
  var_0 = _id_772C(var_6, var_7);
  }
}

_id_772C(var_0, var_1) {
  var_2 = 50;
  var_3 = 50;
  var_4 = spawnstruct();
  var_4.angles = var_1;
  var_5 = var_4.origin;
  var_6 = 0;

  while (!var_6) {
  var_7 = randomintrange(var_2 * -1, var_2);
  var_8 = randomintrange(var_3 * -1, var_3);
  var_5 = getclosestpointonnavmesh((var_0[0] + var_7, var_0[1] + var_8, var_0[2]));
  var_6 = 1;

  foreach (var_10 in level.players) {
  if (positionwouldtelefrag(var_5))
  var_6 = 0;
  }

  if (!var_6)
  wait 0.1;
  }

  var_4.origin = var_5 + (0, 0, 5);
  return var_4;
}

_id_10719(var_0) {
  var_1 = "zombie_clown";
  var_2 = var_0 _id_1068A();

  if (isdefined(var_2)) {
  var_2._id_13550 = level._id_13F18;
  level thread _id_0D62::_id_CE9C(var_2, "spawn", 1);
  var_2 _meth_84E6(4);
  var_0.lastspawntime = gettime();
  }

  return var_2;
}

_id_10713(var_0) {
  if (isdefined(level.zombie_ghost_color_manager))
  [[level.zombie_ghost_color_manager]]();

  var_1 = _id_13F2A("zombie_ghost", "axis", var_0.origin, var_0.angles);

  if (isdefined(var_1)) {
  level._id_13F2D[level._id_13F2D.size] = var_1;
  var_0.lastspawntime = gettime();
  }
}

_id_E82B() {
  self endon("death");

  for (;;) {
  var_0 = length(self._id_0381);

  if (var_0 > 350)
  iprintln("speed = " + var_0);

  wait 0.25;
  }
}

_id_1B99(var_0) {
  if (ispointinvolume(var_0.origin, level._id_10817["underground_route"]))
  var_1 = level._effect["goon_spawn_bolt_underground"];
  else
  var_1 = level._effect["goon_spawn_bolt"];

  playfx(var_1, var_0.origin);
  playfx(level._effect["drone_ground_spawn"], var_0.origin, (0, 0, 1));
  playrumbleonentity("grenade_rumble", var_0.origin);
  earthquake(0.3, 0.2, var_0.origin, 500);
}

_id_3115(var_0) {
  if (ispointinvolume(var_0.origin, level._id_10817["underground_route"]))
  var_1 = level._effect["brute_spawn_bolt_indoor"];
  else
  var_1 = level._effect["brute_spawn_bolt"];

  thread _id_0A77::_id_D52A("brute_spawn_lightning", var_0.origin);
  playfx(var_1, var_0.origin);
  playfx(level._effect["drone_ground_spawn"], var_0.origin, (0, 0, 1));
  playrumbleonentity("grenade_rumble", var_0.origin);
  earthquake(0.3, 0.2, var_0.origin, 500);
}

_id_C1E9() {
  var_0 = _id_C209();
  return var_0;
}

_id_FF95() {
  var_0 = _id_C209();

  if (var_0 > 0)
  return !(level._id_C1E7 + level._id_4B6E + level._id_4B95 >= level._id_5274);

  return 0;
}

_id_7C2E() {
  var_0 = undefined;
  var_0 = _id_79EC();
  return var_0;
}

_id_79EC() {
  var_0 = [];

  foreach (var_2 in level._id_162C) {
  if (scripts\engine\utility::_id_9CEE(var_2._id_0019) && !scripts\engine\utility::_id_9CEE(var_2._id_93A8))
  var_0[var_0.size] = var_2;
  }

  if (var_0.size > 0) {
  var_2 = _id_8456(var_0);

  if (isdefined(var_2))
  return var_2;
  }

  return scripts\engine\utility::_id_DC6B(var_0);
}

_id_8456(var_0) {
  var_1 = [];
  var_2 = 2;
  var_3 = 1;
  var_4 = 5000;

  foreach (var_6 in var_0) {
  if (_id_0D60::_id_800B(var_6._id_13538)) {
  var_1[var_1.size] = var_6;
  var_6._id_B92F = var_2;
  continue;
  }

  if (isdefined(var_6._id_13538._id_186E)) {
  foreach (var_8 in var_6._id_13538._id_186E) {
  if (_id_0D60::_id_800B(var_8)) {
  var_1[var_1.size] = var_6;
  var_6._id_B92F = var_3;
  break;
  }
  }
  }
  }

  var_11 = 562500;
  var_12 = 4000000;
  var_13 = 9000000;
  var_14 = 122500;
  var_15 = 40000;
  var_16 = -99999999;
  var_17 = undefined;
  var_18 = 15000;
  var_19 = 40000;
  var_20 = " ";
  var_21 = undefined;
  var_22 = gettime();
  var_23 = _id_81F8();
  var_24 = [];

  if (!isdefined(var_23))
  return undefined;

  foreach (var_6 in var_1) {
  var_21 = "";
  var_26 = 0;
  var_27 = var_6._id_B92F * randomintrange(var_18, var_19);
  var_28 = randomint(100);

  if (isdefined(var_6._id_BF6C) && var_6._id_BF6C >= var_22) {
  var_26 = var_26 - 20000;
  var_21 = var_21 + " Short Cooldown";
  }

  var_29 = distancesquared(var_23.origin, var_6.origin);

  if (var_29 < var_14) {
  var_26 = var_26 - 50000;
  var_21 = var_21 + " Too Close";
  }
  else if (var_29 > var_13) {
  var_26 = var_26 - 50000;
  var_21 = var_21 + " Too Far";
  }
  else if (var_29 < var_11) {
  if (var_28 < max(int(level._id_1096B + 1) * 10, 20)) {
  var_26 = var_26 + var_27;
  var_21 = var_21 + " Chance Close";
  } else {
  var_26 = var_26 - var_27;
  var_21 = var_21 + " Close";
  }
  }
  else if (var_29 > var_12) {
  var_26 = var_26 - var_27;
  var_21 = var_21 + " Far";
  } else {
  var_26 = var_26 + var_27;
  var_21 = var_21 + " Good Spawn";
  }

  if (var_26 > var_16) {
  var_16 = var_26;
  var_17 = var_6;
  var_20 = var_21;
  var_24[var_24.size] = var_6;
  }
  }

  if (!isdefined(var_17))
  return undefined;

  for (var_31 = var_24.size - 1; var_31 >= 0; var_31--) {
  var_32 = 1;

  foreach (var_23 in level.players) {
  if (distancesquared(var_23.origin, var_24[var_31].origin) < var_15) {
  var_32 = 0;
  break;
  }
  }

  if (var_32) {
  var_17 = var_24[var_31];
  break;
  }
  }

  var_17._id_BF6C = var_22 + var_4;
  return var_17;
}

_id_81F8() {
  var_0 = [];

  foreach (var_2 in level.players) {
  if (!isalive(var_2))
  continue;

  if (scripts\engine\utility::_id_9CEE(var_2._id_AD2C))
  continue;

  var_0[var_0.size] = var_2;
  }

  return scripts\engine\utility::_id_DC6B(var_0);
}

_id_7C2D() {
  var_0 = undefined;
  var_0 = _id_79EA();
  return var_0;
}

_id_79EA() {
  var_0 = [];

  foreach (var_2 in level._id_8271) {
  if (scripts\engine\utility::_id_9CEE(var_2._id_0019))
  var_0[var_0.size] = var_2;
  }

  if (isdefined(level._id_13FA6) && var_0.size > 0)
  return [[level._id_13FA6]](var_0);

  return var_0;
}

_id_9608() {
  level._id_8457 = [];
  var_0 = scripts\engine\utility::_id_8180("dog_spawner", "targetname");

  if (isdefined(level.goon_spawner_patch_func))
  [[level.goon_spawner_patch_func]](var_0);

  foreach (var_2 in var_0) {
  var_3 = 0;

  foreach (var_5 in level._id_9B0B) {
  if (ispointinvolume(var_2.origin, var_5))
  var_3 = 1;
  }

  if (!var_3) {
  foreach (var_5 in level._id_10816) {
  if (ispointinvolume(var_2.origin, var_5)) {
  if (!isdefined(var_2.angles))
  var_2.angles = (0, 0, 0);

  level._id_8457[level._id_8457.size] = var_2;
  var_2._id_13538 = var_5;

  if (!isdefined(var_5._id_8457))
  var_5._id_8457 = [];

  var_5._id_8457[var_5._id_8457.size] = var_2;
  break;
  }
  }
  }
  }
}

move_goon_spawner(var_0, var_1, var_2) {
  var_3 = scripts\engine\utility::_id_7E2E(var_1, var_0, 500);
  var_3.origin = var_2;
}

_id_9605() {
  level._id_8271 = [];
  var_0 = scripts\engine\utility::_id_8180("ghost_spawn", "targetname");

  foreach (var_2 in var_0) {
  var_2._id_0019 = 1;

  if (!isdefined(var_2.angles))
  var_2.angles = (0, 0, 0);

  level._id_8271[level._id_8271.size] = var_2;
  }
}

_id_1B98(var_0, var_1, var_2, var_3) {
  var_4 = _id_0A4A::_id_179E("axis", var_1, var_2, "wave " + var_0);

  if (!isdefined(var_4))
  return undefined;

  if (scripts\engine\utility::_id_9CEE(level._id_68AA)) {
  var_4.maxhealth = _id_3712();
  var_4.health = var_4.maxhealth;
  var_4._id_13550 = level._id_13F18;
  }

  if (var_4.agent_type == "elite") {
  var_4.maxhealth = 15000 * level.player.size;
  var_4.health = var_4.maxhealth;
  earthquake(0.3, 5, var_4.origin, 3000);
  }

  if (isdefined(var_3))
  var_4._id_02AE = var_3;

  return var_4;
}

_id_3712() {
  var_0 = 400;

  switch (level._id_1096B) {
  case 1:
  case 0:
  var_0 = 400;
  break;
  case 2:
  var_0 = 900;
  break;
  case 3:
  var_0 = 1300;
  break;
  default:
  var_0 = 1600;
  }

  return var_0;
}

_id_7CE3() {
  if (!isdefined(self._id_0334))
  return undefined;

  var_0 = getentarray(self._id_0334, "targetname");

  if (!isdefined(var_0) || var_0.size == 0)
  var_0 = scripts\engine\utility::_id_8180(self._id_0334, "targetname");

  var_1 = [];

  foreach (var_3 in var_0) {
  if (isdefined(var_3.remove_me))
  var_1[var_1.size] = var_3;
  }

  if (var_1.size > 0)
  var_0 = scripts\engine\utility::_id_22AC(var_0, var_1);

  return var_0;
}

update_origin(var_0, var_1, var_2) {
  if (!isdefined(level.spawn_struct_list))
  level.spawn_struct_list = scripts\engine\utility::_id_8180("static", "script_noteworthy");

  foreach (var_4 in level.spawn_struct_list) {
  if (var_4.origin == var_0) {
  var_4.origin = var_1;

  if (isdefined(var_2))
  var_4.angles = var_2;

  break;
  }
  }
}

remove_origin(var_0) {
  if (!isdefined(level.spawn_struct_list))
  level.spawn_struct_list = scripts\engine\utility::_id_8180("static", "script_noteworthy");

  foreach (var_2 in level.spawn_struct_list) {
  if (var_2.origin == var_0) {
  var_2.remove_me = 1;
  break;
  }
  }
}

update_kvp(var_0, var_1, var_2) {
  if (!isdefined(level.spawn_struct_list))
  level.spawn_struct_list = scripts\engine\utility::_id_8180("static", "script_noteworthy");

  foreach (var_4 in level.spawn_struct_list) {
  if (var_4.origin == var_0) {
  var_4 = [[level.kvp_update_funcs[var_1]]](var_4, var_2);
  break;
  }
  }
}

kvp_update_init() {
  level.kvp_update_funcs["script_fxid"] = ::update_kvp_script_fxid;
}

update_kvp_script_fxid(var_0, var_1) {
  var_0._id_EDBB = var_1;
  return var_0;
}

_id_77D3() {
  if (isdefined(level._id_186E[self._id_28AB])) {
  var_0 = [];

  foreach (var_2 in level._id_186E[self._id_28AB])
  var_0[var_0.size] = level._id_10817[var_2];

  return var_0;
  }

  return [];
}

_id_7C8E() {
  var_0 = _id_7CE3();

  if (isdefined(var_0) && var_0.size > 0) {
  self._id_1087B = var_0;

  foreach (var_2 in self._id_1087B)
  var_2 _id_10865(self);
  }

  _id_F546(self);
}

_id_7999() {
  var_0 = getentarray(self._id_027C, "script_noteworthy");

  if (isdefined(var_0) && var_0.size != 0)
  self._id_665B = var_0;
}

_id_6514() {
  level endon("game_ended");

  if (!scripts\engine\utility::_id_6E25("init_spawn_volumes_done"))
  scripts\engine\utility::_id_6E4C("init_spawn_volumes_done");

  while (!scripts\engine\utility::_id_9CEE(level._id_9AF6))
  wait 1;

  if (!_id_0A77::_id_9BD8())
  wait 15;
  else
  wait 1;

  if (!_id_0A77::_id_9BD8())
  _id_15BA();

  level thread _id_10D2E();
}

_id_4F1E() {
  level endon("game_ended");
  var_0 = getdvarint("scr_spawn_start_delay");

  if (var_0 > 0)
  wait(var_0);
}

_id_15BA() {
  if (isdefined(level._id_9819)) {
  foreach (var_1 in level._id_9819) {
  if (isdefined(level._id_10816[var_1]))
  level._id_10816[var_1] _id_B291();
  }
  }
}

_id_10865(var_0) {
  self._id_0019 = 0;
  self._id_13538 = var_0;
  level._id_1BF5[level._id_1BF5.size] = self;

  if (!isdefined(self.script_noteworthy) || self.script_noteworthy != "static")
  level._id_5F90[level._id_5F90.size] = self;
  else
  {
  self._id_10E45 = 1;
  level._id_10E44[level._id_10E44.size] = self;
  }

  if (!isdefined(self.angles))
  self.angles = (0, 0, 0);

  if (ispointinvolume(self.origin, var_0))
  self._id_93A1 = 1;
  else
  self._id_93A1 = 0;

  if (isdefined(self._id_ECF5)) {
  switch (self._id_ECF5) {
  case "spawn_ground":
  thread _id_5D13();
  break;
  case "spawn_ceiling":
  thread _id_B0D1();
  break;
  case "spawn_wall_low":
  self._id_1CAE = 1;
  }
  }
}

_id_5D13() {
  var_0 = scripts\engine\utility::_id_5D14(self.origin, 10);
  self.origin = var_0 + (0, 0, 1);
}

_id_B0D1() {
  self._id_ABA7 = self.origin;
  var_0 = scripts\engine\utility::_id_5D14(self.origin, 0);
  self._id_ABA6 = var_0;
}

_id_6714() {
  if (!scripts\engine\utility::_id_6E34("init_spawn_volumes_done"))
  scripts\engine\utility::_id_6E39("init_spawn_volumes_done");

  if (!scripts\engine\utility::_id_6E25("init_spawn_volumes_done"))
  scripts\engine\utility::_id_6E4C("init_spawn_volumes_done");

  level._id_1BF5 = [];
  level._id_671F = [];
  level._id_1647 = [];
  level._id_6727 = "escape_path_0_start";
  level._id_4B3F = level._id_6727;
  scripts\engine\utility::_id_6E39("escape_room_triggers_spawned");
  level thread _id_106D8();
  level thread _id_66DA();
}

_id_106D8() {
  var_0 = scripts\engine\utility::_id_8180("escape_spawn_trigger", "targetname");

  foreach (var_2 in var_0) {
  var_3 = spawn("trigger_radius", var_2.origin, 0, var_2.radius, 96);
  var_3._id_0336 = var_2._id_0336;
  var_3._id_ECFA = var_2._id_ECFA;
  var_3._id_0334 = var_2._id_0334;
  wait 0.05;
  }

  var_5 = getentarray("escape_spawn_trigger", "targetname");

  foreach (var_3 in var_5)
  var_3 thread _id_6730();
}

_id_6730() {
  self._id_E6DB = self._id_ECFA;
  level._id_4BD4 = 0;

  if (self._id_E6DB == level._id_6727)
  thread _id_6731();

  var_0 = scripts\engine\utility::_id_8180(self._id_0334, "targetname");

  foreach (var_2 in var_0)
  var_2 thread _id_6722(self._id_E6DB);
}

_id_6731(var_0) {
  level endon(self._id_E6DB + "_done");
  level endon("game_ended");

  if (getdvarint("esc_zombies_triggertrig") == 0) {
  var_1 = 0;
  var_2 = 70;

  for (;;) {
  self waittill("trigger", var_3);

  if (!isplayer(var_3)) {
  wait 0.1;
  var_1 = var_1 + 0.1;

  if (var_1 >= var_2)
  break;
  }
  else
  break;
  }
  } else {
  for (;;) {
  self waittill("trigger", var_3);

  if (!isplayer(var_3))
  continue;
  else
  break;
  }
  }

  if (isdefined(var_0) && !level._id_4BD4) {
  foreach (var_5 in var_0) {
  var_5._id_54CB = 1;
  var_5 suicide();
  }

  level._id_4BD4 = 1;
  level._id_C20B = 0;
  level notify("update_escape_timer");
  var_7 = strtok(tablelookup(level._id_6728, 0, level._id_4BA8, 3), " ");
  level._id_672A = int(var_7[level.players.size - 1]);
  level thread [[level._id_672C]]();
  level._id_4BA8++;
  }

  _id_12DBF();
}

_id_12DBF() {
  _id_1294D();
  var_0 = scripts\engine\utility::_id_8180(self._id_0334, "targetname");

  foreach (var_2 in var_0) {
  var_2._id_0019 = 1;
  level._id_1647[level._id_1647.size] = var_2;
  }
}

_id_1294D() {
  foreach (var_1 in level._id_1647) {
  var_1._id_0019 = 0;
  var_1 notify("dont_restart_spawner");
  }

  level._id_1647 = [];
}

_id_6722(var_0) {
  self._id_0019 = 0;
  self._id_1353B = var_0;
  level._id_1BF5[level._id_1BF5.size] = self;
  level._id_671F[level._id_671F.size] = self;

  if (!isdefined(self.angles))
  self.angles = (0, 0, 0);
}

_id_66DA() {
  for (;;) {
  level waittill("next_area_opened", var_0);
  level notify(level._id_4B3F + "_done");
  level._id_13BD3++;
  level._id_4B3F = var_0;
  _id_1294D();
  var_1 = getentarray("escape_spawn_trigger", "targetname");
  var_2 = level._id_1084F;
  level._id_4BD4 = 0;

  foreach (var_4 in var_1) {
  if (var_4._id_ECFA == var_0)
  var_4 thread _id_6731(var_2);
  }
  }
}

_id_66D6() {
  self endon("death");
  var_0 = 2560000;

  for (;;) {
  wait 0.1;
  var_1 = 1;

  foreach (var_3 in level.players) {
  if (scripts\engine\utility::_id_9CEE(var_3._id_1097A))
  continue;

  if (distancesquared(var_3.origin, self.origin) < var_0)
  var_1 = 0;
  }

  if (var_1)
  break;
  }

  wait 0.5;
  self._id_54CB = 1;

  if (scripts\engine\utility::_id_9CEE(self._id_9D25))
  self _meth_80B0(self.health + 1000, self.origin);
  else
  {}
}

_id_10D2E() {
  level thread _id_E81B();
}

_id_10927() {
  level endon("force_spawn_wave_done");
  level endon("spawn_wave_done");
  level endon("game_ended");
  var_0 = level._id_5274;
  var_1 = _id_7C79();
  level._id_E299 = 0;

  if (!isdefined(level._id_2CDB))
  level._id_2CDB = 50;

  level.respawn_enemy_list = [];
  level.respawn_data = undefined;
  var_2 = _id_C212();
  var_3 = int(var_0 / 4);
  var_4 = int(var_0 / 2);
  var_5 = 0;

  if (var_3 != var_4)
  var_5 = randomintrange(var_3, var_4);
  else
  var_5 = var_3;

  var_6 = 1;
  var_7 = int(var_0 / 8);
  var_8 = int(var_0 / 4);

  if (var_7 != var_8)
  var_6 = randomintrange(var_7, var_8);
  else
  var_6 = var_7;

  var_6 = var_5 - var_6;

  while (level._id_4B6E < level._id_5274) {
  while (scripts\engine\utility::_id_9CEE(level._id_13FA3) || scripts\engine\utility::_id_9CEE(level.nuke_zombies_paused))
  scripts\engine\utility::waitframe();

  var_9 = _id_C209();

  if (var_9 <= 0) {
  if (var_9 < 0)
  _id_A5FA(abs(var_9));

  wait 0.1;
  continue;
  }

  var_10 = undefined;

  if (!isdefined(level.respawn_data) && level.respawn_enemy_list.size > 0)
  level.respawn_data = level.respawn_enemy_list[0];

  if (var_2 && var_5 < 1 || scripts\engine\utility::_id_6E25("force_spawn_boss")) {
  var_10 = _id_2CFC();

  if (isdefined(var_10)) {
  if (scripts\engine\utility::_id_6E25("force_spawn_boss"))
  scripts\engine\utility::_id_6E2A("force_spawn_boss");

  if (var_2 >= 1)
  var_2--;
  }
  }
  else if (should_spawn_clown() && var_5 < var_6)
  var_10 = get_spawner_and_spawn_goons(var_9);
  else
  {
  if (var_5)
  var_5--;

  var_10 = _id_10822();
  }

  if (isdefined(var_10)) {
  if (level._id_E299 > 0) {
  level._id_E299 = int(level._id_E299 - var_10);
  wait 0.1;
  continue;
  }
  }

  var_1 = _id_7C79();
  wait(var_1);
  }

  level.respawn_enemy_list = [];
  level.respawn_data = undefined;
}

_id_10822() {
  var_0 = _id_7C2F();

  if (isdefined(var_0)) {
  if (!scripts\engine\utility::_id_9CEE(var_0._id_0019))
  return 0;

  var_0._id_93A8 = 1;
  var_1 = _id_FF98(var_0);

  if (isdefined(var_1))
  var_2 = var_1;
  else if (!isdefined(level._id_10E3C))
  var_2 = "generic_zombie";
  else
  var_2 = scripts\engine\utility::_id_DC6B(level._id_10E3C);

  if (isdefined(level.respawn_data))
  var_2 = level.respawn_data.type;

  var_3 = var_0 _id_1081B(var_2, 1);

  if (isdefined(var_3)) {
  var_3 _id_0D48::_id_668D(var_3);
  var_3 _id_0D5E::_id_6690(var_3);
  var_0.lastspawntime = gettime();
  var_0 thread _id_1296E(0.25);
  }
  else
  return 0;
  }
  else
  return 0;

  return 1;
}

_id_2CFC() {
  if (isdefined(level.boss_spawn_func))
  return [[level.boss_spawn_func]]();

  var_0 = undefined;
  var_1 = _id_7C2E();

  if (isdefined(var_1)) {
  var_2 = scripts\engine\utility::_id_817E("brute_hide_org", "targetname");
  var_0 = var_2 _id_1081B("zombie_brute", 1);

  if (!isdefined(var_0))
  return 0;

  var_1._id_93A8 = 1;
  level._id_A88E = level._id_13BD3;
  _id_3115(var_1);
  var_0 _id_BC94(var_1);
  var_1._id_93A8 = 0;
  }
  else
  return 0;

  level notify("boss_spawned", var_0);
  level thread _id_CCBB();

  if (scripts\engine\utility::_id_6E25("force_spawn_boss"))
  var_0._id_72AC = 1;

  var_0 thread killplayersifonhead(var_0);
  return 1;
}

killplayersifonhead(var_0) {
  level endon("game_ended");
  var_0 endon("death");
  var_1 = scripts\engine\trace::_id_48B1();

  for (;;) {
  foreach (var_3 in level.players) {
  if (distance2dsquared(var_3.origin, var_0.origin) <= 1024) {
  if (!var_3 isonground() && var_3.origin[2] > var_0.origin[2]) {
  var_4 = scripts\engine\trace::_id_3A09(var_0 gettagorigin("tag_eye"), var_0 gettagorigin("tag_eye") + (0, 0, 56), 32, 64, undefined, var_0);

  if (isdefined(var_4["entity"]) && isplayer(var_4["entity"]) && !var_4["entity"] isonground())
  var_4["entity"] _meth_80B0(10000, var_0.origin, var_4["entity"], var_4["entity"], "MOD_UNKNOWN", "frag_grenade_zm");
  }
  }
  }

  wait 0.2;
  }
}

_id_CCBB() {
  if (level._id_311A == 1) {
  foreach (var_1 in level.players)
  var_1 thread _id_0A6A::_id_12885("brute_generic", "zmb_comment_vo", "highest", 20, 0, 0, 1);

  wait 6;
  level thread _id_0A6A::_id_12885("ww_brute_spawn", "zmb_ww_vo", "highest", 20, 0, 0, 1);
  } else {
  level._id_311A = 1;

  foreach (var_1 in level.players)
  var_1 thread _id_0A6A::_id_12885("brute_first", "zmb_comment_vo", "highest", 20, 0, 0, 1);

  wait 6;
  level thread _id_0A6A::_id_12885("ww_brute_firstspawn", "zmb_ww_vo", "highest", 20, 0, 0, 1);
  }
}

_id_C212() {
  if (getdvar("ui_mapname") == "cp_rave" || getdvar("ui_mapname") == "cp_disco")
  return 0;

  var_0 = 10;
  var_1 = 19;

  if (!isdefined(level._id_A88E))
  level._id_A88E = 0;

  if (!isdefined(level._id_3120))
  level._id_3120 = [];

  var_2 = 0;
  var_3 = getdvarint("scr_force_boss_spawn", 0);

  if (var_3 != 0) {
  if (level._id_13BD3 > var_1)
  var_2 = 2;
  else
  var_2 = 1;

  if (level._id_3120.size < var_2)
  return var_2 - level._id_3120.size;
  }

  if (level._id_13BD3 < var_0)
  return 0;

  if (scripts\engine\utility::_id_6E25("pause_wave_progression"))
  return 0;

  if (level._id_A88E + 3 < level._id_13BD3) {
  if (randomint(100) < level._id_2CDB) {
  level._id_2CDB = 50;

  if (level._id_13BD3 > var_1)
  var_2 = 2;
  else
  var_2 = 1;

  if (level._id_3120.size < var_2)
  return var_2 - level._id_3120.size;
  } else {
  level._id_2CDB = level._id_2CDB + 50;
  return 0;
  }
  }

  return 0;
}

should_spawn_clown() {
  if (isdefined(level.should_spawn_special_zombie_func)) {
  var_0 = [[level.should_spawn_special_zombie_func]]();
  return scripts\engine\utility::_id_9CEE(var_0);
  }

  if (isdefined(level.no_clown_spawn))
  return 0;

  if (isdefined(level.respawn_data)) {
  if (level.respawn_data.type == "zombie_clown")
  return 1;

  return 0;
  }

  var_1 = randomint(100);

  if (var_1 < min(level._id_13BD3 - 19, 10) && level._id_13BD3 > 20) {
  if (gettime() - level.last_clown_spawn_time > 15000) {
  level.last_clown_spawn_time = gettime();
  return 1;
  }
  }

  return 0;
}

_id_AD62() {
  level endon("game_ended");

  for (;;) {
  if (getdvarint("scr_reserve_spawning") > 0)
  level._id_E1CC = getdvarint("scr_reserve_spawning");

  wait 1.0;
  }
}

_id_A5FA(var_0, var_1) {
  var_2 = cos(70);
  var_3 = 0;

  foreach (var_5 in level._id_1084F) {
  if (isdefined(var_5._id_594C))
  continue;

  var_6 = 0;

  foreach (var_8 in level.players) {
  var_6 = scripts\engine\utility::within_fov(var_8.origin, var_8.angles, var_5.origin, var_2);

  if (var_6)
  break;
  }

  if (!var_6) {
  var_5._id_54CB = 1;
  var_5 _meth_80B0(var_5.health + 980, var_5.origin, var_5, var_5, "MOD_SUICIDE");
  var_3++;

  if (var_0 <= var_3)
  return;
  }

  wait 0.1;
  }

  if (var_0 > var_3) {
  var_11 = scripts\engine\utility::_id_22A7(level._id_1084F);

  foreach (var_5 in var_11) {
  var_5._id_54CB = 1;
  var_5 _meth_80B0(var_5.health + 970, var_5.origin, var_5, var_5, "MOD_SUICIDE");
  var_3++;

  if (var_0 <= var_3)
  return;
  }
  }
}

_id_726E() {
  level notify("force_spawn_wave_done");
  wait 0.1;
  level._id_B467 = 0;
  level._id_B432 = 0;
  level._id_11046 = 1;
}

_id_172A(var_0) {
  var_1 = (0, 0, 0);
  var_2 = (0, 0, 0);
  var_3 = var_0 gettagorigin("j_spine4");
  var_4 = spawn("script_model", var_3);
  var_4 setmodel("zombies_backpack");
  var_4.angles = var_0.angles;
  var_4 linkto(var_0, var_3, var_1, var_2);
  var_0._id_8B9B = 1;
}

_id_C209() {
  var_0 = 100;
  var_1 = level._id_B467 - level._id_4B95 - level._id_E1CC - level._id_50F8;

  if (var_1 < var_0)
  var_0 = var_1;

  if (_id_0A77::_id_9BD8())
  return var_0;

  var_1 = level._id_5274 - level._id_4B95 - level._id_4B6E - level._id_50F8;

  if (var_1 < var_0)
  var_0 = var_1;

  return var_0;
}

_id_1296E(var_0) {
  self endon("dont_restart_spawner");
  self._id_0019 = 0;
  wait(var_0);
  self._id_0019 = 1;
}

_id_7C79() {
  if (_id_0A77::_id_9BD8()) {
  var_0 = level.players.size;
  return 1 / var_0;
  }

  var_1 = 2;

  if (level._id_13BD3 == 1)
  return var_1;

  var_2 = var_1 * _func_17B(0.95, level._id_13BD3 - 1);

  if (isdefined(level._id_10847))
  var_2 = level._id_10847;

  if (var_2 < 0.08)
  var_2 = 0.08;

  return var_2;
}

_id_1068A(var_0, var_1) {
  var_2 = "zombie_clown";
  var_3 = self.origin;
  var_4 = self.angles;

  if (isdefined(var_0)) {
  var_3 = var_0.origin;
  var_4 = var_0.angles;
  }
  else if (isdefined(var_1))
  var_3 = var_1;

  var_5 = _id_13F53(var_2, var_3, var_4, "axis", self);

  if (!isdefined(var_5))
  return undefined;

  if (isdefined(self._id_13538))
  var_5._id_13538 = self._id_13538;

  if (scripts\engine\utility::_id_9CEE(self._id_9B95))
  var_5 thread _id_42EC(var_2);
  else
  var_5 thread _id_64E7(var_2);

  level notify("agent_spawned", var_5);
  return var_5;
}

_id_1081B(var_0, var_1, var_2, var_3) {
  var_4 = self.origin;
  var_5 = self.angles;

  if (isdefined(var_2)) {
  var_4 = var_2.origin;
  var_5 = var_2.angles;
  }
  else if (isdefined(var_3))
  var_4 = var_3;

  if (!isdefined(self._id_ECF5)) {
  var_4 = getclosestpointonnavmesh(var_4);
  var_4 = var_4 + (0, 0, 5);
  }

  if (level._id_18EE[var_0]["species"] == "alien") {
  var_6 = _id_1B98(var_0, var_4, var_5, self);
  level thread _id_0D62::_id_CE9C(var_6, "spawn", 1);
  }
  else if (level._id_18EE[var_0]["species"] == "c6")
  var_6 = _id_33B1(var_0, var_4, var_5, "axis", self);
  else if (var_0 == "zombie_brute") {
  var_6 = _id_13F13("zombie_brute", "axis", var_4, var_5);

  if (isdefined(var_6))
  level thread _id_0D62::_id_CE9C(var_6, "spawn", 1);
  }
  else
  var_6 = _id_13F53(var_0, var_4, var_5, "axis", self);

  if (!isdefined(var_6))
  return undefined;

  if (isdefined(self._id_13538))
  var_6._id_13538 = self._id_13538;

  if (scripts\engine\utility::_id_9CEE(var_1))
  var_6._id_9CD9 = 1;

  var_6.dont_cleanup = undefined;

  if (_id_9BF8())
  var_6 thread _id_8637();

  if (isdefined(self._id_0334) && !scripts\engine\utility::_id_9CEE(self._id_1024B)) {
  var_7 = scripts\engine\utility::_id_8180(self._id_0334, "targetname");
  var_8 = scripts\engine\utility::_id_DC6B(var_7);
  var_4 = var_8.origin;
  }

  var_6._id_4298 = _id_0A77::_id_78B4(var_4);

  if (scripts\engine\utility::_id_9CEE(self._id_9B95))
  var_6 thread _id_42EC(var_0);
  else if (var_0 == "zombie_brute")
  var_6 thread _id_3114();
  else
  var_6 thread _id_64E7(var_0);

  level notify("agent_spawned", var_6);
  return var_6;
}

_id_13F53(var_0, var_1, var_2, var_3, var_4) {
  var_5 = scripts\mp\mp_agent::_id_108E8(var_0, var_3, var_1, var_2, undefined, var_4);

  if (!isdefined(var_5))
  return undefined;

  if (isdefined(var_5._id_02AE)) {
  if (var_4 _id_0C2B::_id_10863())
  var_5._id_6622 = 1;
  }

  var_5 _meth_8287(var_5._id_503C);
  var_5.maxhealth = var_5 _id_3728(var_0);
  var_5.health = var_5.maxhealth;

  if (isdefined(level.respawn_data)) {
  var_6 = -1;

  for (var_7 = 0; var_7 < level.respawn_enemy_list.size; var_7++) {
  if (level.respawn_enemy_list[var_7]._id_92B8 == level.respawn_data._id_92B8 && level.respawn_data.type == var_0) {
  var_6 = var_7;
  break;
  }
  }

  if (var_6 > -1) {
  if (isdefined(level.respawn_data.health))
  var_5.health = level.respawn_data.health;

  level.respawn_enemy_list = _id_0A77::_id_22B0(level.respawn_enemy_list, var_6);
  }

  level.respawn_data = undefined;
  }

  if (var_0 == "karatemaster" && isdefined(level.zombie_karatemaster_vo_prefix))
  var_5._id_13550 = level.zombie_karatemaster_vo_prefix;
  else if (var_0 == "zombie_brute")
  var_5._id_13550 = level._id_13F14;
  else if (var_0 == "zombie_cop")
  var_5._id_13550 = level._id_13F1A;
  else if (var_0 == "zombie_clown")
  var_5._id_13550 = level._id_13F18;
  else if (issubstr(var_5._id_01F1, "female"))
  var_5._id_13550 = level._id_13F24;
  else if (randomint(100) > 50)
  var_5._id_13550 = level._id_13F39;
  else
  var_5._id_13550 = level._id_13F3A;

  var_5 thread _id_0D62::_id_13F10();
  return var_5;
}

_id_FF98(var_0) {
  if (isdefined(var_0._id_ECF5) && (var_0._id_ECF5 == "spawn_ceiling" || var_0._id_ECF5 == "spawn_wall_low"))
  return undefined;

  if (isdefined(level._id_1094E)) {
  var_1 = undefined;
  var_2 = scripts\engine\utility::_id_22A8(level._id_1094E);

  foreach (var_6, var_4 in var_2) {
  var_5 = [[var_2[var_6]]]();

  if (isdefined(var_5))
  return var_5;
  }
  }

  return undefined;
}

_id_DB23() {
  self endon("death");
  wait 2;
  self setscriptablepartstate("glasses", "show");
}

_id_13F13(var_0, var_1, var_2, var_3) {
  var_4 = 2000;
  var_5 = 2;

  switch (level.players.size) {
  case 1:
  case 0:
  var_5 = var_5 * 1;
  break;
  case 2:
  var_5 = var_5 * 1.5;
  break;
  case 3:
  var_5 = var_5 * 2;
  break;
  case 4:
  var_5 = var_5 * 2.5;
  break;
  }

  var_6 = scripts\mp\mp_agent::_id_108E8(var_0, var_1, var_2, var_3, "iw7_zombie_laser_mp");

  if (!isdefined(var_6))
  return undefined;

  var_7 = _id_3728("generic_zombie");
  var_8 = int(var_7 * var_5);
  var_6.maxhealth = int(min(var_4 + var_8, 5000));
  var_6.health = var_6.maxhealth;
  var_6._id_8DF0 = min(var_6.maxhealth * 0.5, 5000);
  var_6._id_13550 = level._id_13F14;
  var_6 thread _id_310F();
  var_6 thread _id_53A9();
  return var_6;
}

_id_53A9() {
  level endon("game_ended");
  self endon("death");
  var_0 = 0;
  var_1 = 2304;

  for (;;) {
  var_2 = self.origin;
  wait 1;

  if (!scripts\engine\utility::_id_9CEE(self._id_2B5A)) {
  if (distancesquared(self.origin, var_2) < var_1)
  var_0++;
  else
  var_0 = 0;
  }
  else
  var_0 = 0;

  if (var_0 > 3) {
  self setorigin(self.origin + (0, 0, 5), 1);
  var_0 = 0;
  }
  }
}

_id_13F2A(var_0, var_1, var_2, var_3) {
  var_4 = scripts\mp\mp_agent::_id_108E8(var_0, var_1, var_2, var_3);

  if (!isdefined(var_4))
  return undefined;

  var_4.maxhealth = 99999999;
  var_4.health = var_4.maxhealth;
  return var_4;
}

_id_9BF8() {
  if (isdefined(self._id_EE79) && (self._id_EE79 == "ground_spawn" || self._id_EE79 == "ground_spawn_no_boards"))
  return 1;

  return 0;
}

_id_8637() {
  self endon("death");

  if (isdefined(self._id_02AE._id_ECF5))
  return;

  self._id_EF64 = 1;
  self._id_0180 = 1;
  var_0 = 100;

  if (!isdefined(self._id_02AE.angles))
  self._id_02AE.angles = (0, 0, 0);

  var_1 = anglestoup(self._id_02AE.angles);
  var_1 = vectornormalize(var_1);
  var_2 = -1 * var_1;
  var_2 = var_2 * var_0;
  var_3 = 0;

  if (abs(self._id_02AE.angles[2]) > 45)
  var_3 = 1;

  if (var_3)
  var_4 = scripts\engine\trace::_id_DCED(self._id_02AE.origin - (0, 0, 100), self._id_02AE.origin + (0, 0, 50), self);
  else
  var_4 = scripts\engine\trace::_id_DCED(self._id_02AE.origin + (0, 0, 50), self._id_02AE.origin - (0, 0, 100), self);

  var_5 = var_4["position"] + var_2;
  var_6 = var_4["position"];
  _id_13F1D(var_5, var_6, var_3);
  self._id_EF64 = 0;
  self._id_0180 = 0;
}

_id_13F1D(var_0, var_1, var_2) {
  self endon("death");
  var_3 = spawn("script_origin", var_0);
  var_3.angles = self._id_02AE.angles;
  self setorigin(var_0, 0);
  self setplayerangles(self._id_02AE.angles);
  self linkto(var_3);
  self._id_AD1D = var_3;
  thread _id_5173(var_3);
  var_4 = 2;

  if (!var_2) {
  var_3 moveto(var_1, var_4, 0.1, 0.1);
  playfx(level._effect["drone_ground_spawn"], var_1, (0, 0, 1));
  wait(var_4);
  } else {
  var_3 moveto(var_1, var_4, 0.1, 0.1);
  playfx(level._effect["drone_ground_spawn"], var_1, (0, 0, -1));
  wait(var_4);
  var_5 = scripts\engine\trace::_id_DCED(var_1 - (0, 0, 10), var_1 - (0, 0, 1000), self);
  var_3 moveto(var_5["position"] + (0, 0, 10), 0.25, 0.1, 0.1);
  var_6 = (var_3.angles[0], var_3.angles[1], 0);
  var_3 rotateto(var_6, 0.25, 0.1, 0.1);
  wait 0.25;
  }

  if (self._id_02AE._id_EE79 == "ground_spawn_no_boards")
  self._id_6622 = 1;

  self unlink();
  self notify("emerge_done");
}

_id_5173(var_0) {
  scripts\engine\utility::waittill_any("death", "emerge_done");

  if (isdefined(var_0))
  var_0 delete();
}

_id_33B1(var_0, var_1, var_2, var_3, var_4, var_5) {
  if (!isdefined(var_5))
  var_5 = "iw7_erad_zm";

  var_6 = scripts\mp\mp_agent::_id_108E8(var_0, var_3, var_1, var_2, var_5);

  if (!isdefined(var_6))
  return undefined;

  if (isdefined(var_4))
  var_6._id_02AE = var_4;

  var_6._id_9CA2 = 1;
  return var_6;
}

_id_3728(var_0) {
  var_1 = 0;
  var_2 = level._id_13BD3;

  if (isdefined(level._id_8CBD) && isdefined(level._id_8CBD[var_0]))
  var_1 = [[level._id_8CBD[var_0]]]();
  else
  {
  if (isdefined(level._id_13BD6))
  var_2 = level._id_13BD6;

  if (scripts\engine\utility::_id_9CEE(self._id_9BA7))
  var_2 = var_2 + 3;
  else if (scripts\engine\utility::_id_9CEE(self.is_skeleton))
  var_2 = var_2 + 10;

  var_3 = 150;

  if (var_2 == 1)
  var_1 = var_3;
  else if (var_2 <= 9)
  var_1 = var_3 + (var_2 - 1) * 100;
  else
  {
  var_4 = 950;
  var_5 = var_2 - 9;
  var_1 = var_4 * _func_17B(1.1, var_5);
  }
  }

  if (isdefined(level._id_8CB3[var_0]))
  var_1 = int(var_1 * level._id_8CB3[var_0]);

  if (var_1 > 6100000)
  var_1 = 6100000;

  return int(var_1);
}

_id_7C83(var_0, var_1) {
  if (isdefined(level._id_7C80))
  return [[level._id_7C80]]();

  var_2 = [];
  var_3 = level._id_10816;

  foreach (var_5 in var_3) {
  if (!var_5._id_0019)
  continue;

  var_6 = 0;

  foreach (var_8 in level.players) {
  if (isdefined(var_1) && !var_8 _id_0A77::_id_9D05())
  continue;

  if (var_8 istouching(var_5)) {
  var_6 = 1;
  continue;
  }

  if (scripts\engine\utility::_id_9CEE(var_0) && var_8 _id_9C0F(var_5))
  var_6 = 1;
  }

  if (var_6)
  var_2[var_2.size] = var_5;
  }

  return var_2;
}

_id_7C82(var_0, var_1, var_2) {
  if (isdefined(level._id_7C80))
  return [[level._id_7C80]]();

  var_3 = [];
  var_4 = level._id_10816;

  foreach (var_6 in var_4) {
  if (!var_6._id_0019)
  continue;

  var_7 = 0;

  if (isdefined(var_1) && !var_2 _id_0A77::_id_9D05())
  continue;

  if (var_2 istouching(var_6))
  var_7 = 1;
  else if (scripts\engine\utility::_id_9CEE(var_0) && var_2 _id_9C0F(var_6))
  var_7 = 1;

  if (var_7)
  var_3[var_3.size] = var_6;
  }

  return var_3;
}

_id_9C0F(var_0) {
  if (!isdefined(var_0))
  return 0;

  if (!isdefined(var_0._id_186E))
  return 0;

  foreach (var_2 in var_0._id_186E) {
  if (!var_2._id_0019)
  continue;

  if (self istouching(var_2))
  return 1;
  }

  return 0;
}

_id_94D5() {
  while (!isdefined(level._id_1BEC))
  wait 0.1;

  level._id_186E = [];
  level._id_186E["hidden_room"] = [];
  level._id_C50A["mars_3"]["swamp_stage"] = 1;
  var_0 = [];

  foreach (var_2 in level._id_1BEC) {
  if (isdefined(var_2._id_ECFA) && isdefined(var_2.script_noteworthy) && var_2.script_noteworthy != "fast_travel")
  var_0[var_0.size] = var_2;
  }

  level._id_59F4 = var_0;
  scripts\engine\utility::_id_6E3E("init_adjacent_volumes_done");
}

_id_F28B(var_0) {
  var_1 = var_0._id_0334;
  var_2 = undefined;
  var_3 = var_0._id_ECFA;
  var_4 = undefined;

  foreach (var_6 in level._id_59F4) {
  if (var_0 == var_6)
  continue;

  if (var_6._id_ECFA == var_3)
  continue;

  if (var_6._id_0334 == var_1) {
  var_4 = var_6._id_ECFA;
  var_2 = var_6;
  break;
  }
  }

  if (isdefined(var_2)) {
  if (!_id_9C59(var_4, var_3))
  _id_1751(var_2, var_0);
  }
}

_id_1751(var_0, var_1) {
  if (var_0._id_ECFA == var_1._id_ECFA)
  return;

  if (!isdefined(level._id_186E[var_0._id_ECFA]))
  level._id_186E[var_0._id_ECFA] = [];

  if (scripts\engine\utility::array_contains(level._id_186E[var_0._id_ECFA], var_1._id_ECFA))
  return;

  level._id_186E[var_0._id_ECFA][level._id_186E[var_0._id_ECFA].size] = var_1._id_ECFA;
  _id_12E46(var_0._id_ECFA, var_1._id_ECFA);
}

_id_9C59(var_0, var_1) {
  if (!isdefined(level._id_C50A))
  return 0;

  if (!isdefined(level._id_C50A[var_0]))
  return 0;

  if (!isdefined(level._id_C50A[var_0][var_1]))
  return 0;

  return 1;
}

_id_12E46(var_0, var_1) {
  if (!isdefined(var_1))
  return;

  if (!isdefined(level._id_10816[var_1]))
  return;

  if (!isdefined(level._id_10816[var_1]._id_186E))
  level._id_10816[var_1]._id_186E = [];

  level._id_10816[var_1]._id_186E[level._id_10816[var_1]._id_186E.size] = level._id_10816[var_0];
}

_id_7C8C() {
  if (isdefined(level._id_13FA6))
  return [[level._id_13FA6]]();

  return scripts\engine\utility::_id_DC6B(level._id_1647);
}

_id_15FC(var_0) {
  if (isdefined(level._id_10816[var_0]))
  level._id_10816[var_0] _id_B291();
}

_id_B291() {
  var_0 = 1;

  if (_id_0A77::_id_9BD8()) {
  if (!scripts\engine\utility::_id_9CEE(self._id_0019))
  level._id_1647 = [];
  else
  var_0 = 0;
  }

  self._id_0019 = 1;

  if (!_id_9C13(level._id_1646, self)) {
  level._id_1646[level._id_1646.size] = self;

  if (isdefined(self._id_1087B) && var_0) {
  foreach (var_2 in self._id_1087B)
  var_2 _id_B287();
  }

  if (isdefined(self._id_8457)) {
  foreach (var_2 in self._id_8457)
  var_2 _id_B26D();
  }

  if (isdefined(self._id_8271)) {
  foreach (var_2 in self._id_8271)
  var_2 _id_B26D();
  }
  }

  var_8 = scripts\engine\utility::_id_8180("secure_window", "script_noteworthy");

  foreach (var_10 in var_8) {
  if (ispointinvolume(var_10.origin, self)) {
  var_11 = scripts\engine\utility::_id_7E2E(var_10.origin, level._id_13D59);
  var_11._id_6261 = 1;
  }
  }

  level._id_163E = scripts\engine\utility::_id_227F(level._id_163E, self._id_D25E);
  level notify("volume_activated", self._id_28AB);
}

_id_B292() {
  self._id_0019 = 0;

  if (_id_9C13(level._id_1646, self)) {
  level._id_1646 = scripts\engine\utility::array_remove(level._id_1646, self);

  if (isdefined(self._id_1087B)) {
  foreach (var_1 in self._id_1087B)
  var_1 _id_B288();
  }

  if (isdefined(self._id_8457)) {
  foreach (var_1 in self._id_8457)
  var_1 _id_B26E();
  }

  if (isdefined(self._id_D25E)) {
  foreach (var_1 in self._id_D25E)
  level._id_163E = scripts\engine\utility::array_remove(level._id_163E, var_1);
  }
  }
}

_id_B287() {
  if (!_id_9C13(level._id_1647, self))
  level._id_1647[level._id_1647.size] = self;

  self._id_0019 = 1;
  self._id_93A8 = 0;
}

_id_B288() {
  if (_id_9C13(level._id_1647, self))
  level._id_1647 = scripts\engine\utility::array_remove(level._id_1647, self);

  self._id_0019 = 0;
}

_id_D1F7() {
  self endon("disconnect");
  self endon("death");
  level endon("game_ended");
  var_0 = 35;
  var_1 = var_0 * var_0;
  var_2 = 1000;

  while (!isdefined(level._id_1084F))
  wait 0.1;

  for (;;) {
  if (_id_0A77::_id_9E3A()) {
  scripts\engine\utility::waitframe();
  continue;
  }

  if (level._id_1084F.size > 0) {
  var_3 = sortbydistance(level._id_1084F, self.origin);

  for (var_4 = 0; var_4 < var_3.size; var_4++) {
  var_5 = var_3[var_4];

  if (!agent_type_does_auto_melee(var_5))
  continue;

  if (!var_5 _id_3828())
  continue;

  if (isdefined(var_5.attackent))
  continue;

  if (!isdefined(var_5._id_A88B))
  var_5._id_A88B = gettime();

  if (distance2dsquared(var_5.origin, self.origin) < var_1) {
  var_6 = gettime();

  if (var_5._id_A88B + 1000 < var_6) {
  if (isdefined(var_5._id_A9B8)) {
  if (var_5._id_A9B8 + 1000 < var_6) {
  if (!_id_CFB2(var_5))
    continue;

  _id_576B(var_5);
  break;
  }
  }
  else if (!isdefined(var_5._id_8C14) || var_5._id_8C14) {
  if (!scripts\engine\utility::_id_9CEE(var_5._id_2BE7)) {
  if (!_id_CFB2(var_5))
    continue;

  _id_576B(var_5);
  }

  break;
  }
  }
  }
  else
  break;
  }
  }

  scripts\engine\utility::waitframe();
  }
}

agent_type_does_auto_melee(var_0) {
  if (isdefined(level.auto_melee_agent_type_check))
  return [[level.auto_melee_agent_type_check]](var_0);

  if (!isdefined(var_0.agent_type))
  return 0;

  if (var_0.agent_type == "zombie_brute" || var_0.agent_type == "zombie_clown")
  return 0;

  return 1;
}

_id_576B(var_0) {
  var_0 scripts\asm\asm_bb::_id_2965(self);
  var_0._id_A88B = gettime();
  self _meth_80B0(45, var_0.origin, var_0, var_0, "MOD_IMPACT", "none");
}

_id_3828() {
  if (scripts\engine\utility::_id_9CEE(self._id_9E0C))
  return 0;

  if (_id_0F72::_id_5F70())
  return 0;

  if (scripts\engine\utility::_id_9CEE(self._id_9CEC))
  return 0;

  if (scripts\engine\utility::_id_9CEE(self._id_9CEF))
  return 0;

  if (scripts\engine\utility::_id_9CEE(self._id_11196))
  return 0;

  if (scripts\engine\utility::_id_9CEE(self._id_9BB0))
  return 0;

  if (scripts\engine\utility::_id_9CEE(self._id_B36E))
  return 0;

  if (scripts\engine\utility::_id_9CEE(self._id_9BC9))
  return 0;

  if (isdefined(self.killing_time))
  return 0;

  return 1;
}

_id_64E7(var_0) {
  level endon("game_ended");
  _id_12E2A();

  if (var_0 != "zombie_brute" && !_id_0A77::_id_9BD8())
  thread _id_A5B4();

  thread _id_135A3();
}

_id_42EC(var_0) {
  level endon("game_ended");
  level._id_1084F[level._id_1084F.size] = self;
  self._id_54CB = 1;
  self._id_0033 = 0;
}

_id_3114() {
  level endon("game_ended");

  if (!isdefined(level._id_3120))
  level._id_3120 = [];

  level._id_3120 = scripts\engine\utility::_id_1756(level._id_3120, self);
  self._id_0033 = 0;
  self._id_9CA2 = 1;
  _id_93EB(1);
  level._id_1084F[level._id_1084F.size] = self;
  thread _id_135A3();
  self waittill("death");
  level._id_3120 = scripts\engine\utility::array_remove(level._id_3120, self);
  _id_4FB8(1);
}

_id_12E2A() {
  var_0 = 1;
  level._id_1084F[level._id_1084F.size] = self;
  level._id_4B95 = level._id_4B95 + var_0;
}

_id_12E29(var_0, var_1) {
  var_2 = 1;

  if (isdefined(self._id_24CA)) {
  var_3 = self._id_24CA;
  _id_0D4D::_id_DF34(self._id_24CA);
  self._id_24CA = undefined;
  }

  level._id_1084F = scripts\engine\utility::array_remove(level._id_1084F, self);

  if (scripts\engine\utility::_id_9CEE(self._id_9CA2))
  return;

  level._id_4B95 = level._id_4B95 - var_2;

  if (scripts\engine\utility::_id_6E25("pause_wave_progression"))
  return;
  else if (!self._id_54CB)
  level._id_4B6E = level._id_4B6E + var_2;
  else
  {
  add_to_respawn_list();
  level._id_E299++;
  }
}

add_to_respawn_list() {
  var_0 = spawnstruct();
  var_0.health = self.died_poorly_health;
  var_0.type = self.agent_type;
  var_0._id_92B8 = gettime();
  level.respawn_enemy_list[level.respawn_enemy_list.size] = var_0;
  self.died_poorly_health = undefined;
}

_id_A5B4() {
  self endon("death");

  if (isdefined(self._id_594C))
  return;

  var_0 = 625;
  var_1 = 100;
  var_2 = 0;
  var_3 = self.origin;
  var_4 = self.angles;
  self.traversal_start_time = undefined;
  wait 1;

  if (isdefined(self._id_02AE) && isdefined(self._id_02AE._id_ECF5)) {
  while (!scripts\engine\utility::_id_9CEE(self._id_8C14))
  wait 0.1;
  }

  while (!isdefined(self._id_2303._id_4B12))
  wait 0.1;

  for (;;) {
  if (isdefined(self._id_9CEC)) {
  var_5 = gettime();

  if (!isdefined(self.traversal_start_time)) {
  self.traversal_start_time = var_5;
  wait 1;
  continue;
  }
  else if (var_5 - self.traversal_start_time < 10000) {
  wait 1;
  continue;
  }
  else
  var_2 = 6;
  }
  else
  self.traversal_start_time = undefined;

  if (isdefined(self._id_9393)) {
  wait 1;
  continue;
  }

  if (self._id_9BB0 || self._id_152C || scripts\engine\utility::_id_9CEE(self._id_11196) || scripts\engine\utility::_id_9CEE(self._id_4F42)) {
  wait 1;
  continue;
  }

  var_6 = var_0;

  if (self._id_2303._id_4B12 == "slow_walk")
  var_6 = var_1;

  if (distancesquared(self.origin, var_3) < var_6) {
  if (isdefined(self._id_9CDD))
  var_2++;
  else if (isdefined(self._id_4B26)) {
  var_7 = anglesdelta(var_4, self.angles);
  var_8 = distancesquared(self.origin, self._id_4B26.origin);

  if (var_8 > 10000 && var_7 < 45)
  var_2++;
  else
  var_2 = 0;
  }
  else if (isdefined(self._id_6658)) {
  if (!_id_0D4D::_id_664D(self._id_6658))
  var_2++;
  else
  var_2 = 0;
  }
  else
  var_2 = 0;

  if (var_2 == 4)
  self setorigin(self.origin + (0, 0, 10), 0);

  if (var_2 > 5)
  break;
  }

  var_4 = self.angles;
  var_3 = self.origin;
  wait 1;
  }

  self._id_54CB = 1;

  if (scripts\engine\utility::_id_9CEE(self._id_B36D) && isdefined(level._id_C20A))
  level._id_C20A--;

  self _meth_80B0(self.health + 960, self.origin, self, self, "MOD_SUICIDE");
}

_id_7C2F() {
  var_0 = undefined;
  var_0 = _id_7C8C();
  return var_0;
}

_id_9C12() {
  if (isdefined(level._id_9B0B)) {
  foreach (var_1 in level._id_9B0B) {
  if (ispointinvolume(self.origin, var_1))
  return 0;
  }
  }

  if (isdefined(level._id_10816)) {
  foreach (var_1 in level._id_10816) {
  if (ispointinvolume(self.origin, var_1))
  return 1;
  }
  }

  return 0;
}

_id_E81B() {
  level endon("game_ended");
  var_0 = 5;
  level._id_6870 = 0;
  var_1 = 21;
  level thread _id_4094();
  var_2 = 1;

  for (;;) {
  _id_13BCB();
  _id_0A63::_id_12DDE(level._id_13BD3);

  if (level._id_13BD3 > 0) {
  if (level._id_13BD3 / 10 == var_2) {
  level notify("prize_restock");

  if (_id_0A77::map_check(0))
  level thread _id_0A6A::_id_12885("dj_nag_ticket_restock", "zmb_dj_vo", "highest", 20, 0, 0, 1, 100);

  var_2++;
  }

  if (getdvar("ui_gametype") == "zombie" && (_id_0A77::_id_9F02() || level._id_C552)) {
  if (isdefined(level.players[0])) {
  if (level._id_13BD3 == 2)
  level.players[0] thread _id_0A57::wait_and_play_tutorial_message("zombiehealth", 7);
  else if (level._id_13BD3 == 3)
  level.players[0] thread _id_0A57::wait_and_play_tutorial_message("scenes", 7);
  else if (level._id_13BD3 == 4 && !level.players[0] _id_0A57::_id_79FC("magic_wheel")) {
  level.players[0] thread _id_0A57::wait_and_play_tutorial_message("magic_wheel", 7);
  level.players[0] notify("saw_wheel_tutorial");
  }
  else if (level._id_13BD3 == 9 && !level.players[0] _id_0A57::_id_79FC("pap"))
  level.players[0] thread _id_0A57::wait_and_play_tutorial_message("pap", 7);
  }
  }

  if (getdvar("ui_gametype") == "zombie") {
  foreach (var_4 in level.players) {
  var_4 setclientomnvar("zombie_wave_number", level._id_13BD3);
  var_4 _id_0A5E::_id_D9AD("mt_highest_round");
  }
  }
  }

  if (_id_FF9D(level._id_13BD3)) {
  level notify("event_wave_starting");
  _id_E7F0(level._id_13BD3);
  } else {
  level notify("regular_wave_starting");

  if (level._id_D745 == 1 && level._id_13BD3 > 5)
  level thread _id_0A6A::_id_12885("dj_interup_wave_start", "zmb_dj_vo", "high", 4, 0, 0, 1, 40);

  if (soundexists("mus_zombies_newwave") && level._id_13BD3 > 0)
  level thread _id_BDD4();

  _id_1081A(level._id_13BD3);

  if (soundexists("mus_zombies_endwave") && level._id_13BD3 > 0)
  level thread _id_BDD1();
  }

  if (level._id_13BD3 > 0)
  level notify("spawn_wave_done");

  var_6 = int(1000);

  if (level._id_13BD3 < 21)
  var_6 = int(level._id_13BD3 * 50);

  foreach (var_4 in level.players) {
  var_4 _id_0A63::_id_831D(var_6, 1);
  var_4 _id_0A5E::_id_D9AD("mt_total_rounds");

  if (level._id_13BD3 > 0)
  var_4 notify("next_wave_notify");

  var_4.coaster_ridden_this_round = undefined;
  var_4._id_2113 = 0;
  }

  if (level._id_D745 == 1 && level._id_13BD3 > 5)
  level thread _id_0A6A::_id_12885("dj_interup_wave_end", "zmb_dj_vo", "high", 4, 0, 0, 1, 40);

  wait(var_0);
  level thread scripts\cp\gametypes\zombie::_id_E196();

  if (isdefined(level.wave_complete_dialogues_func))
  [[level.wave_complete_dialogues_func]](level._id_13BD3);

  var_9 = (gettime() - level._id_13BDA) / 1000;
  _id_0D45::_id_AF90(level._id_13BD3, var_9, level._id_AA0B, level._id_11929);

  if (level._id_13BD3 > 1)
  _id_13BDB();

  level._id_13BD3 = _id_7B1C();
  _id_0A63::update_players_career_highest_wave(level._id_13BD3, level.script);
  var_0 = _id_7D00(var_0, level._id_13BD3);
  }
}

clown_wave_music() {
  wait 0.5;
  level thread _id_0A6A::_id_12885("ww_clownwave_wavestart", "zmb_announcer_vo", "highest", 70, 0, 0, 1);
  wait 3;

  if (soundexists("mus_zombies_eventwave_start"))
  level thread _id_BDD3();

  level.wait_for_music_clown_wave = 1;
}

_id_13BC6(var_0) {
  if (!isdefined(level._id_4481))
  level._id_4481 = [];

  if (var_0 >= 17 && !isdefined(level._id_4481["flavour_1"])) {
  if (randomint(100) > 60)
  level thread _id_0A6A::_id_12885("flavour_1", "zmb_dialogue_vo", "highest", 666, 0, 0, 0, 100);
  }

  if (var_0 >= 3 && var_0 <= 5 && !isdefined(level._id_4481["round_end_3thru5_1"])) {
  if (randomint(100) > 50) {
  level thread _id_0A6A::_id_12885("round_end_3thru5_1", "zmb_dialogue_vo", "highest", 666, 0, 0, 0, 100);
  level._id_4481["round_end_3thru5_1"] = 1;
  }
  }
  else if (var_0 >= 6 && var_0 <= 8 && !isdefined(level._id_4481["round_end_6thru8_1"])) {
  if (randomint(100) > 50) {
  level thread _id_0A6A::_id_12885("round_end_6thru8_1", "zmb_dialogue_vo", "highest", 666, 0, 0, 0, 100);
  level._id_4481["round_end_6thru8_1"] = 1;
  }
  }
  else if (var_0 >= 9 && var_0 <= 12 && !isdefined(level._id_4481["round_end_9thru12_1"])) {
  if (randomint(100) > 50) {
  level thread _id_0A6A::_id_12885("round_end_9thru12_1", "zmb_dialogue_vo", "highest", 666, 0, 0, 0, 100);
  level._id_4481["round_end_9thru12_1"] = 1;
  }
  }
  else if (var_0 >= 13 && var_0 <= 16 && !isdefined(level._id_4481["round_end_13thru16_1"])) {
  if (randomint(100) > 50) {
  level thread _id_0A6A::_id_12885("round_end_13thru16_1", "zmb_dialogue_vo", "highest", 666, 0, 0, 0, 100);
  level._id_4481["round_end_13thru16_1"] = 1;
  }
  }
}

_id_13BDB() {
  foreach (var_1 in level.players) {
  if (!isdefined(var_1.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1])) {
  if (scripts\engine\utility::_id_9CEE(var_1._id_9387)) {
  var_1.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["bowling_for_planets"] = 0;
  var_1.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["bowling_for_planets_afterlife"] = 0;
  var_1.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["coaster"] = 0;
  var_1.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["laughingclown"] = 0;
  var_1.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["laughingclown_afterlife"] = 0;
  var_1.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["basketball_game"] = 0;
  var_1.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["basketball_game_afterlife"] = 0;
  var_1.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["clown_tooth_game"] = 0;
  var_1.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["clown_tooth_game_afterlife"] = 0;
  var_1.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["game_race"] = 0;
  var_1.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["shooting_gallery"] = 0;
  var_1.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["shooting_gallery_afterlife"] = 0;
  }

  var_1.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["bowling_for_planets"] = 0;
  var_1.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["bowling_for_planets_afterlife"] = 0;
  var_1.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["coaster"] = 0;
  var_1.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["laughingclown"] = 0;
  var_1.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["laughingclown_afterlife"] = 0;
  var_1.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["basketball_game"] = 0;
  var_1.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["basketball_game_afterlife"] = 0;
  var_1.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["clown_tooth_game"] = 0;
  var_1.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["clown_tooth_game_afterlife"] = 0;
  var_1.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["game_race"] = 0;
  var_1.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["shooting_gallery"] = 0;
  var_1.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["shooting_gallery_afterlife"] = 0;
  }

  var_2 = var_1 getcurrentweapon();
  var_3 = getweaponbasename(var_2);

  if (var_1._id_6977 == 1 || !isdefined(var_1._id_13BE3[var_3]))
  continue;

  var_1._id_13BE3[var_3]++;
  }
}

_id_13BCB() {
  level notify("wave_starting");

  if (scripts\engine\utility::_id_6E34("dj_interup_wave_start_init"))
  scripts\engine\utility::_id_6E3E("dj_interup_wave_start_init");

  foreach (var_1 in level.players)
  var_1._id_732F = 0;

  _id_E21C();
  level._id_13BDA = gettime();
}

_id_E21C() {
  var_0 = 50;
  level._id_B41F = var_0 * level._id_13BD3;

  if (level._id_B41F > 500)
  level._id_B41F = 500;

  foreach (var_2 in level.players)
  var_2._id_DDAF = 0;
}

_id_1081A(var_0) {
  level._id_10E3C = _id_7CA9(var_0);
  level._id_B467 = _id_7ACD(var_0);
  level._id_5274 = _id_7D10(var_0);
  level._id_4B6E = 0;
  level._id_11046 = 0;
  _id_10927();
  level._id_B467 = 0;
  level._id_B432 = 0;
  level._id_11046 = 1;
}

_id_4F0E() {
  iprintln("starting wave " + level._id_13BD3);
  iprintln("total spawns: " + level._id_5274);
}

_id_FF9D(var_0) {
  if (isdefined(level.should_run_event_func))
  return [[level.should_run_event_func]](var_0);

  if (_id_0A77::_id_9BD8())
  return 0;

  if (getdvar("ui_mapname") == "cp_disco")
  return 0;

  if (var_0 < 5)
  return 0;
  else if (scripts\engine\utility::_id_6E34("defense_sequence_active") && scripts\engine\utility::_id_6E25("defense_sequence_active"))
  return 0;
  else if (scripts\engine\utility::_id_6E34("all_center_positions_used") && scripts\engine\utility::_id_6E25("all_center_positions_used"))
  return 0;
  else
  {
  var_1 = var_0 - level._id_A8BC;

  if (var_1 < 5)
  return 0;
  else
  {
  var_1 = var_1 - 4;
  var_2 = var_1 / 3 * 100;

  if (randomint(100) < var_2)
  return 1;
  }
  }

  return 0;
}

_id_E7F0(var_0) {
  level.respawn_enemy_list = [];
  level.respawn_data = undefined;
  var_1 = _id_7848(var_0);

  if (isdefined(level.event_funcs_start))
  [[level.event_funcs_start]](var_1);
  else
  {
  level thread clown_wave_music();
  _id_F604("cp_zmb_alien", 1.0);
  level._id_13445 = "cp_zmb_alien";
  }

  level._id_106E2 = 1;
  var_2 = 0;

  if (isdefined(var_1)) {
  if (isdefined(level._id_6840[var_1]))
  [[level._id_6840[var_1]]]();
  else
  var_2 = 1;
  }
  else
  var_2 = 1;

  if (var_2)
  return;

  level._id_106E2 = 0;
  level._id_1096B++;
  level._id_A8BC = var_0;

  if (isdefined(level.event_funcs_end))
  [[level.event_funcs_end]](var_1);
  else
  {
  level._id_13445 = undefined;
  _id_F604("", 0);

  if (soundexists("mus_zombies_eventwave_end"))
  level thread _id_BDD2();

  level.wait_for_music_clown_wave = 0;
  }

  level.respawn_enemy_list = [];
  level.respawn_data = undefined;
}

_id_F604(var_0, var_1) {
  foreach (var_3 in level.players) {
  if (!scripts\engine\utility::_id_9CEE(var_3._id_13CE5))
  var_3 visionsetnakedforplayer(var_0, var_1);
  }
}

_id_7848(var_0) {
  if (isdefined(level.available_event_func))
  return [[level.available_event_func]](var_0);

  return "goon";
}

_id_7B1C() {
  return level._id_13BD3 + 1;
}

_id_7D00(var_0, var_1) {
  if (_id_0A77::_id_9BD8())
  return 1;

  return 10;
}

_id_7CA9(var_0) {
  var_1 = ["generic_zombie"];
  return var_1;
}

_id_7ACD(var_0) {
  if (_id_0A77::_id_9BD8() && var_0 < 5) {
  var_1 = level.players.size * 6;
  var_2 = [0, 0.25, 0.3, 0.5, 0.7, 0.9];
  var_3 = 1;
  var_4 = 1;
  var_3 = var_2[var_0];
  var_5 = level.players.size - 1;

  if (var_5 < 1)
  var_5 = 0.5;

  var_6 = (24 + var_5 * 6 * var_4) * var_3;
  return int(min(var_1, var_6));
  }

  return 24;
}

_id_7D10(var_0) {
  if (_id_0A77::_id_9BD8())
  return 9000;

  var_1 = [0, 0.25, 0.3, 0.5, 0.7, 0.9];
  var_2 = 1;
  var_3 = 1;

  if (var_0 < 6)
  var_2 = var_1[var_0];
  else if (var_0 < 10)
  var_3 = var_0 / 5;
  else
  var_3 = squared(var_0) * 0.03;

  var_4 = level.players.size - 1;

  if (var_4 < 1)
  var_4 = 0.5;

  var_5 = (24 + var_4 * 6 * var_3) * var_2;
  return int(var_5);
}

_id_7CFF(var_0) {
  return 1;
}

_id_79B4(var_0) {
  return 0;
}

_id_7A3D(var_0, var_1) {
  if (isdefined(level._id_10698)) {
  var_0 = var_0 + 0;
  var_2 = tablelookupbyrow(level._id_10698, var_0, var_1);
  var_3 = strtok(var_2, " ");

  if (var_3.size > 0)
  return var_3;
  }

  return undefined;
}

_id_13691() {
  while (level._id_4B6E < level._id_5274)
  wait 1.0;

  level._id_B467 = 0;
  level._id_B432 = 0;
  level._id_11046 = 1;
}

_id_9C13(var_0, var_1) {
  if (!isdefined(var_0) || !isdefined(var_1) || var_0.size == 0)
  return 0;

  for (var_2 = 0; var_2 < var_0.size; var_2++) {
  if (var_0[var_2] == var_1)
  return 1;
  }

  return 0;
}

_id_13FA2() {
  foreach (var_1 in level._id_10816) {
  if (self istouching(var_1))
  return 1;
  }

  return 0;
}

_id_310F() {
  level endon("game_ended");
  self endon("death");
  thread _id_0D62::_id_CE9B(self._id_13550);
  self._id_D4AA = 0;

  for (;;) {
  var_0 = scripts\engine\utility::_id_13736(6, "attack_hit", "attack_miss");

  switch (var_0) {
  case "attack_hit":
  level thread _id_0D62::_id_CE9C(self, "attack_swipe", 0);
  break;
  case "attack_miss":
  level thread _id_0D62::_id_CE9C(self, "attack_swipe", 0);
  break;
  case "timeout":
  level thread _id_0D62::_id_CE9C(self, "run_grunt", 0);
  break;
  }
  }
}

_id_135A3() {
  self endon("death");

  for (;;) {
  if ([[level._id_164B]](self.origin)) {
  self._id_6622 = 1;

  if (isdefined(self._id_24CA)) {
  if (isdefined(self._id_24CA._id_C2D0) && self._id_24CA._id_C2D0 == self)
  _id_0D4D::_id_DF34(self._id_24CA);
  }

  return;
  }

  wait 0.35;
  }
}

_id_4094() {
  if (isdefined(level.ai_cleanup_func)) {
  level thread [[level.ai_cleanup_func]]();
  return;
  }

  var_0 = 0;
  level._id_BE23 = 0;

  for (;;) {
  scripts\engine\utility::waitframe();
  var_1 = gettime();

  if (var_1 < var_0)
  continue;

  if (isdefined(level._id_BE22)) {
  var_2 = gettime() / 1000;
  var_3 = var_2 - level._id_BE22;

  if (var_3 < 0)
  continue;

  level._id_BE22 = undefined;
  }

  var_4 = (var_1 - level._id_13BDA) / 1000;

  if (level._id_13BD3 <= 5 && var_4 < 30)
  continue;
  else if (level._id_13BD3 > 5 && var_4 < 20)
  continue;

  var_5 = undefined;

  if (level._id_5274 - level._id_4B6E < 3)
  var_5 = 2250000;

  var_0 = var_0 + 3000;
  var_6 = _id_0A4A::_id_7DB0("axis");

  foreach (var_8 in var_6) {
  if (level._id_BE23 >= 1) {
  level._id_BE23 = 0;
  scripts\engine\utility::waitframe();
  }

  if (_id_380D(var_8))
  var_8 _id_5773(var_5);
  }
  }
}

_id_380D(var_0) {
  if (isdefined(var_0.agent_type) && var_0.agent_type == "zombie_ghost")
  return 0;

  if (isdefined(var_0._id_2BF9))
  return 0;

  if (scripts\engine\utility::_id_9CEE(var_0._id_9CEF))
  return 0;

  if (scripts\engine\utility::_id_9CEE(var_0.dont_cleanup))
  return 0;

  if (isdefined(var_0.delay_cleanup_until) && gettime() < var_0.delay_cleanup_until)
  return 0;

  if (scripts\engine\utility::_id_9CEE(level.zbg_active))
  return 0;

  return 1;
}

_id_5773(var_0) {
  if (!isalive(self))
  return;

  if (!_id_FF1A(self))
  return;

  var_1 = gettime() - self._id_107F7;

  if (var_1 < 5000)
  return;

  if (self.agent_type == "generic_zombie" || self.agent_type == "zombie_cop" || self.agent_type == "lumberjack") {
  if (var_1 < 45000 && !self._id_6622)
  return;
  }

  var_2 = 1;
  var_3 = 0;
  var_4 = 1;

  if (scripts\engine\utility::_id_9CEE(self._id_565C) && level._id_5274 - level._id_4B6E < 2) {
  var_3 = 1;
  var_0 = 1000000;
  var_2 = 0;
  }
  else if (level._id_B789.size == 0) {
  if (isdefined(level._id_12F9D))
  var_2 = _id_8016(1, 0);
  else
  var_2 = _id_8016(0, 0);
  } else {
  var_2 = _id_8016(1, 0);

  if (var_2)
  var_4 = _id_8016(0, 1);
  }

  level._id_BE23++;

  if (!var_2 || !var_4) {
  var_5 = 10000000;
  var_6 = level.players[0];

  foreach (var_8 in level.players) {
  var_9 = distancesquared(self.origin, var_8.origin);

  if (var_9 < var_5) {
  var_5 = var_9;
  var_6 = var_8;
  }
  }

  if (isdefined(var_0))
  var_11 = var_0;
  else if (isdefined(var_6) && _id_CF4C(var_6))
  var_11 = 189225;
  else
  var_11 = 1000000;

  if (var_5 >= var_11) {
  if (!var_4) {
  if (level.last_mini_zone_fail + 1000 > gettime())
  return;
  else
  level.last_mini_zone_fail = gettime();
  }

  thread _id_51A5(var_5, var_3);
  }
  }
}

_id_FF1A(var_0) {
  if (!isdefined(var_0.agent_type))
  return 0;

  switch (var_0.agent_type) {
  case "zombie_grey":
  case "zombie_brute":
  return 0;
  default:
  return 1;
  }
}

_id_51A5(var_0, var_1) {
  if (scripts\engine\utility::_id_9CEE(self._id_93A7))
  return;

  if (var_1) {
  if (scripts\engine\utility::_id_9CEE(self._id_9D25))
  _id_EDF6();
  else
  {}
  } else {
  foreach (var_3 in level.players) {
  if (scripts\engine\utility::_id_9CEE(var_3._id_1097A))
  continue;

  if (scripts\engine\utility::_id_9CEE(var_3._id_9BE1))
  continue;

  if (scripts\engine\utility::_id_9CEE(var_3._id_9387))
  continue;

  if (_id_CFB2(var_3)) {
  if (var_0 < 4000000)
  return;
  }
  }

  self._id_54CB = 1;

  if (scripts\engine\utility::_id_9CEE(self._id_B36D) && isdefined(level._id_C20A))
  level._id_C20A--;

  if (scripts\engine\utility::_id_9CEE(self._id_9D25)) {
  self._id_C026 = 1;
  _id_EDF6();
  }
  }
}

_id_EDF6() {
  self _meth_80B0(self.health + 950, self.origin, self, self, "MOD_SUICIDE");
}

_id_CFB2(var_0) {
  var_1 = var_0 getplayerangles();
  var_2 = anglestoforward(var_1);
  var_3 = self.origin - var_0 _meth_814F();
  var_3 = vectornormalize(var_3);
  var_4 = vectordot(var_2, var_3);

  if (var_4 < 0.766)
  return 0;

  return 1;
}

_id_CF4C(var_0) {
  var_1 = var_0 getplayerangles();
  var_2 = anglestoforward(var_1);
  var_3 = var_0 _meth_814F() - self.origin;
  var_4 = vectordot(var_2, var_3);

  if (var_4 < 0)
  return 0;

  return 1;
}

_id_8016(var_0, var_1) {
  var_2 = undefined;

  foreach (var_4 in level._id_1646) {
  if (self istouching(var_4)) {
  var_2 = var_4;
  break;
  }
  }

  if (!isdefined(var_2))
  return 0;

  var_6 = 0;

  if (scripts\engine\utility::_id_9CEE(var_1))
  var_6 = var_6 + _id_C1EB(var_2, 1);
  else
  var_6 = _id_0D60::_id_800B(var_2);

  if (scripts\engine\utility::_id_9CEE(var_0) && var_6 == 0 && isdefined(var_2._id_186E)) {
  foreach (var_4 in var_2._id_186E)
  var_6 = var_6 + _id_0D60::_id_800B(var_4);
  }

  return var_6;
}

_id_F5EC() {
  scripts\engine\utility::_id_6E4C("init_adjacent_volumes_done");
  level._id_B789 = [];
  var_0 = getentarray("mini_zone", "script_noteworthy");

  foreach (var_2 in var_0)
  level._id_B789[var_2._id_0336] = var_2;

  if (level._id_B789.size == 0)
  return;

  var_4 = 1;

  foreach (var_6 in level._id_10816) {
  var_4 = 1;
  var_7 = var_6._id_28AB + "_" + var_4 + "_despawn_volume";

  if (var_7 == "mars3_1_despawn_volume")
  var_4 = 1;

  while (isdefined(level._id_B789[var_7])) {
  var_8 = var_6._id_28AB + "_" + (var_4 - 1) + "_despawn_volume";
  var_9 = var_6._id_28AB + "_" + (var_4 + 1) + "_despawn_volume";

  if (isdefined(level._id_B789[var_8]))
  level._id_B789[var_7]._id_186E[var_8] = level._id_B789[var_8];

  if (isdefined(level._id_B789[var_9]))
  level._id_B789[var_7]._id_186E[var_9] = level._id_B789[var_9];

  if (isdefined(level._id_B789[var_7]._id_0334)) {
  var_10 = level._id_B789[var_7]._id_0334;
  level._id_B789[var_7]._id_186E[var_10] = level._id_B789[var_10];
  level._id_B789[var_10]._id_186E[var_7] = level._id_B789[var_7];
  }

  var_4++;
  var_7 = var_6._id_28AB + "_" + var_4 + "_despawn_volume";
  }
  }
}

_id_C1EB(var_0, var_1) {
  var_2 = 1;
  var_3 = undefined;
  var_4 = 1;
  var_5 = 0;

  while (var_2) {
  var_6 = getentarray(var_0._id_28AB + "_" + var_4 + "_despawn_volume", "targetname");

  if (isdefined(var_6[0])) {
  if (self istouching(var_6[0])) {
  var_3 = var_6[0];
  break;
  }

  var_4++;
  continue;
  }

  var_2 = 0;
  }

  if (isdefined(var_3)) {
  var_5 = _id_0D60::_id_800B(var_3);

  if (scripts\engine\utility::_id_9CEE(var_1) && var_5 == 0 && isdefined(var_3._id_186E)) {
  foreach (var_8 in var_3._id_186E)
  var_5 = var_5 + _id_0D60::_id_800B(var_8);
  }
  }

  return var_5;
}

create_spawner(var_0, var_1, var_2, var_3, var_4, var_5) {
  var_6 = level._id_10816[var_0];
  var_7 = spawnstruct();
  var_7.origin = var_1;

  if (isdefined(var_2))
  var_7.angles = var_2;
  else
  var_7.angles = (0, 0, 0);

  if (isdefined(var_5))
  var_7._id_EDBB = var_5;

  var_7.script_noteworthy = "static";

  if (isdefined(var_4))
  var_7._id_ECF5 = var_4;

  if (isdefined(var_3))
  var_7._id_EE79 = var_3;

  var_7._id_0336 = var_6._id_0334;
  var_7 _id_10865(var_6);
  var_6._id_1087B = scripts\engine\utility::_id_2279(var_6._id_1087B, var_7);
  return var_7;
}

_id_7D87() {
  level._id_13F33 = scripts\engine\utility::_id_8180("zombie_idle_spot", "targetname");
  level thread _id_962E();
}

_id_FF55(var_0) {
  if (getdvarint("scr_active_volume_check") == 1) {
  if (isplayer(var_0) && !_id_0A76::_id_9C0E(var_0.origin))
  return 1;
  }

  if (isdefined(var_0._id_AD2C))
  return 1;

  if (isdefined(var_0._id_9C54))
  return 1;

  var_1 = isdefined(self._id_010C) && isdefined(self._id_010C._id_9BE1);

  if (!var_1 && distancesquared(var_0.origin, getclosestpointonnavmesh(var_0.origin)) > 10000)
  return 1;

  if (self.agent_type == "zombie_brute" && isdefined(var_0.special_case_ignore))
  return 1;

  return 0;
}

_id_962E() {
  if (!isdefined(level._id_13F33) || level._id_13F33.size == 0)
  return;

  level._id_71A7 = ::_id_7A2C;

  if (isdefined(level.idle_spot_patch_func))
  [[level.idle_spot_patch_func]]();

  var_0 = [];

  foreach (var_2 in level._id_13F33) {
  var_3 = var_2 _id_962D();

  if (isdefined(var_3))
  var_0[var_0.size] = var_3;
  }

  level._id_13F33 = scripts\engine\utility::_id_22AC(level._id_13F33, var_0);
}

_id_962D() {
  foreach (var_1 in level._id_10816) {
  if (ispointinvolume(self.origin, var_1)) {
  self._id_13538 = var_1;
  return;
  }
  }

  return self;
}

debug_idle_spots(var_0, var_1) {
  wait 15;

  foreach (var_3 in var_0)
  thread _id_0A77::_id_5B85(var_3.origin, 5, 1800, var_1);
}

add_idle_spot(var_0) {
  var_1 = spawnstruct();
  var_1.origin = var_0;
  var_1._id_0336 = "zombie_idle_spot";
  level._id_13F33 = scripts\engine\utility::_id_1756(level._id_13F33, var_1);
}

move_idle_spot(var_0, var_1) {
  var_2 = scripts\engine\utility::_id_7E2E(var_0, level._id_13F33, 500);
  var_2.origin = var_1;
}

_id_4957() {
  var_0 = 80;
  var_1 = [];
  var_1[0] = getclosestpointonnavmesh(self.origin + (var_0, 0, 0));
  var_1[1] = getclosestpointonnavmesh(self.origin + (var_0, var_0, 0));
  var_1[2] = getclosestpointonnavmesh(self.origin + (0, var_0, 0));
  var_1[3] = getclosestpointonnavmesh(self.origin + (-1 * var_0, var_0, 0));
  var_1[4] = getclosestpointonnavmesh(self.origin + (-1 * var_0, 0, 0));
  var_1[5] = getclosestpointonnavmesh(self.origin + (-1 * var_0, -1 * var_0, 0));
  var_1[6] = getclosestpointonnavmesh(self.origin + (0, -1 * var_0, 0));
  var_1[7] = getclosestpointonnavmesh(self.origin + (var_0, -1 * var_0, 0));
  var_2 = [];

  for (var_3 = 0; var_3 < var_1.size; var_3++)
  var_2[var_3] = 0;

  var_4 = spawnstruct();
  var_4._id_C6FB = var_1;
  var_4._id_1621 = var_2;
  self._id_E540 = var_4;
}

_id_7C19(var_0) {
  foreach (var_3, var_2 in var_0._id_E540._id_C6FB) {
  if (var_0._id_E540._id_1621[var_3])
  continue;

  var_0._id_E540._id_1621[var_3] = 1;
  thread _id_DF41();
  return var_3;
  }

  return undefined;
}

_id_7A2C() {
  if (!isdefined(level._id_13F33))
  return undefined;

  return _id_7C18(level._id_13F33);
}

_id_7C18(var_0) {
  var_0 = scripts\engine\utility::_id_22A7(var_0);

  if (var_0.size == 1) {
  var_1 = var_0[0];
  self._id_92E8 = var_1;
  return var_1.origin;
  }

  foreach (var_1 in var_0) {
  if (ispointinvolume(self.origin, var_1._id_13538)) {
  if (isdefined(self._id_92E8) && var_1 == self._id_92E8)
  continue;

  self._id_92E8 = var_1;
  return var_1.origin;
  }
  }

  if (!isdefined(self._id_02AE))
  return undefined;

  foreach (var_1 in var_0) {
  if (isdefined(self._id_02AE._id_13538) && self._id_02AE._id_13538 == var_1._id_13538) {
  if (isdefined(self._id_92E8) && var_1 == self._id_92E8)
  continue;

  self._id_92E8 = var_1;
  return var_1.origin;
  }
  }

  return undefined;
}

_id_DDC7(var_0, var_1) {
  self endon("reset_recently_used");
  wait(var_0);
  self._id_DDC4 = 1;
  wait(var_1);
  self._id_DDC4 = undefined;
  self notify("reset_recently_used");
}

_id_DF41() {
  scripts\engine\utility::waittill_any("StopFindTargetNoGoal", "death");
  self._id_92E8._id_E540._id_1621[self._id_92E9] = 0;
  self._id_92E8 = undefined;
  self._id_92E9 = undefined;
  self notify("StopFindTargetNoGoal");
}

_id_F546(var_0) {
  var_1 = scripts\engine\utility::_id_8180("player_respawn_loc", "targetname");
  var_2 = [];

  foreach (var_4 in var_1) {
  if (ispointinvolume(var_4.origin, var_0)) {
  var_4._id_212E = var_0;
  var_2[var_2.size] = var_4;
  }
  }

  var_0._id_D25E = var_2;
}

_id_BDD4() {
  _id_0A77::_id_D52A("mus_zombies_newwave", (0, 0, 0), 1);
  level notify("wave_start_sound_done");
}

_id_BDD1() {
  wait 0.3;
  _id_0A77::_id_D52A("mus_zombies_endwave", (0, 0, 0));
}

_id_BDD3() {
  _id_0A77::_id_D52A("mus_zombies_eventwave_start", (0, 0, 0));
  level notify("wave_start_sound_done");
}

_id_BDD2() {
  _id_0A77::_id_D52A("mus_zombies_eventwave_end", (0, 0, 0));
}

_id_BDD0() {
  _id_0A77::_id_D52A("mus_zombies_boss_start", (0, 0, 0));
}

_id_BDCF() {
  _id_0A77::_id_D52A("mus_zombies_boss_end", (0, 0, 0));
}

_id_93EB(var_0) {
  level._id_E1CC = level._id_E1CC + var_0;
}

_id_4FB8(var_0) {
  level._id_E1CC = max(0, level._id_E1CC - var_0);
}

_id_93E6(var_0) {
  level._id_50F8 = level._id_50F8 + var_0;
}

_id_4FB6(var_0) {
  level._id_50F8 = level._id_50F8 - var_0;
}
