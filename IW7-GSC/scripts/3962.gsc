/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3962.gsc
***************************************/

_id_DF0C() {
  scripts\aitypes\bt_util::init();
  _id_03B5::_id_DEE8();
  _id_0F47::_id_2371();
  _id_9812();
  _id_98E9();
  _id_98E8();
  _id_9885();
  _id_98D8();
  thread _id_FAB0();
}

_id_FAB0() {
  level endon("game_ended");

  if (!isdefined(level._id_18EE))
  level waittill("scripted_agents_initialized");

  level._id_18EE["zombie_grey"]["setup_func"] = ::_id_FA8A;
  level.agent_funcs["zombie_grey"]["on_killed"] = ::_id_C5D1;
  level.agent_funcs["zombie_grey"]["on_damaged"] = ::_id_C5CF;
  level.agent_funcs["zombie_grey"]["gametype_on_killed"] = _id_0CBC::_id_C5D2;
  level.agent_funcs["zombie_grey"]["gametype_on_damage_finished"] = ::_id_C5D0;
}

_id_98E8() {
  scripts\engine\utility::_id_6E39("clone_complete");
}

_id_9885() {
  level._id_85EE = 0;
}

_id_98D8() {
  level._id_85F2 = [];
  var_0 = [(324, 1657, 195), (319, 1164, 195), (980, 1639, 196), (966, 1148, 196), (210, 3338, 259), (425, 3778, 259), (985, 3777, 259), (1164, 3204, 259), (453, 187, 226), (452, -86, 195), (859, 189, 195), (839, -62, 227), (184, 2260, 284), (1066, 2275, 285), (974, 1752, 220), (334, 1049, 220), (967, 1516, 219), (968, 1281, 219), (967, 1043, 222), (934, 313, 248), (373, 314, 243), (236, 990, 243), (1048, 991, 242), (1272, 999, 283), (1224, 319, 297), (-56, 990, 297), (77, 318, 297), (141, -197, 302), (-344, -941, 182), (133, -1281, 606), (695, -1616, 611), (449, -1472, 595), (-277, -396, 239), (-395, -339, 388), (1151, -840, 115)];

  foreach (var_2 in var_0) {
  var_3 = _id_B28D(var_2);
  level._id_85F2[level._id_85F2.size] = var_3;
  }
}

_id_B28D(var_0) {
  var_1 = spawnstruct();
  var_1.origin = var_0;
  return var_1;
}

_id_FA8A() {
  self._id_71D0 = ::_id_1004E;
  self._id_0010 = 0.5;
  self._id_0202 = 0;
  self._id_0293 = 48;
  self._id_A8BA = 0;
  self._id_5277 = 360;
  self._id_5278 = 340;
  self._id_B4CD = 3000;
  self._id_110D7 = self._id_5277 + 100;
  self._id_6B97 = 12;
  self._id_72C5 = 340;
  self._id_6B98 = 40;
  self._id_565E = 2500;
  self._id_69EF = 75;
  self._id_69EE = 30;
  self._id_69ED = 50;
  self.guid = self getentitynumber();
  self._id_272A = 0;
  self._id_B632 = 90000;
  self._id_B5F1 = 160;
  self._id_B5F4 = 250;
  self._id_B5F2 = 1.2;
  self._id_B4D9 = 50;
  self._id_B5D9 = 32;
  self._id_B628 = 50;
  self._id_B626 = 70;
  self._id_B62B = ::_id_85F8;
  self._id_BF9F = gettime() + randomintrange(3000, 5000);
  self._id_9343 = 1;
  self._id_9340 = 1;
  self._id_9342 = 1;
  self._id_9341 = 1;
  self._id_0033 = 0;
  self._id_1A44 = 90;
  self._id_013C = 600;
  self._id_013E = 600;
  self._id_013D = 600;
  self._id_4F63 = ::_id_85F6;
  _id_2475();
  _id_FAA6();
  self setscriptablepartstate("backpack_dome_shield", "on");

  if (isdefined(level._id_8600))
  [[level._id_8600]](self);

  thread _id_EF7F();
  thread _id_8CAC(self);
}

_id_85F6(var_0, var_1) {
  if (scripts\engine\utility::_id_9CEE(self._id_927D))
  _id_0C33::_id_295A();
  else
  _id_0C33::_id_295C();
}

