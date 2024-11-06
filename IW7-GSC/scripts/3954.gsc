/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3954.gsc
***************************************/

_id_DF0C() {
  scripts\aitypes\bt_util::init();
  _id_03B2::_id_DEE8();
  _id_0F44::_id_2371();
  level._id_13BDC = 1;
  level._id_4878 = 0;
  level._id_BF7C = 0;
  level._id_BCCE = [];
  level._id_BCE5 = [];
  level._id_C082 = [];
  level._id_126E9 = [];
  level._id_8EE6 = [];
  level._id_5662 = [];
  level._id_D437 = "allies";
  _id_9890();
  _id_98A5();
  _id_97FB();
  _id_AEB0();
  thread _id_FAB0();
  thread _id_BC5C();
}

_id_FAB0() {
  level endon("game_ended");

  if (!isdefined(level._id_18EE))
  level waittill("scripted_agents_initialized");

  level._id_18EE["generic_zombie"]["setup_func"] = ::_id_FA8A;
  level._id_18EE["generic_zombie"]["setup_model_func"] = ::_id_FACE;
  level.agent_funcs["generic_zombie"]["on_damaged_finished"] = ::_id_C5CE;
  level.agent_funcs["generic_zombie"]["on_killed"] = ::_id_C5D2;
}

_id_FA8A() {
  thread _id_12EE6();
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
  self.attackent = undefined;
  self._id_1B03 = "idle";
  self._id_01F5 = "walk";
  self._id_0293 = 100;
  self.radius = 15;
  self.height = 40;
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
  self._id_B62E = 70;
  self._id_B631 = 80;
  self._id_B62F = squared(self._id_B62E);
  self._id_503C = self.radius + 1;
  self._id_B607 = 0.5;
  self._id_565C = 0;
  self._id_9BAC = 0;
  self._id_54CB = 0;
  self.damaged_by_player = 0;
  self._id_9E0C = undefined;
  self._id_6F73 = undefined;
  self._id_B0FC = 1;
  self._id_74B5 = 0;
  _id_0F74::_id_F794(self._id_B62E);
  self._id_012E = undefined;
  self._id_E821 = undefined;
  self._id_A8A2 = [];
  self._id_8C12 = 0;
  self._id_8C14 = undefined;
  self._id_9BA7 = undefined;
  self._id_0179 = 200;
  self._id_4E4C = undefined;
  self._id_10A57 = undefined;
  self._id_828A = undefined;
  self._id_CE65 = undefined;
  self._id_29D2 = 1;
  self.vignette_nocorpse = undefined;
  self.death_anim_no_ragdoll = undefined;
  self._id_B603 = 0.85;
  self._id_A9B8 = gettime();
  self._id_9342 = undefined;

  if (getdvarint("scr_zombie_left_foot_sharp_turn_only", 0) == 1)
  self._id_AB3F = 1;

  var_0 = 15;

  if (isdefined(level._id_26AC))
  var_0 = level._id_26AC;

  self _meth_84E6(var_0);
  thread _id_13F55();
  thread _id_BA27();
  thread _id_899C();
  var_1 = getdvarint("scr_zombie_traversal_push", 1);

  if (var_1 == 1)
  thread _id_13F99();
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
  self setmodel(_id_79E5());
  thread _id_50EF();
}

_id_79E5() {
  var_0 = "zombie_male_outfit_1";
  var_1 = undefined;

  if (isdefined(level.generic_zombie_model_override_list))
  var_1 = scripts\engine\utility::_id_DC6B(level.generic_zombie_model_override_list);
  else if (isdefined(level._id_777F))
  var_1 = scripts\engine\utility::_id_DC6B(level._id_777F);
  else
  var_1 = var_0;

  return var_1;
}

_id_5F70() {
  return scripts\engine\utility::_id_9CEE(self._id_E5C9) || scripts\engine\utility::_id_9CEE(self._id_5624) || scripts\engine\utility::_id_9CEE(self._id_8C5F) || scripts\engine\utility::_id_9CEE(self._id_10166);
}

_id_50EF() {
  self endon("death");
  wait 0.5;

  if (_id_5F70())
  return;

  if (isdefined(level._id_C01F))
  return;

  if (_id_0C75::_id_9F87()) {
  self setscriptablepartstate("right_eye", "active");
  self setscriptablepartstate("left_eye", "active");
  }
  else if (scripts\engine\utility::_id_9CEE(self._id_9CEF))
  self setscriptablepartstate("eyes", "turned_eyes");
  else if (scripts\engine\utility::_id_9CEE(self._id_9BA7)) {
  self _meth_80BB(1, 0.1);
  self setscriptablepartstate("eyes", "cop_eyes");
  }
  else
  self _meth_80BB(1, 0.1);
}

_id_13FAF() {
  return isdefined(self._id_117F7);
}

agent_damage_finished(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11) {
  if (isdefined(var_0) || isdefined(var_1)) {
  if (!isdefined(var_0))
  var_0 = var_1;

  if (isdefined(self._id_1CB0) && !self._id_1CB0) {
  if (isdefined(var_0.classname) && var_0.classname == "script_vehicle")
  return 0;
  }

  if (isdefined(var_0.classname) && var_0.classname == "auto_turret")
  var_1 = var_0;

  if (isdefined(var_1) && var_4 != "MOD_FALLING" && var_4 != "MOD_SUICIDE") {
  if (level.teambased) {
  if (isdefined(var_1.team) && var_1.team != self.team)
  self setagentattacker(var_1);
  }
  else
  self setagentattacker(var_1);
  }
  }

  scripts\mp\mp_agent::_id_5004(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, 0.0, var_10, var_11);
  return 1;
}

_id_9F01() {
  if (isdefined(self._id_9902) && self._id_9902)
  return 1;

  if (isdefined(self._id_9901) && self._id_9901)
  return 1;

  return 0;
}

