/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2667.gsc
***************************************/

_id_13CCB() {
  level._id_B4BA = max(_id_0A77::_id_7F1D("scr_maxPerPlayerExplosives", 2), 4);
  level._id_E55D = _id_0A77::_id_7F1D("scr_riotShieldXPBullets", 15);
  level._id_31CF = ::_id_E469;
  level._id_13C7D = [];
  level._id_13BE7 = 0;
  level._id_13CAD = 0;
  level._id_5AFD = 0;
  level._id_13C9D = 0;
  _id_31D5();
  _id_BD67();
  _id_9802();
  _id_FACC();
  _id_FA9D();
  level thread _id_C56E();
  _id_A033();
  scripts\engine\utility::_id_22D2(getentarray("misc_turret", "classname"), ::_id_12A13);
}

heart_power_init() {
  scripts\engine\utility::_id_6E4C("interactions_initialized");
  _id_0D15::_id_D787("power_heart", ::powerheartset, ::takeheart, undefined, undefined, "heart_used", undefined);
}

eye_power_init() {
  scripts\engine\utility::_id_6E4C("interactions_initialized");
  _id_0D15::_id_D787("power_rat_king_eye", ::powereyeset, ::takerateye, ::eye_activated, undefined, undefined, undefined);
}

powerheartset(var_0) {
  self.has_heart = 1;
}

powereyeset(var_0) {
  self.has_eye = 1;
}

blank(var_0) {}

_id_9802() {
  level._effect["weap_blink_friend"] = loadfx("vfx/core/mp/killstreaks/vfx_detonator_blink_cyan.vfx");
  level._effect["weap_blink_enemy"] = loadfx("vfx/core/mp/killstreaks/vfx_detonator_blink_cyan.vfx");
  level._effect["emp_stun"] = loadfx("vfx/core/mp/equipment/vfx_emp_grenade");
  level._effect["equipment_explode_big"] = loadfx("vfx/core/mp/killstreaks/vfx_ims_explosion");
  level._effect["equipment_smoke"] = loadfx("vfx/core/mp/killstreaks/vfx_sg_damage_blacksmoke");
  level._effect["equipment_sparks"] = loadfx("vfx/core/mp/killstreaks/vfx_sentry_gun_explosion.vfx");
  level._id_A6D2["spark"] = loadfx("vfx/iw7/_requests/mp/vfx_kinetic_pulse_shock");
  level._effect["gas_grenade_smoke_enemy"] = loadfx("vfx/old/_requests/mp_weapons/vfx_poison_gas_enemy");
  level._effect["equipment_smoke"] = loadfx("vfx/core/mp/killstreaks/vfx_sg_damage_blacksmoke");
  level._effect["placeEquipmentFailed"] = loadfx("vfx/core/mp/killstreaks/vfx_ballistic_vest_death");
  level._effect["penetration_railgun_explosion"] = loadfx("vfx/iw7/core/expl/weap/chargeshot/vfx_expl_chargeshot.vfx");
}

_id_FACC() {
  var_0 = 70;
  level._id_4023 = cos(var_0);
  level._id_4025 = 20;
  level._id_4024 = 0.75;
  level._id_4027 = 192;
  level._id_B76D = 0.3;
  level._id_B76F = 150;
  level._id_B76E = 20;
  level._id_B76B = 256;
  level._id_B769 = 600;
  level._id_B768 = 1200;
  level._id_B766 = 300;
  level._id_B77B = 600;
  level._id_B762 = loadfx("vfx/core/impacts/bouncing_betty_launch_dirt");
  level._id_B761 = loadfx("vfx/core/expl/bouncing_betty_explosion.vfx");
  level._id_5113 = 1.5;
  level._id_334B = 0;
  level._id_B779 = [];
}

_id_FA9D() {
  var_0 = spawnstruct();
  var_0._id_B760["enemy"] = loadfx("vfx/core/equipment/light_c4_blink.vfx");
  var_0._id_B760["friendly"] = loadfx("vfx/misc/light_mine_blink_friendly");
  level._id_13C7D["c4_zm"] = var_0;
  var_0 = spawnstruct();
  var_0._id_01F1 = "prop_mp_speed_strip_temp";
  var_0._id_2C68 = "prop_mp_speed_strip_temp";
  var_0._id_226E = 0.05;
  var_0._id_13370 = "tag_origin";
  var_0._id_B769 = 0;
  var_0._id_B768 = 0;
  var_0._id_C5B4 = "motion_click";
  var_0._id_C54C = "motion_spin";
  var_0._id_C525 = "motion_explode_default";
  var_0._id_AAB0 = 64;
  var_0._id_AAB7 = 0.65;
  var_0._id_C5B3 = _id_0D04::_id_2B41;
  var_0._id_C524 = _id_0D04::_id_2B40;
  var_0._id_8C7A = 20;
  var_0._id_B76F = 200;
  var_0._id_B76E = 100;
  level._id_13C7D["blackhole_grenade_mp"] = var_0;
  level._id_13C7D["blackhole_grenade_zm"] = var_0;
  var_0 = spawnstruct();
  var_0._id_217C = 1.5;
  var_0._id_53B6 = 232;
  var_0._id_53B5 = 512;
  var_0._id_53B4 = 1;
  var_0._id_8C7A = 20;
  var_0._id_A640 = 12;
  level._id_13C7D["proximity_explosive_mp"] = var_0;
  var_0 = spawnstruct();
  var_1 = 800;
  var_2 = 200;
  var_0._id_DC05 = var_1 * var_1;
  var_0._id_DC06 = var_2 * var_2;
  var_0._id_C525 = "flashbang_explode_default";
  var_0._id_1336F = 72;
  level._id_13C7D["flash_grenade_mp"] = var_0;
}

_id_A033() {
  _id_0D14::_id_D687();
  _id_0A4C::init();
  _id_42DC();
  _id_11819();
}

_id_11819() {
  level._effect["throwingknifec4_explode"] = loadfx("vfx/iw7/_requests/mp/power/vfx_bio_spike_exp.vfx");
}

_id_42DC() {
  level._effect["clusterGrenade_explode"] = loadfx("vfx/iw7/_requests/mp/vfx_cluster_gren_single_runner.vfx");
}

_id_BD67() {
  var_0 = ["mp/statstable.csv", "cp/zombies/mode_string_tables/zombies_statstable.csv"];
  level._id_13CA5 = [];

  foreach (var_2 in var_0) {
  for (var_3 = 1; tablelookup(var_2, 0, var_3, 0) != ""; var_3++) {
  var_4 = tablelookup(var_2, 0, var_3, 4);

  if (var_4 != "") {
  level._id_13CA5[var_4] = spawnstruct();
  var_5 = tablelookup(var_2, 0, var_3, 0);

  if (var_5 != "")
  level._id_13CA5[var_4]._id_C211 = var_5;

  var_6 = tablelookup(var_2, 0, var_3, 1);

  if (var_6 != "")
  level._id_13CA5[var_4]._id_8677 = var_6;

  var_7 = tablelookup(var_2, 0, var_3, 5);

  if (var_7 != "")
  level._id_13CA5[var_4]._id_CA2E = var_7;

  var_8 = tablelookup(var_2, 0, var_3, 9);

  if (var_8 != "") {
  if (isdefined(level._id_13CA5[var_4]._id_2476)) {
  if (level._id_13CA5[var_4]._id_2476 == "none")
  level._id_13CA5[var_4]._id_2476 = undefined;
  else
  level._id_13CA5[var_4]._id_2476 = strtok(var_8, " ");
  }
  else
  level._id_13CA5[var_4]._id_2476 = strtok(var_8, " ");
  }

  level._id_13CA5[var_4]._id_F1A8 = [];
  level._id_13CA5[var_4]._id_F1A9 = [];

  for (var_9 = 0; var_9 < 20; var_9++) {
  var_10 = tablelookup(var_2, 0, var_3, 10 + var_9);

  if (isdefined(var_10) && var_10 != "") {
  var_11 = level._id_13CA5[var_4]._id_F1A8.size;
  level._id_13CA5[var_4]._id_F1A8[var_11] = var_10;
  level._id_13CA5[var_4]._id_F1A9[var_10] = 1;
  }
  }

  var_12 = tablelookup(var_2, 0, var_3, 8);

  if (var_12 != "") {
  var_12 = float(var_12);
  level._id_13CA5[var_4]._id_02B3 = var_12;
  }
  }
  }
  }
}

_id_3223() {
  var_0 = "mp/statstable.csv";
  var_1 = level._id_7666;
  level._id_13CA3 = [];
  level._id_13CA2 = [];
  level._id_13CA4 = [];
  var_2 = 0;
  var_3 = 1;

  for (var_4 = 1; var_3 || var_4; var_2++) {
  if (tablelookup(var_0, 0, var_2, 0) == "")
  var_3 = 0;

  var_5 = tablelookup(var_0, 0, var_2, 4);
  var_6 = tablelookup(var_0, 0, var_2, 5);

  if (var_6 != "") {
  if (var_5 != "")
  level._id_13CA3[var_5] = var_6;
  }

  var_7 = tablelookup(var_0, 0, var_2, 9);

  if (var_7 != "") {
  if (var_5 != "")
  level._id_13CA2[var_5] = strtok(var_7, " ");
  }

  var_8 = tablelookup(var_0, 0, var_2, 8);

  if (var_8 != "") {
  if (var_5 != "") {
  var_8 = float(var_8);
  level._id_13CA4[var_5] = float(var_8);
  }
  }

  if (var_4) {
  if (tablelookup(var_1, 0, var_2, 0) == "")
  var_4 = 0;

  var_5 = tablelookup(var_1, 0, var_2, 4);
  var_6 = tablelookup(var_1, 0, var_2, 5);

  if (var_6 != "") {
  if (var_5 != "")
  level._id_13CA3[var_5] = var_6;
  }

  var_7 = tablelookup(var_1, 0, var_2, 9);

  if (var_7 != "") {
  if (var_5 != "")
  level._id_13CA2[var_5] = strtok(var_7, " ");
  }

  var_8 = tablelookup(var_1, 0, var_2, 8);

  if (var_8 != "") {
  if (var_5 != "") {
  var_8 = float(var_8);
  level._id_13CA4[var_5] = float(var_8);
  }
  }
  }
  }
}

_id_B77C() {
  self playsound(self._id_451C._id_C54C);
  playfx(self._id_451C._id_AABB, self.origin);

  if (isdefined(self.trigger))
  self.trigger delete();

  self _meth_8187("tag_sensor");
  _id_11061();
  var_0 = spawn("script_model", self.origin);
  var_0.angles = self.angles;
  var_0 setmodel(self._id_451C._id_01F1);
  var_0 _meth_8187("tag_base");
  var_0._id_451C = self._id_451C;
  self._id_F232 = var_0;
  var_1 = self.origin + (0, 0, self._id_451C._id_AAB0);
  var_2 = self._id_451C._id_AAB7;
  var_3 = self._id_451C._id_AAB7 + 0.1;
  var_0 moveto(var_1, var_3, 0, var_2);
  var_0 rotatevelocity((0, 1100, 32), var_3, 0, var_2);
  var_0 thread _id_D537();
  wait(var_2);
  self notify("detonateExplosive");
}

_id_D537() {
  if (isdefined(self._id_451C._id_B763)) {
  self endon("death");
  var_0 = gettime() + 1000;

  while (gettime() < var_0) {
  wait 0.05;
  playfxontag(self._id_451C._id_B763, self, "tag_fx_spin1");
  playfxontag(self._id_451C._id_B763, self, "tag_fx_spin3");
  wait 0.05;
  playfxontag(self._id_451C._id_B763, self, "tag_fx_spin2");
  playfxontag(self._id_451C._id_B763, self, "tag_fx_spin4");
  }
  }
}

_id_B764() {
  self playsound(self._id_451C._id_C54C);
  playfx(level._id_B762, self.origin);

  if (isdefined(self.trigger))
  self.trigger delete();

  var_0 = self.origin + (0, 0, 64);
  self moveto(var_0, 0.7, 0, 0.65);
  self._id_A63A moveto(var_0 + self._id_A640, 0.7, 0, 0.65);
  self rotatevelocity((0, 750, 32), 0.7, 0, 0.65);
  thread _id_D537();
  wait 0.65;
  self notify("detonateExplosive");
}

_id_12A13() {
  for (;;) {
  self waittill("trigger", var_0);
  thread _id_12A1F(var_0);
  }
}

_id_12A1F(var_0) {
  var_0 endon("death");
  var_0 endon("disconnect");
  var_0 notify("weapon_change", "none");
  self waittill("turret_deactivate");
  var_0 notify("weapon_change", var_0 getcurrentweapon());
}

_id_C56E() {
  for (;;) {
  level waittill("connected", var_0);
  var_0._id_9042 = 0;
  var_0 thread onplayerspawned();
  var_0 thread _id_13AD5();
  var_0 thread _id_103B4();
  }
}

giverateye(var_0) {
  self.has_eye = 1;
  thread eye_activated(self);
}

takerateye(var_0) {
  self.has_eye = undefined;
  self notify("remove_eye");
}

eye_activated(var_0) {
  self.wearing_rat_king_eye = 1;
  level notify("rat_king_eye_activated", self);

  if (scripts\engine\utility::_id_6E34("rk_fight_started") && !scripts\engine\utility::_id_6E25("rk_fight_started")) {
  thread handleratvisionburst(self);
  self setscriptablepartstate("rat_king_eye_light", "active");
  thread reapply_visionset_after_host_migration();
  thread watch_for_eye_remove();
  }
}

reapply_visionset_after_host_migration() {
  self endon("death");
  self endon("disconnect");
  self endon("removing_eye_from_player");
  level waittill("host_migration_begin");
  level waittill("host_migration_end");

  if (scripts\engine\utility::_id_9CEE(self.wearing_rat_king_eye))
  self setscriptablepartstate("rat_king_eye_light", "active");
}

watch_for_eye_remove() {
  self notify("watch_for_eye_remove");
  self endon("watch_for_eye_remove");
  wait 5;

  if (scripts\engine\utility::_id_9CEE(self.wearing_rat_king_eye))
  remove_eye_effects();
}

remove_eye_effects() {
  self.wearing_rat_king_eye = 0;
  level notify("rat_king_eye_deactivated");
  self notify("remove_eye");

  if (isdefined(level._id_13445))
  self visionsetnakedforplayer(level._id_13445, 0.1);
  else
  self visionsetnakedforplayer("", 0.1);

  self setscriptablepartstate("rat_king_eye_light", "neutral");
}

_id_103B4() {
  self endon("death");
  self endon("disconnect");
  level endon("game_ended");
  var_0 = undefined;

  for (;;) {
  self waittill("weapon_fired");

  if (self getstance() != "prone")
  continue;

  if (_id_0A77::_id_4626(self getcurrentweapon()) != "weapon_sniper")
  continue;

  var_1 = anglestoforward(self.angles);

  if (!isdefined(var_0) || gettime() - var_0 > 2000) {
  var_0 = gettime();
  continue;
  }
  }
}

unset_scriptable_part_state_after_time(var_0, var_1) {
  self endon("death");
  wait(var_0);
  self setscriptablepartstate("projectile", "inactive");
  var_1 notify("ranged_katana_missile_done");

  if (isdefined(self))
  self delete();
}

_id_13AD5() {
  self endon("disconnect");

  for (;;) {
  var_0 = _id_137A6();

  switch (var_0._id_13C2E) {
  case "remotemissile_projectile_mp":
  var_0 thread _id_858A();
  case "iw7_harpoon_zm":
  break;
  case "iw7_harpoon3_zm":
  var_0 thread runharpoontraplogic(var_0, self);
  break;
  case "iw7_blackholegun_mp":
  var_0 thread _id_0A4C::_id_B8B1(var_0._id_13C2E, var_0);
  break;
  case "iw7_harpoon1_zm":
  var_0.owner thread alt_acid_rain_dud_explode(var_0);
  break;
  case "iw7_harpoon4_zm":
  var_0.owner thread thundergun_harpoon_dud_explode(var_0);
  var_0.owner thread thundergun_harpoon(var_0._id_13C2E, var_0);
  break;
  case "iw7_harpoon2_zm":
  var_0.owner thread ben_franklin_harpoon_dud_explode(var_0);
  var_0.owner thread ben_franklin_harpoon(var_0);
  break;
  default:
  break;
  }
  }
}

ben_franklin_harpoon_activate(var_0, var_1, var_2) {
  self endon("death");
  self endon("disconnect");
  level endon("game_ended");
  var_3 = level._effect["hammer_of_dawn_lightning"];
  level notify("ben_franklin_lightning_pos", var_0);
  playfx(var_3, var_0, anglestoforward(self.angles), anglestoup(self.angles));
  playloopsound(var_0, "harpoon2_impact");
  thread run_stun_logic(var_0, var_1, var_2, var_3);
}

run_stun_logic(var_0, var_1, var_2, var_3) {
  self endon("death");
  self endon("disconnected");
  level endon("game_ended");
  var_4 = anglestoforward(self.angles);
  var_4 = vectornormalize(var_4);
  var_4 = var_4 * 100;
  var_5 = -1 * var_4;
  var_6 = anglestoleft(self.angles);
  var_6 = vectornormalize(var_6);
  var_6 = var_6 * 100;
  var_7 = -1 * var_6;

  if (isdefined(var_1)) {
  var_1._id_C026 = 1;
  var_1._id_74B5 = 1;
  }

  var_8 = "reload_zap_screen";
  var_9 = max(1000, 0.5 * var_2);
  self _meth_8253(var_0, 128, var_9, var_9, self, "MOD_GRENADE_SPLASH", "iw7_harpoon2_zm_stun");
  scripts\engine\utility::waitframe();

  if (distance2dsquared(self.origin, var_0) <= 16384)
  playfxontagforclients(level._effect[var_8], self, "tag_eye", self);

  wait 0.25;
  var_10 = _id_0A4A::_id_7DB0("axis");
  var_11 = 65536;
  var_8 = "reload_zap_m";

  foreach (var_13 in var_10) {
  if (var_13.agent_type == "slasher" || var_13.agent_type == "superslasher")
  continue;

  if (distancesquared(var_13.origin, var_0) < var_11) {
  var_14 = var_13 gettagorigin("j_spineupper");
  var_13 thread _id_13E63(1, self);
  playfx(var_3, var_13.origin);
  }
  }

  if (isdefined(level.played_acid_rain_effect))
  level.played_ben_franklin_effect = undefined;
}

play_stun_fx(var_0, var_1, var_2, var_3, var_4) {
  var_5 = "reload_zap_m";
  playloopsound(var_4, "perk_blue_bolts_sparks");
  playfx(level._effect[var_5], var_4 + var_0);
  scripts\engine\utility::waitframe();
  playfx(level._effect[var_5], var_4 + var_1);
  scripts\engine\utility::waitframe();
  playfx(level._effect[var_5], var_4 + var_2);
  scripts\engine\utility::waitframe();
  playfx(level._effect[var_5], var_4 + var_3);
  scripts\engine\utility::waitframe();
}