_id_85F8(var_0, var_1) {
  var_2 = vectornormalize(var_1.origin - var_0.origin) * (1, 1, 0);
  var_1 _meth_8366(var_2 * 800);
  var_0 playsound("grey_force_push");

  if (isplayer(var_1)) {
  var_1 _meth_844F(0.5, 1, var_1.origin, 800);

  if (!scripts\engine\utility::_id_9CEE(var_0._id_927D))
  var_1 shellshock("frag_grenade_mp", 1);
  }
}

_id_1004E() {
  if (isdefined(self._id_0033) && self._id_0033 == 0)
  return 0;

  var_0 = gettime();

  if (var_0 < self._id_BF9F)
  return 0;

  self._id_BF9F = var_0 + randomintrange(3000, 5000);
  return 1;
}

_id_2475() {
  if (isdefined(self._id_2AB4) && self._id_2AB4 == 0)
  return;

  self._id_13525 = "american";
  self _meth_82C6("cloth");
  var_0 = [];
  var_0["tag_armor_head_ri"] = 165;
  var_0["tag_armor_head_le"] = 165;
  var_0["tag_armor_head_front"] = 165;
  var_0["tag_armor_forearm_le"] = 120;
  var_0["tag_armor_bicep_le"] = 120;
  var_0["tag_armor_forearm_ri"] = 120;
  var_0["tag_armor_bicep_ri"] = 120;
  var_0["tag_armor_chest_upper_le"] = 165;
  var_0["tag_armor_chest_upper_ri"] = 165;
  var_0["tag_armor_back_upper"] = 165;
  var_0["tag_armor_chest_stomach"] = 165;
  var_0["tag_armor_back_lower"] = 165;
  var_0["tag_armor_leg_thigh_front_le"] = 120;
  var_0["tag_armor_leg_thigh_back_le"] = 120;
  var_0["tag_armor_leg_thigh_front_ri"] = 120;
  var_0["tag_armor_leg_thigh_back_ri"] = 120;
  var_0["tag_armor_kneepad_behind_le"] = 50;
  var_0["tag_armor_kneepad_down_le"] = 50;
  var_0["tag_armor_kneepad_upper_le"] = 50;
  var_0["tag_armor_kneepad_behind_ri"] = 50;
  var_0["tag_armor_kneepad_down_ri"] = 50;
  var_0["tag_armor_kneepad_upper_ri"] = 50;
  self._id_2AB4 = 1;
}

_id_FAA6() {
  self._id_2AB5 = 1;
}

_id_17CC(var_0, var_1) {
  if (!isdefined(anim._id_85DF)) {
  anim._id_85DF = [];
  anim._id_85E1 = [];
  }

  var_2 = anim._id_85DF.size;
  anim._id_85DF[var_2] = var_0;
  anim._id_85E1[var_2] = var_1;
}

_id_9812() {
  _id_17CC(0, (41.5391, 7.28883, 72.2128));
  _id_17CC(1, (34.8849, -4.77048, 74.0488));
}

_id_EF7F() {
  self endon("death");

  for (;;) {
  self waittill("goal_reached");

  if (isdefined(self._id_EF7D))
  var_0 = self._id_EF7D;
  else if (isdefined(self._id_EF7A))
  var_0 = self._id_EF7A.origin;
  else if (isdefined(self._id_EF7C))
  var_0 = self._id_EF7C.origin;
  else
  continue;

  var_1 = 16;

  if (isdefined(self._id_EF7E))
  var_1 = self._id_EF7E * self._id_EF7E;

  if (distance2dsquared(self.origin, var_0) <= var_1) {
  self._id_EF7D = undefined;
  self._id_EF7C = undefined;

  if (!isdefined(self._id_EF7B))
  self._id_EF7A = undefined;

  self notify("scriptedGoal_reached");
  }
  }
}

_id_F834(var_0, var_1) {
  if (!isdefined(var_1))
  var_1 = 0;

  self._id_EF79 = var_1;
  self._id_EF73 = var_0;
}

_id_F835(var_0, var_1) {
  self._id_EF7A = undefined;
  self._id_EF7B = undefined;
  self._id_EF7C = undefined;
  self._id_EF7D = var_0;
  self._id_EF7E = var_1;
}

_id_F833(var_0, var_1) {
  self._id_EF7D = undefined;
  self._id_EF7A = undefined;
  self._id_EF7B = undefined;
  self._id_EF7C = var_0;
  self._id_EF7E = var_1;
}