_id_12EE6() {
  self notify("updatePainSensor");
  self endon("updatePainSensor");
  self endon("death");
  self._id_C87E = spawnstruct();
  self._id_C87E._id_A9C8 = gettime();
  self._id_C87E.damage = 0.0;
  var_0 = 0.05;
  var_1 = 5 * var_0;

  for (;;) {
  wait(var_0);

  if (gettime() > self._id_C87E._id_A9C8 + 2000)
  self._id_C87E.damage = self._id_C87E.damage - var_1;

  self._id_C87E.damage = max(self._id_C87E.damage, 0);

  if (_id_9F01())
  self._id_C87E.damage = 0;
  }
}

_id_389D() {
  if (gettime() - self._id_10916 <= 0.05)
  return 0;

  return 1;
}

_id_13F9C(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11) {
  self notify("zombiePendingDeath");
  self endon("zombiePendingDeath");

  while (isdefined(self) && isalive(self)) {
  self._id_CA08 = 1;

  if (!_id_389D()) {
  wait 0.05;
  continue;
  }

  self._id_CA08 = 0;
  _id_C5CE(var_0, var_1, self.health + 1, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11);
  }
}

_id_C4E4(var_0, var_1, var_2) {
  if (isdefined(self._id_C4E5))
  [[self._id_C4E5]](var_0, var_1, var_2);

  if (isdefined(var_2) && (var_2 == "dna_aoe_grenade_zombie_mp" || var_2 == "trap_zm_mp"))
  return;

  self._id_C87E._id_A9C8 = gettime();
  self._id_C87E.damage = self._id_C87E.damage + var_0;
}

_id_9EDB(var_0) {
  return isdefined(self._id_CA08) && self._id_CA08;
}

_id_9DC4() {
  return 0;
}

_id_9FB2() {
  return 0;
}

_id_9EC6(var_0) {
  if (isdefined(var_0.team))
  return var_0.team == level._id_D437;

  return 0;
}

_id_C5CE(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12) {
  var_13 = self.health;
  var_14 = 0;
  var_15 = !_id_13FAF() && var_4 != "MOD_FALLING" && var_5 != "repulsor_zombie_mp" && var_5 != "zombie_water_trap_mp";

  if (var_15 && scripts\engine\utility::_id_9CEE(self._id_54CB))
  var_15 = 0;

  if (_id_5F70())
  var_15 = 0;

  if (scripts\engine\utility::_id_9CEE(self._id_9BB0))
  var_15 = 0;

  if (var_15 && isdefined(level._id_BDFD))
  var_15 = [[level._id_BDFD]](var_15, var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12);

  if (self.health > 0)
  var_16 = clamp(var_2 / self.health, 0, 1);
  else
  var_16 = 1;

  if (var_15) {
  var_14 = _id_128A7(var_8, var_5, var_4, var_16, var_1, var_7, var_4, var_0);

  if (var_14 && isdefined(var_1))
  var_2 = self.health + 1;
  }

  if (isdefined(var_1) && isplayer(var_1) && !isdefined(self._id_012E)) {
  var_17 = isdefined(self._id_4B26) && self._id_4B26 == var_1;
  var_18 = isdefined(self._id_4B26) && !isplayer(self._id_4B26);

  if (var_17 || var_18) {
  if (distancesquared(self.origin, var_1.origin) <= self._id_4D45) {
  _id_0F74::_id_F702(var_1);
  thread _id_E1EB(0.2);
  }
  }
  }

  thread _id_C4E3(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9);

  if (!_id_389D() && self.health - var_2 <= 0) {
  thread _id_13F9C(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_11, var_12);
  var_2 = int(max(0, self.health - 1));
  }

  _id_C4E4(var_2, var_4, var_5);
  level notify("zombie_damaged", self, var_1);

  if (self.agent_type != "skater")
  level thread _id_0D62::_id_CE9C(self, "pain", 0);

  agent_damage_finished(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_11, var_12);

  if (isalive(self)) {
  if (var_14 && !_id_9EDB())
  self suicide();
  else
  _id_12ECD();
  }
}

_id_10168(var_0, var_1, var_2, var_3, var_4, var_5, var_3, var_6) {
  return 0;
}

_id_E1EB(var_0) {
  self endon("death");
  wait(var_0);
  self._id_012E = undefined;
}

_id_12ECD() {}

_id_9890() {
  level._id_1C7F = 1;
  level._id_4BEE = 0;
  level._id_C4BD = ::_id_C4BD;
}

_id_98A5() {
  level._id_BDFA = [];
  _id_97F2();
}

_id_97F2() {
  _id_17F1("crawl", ::_id_BDF8);
}

_id_17F1(var_0, var_1, var_2, var_3, var_4) {
  level._id_BDFA[var_0] = [];
  level._id_BDFA[var_0][0] = var_1;
  level._id_BDFA[var_0][2] = var_2;
  level._id_BDFA[var_0][3] = var_3;
  level._id_BDFA[var_0][4] = var_4;
}

_id_97FB() {
  level._id_566C[1]["tagName"] = "J_Shoulder_RI";
  level._id_566C[2]["tagName"] = "J_Shoulder_LE";
  level._id_566C[4]["tagName"] = "J_Hip_RI";
  level._id_566C[8]["tagName"] = "J_Hip_LE";
  level._id_566C[16]["tagName"] = "J_Head";
  level._id_566C[1]["torsoFX"] = "torso_arm_loss_right";
  level._id_566C[2]["torsoFX"] = "torso_arm_loss_left";
  level._id_566C[4]["torsoFX"] = "torso_loss_right";
  level._id_566C[8]["torsoFX"] = "torso_loss_left";
  level._id_566C[16]["torsoFX"] = "torso_head_loss";
  level._id_566C[1]["fxTagName"] = "J_Shoulder_RI";
  level._id_566C[2]["fxTagName"] = "J_Shoulder_LE";
  level._id_566C[4]["fxTagName"] = "J_Hip_RI";
  level._id_566C[8]["fxTagName"] = "J_Hip_LE";
  level._id_566C[16]["fxTagName"] = "j_neck";
  level._id_566C["full"]["fxTagName"] = "J_MainRoot";
  level._id_566C[1]["limbFX"] = "arm_loss_right";
  level._id_566C[2]["limbFX"] = "arm_loss_left";
  level._id_566C[4]["limbFX"] = "limb_loss_right";
  level._id_566C[8]["limbFX"] = "limb_loss_left";
  level._id_566C[16]["limbFX"] = "head_loss";
  level._id_74B9 = 0;
}