_id_13E63(var_0, var_1) {
  self endon("death");
  self._id_11196 = 1;
  thread _id_0D53::_id_20E6(self);

  while (var_0 > 0) {
  self._id_11190 = gettime() + 1500.0;
  wait 0.1;
  self _meth_80B0(1, self.origin, var_1, var_1, "MOD_GRENADE_SPLASH", "iw7_harpoon2_zm_stun");
  var_0 = var_0 - 1;
  wait 1.5;
  }

  self._id_11196 = undefined;
}

ben_franklin_harpoon_dud_explode(var_0) {
  self endon("disconnect");
  self endon("death");
  var_0 waittill("death");

  if (isdefined(var_0.origin))
  thread ben_franklin_harpoon_activate(var_0.origin, undefined, 500000000);

  self notify("remove_this_function_since_you_missed_zomb");
}

ben_franklin_harpoon(var_0) {
  self endon("disconnect");
  self endon("death");
  level endon("game_ended");
  self endon("remove_this_function_since_you_missed_zomb");
  self waittill("zombie_hit_by_ben", var_1, var_2, var_3);
  thread ben_franklin_harpoon_activate(var_1, var_2, var_3);
}

thundergun_harpoon_dud_explode(var_0) {
  self endon("disconnect");
  self endon("death");
  var_0 waittill("death");
  var_1 = var_0.origin;

  if (isdefined(var_0.origin)) {
  var_2 = _id_0A4A::_id_7DB0("axis");
  var_3 = 160000;

  foreach (var_5 in var_2) {
  if (!isdefined(var_5))
  continue;

  if (!isdefined(var_5.agent_type))
  continue;

  if (distancesquared(var_5.origin, var_1) < var_3) {
  var_5._id_5793 = 1;
  var_5._id_5502 = 1;
  var_5._id_4C87 = 1;
  playloopsound(var_5.origin, "perk_blue_bolts_sparks");
  var_6 = anglestoforward(self.angles);
  var_7 = vectornormalize(var_6) * -100;

  if (isdefined(var_5.agent_type) && (var_5.agent_type != "slasher" && var_5.agent_type != "superslasher"))
  var_5 _meth_8366(vectornormalize(var_5.origin - (self.origin + var_7)) * 800 + (200, 0, 200));

  wait 0.2;
  var_5._id_C026 = 1;
  var_5._id_74B5 = 1;

  if (isdefined(var_5.agent_type) && (var_5.agent_type == "slasher" || var_5.agent_type == "superslasher"))
  var_5 _meth_80B0(var_5.health, var_5.origin, self, self, "MOD_UNKNOWN", "iw7_harpoon4_zm");
  else
  var_5 _meth_80B0(var_5.health + 1000, var_5.origin, self, self, "MOD_UNKNOWN", "iw7_harpoon4_zm");
  }
  }
  }

  self notify("remove_this_function_since_you_missed_zomb");
}

fling_zombie_thundergun_harpoon(var_0, var_1, var_2, var_3) {
  self endon("death");
  var_3 endon("death");

  if (!isdefined(var_3))
  return;

  var_3.angles = vectortoangles(var_1.origin - var_3.origin) + (0, 0, 180);
  var_4 = var_1.origin - var_3.origin;
  var_5 = anglestoforward(var_2.angles);
  var_6 = vectornormalize(var_5) * -100;
  self _meth_8366(vectornormalize(self.origin - (var_2.origin + var_6)) * 800 + (200, 0, 200));
  wait 0.16;

  if (isdefined(var_2)) {
  var_1._id_5793 = 1;
  var_1._id_5502 = 1;
  var_1._id_4C87 = 1;
  wait 0.1;
  var_1._id_C026 = 1;
  var_1._id_74B5 = 1;
  self _meth_80B0(self.health + 1000, var_1.origin, var_2, var_2, "MOD_UNKNOWN", "iw7_harpoon4_zm");
  } else {
  self._id_C026 = 1;
  self._id_74B5 = 1;
  self _meth_80B0(self.health + 1000, var_1.origin, var_1, var_1, "MOD_UNKNOWN", "iw7_harpoon4_zm");
  }
}

thundergun_harpoon(var_0, var_1) {
  self endon("disconnect");
  self endon("death");
  level endon("game_ended");
  self endon("remove_this_function_since_you_missed_zomb");
  var_2 = 256;
  var_3 = _id_0A4A::_id_7DB0("axis");
  var_4 = self.angles;
  var_5 = self geteye();

  while (isdefined(var_1)) {
  var_6 = scripts\engine\utility::_id_782F(var_1.origin, var_3, undefined, 24, var_2);
  self.closestenemies = var_6;
  var_7 = 0;

  foreach (var_9 in self.closestenemies) {
  if (!isdefined(var_9.agent_type))
  continue;

  if (isdefined(var_1)) {
  if (distance2dsquared(var_1.origin, var_9.origin) < 16384) {
  if (isdefined(var_9.agent_type) && (var_9.agent_type == "slasher" || var_9.agent_type == "superslasher"))
  var_9 _meth_80B0(var_9.health, var_9.origin, self, self, "MOD_UNKNOWN", "iw7_harpoon4_zm");
  else
  var_9 thread fling_zombie_thundergun_harpoon(var_9.health + 1000, var_9, self, var_1);

  scripts\engine\utility::waitframe();
  }
  }
  }

  scripts\engine\utility::waitframe();
  }
}

alt_acid_rain_launch_projectile_during_trail(var_0) {
  var_0 endon("death");

  while (isdefined(var_0)) {
  wait 0.3;

  if (!isdefined(var_0.origin) || !isdefined(var_0.angles))
  return;

  var_1 = vectortoangles(anglestoup(var_0.angles));
  thread alt_acid_rain_activate(var_0.origin + (0, 0, 5), var_1);
  scripts\engine\utility::waitframe();
  thread alt_acid_rain_activate(scripts\engine\utility::_id_5D14(var_0.origin), var_0.angles);
  wait 0.3;
  }
}

alt_acid_rain_dud_explode(var_0) {
  self endon("disconnect");
  self endon("death");
  var_1 = scripts\engine\trace::_id_48BC(0, 1, 1, 1, 1, 0, 1);
  var_2 = var_0.angles;
  var_3 = var_0.origin;
  var_0 waittill("death");

  if (!isdefined(var_0.origin))
  return;

  playfx(level._effect["acid_rain_explosion"], var_0.origin);
  scripts\engine\utility::waitframe();
  playfx(level._effect["acid_rain"], var_0.origin);
  var_4 = gettime();
  var_5 = var_0.origin;
  var_6 = spawn("trigger_radius", var_0.origin, 0, 128, 64);
  var_6 thread deal_damage_to_enemies(self, var_4);
  var_6 thread delete_after_time(self, var_4);
}

delete_after_time(var_0, var_1) {
  var_0 endon("death");
  self endon("death");

  while (gettime() <= var_1 + 3400)
  scripts\engine\utility::waitframe();

  if (isdefined(level.played_acid_rain_effect))
  level.played_acid_rain_effect = undefined;

  self delete();
}

deal_damage_to_enemies(var_0, var_1) {
  var_0 endon("death");
  self endon("death");

  while (gettime() <= var_1 + 3400) {
  self waittill("trigger", var_2);

  if (!isdefined(var_2))
  continue;

  if (!var_2 _id_0A77::_id_9D20())
  continue;

  if (isdefined(var_0)) {
  if (var_2.agent_type == "slasher" || var_2.agent_type == "superslasher")
  var_2 _meth_80B0(0.1 * var_2.maxhealth, var_2.origin, var_0, var_0, "MOD_RIFLE_BULLET", "iw7_harpoon1_zm");
  else
  {
  playfx(level._effect["acid_rain"], var_2.origin);
  var_2 _meth_80B0(var_2.maxhealth, var_2.origin, var_0, var_0, "MOD_RIFLE_BULLET", "iw7_harpoon1_zm");
  }

  continue;
  }

  var_2 _meth_80B0(var_2.maxhealth, var_2.origin, undefined, undefined, "MOD_RIFLE_BULLET", "iw7_harpoon1_zm");
  }
}

alt_acid_rain_activate(var_0, var_1) {
  self endon("death");
  self endon("disconnect");
  level endon("game_ended");

  if (!isdefined(var_0) || !isdefined(var_1))
  return;

  for (var_2 = 0; var_2 < 3; var_2++) {
  var_3 = _id_80B9(var_0, var_1);
  var_4 = var_0 + var_3;
  magicbullet("iw7_acid_rain_projectile_zm", var_0, var_4, self);
  scripts\engine\utility::waitframe();
  playfx(level._effect["acid_rain_explosion"], var_4);
  }
}

_id_80B9(var_0, var_1) {
  var_2 = anglestoup(var_1);
  var_3 = anglestoright(var_1);
  var_4 = anglestoforward(var_1);
  var_5 = randomint(360);
  var_6 = randomint(360);
  var_7 = cos(var_6) * sin(var_5);
  var_8 = sin(var_6) * sin(var_5);
  var_9 = cos(var_5);
  var_10 = (var_7 * var_3 + var_8 * var_4 + var_9 * var_2) / 0.33;
  return -1 * var_10;
}

acid_rain_radial_activate() {
  self endon("death");
  self endon("disconnect");

  for (;;) {
  self waittill("acid_rain_radial_activate", var_0);
  self _meth_8253(var_0, 300, 1000, 1000, self);
  scripts\engine\utility::waitframe();
  }
}

_id_137A6() {
  self waittill("missile_fire", var_0, var_1);

  if (isdefined(var_0)) {
  if (!isdefined(var_0._id_13C2E)) {
  var_2 = getweaponbasename(var_1);

  if (isdefined(var_2))
  var_0._id_13C2E = var_2;
  else
  var_0._id_13C2E = var_1;
  }

  if (!isdefined(var_0.owner))
  var_0.owner = self;

  if (!isdefined(var_0.team))
  var_0.team = self.team;
  }

  return var_0;
}

update_harpoon_upgrade_quest(var_0, var_1) {
  var_0 endon("death");
  var_0 waittill("missile_stuck", var_2);

  if (isdefined(level.animal_quest_volume) && scripts\engine\utility::_id_6E25("harpoon_upgrade_quest_active")) {
  if (ispointinvolume(var_0.origin, level.animal_quest_volume)) {
  var_3 = scripts\engine\utility::_id_8180("animal_statues", "script_noteworthy");
  var_4 = sortbydistance(var_3, var_0.origin)[0];
  level.animal_statue_kills[var_4._id_0336]++;
  }
  }
}

runharpoontraplogic(var_0, var_1) {
  var_0 endon("death");
  var_0 waittill("missile_stuck", var_2);
  var_3 = var_0.origin;
  var_4 = var_0.angles;
  var_5 = vectornormalize(anglestoforward(var_4));
  var_6 = vectornormalize(anglestoright(var_4));
  var_7 = vectorcross(var_5, var_6);
  var_0.angles = vectortoangles(var_7);
  var_8 = 3 * anglestoforward(var_0.angles);
  var_0.origin = var_0.origin + var_8;
  playloopsound(var_0.origin, "weap_harpoon3_impact");
  wait 0.5;
  var_0 setscriptablepartstate("arrow_effects", "active");
  level.harpoon_projectiles[level.harpoon_projectiles.size] = var_0;

  if (level.harpoon_projectiles.size >= 6)
  thread destroy_oldest_trap();

  var_0.linked_to_targets = [];
  var_0._id_AD1F = [];
  var_0.death_time = gettime() + 9000;
  var_0 thread connect_to_nearby_harpoon_projectiles(var_0, var_1);
  var_0 thread timeout_trap(var_0, var_1);
}

destroy_oldest_trap() {
  var_0 = level.harpoon_projectiles[0];
  var_0 notify("early_death");
  var_0 clean_up_trap_ent(var_0, var_0.origin);
}

timeout_trap(var_0, var_1) {
  var_0 endon("death");
  var_0 endon("early_death");
  wait 9.95;
  var_2 = var_0.origin;
  wait 0.05;
  var_0 clean_up_trap_ent(var_0, var_2);
}

clean_up_trap_ent(var_0, var_1) {
  if (scripts\engine\utility::array_contains(level.harpoon_projectiles, var_0))
  level.harpoon_projectiles = scripts\engine\utility::array_remove(level.harpoon_projectiles, var_0);

  level.harpoon_projectiles = scripts\engine\utility::_id_22BC(level.harpoon_projectiles);
  var_2 = spawnfx(scripts\engine\utility::_id_7ECB("placeEquipmentFailed"), var_1);
  triggerfx(var_2);
  playloopsound(var_1, "weap_harpoon3_trap_off");
  thread _id_CC17(var_2);
  var_0 delete();
}

connect_to_nearby_harpoon_projectiles(var_0, var_1) {
  var_0 endon("death");
  var_2 = scripts\engine\trace::_id_497D();

  for (;;) {
  var_3 = [];
  var_4 = scripts\engine\utility::_id_782F(var_0.origin, level.harpoon_projectiles, [var_0], 2, 128);
  clean_up_links(var_0, var_4);

  foreach (var_6 in var_4) {
  if (scripts\engine\utility::array_contains(var_0.linked_to_targets, var_6))
  continue;

  if (scripts\engine\utility::array_contains(var_6.linked_to_targets, var_0))
  continue;

  var_7 = scripts\engine\trace::_id_DCED(var_0 gettagorigin("TAG_FX"), var_6 gettagorigin("TAG_FX"), var_0, var_2);

  if (var_7["fraction"] < 0.95)
  continue;
  else
  {
  var_3[var_3.size] = var_6;
  var_0.linked_to_targets[var_0.linked_to_targets.size] = var_6;
  }
  }

  foreach (var_10 in var_3) {
  var_0._id_AD1F[var_10._id_0064] = var_10;
  var_11 = distance(var_0.origin, var_10.origin);
  var_12 = spawn("trigger_rotatable_radius", var_0 gettagorigin("TAG_FX"), 0, 3, var_11);
  var_13 = vectortoangles(var_10 gettagorigin("TAG_FX") - var_0 gettagorigin("TAG_FX")) + (-90, 0, 0);
  var_12.angles = (90, var_13[1], var_13[2]);
  var_0 thread play_vfx_between_points_trap_gun(var_0, var_10, var_12);
  var_0 thread damage_enemies_in_trigger(var_10, var_0, var_12, var_1);
  thread clean_up_trigger_on_death(var_10, var_0, var_12);
  }

  wait 1;
  }
}

play_vfx_between_points_trap_gun(var_0, var_1, var_2) {
  var_3 = playfxontagsbetweenclients(level._effect["trap_ww_beam"], var_0, "tag_fx", var_1, "tag_fx");
  thread kill_fx_on_death(var_0, var_1, var_2, var_3);
}

kill_fx_on_death(var_0, var_1, var_2, var_3) {
  level endon("game_ended");
  var_4 = var_0.origin;
  var_5 = var_0 gettagorigin("TAG_FX");
  var_6 = var_1 gettagorigin("TAG_FX");
  var_7 = max((var_1.death_time - gettime()) / 1000, 0);
  var_8 = max((var_0.death_time - gettime()) / 1000 - var_7 - 0.2, 0);
  thread play_sfx_on_harpoon_trap(var_0, var_1, var_2);

  if (var_7 > 0 && isdefined(var_0) && isdefined(var_1))
  _id_0A77::_id_1372C(var_7, var_0, "death", var_1, "death", var_2, "death");
  else if (isdefined(var_0) && isdefined(var_1))
  scripts\engine\utility::_id_1372B(var_0, "death", var_1, "death", var_2, "death");

  if (isdefined(var_3))
  var_3 delete();

  playfxbetweenpoints(level._effect["trap_ww_beam_death"], var_5, vectortoangles(var_6 - var_5), var_6);
}

play_sfx_on_harpoon_trap(var_0, var_1, var_2) {
  var_3 = var_0.origin;
  var_4 = var_1 gettagorigin("TAG_FX");
  var_5 = [];
  var_5[0] = var_3;
  var_5[1] = var_4;
  var_6 = max((var_1.death_time - gettime()) / 1000, 0);
  var_7 = averagepoint(var_5);
  playloopsound(var_7, "weap_harpoon3_trap_on");
  var_8 = spawn("script_origin", var_7);
  wait 0.05;
  var_8 playloopsound("weap_harpoon3_trap_lp");

  if (var_6 > 0 && isdefined(var_0) && isdefined(var_1))
  _id_0A77::_id_1372C(var_6, var_0, "death", var_1, "death", var_2, "death");
  else if (isdefined(var_0) && isdefined(var_1))
  scripts\engine\utility::_id_1372B(var_0, "death", var_1, "death", var_2, "death");

  wait 1;
  var_8 stoploopsound("weap_harpoon3_trap_lp");
  wait 0.05;
  var_8 delete();
}

damage_enemies_in_trigger(var_0, var_1, var_2, var_3) {
  self endon("death");
  var_2 endon("death");
  var_0 endon("death");
  var_1 endon("death");

  for (;;) {
  var_2 waittill("trigger", var_4);

  if (!var_4 _id_0A77::_id_9D20())
  continue;

  if (var_4.agent_type == "slasher" || var_4.agent_type == "superslasher") {
  if (scripts\engine\utility::_id_9CEE(var_4.got_hit_once))
  continue;
  else
  var_4 thread do_damage_on_slasher_once(var_4, var_3);
  }

  thread run_harpoon_laser_death(var_4, var_3);
  }
}

do_damage_on_slasher_once(var_0, var_1) {
  var_0 endon("death");
  level endon("game_ended");
  var_0.got_hit_once = 1;

  if (var_0.agent_type == "superslasher")
  wait 5.0;
  else
  wait 2.0;

  var_0.got_hit_once = undefined;
}

run_harpoon_laser_death(var_0, var_1) {
  var_0.atomize_me = 1;
  var_0.not_killed_by_headshot = 1;

  if (isdefined(var_1))
  var_0 _meth_80B0(var_0.health, var_0.origin, var_1, var_1, "MOD_UNKNOWN", "iw7_harpoon3_zm");
  else
  var_0 _meth_80B0(var_0.health, var_0.origin, undefined, undefined, "MOD_UNKNOWN", "iw7_harpoon3_zm");
}

clean_up_trigger_on_death(var_0, var_1, var_2) {
  level endon("game_ended");
  scripts\engine\utility::_id_1372B(var_0, "death", var_1, "death");

  if (isdefined(var_2))
  var_2 delete();
}

clean_up_links(var_0, var_1) {
  var_0.linked_to_targets = scripts\engine\utility::_id_22BC(var_0.linked_to_targets);

  foreach (var_3 in var_0.linked_to_targets) {
  if (isdefined(var_0._id_AD1F[var_3._id_0064]))
  var_0._id_AD1F[var_3._id_0064] = undefined;

  if (!scripts\engine\utility::array_contains(var_1, var_3) && scripts\engine\utility::array_contains(var_0.linked_to_targets, var_3))
  var_0.linked_to_targets = scripts\engine\utility::array_remove(var_0.linked_to_targets, var_3);
  }
}