_id_F832(var_0, var_1, var_2) {
  self._id_EF7D = undefined;
  self._id_EF7C = undefined;
  self._id_EF7A = var_0;
  self._id_EF7E = var_1;

  if (isdefined(var_2) && var_2)
  self._id_EF7B = var_2;
  else
  self._id_EF7B = undefined;
}

_id_41D9() {
  if (isdefined(self._id_EF7D) || isdefined(self._id_EF7A) || isdefined(self._id_EF7C)) {
  self._id_EF7D = undefined;
  self._id_EF7A = undefined;
  self._id_EF7B = undefined;
  self._id_EF7C = undefined;
  self _meth_841F();
  }
}

_id_C5D1(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8) {
  scripts\mp\mp_agent::_id_5006(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8);

  foreach (var_10 in level.players)
  var_10 _id_0A63::_id_831D(1000, 1);

  if (isdefined(level._id_85F1))
  [[level._id_85F1]](self, var_1, var_4, var_6, var_3);
}

_id_12868(var_0) {
  if (isdefined(level._id_10850) && level._id_10850.size > 1) {
  if (!isdefined(var_0))
  var_0 = _id_79F0();

  var_1 = _id_79F1(var_0);

  foreach (var_3 in level._id_10850) {
  if (var_3 == var_1)
  continue;

  _id_B67C(var_3, var_1);
  }

  _id_12BFD(var_1);
  var_1 notify("update_mobile_shield_visibility", 1);
  var_1 thread _id_50D4(var_1);
  }

  level notify("grey_duplicating_attack_end");
}

_id_50D4(var_0) {
  var_0 endon("death");
  wait 1.5;
  var_0 suicide();
}

_id_12BFD(var_0) {
  _id_B2C4(var_0);
  var_0._id_927D = 0;
  var_0._id_10AB7 = undefined;
  var_0._id_5277 = 360;
  var_0._id_B632 = 90000;
  var_0._id_110D7 = var_0._id_5277 + 100;
  var_0._id_380E = 0;
  var_0._id_380F = 0;
  var_0 setmodel("park_alien_gray");
  var_0 setthreatbiasgroup();
  _id_0C2E::_id_F499(var_0);
  _id_0C2E::_id_E223(var_0);
  _id_0C78::_id_E2FB(var_0);
  _id_0C78::_id_E2FA(var_0);
  var_0 thread _id_8CAC(var_0);
  var_0 scripts\mp\mp_agent::_id_FAFA("iw7_zapper_grey");
}

_id_B2C4(var_0) {
  var_1 = var_0._id_269C;

  foreach (var_3 in var_1) {
  if (scripts\engine\utility::array_contains(var_0._id_269D, var_3._id_113E0)) {
  var_3 show();
  continue;
  }

  var_0._id_269C = scripts\engine\utility::array_remove(var_0._id_269C, var_3);
  }
}

_id_79F1(var_0) {
  var_1 = undefined;
  var_2 = -1;

  foreach (var_4 in level._id_10850) {
  if (!isdefined(var_4))
  continue;

  if (var_4 == var_0)
  continue;

  if (var_4.health > var_2) {
  var_1 = var_4;
  var_2 = var_4.health;
  }
  }

  return var_1;
}

_id_79F0() {
  var_0 = undefined;
  var_1 = 9999999;

  foreach (var_3 in level._id_10850) {
  if (!isdefined(var_3))
  continue;

  if (var_3.health < var_1) {
  var_0 = var_3;
  var_1 = var_3.health;
  }
  }

  return var_0;
}

_id_B67C(var_0, var_1) {
  level thread _id_CD95(var_0, var_1);
  var_1.health = var_1.health + var_0.health;
  var_0._id_C026 = 1;

  if (isalive(var_0))
  var_0 suicide();
}

_id_CD95(var_0, var_1) {
  var_2 = spawn("script_model", var_0.origin + (0, 0, 50));
  var_2 setmodel("tag_origin");
  wait 0.2;
  playfxontag(level._effect["zombie_grey_teleport_trail"], var_2, "tag_origin");
  var_2 moveto(var_1.origin + (0, 0, 50), 0.8, 0.8);
  var_2 waittill("movedone");
  var_2 delete();
}