_id_AEB0() {
  level._effect["gib_full_body"] = loadfx("vfx/iw7/_requests/coop/vfx_zmb_blackhole_death");
  level._effect["suicide_zmb_death"] = loadfx("vfx/iw7/_requests/coop/vfx_clown_exp.vfx");
  level._effect["suicide_zmb_explode"] = loadfx("vfx/iw7/core/zombie/vfx_clown_exp_big.vfx");
  level._effect["gib_full_body_cheap"] = loadfx("vfx/iw7/_requests/coop/zmb_fullbody_gib");
  level._effect["torso_arm_loss_right"] = loadfx("vfx/iw7/core/zombie/vfx_zombie_dism_arm_r.vfx");
  level._effect["torso_arm_loss_left"] = loadfx("vfx/iw7/core/zombie/vfx_zombie_dism_arm_l.vfx");
  level._effect["torso_loss_left"] = loadfx("vfx/iw7/core/zombie/vfx_zombie_impact_torso_l.vfx");
  level._effect["torso_head_loss"] = loadfx("vfx/iw7/core/zombie/vfx_zombie_dism_head.vfx");
  level._effect["torso_loss_right"] = loadfx("vfx/iw7/core/zombie/vfx_zombie_impact_torso_r.vfx");
  level._effect["arm_loss_left"] = loadfx("vfx/iw7/core/zombie/vfx_zombie_impact_arm_l.vfx");
  level._effect["arm_loss_right"] = loadfx("vfx/iw7/core/zombie/vfx_zombie_impact_arm_r.vfx");
  level._effect["limb_loss_right"] = loadfx("vfx/iw7/core/zombie/vfx_zombie_impact_limb_r.vfx");
  level._effect["limb_loss_left"] = loadfx("vfx/iw7/core/zombie/vfx_zombie_impact_limb_l.vfx");
  level._effect["head_loss"] = loadfx("vfx/iw7/core/zombie/vfx_zombie_impact_head.vfx");
}

_id_3DE4(var_0) {
  return isdefined(self._id_1657) && isdefined(self._id_1657[var_0]);
}

_id_128A7(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7) {
  var_8 = 0;

  if (!_id_FF69(self))
  return 0;

  if (weaponisimpaling(var_1))
  return 0;

  if (isalive(self) && (!scripts\anim\notetracks_mp::_id_9F77() || var_3 >= 1) && !_id_9FB2()) {
  if (!isdefined(self._id_B8BA))
  self._id_B8BA = 0;

  var_9 = _id_7FD6(var_0, var_1, var_2, var_3, var_4, self._id_B8BA, var_7);

  if (var_9 != 0) {
  var_10 = !scripts\engine\utility::_id_9CEE(self._id_565C);
  var_11 = isdefined(self._id_B8BA) && self._id_B8BA == 0;

  if (level._id_4878 < 8 || scripts\engine\utility::_id_9CEE(self._id_565C) || (var_9 & 12) == 0 || (var_9 & 16) != 0 || (self._id_B8BA & 3) != 0) {
  if (_id_BDFB(self._id_B8BA | var_9, var_1, var_3, var_5, var_6)) {
  if (_id_9E51())
  earthquake(randomfloatrange(0.15, 0.35), 1, self.origin, 200);

  var_8 = 1;
  }
  else if (!isdefined(self._id_ACDB) && var_9 != 0 && (_id_3DE4("exploder") || _id_9E51() && (_id_3DE4("emz") || _id_3DE4("fast")))) {
  earthquake(randomfloatrange(0.15, 0.35), 1, self.origin, 200);
  var_8 = 1;
  }
  }
  }
  }

  return var_8;
}

_id_FF69(var_0) {
  if (scripts\engine\utility::_id_9CEE(self._id_9CEC))
  return 0;

  if (isdefined(self._id_AD2B))
  return 0;

  if (isdefined(self.dontmutilate))
  return 0;

  if (isdefined(var_0._id_9E0C))
  return 0;

  if (scripts\engine\utility::_id_9CEE(var_0._id_9CDD))
  return 0;

  if (var_0.agent_type == "zombie_cop")
  return 0;

  if (var_0.agent_type == "zombie_brute")
  return 0;

  if (isdefined(self._id_8C14) && !self._id_8C14)
  return 0;

  if (isdefined(level.traversal_dismember_check))
  return [[level.traversal_dismember_check]](var_0);

  return 1;
}

_id_7FD6(var_0, var_1, var_2, var_3, var_4, var_5, var_6) {
  if (var_3 >= 1) {
  if (_id_3DE4("exploder"))
  return 31;
  }

  var_7 = _id_9E51();

  if (var_7)
  var_8 = 31;
  else
  var_8 = _id_AED2(var_0);

  var_9 = 1;

  if (isdefined(level._id_BDFC)) {
  var_10 = [[level._id_BDFC]](var_8, var_1, var_2, var_3, var_4, var_5, var_6);

  if (isdefined(var_10))
  var_8 = var_10;
  }

  if (var_8 == 0)
  return 0;

  var_9 = var_9 * (_id_7E78(var_4, var_1, undefined) * _id_7E78(var_4, undefined, var_2));
  var_9 = var_9 * (-0.7 * var_3 + 1);
  return _id_7FD7(var_8, var_5, var_3, var_9);
}