onplayerspawned() {
  self endon("disconnect");

  for (;;) {
  self waittill("spawned_player");
  self._id_4C16 = self getcurrentweapon();
  self._id_61A0 = 0;
  self._id_44ED = 0;
  self._id_9042 = 0;

  if (!isdefined(self._id_11AF0)) {
  self._id_11AF0 = "";
  self._id_11AF0 = "none";
  self._id_11AF1 = 0;
  self._id_11AEF = 0;
  self._id_11AEE = 0;
  self._id_11AED = 0;
  self._id_11AEC = 0;
  }

  thread _id_13A9B();
  thread _id_10B5E();
  self._id_A99F = [];
  self._id_5D39 = undefined;
  self._id_119DF = [];
  thread _id_12F0A();
  thread _id_13A7F();
  thread watch_slasher_killed();
  thread _id_B9EC();
  self._id_4C16 = undefined;
  self._id_12839 = undefined;
  }
}

_id_B9EC() {
  self endon("disconnect");
  self endon("death");
  self endon("faux_spawn");

  for (;;) {
  var_0 = _id_1377A();

  if (isdefined(var_0._id_13C2E)) {
  if (_id_83F3(var_0._id_13C2E) == "stickglprox")
  _id_F21A(var_0);
  }
  }
}

_id_83F3(var_0) {
  if (var_0 != "none" && getweaponbasename(var_0) == "iw7_glprox_mp") {
  if (_id_0A77::_id_9D3E(var_0)) {
  var_1 = getweaponattachments(var_0);
  var_0 = var_1[0];
  }
  else
  var_0 = getweaponbasename(var_0);
  }

  return var_0;
}

_id_10B5E() {
  self endon("death");
  self endon("disconnect");
  self endon("faux_spawn");

  if (!isplayer(self))
  return;

  self notifyonplayercommand("adjustedStance", "+stance");
  self notifyonplayercommand("adjustedStance", "+goStand");

  if (!level._id_4542 && !isai(self)) {
  self notifyonplayercommand("adjustedStance", "+togglecrouch");
  self notifyonplayercommand("adjustedStance", "toggleprone");
  self notifyonplayercommand("adjustedStance", "+movedown");
  self notifyonplayercommand("adjustedStance", "-movedown");
  self notifyonplayercommand("adjustedStance", "+prone");
  self notifyonplayercommand("adjustedStance", "-prone");
  }

  for (;;) {
  scripts\engine\utility::waittill_any("adjustedStance", "sprint_begin", "weapon_change");
  wait 0.5;

  if (isdefined(self._id_C53B) && self._id_C53B)
  continue;

  var_0 = self getstance();
  _id_10B5F(var_0);
  }
}

_id_10B5F(var_0) {
  var_1 = self getcurrentprimaryweapon();
  var_2 = 0;

  if (_id_9F1C(var_1))
  var_2 = _id_80E2();

  if (var_0 == "prone") {
  var_3 = _id_0A77::_id_4626(var_1);

  if (isdefined(var_3)) {
  if (var_3 == "weapon_lmg") {
  _id_F817(0, 40);
  return;
  }

  if (var_3 == "weapon_sniper") {
  if (issubstr(var_1, "barrelbored")) {
  _id_F817(0, 20 + var_2);
  return;
  }

  _id_F817(0, 40 + var_2);
  return;
  return;
  }

  return;
  return;
  }

  _id_F817();
  return;
  }
  else if (var_0 == "crouch") {
  var_3 = _id_0A77::_id_4626(var_1);

  if (isdefined(var_3)) {
  if (var_3 == "weapon_lmg") {
  _id_F817(0, 10);
  return;
  }

  if (var_3 == "weapon_sniper") {
  if (issubstr(var_1, "barrelbored")) {
  _id_F817(0, 10 + var_2);
  return;
  }

  _id_F817(0, 20 + var_2);
  return;
  return;
  }

  return;
  return;
  }

  _id_F817();
  return;
  }
  else if (var_2 > 0)
  _id_F817(0, var_2);
  else
  _id_F817();
}

_id_F817(var_0, var_1) {
  if (!isdefined(var_0))
  var_0 = 0;

  if (!isdefined(self._id_DDDB))
  self._id_DDDB = var_0;
  else
  self._id_DDDB = self._id_DDDB + var_0;

  if (isdefined(var_1)) {
  if (isdefined(self._id_DDDB) && var_1 < self._id_DDDB)
  var_1 = self._id_DDDB;

  var_2 = 100 - var_1;
  }
  else
  var_2 = 100 - self._id_DDDB;

  if (var_2 < 0)
  var_2 = 0;

  if (var_2 > 100)
  var_2 = 100;

  if (var_2 == 100) {
  self _meth_822C();
  return;
  }

  self _meth_822D(var_2);
}

_id_9F1C(var_0) {
  if (!isdefined(var_0) || var_0 == "none")
  return 0;

  var_1 = 0;

  if (issubstr(var_0, "kbsscope") || issubstr(var_0, "m8scope_zm") || issubstr(var_0, "cheytacscope"))
  var_1 = 1;

  return var_1;
}

_id_80E2() {
  if (!isdefined(self.pers["recoilReduceKills"]))
  self.pers["recoilReduceKills"] = 0;

  return self.pers["recoilReduceKills"] * 40;
}

watch_slasher_killed() {
  self endon("death");
  self endon("disconnect");
  self endon("faux_spawn");
  self endon("achievement_done");

  for (;;) {
  self waittill("slasher_killed_by_own_weapon", var_0, var_1);
  level thread slasher_killed_vo(var_0);
  _id_0D2A::_id_12D7C("TABLES_TURNED", 1);
  self notify("achievement_done");
  }
}

slasher_killed_vo(var_0) {
  level endon("game_ended");
  var_0 endon("death");
  var_0 endon("disconnect");

  if (var_0._id_134FD == "p5_")
  level thread _id_0A6A::_id_12885("ww_slasher_death_p5", "rave_announcer_vo", "highest", 5, 0, 0, 1);

  wait 5;
  var_0 thread _id_0A6A::_id_12885("killfirm_slasher", "zmb_comment_vo", "highest", 20, 0, 0, 1);
}

_id_13A7F() {
  self endon("death");
  self endon("disconnect");
  self endon("faux_spawn");

  for (;;) {
  self waittill("weapon_change", var_0);

  if (var_0 == "none")
  continue;

  var_1 = getweaponbasename(var_0);

  if (_id_9FEA(var_0))
  self.last_valid_weapon = var_0;

  switch (var_1) {
  case "iw7_axe_zm_pap2":
  case "iw7_axe_zm_pap1":
  case "iw7_axe_zm":
  if (_id_7D62(var_0) > 1) {} else {}

  break;
  default:
  break;
  }
  }
}

_id_9FEA(var_0) {
  var_1 = level._id_17D7;

  if (var_0 == "none")
  return 0;
  else if (scripts\engine\utility::array_contains(var_1, var_0))
  return 0;
  else if (scripts\engine\utility::array_contains(var_1, getweaponbasename(var_0)))
  return 0;
  else if (_id_0A77::_id_9C42(var_0, 1))
  return 0;
  else
  return 1;
}

_id_12F0A() {
  self endon("death");
  self endon("disconnect");
  self endon("faux_spawn");
  var_0 = self._id_4C16;

  if (isdefined(self._id_EB6D))
  var_0 = self._id_EB6D;

  self._id_EB6B = var_0;

  for (;;) {
  self waittill("weapon_change", var_1);

  if (var_1 == "none") {
  self._id_EB6B = var_0;
  continue;
  }

  var_2 = weaponinventorytype(var_1);

  if (var_2 != "primary" && var_2 != "altmode") {
  self._id_EB6B = var_0;
  continue;
  }

  self [[level._id_BC70]]();
  self._id_EB6B = var_0;
  var_0 = var_1;
  }
}

_id_13A9B() {
  self notify("watchGrenadeUsage");
  self endon("watchGrenadeUsage");
  self endon("spawned_player");
  self endon("disconnect");
  self endon("faux_spawn");
  self._id_11817 = undefined;
  self._id_8474 = 0;

  if (!isdefined(self._id_CC4C)) {
  self._id_CC4C = [];
  self._id_CC4D = [];
  }

  for (;;) {
  self waittill("grenade_pullback", var_0);
  var_1 = self _meth_8556();

  if (var_1 != "none")
  continue;

  if (isdefined(level.custom_grenade_pullback_func))
  thread [[level.custom_grenade_pullback_func]](self, var_0);

  thread _id_13ADB();
  self._id_11817 = var_0;

  if (var_0 == "c4_zm")
  thread _id_2A60();

  _id_2A69();
  self._id_11817 = undefined;
  }
}

_id_13ADB() {
  self endon("death");
  self endon("disconnect");
  self endon("faux_spawn");
  self endon("grenade_fire");
  self waittill("offhand_end");

  if (isdefined(self._id_3C64) && self._id_3C64 != self getcurrentweapon())
  self._id_3C64 = undefined;
}

_id_2A60() {
  self notify("beginC4Tracking");
  self endon("beginC4Tracking");
  self endon("death");
  self endon("disconnect");
  scripts\engine\utility::waittill_any("grenade_fire", "weapon_change", "offhand_end");
  self._id_3C64 = undefined;
}

_id_2A69() {
  self endon("offhand_end");
  var_0 = gettime();
  var_1 = _id_1377A();

  if (!isdefined(var_1))
  return;

  if (!isdefined(var_1._id_13C2E))
  return;

  self._id_3C64 = undefined;

  switch (var_1._id_13C2E) {
  case "thermobaric_grenade_mp":
  case "frag_grenade_mp":
  case "frag_grenade_zm":
  if (gettime() - var_0 > 1000)
  var_1._id_9D93 = 1;

  var_1 thread _id_858A();
  var_1._id_C731 = self;
  break;
  case "cluster_grenade_zm":
  var_1._id_42E0 = var_1._id_118A2;

  if (var_1._id_118A2 >= 1)
  var_1._id_9D93 = 1;

  var_1._id_C731 = self;
  var_1 thread _id_42DE();
  var_1 thread _id_858A();
  break;
  case "zfreeze_semtex_mp":
  case "semtex_zm":
  case "semtex_mp":
  thread _id_F21A(var_1);
  break;
  case "c4_zm":
  thread _id_0D07::_id_333E(var_1);
  break;
  case "smoke_grenade_mp":
  var_1 thread _id_13B48();
  break;
  case "claymore_mp":
  thread _id_402D(var_1);
  break;
  case "concussion_grenade_mp":
  var_1 thread _id_139D3();
  break;
  case "bouncingbetty_mp":
  thread _id_B780(var_1, ::_id_108E3);
  break;
  case "throwingknifejugg_mp":
  case "throwingknifec4_mp":
  case "throwingknife_mp":
  level thread _id_11824(self, var_1, var_1._id_13C2E);
  break;
  case "zom_repulsor_mp":
  var_1 delete();
  break;
  case "gas_grenade_mp":
  var_1 thread _id_13A8A();
  break;
  case "splash_grenade_zm":
  case "splash_grenade_mp":
  var_1 thread _id_858A();
  thread _id_0A66::_id_10A35(var_1);
  break;
  case "portal_generator_zm":
  case "portal_generator_mp":
  thread _id_0D14::_id_D68B(var_1);
  break;
  case "ztransponder_mp":
  case "transponder_mp":
  thread _id_0D1E::_id_1268F(var_1);
  break;
  case "micro_turret_zm":
  case "micro_turret_mp":
  thread _id_0D0F::_id_B719(var_1);
  break;
  case "blackhole_grenade_zm":
  case "blackhole_grenade_mp":
  thread _id_0D04::_id_2B3D(var_1);
  break;
  case "trip_mine_mp":
  thread _id_0D1F::_id_127F2(var_1);
  break;
  case "heart_cp":
  thread heart_used();
  break;
  case "rat_king_eye_cp":
  thread eye_activated();
  break;
  }
}

rat_executevisuals(var_0) {
  level endon("game_ended");
  self endon("disconnect");
  self playlocalsound("eye_pulse_plr_lr");
  self setscriptablepartstate("rat_eye_pulse", "active");
  scripts\engine\utility::_id_13736(var_0, "last_stand", "death");
  self setscriptablepartstate("rat_eye_pulse", "inactive");
}

handleratvisionburst(var_0) {
  level endon("game_ended");
  var_0 endon("disconnect");
  var_0 endon("last_stand");
  var_0 endon("death");
  var_0 thread rat_executevisuals(2.4);
}

_id_9E54(var_0, var_1, var_2, var_3, var_4, var_5) {
  var_6 = getentarray("power_exclusion_volume", "targetname");

  if (isdefined(var_5)) {
  if (isdefined(level._id_BEAB) && isdefined(level._id_BEAB._id_12F87)) {
  if (var_5 == level._id_BEAB || var_5 == level._id_BEAB._id_12F87)
  return 0;
  }

  if (isdefined(level._id_2BFB)) {
  if (var_5 == level._id_2BFB)
  return 0;
  }

  if (isdefined(var_5._id_0336) && var_5._id_0336 == "beginning_area_balloons")
  return 0;
  }

  if (isdefined(var_1))
  var_6 = scripts\engine\utility::_id_227F(var_6, var_1);

  foreach (var_8 in var_6) {
  if (ispointinvolume(var_0, var_8))
  return 0;
  }

  if (scripts\engine\utility::_id_9CEE(var_4) && !_func_279(var_0))
  return 0;

  if (scripts\engine\utility::_id_9CEE(var_3)) {
  if (_func_272(var_2.origin, var_0))
  return 0;
  }

  return 1;
}

_id_CC16(var_0, var_1, var_2, var_3) {
  if (isplayer(self))
  self playlocalsound("scavenger_pack_pickup");

  if (scripts\engine\utility::_id_9CEE(var_1)) {
  var_4 = undefined;

  if (isplayer(self)) {
  self playlocalsound("ww_magicbox_laughter");

  if (isdefined(var_3))
  var_4 = spawnfxforclient(scripts\engine\utility::_id_7ECB("placeEquipmentFailed"), var_2, self, anglestoforward(var_3), anglestoup(var_3));
  else
  var_4 = spawnfxforclient(scripts\engine\utility::_id_7ECB("placeEquipmentFailed"), var_2, self);
  }
  else
  var_4 = spawnfx(scripts\engine\utility::_id_7ECB("placeEquipmentFailed"), var_2);

  triggerfx(var_4);
  thread _id_CC17(var_4);
  }
}

_id_CC17(var_0) {
  wait 2;
  var_0 delete();
}

_id_108E3(var_0, var_1, var_2, var_3) {
  if (!isdefined(var_3))
  var_3 = (0, randomfloat(360), 0);

  var_4 = level._id_13C7D[var_2];
  var_5 = spawn("script_model", var_0);
  var_5.angles = var_3;
  var_5.owner = var_1;
  var_5._id_13C2E = var_2;
  var_5._id_451C = var_4;
  var_5 setmodel(var_4._id_01F1);
  var_5 _meth_831F(var_1);
  var_5._id_A640 = (0, 0, 4);
  var_5._id_A63A = spawn("script_model", var_5.origin + var_5._id_A640);
  var_5._id_A63A setscriptmoverkillcam("explosive");
  var_1 _id_C54E(var_5);

  if (isdefined(var_4._id_B760))
  var_5 thread _id_57EB("tag_fx", var_4._id_B760["friendly"], var_4._id_B760["enemy"]);

  var_6 = undefined;

  if (self != level)
  var_6 = self _meth_8138();

  var_5 _id_69FF(var_6);
  var_5 thread _id_B778(var_6);
  var_5 thread _id_858A();
  var_5 thread _id_B77A();
  var_5 thread _id_B770();
  level thread _id_B9CA(var_1, var_5);
  return var_5;
}

_id_B77A() {
  self endon("mine_triggered");
  self endon("mine_destroyed");
  self endon("death");
  wait(level._id_B77B + randomfloat(0.4));
  self notify("mine_selfdestruct");
  self notify("detonateExplosive");
}

_id_B770() {
  self endon("death");
  level endon("game_ended");
  self waittill("detonateExplosive", var_0);

  if (!isdefined(self) || !isdefined(self.owner))
  return;

  if (!isdefined(var_0))
  var_0 = self.owner;

  var_1 = self._id_451C;
  var_2 = var_1._id_13370;

  if (!isdefined(var_2))
  var_2 = "tag_fx";

  var_3 = self gettagorigin(var_2);

  if (!isdefined(var_3))
  var_3 = self gettagorigin("tag_origin");

  self notify("explode", var_3);
  wait 0.05;

  if (!isdefined(self) || !isdefined(self.owner))
  return;

  self hide();

  if (isdefined(var_1._id_C524))
  self thread [[var_1._id_C524]]();

  if (isdefined(var_1._id_C525))
  self playsound(var_1._id_C525);

  var_4 = scripts\engine\utility::ter_op(isdefined(var_1._id_C526), var_1._id_C526, level._id_B761);
  var_5 = scripts\engine\utility::ter_op(isdefined(var_1._id_B769), var_1._id_B769, level._id_B769);
  var_6 = scripts\engine\utility::ter_op(isdefined(var_1._id_B768), var_1._id_B768, level._id_B768);
  var_7 = scripts\engine\utility::ter_op(isdefined(var_1._id_B76B), var_1._id_B76B, level._id_B76B);
  self _meth_8253(self.origin, var_7, var_6, var_5, var_0, "MOD_EXPLOSIVE", self._id_13C2E);
  wait 0.2;
  _id_51B5();
}

_id_B778(var_0) {
  self endon("mine_destroyed");
  self endon("mine_selfdestruct");
  self endon("death");
  self endon("disabled");
  var_1 = self._id_451C;
  wait(var_1._id_226E);

  if (isdefined(var_1._id_B760))
  thread _id_57EB("tag_fx", var_1._id_B760["friendly"], var_1._id_B760["enemy"]);

  var_2 = spawn("trigger_radius", self.origin, 0, level._id_B76F, level._id_B76E);
  var_2.owner = self;
  var_2.team = var_2.owner.team;
  thread _id_B76C(var_2);

  if (isdefined(var_0)) {
  var_2 _meth_80D2();
  var_2 linkto(var_0);
  }

  self._id_4D2A = var_2;

  for (;;) {
  var_2 waittill("trigger", var_3);

  if (isplayer(var_3)) {
  wait 0.05;
  continue;
  }

  if (var_3 _meth_808F(self.origin, self) > 0)
  break;
  }

  self notify("mine_triggered");
  self playsound(self._id_451C._id_C5B4);
  _id_6A08(var_3, level._id_B76D, "mine");
  self thread [[self._id_451C._id_C5B3]]();
}

_id_B76C(var_0) {
  scripts\engine\utility::waittill_any("mine_triggered", "mine_destroyed", "mine_selfdestruct", "death");

  if (isdefined(var_0))
  var_0 delete();
}

_id_57EB(var_0, var_1, var_2) {
  if (!isdefined(var_1))
  var_1 = scripts\engine\utility::_id_7ECB("weap_blink_friend");

  if (!isdefined(var_2))
  var_2 = scripts\engine\utility::_id_7ECB("weap_blink_enemy");

  self._id_2BA2["friendly"] = var_1;
  self._id_2BA2["enemy"] = var_2;
  self._id_2BA3 = var_0;
  thread _id_12E66(var_1, var_2, var_0);
  self waittill("death");
  _id_11061();
}

