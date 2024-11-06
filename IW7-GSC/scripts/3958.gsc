/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3958.gsc
***************************************/

_id_DF0C() {
  scripts\aitypes\bt_util::init();
  _id_03B3::_id_DEE8();
  _id_0F45::_id_2371();
  _id_AEB0();
  thread _id_FAB0();
}

_id_FAB0() {
  level endon("game_ended");

  if (!isdefined(level._id_18EE))
  level waittill("scripted_agents_initialized");

  level._id_18EE["zombie_brute"]["setup_func"] = ::_id_FA8A;
  level._id_18EE["zombie_brute"]["setup_model_func"] = ::_id_FACE;
  level.agent_funcs["zombie_brute"]["on_killed"] = ::_id_C4D1;
  level.agent_funcs["zombie_brute"]["on_damaged_finished"] = ::_id_C4D0;
  level._id_3111 = ::_id_3110;
  level.brute_loot_check = [];
}

_id_FA8A() {
  self.class = undefined;
  self._id_BCF6 = undefined;
  self._id_26B9 = undefined;
  self.guid = undefined;
  self.name = undefined;
  self._id_EB6A = undefined;
  self._id_CA5B = undefined;
  self._id_13CA0 = undefined;
  self._id_C2AD = undefined;
  self._id_0291 = undefined;
  self.sessionstate = undefined;
  self._id_55E6 = undefined;
  self._id_55E9 = undefined;
  self._id_55D9 = undefined;
  self._id_55E4 = 1;
  self._id_C026 = undefined;
  self._id_0184 = 0;
  self._id_0180 = 0;
  self._id_116D4 = undefined;
  self._id_441A = undefined;
  self._id_4B82 = undefined;
  self._id_5793 = undefined;
  self._id_37FD = 0;
  self._id_24CA = undefined;
  self._id_6622 = 0;
  self._id_B36E = undefined;
  self._id_126A3 = undefined;
  self._id_8C35 = 0;
  self._id_9342 = 1;
  self._id_9341 = 1;
  self._id_1B03 = "idle";
  self._id_01F5 = "run";
  self._id_0293 = 150;
  self.radius = 20;
  self.height = 53;
  self._id_252B = 26 + self.radius;
  self._id_B640 = "normal";
  self._id_B641 = 50;
  self._id_2539 = 54;
  self._id_253A = -64;
  self._id_4D45 = 2250000;
  self._id_0181 = 1;
  self.guid = self getentitynumber();
  self._id_BCE4 = 1.0;
  self._id_C081 = 1.0;
  self._id_126E8 = 1.0;
  self._id_772A = 1.0;
  self._id_2AB2 = 0;
  self._id_2AB8 = 1;
  self._id_118FC = 0;
  self._id_002F = 1;
  self._id_B5F9 = 40;
  self._id_B62E = 100;
  self._id_B62F = squared(self._id_B62E);
  self._id_503C = self.radius + 1;
  self._id_B607 = 0.5;
  self._id_565C = 0;
  self._id_54CB = 0;
  self._id_9E0C = undefined;
  self._id_6F73 = undefined;
  self._id_565C = 0;
  self._id_B0FC = 1;
  self._id_74B5 = 0;
  _id_0F74::_id_F794(self._id_B62E);
  self._id_B631 = 100;
  self._id_4A7D = 0;
  self.spawn_round_num = level._id_13BD3;
  self._id_013C = 600;
  self._id_013E = 600;
  self._id_013D = 600;
  self._id_0033 = 1;

  if (getdvarint("scr_zombie_left_foot_sharp_turn_only", 0) == 1)
  self._id_AB3F = 1;

  self._id_1009D = ::_id_3121;
  thread _id_B9B9();
  thread _id_BA27();
  thread _id_899C();
  var_0 = getdvarint("scr_zombie_traversal_push", 1);

  if (var_0 == 1)
  thread _id_311D();

  thread _id_89C9();
  _id_108D6();
  thread _id_3112();
  thread _id_88F5();
  thread _id_88BA();
}

_id_89C9() {
  scripts\engine\utility::waitframe();
  scripts\asm\asm_bb::_id_2968("run");
  level thread _id_0D62::_id_CE9C(self, "run_grunt", 1);
}