_id_C819(var_0, var_1, var_2, var_3, var_4, var_5, var_6) {
  return 0;
}

_id_9E51() {
  var_0 = scripts\engine\utility::_id_6E34("insta_kill") && scripts\engine\utility::_id_6E25("insta_kill");
  return var_0;
}

_id_AED2(var_0) {
  switch (var_0) {
  case "right_arm_lower":
  case "right_hand":
  case "right_arm_upper":
  return 1;
  case "left_hand":
  case "left_arm_lower":
  case "left_arm_upper":
  return 2;
  case "right_foot":
  case "right_leg_lower":
  case "right_leg_upper":
  return 4;
  case "left_foot":
  case "left_leg_lower":
  case "left_leg_upper":
  return 8;
  case "neck":
  case "helmet":
  case "head":
  return 16;
  default:
  return 0;
  }
}

_id_9E6C(var_0) {
  if (!isdefined(var_0))
  return 0;

  if (var_0 == "none")
  return 0;

  if (scripts\engine\utility::_id_9DC1(var_0))
  return 0;

  if (issubstr(var_0, "killstreak"))
  return 1;

  if (issubstr(var_0, "remote_tank_projectile"))
  return 1;

  if (issubstr(var_0, "minijackal_"))
  return 1;

  if (isdefined(level._id_A6C5) && isdefined(level._id_A6C5[var_0]))
  return 1;

  if (scripts\engine\utility::_id_9D33(var_0))
  return 1;

  var_1 = weaponinventorytype(var_0);

  if (isdefined(var_1) && var_1 == "exclusive")
  return 1;

  return 0;
}

_id_7E78(var_0, var_1, var_2) {
  if (_id_9E51())
  return 0;

  var_3 = undefined;

  if (isdefined(var_1)) {
  var_1 = getweaponbasename(var_1);
  var_3 = var_1;
  }
  else if (isdefined(var_2))
  var_3 = var_2;

  if (!isdefined(var_3))
  return 1;

  if (isdefined(level._id_566F) && isdefined(level._id_566F[var_3]))
  return level._id_566F[var_3];

  var_4 = 1.0;

  if (isdefined(var_0) && isplayer(var_0) && isdefined(var_1) && isdefined(var_4) && !_id_9E6C(var_1)) {
  var_4 = _id_3E61(var_0, var_1, var_4);
  return var_4;
  }
  else if (isdefined(var_4))
  return var_4;
  else
  return 1;
}

_id_3E61(var_0, var_1, var_2) {
  var_3 = 1.0;

  if (!isdefined(var_3))
  return var_2;

  var_4 = _id_8254(var_0, var_1);

  if (var_4 <= 1)
  return var_2;

  var_5 = var_2 - var_3;
  var_6 = var_2 - var_4 / 3 * var_5;
  return clamp(var_6, var_3, var_2);
}

_id_8254(var_0, var_1) {
  var_2 = getweaponbasename(var_1);

  if (!_id_8C3E(var_0, var_2))
  return 0;

  return var_0._id_13CD0[var_2]["level"];
}

_id_8C3E(var_0, var_1) {
  return isdefined(var_1) && isdefined(var_0._id_13CD0) && isdefined(var_0._id_13CD0[var_1]);
}

_id_7FD7(var_0, var_1, var_2, var_3) {
  var_4 = 0;

  if (!isdefined(var_3))
  var_3 = 1;

  var_5 = var_0 & var_0 - 1;

  if (var_5 > 0) {
  if (var_2 < 1) {
  var_6 = randomint(24);
  var_7 = 228;

  for (var_8 = 4; var_8 > 0; var_8--) {
  var_9 = 1 << var_6 % var_8 * 2;
  var_6 = int(var_6 / var_8);
  var_10 = var_7 % var_9;
  var_11 = int(var_7 / var_9);
  var_7 = var_10 + (var_11 >> 2) * var_9;
  var_12 = 1 << (var_11 & 3);

  if ((var_0 & var_12) != 0 && isdefined(_id_2C18(var_1 | var_4 | var_12))) {
  if (randomfloat(1.0) > _id_3C3B(var_12) * var_3)
  var_4 = var_4 | var_12;
  }
  }
  } else {
  while (var_0 > 0) {
  var_12 = var_0 & 0 - var_0;

  if (randomfloat(1.0) > _id_3C3B(var_12) * var_3)
  var_4 = var_4 | var_12;

  var_0 = var_0 - var_12;
  }
  }
  }
  else if (var_2 >= 1 || isdefined(_id_2C18(var_1 | var_0))) {
  var_13 = _id_3C3B(var_0) * var_3;
  var_14 = randomfloat(1.0);

  if (var_14 > var_13)
  var_4 = var_0;
  }

  return var_4;
}

_id_2C18(var_0) {
  switch (var_0) {
  case 1:
  return "zombie_missing_right_arm_animclass";
  case 2:
  return "zombie_missing_left_arm_animclass";
  case 4:
  return "zombie_missing_right_leg_animclass";
  case 8:
  return "zombie_missing_left_leg_animclass";
  case 12:
  return "zombie_crawl_animclass";
  case 0:
  return "zombie_asm_animclass";
  default:
  return undefined;
  }
}

_id_3C3B(var_0) {
  if (isdefined(level._id_719A))
  return self [[level._id_719A]](var_0);

  if (isdefined(self._id_8BCC) && var_0 != 16)
  return 1;

  switch (var_0) {
  case 1:
  return 0.45;
  case 2:
  return 0.45;
  case 4:
  return 0.5;
  case 8:
  return 0.5;
  case 16:
  if (isdefined(self._id_8BFE))
  return 1;

  return 0.65;
  default:
  return 1;
  }
}