_id_12E66(var_0, var_1, var_2) {
  self endon("death");
  self endon("carried");
  self endon("emp_damage");
  var_3 = ::_id_3E52;

  if (!level.teambased)
  var_3 = ::_id_3E34;

  var_4 = randomfloatrange(0.05, 0.25);
  wait(var_4);
  childthread _id_C542(var_0, var_1, var_2, var_3);

  foreach (var_6 in level.players) {
  if (isdefined(var_6)) {
  if (self.owner [[var_3]](var_6))
  playfxontagforclients(var_0, self, var_2, var_6);
  else
  playfxontagforclients(var_1, self, var_2, var_6);

  wait 0.05;
  }
  }
}

_id_3E34(var_0) {
  return self == var_0;
}

_id_3E52(var_0) {
  return self.team == var_0.team;
}

_id_C542(var_0, var_1, var_2, var_3) {
  self endon("death");
  level endon("game_ended");
  self endon("emp_damage");

  for (;;) {
  level waittill("joined_team", var_4);

  if (self.owner [[var_3]](var_4)) {
  playfxontagforclients(var_0, self, var_2, var_4);
  continue;
  }

  playfxontagforclients(var_1, self, var_2, var_4);
  }
}

_id_11061() {
  if (isalive(self) && isdefined(self._id_2BA2)) {
  stopfxontag(self._id_2BA2["friendly"], self, self._id_2BA3);
  stopfxontag(self._id_2BA2["enemy"], self, self._id_2BA3);
  self._id_2BA2 = undefined;
  self._id_2BA3 = undefined;
  }
}

takeheart(var_0) {
  self notify("remove_heart");
  self.has_heart = undefined;
}

heart_used() {
  self endon("disconnect");
  self endon("remove_heart");
  self notify("beginHeartTracking");
  self endon("beginHeartTracking");
  self endon("death");
  var_0 = self _meth_8513("ges_heart_pull", "explode");
  var_1 = self _meth_8443("ges_heart_pull");
  self._id_3C64 = undefined;
  var_2 = self.origin;
  var_3 = _id_0A4A::_id_77FD();

  foreach (var_5 in var_3) {
  if (isdefined(var_5._id_6F73) || isdefined(var_5.agent_type) && (var_5.agent_type == "zombie_brute" || var_5.agent_type == "zombie_ghost" || var_5.agent_type == "zombie_grey" || var_5.agent_type == "slasher" || var_5.agent_type == "superslasher"))
  continue;

  if (distancesquared(var_5.origin, var_2) <= 65536) {
  if (var_5 _id_0F74::_id_9D9E()) {
  var_5._id_EF64 = 1;
  var_5._id_0180 = 1;
  var_5 _meth_82EF(var_5.origin);
  }

  var_5._id_EF64 = 1;
  var_5._id_0180 = 1;
  var_5 _meth_82EF(var_5.origin);
  var_5._id_6F73 = 1;
  var_5._id_5793 = 1;
  var_5._id_5502 = 1;
  var_5._id_74B5 = 1;
  var_5._id_C026 = 1;
  var_5 _meth_8500(0);
  playfx(level._effect["rat_swarm_cheap"], var_5 gettagorigin("j_spine4"), anglestoforward(var_5.angles));
  thread deal_damage(var_5, self);
  }
  }

  _id_0D15::_id_D72E();
  self notify("heart_used", 1);
}

use_heart_notify() {
  self notify("heart_used", 1);
}

deal_damage(var_0, var_1) {
  var_0 endon("death");
  wait 0.7;
  var_0._id_EF64 = undefined;
  var_2 = var_0 gettagorigin("j_spine4");
  playfx(level._effect["gore"], var_2, (1, 0, 0));
  playloopsound(var_2, "gib_fullbody");
  var_1 _meth_844F(0.5, 1.5, var_2, 120);
  scripts\engine\utility::waitframe();

  if (isdefined(var_0))
  var_0 _meth_80B0(var_0.health + 100000, var_0.origin, var_1, var_1, "MOD_EXPLOSIVE", "heart_cp");
}

_id_13A8A() {
  var_0 = self.owner;
  var_0 endon("disconnect");
  self waittill("explode", var_1);
  thread _id_C534(var_0, var_1);
}

_id_C534(var_0, var_1) {
  var_2 = spawn("trigger_radius", var_1, 0, 128, 160);
  var_2.owner = var_0;
  var_3 = 128;
  var_4 = spawnfx(scripts\engine\utility::_id_7ECB("gas_grenade_smoke_enemy"), var_1);
  triggerfx(var_4);
  wait 1.0;

  for (var_5 = 8.0; var_5 > 0.0; var_5 = var_5 - 0.2) {
  foreach (var_7 in _id_0A4A::_id_7DB0("axis")) {
  if (isdefined(var_7.agent_type) && (var_7.agent_type == "zombie_brute" || var_7.agent_type == "superslasher" || var_7.agent_type == "slasher" || var_7.agent_type == "zombie_grey"))
  continue;

  var_8 = _id_7E5B(var_7);

  if (isalive(var_7))
  var_7 _id_20CC(var_0, var_1, var_2, var_2, int(var_8));
  }

  wait 0.2;
  }

  var_4 delete();
  wait 2.0;
  var_2 delete();

  foreach (var_7 in _id_0A4A::_id_7DB0("axis")) {
  if (isalive(var_7))
  var_7._id_6E82 = undefined;
  }
}

_id_7E5B(var_0) {
  if (isalive(var_0)) {
  if (scripts\engine\utility::_id_9CEE(var_0._id_9CDD))
  return int(min(1000, var_0.maxhealth * 0.25));
  else
  return int(min(1000, var_0.maxhealth * 0.1));
  }
  else
  return 150;
}

_id_20CC(var_0, var_1, var_2, var_3, var_4) {
  if (isalive(self) && self istouching(var_2)) {
  if (var_0 _id_0A77::isenemy(self)) {
  var_3 _meth_8253(self.origin, 1, var_4, var_4, var_0, "MOD_GRENADE_SPLASH", "gas_grenade_mp");
  self._id_6E82 = gettime() + 200;
  }
  }
}

_id_11824(var_0, var_1, var_2) {
  if (var_2 == "throwingknifec4_mp") {
  var_1 makeunusable();
  var_1 thread _id_DDF3();
  }

  thread _id_1181A(var_0, var_1);
  var_3 = undefined;
  var_4 = undefined;
  var_1 waittill("missile_stuck", var_3, var_4);
  var_5 = isdefined(var_4) && var_4 == "tag_flicker";
  var_6 = isdefined(var_4) && var_4 == "tag_weapon";

  if (isdefined(var_3) && (isplayer(var_3) || isagent(var_3)) && var_5)
  var_3 notify("shield_hit", var_1);

  if (isdefined(var_3) && (isplayer(var_3) || isagent(var_3)) && !var_6 && !var_5) {
  if (!_id_0D12::_id_213D(var_3, var_1)) {
  var_1 delete();
  return;
  }
  else if (var_2 == "throwingknifec4_mp")
  _id_11818(var_1, var_3, var_0);
  }

  if (isdefined(var_1._id_8377)) {
  _id_11827(var_0, var_1._id_D719);
  var_1 delete();
  }
}

_id_1181A(var_0, var_1) {
  var_1 endon("death");
  var_0 endon("death");
  var_0 endon("disconnect");

  for (;;) {
  var_0 waittill("victim_damaged", var_2, var_3, var_4, var_5, var_6, var_7);

  if (isdefined(var_3) && var_3 == var_1) {
  if (var_7 == "throwingknifeteleport_mp" && !isdefined(var_1._id_A708)) {
  _id_1181F(var_1, var_2, var_0, 1);
  var_1._id_8377 = 1;
  }

  break;
  }
  }
}

_id_13A90() {
  self waittill("death");

  if (isdefined(self._id_A702))
  self._id_A702 delete();
}

_id_11827(var_0, var_1, var_2) {
  var_3 = var_0 getweaponammoclip(var_2);
  var_4 = 2;
  var_5 = undefined;

  if (var_3 >= var_4)
  var_5 = 0;
  else
  {
  var_0 setweaponammoclip(var_2, var_3 + 1);
  var_0 thread _id_917F("throwingknife");
  var_5 = 1;
  }

  return var_5;
}

_id_917F(var_0) {
  var_1 = 0;

  if (isdefined(level._id_4D4E) && level._id_4D4E)
  var_1 = 1;

  if (!isplayer(self))
  return;

  switch (var_0) {
  case "scavenger":
  case "throwingknife":
  if (!var_1)
  self playlocalsound("scavenger_pack_pickup");

  if (!level._id_8B38)
  self setclientomnvar("damage_feedback_other", var_0);

  break;
  case "boxofguns":
  if (!var_1)
  self playlocalsound("mp_box_guns_ammo");

  if (!level._id_8B38)
  self setclientomnvar("damage_feedback_other", var_0);

  break;
  case "oracle":
  if (!var_1)
  self playlocalsound("oracle_radar_pulse_plr");

  if (!level._id_8B38)
  self setclientomnvar("damage_feedback_other", var_0);

  break;
  }
}

_id_1181F(var_0, var_1, var_2, var_3) {
  var_2 playlocalsound("blinkknife_teleport");
  var_2 playsoundonmovingent("blinkknife_teleport_npc");
  playloopsound(var_0.origin, "blinkknife_impact");
  thread _id_11823(var_2, var_1);
  var_4 = var_1 _meth_8113();

  if (isdefined(var_4))
  var_4 _meth_82C7(0);

  var_5 = [];

  foreach (var_7 in level._id_3CB5) {
  if (!isdefined(var_7) || !isalive(var_7) || var_7 == var_1 || var_7 == var_2 || !var_2 _id_0A77::isenemy(var_7))
  continue;

  var_5[var_5.size] = var_7;
  }

  var_5 = sortbydistance(var_5, var_1.origin);
  var_9 = var_2 gettagorigin("TAG_EYE");
  var_10 = var_1.origin;
  var_11 = var_1.origin + (0, 0, var_9[2] - var_2.origin[2]);
  var_12 = var_2.angles;

  foreach (var_14 in var_5) {
  var_15 = (var_14.origin[0], var_14.origin[1], var_14 gettagorigin("TAG_EYE")[2]);

  if (distancesquared(var_14.origin, var_1.origin) < 230400 && sighttracepassed(var_11, var_15, 0, undefined)) {
  var_12 = vectortoangles(var_15 - var_11);
  break;
  }
  }

  var_2 setorigin(var_1.origin, !var_3);
  var_2 setplayerangles(var_12);
  _id_11820(var_2, var_1);
}

_id_11823(var_0, var_1) {
  var_2 = var_1.origin - var_0.origin;
  var_3 = var_0.origin + (0, 0, 32);
  var_4 = vectornormalize(var_2);
  var_5 = vectornormalize(vectorcross(var_2, (0, 0, 1)));
  var_6 = vectorcross(var_5, var_4);
  var_7 = _func_017(var_4, var_5, var_6);
  var_8 = 0;

  if (var_8) {
  var_9 = spawn("script_model", var_3);
  var_9.angles = var_7;
  var_9 setmodel("tag_origin");
  var_9 _meth_8429(var_0);
  scripts\engine\utility::waitframe();
  _func_29A(scripts\engine\utility::_id_7ECB("vfx_knife_tele_start_friendly"), var_9, "tag_origin", var_0.team);
  wait 3.0;
  var_9 delete();
  } else {
  var_10 = spawn("script_model", var_3);
  var_10.angles = var_7;
  var_10 setmodel("tag_origin");
  var_10 _meth_8429(var_0);
  scripts\engine\utility::waitframe();

  foreach (var_12 in level.players)
  var_10 _meth_8429(var_12);

  playfxontag(scripts\engine\utility::_id_7ECB("vfx_tele_start_friendly"), var_10, "tag_origin");
  wait 3.0;
  var_10 delete();
  }
}

_id_DDF3() {
  level endon("game_ended");
  self.owner endon("disconnect");
  self._id_5726 = 0;
  var_0 = self.origin;

  for (;;) {
  var_1 = scripts\engine\utility::_id_13736(0.15, "death", "missile_stuck");

  if (!isdefined(self))
  break;

  var_2 = distance(var_0, self.origin);
  self._id_5726 = self._id_5726 + var_2;
  var_0 = self.origin;

  if (var_1 != "timeout")
  break;
  }
}

_id_11820(var_0, var_1) {}

_id_11818(var_0, var_1, var_2) {
  var_1 playsound("biospike_explode");
  playfx(scripts\engine\utility::_id_7ECB("throwingknifec4_explode"), var_0.origin);
  var_0 _meth_8253(var_0.origin, 180, 1200, 600, var_2, "MOD_EXPLOSIVE", var_0._id_13C2E);
  var_0 thread _id_858A();
  var_0 notify("explode", var_0.origin);
  var_0 delete();
}

_id_11826(var_0, var_1) {
  var_1 endon("missile_stuck");
  var_1 endon("death");
  var_0 scripts\engine\utility::waittill_any("death", "disconnect");
  var_1._id_A708 = 1;
}

_id_139D3() {
  thread _id_636E();
  self endon("end_explode");
  self waittill("explode", var_0);
  _id_11195(var_0, self.owner);
}

_id_11195(var_0, var_1) {
  var_2 = _id_0A4A::_id_7DB0("axis");
  var_3 = scripts\engine\utility::_id_782F(var_0, var_2, undefined, 24, 256);

  foreach (var_5 in var_3) {
  if (!var_5 _id_0A77::agentisfnfimmune())
  var_5 thread _id_75FA(var_5, var_1);
  }
}

_id_75FA(var_0, var_1) {
  var_0 endon("death");

  if (isdefined(var_0._id_11190)) {
  if (gettime() > var_0._id_11190) {
  if (var_0 _id_0F74::_id_9D9E()) {
  var_0._id_EF64 = 1;
  var_0._id_0180 = 1;
  var_0 _meth_82EF(var_0.origin);
  }

  var_0._id_0033 = 1;
  var_0._id_11190 = gettime() + 1000;
  var_0._id_11196 = 1;
  }
  else
  return;
  } else {
  if (var_0 _id_0F74::_id_9D9E()) {
  var_0._id_EF64 = 1;
  var_0._id_0180 = 1;
  var_0 _meth_82EF(var_0.origin);
  }

  var_0._id_0033 = 1;
  var_0._id_11190 = gettime() + 1000;
  var_0._id_11196 = 1;
  }

  var_0 _meth_80B0(1, var_0.origin, var_1, var_1, "MOD_GRENADE_SPLASH", "concussion_grenade_mp");
  wait 1;

  if (var_0 _id_0F74::_id_9D9E()) {
  var_0._id_EF64 = 0;
  var_0._id_0180 = 0;
  }

  var_0._id_0033 = 0;
  var_0._id_11196 = undefined;
}

_id_B780(var_0, var_1) {
  if (!isalive(self)) {
  var_0 delete();
  return;
  }

  var_0 thread _id_B77F(self, var_0._id_13C2E, var_1);
}

_id_B77F(var_0, var_1, var_2, var_3) {
  self.owner = var_0;
  self waittill("missile_stuck", var_4);

  if (!isdefined(var_0))
  return;

  if (var_1 != "trip_mine_mp") {
  if (isdefined(var_4) && isdefined(var_4.owner)) {
  if (isdefined(var_3))
  self.owner [[var_3]](self);

  self delete();
  return;
  }
  }

  var_5 = bullettrace(self.origin + (0, 0, 4), self.origin - (0, 0, 4), 0, self);
  var_6 = var_5["position"];

  if (var_5["fraction"] == 1) {
  var_6 = getgroundposition(self.origin, 12, 0, 32);
  var_5["normal"] = var_5["normal"] * -1;
  }

  var_7 = vectornormalize(var_5["normal"]);
  var_8 = vectortoangles(var_7);
  var_8 = var_8 + (90, 0, 0);
  var_9 = [[var_2]](var_6, var_0, var_1, var_8);
  var_9 thread _id_B76A();
  self delete();
}

_id_B76A() {
  self endon("mine_triggered");
  self endon("mine_selfdestruct");
  self endon("death");
  self setcandamage(1);
  self.maxhealth = 100000;
  self.health = self.maxhealth;
  var_0 = undefined;

  for (;;) {
  self waittill("damage", var_1, var_0, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9);

  if (_id_9C01(var_0, var_4))
  break;

  if (!isplayer(var_0) && !isagent(var_0))
  continue;

  if (isdefined(var_9) && isendstr(var_9, "betty_mp"))
  continue;

  if (!_id_0A4F::_id_7415(self.owner, var_0))
  continue;

  if (isdefined(var_9)) {
  switch (var_9) {
  case "concussion_grenade_mp":
  case "smoke_grenadejugg_mp":
  case "smoke_grenade_mp":
  case "flash_grenade_mp":
  continue;
  }
  }

  break;
  }

  self notify("mine_destroyed");

  if (isdefined(var_4) && (issubstr(var_4, "MOD_GRENADE") || issubstr(var_4, "MOD_EXPLOSIVE")))
  self._id_13908 = 1;

  if (isdefined(var_8) && var_8 & level.idflags_penetration)
  self._id_1390E = 1;

  self._id_1390B = 1;

  if (isdefined(var_0))
  self._id_4D3F = var_0;

  if (isplayer(var_0))
  var_0 _id_0A4F::updatedamagefeedback("bouncing_betty");

  self notify("detonateExplosive", var_0);
}

_id_9C01(var_0, var_1) {
  if (!isdefined(var_0) || !isdefined(var_0.classname))
  return 0;

  return var_0.classname == "scriptable" && var_1 == "MOD_EXPLOSIVE";
}

_id_402D(var_0) {
  if (!isalive(self)) {
  var_0 delete();
  return;
  }

  var_0 hide();
  var_0 scripts\engine\utility::_id_13736(0.05, "missile_stuck");

  if (!isdefined(self) || !isalive(self)) {
  var_0 delete();
  return;
  }

  var_1 = 60;
  var_2 = (0, 0, 4);
  var_3 = distancesquared(self.origin, var_0.origin);
  var_4 = distancesquared(self geteye(), var_0.origin);
  var_3 = var_3 + 600;
  var_5 = var_0 _meth_8138();

  if (isdefined(var_5))
  var_0 unlink();

  if (var_3 < var_4) {
  if (var_1 * var_1 < distancesquared(var_0.origin, self.origin)) {
  var_6 = bullettrace(self.origin, self.origin - (0, 0, var_1), 0, self);

  if (var_6["fraction"] == 1) {
  var_0 delete();
  self setweaponammostock(var_0._id_13C2E, self getweaponammostock(var_0._id_13C2E) + 1);
  return;
  } else {
  var_0.origin = var_6["position"];
  var_5 = var_6["entity"];
  }
  } else {}
  }
  else if (var_1 * var_1 < distancesquared(var_0.origin, self geteye())) {
  var_6 = bullettrace(self.origin, self.origin - (0, 0, var_1), 0, self);

  if (var_6["fraction"] == 1) {
  var_0 delete();
  self setweaponammostock(var_0._id_13C2E, self getweaponammostock(var_0._id_13C2E) + 1);
  return;
  } else {
  var_0.origin = var_6["position"];
  var_5 = var_6["entity"];
  }
  } else {
  var_2 = (0, 0, -5);
  var_0.angles = var_0.angles + (0, 180, 0);
  }

  var_0.angles = var_0.angles * (0, 1, 1);
  var_0.origin = var_0.origin + var_2;
  var_0 _id_69FF(var_5);
  var_0 show();
  _id_C54E(var_0);
  var_0 thread _id_C4F4();
  var_0 thread _id_334A();
  var_0 thread _id_4028(var_5);
  self._id_3C64 = undefined;
  level thread _id_B9CA(self, var_0);
}