_id_899C() {
  self endon("death");
  level waittill("game_ended");
  self _meth_841F();

  foreach (var_4, var_1 in self._id_164D) {
  var_2 = var_1._id_4BC0;
  var_3 = anim._id_2303[var_4]._id_10E2F[var_2];
  scripts\asm\asm::_id_2388(var_4, var_2, var_3, var_3._id_116FB);
  scripts\asm\asm::_id_238A(var_4, "idle", 0.2, undefined, undefined, undefined);
  }
}

_id_FACE(var_0) {
  self setmodel(_id_7D86());
  thread _id_50EF();
}

_id_7D86() {
  var_0 = ["zmb_brute_mascot_body"];
  return scripts\engine\utility::_id_DC6B(var_0);
}

_id_50EF() {
  self endon("death");
  wait 0.5;

  if (isdefined(level._id_C01F))
  return;

  self _meth_80BB(1, 0.1);
}

_id_AEB0() {
  level._effect["laser_muzzle_flash"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_brute_lensf.vfx");
}

_id_3110(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11) {
  var_12 = 25;
  var_13 = var_12 * var_12;
  var_14 = self gettagorigin("tag_eye");
  var_15 = (var_8 == "head" || var_8 == "helmet" || var_8 == "neck") && var_4 != "MOD_MELEE" && var_4 != "MOD_IMPACT" && var_4 != "MOD_CRUSH";

  if (!var_15 && var_8 == "torso_upper" && self._id_8E14 == "hand" && distancesquared(var_6, var_14) < var_13)
  var_15 = 1;

  if (var_15) {
  var_2 = _id_EBAC(var_2, var_5);
  var_16 = var_2 / 3;

  if (isdefined(var_5) && (var_5 == "zmb_imsprojectile_mp" || var_5 == "zmb_fireworksprojectile_mp"))
  var_2 = 0;
  else
  var_2 = max(10, var_16);

  if (self._id_8E14 == "head") {
  if (!isdefined(self._id_8DDE))
  self._id_8DDE = 0;

  self._id_8DDE = self._id_8DDE + var_2;
  var_2 = 1;
  }
  }
  else
  var_2 = 1;

  return var_2;
}

_id_EBAC(var_0, var_1) {
  var_2 = getweaponbasename(var_1);

  if (!isdefined(var_2))
  return;

  var_3 = 2000;

  switch (var_2) {
  case "iw7_headcutter_zm_pap1":
  case "iw7_headcutter_zm":
  case "iw7_facemelter_zm_pap1":
  case "iw7_facemelter_zm":
  case "iw7_dischord_zm_pap1":
  case "iw7_dischord_zm":
  case "iw7_shredder_zm_pap1":
  case "iw7_shredder_zm":
  var_0 = var_3;
  }

  return var_0;
}

_id_108D6() {
  self._id_527A = "head";
  self._id_8E14 = "head";
}

_id_BCBC() {
  self._id_8E14 = "hand";
  self setscriptablepartstate("eyes", "yellow_eyes");
  self._id_BCE4 = 1.0;
  scripts\asm\asm_bb::_id_2968("sprint");
}

_id_BCBD() {
  self setscriptablepartstate("eyes", "eye_glow_off");
  self._id_8E14 = "head";
  self._id_BCE4 = 1.0;
  scripts\asm\asm_bb::_id_2968("run");
}

_id_DB25(var_0) {
  self endon("death");
  self notify("reset_helmet_timer");
  self endon("reset_helmet_timer");
  wait(var_0);

  if (self._id_8E14 == "hand")
  self._id_527A = "head";
}

_id_3112() {
  self endon("death");

  if (!isdefined(self._id_8DDE))
  self._id_8DDE = 0;

  while (!isdefined(self.maxhealth))
  wait 0.1;

  self._id_8E09 = 0;

  for (;;) {
  var_0 = self.health / self.maxhealth;
  var_1 = max(self._id_8DF0 * var_0, 1000);

  if (self._id_8E09 == 1)
  var_1 = var_1 * 0.5;

  self waittill("helmet_damage");

  if (self._id_8DDE > var_1) {
  self._id_8E09++;
  self._id_527A = "hand";
  self._id_8DDE = 0;

  if (self._id_8E09 < 2)
  thread _id_DB25(20);
  }
  }
}

_id_C4D0(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12) {
  if (!isdefined(self._id_8E09))
  self._id_8E09 = 0;

  if (self._id_4A7D)
  var_2 = 1;
  else if (var_8 == "head" || var_2 > 1) {
  var_13 = "standard";

  if (self._id_8E14 == "head") {
  if (!isdefined(self._id_8DDE))
  self._id_8DDE = 0;

  self notify("helmet_damage");
  var_2 = 0;
  } else {
  var_13 = "hitcritical";

  if (self._id_8E09 < 2)
  thread _id_DB25(5);
  }

  if (isplayer(var_1))
  var_1 thread _id_0A4F::updatedamagefeedback(var_13, undefined, var_2);
  }
  else if (var_8 == "helmet") {
  var_13 = "standard";

  if (self._id_8E14 == "head") {
  if (!isdefined(self._id_8DDE))
  self._id_8DDE = 0;

  self notify("helmet_damage");

  if (isplayer(var_1))
  var_1 thread _id_0A4F::updatedamagefeedback(var_13, undefined, var_2);

  var_2 = 0;
  }
  else
  var_2 = 0;
  }
  else
  var_2 = 0;

  scripts\mp\mp_agent::_id_5004(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12);
}

brute_killed_vo(var_0) {
  if (isplayer(var_0))
  var_0 thread _id_0A6A::_id_12885("killfirm_brute", "zmb_comment_vo", "medium", 10, 0, 0, 0, 20);

  wait 4;
  level thread _id_0A6A::_id_12885("ww_brute_death", "zmb_ww_vo", "highest", 60, 0, 0, 1);
}

_id_C4D1(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8) {
  level thread brute_killed_vo(var_1);
  _id_10838(self._id_1657, var_3, var_4);
  self.death_anim_no_ragdoll = 1;
  scripts\mp\mp_agent::_id_5006(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8);
  var_9 = scripts\engine\utility::_id_DC6B(["ammo_max", "instakill_30", "cash_2", "instakill_30", "cash_2", "instakill_30", "cash_2"]);

  if (isdefined(var_9) && !isdefined(self._id_72AC)) {
  if (!isdefined(level.brute_loot_check[self.spawn_round_num])) {
  level.brute_loot_check[self.spawn_round_num] = 1;
  level thread _id_0A76::_id_5CF6(self.origin, var_1, var_9);
  }
  }

  var_10 = 400;

  foreach (var_12 in level.players) {
  var_12 _id_0A63::_id_82F9(var_10);
  var_12 _id_0D2A::_id_12D7C("THE_BIGGER_THEY_ARE", 1);
  }
}

_id_10838(var_0, var_1, var_2) {
  self._id_CE65 = 1;
}

_id_10840(var_0) {}

_id_B9B9() {
  self endon("death");
  level endon("game_ended");
}

_id_BA27() {
  self endon("death");
  level endon("game_ended");
}

_id_A012() {
  if (!isdefined(level._id_13F60))
  return 0;

  return level._id_13F60;
}

_id_A632(var_0) {
  var_0 _meth_80B0(var_0.health + 500000, var_0.origin);
}

_id_311E(var_0, var_1) {
  foreach (var_3 in level.players) {
  var_4 = self.origin[2] - var_3.origin[2];

  if (abs(var_4) < var_1) {
  var_5 = distance2dsquared(self.origin, var_3.origin);

  if (var_5 < var_0) {
  var_6 = self._id_0381;
  var_7 = length2d(var_6);

  if (var_7 == 0)
  break;

  var_8 = var_3.origin - self.origin;
  var_8 = (var_8[0], var_8[1], 0);
  var_9 = vectornormalize(var_8);

  if (var_7 < 60)
  var_7 = 60;

  var_10 = var_3 _meth_816B();
  var_10 = (var_10[0], var_10[1], 0);
  var_11 = length2d(var_10);

  if (var_11 > 0) {
  var_12 = var_9 * var_7;
  var_13 = var_10 + var_12;
  var_14 = length2d(var_13);

  if (vectordot(var_13, var_12) < 0) {
  var_15 = vectorcross((0, 0, 1), var_9);

  if (vectordot(var_15, var_10) > 0) {
  var_11 = length2d(var_10);
  var_10 = var_15 * var_11;
  } else {
  var_16 = var_15 * -1;
  var_11 = length2d(var_10);
  var_10 = var_16 * var_11;
  }

  var_13 = var_10 + var_12;
  var_7 = length2d(var_13);
  } else {
  if (var_11 > var_7)
  var_7 = var_11;

  var_9 = vectornormalize(var_13);
  }
  }

  var_3 _meth_84DC(var_9, var_7);
  }
  }
  }
}

_id_311F() {
  self endon("death");
  level endon("game_ended");
  self endon("traverse_end");

  for (;;) {
  _id_311E(3600, 100);
  scripts\engine\utility::waitframe();
  }
}

_id_311D() {
  self endon("death");
  self endon("game_ended");

  for (;;) {
  self waittill("traverse_begin");
  _id_311F();
  }
}

_id_3121() {
  if (!isdefined(self._id_527A) || !isdefined(self._id_8E14))
  return 0;

  if (self._id_8E14 != self._id_527A)
  return 1;

  return 0;
}

_id_88F5() {
  self endon("death");
  level endon("game_ended");

  for (;;) {
  self waittill("large_footstep");
  var_0 = scripts\engine\utility::_id_782F(self.origin, level.players, undefined, undefined, 500);

  foreach (var_2 in var_0) {
  var_2 _meth_844F(0.2, 0.25, self.origin, 500);
  var_2 _meth_8246("artillery_rumble", self.origin);
  }
  }
}

_id_3116() {
  self endon("death");
  var_0 = 0;

  for (;;) {
  if (scripts\engine\utility::_id_9CEE(self._id_3117)) {
  var_0 = 0;
  wait 1;
  continue;
  }

  if (scripts\engine\utility::_id_9CEE(self._id_9CEC)) {
  var_0 = 0;
  wait 1;
  continue;
  }

  var_1 = undefined;
  var_2 = level._id_10816;

  foreach (var_4 in var_2) {
  if (!var_4._id_0019)
  continue;

  if (self istouching(var_4)) {
  var_1 = var_4;
  break;
  }
  }

  if (!isdefined(var_1)) {
  var_0 = 0;
  self notify("no_path_to_targets");
  } else {
  var_6 = _id_0D60::_id_800B(var_1);

  if (var_6 == 0) {
  var_7 = 0;
  var_2 = var_1._id_186E;

  if (isdefined(var_2)) {
  foreach (var_4 in var_2) {
  var_6 = _id_0D60::_id_800B(var_4);

  if (var_6 > 0) {
  var_7 = 1;
  break;
  }
  }
  }

  if (!var_7)
  var_0++;
  else
  var_0 = 0;
  }
  else
  var_0 = 0;

  if (var_0 > 5) {
  self notify("no_path_to_targets");
  var_0 = 0;
  }
  }

  wait 1;
  }
}

_id_88BA() {
  self endon("death");
  level endon("game_ended");
  thread _id_3116();

  for (;;) {
  self waittill("no_path_to_targets");
  self._id_3117 = 1;
  _id_1164D();
  self._id_3117 = 0;
  }
}

_id_6CA4() {
  var_0 = _id_0D61::_id_7C2E();
  return var_0;
}

_id_1164D() {
  var_0 = spawnstruct();
  var_0.origin = self.origin;
  _id_0D61::_id_3115(var_0);
  self._id_0180 = 1;
  var_1 = scripts\engine\utility::_id_817E("brute_hide_org", "targetname");
  self setorigin(var_1.origin, 1);
  self _meth_82EF(self.origin);
  wait 3;
  var_2 = _id_6CA4();
  _id_0D61::_id_3115(var_2);
  self setorigin(var_2.origin + (0, 0, 3), 1);
  self._id_0180 = 0;
  wait 3;
}