_id_BDFB(var_0, var_1, var_2, var_3, var_4) {
  var_5 = 0;
  var_6 = 0;

  if (isdefined(var_1))
  var_6 = scripts\engine\utility::_id_9CEE(level._id_8EE6[var_1]);

  if (var_0 != self._id_B8BA) {
  var_7 = ~self._id_B8BA & var_0;

  if (_id_0A77::_id_9B97()) {
  if (!scripts\engine\utility::_id_9CEE(self._id_6622))
  return 0;
  }

  self._id_B8BA = var_0;
  var_8 = self._id_10916 < gettime();

  if (_id_46BA(var_7) >= 3) {
  if (var_8)
  self._id_DDC8 = var_7;

  var_8 = 0;
  self._id_74B5 = 1;
  self._id_C026 = 1;
  self._id_4E4C = "mutilate";
  }

  if ((var_7 & 1) != 0)
  _id_5394(1);

  if ((var_7 & 2) != 0)
  _id_5394(2);

  if ((var_7 & 4) != 0)
  _id_5394(4);

  if ((var_7 & 8) != 0)
  _id_5394(8);

  if ((var_7 & 16) != 0)
  _id_5394(16);

  var_9 = _id_2C18(var_0);

  if (isdefined(var_9)) {
  if (self._id_565C)
  var_8 = 0;

  if (!self._id_565C && (var_0 & 12) != 0)
  thread _id_10D81();

  if (var_8) {
  if (var_2 < 1)
  _id_0C72::_id_F6C8(var_0, var_6);
  else
  var_5 = 1;
  }
  }
  else
  var_5 = 1;

  if (var_5 && var_8)
  self._id_DDC8 = var_7;
  }

  return var_5;
}

_id_46BA(var_0) {
  for (var_1 = 0; var_0 > 0; var_0 = var_0 - (var_0 & 0 - var_0))
  var_1++;

  return var_1;
}

_id_5394(var_0) {
  if (isdefined(level.dismember_queue_func))
  [[level.dismember_queue_func]](var_0);

  level notify("dismember", self, var_0);

  switch (var_0) {
  case 1:
  self setscriptablepartstate("right_arm", "detached", 1);
  break;
  case 4:
  self setscriptablepartstate("right_leg", "detached", 1);
  break;
  case 2:
  self setscriptablepartstate("left_arm", "detached", 1);
  break;
  case 8:
  self setscriptablepartstate("left_leg", "detached", 1);
  break;
  case 16:
  playloopsound(self gettagorigin("j_neck"), "zombie_dismember_head");
  self setscriptablepartstate("head", "detached", 1);
  break;
  }
}

_id_6A58() {
  self endon("death");

  if (_id_5F70())
  return;

  if (isdefined(level._id_C01F))
  return;

  self setscriptablepartstate("eyes", "eye_glow_off");
  wait 0.1;

  if (_id_0C75::_id_9F87()) {
  self setscriptablepartstate("right_eye", "active");
  self setscriptablepartstate("left_eye", "active");
  }
  else if (scripts\engine\utility::_id_9CEE(self._id_9CEF))
  self setscriptablepartstate("eyes", "turned_eyes");
  else if (scripts\engine\utility::_id_9CEE(self._id_9BA7))
  self setscriptablepartstate("eyes", "cop_eyes");
  else
  self setscriptablepartstate("eyes", "yellow_eyes");
}

_id_7F75(var_0, var_1, var_2) {
  if (isdefined(level._id_566C[var_1])) {
  var_3 = level._id_566C[var_1][var_2];

  if (isdefined(var_3))
  return var_3;
  }

  var_3 = level._id_566C[var_0][var_2];
  return var_3;
}

_id_7F74(var_0, var_1) {
  var_2 = 40;

  switch (var_0) {
  case 2:
  case 1:
  return self.origin + (0, 0, var_2);
  case 8:
  case 4:
  var_3 = self gettagorigin(var_1);
  return (self.origin[0], self.origin[1], var_3[2]);
  case 16:
  return self gettagorigin(var_1);
  }
}

_id_CCDB(var_0) {
  scripts\engine\utility::waitframe();

  if (self.health > 0)
  self playsoundonmovingent(var_0);
  else
  self playsound(var_0);
}

_id_BDF8() {
  _id_BDFB(12);
}

_id_10D81() {
  self._id_2CA7 = undefined;
  self._id_565C = 1;
  thread _id_F34B();
  self _meth_828D(15);
  level._id_4878++;
  self waittill("death");
  level._id_4878--;
}

_id_F34B() {
  self endon("death");
  wait 0.5;
  self._id_9BAC = 1;
}

_id_C4E3(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9) {
  foreach (var_11 in level._id_BDFA) {
  if (isdefined(var_11[4]))
  self [[var_11[4]]](var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9);
  }
}

_id_BC5C() {
  level._id_13F3F = ["slow_walk", "walk", "run", "sprint"];

  if (!isdefined(level._id_BCE6)) {
  level._id_BCE6["slow_walk"][0] = 1;
  level._id_BCE6["slow_walk"][1] = 1;
  level._id_BCE6["walk"][0] = 1;
  level._id_BCE6["walk"][1] = 1;
  level._id_BCE6["run"][0] = 1;
  level._id_BCE6["run"][1] = 1;
  level._id_BCE6["sprint"][0] = 1.0;
  level._id_BCE6["sprint"][1] = 1.0;
  }

  if (!isdefined(level._id_C083)) {
  level._id_C083["slow_walk"] = 1.0;
  level._id_C083["walk"] = 1.0;
  level._id_C083["run"] = 1.0;
  level._id_C083["sprint"] = 1.0;
  }

  if (!isdefined(level._id_126EA)) {
  level._id_126EA[0] = 1.0;
  level._id_126EA[1] = 1.0;
  }

  if (!isdefined(level._id_13FA8)) {
  level._id_13FA8["slow_walk"] = 20;
  level._id_13FA8["walk"] = 20;
  level._id_13FA8["run"] = 24;
  level._id_13FA8["sprint"] = 32;
  }
}