_id_4028(var_0) {
  self endon("death");
  var_1 = spawn("trigger_radius", self.origin + (0, 0, 0 - level._id_4027), 0, level._id_4027, level._id_4027 * 2);

  if (isdefined(var_0)) {
  var_1 _meth_80D2();
  var_1 linkto(var_0);
  }

  thread _id_51BF(var_1);

  for (;;) {
  var_1 waittill("trigger", var_2);

  if (getdvarint("scr_claymoredebug") != 1) {
  if (isdefined(self.owner)) {
  if (var_2 == self.owner)
  continue;

  if (isdefined(var_2.owner) && var_2.owner == self.owner)
  continue;
  }

  if (!_id_0A4F::_id_7415(self.owner, var_2, 0))
  continue;
  }

  if (lengthsquared(var_2 getentityvelocity()) < 10)
  continue;

  var_3 = abs(var_2.origin[2] - self.origin[2]);

  if (var_3 > 128)
  continue;

  if (!var_2 _id_FFB9(self))
  continue;

  if (var_2 _meth_808F(self.origin, self) > 0)
  break;
  }

  self playsound("claymore_activated");
  _id_6A08(var_2, level._id_4024, "claymore");
  self notify("detonateExplosive");
}

_id_6A08(var_0, var_1, var_2) {
  if (isplayer(var_0) && var_0 _id_0A77::_id_12D6("specialty_delaymine")) {
  var_0 notify("triggeredExpl", var_2);
  var_1 = level._id_5113;
  }

  wait(var_1);
}

_id_FFB9(var_0) {
  if (isdefined(var_0._id_55BA))
  return 0;

  var_1 = self.origin + (0, 0, 32);
  var_2 = var_1 - var_0.origin;
  var_3 = anglestoforward(var_0.angles);
  var_4 = vectordot(var_2, var_3);

  if (var_4 < level._id_4025)
  return 0;

  var_2 = vectornormalize(var_2);
  var_5 = vectordot(var_2, var_3);
  return var_5 > level._id_4023;
}

_id_51BF(var_0) {
  self waittill("death");
  wait 0.05;

  if (isdefined(var_0)) {
  if (isdefined(var_0.trigger))
  var_0.trigger delete();

  var_0 delete();
  }
}

_id_334A() {
  self endon("death");

  for (;;) {
  self waittill("emp_damage", var_0, var_1);
  _id_66A9();
  self._id_55BA = 1;
  self notify("disabled");
  wait(var_1);
  self._id_55BA = undefined;
  self notify("enabled");
  }
}

_id_66A9() {
  playfxontag(scripts\engine\utility::_id_7ECB("emp_stun"), self, "tag_origin");
}

_id_B2A3() {
  self notify("equipmentWatchUse");
  self.trigger delete();
}

_id_B2A2(var_0) {
  _id_0A77::_id_B268(self.owner.team);

  if (!isdefined(var_0) || !var_0)
  self _meth_81F0();
}

_id_13B48() {
  level endon("smokeTimesUp");
  var_0 = self.owner;
  var_0 endon("disconnect");
  self waittill("explode", var_1);
  var_2 = 22500;
  var_3 = 12;
  var_4 = spawn("script_model", var_1);
  var_4.origin = var_1 + (0, 0, 56);
  var_4 makeentitysentient("allies", 1);
  var_4.health = 100000;
  var_4.maxhealth = 100000;
  var_4._id_033F = 10000;
  var_4 setthreatbiasgroup("players");
  level thread _id_13718(12, 22500, var_1, var_4);

  for (;;) {
  if (!isdefined(var_0))
  break;

  var_5 = _id_0A4A::_id_7DB0("axis");

  foreach (var_7 in var_5) {
  if (var_7._id_1096F == "alien")
  continue;

  if (isdefined(var_7._id_10376))
  continue;

  var_8 = distance2dsquared(var_1, var_7.origin);

  if (var_8 < 90000)
  var_7 thread _id_11548(var_4, 22500);
  }

  foreach (var_11 in level.players) {
  if (!isdefined(var_11))
  continue;

  var_12 = distance2dsquared(var_1, var_11.origin);

  if (var_12 < 22500) {
  var_11._id_9903 = var_0;
  var_11 setthreatbiasgroup("phased_players");
  continue;
  }

  var_11._id_9903 = undefined;
  var_11 setthreatbiasgroup("players");
  }

  wait 0.05;
  }
}

_id_11548(var_0, var_1) {
  _id_0A4A::_id_18F3(var_0.origin, sqrt(var_1), "critical");

  if (!_id_0A4A::_id_9B53(self)) {
  self getenemyinfo(var_0);
  self _meth_8051(var_0);
  _id_0A4A::_id_18F3(var_0.origin, 8, "hunt");
  }

  self._id_10376 = 1;
  level waittill("smokeTimesUp");

  if (!_id_0A4A::_id_9B53(self))
  self botclearscriptenemy();

  _id_0A4A::_id_18F3(self.origin, 8, "hunt");
  self._id_10376 = undefined;
}

_id_13718(var_0, var_1, var_2, var_3) {
  _id_0A56::waitlongdurationwithhostmigrationpause(var_0);
  level notify("smokeTimesUp");
  waittillframeend;

  foreach (var_5 in level.players) {
  if (isdefined(var_5)) {
  var_5._id_9903 = undefined;
  var_5 setthreatbiasgroup("players");
  }
  }

  var_3 delete();
}

_id_3350(var_0) {
  if (!_id_0A77::isreallyalive(self)) {
  var_0 delete();
  return;
  }

  self notify("c4_update", 0);
  var_0 thread _id_C4F4();
  thread _id_139C5();
  thread _id_139C4();
  thread _id_139C3();
  var_0 _meth_831F(self);
  var_0._id_1604 = 0;
  _id_C54E(var_0, "power_c4");
  var_1 = level._id_13C7D["c4_zm"];
  var_0 thread _id_57EB("tag_fx", var_1._id_B760["friendly"], var_1._id_B760["enemy"]);
  var_0 thread _id_3337();
  var_0 thread _id_3341();
  var_0 thread _id_139C7();
  level thread _id_B9CA(self, var_0);
}

_id_139C6() {
  self.owner endon("disconnect");
  var_0 = self.owner;
  var_1 = scripts\engine\utility::_id_107E6(self.origin, self.angles);
  var_1 linkto(self);
  thread _id_636E();
  self endon("end_explode");
  self waittill("explode", var_2);
  thread _id_334C(var_2, var_0, var_1);
}

_id_334C(var_0, var_1, var_2) {
  var_1 endon("disconnect");
  wait 0.5;
  var_2 _meth_8253(var_0, 256, 1200, 600, var_1, "MOD_EXPLOSIVE", "c4_zm");
  thread _id_3337();
}

_id_E24B() {
  wait 0.05;
  level._id_334B = 0;
}

_id_3341() {
  self endon("death");
  self waittill("missile_stuck", var_0);
  wait 0.05;
  self notify("activated");
  self._id_1604 = 1;
}

_id_139C7() {
  self endon("death");
  self waittill("missile_stuck", var_0);
  self _meth_8317(1);
  self._id_334F = 1;
  _id_69FF(var_0);
}

_id_C54E(var_0, var_1, var_2) {
  if (self._id_CC4C.size) {
  self._id_CC4C = scripts\engine\utility::_id_22BC(self._id_CC4C);

  if (self._id_CC4C.size >= level._id_B4BA) {
  if (scripts\engine\utility::_id_9CEE(var_2))
  self._id_CC4C[0] notify("detonateExplosive");
  else
  self._id_CC4C[0] _id_51B5();
  }
  }

  self._id_CC4C[self._id_CC4C.size] = var_0;
  var_3 = var_0 getentitynumber();
  level._id_B779[var_3] = var_0;
  level notify("mine_planted");
}

_id_139C3(var_0) {
  self notify("watchC4AltDetonate");
  self endon("watchC4AltDetonate");
  self endon("death");
  self endon("disconnect");
  self endon("detonated");
  level endon("game_ended");
  var_1 = 0;

  for (;;) {
  if (self usebuttonpressed()) {
  var_1 = 0;

  while (self usebuttonpressed()) {
  var_1 = var_1 + 0.05;
  wait 0.05;
  }

  if (var_1 >= 0.5)
  continue;

  var_1 = 0;

  while (!self usebuttonpressed() && var_1 < 0.5) {
  var_1 = var_1 + 0.05;
  wait 0.05;
  }

  if (var_1 >= 0.5)
  continue;

  if (!self._id_CC4C.size)
  return;

  if (!_id_0D12::_id_9DDF(self))
  self notify("alt_detonate");
  }

  wait 0.05;
  }
}

_id_139C4() {
  self notify("watchC4AltDetonation");
  self endon("watchC4AltDetonation");
  self endon("death");
  self endon("disconnect");

  for (;;) {
  self waittill("alt_detonate");
  var_0 = self getcurrentweapon();

  if (var_0 != "c4_zm")
  _id_3349();
  }
}

_id_139C5() {
  self notify("watchC4Detonation");
  self endon("watchC4Detonation");
  self endon("death");
  self endon("disconnect");

  for (;;) {
  self waittillmatch("detonate", "c4_zm");
  _id_3349();
  }
}

_id_3349() {
  foreach (var_1 in self._id_CC4C) {
  if (isdefined(var_1) && var_1._id_13C2E == "c4_zm") {
  var_1 thread _id_1369A(0.1);
  scripts\engine\utility::array_remove(self._id_CC4C, var_1);
  }
  }

  self notify("c4_update", 0);
  waittillframeend;
  self notify("detonated");
}

_id_1369A(var_0) {
  self endon("death");
  wait(var_0);
  _id_1382F();
  self notify("detonateExplosive");
}

_id_1382F() {
  if (!isdefined(self._id_55BA))
  return;

  self waittill("enabled");
}

_id_42DE() {
  var_0 = self._id_C731;
  var_0 endon("disconnect");
  thread _id_C836(var_0);
  var_1 = [];

  for (var_2 = 0; var_2 < 4; var_2++)
  var_1[var_2] = 0.2;

  var_3 = 0;

  foreach (var_5 in var_1)
  var_3 = var_3 + var_5;

  var_7 = spawn("script_model", self.origin);
  var_7 linkto(self);
  var_7 setmodel("tag_origin");
  var_7 setscriptmoverkillcam("explosive");
  var_7 thread _id_4E3D(self, var_3 + 5);
  var_7 thread _id_C836(self.owner);
  var_7._id_117F3 = self._id_117F3;
  var_8 = var_0 _id_0A77::_id_1302("cluster_grenade_indicator_mp", self.origin, (0, 0, 0));
  var_8 linkto(self);
  var_8 thread _id_4E3D(self, var_3);
  var_8 thread _id_C836(self.owner);
  thread _id_0A77::_id_C15A("death", "end_explode");
  self endon("end_explode");
  self waittill("explode", var_9);
  thread _id_42DA(var_9, var_1, var_0, var_7);
}

_id_42DA(var_0, var_1, var_2, var_3) {
  var_2 endon("disconnect");
  var_4 = scripts\engine\trace::_id_48BC(0, 1, 1, 0, 1, 0, 0);
  var_5 = 0;
  var_6 = var_0 + (0, 0, 3);
  var_7 = var_6 + (0, 0, -5);
  var_8 = physics_raycast(var_6, var_7, var_4, undefined, 0, "physicsquery_closest");

  if (isdefined(var_8) && var_8.size > 0)
  var_5 = 1;

  var_9 = scripts\engine\utility::ter_op(var_5, (0, 0, 32), (0, 0, 2));
  var_10 = var_0 + var_9;
  var_11 = randomint(90) - 45;
  var_4 = scripts\engine\trace::_id_48BC(0, 1, 1, 0, 1, 0, 0);

  for (var_12 = 0; var_12 < 4; var_12++) {
  var_3._id_FC6A = scripts\engine\utility::ter_op(var_12 == 0, 1, undefined);
  var_3 _meth_8253(var_0, 256, 800, 400, var_2, "MOD_EXPLOSIVE", "cluster_grenade_zm");
  var_13 = scripts\engine\utility::ter_op(var_12 < 4, 90 * var_12 + var_11, randomint(360));
  var_14 = scripts\engine\utility::ter_op(var_5, 110, 90);
  var_15 = scripts\engine\utility::ter_op(var_5, 12, 45);
  var_16 = var_14 + randomint(var_15 * 2) - var_15;
  var_17 = randomint(60) + 30;
  var_18 = cos(var_13) * sin(var_16);
  var_19 = sin(var_13) * sin(var_16);
  var_20 = cos(var_16);
  var_21 = (var_18, var_19, var_20) * var_17;
  var_6 = var_10;
  var_7 = var_10 + var_21;
  var_8 = physics_raycast(var_6, var_7, var_4, undefined, 0, "physicsquery_closest");

  if (isdefined(var_8) && var_8.size > 0)
  var_7 = var_8[0]["position"];

  playfx(scripts\engine\utility::_id_7ECB("clusterGrenade_explode"), var_7);

  switch (var_12) {
  case 0:
  playloopsound(var_7, "frag_grenade_explode");
  break;
  case 3:
  playloopsound(var_7, "cluster_explode_end");
  break;
  default:
  playloopsound(var_7, "cluster_explode_mid");
  }

  wait(var_1[var_12]);
  }
}

_id_4E3D(var_0, var_1) {
  self endon("death");
  var_0 waittill("death");
  wait(var_1);
  self delete();
}

_id_C836(var_0) {
  self endon("death");
  var_0 waittill("disconnect");
  self delete();
}

_id_F21A(var_0) {
  if (!isdefined(var_0))
  return;

  if (!isdefined(var_0._id_13C2E))
  return;

  if (!issubstr(var_0._id_13C2E, "semtex") && var_0._id_13C2E != "iw6_mk32_mp")
  return;

  var_0._id_C731 = self;
  var_0 waittill("missile_stuck", var_1);
  var_0 thread _id_858A();
  var_0 _id_69FF(undefined);
}

_id_DFC7(var_0, var_1, var_2) {
  if (!isdefined(var_0) && !isdefined(var_1))
  return;

  var_3 = [];
  var_4 = undefined;
  var_5 = undefined;

  if (isdefined(var_2))
  var_3[var_3.size] = var_2;
  else
  var_3 = var_1 _meth_8173();

  foreach (var_7 in var_3) {
  if (var_1 _id_8BD1(var_7, var_0)) {
  var_8 = _id_0A77::_id_80D8(var_7);
  var_9 = getweaponbasename(var_7);
  var_1 _meth_83B8(var_7);
  var_10 = getweaponattachments(var_7);

  foreach (var_12 in var_10) {
  if (issubstr(var_12, var_0)) {
  var_10 = scripts\engine\utility::array_remove(var_10, var_12);
  break;
  }
  }

  if (isdefined(level._id_31CF))
  var_5 = var_1 [[level._id_31CF]](var_9, undefined, var_10);

  if (isdefined(var_5)) {
  var_3 = self getweaponslistprimaries();

  foreach (var_2 in var_3) {
  if (issubstr(var_2, var_5)) {
  if (_id_0A77::_id_9D3E(var_2)) {
  var_9 = getweaponbasename(var_2);

  if (isdefined(level._id_1D48) && scripts\engine\utility::array_contains(level._id_1D48, var_9)) {
  var_5 = "alt_" + var_5;
  break;
  }
  }
  }
  }

  var_1 _id_0A77::_id_12C6(var_5, -1, -1, 1);
  var_1 _meth_83B5(var_5);
  }
  }
  }
}

_id_8BD1(var_0, var_1) {
  var_2 = strtok(var_0, "+");

  for (var_3 = 0; var_3 < var_2.size; var_3++) {
  if (var_2[var_3] == var_1)
  return 1;

  if (issubstr(var_2[var_3], var_1))
  return 1;
  }

  return 0;
}

_id_7DDC() {
  var_0 = [];
  var_1 = ["mp/attachmentTable.csv", "cp/zombies/zombie_attachmenttable.csv"];

  foreach (var_3 in var_1) {
  var_4 = 0;

  for (var_5 = tablelookup(var_3, 0, var_4, 5); var_5 != ""; var_5 = tablelookup(var_3, 0, var_4, 5)) {
  if (!scripts\engine\utility::array_contains(var_0, var_5))
  var_0[var_0.size] = var_5;

  var_4++;
  }
  }

  return var_0;
}

_id_7DCF() {
  var_0 = [];
  var_1 = 0;

  for (var_2 = tablelookup("cp/zombies/zombie_attachmenttable.csv", 0, var_1, 5); var_2 != ""; var_2 = tablelookup("cp/zombies/zombie_attachmenttable.csv", 0, var_1, 5)) {
  if (!scripts\engine\utility::array_contains(var_0, var_2))
  var_0[var_0.size] = var_2;

  var_1++;
  }

  return var_0;
}

_id_8BBB(var_0) {
  var_1 = self _meth_8173();

  foreach (var_3 in var_1) {
  var_4 = _id_0A77::_id_80D8(var_0);
  var_5 = _id_0A77::_id_80D8(var_3);

  if (var_4 == var_5)
  return 1;
  }

  return 0;
}

_id_48A4(var_0, var_1, var_2) {
  level._id_2497 = [];
  level._id_2498 = [];

  foreach (var_4 in var_0) {
  var_5 = tablelookup(var_1, 4, var_4, 5);

  if (var_2 == "zombie") {
  if (!isdefined(var_5) || var_5 == "")
  var_5 = tablelookup("cp/zombies/zombie_attachmenttable.csv", 4, var_4, 5);
  }

  if (var_4 == var_5)
  continue;

  level._id_2497[var_4] = var_5;
  var_6 = tablelookup("mp/attachmenttable.csv", 4, var_4, 13);

  if (var_6 != "") {
  level._id_2498[var_4] = var_6;
  level._id_248B[var_6] = 1;
  }
  }
}