_id_C5CF(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11) {
  var_12 = 3.5;

  if (isdefined(var_1) && var_1 == self)
  return;

  if (scripts\engine\utility::_id_9CEE(self._id_9C9D)) {
  if (isdefined(var_4) && var_4 == "MOD_MELEE" && isdefined(self._id_1B6C) && isdefined(var_6) && distancesquared(var_6, self._id_1B6C.origin) < 225) {
  self playsound("grey_fuse_smash");
  self._id_4C17 = max(self._id_B748, self._id_4C17 - self._id_B43F);
  self._id_B570 = var_1;
  self notify("stop_regen_health");
  return;
  } else {
  var_13 = gettime();

  if (isplayer(var_1)) {
  if (!scripts\engine\utility::_id_9CEE(self.actually_doing_regen))
  _id_0A4A::_id_D96B(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, self);

  if (_id_FF8A(self, var_1, var_13)) {
  var_1._id_D8A2 = var_13;

  if (randomint(100) > 80)
  var_1 thread _id_0A6A::_id_12885("nag_ufo_fusefail", "zmb_comment_vo", "low", 3, 0, 0, 1);
  }
  }

  return;
  }
  }

  if (isdefined(var_11) && var_11 == "j_chest_light") {
  var_8 = "head";
  var_2 = int(var_2 * var_12);
  }
  else if (isdefined(var_8) && (var_8 == "head" || var_8 == "helmet" || var_8 == "neck")) {
  var_8 = "soft";
  var_2 = int(var_2 / var_12);
  }

  if (isdefined(var_5) && (var_5 == "zmb_imsprojectile_mp" || var_5 == "zmb_fireworksprojectile_mp"))
  var_2 = min(int(self.maxhealth / 20), 1000);

  var_3 = var_3 | level.idflags_no_knockback;
  _id_0CBC::_id_C5CD(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11);

  if (isdefined(var_2)) {
  if (isplayer(var_1)) {
  if (!isdefined(self._id_111BF))
  _id_0C2E::_id_E223(self);

  self._id_111BF = self._id_111BF + var_2;

  if (!scripts\engine\utility::array_contains(self._id_DDBA, var_1))
  self._id_DDBA = scripts\engine\utility::_id_2279(self._id_DDBA, var_1);
  }
  }
}

_id_C5D0(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12) {
  _id_0CBC::_id_C5CE(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12);
  _id_0C2E::_id_12888(self, var_1);
  _id_0C2E::_id_12870(self);
}

_id_98E9() {
  level._effect["zombie_grey_shockwave_begin"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_swave_begin.vfx");
  level._effect["zombie_grey_shockwave_deploy"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_swave_deploy.vfx");
  level._effect["zombie_grey_teleport"] = loadfx("vfx/old/_requests/archetypes/vfx_phase_shift_start_volume");
  level._effect["zombie_grey_teleport_trail"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_grey_tport_trail.vfx");
  level._effect["zombie_grey_start_duplicate"] = loadfx("vfx/iw7/_requests/coop/vfx_magicwheel_beam.vfx");
  level._effect["summon_zombie_energy_ring"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_grey_spawn_portal.vfx");
  level._effect["zombie_mini_grey_shock_arc"] = loadfx("vfx/iw7/_requests/coop/vfx_mini_grey_shock_arc.vfx");
}

_id_FF8A(var_0, var_1, var_2) {
  var_3 = 3000;
  var_4 = 22500;

  if (distancesquared(var_0.origin, var_1.origin) > var_4)
  return 0;

  if (!isdefined(var_1._id_D8A2))
  return 1;

  if (var_2 - var_1._id_D8A2 > var_3)
  return 1;

  return 0;
}

_id_8CAC(var_0) {
  var_0 notify("stop_health_light_monitor");
  level endon("game_ended");
  var_0 endon("death");
  var_0 endon("stop_health_light_monitor");
  scripts\engine\utility::waitframe();

  if (scripts\engine\utility::_id_9CEE(var_0._id_927D))
  return;

  while (!isdefined(var_0.maxhealth))
  scripts\engine\utility::waitframe();

  var_1 = var_0.maxhealth * 0.33;
  var_2 = var_0.maxhealth * 0.66;

  for (;;) {
  if (var_0.health <= var_1)
  var_0 setscriptablepartstate("health_light", "red");
  else if (var_0.health <= var_2)
  var_0 setscriptablepartstate("health_light", "yellow");
  else
  var_0 setscriptablepartstate("health_light", "green");

  var_0 scripts\engine\utility::waittill_any("damage", "update_health_light");
  }
}