_id_13F55() {
  self endon("death");

  if (isdefined(level._id_13BDD))
  var_0 = level._id_13BDD;
  else
  var_0 = 7;

  if (!isdefined(level._id_13BD3))
  level._id_13BD3 = 1;

  scripts\engine\utility::waitframe();
  self.speed_adjusted = undefined;
  self.speedup = undefined;
  thread speed_up_every_now_and_then();
  self._id_01F5 = _id_378F(var_0);
  var_1 = "";

  for (;;) {
  if (scripts\anim\notetracks_mp::_id_9F77() || self._id_1B03 == "traverse") {
  wait 0.05;
  continue;
  }

  if (isdefined(self._id_9E0C)) {
  wait 0.05;
  continue;
  }

  if (_id_0F74::_id_9D9E())
  self._id_BCE4 = 0.85;

  if (isdefined(level._id_BCCE[self.agent_type])) {
  var_2 = [[level._id_BCCE[self.agent_type]]](var_0);

  if (isdefined(var_2))
  self._id_01F5 = var_2;
  }

  if (var_1 != self._id_01F5) {
  var_1 = self._id_01F5;
  self._id_0293 = level._id_13FA8[self._id_01F5];

  if (isdefined(level._id_BCE5[self.agent_type]))
  self._id_BCE4 = [[level._id_BCE5[self.agent_type]]]();
  else
  self._id_BCE4 = 1;

  if (isdefined(level._id_C082[self.agent_type]))
  self._id_C081 = [[level._id_C082[self.agent_type]]]();
  else
  self._id_C081 = 1;

  if (isdefined(level._id_126E9[self.agent_type]))
  self._id_126E8 = [[level._id_126E9[self.agent_type]]]();
  else
  self._id_126E8 = 1;

  self._id_772A = self._id_126E8;

  if (_id_0F74::_id_9D9E()) {
  self._id_0293 = 100;
  self._id_BCE4 = 0.85;
  }

  scripts\asm\asm_bb::_id_2968(self._id_01F5);
  }

  if (self._id_01F5 == "sprint") {
  if (scripts\engine\utility::_id_9CEE(self.speedup)) {
  if (!isdefined(self.speed_adjusted)) {
  self.speed_adjusted = 1;
  self._id_BCE4 = 1.15;
  }
  }
  else if (isdefined(self.speedup)) {
  if (isdefined(level._id_BCE5[self.agent_type]))
  self._id_BCE4 = [[level._id_BCE5[self.agent_type]]]();
  else
  self._id_BCE4 = 1;

  self.speed_adjusted = undefined;
  self.speedup = undefined;
  }
  }

  scripts\engine\utility::_id_13736(1.0, "speed_debuffs_changed");
  }
}

speed_up_every_now_and_then() {
  self endon("death");

  for (;;) {
  if (!isdefined(self.speedup)) {
  if (randomint(100) < 25) {
  self.speedup = 1;
  wait 5;
  self.speedup = 0;
  }
  }

  wait 5;
  }
}

_id_378F(var_0) {
  if (_id_0C75::_id_9F87())
  return "sprint";

  if (scripts\engine\utility::_id_9CEE(self.is_skeleton))
  return "sprint";

  if (isdefined(self._id_BC4B))
  return self._id_BC4B;

  if (level._id_13BD3 == 1)
  return "slow_walk";

  var_1 = level._id_13BD3 * 4;
  var_2 = randomintrange(var_1, var_1 + 35);

  if (var_2 <= 32)
  return "slow_walk";
  else if (var_2 <= 55)
  return "walk";
  else if (var_2 <= 78)
  return "run";
  else
  return "sprint";
}

_id_372A(var_0) {
  var_1 = level._id_C083[var_0];
  var_1 = var_1 * _id_7E10();
  return var_1;
}

_id_372B(var_0) {
  var_1 = level._id_13BD3 - 1;

  if (isdefined(self._id_BCE3))
  var_1 = var_1 + self._id_BCE3;

  var_1 = int(clamp(var_1, 0, level._id_13F3F.size * var_0 - 1));
  return var_1;
}

_id_3729(var_0, var_1, var_2) {
  var_3 = _id_372B(var_0);
  var_4 = var_3 % var_0;

  if (var_0 < 2)
  var_5 = float(var_4) / 1;
  else
  var_5 = float(var_4) / float(var_0 - 1);

  var_6 = _id_0F74::_id_AB6F(var_5, var_1, var_2);

  if (_id_0C75::_id_9F87())
  var_6 = var_6 * 1.2;

  return var_6;
}

_id_372C(var_0, var_1, var_2) {
  var_3 = _id_372B(var_0);
  var_4 = var_3 / (level._id_13F3F.size * var_0 - 1.0);
  var_5 = _id_0F74::_id_AB6F(var_4, var_1, var_2);
  return var_5;
}

_id_7E10() {
  var_0 = 1;

  if (!isdefined(self._id_3170))
  return var_0;

  foreach (var_3, var_2 in self._id_3170) {
  if (!isdefined(var_2._id_109AF))
  continue;

  var_0 = var_0 * var_2._id_109AF;
  }

  return var_0;
}