_id_31D5() {
  var_0 = ["mp/attachmentTable.csv", "cp/zombies/zombie_attachmenttable.csv"];
  var_1 = ["mp/attachmentmap.csv", "cp/zombies/zombie_attachmentmap.csv"];
  level._id_2497 = [];
  level._id_2498 = [];
  level._id_248B = [];
  level._id_2491 = [];
  level._id_2493 = [];
  level._id_2492 = [];

  foreach (var_3 in var_0) {
  var_4 = _id_7DDF(var_3);

  foreach (var_6 in var_4) {
  var_7 = tablelookup(var_3, 4, var_6, 5);

  if (var_6 != var_7)
  level._id_2497[var_6] = var_7;

  var_8 = tablelookup(var_3, 4, var_6, 13);

  if (var_8 != "") {
  level._id_2498[var_6] = var_8;
  level._id_248B[var_8] = 1;
  }
  }

  foreach (var_11 in var_1) {
  var_12 = [];
  var_13 = 1;

  for (var_14 = tablelookupbyrow(var_11, var_13, 0); var_14 != ""; var_14 = tablelookupbyrow(var_11, var_13, 0)) {
  var_12[var_12.size] = var_14;
  var_13++;
  }

  var_15 = [];
  var_16 = 1;

  for (var_17 = tablelookupbyrow(var_11, 0, var_16); var_17 != ""; var_17 = tablelookupbyrow(var_11, 0, var_16)) {
  var_15[var_17] = var_16;
  var_16++;
  }

  foreach (var_14 in var_12) {
  foreach (var_22, var_20 in var_15) {
  var_21 = tablelookup(var_11, 0, var_14, var_20);

  if (var_21 == "")
  continue;

  if (!isdefined(level._id_2492[var_14]))
  level._id_2492[var_14] = [];

  level._id_2492[var_14][var_22] = var_21;
  }
  }

  foreach (var_25 in var_4) {
  var_26 = tablelookup(var_3, 4, var_25, 12);

  if (var_26 == "")
  continue;

  level._id_2491[var_25] = var_26;
  }

  var_28 = 1;

  for (var_29 = tablelookupbyrow("mp/attachmentcombos.csv", var_28, 0); var_29 != ""; var_29 = tablelookupbyrow("mp/attachmentcombos.csv", var_28, 0)) {
  var_30 = 1;

  for (var_31 = tablelookupbyrow("mp/attachmentcombos.csv", 0, var_30); var_31 != ""; var_31 = tablelookupbyrow("mp/attachmentcombos.csv", 0, var_30)) {
  if (var_29 != var_31) {
  var_32 = tablelookupbyrow("mp/attachmentcombos.csv", var_28, var_30);
  var_33 = scripts\engine\utility::_id_1D3A([var_29, var_31]);
  var_34 = var_33[0] + "_" + var_33[1];

  if (var_32 == "no" && !isdefined(level._id_2493[var_34]))
  level._id_2493[var_34] = 1;
  }

  var_30++;
  }

  var_28++;
  }
  }
  }
}

_id_4980(var_0, var_1, var_2, var_3) {
  if (var_0 == "zombie") {
  foreach (var_5 in var_1) {
  foreach (var_9, var_7 in var_2) {
  var_8 = tablelookup(var_3, 0, var_5, var_7);

  if (var_8 == "")
  continue;

  if (!isdefined(level._id_2492[var_5]))
  level._id_2492[var_5] = [];

  if (var_8 == "none") {
  level._id_2492[var_5][var_9] = undefined;
  continue;
  }

  level._id_2492[var_5][var_9] = var_8;
  }
  }
  }
}

_id_7DDF(var_0) {
  var_1 = getdvar("g_gametype");
  var_2 = [];
  var_3 = 0;

  for (var_4 = tablelookup(var_0, 0, var_3, 4); var_4 != ""; var_4 = tablelookup(var_0, 0, var_3, 4)) {
  var_2[var_2.size] = var_4;
  var_3++;
  }

  return var_2;
}

_id_858A(var_0) {
  self notify("grenade_earthQuake");
  self endon("grenade_earthQuake");
  thread _id_636E();
  self endon("end_explode");
  var_1 = undefined;

  if (!isdefined(var_0) || var_0)
  self waittill("explode", var_1);
  else
  var_1 = self.origin;

  playrumbleonentity("grenade_rumble", var_1);
  earthquake(0.5, 0.75, var_1, 800);

  foreach (var_3 in level.players) {
  if (var_3 _id_0A77::isusingremote())
  continue;

  if (distancesquared(var_1, var_3.origin) > 360000)
  continue;

  if (var_3 _meth_808F(var_1))
  var_3 thread _id_54F0(var_1);

  var_3 setclientomnvar("ui_hud_shake", 1);
  }
}

_id_3337() {
  thread _id_636E();
  self endon("end_explode");
  self waittill("explode", var_0);
  playrumbleonentity("grenade_rumble", var_0);
  earthquake(0.4, 0.75, var_0, 512);

  foreach (var_2 in level.players) {
  if (var_2 _id_0A77::isusingremote())
  continue;

  if (distance(var_0, var_2.origin) > 512)
  continue;

  if (var_2 _meth_808F(var_0))
  var_2 thread _id_54F0(var_0);

  var_2 setclientomnvar("ui_hud_shake", 1);
  }
}

_id_636E() {
  self waittill("death");
  waittillframeend;
  self notify("end_explode");
}

_id_54F0(var_0) {
  self notify("dirtEffect");
  self endon("dirtEffect");
  self endon("disconnect");

  if (!_id_0A77::isreallyalive(self))
  return;

  var_1 = vectornormalize(anglestoforward(self.angles));
  var_2 = vectornormalize(anglestoright(self.angles));
  var_3 = vectornormalize(var_0 - self.origin);
  var_4 = vectordot(var_3, var_1);
  var_5 = vectordot(var_3, var_2);
  var_6 = ["death", "damage"];

  if (var_4 > 0 && var_4 > 0.5 && self getcurrentweapon() != "iw6_riotshield_mp")
  scripts\engine\utility::_id_1372E(var_6, 2.0);
  else if (abs(var_4) < 0.866) {
  if (var_5 > 0)
  scripts\engine\utility::_id_1372E(var_6, 2.0);
  else
  scripts\engine\utility::_id_1372E(var_6, 2.0);
  }
}

_id_FC6A(var_0, var_1) {
  if (_id_9DFA())
  return;

  if (var_0 == "MOD_EXPLOSIVE" || var_0 == "MOD_GRENADE" || var_0 == "MOD_GRENADE_SPLASH" || var_0 == "MOD_PROJECTILE" || var_0 == "MOD_PROJECTILE_SPLASH") {
  if (var_1 > 10) {
  if (isdefined(self._id_FC6B) && self._id_FC6B)
  self shellshock("frag_grenade_mp", self._id_FC6B);
  else
  self shellshock("frag_grenade_mp", 0.5);
  }
  }
}

_id_9DFA() {
  return isdefined(self._id_6ECA) && gettime() < self._id_6ECA;
}

_id_1377A() {
  for (;;) {
  self waittill("grenade_fire", var_0, var_1, var_2);

  if (isdefined(self._id_11817) && var_1 != self._id_11817)
  continue;

  if (isdefined(var_0)) {
  if (!isdefined(var_0._id_13C2E))
  var_0._id_13C2E = var_1;

  if (!isdefined(var_0.owner))
  var_0.owner = self;

  if (!isdefined(var_0.team))
  var_0.team = self.team;

  if (!isdefined(var_0._id_118A2) && isdefined(self._id_11817))
  var_0._id_118A2 = _id_0A77::_id_E76A(4 * var_2);
  }

  if (!_id_0A77::isreallyalive(self) && !isdefined(self._id_1182A)) {
  self notify("grenade_fire_dead", var_0, var_1);
  self._id_1182A = 1;
  }

  return var_0;
  }
}

_id_3862(var_0, var_1) {
  if (isdefined(var_1))
  var_2 = var_1;
  else
  var_2 = self getcurrentweapon();

  var_3 = getweaponbasename(var_2);
  var_4 = _id_0A77::_id_4626(var_3);
  var_5 = _id_7BCA(var_4, var_3, var_0);

  if (!var_5)
  return 0;

  return 1;
}

_id_169D(var_0, var_1, var_2, var_3) {
  if (isdefined(var_1))
  var_4 = var_1;
  else
  var_4 = _id_0A77::getvalidtakeweapon();

  var_5 = getweaponbasename(var_4);
  var_6 = 0;
  var_7 = getweaponattachments(var_4);
  var_8 = _id_0A77::getcurrentcamoname(var_4);
  var_9 = _id_E469(var_4, var_0, var_7, undefined, var_8);

  if (!isdefined(var_9) || isdefined(var_9) && var_9 == "none")
  return 0;

  var_10 = _id_0A77::_id_9D3E(var_1);

  if (_id_0A77::_id_13C90(var_9, "xmags"))
  var_6 = 1;

  if (isdefined(var_0)) {
  if (!issubstr(var_0, "pap")) {
  var_11 = self getweaponammoclip(var_4);
  var_12 = self getweaponammostock(var_4);

  if (issubstr(var_9, "akimbo"))
  var_13 = self getweaponammoclip(var_4, "left");
  else
  var_13 = undefined;

  self _meth_83B8(var_4);
  _id_0A77::_id_12C6(var_9, undefined, undefined, 1);

  if (_id_0A77::_id_13C90(var_9, "xmags") && !var_6)
  var_11 = weaponclipsize(var_9);

  self setweaponammoclip(var_9, var_11);
  self setweaponammostock(var_9, var_12);

  if (isdefined(var_13))
  self setweaponammoclip(var_9, var_13, "left");
  } else {
  if (issubstr(var_9, "katana") || issubstr(var_9, "nunchucks")) {}

  self _meth_83B8(var_4);
  _id_0A77::_id_12C6(var_9, undefined, undefined, 0);
  self givemaxammo(var_9);
  }
  }

  self playlocalsound("weap_raise_large_plr");
  var_14 = self getweaponslistprimaries();

  foreach (var_1 in var_14) {
  if (issubstr(var_1, var_9)) {
  if (_id_0A77::_id_9D3E(var_1)) {
  var_16 = getweaponbasename(var_1);

  if (isdefined(level._id_1D48) && scripts\engine\utility::array_contains(level._id_1D48, var_16) || var_10) {
  var_9 = "alt_" + var_9;
  break;
  }
  }
  }
  }

  if (scripts\engine\utility::_id_9CEE(var_3))
  return 1;

  if (scripts\engine\utility::_id_9CEE(var_2))
  self _meth_83B6(var_9);
  else
  self _meth_83B5(var_9);

  return 1;
}

_id_9E02(var_0) {
  if (!isdefined(var_0))
  return 0;

  var_1 = getweaponbasename(var_0);

  if (isdefined(var_1)) {
  if (var_1 == "iw7_forgefreeze_zm" || var_1 == "iw7_forgefreeze_zm_pap1" || var_1 == "iw7_forgefreeze_zm_pap2" || var_1 == "zfreeze_semtex_mp") {
  if (_id_0A77::_id_9D3E(var_0))
  return 0;
  else
  return 1;
  }
  }

  return 0;
}

_id_9D3D(var_0) {
  if (!isdefined(var_0))
  return 0;

  var_1 = getweaponbasename(var_0);

  if (isdefined(var_1)) {
  if (var_1 == "iw7_forgefreeze_zm" || var_1 == "iw7_forgefreeze_zm_pap1" || var_1 == "iw7_forgefreeze_zm_pap2" || var_1 == "zfreeze_semtex_mp") {
  if (_id_0A77::_id_9D3E(var_0))
  return 1;
  else
  return 0;
  }
  }

  return 0;
}

_id_9F79(var_0) {
  var_1 = getweaponbasename(var_0);

  if (!isdefined(var_1))
  return 0;

  return var_1 == "iw7_steeldragon_zm";
}

_id_9C62(var_0) {
  if (!isdefined(var_0))
  return 0;

  if (var_0 == "doubletap")
  return 1;

  return 0;
}

_id_9B6B(var_0) {
  if (!isdefined(var_0))
  return 0;

  if (issubstr(var_0, "ark"))
  return 1;

  if (issubstr(var_0, "arcane"))
  return 1;

  return 0;
}

_id_9C43(var_0) {
  if (!isdefined(var_0))
  return 0;

  if (issubstr(var_0, "mod"))
  return 1;

  return 0;
}

_id_9BB4(var_0, var_1) {
  var_2 = _id_0A77::_id_13C76(var_1);

  if (!isdefined(var_2) || var_2.size < 1)
  return 0;

  foreach (var_4 in var_2) {
  if (var_0 == var_4)
  return 1;
  }

  return 0;
}

_id_9C5E(var_0) {
  if (!isdefined(var_0))
  return 0;

  if (issubstr(var_0, "pap"))
  return 1;

  return 0;
}

_id_7BCA(var_0, var_1, var_2) {
  if (!isdefined(var_0))
  return 0;

  if (!isdefined(var_1))
  return 0;

  if (!isdefined(var_2))
  return 0;

  var_3 = [];
  var_4 = _id_0A77::_id_7DF7(var_1);

  if (isdefined(level._id_2492[var_4])) {
  if (isdefined(level._id_2492[var_4][var_2])) {
  if (level._id_2492[var_4][var_2] != "none")
  return 1;
  else
  return 0;
  }
  }

  if (isdefined(level._id_2492[var_0])) {
  if (isdefined(level._id_2492[var_0][var_2])) {
  if (level._id_2492[var_0][var_2] != "none")
  return 1;
  else
  return 0;
  }
  }

  if (isdefined(level._id_2492[var_4])) {
  var_5 = getarraykeys(level._id_2492[var_4]);

  foreach (var_7 in var_5) {
  if (level._id_2492[var_4][var_7] == var_2) {
  if (level._id_2492[var_4][var_7] != "none")
  return 1;
  else
  return 0;
  }
  }
  }

  if (isdefined(level._id_2492[var_0])) {
  var_5 = getarraykeys(level._id_2492[var_0]);

  foreach (var_7 in var_5) {
  if (level._id_2492[var_0][var_7] == var_2) {
  if (level._id_2492[var_0][var_7] != "none")
  return 1;
  else
  return 0;
  }
  }
  }

  return 0;
}

_id_E469(var_0, var_1, var_2, var_3, var_4) {
  if (isdefined(var_0))
  var_5 = var_0;
  else
  var_5 = self getcurrentweapon();

  var_6 = getweaponbasename(var_5);
  var_7 = _id_0A77::_id_7D72(self, var_5);
  var_8 = 0;
  var_9 = 0;
  var_10 = 0;
  var_11 = 0;
  var_12 = undefined;
  var_13 = [];
  var_14 = 7;
  var_15 = [];
  var_16 = 1;
  var_17 = [];
  var_18 = 1;
  var_19 = [];
  var_20 = 4;
  var_21 = [];
  var_22 = 1;
  var_23 = [];
  var_24 = 1;
  var_25 = [];
  var_26 = 15;
  var_27 = _id_0A77::_id_4626(var_6);

  if (_id_0A77::_id_13C90(var_5, "xmags"))
  var_9 = 1;

  var_28 = _id_7BCA(var_27, var_6, var_1);

  if (!var_28 && isdefined(var_1)) {
  if (!scripts\engine\utility::_id_9CEE(var_3))
  _id_0A77::_id_F78C("cant_attach", &"COOP_PILLAGE_CANT_USE", 3);

  return undefined;
  }

  if (!isdefined(var_2))
  var_2 = getweaponattachments(var_5);

  if (_id_0A77::_id_8BBE("perk_machine_rat_a_tat")) {
  if (_id_7BCA(var_27, var_6, "doubletap"))
  var_2[var_2.size] = "doubletap";
  }

  if (isdefined(var_1)) {
  if (weaponclass(var_0) == "spread") {
  if (issubstr(var_1, "arkyellow")) {
  foreach (var_30 in var_2) {
  if (issubstr(var_30, "smart"))
  var_2 = scripts\engine\utility::array_remove(var_2, var_30);
  }
  }
  }
  }

  var_2 = scripts\engine\utility::_id_22AF(var_2);
  var_2 = scripts\engine\utility::_id_22BC(var_2);

  if (var_2.size > 0 && var_2.size <= var_26) {
  foreach (var_33 in var_2) {
  if (_id_9C5E(var_33)) {
  if (var_17.size < var_18) {
  var_17[var_17.size] = var_33;
  var_25[var_25.size] = var_33;
  }
  else
  continue;

  continue;
  }

  if (_id_9B6B(var_33)) {
  if (var_23.size < var_24) {
  var_23[var_23.size] = var_33;
  var_25[var_25.size] = var_33;
  }
  else
  continue;

  continue;
  }

  if (_id_9C43(var_33)) {
  if (var_19.size < var_20) {
  var_19[var_19.size] = var_33;
  var_25[var_25.size] = var_33;
  }
  else
  continue;

  continue;
  }

  if (_id_9BB4(var_33, _id_0A77::_id_8234(var_6))) {
  if (var_21.size < var_22) {
  var_21[var_21.size] = var_33;
  var_25[var_25.size] = var_33;
  }
  else
  continue;

  continue;
  }

  if (_id_9C62(var_33)) {
  if (var_15.size < var_16) {
  var_15[var_15.size] = var_33;
  var_25[var_25.size] = var_33;
  }
  else
  continue;

  continue;
  }

  if (var_13.size < var_14) {
  var_13[var_13.size] = var_33;
  var_25[var_25.size] = var_33;
  continue;
  }

  continue;
  }
  }

  if (isdefined(var_1)) {
  var_35 = _id_0A77::_id_2494(var_1);

  if (isdefined(var_35) && var_35 != "none") {
  for (var_36 = 0; var_36 < var_25.size; var_36++) {
  var_37 = _id_0A77::_id_2494(var_25[var_36]);

  if (var_37 == var_35) {
  var_25[var_36] = var_1;
  var_8 = 1;
  break;
  }
  }
  }

  var_38 = _id_0A77::_id_7DE1(var_1);

  if (isdefined(var_38) && var_38 != "none") {
  if (!var_8) {
  if (_id_9C5E(var_1)) {
  if (var_17.size < var_18) {
  var_17[var_17.size] = var_1;
  var_25[var_25.size] = var_1;
  } else {
  for (var_36 = 0; var_36 < var_25.size; var_36++) {
  var_39 = _id_0A77::_id_7DE1(var_25[var_36]);

  if (var_39 == var_38) {
  var_17[var_17.size] = var_1;
  var_25[var_36] = var_1;
  var_8 = 1;
  break;
  }
  }
  }
  }
  else if (_id_9B6B(var_1)) {
  if (var_23.size < var_24) {
  var_23[var_23.size] = var_1;
  var_25[var_25.size] = var_1;
  } else {
  for (var_36 = 0; var_36 < var_25.size; var_36++) {
  var_39 = _id_0A77::_id_7DE1(var_25[var_36]);

  if (var_39 == var_38) {
  var_23[var_15.size] = var_1;
  var_25[var_36] = var_1;
  var_8 = 1;
  break;
  }
  }
  }
  }
  else if (_id_9C62(var_1)) {
  if (var_15.size < var_16) {
  var_15[var_15.size] = var_1;
  var_25[var_25.size] = var_1;
  } else {
  for (var_36 = 0; var_36 < var_25.size; var_36++) {
  var_39 = _id_0A77::_id_7DE1(var_25[var_36]);

  if (var_39 == var_38) {
  var_15[var_15.size] = var_1;
  var_25[var_36] = var_1;
  var_8 = 1;
  break;
  }
  }
  }
  }
  else if (var_13.size < var_14) {
  var_13[var_13.size] = var_1;
  var_25[var_25.size] = var_1;
  } else {
  for (var_36 = 0; var_36 < var_25.size; var_36++) {
  var_39 = _id_0A77::_id_7DE1(var_25[var_36]);

  if (var_39 == var_38) {
  var_13[var_13.size] = var_1;
  var_25[var_36] = var_1;
  var_8 = 1;
  break;
  }
  }

  if (!var_8)
  return undefined;
  }
  }
  else if (_id_9C62(var_1)) {
  var_17[var_17.size] = var_1;
  var_25[var_25.size] = var_1;
  }
  else if (_id_9C5E(var_1)) {
  var_15[var_15.size] = var_1;
  var_25[var_25.size] = var_1;
  }
  else if (_id_9B6B(var_1)) {
  var_23[var_23.size] = var_1;
  var_25[var_25.size] = var_1;
  } else {
  var_13[var_13.size] = var_1;
  var_25[var_25.size] = var_1;
  }
  }
  else if (isdefined(var_1)) {
  if (_id_9C62(var_1)) {
  var_15[var_15.size] = var_1;
  var_25[var_25.size] = var_1;
  }
  else if (_id_9C5E(var_1)) {
  var_17[var_17.size] = var_1;
  var_25[var_25.size] = var_1;
  }
  else if (_id_9B6B(var_1)) {
  var_23[var_23.size] = var_1;
  var_25[var_25.size] = var_1;
  } else {
  var_13[var_13.size] = var_1;
  var_25[var_25.size] = var_1;
  }
  }
  }

  var_40 = _id_0A77::_id_8234(var_6);
  var_41 = isdefined(self._id_13C00[_id_0A77::_id_80D8(var_5)]);

  if (!isdefined(var_4) && var_41)
  var_10 = _id_0A77::getweaponcamo(var_40);
  else
  var_10 = var_4;

  if (var_41) {
  var_42 = 0;

  foreach (var_30 in var_25) {
  if (issubstr(var_30, "cos_")) {
  var_42 = 1;
  var_12 = undefined;
  break;
  }
  }

  if (!var_42)
  var_12 = _id_0A77::getweaponcosmeticattachment(var_40);

  var_11 = _id_0A77::getweaponreticle(var_40);
  var_45 = _id_0A77::getweaponpaintjobid(var_40);
  } else {
  var_12 = undefined;
  var_11 = undefined;
  var_45 = undefined;
  }

  foreach (var_30 in var_25) {
  if (issubstr(var_30, "arcane") || issubstr(var_30, "ark")) {
  foreach (var_48 in var_25) {
  if (var_30 == var_48)
  continue;

  if (issubstr(var_48, "cos_"))
  var_25 = scripts\engine\utility::array_remove(var_25, var_48);
  }

  var_12 = undefined;
  }
  }

  var_51 = _id_0A77::_id_BD68(var_40, var_25, var_10, var_11, var_7, self getentitynumber(), self._id_41F0, var_45, var_12);

  if (isdefined(var_51))
  return var_51;
  else
  return var_5;
}