_id_C5D2(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8) {
  if (_id_0C75::_id_9F87()) {
  if (isdefined(self.agent_type) && self.agent_type == "skater")
  self playsound("zmb_skater_explode");
  else
  self playsound("zmb_clown_explode");

  if (isdefined(var_1) && isplayer(var_1))
  scripts\common\fx::_id_D484(level._effect["suicide_zmb_death"], self.origin + (0, 0, 50), anglestoforward(self.angles), anglestoup(self.angles));
  else
  {
  scripts\common\fx::_id_D484(level._effect["suicide_zmb_explode"], self.origin + (0, 0, 50), anglestoforward(self.angles), anglestoup(self.angles));
  radiusdamage(self.origin + (0, 0, 40), 250, 50, 10, self, "MOD_EXPLOSIVE", "zombie_suicide_bomb");
  earthquake(0.4, 0.5, self.origin, 200);
  }

  scripts\mp\mp_agent::_id_5006(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8);
  return;
  }

  if (isdefined(self.vignette_nocorpse)) {
  self._id_C026 = 1;
  self._id_74B5 = 1;
  self.vignette_nocorpse = undefined;
  }

  _id_10926(self._id_1657, var_3, var_4);

  if (isdefined(self._id_6658)) {
  if (isdefined(self._id_BF2F)) {
  var_9 = _id_0D4D::_id_7872(self._id_6658, self._id_BF2F - 1);

  if (var_9 == "destroying")
  _id_0D4D::_id_F2E3(self._id_6658, self._id_BF2F - 1, "boarded");

  self._id_BF2F = undefined;
  }

  _id_0D4D::_id_E005(self._id_6658);
  self._id_6658 = undefined;
  }

  if (isdefined(self._id_24CA)) {
  _id_0D4D::_id_DF34(self._id_24CA);
  self._id_24CA = undefined;
  }

  scripts\mp\mp_agent::_id_5006(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8);
}

_id_10926(var_0, var_1, var_2) {
  if (isdefined(self._id_9E0C)) {
  self._id_C026 = 1;
  self playsound("forge_freeze_shatter");
  self setscriptablepartstate("frozen", "unfrozen");
  playfx(level._effect["zombie_freeze_shatter"], self.origin, anglestoforward(self.angles), anglestoup(self.angles));
  return;
  }

  if (!isdefined(self._id_2C09) && !scripts\engine\utility::_id_9CEE(self._id_74B5))
  return;

  var_3 = self._id_DDC8;

  if (!isdefined(var_3) && !scripts\engine\utility::_id_9CEE(self._id_74B5))
  return;

  if (self._id_74B5 || _id_46BA(var_3) >= 3) {
  thread _id_10840(var_0);
  return;
  }

  while (var_3 > 0) {
  var_4 = var_3 & 0 - var_3;
  thread _id_1083F(var_4, var_0);
  var_3 = var_3 - var_4;
  }
}

_id_10840(var_0) {
  var_1 = 3;

  if (isdefined(level._id_10A56) && level._id_10A56)
  var_1 = 1;

  var_2 = level._id_74B9 < var_1;

  if (var_2) {
  level._id_74B9++;
  var_3 = scripts\engine\utility::_id_7ECB("gib_full_body");
  }
  else
  var_3 = scripts\engine\utility::_id_7ECB("gib_full_body_cheap");

  if (isdefined(var_0)) {
  if (isdefined(var_0["emz"]))
  var_3 = scripts\engine\utility::_id_7ECB("gib_full_body_emz");
  else if (isdefined(var_0["exploder"]))
  var_3 = scripts\engine\utility::_id_7ECB("gib_full_body_exp");
  else if (isdefined(var_0["fast"]))
  var_3 = scripts\engine\utility::_id_7ECB("gib_full_body_ovr");
  }

  if (isdefined(self._id_828A))
  var_3 = scripts\engine\utility::_id_7ECB(self._id_828A);

  var_4 = level._id_566C["full"]["fxTagName"];

  if (isdefined(self._id_2C09))
  playfxontag(var_3, self._id_2C09, var_4);
  else
  scripts\common\fx::_id_D484(var_3, self.origin + (0, 0, 25));

  playloopsound(self.origin, "zombie_full_body_gib");
  wait 3;

  if (isdefined(self._id_2C09))
  stopfxontag(var_3, self._id_2C09, var_4);

  if (var_2)
  level._id_74B9--;
}

_id_C4BD(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9) {
  var_10 = self._id_164D[self._id_238F]._id_4BC0;
  var_11 = anim._id_2303[self._id_238F]._id_10E2F[var_10];
  var_12 = scripts\mp\mp_agent::_id_FF32(self);

  if (isdefined(self._id_C026))
  var_12 = 0;

  var_13 = isdefined(self.ragdollimpactvector);

  if (scripts\asm\asm_mp::_id_2382(self._id_238F, var_11)) {
  if (!var_12 || !scripts\engine\utility::_id_9CEE(self._id_9CEC))
  scripts\asm\asm::_id_231E(self._id_238F, var_11, var_10);
  }

  if (isdefined(self._id_C026)) {
  if (_id_0A77::_id_9C42(var_4)) {
  var_14 = self cloneagent(var_8, 1);
  var_14 hide(1);
  }

  return;
  }

  var_15 = self;

  if (isdefined(self._id_8B66) && isdefined(level._id_FF3C)) {
  if ([[level._id_FF3C]](var_1, self.origin))
  self setscriptablepartstate("backpack", "hide", 1);
  }

  if (isdefined(self.ragdollhitloc)) {
  self._id_2C09 = self cloneagent(var_8, var_12);
  self._id_2C09.ragdollhitloc = self.ragdollhitloc;
  self._id_2C09.ragdollimpactvector = self.ragdollimpactvector;
  }
  else
  self._id_2C09 = self cloneagent(var_8, var_12);

  if (isdefined(self._id_9B81) || isdefined(var_1) && isdefined(var_4) && var_4 == "incendiary_ammo_mp")
  self._id_2C09 setscriptablepartstate("burning", "active", 1);
  else if (isdefined(self._id_10A57))
  self._id_2C09 setscriptablepartstate("spoon", "active", 1);
  else if (isdefined(self.electrocuted))
  self._id_2C09 setscriptablepartstate("electrocuted", "active");

  if (isdefined(self._id_CE65))
  self._id_2C09 thread _id_5774(self._id_CE65, scripts\engine\utility::_id_9CEE(self._id_9CEC));

  if (scripts\engine\utility::_id_9CEE(var_12))
  scripts\mp\mp_agent::_id_5793(self._id_2C09);
  else if (scripts\engine\utility::_id_9CEE(var_13))
  thread velocityragdoll(self._id_2C09, var_6, var_5, var_4, var_0, var_3);
  else if (!scripts\engine\utility::_id_9CEE(self.death_anim_no_ragdoll))
  thread scripts\mp\mp_agent::_id_5124(self._id_2C09, var_6, var_5, var_4, var_0, var_3);

  self.death_anim_no_ragdoll = undefined;
}

velocityragdoll(var_0, var_1, var_2, var_3, var_4, var_5) {
  if (isdefined(level._id_C08A) && level._id_C08A.size) {
  foreach (var_7 in level._id_C08A) {
  if (distancesquared(var_0.origin, var_7.origin) < 65536)
  return;
  }
  }

  if (!isdefined(var_0))
  return;

  if (var_0 _meth_81B7())
  return;

  if (isdefined(var_0)) {
  if (isdefined(var_0.ragdollhitloc) && isdefined(var_0.ragdollimpactvector))
  var_0 _meth_839B(var_0.ragdollhitloc, var_0.ragdollimpactvector);
  else
  var_0 startragdoll();
  }
}

_id_5774(var_0, var_1) {
  if (!scripts\engine\utility::_id_9CEE(var_1))
  wait(var_0);

  if (isdefined(self)) {
  self setscriptablepartstate("death_fx", "active", 1);
  wait 0.1;
  self hide(1);
  }
}

_id_1083F(var_0, var_1) {
  var_2 = level._id_566C[var_0]["torsoFX"];

  if (isdefined(var_1)) {
  if (isdefined(var_1["emz"]))
  var_2 = var_2 + "_emz";
  else if (isdefined(var_1["exploder"]))
  var_2 = var_2 + "_exp";
  else if (isdefined(var_1["fast"]))
  var_2 = var_2 + "_ovr";
  }

  playfxontag(scripts\engine\utility::_id_7ECB(var_2), self._id_2C09, level._id_566C[var_0]["fxTagName"]);
  wait 10;

  if (isdefined(self._id_2C09))
  stopfxontag(scripts\engine\utility::_id_7ECB(var_2), self._id_2C09, level._id_566C[var_0]["fxTagName"]);
}

_id_B9B9() {
  self endon("death");
  level endon("game_ended");
  var_0 = gettime();
  var_1 = self.origin;
  var_2 = var_0;
  var_3 = 0;
  var_4 = 5.0;

  for (;;) {
  wait(var_4);
  var_5 = distancesquared(self.origin, var_1);
  var_6 = (gettime() - var_2) / 1000;
  var_7 = var_5 > 16384;
  var_8 = scripts\engine\utility::_id_9CEE(self._id_1198._id_2BDE);

  if (var_7 || var_8) {
  var_1 = self.origin;
  var_2 = gettime();
  }
  else if (var_6 > 35) {
  if (var_6 > 55) {
  var_3 = 1;
  break;
  }
  }

  if (_id_3E0A(var_0, 180, 240))
  break;
  }

  if (var_3 && _id_10065())
  thread _id_DE06(self.agent_type);

  _id_A632(self);
}

_id_BA27() {
  self endon("death");
  level endon("game_ended");
  var_0 = 0;

  for (;;) {
  if (length(self _meth_816B()) == 0 && self._id_1B03 == "move")
  var_0 = var_0 + 0.05;
  else
  var_0 = 0;

  if (var_0 > 2.0) {
  var_1 = self _meth_8148();

  if (isdefined(var_1)) {
  var_2 = distancesquared(self.origin, var_1.origin);

  if (var_2 < squared(15))
  self setorigin(var_1.origin, 0);
  }
  }

  wait 0.05;
  }
}

_id_3E0A(var_0, var_1, var_2) {
  if (isdefined(self._id_932A) && self._id_932A)
  return 0;

  var_3 = (gettime() - var_0) / 1000;

  if (var_3 > var_1) {
  if (var_3 > var_2)
  return 1;
  }

  return 0;
}

_id_10065() {
  if (!isdefined(level._id_1CB5))
  return 0;

  return _id_800D() > 1;
}

_id_800D() {
  var_0 = scripts\mp\mp_agent::_id_7D95("all");
  var_1 = 0;

  foreach (var_3 in var_0) {
  if (var_3.team == level._id_6575)
  var_1++;
  }

  return var_1;
}

_id_DE06(var_0) {
  if (!isdefined(level._id_DE07))
  level._id_DE07 = 0;

  level._id_DE07++;

  while (scripts\mp\mp_agent::_id_8008() >= level._id_B497 || isdefined(level._id_DE08))
  scripts\engine\utility::waitframe();

  level._id_DE08 = 1;
  wait 0.2;
  level._id_DE08 = undefined;
  level._id_DE07--;

  if (level._id_DE07 < 0)
  level._id_DE07 = 0;
}

_id_A012() {
  if (!isdefined(level._id_13F60))
  return 0;

  return level._id_13F60;
}

_id_A632(var_0) {
  var_0 _meth_80B0(var_0.health + 500000, var_0.origin);
}

_id_13F9F(var_0, var_1) {
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

_id_13FA0() {
  self endon("death");
  level endon("game_ended");
  self endon("traverse_end");

  for (;;) {
  _id_13F9F(3600, 100);
  scripts\engine\utility::waitframe();
  }
}

_id_13F99() {
  self endon("death");
  self endon("game_ended");

  for (;;) {
  self waittill("traverse_begin");
  _id_13FA0();
  }
}