_id_7DE2(var_0, var_1) {
  var_2 = _id_0A77::_id_8217(var_0);
  var_3 = [];

  foreach (var_5 in var_2) {
  var_6 = _id_0A77::_id_7DE1(var_5);

  if (isdefined(var_1) && _id_0A77::_id_AD7F(var_1, var_5))
  continue;

  if (!isdefined(var_3[var_6]))
  var_3[var_6] = [];

  var_7 = var_3[var_6];
  var_7[var_7.size] = var_5;
  var_3[var_6] = var_7;
  }

  return var_3;
}

_id_7DDD() {
  var_0 = [];
  var_1 = ["mp/attachmentTable.csv", "cp/zombies/zombie_attachmenttable.csv"];

  foreach (var_3 in var_1) {
  var_4 = 0;

  for (var_5 = tablelookup(var_3, 0, var_4, 5); var_5 != ""; var_5 = tablelookup(var_3, 0, var_4, 5)) {
  var_6 = tablelookup(var_3, 0, var_4, 2);

  if (var_6 != "none" && !scripts\engine\utility::array_contains(var_0, var_5))
  var_0[var_0.size] = var_5;

  var_4++;
  }
  }

  return var_0;
}

_id_8216(var_0) {
  var_1 = [];
  var_2 = _id_0A77::_id_7DF7(var_0);
  var_3 = _id_0A77::_id_4626(var_0);

  if (isdefined(level._id_2492[var_2]))
  var_1 = scripts\engine\utility::_id_227F(var_1, level._id_2492[var_2]);

  if (isdefined(level._id_2492[var_3]))
  var_1 = scripts\engine\utility::_id_227F(var_1, level._id_2492[var_3]);

  return var_1;
}

_id_9FED(var_0) {
  if (!isdefined(level._id_13CBF)) {
  level._id_13CBF = [];

  foreach (var_2 in level._id_13CA0)
  level._id_13CBF[var_2] = 1;
  }

  if (isdefined(level._id_13CBF[var_0]))
  return 1;

  return 0;
}

_id_FB18() {
  self endon("death");
  self endon("disconnect");
  self endon("unsetWeaponLaser");
  self._id_CA6A = 0;
  var_0 = self getcurrentweapon();

  for (;;) {
  _id_FB1C(var_0);

  if (self._id_CA6A == 0) {
  self._id_CA6A = 1;
  _id_6282();
  }

  childthread _id_FB19();
  childthread _id_FB1A(1.0);
  self._id_CA69 = undefined;
  self waittill("weapon_change", var_0);

  if (self._id_CA6A == 1) {
  self._id_CA6A = 0;
  _id_561C();
  }
  }
}

_id_FB1C(var_0) {
  for (;;) {
  var_0 = getweaponbasename(var_0);

  if (isdefined(var_0) && (var_0 == "iw6_kac_mp" || var_0 == "iw6_arx160_mp"))
  break;

  self waittill("weapon_change", var_0);
  }
}

_id_FB19() {
  self endon("weapon_change");

  for (;;) {
  if (!isdefined(self._id_CA69) || self._id_CA69 == 0) {
  if (self playerads() > 0.6) {
  if (self._id_CA6A == 1) {
  self._id_CA6A = 0;
  _id_561C();
  }
  }
  else if (self._id_CA6A == 0) {
  self._id_CA6A = 1;
  _id_6282();
  }
  }

  scripts\engine\utility::waitframe();
  }
}

_id_FB1A(var_0) {
  self endon("weapon_change");

  for (;;) {
  self waittill("weapon_switch_started");
  childthread _id_FB1B(var_0);
  }
}

_id_FB1B(var_0) {
  self notify("setWeaponLaser_onWeaponSwitchStart");
  self endon("setWeaponLaser_onWeaponSwitchStart");

  if (self._id_CA6A == 1) {
  self._id_CA69 = 1;
  self._id_CA6A = 0;
  _id_561C();
  }

  wait(var_0);
  self._id_CA69 = undefined;

  if (self._id_CA6A == 0 && self playerads() <= 0.6) {
  self._id_CA6A = 1;
  _id_6282();
  }
}

_id_6282() {
  if (!isdefined(self._id_13C9E))
  self._id_13C9E = 0;

  self._id_13C9E++;
  self laseron();
}

_id_561C() {
  self._id_13C9E--;

  if (self._id_13C9E == 0) {
  self laseroff();
  self._id_13C9E = undefined;
  }
}

_id_C4F4(var_0) {
  self endon("death");
  level endon("game_ended");
  thread _id_40F5();
  self waittill("detonateExplosive");

  if (isdefined(var_0))
  self.owner notify(var_0, 1);
  else
  self.owner notify("powers_c4_used", 1);

  self _meth_8099(self.owner);
}

_id_40F5() {
  self endon("deleted_equipment");
  level endon("game_ended");
  var_0 = self getentitynumber();
  var_1 = self._id_A63A;
  var_2 = self.trigger;
  var_3 = self._id_F232;
  self waittill("death");
  _id_40F4(var_0, var_1, var_2, var_3);
}

_id_40F4(var_0, var_1, var_2, var_3) {
  if (isdefined(self._id_13C2E)) {
  if (self._id_13C2E == "c4_zm")
  self.owner notify("c4_update", 0);
  else if (self._id_13C2E == "bouncingbetty_mp")
  self.owner notify("bouncing_betty_update", 0);
  else if (self._id_13C2E == "sticky_mine_mp")
  self.owner notify("sticky_mine_update", 0);
  else if (self._id_13C2E == "trip_mine_mp")
  self.owner notify("trip_mine_update", 0);
  else if (self._id_13C2E == "cryo_grenade_mp")
  self.owner notify("restart_cryo_grenade_cooldown", 0);
  }

  if (isdefined(var_0))
  level._id_B779[var_0] = undefined;

  if (isdefined(var_1))
  var_1 delete();

  if (isdefined(var_2))
  var_2 delete();

  if (isdefined(var_3))
  var_3 delete();
}

monitordamage(var_0, var_1, var_2, var_3, var_4, var_5) {
  self endon("death");
  level endon("game_ended");

  if (!isdefined(var_5))
  var_5 = 0;

  self setcandamage(1);
  self.health = 999999;
  self.maxhealth = var_0;
  self._id_00E1 = 0;

  if (!isdefined(var_4))
  var_4 = 0;

  for (var_6 = 1; var_6; var_6 = monitordamageoneshot(var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14, var_15, var_16, var_1, var_2, var_3, var_4)) {
  self waittill("damage", var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14, var_15, var_16);

  if (var_5)
  self playrumbleonentity("damage_light");

  if (isdefined(self.helitype) && self.helitype == "littlebird") {
  if (!isdefined(self.attackers))
  self.attackers = [];

  var_17 = "";

  if (isdefined(var_8) && isplayer(var_8))
  var_17 = var_8 _id_0A77::_id_81EC();

  if (isdefined(self.attackers[var_17]))
  self.attackers[var_17] = self.attackers[var_17] + var_7;
  else
  self.attackers[var_17] = var_7;
  }
  }
}

monitordamageoneshot(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13) {
  if (!isdefined(self))
  return 0;

  if (isdefined(var_1) && !_id_0A77::_id_9E0E(var_1) && !isdefined(var_1._id_1C9F))
  return 1;

  return 1;
}

_id_69FF(var_0, var_1) {
  var_2 = spawnstruct();
  var_2._id_AD39 = var_0;
  var_2._id_4E53 = ::_id_BD4F;
  var_2._id_6371 = "death";

  if (!isdefined(var_1) || !var_1)
  var_2._id_9B11 = _id_0A60::_id_BD3C;

  thread _id_0A60::_id_892F(var_2);
}

_id_BD4F(var_0) {
  if (!isdefined(var_0._id_AA33) || !isdefined(var_0._id_AA33._id_5318) || var_0._id_AA33._id_5318)
  self notify("detonateExplosive");
}

_id_B2A5() {
  if (_id_0A77::isreallyalive(self.owner)) {
  self _meth_831F(self.owner);
  self.trigger = spawn("script_origin", self.origin + _id_7EAA());
  self.trigger.owner = self;
  thread _id_66B5(self.owner, 1);
  }
}

_id_66B5(var_0, var_1) {
  self notify("equipmentWatchUse");
  self endon("spawned_player");
  self endon("disconnect");
  self endon("equipmentWatchUse");
  self.trigger setcursorhint("HINT_NOICON");

  switch (self._id_13C2E) {
  case "c4_zm":
  self.trigger sethintstring(&"MP_PICKUP_C4");
  break;
  case "claymore_mp":
  self.trigger sethintstring(&"MP_PICKUP_CLAYMORE");
  break;
  case "bouncingbetty_mp":
  self.trigger sethintstring(&"MP_PICKUP_BOUNCING_BETTY");
  break;
  case "proximity_explosive_mp":
  self.trigger sethintstring(&"MP_PICKUP_PROXIMITY_EXPLOSIVE");
  break;
  case "mobile_radar_mp":
  self.trigger sethintstring(&"MP_PICKUP_MOBILE_RADAR");
  break;
  case "ztransponder_mp":
  case "transponder_mp":
  self.trigger sethintstring(&"MP_PICKUP_TRANSPONDER");
  break;
  case "sonic_sensor_mp":
  self.trigger sethintstring(&"MP_PICKUP_SONIC_SENSOR");
  break;
  case "sticky_mine_mp":
  self.trigger sethintstring(&"MP_PICKUP_STICKY_MINE");
  break;
  case "blackhole_grenade_zm":
  case "blackhole_grenade_mp":
  self.trigger sethintstring(&"MP_PICKUP_BLACKHOLE_GRENADE");
  break;
  case "shard_ball_mp":
  self.trigger sethintstring(&"MP_PICKUP_SHARD_BALL");
  break;
  case "cryo_grenade_mp":
  self.trigger sethintstring(&"MP_PICKUP_CRYO_MINE");
  break;
  case "trip_mine_mp":
  self.trigger sethintstring(&"MP_PICKUP_TRIP_MINE");
  break;
  case "arc_grenade_mine_mp":
  self.trigger sethintstring(&"MP_PICKUP_ARC_MINE");
  break;
  }

  self.trigger _id_0A77::_id_F838(var_0);
  self.trigger thread _id_0A77::_id_C18A(var_0);

  if (isdefined(var_1) && var_1)
  thread _id_12F4D();

  for (;;) {
  self.trigger waittill("trigger", var_0);
  var_0 playlocalsound("scavenger_pack_pickup");
  var_0 notify("scavenged_ammo", self._id_13C2E);
  var_0 setweaponammostock(self._id_13C2E, var_0 getweaponammostock(self._id_13C2E) + 1);
  _id_51B5();
  self notify("death");
  }
}

_id_12F4D() {
  self endon("death");

  for (;;) {
  if (isdefined(self) && isdefined(self.trigger)) {
  self.trigger.origin = self.origin + _id_7EAA();

  if (isdefined(self._id_2C68))
  self._id_2C68.origin = self.origin;
  }
  else
  return;

  wait 0.05;
  }
}

_id_51B5(var_0) {
  if (isdefined(self)) {
  var_1 = self getentitynumber();
  var_2 = self._id_A63A;
  var_3 = self.trigger;
  var_4 = self._id_F232;
  _id_40F4(var_1, var_2, var_3, var_4);
  self notify("deleted_equipment");
  self delete();
  }
}

_id_C5AC(var_0) {
  if (self._id_CC4D.size) {
  self._id_CC4D = scripts\engine\utility::_id_22BC(self._id_CC4D);

  if (self._id_CC4D.size >= level._id_B4BA)
  self._id_CC4D[0] notify("detonateExplosive");
  }

  self._id_CC4D[self._id_CC4D.size] = var_0;
  var_1 = var_0 getentitynumber();
  level._id_B779[var_1] = var_0;
  level notify("mine_planted");
}

_id_66A6(var_0) {
  var_1 = spawnfx(scripts\engine\utility::_id_7ECB("equipment_sparks"), self.origin);
  triggerfx(var_1);

  if (!isdefined(var_0) || var_0 == 0)
  self playsound("sentry_explode");

  var_1 thread _id_0A77::_id_5106(1);
}

_id_66A8() {
  var_0 = spawnfx(scripts\engine\utility::_id_7ECB("placeEquipmentFailed"), self.origin);
  triggerfx(var_0);
  self playsound("mp_killstreak_disappear");
  var_0 thread _id_0A77::_id_5106(1);
}

_id_B9CA(var_0, var_1) {
  level endon("game_ended");
  var_1 endon("death");
  var_0 scripts\engine\utility::waittill_any("joined_team", "joined_spectators", "disconnect");
  var_1 _id_51B5();
}

_id_9F0E(var_0) {
  if (var_0 == "none")
  return 0;

  if (weaponinventorytype(var_0) != "primary")
  return 0;

  switch (weaponclass(var_0)) {
  case "smg":
  case "sniper":
  case "rocketlauncher":
  case "mg":
  case "rifle":
  case "spread":
  case "pistol":
  return 1;
  default:
  return 0;
  }
}

_id_7EAA() {
  var_0 = anglestoup(self.angles);
  return 10 * var_0;
}

_id_9E6D(var_0) {
  return issubstr(var_0, "knife");
}

_id_9C22(var_0) {
  if (isdefined(level._id_1E43)) {
  if (scripts\engine\utility::array_contains(level._id_1E43, var_0))
  return 1;
  }

  return 0;
}

_id_9D75(var_0) {
  if (var_0 == "none" || _id_0A77::_id_9F2D(var_0) || _id_9E6D(var_0))
  return 0;

  switch (weaponclass(var_0)) {
  case "smg":
  case "sniper":
  case "mg":
  case "rifle":
  case "spread":
  case "pistol":
  return 1;
  default:
  return 0;
  }
}

_id_9BDB(var_0) {
  switch (var_0) {
  case "zombie_armageddon_mp":
  case "zfreeze_semtex_mp":
  case "splash_grenade_zm":
  case "splash_grenade_mp":
  case "throwingknifec4_mp":
  case "cluster_grenade_zm":
  case "semtex_zm":
  case "semtex_mp":
  case "c4_zm":
  case "frag_grenade_zm":
  return 1;
  default:
  return 0;
  }
}

_id_9B6A(var_0, var_1, var_2, var_3, var_4, var_5) {
  return var_2 && var_3 && var_4 && !var_5 && isdefined(var_1._id_11192) && isdefined(var_1._id_11192._id_24B2) && var_0 == var_1._id_11192._id_24B2;
}

_id_9C04(var_0) {
  var_1 = var_0 getcurrentprimaryweapon();

  if (_id_0A77::_id_4626(var_1) == "weapon_pistol")
  return 1;
  else
  return 0;
}

_id_7D62(var_0) {
  if (!isplayer(self))
  return int(1);

  if (isdefined(self._id_C8A2[var_0]))
  return self._id_C8A2[var_0]._id_B111;

  var_1 = _id_0A77::_id_80D8(var_0);

  if (isdefined(self._id_C8A2[var_1]))
  return self._id_C8A2[var_1]._id_B111;

  return int(1);
}

_id_385F(var_0, var_1) {
  if (!isdefined(level._id_C8A2))
  return 0;

  if (isdefined(level.max_pap_func))
  return [[level.max_pap_func]](var_0, var_1);

  if (isdefined(var_0))
  var_2 = _id_0A77::_id_80D8(var_0);
  else
  return 0;

  if (!isdefined(var_2))
  return 0;

  if (!isdefined(level._id_C8A2[var_2])) {
  var_3 = getsubstr(var_2, 0, var_2.size - 1);

  if (!isdefined(level._id_C8A2[var_3]))
  return 0;
  }

  if (isdefined(self._id_6670) && getweaponbasename(self._id_6670) == getweaponbasename(var_0))
  return 0;

  if (isdefined(level.weapon_upgrade_path) && isdefined(level.weapon_upgrade_path[getweaponbasename(var_0)]))
  return 1;

  if (var_2 == "dischord" || var_2 == "facemelter" || var_2 == "headcutter" || var_2 == "shredder") {
  if (!scripts\engine\utility::_id_6E25("fuses_inserted")) {
  if (scripts\engine\utility::_id_9CEE(var_1))
  return 1;
  else
  return 0;
  }
  else if (isdefined(self._id_C8A2[var_2]) && self._id_C8A2[var_2]._id_B111 == 2)
  return 0;
  }

  if (scripts\engine\utility::_id_9CEE(level.has_picked_up_fuses) && !isdefined(level.placed_alien_fuses))
  return 1;

  if (scripts\engine\utility::_id_9CEE(self.has_zis_soul_key) && !scripts\engine\utility::_id_9CEE(level.no_auto_pap_upgrade) || scripts\engine\utility::_id_9CEE(level.placed_alien_fuses)) {
  if (isdefined(self._id_C8A2[var_2]) && self._id_C8A2[var_2]._id_B111 >= 3)
  return 0;
  else
  return 1;
  }

  if (scripts\engine\utility::_id_9CEE(var_1) && isdefined(self._id_C8A2[var_2]) && self._id_C8A2[var_2]._id_B111 <= min(level._id_C8A4 + 1, 2))
  return 1;

  if (isdefined(self._id_C8A2[var_2]) && self._id_C8A2[var_2]._id_B111 >= level._id_C8A4)
  return 0;
  else
  return 1;
}

get_pap_camo(var_0, var_1, var_2) {
  var_3 = undefined;

  if (isdefined(var_1)) {
  if (isdefined(level.no_pap_camos) && scripts\engine\utility::array_contains(level.no_pap_camos, var_1))
  var_3 = undefined;
  else if (isdefined(level.pap_1_camo) && isdefined(var_0) && var_0 == 2)
  var_3 = level.pap_1_camo;
  else if (isdefined(level.pap_2_camo) && isdefined(var_0) && var_0 == 3)
  var_3 = level.pap_2_camo;

  switch (var_1) {
  case "dischord":
  var_2 = "iw7_dischord_zm_pap1";
  var_3 = "camo20";
  break;
  case "facemelter":
  var_2 = "iw7_facemelter_zm_pap1";
  var_3 = "camo22";
  break;
  case "headcutter":
  var_2 = "iw7_headcutter_zm_pap1";
  var_3 = "camo21";
  break;
  case "forgefreeze":
  if (var_0 == 2)
  var_2 = "iw7_forgefreeze_zm_pap1";
  else if (var_0 == 3)
  var_2 = "iw7_forgefreeze_zm_pap2";

  var_4 = 1;
  break;
  case "axe":
  if (var_0 == 2)
  var_2 = "iw7_axe_zm_pap1";
  else if (var_0 == 3)
  var_2 = "iw7_axe_zm_pap2";

  var_4 = 1;
  break;
  case "shredder":
  var_2 = "iw7_shredder_zm_pap1";
  var_3 = "camo23";
  break;
  }
  }

  return var_3;
}

validate_current_weapon(var_0, var_1, var_2) {
  if (isdefined(level.weapon_upgrade_path) && isdefined(level.weapon_upgrade_path[getweaponbasename(var_2)]))
  var_2 = level.weapon_upgrade_path[getweaponbasename(var_2)];
  else if (isdefined(var_1)) {
  switch (var_1) {
  case "two":
  if (var_0 == 2)
  var_2 = "iw7_two_headed_axe_mp";
  else if (var_0 == 3)
  var_2 = "iw7_two_headed_axe_mp";

  break;
  case "golf":
  if (var_0 == 2)
  var_2 = "iw7_golf_club_mp";
  else if (var_0 == 3)
  var_2 = "iw7_golf_club_mp";

  break;
  case "machete":
  if (var_0 == 2)
  var_2 = "iw7_machete_mp";
  else if (var_0 == 3)
  var_2 = "iw7_machete_mp";

  break;
  case "spiked":
  if (var_0 == 2)
  var_2 = "iw7_spiked_bat_mp";
  else if (var_0 == 3)
  var_2 = "iw7_spiked_bat_mp";

  break;
  case "axe":
  if (var_0 == 2)
  var_2 = "iw7_axe_zm_pap1";
  else if (var_0 == 3)
  var_2 = "iw7_axe_zm_pap2";

  break;
  case "katana":
  if (var_0 == 2)
  var_2 = "iw7_katana_zm_pap1";
  else if (var_0 == 3)
  var_2 = "iw7_katana_zm_pap2";

  break;
  case "nunchucks":
  if (var_0 == 2)
  var_2 = "iw7_nunchucks_zm_pap1";
  else if (var_0 == 3)
  var_2 = "iw7_nunchucks_zm_pap2";

  break;
  default:
  return var_2;
  }
  }

  return var_2;
}

_id_13B09() {
  self endon("death");
  self endon("disconnect");
  self endon("faux_spawn");
  level endon("game_ended");

  for (;;) {
  self waittill("melee_fired", var_0);

  if (self._id_B625 == 0) {
  if (var_0 == "iw7_fists_zm_crane" || var_0 == "iw7_fists_zm_dragon" || var_0 == "iw7_fists_zm_snake" || var_0 == "iw7_fists_zm_tiger") {
  if (self.kung_fu_vo == 0) {
  self.kung_fu_vo = 1;
  thread _id_0A6A::_id_12885("melee_punch", "zmb_comment_vo", "high", 1, 0, 0, 1);
  thread kung_fu_vo_wait();
  } else {
  self.kung_fu_vo = 1;
  self notify("kung_fu_vo_reset");
  thread _id_0A6A::_id_12885("melee_punch", "zmb_comment_vo", "high", 1, 0, 0, 1, 60);
  thread kung_fu_vo_wait();
  }
  }
  else
  thread _id_0A6A::_id_12885("melee_miss", "zmb_comment_vo", "high", 1, 0, 0, 1, 20);

  continue;
  }

  if (issubstr(var_0, "katana") && self._id_134FD == "p5_") {
  thread _id_0A6A::_id_12885("melee_special_katana", "rave_comment_vo", "high", 1, 0, 0, 1);
  continue;
  }

  if ((issubstr(var_0, "golf") || issubstr(var_0, "machete") || issubstr(var_0, "spiked_bat") || issubstr(var_0, "two_headed_axe")) && self._id_B625 == 1) {
  thread _id_0A6A::_id_12885("melee_special", "rave_comment_vo", "high", 1, 0, 0, 1);
  continue;
  }

  if (issubstr(var_0, "iw7_knife") && _id_0A77::_id_9C42(var_0) && self._id_B625 == 1) {
  thread _id_0A6A::_id_12885("melee_fatal", "zmb_comment_vo", "high", 1, 0, 0, 1);
  self._id_B625 = 0;
  continue;
  }

  if ((var_0 == "iw7_axe_zm" || var_0 == "iw7_axe_zm_pap1" || var_0 == "iw7_axe_zm_pap2") && _id_0A77::_id_9C42(var_0) && self._id_B625 == 1) {
  thread _id_0A6A::_id_12885("melee_splice", "zmb_comment_vo", "high", 1, 0, 0, 1);
  self._id_B625 = 0;
  }
  }
}

kung_fu_vo_wait() {
  self endon("kung_fu_vo_reset");
  wait 4;
  self.kung_fu_vo = 0;
}

_id_13BA8() {
  self endon("death");
  self endon("disconnect");
  self endon("faux_spawn");
  level endon("game_ended");

  for (;;) {
  wait 1;
  var_0 = self getcurrentweapon();

  if (!isdefined(var_0) || var_0 == "none")
  continue;

  self waittill("fired", var_0);
  var_0 = self getcurrentweapon();
  var_1 = self getammocount(var_0);

  if (_id_0A77::_id_9C42(var_0) || issubstr(var_0, "fists") || issubstr(var_0, "heart"))
  continue;

  if (var_1 <= 5 && var_1 > 0 && self getweaponammostock(var_0) == 0 || self getweaponammostock(var_0) > 0 && var_1 / self getweaponammostock(var_0) < 0.1) {
  _id_0A6A::_id_12885("nag_low_ammo", "zmb_comment_vo", "low", 3, 0, 0, 0, 20);
  continue;
  }

  if (var_1 == 0 && (var_0 != "iw7_cpbasketball_mp" && var_0 != "none"))
  _id_0A6A::_id_12885("nag_out_ammo", "zmb_comment_vo", "low", 3, 0, 0, 0, 20);
  }
}

_id_13BAE(var_0) {
  self endon("death");
  self endon("disconnect");
  self endon("faux_spawn");
  level endon("game_ended");

  for (;;) {
  self waittill("weapon_fired", var_1);
  var_1 = self getcurrentweapon();

  if (!isdefined(var_1) || var_1 == "none")
  continue;

  if (!_id_0A77::_id_9E55(var_1))
  continue;

  if (isdefined(level._id_12EE2))
  thread [[level._id_12EE2]](self, var_1);

  var_2 = gettime();

  if (!isdefined(self._id_A9EE))
  self._id_A9EE = 0;

  var_3 = gettime() - self._id_A9EE;
  self._id_A9EE = var_2;

  if (isai(self))
  continue;

  var_4 = getweaponbasename(var_1);

  if (!isdefined(self._id_FF09[var_4]))
  self._id_FF09[var_4] = 1;
  else
  self._id_FF09[var_4]++;

  if (!isdefined(self.accuracy_shots_fired))
  self.accuracy_shots_fired = 1;
  else
  self.accuracy_shots_fired++;

  _id_0A63::increment_player_career_shots_fired(self);

  if (isdefined(var_4)) {
  if (isdefined(self._id_9045[var_4]))
  thread _id_9048(var_4, var_1);
  }
  }
}

_id_9048(var_0, var_1) {
  self endon("death");
  self endon("disconnect");
  self endon("updateMagShots_" + var_0);
  self._id_9045[var_0]--;
  wait 0.1;
  self notify("shot_missed", var_1);
  self._id_453C[var_0] = 0;
  self._id_9045[var_0] = weaponclipsize(var_1);
}

_id_13BA5() {
  self endon("death");
  self endon("disconnect");
  self endon("faux_spawn");
  self._id_9045 = [];
  var_0 = getweaponbasename(self getcurrentweapon());
  _id_9047(var_0);

  for (;;) {
  self waittill("weapon_change", var_0);
  var_0 = getweaponbasename(var_0);
  _id_13CDC(var_0);
  _id_9047(var_0);
  }
}

harpoon_impale_additional_func(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7) {
  if (!issubstr(var_0, "harpoon"))
  return;
  else
  {
  var_2 startragdoll();
  var_8 = physics_createcontents(["physicscontents_solid", "physicscontents_glass", "physicscontents_missileclip", "physicscontents_vehicle", "physicscontents_corpseclipshot"]);
  var_9 = var_3 + var_4 * 4096;
  var_10 = scripts\engine\trace::_id_DCEE(var_3, var_9, undefined, var_8, undefined, 1);
  var_9 = var_10["position"] - var_4 * 12;
  var_11 = length(var_9 - var_3);
  var_12 = var_11 / 1250;
  var_12 = clamp(var_12, 0.05, 1);
  wait 0.05;
  var_13 = var_4;
  var_14 = anglestoup(var_1.angles);
  var_15 = vectorcross(var_13, var_14);
  var_16 = scripts\engine\utility::_id_107E6(var_3, _func_017(var_13, var_15, var_14));
  var_16 moveto(var_9, var_12);
  var_17 = spawnragdollconstraint(var_2, var_5, var_6, var_7);
  var_17.origin = var_16.origin;
  var_17.angles = var_16.angles;
  var_17 linkto(var_16);
  thread play_explosion_post_impale(var_9, var_1);
  thread _id_934F(var_2, var_16, var_12 + 0.05, var_17);
  }
}

_id_934F(var_0, var_1, var_2, var_3) {
  var_0 scripts\engine\utility::_id_13736(var_2, "death", "disconnect");
  var_3 delete();
  var_1 delete();
}

play_explosion_post_impale(var_0, var_1) {
  wait 2;
  var_1 _meth_8253(var_0, 500, 1000, 500, var_1, "MOD_EXPLOSIVE");
  playfx(level._effect["penetration_railgun_explosion"], var_0);
}

scripted_ability_harpoonv1() {
  self endon("death");
  self endon("disconnect");
  self endon("faux_spawn");

  for (;;) {
  self waittill("weapon_change", var_0);

  if (issubstr(var_0, "harpoon1")) {
  thread harpoonv1_passive();
  continue;
  }

  continue;
  }
}

harpoonv1_passive() {
  self endon("death");
  self endon("disconnect");
  self endon("faux_spawn");
  self endon("weapon_change");
  self.trigger_alt_mode = [];

  for (var_0 = 1; var_0 <= 5; var_0++)
  self.trigger_alt_mode[var_0] = undefined;

  for (;;) {
  scripts\engine\utility::waittill_any("ads_in");
  scripts\engine\utility::waittill_any("ads_out");
  var_1 = self getplayerangles();
  var_2 = self geteye();
  var_3 = anglestoforward(var_1);
  var_4 = var_2 + var_3 * 2048;
  var_5 = scripts\engine\trace::_id_48BC(1, 1, 0, 0, 0, 0, 0);
  var_6 = physics_raycast(var_2, var_4, var_5, self, 0, "physicsquery_closest");
  var_7 = var_6[0]["position"];

  if (isdefined(var_7)) {
  if (isdefined(self.zombie_charges)) {
  if (self.zombie_charges <= 5)
  thread create_trigger_based_on_charges(self.zombie_charges, self, var_7);

  self.zombie_charges++;
  } else {
  self.zombie_charges = 1;
  thread create_trigger_based_on_charges(self.zombie_charges, self, var_7);
  }

  thread charge_watcher(var_7);
  }

  wait 0.8;
  }
}

charge_watcher(var_0) {
  self endon("death");
  self endon("disconnect");
  self endon("faux_spawn");
  level endon("game_ended");
  var_1 = gettime();

  while (gettime() <= var_1 + 7000) {
  scripts\engine\utility::waitframe();

  if (self getcurrentweaponclipammo() <= 1)
  continue;

  if (isdefined(self.zombie_charges)) {
  if (self.zombie_charges > 5) {
  foreach (var_3 in self.trigger_alt_mode) {
  if (isdefined(var_3))
  var_3 delete();
  }

  self _meth_8253(var_0, 100, 1000, 100, self, "MOD_EXPLOSIVE");
  playfx(level._effect["penetration_railgun_explosion"], var_0);
  self.zombie_charges = 0;
  }
  }
  }

  foreach (var_3 in self.trigger_alt_mode) {
  if (isdefined(var_3)) {
  self _meth_8253(var_3.origin, 100, 1000, 100, self, "MOD_EXPLOSIVE");
  playfx(level._effect["penetration_railgun_explosion"], var_3.origin);
  var_3 delete();
  }
  }
}

create_trigger_based_on_charges(var_0, var_1, var_2) {
  self endon("death");
  self endon("disconnect");
  self endon("faux_spawn");
  level endon("game_ended");
  var_3 = 0;

  switch (var_0) {
  case 0:
  self.zombie_charges = 1;
  case 1:
  foreach (var_5 in self.trigger_alt_mode) {
  if (isdefined(var_5)) {
  if (var_5.origin == var_2 || distance2dsquared(var_5.origin, var_2) <= 100)
  var_5 delete();
  }
  }

  var_1.trigger_alt_mode[var_0] = spawn("trigger_radius", var_2, 0, 50, 25);
  break;
  case 2:
  foreach (var_5 in self.trigger_alt_mode) {
  if (isdefined(var_5)) {
  if (var_5.origin == var_2 || distance2dsquared(var_5.origin, var_2) <= 100) {
  var_1.trigger_alt_mode[var_0] = spawn("trigger_radius", var_2, 0, 55, 25);
  var_3 = 1;
  }

  if (isdefined(var_1.trigger_alt_mode[var_0]) && var_5 != var_1.trigger_alt_mode[var_0])
  var_5 delete();
  }
  }

  if (!var_3)
  var_1.trigger_alt_mode[var_0] = spawn("trigger_radius", var_2, 0, 50, 25);

  break;
  case 3:
  foreach (var_5 in self.trigger_alt_mode) {
  if (isdefined(var_5)) {
  if (var_5.origin == var_2 || distance2dsquared(var_5.origin, var_2) <= 100) {
  var_1.trigger_alt_mode[var_0] = spawn("trigger_radius", var_2, 0, 60, 25);
  var_3 = 1;
  }

  if (isdefined(var_1.trigger_alt_mode[var_0]) && var_5 != var_1.trigger_alt_mode[var_0])
  var_5 delete();
  }
  }

  if (!var_3)
  var_1.trigger_alt_mode[var_0] = spawn("trigger_radius", var_2, 0, 50, 25);

  break;
  case 4:
  foreach (var_5 in self.trigger_alt_mode) {
  if (isdefined(var_5)) {
  if (var_5.origin == var_2 || distance2dsquared(var_5.origin, var_2) <= 100) {
  var_1.trigger_alt_mode[var_0] = spawn("trigger_radius", var_2, 0, 65, 25);
  var_3 = 1;
  }

  if (isdefined(var_1.trigger_alt_mode[var_0]) && var_5 != var_1.trigger_alt_mode[var_0])
  var_5 delete();
  }
  }

  if (!var_3)
  var_1.trigger_alt_mode[var_0] = spawn("trigger_radius", var_2, 0, 50, 25);

  break;
  case 5:
  foreach (var_5 in self.trigger_alt_mode) {
  if (isdefined(var_5)) {
  var_1 _meth_8253(var_5.origin, 100, 1000, 100, var_1, "MOD_EXPLOSIVE");
  playfx(level._effect["penetration_railgun_explosion"], var_5.origin);
  var_5 delete();
  }
  }

  break;
  default:
  break;
  }

  if (isdefined(var_1.trigger_alt_mode[var_0])) {
  var_1.trigger_alt_mode[var_0] setmodel("prop_mp_super_blackholegun_projectile");
  var_1.trigger_alt_mode[var_0] thread do_damage_when_trigger(var_1.trigger_alt_mode[var_0], var_1);
  }
}

do_damage_when_trigger(var_0, var_1) {
  self endon("death");
  level endon("game_ended");
  var_2 = 0;

  for (;;) {
  var_0 waittill("trigger", var_3);

  if (isdefined(var_3.agent_type) && var_3.agent_type == "generic_zombie" && !isdefined(var_3._id_6F73)) {
  var_1 _meth_8253(var_3.origin, 100, 1000, 100, var_1, "MOD_EXPLOSIVE");
  playfx(level._effect["penetration_railgun_explosion"], var_3.origin);
  var_2++;

  if (var_2 >= 5) {
  foreach (var_5 in self.trigger_alt_mode) {
  if (isdefined(var_5))
  var_5 delete();
  }

  self.zombie_charges = 0;
  var_1 _meth_8253(var_3.origin, 100, 1000, 100, var_1, "MOD_EXPLOSIVE");
  playfx(level._effect["penetration_railgun_explosion"], var_3.origin);
  }
  }
  }
}

_id_13CDC(var_0) {
  if (!isdefined(var_0) || var_0 == "none")
  return;

  if (!isdefined(self._id_FF09[var_0]))
  self._id_FF09[var_0] = 0;

  if (!isdefined(self._id_FF0A[var_0]))
  self._id_FF0A[var_0] = 0;

  if (!isdefined(self.headshots[var_0]))
  self.headshots[var_0] = 0;

  if (!isdefined(self._id_13BE3[var_0]))
  self._id_13BE3[var_0] = 1;

  if (!isdefined(self._id_5AFC[var_0]))
  self._id_5AFC[var_0] = 0;

  if (!isdefined(self._id_A682[var_0]))
  self._id_A682[var_0] = 0;
}

_id_9047(var_0) {
  if (!isdefined(var_0) || var_0 == "none")
  return;

  if (_id_0A77::_id_9E55(var_0) && !isdefined(self._id_9045[var_0]))
  self._id_9045[var_0] = weaponclipsize(var_0);
}
