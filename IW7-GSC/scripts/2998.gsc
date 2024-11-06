/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2998.gsc
***************************************/

_id_12A89() {
  scripts\engine\utility::_id_6E39("show_capital_turrets");
  scripts\engine\utility::_id_6E39("turrets_destroyed");
  scripts\engine\utility::_id_6E39("capital_ship_spawned");
  level._id_C214 = 4;
  precachemodel("ship_exterior_ca_cannon_a_rig");
  precachemodel("ship_exterior_ca_cannon_a_rig_dst");
  precachemodel("ship_exterior_un_cannon_b_rig");
  precachemodel("ship_exterior_un_cannon_b_rig_dst");
  precachemodel("ship_exterior_un_turret_a_rig");
  precachemodel("ship_exterior_un_turret_a_rig_dst");
  precachemodel("ship_exterior_un_turret_b_rig");
  precachemodel("ship_exterior_un_turret_b_rig_dst");
  precachemodel("sdf_ship_exterior_un_turret_b_rig");
  precachemodel("sdf_ship_exterior_un_turret_b_rig_s0p75");
  precachemodel("sdf_ship_exterior_un_turret_b_rig_dst");
  precachemodel("ship_exterior_missile_pod_a_rig");
  precachemodel("ship_exterior_missile_pod_a_rig_dst");
  precachemodel("ship_exterior_ca_turret_missile_b");
  precachemodel("ship_exterior_ca_turret_missile_b_s0p75");
  precachemodel("ship_exterior_ca_turret_missile_b_dst");
  precachemodel("cap_turret_missile_un");
  precachemodel("ship_exterior_missile_pod_a_rig");
  precachemodel("cap_turret_small_ca");
  precachemodel("cap_turret_missile_ca");
  precachemodel("veh_mil_air_ca_missile_boat_turret");
  precachemodel("veh_mil_air_ca_missile_boat_turret_dst");
  precachemodel("jackal_arena_aa_turret_01");
  precachemodel("ship_exterior_ca_missile_hatch_a");
  precachemodel("ship_exterior_turret_mg_01");
  precachemodel("ship_exterior_damage_piece_d_crater_01_dst");
  precachemodel("ship_exterior_damage_piece_d_crater_04_dst_s1p2");
  precachemodel("ship_exterior_damage_piece_d_crater_16_dst_s0p8");
  precachemodel("ship_exterior_damage_piece_d_crater_22_dst");
  precachemodel("ship_exterior_ca_turret_missile_b_01_dst");
  precachemodel("ship_exterior_ca_turret_missile_b_02_dst");
  precachemodel("ship_exterior_ca_turret_missile_b_03_dst");
  precachemodel("ship_exterior_ca_turret_missile_b_04_dst");
  precachemodel("ship_exterior_ca_turret_missile_b_01_dst_s0p75");
  precachemodel("ship_exterior_ca_turret_missile_b_02_dst_s0p75");
  precachemodel("ship_exterior_ca_turret_missile_b_03_dst_s0p75");
  precachemodel("ship_exterior_ca_turret_missile_b_04_dst_s0p75");
  precachemodel("projectile_c12rocket_boxcoll");
  precacheturret("cap_turret_med_flak");
  precacheturret("cap_turret_small_constant");
  precacheturret("cap_turret_missile_barrage");
  precacheturret("cap_turret_large");
  precacheturret("cap_turret_cannon_large_ca");
  precacheturret("cap_turret_cannon_large_ca_zerog_noexp");
  precacheturret("cap_turret_phalanx");
  precacheitem("cap_turret_proj_missile_barrage");
  precacheitem("cap_turret_proj_small_constant");
  precacheitem("cap_turret_proj_med_flak");
  precacheitem("cap_turret_proj_weapon");
  precacheitem("cap_mons_projectile");
  precacheitem("cap_missileboat_projectile");
  precacheshader("hud_iw7_warning");
  precacheshader("hud_iw7_incoming");
  precacheshader("heli_warning_missile_red");
  precacheshader("ac130_hud_friendly_vehicle_diamond_s_w");
  _func_1C5("r_hudOutlineEnable", 1);
  _id_12A87();
}

_id_12A87() {
  level._effect["jet_missile_imp_water"] = loadfx("vfx/old/space_fighter/vfx_jet_missile_imp_water.vfx");
  level._effect["jet_missile_imp_generic"] = loadfx("vfx/iw7/levels/moon/vfx_jet_missile_imp_generic_moon.vfx");
  level._effect["jet_missile_imp_airburst"] = loadfx("vfx/iw7/levels/moon/vfx_jet_missile_imp_generic_moon_premature.vfx");
  level._effect["capital_turret_death_sm"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_turret_death_sm.vfx");
  level._effect["capital_turret_damage1_sm"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_turret_dmg1.vfx");
  level._effect["capital_turret_damage2_sm"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_turret_dmg2.vfx");
  level._effect["capital_turret_smolder_sm"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_turret_smolder_sm.vfx");
  level._effect["capital_turret_muzzle_sm"] = loadfx("vfx/iw7/core/muzflash/cannon/vfx_muzflash_capital_30mm_looping.vfx");
  level._effect["capital_turret_muzzle_sm_noloop"] = loadfx("vfx/iw7/core/muzflash/cannon/vfx_muzflash_capital_30mm.vfx");
  level._effect["capital_turret_death_md"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_turret_death_md.vfx");
  level._effect["capital_turret_damage1_md"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_turret_dmg1.vfx");
  level._effect["capital_turret_damage2_md"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_turret_dmg2.vfx");
  level._effect["capital_turret_smolder_md"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_turret_smolder_md.vfx");
  level._effect["capital_turret_muzzle_md"] = loadfx("vfx/iw7/core/muzflash/cannon/vfx_muzflash_capital_40mm_flak.vfx");
  level._effect["capital_turret_explosion_md"] = loadfx("vfx/iw7/core/expl/weap/flak/vfx_flak_blast_a_runner.vfx");
  level._effect["capital_turret_death_lg"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_turret_death_lrg.vfx");
  level._effect["capital_turret_damage1_lg"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_turret_dmg1.vfx");
  level._effect["capital_turret_damage2_lg"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_turret_dmg2.vfx");
  level._effect["capital_turret_smolder_lg"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_turret_smolder_lrg.vfx");
  level._effect["capital_turret_muzzle_lg"] = loadfx("vfx/iw7/core/muzflash/cannon/vfx_mega_cannon_muzflash.vfx");
  level._effect["capital_turret_laser_lg"] = loadfx("vfx/old/_requests/prisoner/pnr_sniper_laser_scan.vfx");
  level._effect["capital_turret_fire_laser_lg"] = loadfx("vfx/iw7/_requests/mp/vfx_disruptor_laser");
  level._effect["capital_turret_death_smt"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_turret_death_smt.vfx");
  level._effect["capital_turret_damage1_smt"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_turret_dmg1.vfx");
  level._effect["capital_turret_damage2_smt"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_turret_dmg2.vfx");
  level._effect["capital_turret_smolder_smt"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_turret_smolder_smt.vfx");
  level._effect["capital_turret_muzzle_smt"] = loadfx("vfx/old/core/muzflash/vfx_flash_missile_tube_launch");
  level._effect["capital_missile_flare_smt"] = loadfx("vfx/iw7/core/smktrail/vfx_seeking_missile_trail.vfx");
  level._effect["capital_missile_imp_airburst_smt"] = loadfx("vfx/iw7/core/expl/weap/missile/vfx_missile_shotdown.vfx");
  level._effect["capital_missile_imp_capship_gen"] = loadfx("vfx/iw7/core/expl/weap/missile/vfx_missile_imp_capship_generic.vfx");
  level._effect["capital_dead_turret_ship_predeath"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_ship_explo_dead_turret.vfx");
  level._effect["capital_turret_death_emp"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_turret_death.vfx");
  level._effect["capital_turret_damage1_emp"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_turret_dmg1.vfx");
  level._effect["capital_turret_damage2_emp"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_turret_dmg2.vfx");
  level._effect["capital_turret_smolder_emp"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_turret_smolder_sm.vfx");
  level._effect["capital_turret_muzzle_emp"] = loadfx("vfx/level/moon/vfx_turret_muzz_tracer_ground");
  level._effect["capital_turret_death_wh"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_turret_death.vfx");
  level._effect["capital_turret_damage1_wh"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_turret_dmg1.vfx");
  level._effect["capital_turret_damage2_wh"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_turret_dmg2.vfx");
  level._effect["capital_missile_imp_airburst_wh"] = loadfx("vfx/iw7/core/expl/weap/missile/vfx_missile_shotdown.vfx");
  level._effect["capital_turret_smoke_trail"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_turret_smk_trail.vfx");
  level._effect["capital_turret_smoke_trail"] = loadfx("vfx/iw7/core/vehicle/turret/vfx_cap_turret_smk_trail.vfx");
  level._effect["capital_turret_sml_cheap"] = loadfx("vfx/iw7/core/muzflash/cannon/vfx_turret_small_cheap.vfx");
  level._effect["capital_un_turret_sml_cheap"] = loadfx("vfx/iw7/core/muzflash/cannon/vfx_un_turret_small_cheap.vfx");
  level._effect["capital_turret_flak_cheap"] = loadfx("vfx/iw7/core/muzflash/cannon/vfx_flack_cannon_cheap.vfx");
}

_id_39E8(var_0) {
  self._id_12A83 = [];
  self._id_B8B6 = [];
  self._id_8B4F = [];
  self._id_12A09 = 1;

  if (isdefined(self.script_noteworthy) && self.script_noteworthy == "no_turrets")
  return;

  if (isdefined(self._id_EEF9) && self._id_EEF9 == "none")
  return;

  var_1 = [];

  if (issubstr(self.classname, "turret")) {
  if (self._id_6A8D == "un")
  var_1 = ["cannon_small_un", "cannon_flak_un", "cannon_missile_un"];
  else
  var_1 = ["cannon_small_ca", "cannon_flak_ca", "cannon_missile_ca"];
  }
  else if (self._id_6A8D == "un")
  var_1 = ["cannon_large_un"];
  else if (issubstr(self.classname, "missileboat")) {
  if (!issubstr(self.classname, "plane"))
  var_1 = ["cannon_missile_ca_hardpoint", "cannon_small_ca"];
  }
  else
  var_1 = ["cannon_large_ca"];

  if (var_1.size == 0)
  return;

  if (!_id_0B91::_id_65DF("hold_fire"))
  _id_0B91::_id_65E0("hold_fire");

  if (isdefined(self._id_EEF9)) {
  self._id_12A09 = 0;
  var_1 = strtok(self._id_EEF9, " ");
  }

  if (isdefined(self._id_EE79)) {
  var_2 = strtok(self._id_EE79, " ");

  for (var_3 = 0; var_3 < var_2.size; var_3++) {
  if (var_2[var_3] == "doNotCountTurrets")
  self._id_592A = var_2[var_3 + 1];
  }
  }

  foreach (var_5 in var_1)
  _id_39E0(var_5);

  self._id_129D1 = var_1;
  _id_39EA(var_1, self._id_592A);
  self notify("turrets_spawned");
}

_id_39E0(var_0) {
  if (!isdefined(level._id_39DD))
  level._id_39DD = [];

  var_1 = strtok(var_0, ",");
  var_2 = var_1[0];
  var_3 = var_1[1];
  var_4 = var_1[2];

  if (isdefined(level._id_39DD[var_2]))
  return;

  var_5 = spawnstruct();

  switch (var_2) {
  case "cannon_large_un":
  var_5 _id_0BB7::_id_F8F9();
  break;
  case "cannon_large_ca":
  var_5 _id_0BB7::_id_F8F8();
  break;
  case "cannon_small_ca":
  var_5 _id_0BB7::_id_F8FE(self._id_EEDE, var_3, var_4, self);
  break;
  case "cannon_small_ca_mons":
  var_5 _id_0BB7::_id_F8FF(self._id_EEDE, var_3, var_4, self);
  break;
  case "cannon_small_un":
  var_5 _id_0BB7::_id_F8FE(self._id_EEDE, var_3, var_4, self);
  break;
  case "cannon_flak_ca":
  var_5 _id_0BB7::_id_F8F6(self._id_EEDE, var_3, var_4);
  break;
  case "cannon_missile_ca":
  var_5 _id_0BB7::_id_F8FA(self._id_EEDE, var_3, var_4);
  break;
  case "cannon_missile_long_ca":
  var_5 _id_0BB7::_id_F8FC(self._id_EEDE, var_3, var_4);
  break;
  case "missile_cluster_turret_un":
  var_5 _id_0BB7::_id_F9D6(self._id_EEDE, var_3, var_4);
  break;
  case "cannon_missile_ca_hardpoint":
  var_5 _id_0BB7::_id_F8FB(self._id_EEDE, var_3, var_4, self);
  break;
  case "cannon_large_lock_ca":
  var_5 _id_0BB7::_id_F8F7(self._id_EEDE, var_3, var_4);
  break;
  case "cannon_phalanx":
  var_5 _id_0BB7::_id_F8FD(self._id_EEDE, var_3, var_4);
  break;
  case "missile_tube_un":
  var_5 _id_0BB7::_id_F9DA();
  break;
  case "missile_tube_ca":
  var_5 _id_0BB7::_id_F9D8();
  break;
  case "missile_tube_ca_mons":
  var_5 _id_0BB7::_id_F9D9();
  break;
  case "cannon_missileboat_small":
  self._id_12A09 = 0;
  var_5 _id_0BB7::_id_F9DB();
  break;
  default:
  break;
  }

  level._id_39DD[var_2] = var_5;
}

_id_39EA(var_0, var_1) {
  if (!isdefined(level._id_B4D0)) {
  level._id_B4D0 = 0;
  level._id_12A91 = 0;
  }

  foreach (var_3 in var_0) {
  var_4 = strtok(var_3, ",");
  var_5 = var_4[0];
  var_6 = level._id_39DD[var_5];

  if (isdefined(var_4[3])) {
  for (var_7 = 3; isdefined(var_4[var_7]); var_7++) {
  var_8 = strtok(var_4[var_7], ":");
  var_9 = var_8[0];
  var_10 = undefined;

  if (var_8.size == 5)
  var_10 = [int(var_8[1]), int(var_8[2]), int(var_8[3]), int(var_8[4])];

  if (self._id_12A09 == 0 && _id_0B91::_id_8C32(self._id_01F1, var_9))
  _id_107FC(var_6, var_5, var_9, undefined, var_10);
  }

  continue;
  }

  var_11 = 0;

  foreach (var_13 in var_6._id_02DD) {
  var_7 = 1;

  for (;;) {
  var_9 = var_13 + "_" + var_7;

  if (_id_0B91::_id_8C32(self._id_01F1, var_9)) {
  if (isdefined(var_6._id_8B3B) && var_6._id_8B3B)
  _id_1072D(var_6, var_5, var_9);
  else if (self._id_12A09 == 0) {
  if (var_5 != "cannon_missile_ca")
  _id_107FC(var_6, var_5, var_9, var_1, var_6._id_2106[var_9]);
  else if (var_5 == "cannon_missile_ca" && scripts\engine\utility::_id_B8F8(var_7, level._id_C214) == 1)
  _id_39E6(var_6, var_5, var_13, var_7);
  }
  else
  _id_107FD(var_6, var_5, var_9);

  var_11++;
  var_7++;
  }
  else
  break;

  if (var_11 >= 8) {
  var_11 = 0;
  wait 0.05;
  }
  }
  }
  }

  if (isdefined(level._id_12A71) && level._id_12A71)
  _id_8933();
}

_id_39CA(var_0, var_1, var_2) {
  if (self._id_EEDE == "allies")
  return;

  if (!isdefined(var_1))
  var_1 = 0;

  if (!isdefined(var_2))
  var_2 = "turret";

  thread _id_39CB(var_0, var_1, var_2);
}

_id_39CB(var_0, var_1, var_2) {
  if (!isdefined(var_0))
  var_0 = 0;

  self notify("turret_target_status_change");
  self endon("death");
  self endon("turret_target_status_change");

  if (var_0) {
  thread _id_0B76::_id_39C3(3);
  wait 1;
  }

  var_3 = [];

  foreach (var_5 in self._id_12A83) {
  var_5 = scripts\engine\utility::_id_22BC(var_5);
  var_3 = scripts\engine\utility::_id_227F(var_3, var_5);
  }

  if (var_1) {
  foreach (var_8 in self._id_8B4F)
  var_3 = scripts\engine\utility::_id_227F(var_3, var_8);
  }

  _id_39CF(var_3, var_0, var_2);
}

_id_39CF(var_0, var_1, var_2) {
  if (!isdefined(var_1))
  var_1 = 0;

  var_3 = "turret";

  if (isdefined(var_2))
  var_3 = var_2;

  var_0 = scripts\engine\utility::_id_22A7(var_0);

  foreach (var_5 in var_0) {
  if (isdefined(var_5)) {
  if (!isdefined(var_5._id_EEDE)) {}

  if (isdefined(var_5._id_11549))
  var_6 = var_5._id_11549;
  else
  var_6 = "turret";

  if (isdefined(var_5._id_3AF3))
  var_7 = var_5._id_3AF3;
  else
  var_7 = "medium_target";

  if (_id_0B91::_id_B324())
  var_5 [[level._id_A056._id_11543]](var_3, var_6, var_7, "enemy_jackal");

  if (var_1)
  var_5 playsound("jackal_target_is_set");

  wait 0.05;
  }
  }
}

_id_39C0() {
  thread _id_39C1();
}

_id_39C1(var_0) {
  self notify("turret_target_status_change");
  self endon("death");
  self endon("turret_target_status_change");
  var_0 = [];

  if (isdefined(self._id_12A69)) {
  foreach (var_2 in self._id_12A69)
  var_0 = scripts\engine\utility::_id_227F(var_0, var_2);
  } else {
  foreach (var_5 in self._id_12A83)
  var_0 = scripts\engine\utility::_id_227F(var_0, var_5);
  }

  if (isdefined(self._id_8B4F)) {
  foreach (var_8 in self._id_8B4F)
  var_0 = scripts\engine\utility::_id_227F(var_0, var_8);
  }

  _id_39C2(var_0);
  self notify("turrets_not_targetable");
}

_id_39C2(var_0) {
  var_0 = scripts\engine\utility::_id_22A7(var_0);

  foreach (var_2 in var_0) {
  if (isdefined(var_2) && isdefined(var_2._id_AEDF) && var_2._id_AEDF._id_AEEA) {
  if (_id_0B91::_id_B324())
  var_2 [[level._id_A056._id_11540]]();
  }

  wait 0.05;
  }
}

_id_39E6(var_0, var_1, var_2, var_3, var_4) {
  if (!isdefined(self._id_12A69))
  self._id_12A69 = [];

  if (!isdefined(var_4))
  var_4 = level._id_C214;

  var_5 = [];

  for (var_6 = 0; var_6 < var_4; var_6++) {
  var_7 = var_3 + var_6;
  var_8 = var_2 + "_" + var_7;

  if (_id_0B91::_id_8C32(self._id_01F1, var_8))
  var_5[var_5.size] = _id_107FC(var_0, var_1, var_8);
  }

  self._id_12A69[self._id_12A69.size] = var_5;
  thread _id_39E7(var_5);
}

_id_39E7(var_0) {
  _id_13819(var_0, 1);
  scripts\engine\utility::_id_22D2(var_0, ::_id_129E0);
}

_id_107FC(var_0, var_1, var_2, var_3, var_4) {
  var_5 = var_0.type;

  if (isdefined(level._id_241D) && !level._id_241D)
  var_5 = var_0._id_12AE6;

  var_6 = spawnturret("misc_turret", self gettagorigin(var_2), var_5, 0);
  var_6.class = var_1;
  var_6.type = var_0.type;
  var_6._id_AD42 = var_2;

  if (scripts\engine\utility::_id_9CEE(self.spawn_hidden_turrets))
  var_6 hide();

  var_7 = (0, 0, 0);

  if (isdefined(self._id_12A08) && isdefined(self._id_12A08[var_2])) {
  var_7 = self._id_12A08[var_2];
  var_6._id_ACFF = var_7;
  }

  var_6 linkto(self, var_2, (0, 0, 0), var_7);
  var_6 setmodel(var_0._id_01F1);
  var_6 _meth_835E(var_0.team);
  var_6.team = var_0.team;
  var_6._id_EEDE = var_0.team;
  var_6._id_9FF0 = 1;
  var_6._id_C841 = self;
  var_6 makeunusable();
  var_6 setcandamage(1);
  var_6 _meth_830F(var_0._id_B8F9);
  var_6 _meth_80C7();
  var_6 _meth_8534(1);
  var_6._id_4008 = var_0;

  if (var_0.team != "allies") {}

  if (isdefined(var_0._id_3AF3))
  var_6._id_3AF3 = var_0._id_3AF3;

  if (isdefined(var_0._id_11549))
  var_6._id_11549 = var_0._id_11549;

  if (isdefined(var_0._id_6D1D))
  var_6._id_6D1D = var_0._id_6D1D;

  var_6._id_2103 = var_0._id_2103;
  var_6._id_2107 = var_0._id_2107;
  var_6._id_2109 = var_0._id_2109;
  var_6._id_2100 = var_0._id_2100;

  if (isdefined(var_4)) {
  var_6._id_2103 = var_4[0];
  var_6._id_2107 = var_4[1];
  var_6._id_2109 = var_4[2];
  var_6._id_2100 = var_4[3];
  }

  var_6._id_2104 = cos(var_6._id_2103);
  var_6._id_2108 = cos(var_6._id_2107);
  var_6._id_210A = cos(var_6._id_2109);
  var_6._id_2101 = cos(var_6._id_2100);
  var_6 _meth_82FB(var_6._id_2103);
  var_6 _meth_8330(var_6._id_2107);
  var_6 _meth_8353(var_6._id_2109);
  var_6 _meth_82B6(var_6._id_2100);
  var_6 setdefaultdroppitch(0);

  if (isdefined(var_0._id_45E4)) {
  var_6._id_45E4 = var_0._id_45E4;
  var_6 _meth_82C9(var_0._id_45E4, "yaw");
  } else {
  var_6._id_45E4 = 5;
  var_6 _meth_82C9(5, "yaw");
  }

  if (isdefined(var_0._id_45E3)) {
  var_6._id_45E3 = var_0._id_45E3;
  var_6 _meth_82C9(var_0._id_45E3, "pitch");
  } else {
  var_6._id_45E3 = 5;
  var_6 _meth_82C9(5, "pitch");
  }

  var_6 settargetentity(var_6, (0, 0, 0));
  var_6._id_114FB = var_6;
  var_6._id_10241 = var_0._id_10241;
  var_6.health = var_0._id_10241.health;
  var_6._id_4D1E = var_0._id_4D1E;
  var_6._id_1D52 = var_0._id_1D52;
  var_6._id_934D = var_0._id_934D;
  var_6 thread _id_129DD();

  if (!isdefined(self._id_12A83[var_0.type]))
  self._id_12A83[var_0.type] = [];

  self._id_12A83[var_0.type][self._id_12A83[var_0.type].size] = var_6;
  var_8 = undefined;
  var_9 = undefined;

  if (var_1 == "cannon_missileboat_small") {
  var_9 = strtok(var_2, "_");
  var_9 = int(var_9[var_9.size - 1]);

  if (var_9 < 7)
  var_8 = self._id_12A33[0];
  else
  var_8 = self._id_12A33[1];

  if (!isdefined(var_8._id_12A83))
  var_8._id_12A83 = [];

  var_6._id_C8F3 = self;
  var_8._id_12A83[var_8._id_12A83.size] = var_6;
  _id_0BB7::_id_B878(var_6, self, var_2);
  }

  if (isdefined(var_3))
  return;

  if (isdefined(level._id_12A70) && level._id_12A70) {
  var_10 = "ac130_hud_target";
  var_11 = (1, 0, 0);
  thread _id_1150D(var_6, var_10, var_11, 128, (0, 0, 96));
  }

  var_6 thread _id_129D2();
  level._id_12A91++;
  level._id_B4D0++;
  return var_6;
}

_id_129D2() {
  self waittill("death");

  if (isdefined(self._id_B04A)) {
  self._id_B04A stoploopsound();
  scripts\engine\utility::waitframe();

  if (isdefined(self._id_B04A))
  self._id_B04A delete();
  }
}

_id_1072D(var_0, var_1, var_2) {
  if (isdefined(var_0._id_01F1)) {
  var_3 = spawn("script_model", self gettagorigin(var_2));
  var_3.angles = self gettagangles(var_2);
  var_3 setmodel(var_0._id_01F1);
  var_3 linkto(self);
  var_3._id_C841 = self;
  var_3.team = var_0.team;
  var_3._id_EEDE = var_0.team;
  var_3 setcandamage(1);
  var_3.health = var_0._id_10241.health;
  var_3._id_4D1E = var_0._id_4D1E;
  var_3._id_1D52 = var_0._id_1D52;
  var_3 thread _id_129DD();

  if (scripts\engine\utility::_id_9CEE(self.spawn_hidden_turrets))
  var_3 hide();
  }
  else
  var_3 = spawnstruct();

  var_3.class = var_1;
  var_3._id_02DD = var_2;
  var_3._id_AD42 = var_2;
  var_3.type = var_0.type;
  var_3._id_10241 = var_0._id_10241;

  if (isdefined(var_0._id_10241._id_EF60))
  var_3._id_EF60 = var_0._id_10241._id_EF60;

  if (isdefined(var_0._id_10241._id_EF5F))
  var_3._id_EF5F = var_0._id_10241._id_EF5F;

  if (isdefined(var_0._id_3AF3))
  var_3._id_3AF3 = var_0._id_3AF3;

  if (isdefined(var_0._id_11549))
  var_3._id_11549 = var_0._id_11549;

  if (!isdefined(self._id_8B4F[var_0.type])) {
  self._id_8B4F[var_0.type] = [];
  self._id_8B50[var_0.type] = [];
  self._id_8B51[var_0.type] = [];
  }

  self._id_8B4F[var_0.type][self._id_8B4F[var_0.type].size] = var_3;

  if (issubstr(var_2, "_l_"))
  self._id_8B50[var_0.type][self._id_8B4F[var_0.type].size] = var_3;
  else
  self._id_8B51[var_0.type][self._id_8B4F[var_0.type].size] = var_3;
}

_id_39EF() {
  foreach (var_1 in self._id_12A83) {
  foreach (var_3 in var_1) {
  if (isdefined(self._id_129C4[var_3._id_AD42])) {
  var_4 = self._id_129C4[var_3._id_AD42];

  if (var_4.size != 4) {}

  var_3 _meth_82FB(var_4[0]);
  var_3 _meth_8330(var_4[1]);
  var_3 _meth_8353(var_4[2]);
  var_3 _meth_82B6(var_4[3]);
  var_3._id_2103 = var_4[0];
  var_3._id_2107 = var_4[1];
  var_3._id_2109 = var_4[2];
  var_3._id_2100 = var_4[3];
  var_3._id_2104 = cos(var_3._id_2103);
  var_3._id_2108 = cos(var_3._id_2107);
  var_3._id_210A = cos(var_3._id_2109);
  var_3._id_2101 = cos(var_3._id_2100);
  }
  }
  }
}

_id_3984(var_0) {
  if (!isdefined(self) || !isalive(self))
  return;

  foreach (var_2 in self._id_12A83) {
  foreach (var_4 in var_2) {
  if (!isdefined(var_4))
  continue;

  var_4._id_AF58 = self._id_12A09;
  var_4 thread _id_39ED(var_0, !self._id_12A09);
  wait(randomfloatrange(0.01, 0.3));
  }
  }
}

_id_3983(var_0) {
  if (isarray(var_0))
  var_1 = var_0;
  else
  var_1 = [var_0];

  foreach (var_3 in self._id_8B4F)
  thread _id_399D(var_3, var_1, 1);
}

_id_3989(var_0, var_1, var_2, var_3, var_4) {
  var_5 = [var_0];
  var_6 = undefined;

  if (!isdefined(self._id_8B4F) || self._id_8B4F.size == 0)
  return;

  var_7 = randomint(self._id_8B4F.size);
  var_8 = -1;

  foreach (var_10 in self._id_8B4F) {
  var_8++;

  if (var_8 == var_7)
  var_6 = var_10;
  }

  var_6 = [var_6[randomint(var_6.size)]];
  var_12 = var_6[0].class;
  var_13 = level._id_39DD[var_12]._id_10241;

  if (isdefined(self._id_10245) && isdefined(self._id_10245[var_12]))
  var_13 = self._id_10245[var_12];

  self [[var_13._id_6CF8]](var_5, var_6, var_13, var_1, var_2, var_3, var_4);
}

_id_39F4(var_0, var_1) {
  if (!isdefined(self._id_10245))
  self._id_10245 = [];

  self._id_10245[var_0] = var_1;
}

_id_107FD(var_0, var_1, var_2) {
  var_3 = spawn("script_model", self gettagorigin(var_2));
  var_3.class = var_1;
  var_3.type = var_0.type;
  var_3 linkto(self, var_2, (0, 0, 0), (0, 0, 0));
  var_3 setmodel(var_0._id_01F1);
  var_3 notsolid();
  var_3._id_EEDE = var_0.team;
  var_3._id_AD42 = var_2;

  if (!isdefined(self._id_12A83[var_0.type]))
  self._id_12A83[var_0.type] = [];

  self._id_12A83[var_0.type][self._id_12A83[var_0.type].size] = var_3;
  var_4 = undefined;
  var_5 = undefined;

  if (var_1 == "cannon_missileboat_small") {
  var_5 = strtok(var_2, "_");
  var_5 = int(var_5[var_5.size - 1]);

  if (var_5 < 7)
  var_4 = self._id_12A33[0];
  else
  var_4 = self._id_12A33[1];

  if (!isdefined(var_4._id_12A83))
  var_4._id_12A83 = [];

  var_3._id_C8F3 = self;
  var_4._id_12A83[var_4._id_12A83.size] = var_3;
  _id_0BB7::_id_B878(var_3, self, var_2);
  }
}

_id_39E9(var_0, var_1) {
  if (self._id_12A09 == var_0 && (isdefined(var_1) && !var_1))
  return;

  self._id_12A09 = var_0;
  _id_39E1();
  _id_39EA(self._id_129D1);
}

_id_39EE(var_0) {
  if (!isdefined(var_0))
  var_0 = 0;

  foreach (var_2 in self._id_12A83) {
  foreach (var_4 in var_2) {
  if (isdefined(var_4)) {
  if (var_0) {
  var_4 hide();
  continue;
  }

  var_4 show();
  }
  }
  }
}

_id_39E1() {
  if (!isdefined(self))
  return;

  if (isdefined(self._id_12A83)) {
  foreach (var_1 in self._id_12A83) {
  foreach (var_3 in var_1) {
  if (isdefined(var_3))
  var_3 delete();
  }
  }

  self._id_12A83 = [];
  }

  if (isdefined(self._id_8B4F)) {
  foreach (var_7 in self._id_8B4F) {
  foreach (var_9 in var_7) {
  if (isdefined(var_9) && !_func_2A4(var_9)) {
  var_9 delete();
  continue;
  }

  var_9 = undefined;
  }
  }
  }
}

_id_39ED(var_0, var_1) {
  if (!isdefined(self))
  return;

  if (!isdefined(var_0))
  return;

  var_2 = (0, 0, 0);

  if (isdefined(var_0._id_24C4) && var_0.classname != "script_vehicle_corpse") {
  var_3 = scripts\engine\utility::_id_DC6B(var_0._id_24C4);

  if (!_id_0B91::_id_8C32(var_0._id_01F1, var_3))
  return;

  var_4 = var_0 gettagorigin(var_3);
  var_5 = (randomintrange(-2000, 2000), randomintrange(-2000, 2000), randomintrange(-750, 750));
  var_2 = var_4 - var_0.origin;
  var_2 = var_2 + var_5;
  self._id_24C3 = var_4;
  self._id_24C5 = var_0;
  }

  self._id_114FB = var_0;
  self._id_1DF8 = var_0;

  if (self._id_AF58 == 0 && !isdefined(self._id_D92F))
  self settargetentity(var_0, var_2);

  _id_39E2(var_1);
}

_id_39EC() {
  if (!isdefined(self))
  return;

  self cleartargetentity();
  _id_39EB();
  self._id_114FB = self;
}

_id_39DC(var_0) {
  var_1 = [];

  if (!_id_0B91::_id_8C32(var_0, "tag_flash_3")) {
  for (var_2 = 1; _id_0B91::_id_8C32(var_0, "tag_flash_" + var_2); var_2++)
  var_1[var_1.size] = "tag_flash_" + var_2;
  }

  if (var_1.size == 0) {
  if (_id_0B91::_id_8C32(var_0, "tag_flash"))
  var_1[var_1.size] = "tag_flash";
  else if (_id_0B91::_id_8C32(var_0, "jackal_arena_aa_turret_01_guns_part"))
  var_1[var_1.size] = "jackal_arena_aa_turret_01_guns_part";
  else if (_id_0B91::_id_8C32(var_0, "tag_origin"))
  var_1[var_1.size] = "tag_origin";
  else
  {}
  }

  return var_1;
}

_id_39E2(var_0) {
  if (!isdefined(self))
  return;

  self notify("stop_shooting");
  self endon("stop_shooting");
  self endon("death");
  self endon("entitydeleted");
  var_1 = _id_39DC(self._id_01F1);
  var_2 = 0;
  var_3 = 0;
  var_4 = 1;
  var_5 = level._id_39DD[self.class]._id_10241;

  if (isdefined(self._id_C841) && isdefined(self._id_C841._id_10245) && isdefined(self._id_C841._id_10245[self.class]))
  var_5 = self._id_C841._id_10245[self.class];

  wait(randomfloat(2));

  for (;;) {
  if (isdefined(self._id_1D65) && self._id_1D65 == 1)
  var_6 = var_5._id_1DFC;
  else
  var_6 = 1.0;

  if (randomfloat(1) < var_6) {
  if (var_5._id_13536[0] == var_5._id_13536[1])
  var_2 = var_5._id_13536[0];
  else
  var_2 = randomfloatrange(var_5._id_13536[0], var_5._id_13536[1]);
  }

  while (var_2 > 0) {
  if (var_0)
  self waittill("turret_on_target");

  if (!_id_12A32(var_1)) {
  var_7 = 0;

  foreach (var_9 in var_1) {
  if (isdefined(var_5._id_10943)) {
  self [[var_5._id_10943]](var_9);
  continue;
  }

  if (self._id_AF58 == 0 && !isdefined(self._id_C841._id_12FBA)) {
  if (!var_7 && soundexists("capitalship_cannon_fire")) {
  self playsound("capitalship_cannon_fire");
  var_7 = 1;
  }

  self shootturret(var_9);
  continue;
  }

  if (!isdefined(var_5._id_6CF8))
  return;

  var_10 = _id_12A36(var_9);
  var_11 = _id_12A37(var_9, var_10);
  var_10 = anglestoforward(var_10);
  self thread [[var_5._id_6CF8]](var_11, var_10, var_9);
  }

  thread _id_12A02(0.33);
  }

  if (isdefined(self._id_C841) && isdefined(self._id_C841._id_24C2) && randomint(100) < self._id_C841._id_24C2) {
  if (isdefined(self._id_24C3) && isdefined(self._id_24C5)) {
  var_13 = (randomintrange(-2000, 2000), randomintrange(-2000, 2000), randomintrange(-750, 750));
  var_14 = self._id_24C3 - self._id_24C5.origin;
  var_14 = var_14 + var_13;

  if (self._id_AF58 == 0 && !isdefined(self._id_D92F))
  self settargetentity(self._id_24C5, var_14);
  }
  }

  wait(var_5._id_6D20);
  var_2 = var_2 - var_5._id_6D20;
  }

  var_3 = randomfloatrange(var_5._id_13535[0], var_5._id_13535[1]);
  wait(var_3);
  }
}

_id_39EB() {
  self notify("stop_shooting");
}

_id_6D4D(var_0, var_1, var_2, var_3) {
  var_4 = level._id_39DD[self.class];
  var_5 = var_4._id_4D1E._id_7542;

  if (_id_0B91::_id_8C32(self._id_01F1, "tag_flash_1") && _id_0B91::_id_8C32(self._id_01F1, "tag_flash_2")) {
  var_2 = "tag_flash_1";

  if (scripts\engine\utility::_id_9CEE(self._id_6D40)) {
  var_2 = "tag_flash_2";
  self._id_6D40 = 0;
  }
  else
  self._id_6D40 = 1;

  playfxontag(scripts\engine\utility::_id_7ECB(var_5._id_BDFF), self, var_2);
  }
  else if (_id_0B91::_id_8C32(self._id_01F1, "TAG_FLASH"))
  playfxontag(scripts\engine\utility::_id_7ECB(var_5._id_BDFF), self, "TAG_FLASH");
  else
  playfx(scripts\engine\utility::_id_7ECB(var_5._id_BDFF), var_0, var_1);

  if (isdefined(var_4._id_10241._id_6D32) && soundexists(var_4._id_10241._id_6D32))
  self playsound(var_4._id_10241._id_6D32);
  else if (isdefined(var_4._id_10241._id_6D34) && soundexists(var_4._id_10241._id_6D34)) {
  self notify("new_loop_sound");
  self endon("new_loop_sound");

  if (!isdefined(self._id_B04A)) {
  self._id_B04A = spawn("script_origin", self gettagorigin("TAG_FLASH"));
  self._id_B04A.angles = self gettagangles("TAG_FLASH");
  self._id_B04A linkto(self);
  self._id_B04A playloopsound(self._id_10241._id_6D34);
  }

  wait 0.5;

  if (!isdefined(self) || !isalive(self))
  return;

  if (isdefined(self) && isdefined(self._id_B04A))
  self._id_B04A stoploopsound(self._id_10241._id_6D34);

  self stoploopsound(self._id_10241._id_6D34);
  self playsound(self._id_10241._id_6D36);
  self._id_B04A delete();
  }
}

_id_39A3(var_0) {
  if (!isdefined(self._id_B797))
  _id_0BA9::_id_9799();

  if (var_0) {
  if (isdefined(self._id_8B47) && self._id_8B47)
  return;
  else
  thread _id_39A5();
  }
  else
  _id_39A4();
}

_id_39A5() {
  self._id_8B47 = 1;
  self.shooting_missile_barrage = 0;
  self endon("stop_hardpoint_multiattack");
  self endon("death");
  self endon("predeath");
  var_0 = 0;

  for (;;) {
  if (!_id_0B91::_id_D123()) {
  wait 1;
  continue;
  }

  var_1 = distance(self.origin, level._id_D127.origin);
  var_2 = anglestoright(self.angles);
  var_3 = anglestoup(self.angles);
  var_4 = vectornormalize(level._id_D127.origin - self.origin);
  var_5 = vectordot(var_2, var_4);
  var_6 = vectordot(var_3, var_4);

  if (!_id_39A2(var_1, var_5, var_6))
  _id_399F(var_1, var_5, var_6);

  wait 0.05;
  }
}

_id_39A2(var_0, var_1, var_2) {
  self endon("death");
  self endon("predeath");

  if (!_id_0BA9::_id_396A(level._id_D127))
  return 0;

  if (var_1 < 0)
  var_3 = self._id_8B50["cap_hardpoint_missile_barrage"];
  else
  var_3 = self._id_8B51["cap_hardpoint_missile_barrage"];

  if (!isdefined(var_3))
  return 0;

  if (var_3.size == 0) {
  wait 0.1;
  return 0;
  }

  _id_39A1(var_3, 5);

  while (level._id_D127._id_93D2.size > 0)
  wait 0.05;

  self._id_A8EA = gettime();
  self._id_B83F = randomfloatrange(1500, 4500);
  wait(randomfloatrange(0.5, 2.5));
  return 1;
}

_id_39A1(var_0, var_1) {
  _id_39A0(level._id_D127, var_0, var_1);
}

_id_39A0(var_0, var_1, var_2) {
  self endon("death");
  self endon("predeath");
  var_3 = 0;
  var_1 = scripts\engine\utility::_id_22A7(var_1);
  self.shooting_missile_barrage = 1;

  foreach (var_5 in var_1) {
  if (var_3 >= var_2)
  break;

  if (isdefined(var_5)) {
  var_5 thread _id_0B76::_id_1945(var_0, ["tag_flash_1"], 1);
  wait 0.2;
  var_3++;
  }
  }

  self.shooting_missile_barrage = 0;
}

_id_399F(var_0, var_1, var_2) {
  self endon("death");
  self endon("predeath");

  if (var_0 > 30000)
  return 0;

  if (abs(var_1) < 0.05)
  return 0;

  if (var_2 < -0.29)
  return 0;

  if (var_1 < 0)
  var_3 = self._id_8B50["cap_hardpoint_missile_barrage"];
  else
  var_3 = self._id_8B51["cap_hardpoint_missile_barrage"];

  var_4 = scripts\engine\utility::_id_22BD(var_3);
  var_3 = scripts\engine\utility::_id_227F(var_3, var_4);

  foreach (var_6 in var_3) {
  if (isdefined(var_6)) {
  var_6 thread _id_399E("tag_flash_1", 1, self._id_9278);
  wait 0.1;
  }
  }

  if (isdefined(self._id_9278) && self._id_9278)
  wait(randomfloatrange(0.3, 0.75));
  else
  _id_13695(randomfloatrange(1, 3.0));

  return 1;
}

_id_13695(var_0) {
  self endon("start_agro_attack");
  wait(var_0);
}

_id_399E(var_0, var_1, var_2, var_3) {
  if (!isdefined(var_3))
  var_3 = 1;

  if (isdefined(var_2) && var_2)
  var_4 = _id_0B4D::_id_C097(level._id_A48E._id_3A04, level._id_A48E._id_3A03, level._id_A056._id_67D9);
  else
  var_4 = _id_0B4D::_id_C097(level._id_A48E._id_3A06, level._id_A48E._id_3A05, level._id_A056._id_67D9);

  var_5 = self.origin - level._id_D127.origin;
  var_6 = length(var_5);
  var_7 = var_6 * 0.3;
  var_8 = var_6 * 0.5;

  if (var_7 > 2000)
  var_7 = 2000;

  if (var_8 > 5000)
  var_8 = 5000;

  var_9 = _id_0B4D::_id_6A8E(350, 900, var_4);
  var_7 = _id_0B4D::_id_6A8E(800, var_7, var_4);
  var_8 = _id_0B4D::_id_6A8E(1500, var_8, var_4);
  var_10 = vectortoangles(var_5);
  var_11 = vectornormalize(var_5);
  var_12 = -1 * var_5;
  var_13 = randomfloatrange(var_7, var_8);
  var_14 = var_11 * var_13 * var_1;
  var_15 = anglestoright(var_10) * randomfloatrange(-1 * var_9, var_9) * var_1;
  var_16 = anglestoup(var_10) * randomfloatrange(-1 * var_9, var_9) * var_1;
  var_17 = self.origin;
  var_18 = _id_0B4D::_id_C097(4000, 30000, var_6);
  var_19 = _id_0B4D::_id_6A8E(7, 20, var_18);
  var_20 = level._id_D127._id_02AC * var_19;
  var_21 = level._id_D127.origin + var_14 + var_15 + var_16 + var_20;
  playfxontag(scripts\engine\utility::_id_7ECB("miniflak_muzzle"), self, var_0);
  var_22 = vectornormalize(var_21 - self.origin);
  var_23 = scripts\engine\utility::_id_107E6();

  if (var_3)
  self playsound("weap_capital_ship_flak_fire_plr");

  var_23.angles = vectortoangles(var_22);
  playfxontag(scripts\engine\utility::_id_7ECB("miniflak_trace"), var_23, "tag_origin");
  var_24 = _id_0B4D::_id_C097(1000, 35000, var_6);
  var_24 = _id_0B4D::_id_6A8E(0.1, 0.75, var_24);
  var_23 moveto(var_21, var_24);
  wait(var_24);
  wait 0.05;
  var_23 thread _id_11A7D();
  playfx(scripts\engine\utility::_id_7ECB("miniflak"), var_21, var_22, (0, 0, 1));
  thread scripts\engine\utility::_id_CE2B("miniflak_airburst_plr", var_21);

  if (isdefined(self))
  var_25 = self;
  else
  var_25 = undefined;

  var_6 = distance(var_21, level._id_D127.origin);
  var_26 = _id_0B4D::_id_C097(500, 8000, var_6);
  var_27 = _id_0B4D::_id_6A8E(0.2, 0, var_26);

  if (var_27 > 0.01)
  earthquake(var_27, 0.5, level._id_D127.origin, 20000);

  var_26 = _id_0B4D::_id_C097(200, 2000, var_6);
  var_28 = _id_0B4D::_id_6A8E(100, 0, var_26);

  if (var_28 <= 0)
  return;

  if (isdefined(self))
  var_17 = self.origin;

  level._id_D127 _meth_80B0(var_28, var_17, var_25, var_25, "MOD_EXPLOSIVE_BULLET", "spaceship_scripted_miniflak");
}

_id_11A7D() {
  wait 0.05;
  self delete();
}

_id_39A4() {
  self._id_8B47 = 0;
  self notify("stop_hardpoint_multiattack");
}

_id_398A(var_0) {
  if (var_0)
  thread _id_0B91::_id_75C4("flak_omni_space", "TAG_ORIGIN");
  else
  thread _id_0B91::_id_75F8("flak_omni_space", "TAG_ORIGIN");
}

_id_3966(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7) {
  if (!isdefined(self) || !isdefined(var_2))
  return;

  var_8 = [var_2];

  if (isdefined(var_3))
  var_8 = scripts\engine\utility::_id_2279(var_8, var_3);

  if (isdefined(var_4))
  var_8 = scripts\engine\utility::_id_2279(var_8, var_4);

  if (isdefined(var_5))
  var_8 = scripts\engine\utility::_id_2279(var_8, var_5);

  if (isdefined(var_6))
  var_8 = scripts\engine\utility::_id_2279(var_8, var_6);

  self notify("end_capitalship_ambient_targets");
  self endon("end_capitalship_ambient_targets");
  self endon("end_capitalship_attacking");

  if (var_0 == 1) {
  var_9 = 0;

  foreach (var_11 in self._id_12A83) {
  foreach (var_13 in var_11) {
  var_14 = var_8[var_9];

  if (!isdefined(var_13))
  continue;

  var_13._id_1DF8 = var_14;
  var_13._id_1D65 = 1;
  var_13._id_AF58 = self._id_12A09;
  var_15 = 0;

  if (scripts\engine\utility::_id_4347())
  var_15 = randomfloatrange(0, 2.5);

  var_13 scripts\engine\utility::delaythread(var_15, ::_id_39ED, var_14, !self._id_12A09);
  wait 0.05;
  }

  var_9++;

  if (var_9 == var_8.size)
  var_9 = 0;
  }
  }

  if (var_1 == 1) {
  self._id_1DF8 = scripts\engine\utility::_id_DC6B(var_8);

  if (isdefined(self._id_8B4F["cap_hardpoint_missile_barrage"]))
  thread _id_39B8("cap_hardpoint_missile_barrage", undefined, undefined);
  else
  {
  foreach (var_19 in self._id_8B4F) {
  wait(randomfloatrange(0, 5));
  thread _id_399D(var_19, var_8);
  }
  }
  }
}

_id_3967() {
  self notify("end_capitalship_ambient_targets");
  self notify("end_capitalship_attacking");
  self notify("stop_shooting_missiles");
  self notify("stop_shooting");
  self._id_1DF8 = undefined;

  foreach (var_1 in self._id_12A83) {
  foreach (var_3 in var_1) {
  if (!isdefined(var_3))
  continue;

  var_3._id_1DF8 = undefined;

  if (var_3.classname == "misc_turret")
  var_3 thread _id_39EC();
  }
  }
}

_id_39E5(var_0, var_1, var_2) {
  self endon("end_capitalship_ambient_targets");
  self endon("end_capitalship_attacking");
  self endon(var_0 + "_stop_attacking");

  if (!isdefined(self._id_129F5) || !isdefined(self._id_129F5[var_0]))
  return;

  var_3 = (0, 0, 0);

  if (var_0 == "front_left")
  var_3 = (1, 0, 0);
  else if (var_0 == "front_right")
  var_3 = (0, 1, 0);
  else if (var_0 == "back_left")
  var_3 = (0, 1, 1);
  else if (var_0 == "back_right")
  var_3 = (1, 1, 0);

  var_4 = [var_1];

  if (isdefined(var_2))
  var_4[var_4.size] = var_2;

  var_5 = self._id_129F5[var_0];
  var_6 = 0;

  foreach (var_8 in self._id_12A83) {
  foreach (var_10 in var_8) {
  if (!isdefined(var_10))
  continue;

  if (!scripts\engine\utility::array_contains(var_5, var_10._id_AD42))
  continue;

  var_10._id_1D65 = 1;
  var_10._id_1DF8 = scripts\engine\utility::_id_DC6B(var_4);
  var_10._id_AF58 = self._id_12A09;
  var_11 = 0;

  if (scripts\engine\utility::_id_4347())
  var_11 = randomfloatrange(0, 2.5);

  var_10 scripts\engine\utility::delaythread(var_11, ::_id_39ED, var_10._id_1DF8, !self._id_12A09);
  wait 0.05;
  }
  }
}

_id_399C(var_0, var_1) {
  if (isdefined(self._id_8B4F["cap_hardpoint_missile_barrage"]))
  thread _id_39B8("cap_hardpoint_missile_barrage", undefined, undefined, var_1, var_0);
  else
  {}
}

_id_399D(var_0, var_1, var_2) {
  self notify("stop_shooting_missiles");
  self endon("stop_shooting_missiles");
  self endon("death");
  self endon("entitydeleted");
  var_3 = var_0[0].class;
  var_4 = level._id_39DD[var_3]._id_10241;

  if (isdefined(self._id_10245) && isdefined(self._id_10245[var_3]))
  var_4 = self._id_10245[var_3];

  if (!isdefined(var_4._id_6CF8))
  return;

  for (;;) {
  var_1 = scripts\engine\utility::_id_22BC(var_1);

  if (var_1.size == 0)
  return;

  self [[var_4._id_6CF8]](var_1, var_0, var_4, undefined, undefined, 1, 0);
  wait 0.05;

  if (isdefined(var_2) && var_2)
  return;
  }
}

_id_6D0E(var_0, var_1, var_2, var_3, var_4, var_5, var_6) {
  self endon("death");
  var_7 = scripts\engine\utility::_id_DC6B(var_0);

  if (!isdefined(var_7))
  return;

  var_8 = _id_0B76::_id_A26D(0.15, 0.3, 150, 0.15, 0.3, 150);
  var_9 = 300;
  var_10 = 400;
  var_11 = 500;
  var_12 = 1.5;
  var_13 = (0, 0, 0);
  var_14 = 0;

  foreach (var_16 in var_1) {
  if (!isdefined(self))
  return;

  if (!isdefined(var_7))
  return;

  var_17 = self gettagangles(var_16._id_02DD);
  var_17 = invertangles(var_17);
  var_18 = scripts\engine\utility::_id_107E6();
  var_18.origin = self gettagorigin(var_16._id_02DD);
  var_18.angles = var_17;
  var_19 = (0, 0, 0);

  if (isdefined(var_7._id_24C4)) {
  var_20 = scripts\engine\utility::_id_DC6B(var_7._id_24C4);
  var_21 = var_7 gettagorigin(var_20);
  var_19 = var_7.origin - var_21;
  }

  var_22 = 0;

  if (isdefined(var_5) && !var_5)
  var_22 = 1;

  var_23 = 0;

  if (isdefined(var_6) && !var_6)
  var_23 = 1;

  if (isdefined(level._id_39B6) && !level._id_39B6)
  var_23 = 1;

  if (var_14 == 0)
  self playsound("capitalship_missile_salvo_mixed");

  var_24 = var_9;
  var_25 = var_10;
  var_26 = var_11;

  if (isdefined(self._id_B824))
  var_24 = self._id_B824;

  if (isdefined(self._id_B825))
  var_25 = self._id_B825;

  if (isdefined(self._id_B823))
  var_26 = self._id_B823;

  if (isdefined(self._id_B822))
  var_12 = self._id_B822;

  if (isdefined(self._id_12FB8) && self._id_12FB8)
  var_18._id_C180 = 1;

  var_18._id_AA99 = "capitalship_missile_launch";
  var_18._id_69E9 = "capitalship_missile_impact";
  var_18._id_BFEC = var_23;
  var_18 thread _id_0B76::_id_A332(var_7, 0, self, var_3, var_25, var_13, 0, var_4, var_24, 1, var_12, var_22, var_19, var_8, var_26);
  var_14 = var_14 + 1;

  if (var_14 >= var_2._id_B46E)
  break;

  wait(var_2._id_6D20);
  }

  wait(randomfloatrange(var_2._id_13535[0], var_2._id_13535[1]));
}

_id_6D0C(var_0, var_1, var_2, var_3, var_4, var_5, var_6) {
  if (1) {
  self endon("death");
  var_7 = scripts\engine\utility::_id_DC6B(var_0);

  if (!isdefined(var_7))
  return;

  var_8 = (0, 0, 0);
  var_9 = _id_0B76::_id_A26D(0.1, 0.15, 75, 0.2, 0.3, 75);
  var_10 = 400;
  var_11 = 1.5;
  var_12 = 0;

  foreach (var_14 in var_1) {
  if (!isdefined(self))
  return;

  if (!isdefined(var_7))
  return;

  var_0 = _id_0BA9::_id_DFE9(var_0);

  if (var_0.size == 0)
  return;

  if (!isdefined(var_14)) {
  wait(var_2._id_6D20);
  continue;
  }

  var_7 = scripts\engine\utility::_id_DC6B(var_0);

  if (isdefined(var_7._id_24C4)) {
  var_15 = scripts\engine\utility::_id_DC6B(var_7._id_24C4);
  var_16 = var_7 gettagorigin(var_15);
  var_8 = var_7.origin - var_16;
  }

  var_17 = self gettagangles(var_14._id_02DD);
  var_17 = invertangles(var_17);
  var_18 = scripts\engine\utility::_id_107E6();
  var_18.origin = self gettagorigin(var_14._id_02DD);
  var_18.angles = var_17;

  if (isdefined(self._id_B80E))
  var_18.origin = var_18.origin + self._id_B80E;

  var_19 = 0;

  if (isdefined(var_5) && !var_5)
  var_19 = 1;

  var_20 = 0;

  if (isdefined(var_6) && !var_6)
  var_20 = 1;

  if (isdefined(level._id_39B6) && !level._id_39B6)
  var_20 = 1;

  if (isdefined(self._id_12FB8) && self._id_12FB8)
  var_18._id_C180 = 1;

  var_18._id_AA99 = "capitalship_missile_launch";
  var_18._id_69E9 = "capitalship_missile_impact";
  var_18._id_BFEC = var_20;
  var_18 thread _id_0B76::_id_A332(var_7, 1, self, var_3, var_10, undefined, 0, var_4, 500, 1, var_11, var_19, var_8, var_9, 500);
  var_12 = var_12 + 1;

  if (var_12 >= var_2._id_B46E)
  break;

  if (var_12 % 4 == 0)
  wait 0.85;

  wait(var_2._id_6D20);
  }
  }

  wait(randomfloatrange(var_2._id_13535[0], var_2._id_13535[1]));
}

_id_39B6() {
  self endon("death");
  self waittill("missile_explode");

  if (isdefined(level._id_39B6) && !level._id_39B6)
  return;

  earthquake(0.25, 1, self.origin, 5000);
}

_id_39F0(var_0, var_1, var_2, var_3) {
  if (isdefined(self._id_12A83["cap_turret_missile_barrage"])) {
  self._id_12A83["cap_turret_missile_barrage"] = scripts\engine\utility::_id_22BC(self._id_12A83["cap_turret_missile_barrage"]);

  if (self._id_12A83["cap_turret_missile_barrage"].size > 0)
  thread _id_39B7("cap_turret_missile_barrage", var_2, var_3);
  }

  if (isdefined(self._id_8B4F["cap_hardpoint_missile_barrage"])) {
  self._id_8B4F["cap_hardpoint_missile_barrage"] = scripts\engine\utility::_id_22BC(self._id_8B4F["cap_hardpoint_missile_barrage"]);

  if (self._id_8B4F["cap_hardpoint_missile_barrage"].size > 0)
  thread _id_39B8("cap_hardpoint_missile_barrage", var_2, var_3);
  }

  foreach (var_5 in self._id_12A83) {
  var_5 = scripts\engine\utility::_id_22BC(var_5);

  if (var_5.size <= 0)
  continue;

  if (var_5[0].type == "cap_turret_missile_barrage")
  continue;

  foreach (var_7 in var_5) {
  if (!isdefined(var_7))
  continue;

  var_7._id_AF58 = 0;

  if (var_5[0].type == "cap_turret_large")
  var_7 thread _id_39E3(1);
  else if (var_5[0].type == "cap_turret_small_constant")
  var_7 thread _id_39E3(var_0, 1);
  else
  var_7 thread _id_39E3(var_0);

  if (var_5[0].type == "cap_turret_small_constant") {
  if (!isdefined(self._id_5099)) {
  self._id_5099 = spawnstruct();
  self._id_5099._id_12A83 = 0;
  self._id_5099._id_B738 = 0;
  self._id_5099._id_B417 = 1;
  }

  self._id_5099._id_12A83++;
  }
  }
  }

  if (isdefined(var_1) && isdefined(level._id_12A71) && level._id_12A71)
  _id_8933(var_1);
}

_id_39F1() {
  self notify("stop_shooting_missiles");

  foreach (var_1 in self._id_12A83) {
  foreach (var_3 in var_1) {
  if (!isdefined(var_3))
  continue;

  if (var_3.type == "cap_turret_missile_barrage")
  continue;

  var_3 notify("stop_shooting");
  }
  }
}

_id_39DF() {
  wait 1;

  if (level._id_12A91 != 0)
  level._id_3965 thread _id_39DE();
}

_id_39DE() {
  scripts\engine\utility::_id_6E4C("capital_ship_spawned");
  scripts\engine\utility::waitframe();

  foreach (var_1 in self._id_12A83) {
  if (isdefined(var_1)) {
  foreach (var_3 in var_1) {
  if (isdefined(var_3))
  var_3 delete();
  }
  }
  }

  _id_409E();
}

_id_39B5(var_0, var_1, var_2) {
  while (!isdefined(self._id_5099))
  scripts\engine\utility::waitframe();

  if (!isdefined(var_1))
  self._id_5099._id_B738 = 1000;

  if (!isdefined(var_2))
  self._id_5099._id_B417 = 5000;

  if (!isdefined(var_0))
  var_0 = 1;

  for (;;) {
  if (self._id_5099._id_12A83 < var_0) {
  self._id_5099._id_B738 = 0;
  self._id_5099._id_B417 = 0;
  }

  scripts\engine\utility::waitframe();
  }
}

_id_12A37(var_0, var_1) {
  var_2 = self gettagorigin(var_0);

  if (!isdefined(var_1))
  var_1 = _id_12A36(var_0);

  if (isdefined(self._id_4D1E) && isdefined(self._id_4D1E._id_7542._id_BE00)) {
  var_3 = anglestoright(var_1);
  var_4 = var_2 - self.origin;

  if (vectordot(var_4, var_3) > 0)
  var_5 = 1;
  else
  var_5 = -1;

  var_6 = var_3 * (self._id_4D1E._id_7542._id_BE00 * var_5);
  var_2 = var_2 + var_6;
  }

  return var_2;
}

_id_12A36(var_0) {
  return self gettagangles(var_0);
}

_id_12A32(var_0) {
  foreach (var_2 in var_0) {
  var_3 = _id_12A36(var_2);
  var_4 = _id_12A37(var_2, var_3);
  var_5 = scripts\engine\trace::_id_DCED(var_4, var_4 + anglestoforward(var_3) * 7000, undefined, 1);

  if (isdefined(var_5["entity"]) && isdefined(var_5["entity"]._id_EEDE) && var_5["entity"]._id_EEDE == self._id_EEDE)
  return 1;
  }

  return 0;
}

_id_12A02(var_0) {
  if (!isdefined(self.classname) || self.classname != "misc_turret")
  return;

  self endon("death");
  self notify("turret_hold_still");
  self endon("turret_hold_still");
  self _meth_8535(1);
  wait(var_0);
  self _meth_8535(0);
}

_id_39E3(var_0, var_1) {
  self notify("stop_shooting");
  self endon("stop_shooting");
  self endon("death");
  self endon("entitydeleted");
  self.team = self._id_EEDE;
  var_2 = _id_39DC(self._id_01F1);
  var_3 = 0;
  var_4 = 0;
  var_5 = undefined;

  if (isdefined(self._id_10241))
  var_5 = self._id_10241;
  else if (isdefined(level._id_39DD[self.class]._id_10241))
  var_5 = level._id_39DD[self.class]._id_10241;

  if (isdefined(self._id_4D1E) && isdefined(self._id_4D1E._id_DCCA))
  var_6 = self._id_4D1E._id_DCCA;
  else
  var_6 = 5000;

  thread _id_88ED();
  wait(randomfloat(2));

  for (;;) {
  if (self._id_C841 _id_0B91::_id_65DF("player_inside_ship") && self._id_C841 _id_0B91::_id_65DB("player_inside_ship")) {
  wait 1;
  continue;
  }

  if (isdefined(var_5) && isdefined(self._id_1D65) && self._id_1D65 == 1)
  var_7 = var_5._id_1DFC;
  else
  var_7 = 100;

  if (isdefined(var_5) && randomfloat(1) < var_7) {
  if (var_5._id_13536[0] == var_5._id_13536[1])
  var_3 = var_5._id_13536[0];
  else
  var_3 = randomfloatrange(var_5._id_13536[0], var_5._id_13536[1]);
  }
  else
  var_3 = 1;

  var_8 = 1;

  if (isdefined(var_1)) {
  foreach (var_10 in var_2)
  playfxontag(scripts\engine\utility::_id_7ECB(self._id_4D1E._id_7542._id_BDFF), self, var_10);
  }

  while (var_3 > 0) {
  if (_id_12A3B(var_6, self._id_114FB) || scripts\engine\utility::_id_9CEE(self._id_C841._id_1D62) || isdefined(self._id_102A6)) {
  self._id_114FB = self;
  _id_B2CA(var_6, 1);
  }

  if (isdefined(var_0) && var_0) {
  if (!isdefined(self._id_114FB) || self._id_114FB == self) {
  scripts\engine\utility::waitframe();
  continue;
  }

  var_12 = scripts\engine\utility::_id_137B9("turret_on_target", 2);

  if (isdefined(var_12) && var_12 == "timeout") {
  scripts\engine\utility::waitframe();
  continue;
  }
  }

  if (_id_0B91::_id_D123() && self._id_114FB == level._id_D127) {
  if (isdefined(self._id_10241._id_6D35)) {
  if (!isdefined(self._id_B04A)) {
  self._id_B04A = spawn("script_origin", self.origin);
  self._id_B04A linkto(self, "tag_flash", (0, 0, 0), (0, 0, 0));
  }

  if (!isdefined(self._id_B04C)) {
  self._id_B04C = 1;
  self._id_B04A playloopsound(self._id_10241._id_6D35);
  }
  }
  else if (isdefined(self._id_10241._id_6D33))
  thread scripts\engine\utility::_id_CE2B(self._id_10241._id_6D33, self.origin);
  }

  foreach (var_10 in var_2) {
  if (!_id_12A32([var_10])) {
  if (!scripts\engine\utility::_id_9CEE(self._id_AF58) && !isdefined(self._id_C841._id_12FBA)) {
  if (isdefined(var_5._id_10943))
  self [[var_5._id_10943]](var_10);
  else
  self shootturret(var_10);

  continue;
  }

  var_14 = _id_12A36(var_10);
  var_15 = self gettagangles(var_10);
  var_15 = vectornormalize(anglestoforward(var_15));
  var_16 = _id_12A37(var_10, var_14) + var_15 * 75;
  self thread [[var_5._id_AF57]](var_16, var_14, var_10);
  }
  }

  if (!isdefined(var_1))
  thread _id_12A02(0.33);

  if (isdefined(var_5)) {
  wait(var_5._id_6D20);
  var_3 = var_3 - var_5._id_6D20;
  } else {
  wait 1;
  var_3 = var_3 - 1;
  }

  if (isdefined(self._id_1D52) && var_8 == self._id_1D52) {
  var_8 = 1;
  continue;
  }

  var_8++;
  }

  if (isdefined(var_1)) {
  foreach (var_10 in var_2)
  stopfxontag(scripts\engine\utility::_id_7ECB(self._id_4D1E._id_7542._id_BDFF), self, var_10);
  }

  if (isdefined(self._id_B04C)) {
  if (isdefined(self) && isdefined(self._id_B04A)) {
  self._id_B04A stoploopsound(self._id_10241._id_6D35);
  self._id_B04A playsound(self._id_10241._id_6D37);
  self._id_B04C = undefined;
  }
  }

  if (isdefined(var_5))
  var_4 = randomfloatrange(var_5._id_13535[0], var_5._id_13535[1]);
  else
  var_4 = 0.5;

  wait(var_4);
  }
}

_id_12A3E(var_0) {
  if (isdefined(self._id_AD42) && isdefined(self._id_C841) && isdefined(self._id_4008)) {
  if (self._id_2103 == 0 && self._id_2107 == 0 && self._id_2109 == 0 && self._id_2100 == 0)
  return 1;

  var_1 = self._id_C841 gettagangles(self._id_AD42);
  var_2 = self._id_C841 gettagorigin(self._id_AD42);
  var_3 = var_0.origin - var_2;
  var_4 = rotatevectorinverted(var_3, var_1);
  var_5 = vectornormalize((var_4[0], var_4[1], 0));
  var_6 = vectordot(var_5, (1, 0, 0));

  if (var_5[1] >= 0 && var_6 < self._id_2104)
  return 0;

  if (var_5[1] <= 0 && var_6 < self._id_2108)
  return 0;

  var_7 = vectortoangles(var_4);
  var_8 = vectornormalize(rotatevector(var_4, (0, var_7[1] * -1.0, 0)));
  var_9 = vectordot(var_8, (1, 0, 0));

  if (var_8[2] <= 0 && var_9 < self._id_2101)
  return 0;

  if (var_8[2] >= 0 && var_9 < self._id_210A)
  return 0;
  }

  return 1;
}

_id_12A3B(var_0, var_1) {
  if (!isdefined(var_1))
  return 1;

  var_2 = distancesquared(var_1.origin, self.origin);

  if (var_2 > squared(var_0) || self == var_1)
  return 1;

  if (!_id_12A3E(var_1))
  return 1;

  return 0;
}

_id_B2CA(var_0, var_1) {
  var_2 = squared(var_0);
  var_3 = var_2;

  if (isdefined(self) && isdefined(self._id_12A01) && self._id_12A01.size > 0) {
  foreach (var_5 in self._id_12A01) {
  if (isdefined(var_5) && isdefined(var_5._id_1153C) && var_5._id_1153C == 1 && self _meth_8540(var_5.origin)) {
  self settargetentity(var_5, (0, 0, 0));
  return;
  }
  }

  var_3 = _id_B2CB(self._id_12A01, var_3, var_2);
  }

  if (isdefined(self._id_C841) && isdefined(self._id_C841._id_39A9) && self._id_C841._id_39A9.size > 0)
  var_3 = _id_B2CB(self._id_C841._id_39A9, var_3, var_2);

  if (isdefined(level._id_39A9) && level._id_39A9.size > 0)
  var_3 = _id_B2CB(level._id_39A9, var_3, var_2);

  if (isdefined(level._id_1678) && isdefined(self.type) && self.type == "cap_turret_small_constant") {
  var_3 = _id_B2CB(level._id_1678, var_3, var_2);

  if (isdefined(self._id_114FB) && self._id_114FB != self && self _meth_8540(self._id_114FB.origin)) {
  if (isdefined(var_1) && self.classname == "misc_turret") {
  self settargetentity(self._id_114FB, (0, 0, 0));
  return;
  }
  }
  }

  if (isdefined(level._id_D127)) {
  if (!isdefined(level._id_C0B7) || isdefined(level._id_C0B7) && level._id_C0B7 == 0) {
  if (isdefined(self._id_C841) && isdefined(self._id_C841._id_11578) && self._id_C841._id_11578) {
  if (isdefined(var_1) && self.classname == "misc_turret" && (!isdefined(self._id_10241._id_102A6) || !self._id_10241._id_102A6)) {
  var_7 = self _meth_8540(level._id_D127.origin);
  var_8 = distancesquared(self.origin, level._id_D127.origin);

  if (var_7 && var_8 < 225000000) {
  self._id_114FB = level._id_D127;
  thread _id_12A46(self._id_114FB);
  return;
  }
  else
  self notify("stop_debug_line_loop");
  }
  }
  }
  }

  var_9 = level._id_A056._id_1630;

  if (isdefined(var_9) && var_3 > 0) {
  var_3 = squared(sqrt(var_3) + 5000);
  var_3 = _id_B2CB(var_9, var_3, var_2);
  }

  if (isdefined(var_1) && self.classname == "misc_turret") {
  if (self._id_114FB == self || scripts\engine\utility::_id_9CEE(self._id_10241._id_102A6) || !self _meth_8540(self._id_114FB.origin))
  _id_11547();
  else
  self settargetentity(self._id_114FB, (0, 0, 0));
  }
}

_id_12A46(var_0) {
  self notify("track_new_target");
  self endon("track_new_target");
  self endon("death");
  self _meth_82C9(0, "yaw");
  self _meth_82C9(0, "pitch");
  var_1 = (0, 0, 0);

  for (;;) {
  var_2 = (0, 0, 0);

  if (isdefined(self._id_C841))
  var_2 = self._id_C841 _meth_83E0();

  var_3 = (0, 0, 0);

  if (isdefined(level._id_D127) && var_0 == level._id_D127 && _id_0B91::_id_D123())
  var_3 = level._id_D127 getentityvelocity();

  if (isdefined(level._id_4BA1))
  var_3 = var_3 + (level._id_4BA1 * 15, 0, 0);

  var_4 = self gettagorigin("tag_flash");
  var_5 = _func_2C6(var_4, var_2, 20000, var_0.origin, var_3);

  if (isdefined(var_5))
  var_6 = var_5 - var_0.origin;
  else
  var_6 = var_1;

  self settargetentity(var_0, var_6);
  var_7 = anglestoforward(self gettagangles("tag_aim"));
  var_1 = var_6;
  wait 0.05;
  }
}

_id_11547() {
  if (isdefined(self._id_C841._id_102A9) && !isdefined(self._id_102A8)) {
  var_0 = 0;

  while (var_0 < 10) {
  var_1 = scripts\engine\utility::_id_DC6B(self._id_C841._id_102A9);

  if (self _meth_8540(var_1.origin)) {
  self._id_114FB = var_1;
  self._id_102A8 = var_1;
  self settargetentity(self._id_114FB, (0, 0, 0));
  thread _id_4180();
  break;
  }
  else
  var_0 = var_0 + 1;

  wait 0.05;
  }
  }
}

_id_4180() {
  wait(randomfloatrange(0.5, 1.5));
  self._id_102A8 = undefined;
}

_id_F5C0(var_0, var_1) {
  var_2 = var_0 getentitynumber();

  if (var_1 > 0) {
  var_0._id_1153C = var_1;

  if (!isdefined(self._id_39A9))
  self._id_39A9 = [];

  self._id_39A9[var_2] = var_0;
  } else {
  var_0._id_1153C = undefined;

  if (isdefined(self._id_39A9))
  self._id_39A9[var_2] = undefined;
  }

  if (isdefined(self._id_39A9) && self._id_39A9.size == 0)
  self._id_39A9 = undefined;
}

_id_F5C1(var_0, var_1) {
  var_2 = var_0 getentitynumber();

  if (var_1 > 0) {
  var_0._id_1153C = var_1;

  if (!isdefined(self._id_12A01))
  self._id_12A01 = [];

  self._id_12A01[var_2] = var_0;
  } else {
  var_0._id_1153C = undefined;

  if (isdefined(self._id_12A01))
  self._id_12A01[var_2] = undefined;
  }

  if (isdefined(self._id_12A01) && self._id_12A01.size == 0)
  self._id_12A01 = undefined;
}

_id_445E(var_0, var_1) {
  var_2 = 0;
  var_3 = 0;

  if (isdefined(var_0) && isdefined(var_0._id_1153C))
  var_2 = var_0._id_1153C;

  if (isdefined(var_1) && isdefined(var_1._id_1153C))
  var_3 = var_1._id_1153C;

  return var_2 - var_3;
}

_id_B2CB(var_0, var_1, var_2) {
  if (!isdefined(var_0))
  return;

  if (!isdefined(var_2))
  var_2 = var_1;

  foreach (var_4 in var_0) {
  if (!isdefined(var_0))
  return;

  if (!isdefined(var_4))
  continue;

  if (!isdefined(var_4.team))
  var_4.team = "allies";

  if (var_4.team != self.team && !scripts\engine\utility::_id_9CEE(var_4._id_12A88)) {
  var_5 = distancesquared(var_4.origin, self.origin);
  var_6 = _id_445E(var_4, self._id_114FB);

  if (var_6 > 0 && var_5 < var_2 && _id_12A3E(var_4)) {
  self._id_114FB = var_4;
  var_1 = var_5;
  }

  if (var_6 <= 0 && var_5 < var_1) {
  if (!_id_12A3E(var_4))
  continue;

  var_1 = var_5;
  self._id_114FB = var_4;
  }
  }
  }

  return var_1;
}

_id_6D4F(var_0, var_1, var_2, var_3) {
  var_4 = self._id_4D1E._id_10AA2;
  var_5 = self._id_4D1E._id_7542._id_11A7B;
  var_6 = randomfloatrange(-1 * var_4, var_4);
  var_7 = randomfloatrange(-1 * var_4, var_4);
  var_8 = randomfloatrange(-1 * var_4, var_4);
  var_9 = var_0 + self._id_4D1E._id_DCCA * anglestoforward(var_1);
  var_10 = var_0 + (self._id_4D1E._id_DCCA * anglestoforward(var_1) + (var_6, var_7, var_8));
  var_11 = vectortoangles(vectornormalize(var_9 - var_0));
  var_12 = vectortoangles(vectornormalize(var_10 - var_0));
  _id_129CA(var_0, var_9, var_11, 1500, undefined, var_2, undefined, "capital_ship_turret_fire", var_3);
}

_id_6D4E(var_0, var_1, var_2, var_3) {
  var_4 = self._id_4D1E._id_7542._id_A865;
  var_5 = self._id_4D1E._id_7542._id_6D02;
  var_6 = self._id_4D1E._id_7542._id_11A7B;
  var_7 = var_0 + self._id_4D1E._id_DCCA * anglestoforward(var_1);
  var_8 = vectortoangles(vectornormalize(var_7 - var_0));
  _id_129CA(var_0, var_7, var_8, 1500, self._id_4D1E._id_7542._id_BDFF, var_2, undefined, "capital_ship_turret_fire");
}

_id_6D4C(var_0, var_1, var_2, var_3, var_4, var_5) {
  if (!isdefined(var_4))
  var_4 = 500;

  if (isdefined(self._id_114FB) && self != self._id_114FB)
  self._id_4D1E._id_32BA = distance(self.origin, self._id_114FB.origin);
  else
  self._id_4D1E._id_32BA = 10000;

  if (isdefined(self._id_114FB._id_5099) && isdefined(self._id_114FB._id_5099._id_B738) && isdefined(self._id_114FB._id_5099._id_B417))
  self._id_4D1E._id_32BA = self._id_4D1E._id_32BA - randomfloatrange(self._id_114FB._id_5099._id_B738, self._id_114FB._id_5099._id_B417);

  if (self._id_114FB == level.player)
  var_6 = 1;
  else
  var_6 = 0;

  var_7 = (randomfloatrange(-1 * var_4, var_4), randomfloatrange(-1 * var_4, var_4), randomfloatrange(-1 * var_4, var_4));
  var_8 = var_0 + 10000 * anglestoforward(var_1) + var_7;
  var_9 = vectortoangles(var_8 - var_0);

  if (isdefined(var_5)) {
  var_10 = bullettrace(var_0, var_8, 1);

  if (length(var_10["position"] - var_0) < var_5)
  return;
  }

  var_11 = self._id_4D1E._id_7542._id_11A7B;
  thread _id_129CB(var_0, var_8, var_9, 730, self._id_4D1E._id_7542._id_BDFF, var_2, var_6, undefined, "capital_ship_turret_fire", "flak_explo_space", self._id_4D1E._id_7542._id_69DA);
}

_id_129CA(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9) {
  if (isdefined(var_7))
  thread _id_D528(var_7, var_0);

  if (!isdefined(var_8))
  var_8 = 1;

  if (isdefined(var_4)) {
  var_10 = anglestoforward(var_2);
  var_11 = anglestoup(var_2);
  playfx(scripts\engine\utility::_id_7ECB(var_4), var_0, var_10, var_11);
  }

  if (var_8 == 1)
  _id_88BC(var_0, var_1, var_3, self._id_934D, self._id_4D1E, self, var_6, var_9);
}

_id_129CB(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11) {
  var_12 = self._id_4D1E._id_32B9;
  var_13 = self._id_4D1E._id_32B2;

  if (isdefined(var_8))
  thread _id_D528(var_8, var_0);

  var_14 = anglestoforward(var_2);
  var_15 = anglestoup(var_2);
  playfx(scripts\engine\utility::_id_7ECB(var_4), var_0, var_14, var_15);
  var_16 = _id_88BC(var_0, var_1, var_3, self._id_934D, self._id_4D1E, self, var_7, var_11);

  if (isdefined(var_16))
  thread _id_1A8A(var_16, var_2, var_12, var_13, var_9, var_10, var_6);
}

_id_1A8A(var_0, var_1, var_2, var_3, var_4, var_5, var_6) {
  if (isdefined(self))
  var_7 = self;
  else
  var_7 = undefined;

  if (!isdefined(var_5))
  playfx(scripts\engine\utility::_id_7ECB("aa_burst"), var_0, anglestoforward(var_1), anglestoup(var_1));
  else
  playfx(scripts\engine\utility::_id_7ECB(var_5), var_0, anglestoforward(var_1), anglestoup(var_1));

  radiusdamage(var_0, var_2, var_3, 0, var_7, "MOD_EXPLOSIVE");
  var_8 = distancesquared(level.player.origin, var_0);

  if (isdefined(var_6) && var_6 == 1 && isdefined(var_4))
  thread _id_D528(var_4, var_0);

  if (var_8 < squared(1000))
  level.player playrumbleonentity("grenade_rumble");
  else if (var_8 < squared(3000))
  level.player playrumbleonentity("damage_heavy");
  else if (var_8 < squared(6000))
  level.player playrumbleonentity("damage_light");
  else
  return;

  var_9 = 0.2;
  var_10 = _id_0B4D::_id_C097(400, 10000, sqrt(var_8));
  var_11 = _id_0B4D::_id_6A8E(0.01, var_9, var_10);
  thread _id_1A8B(var_11);
}

_id_1A8B(var_0) {
  if (!isdefined(level.player._id_4B39))
  level.player._id_4B39 = 0;

  if (var_0 < level.player._id_4B39)
  return;

  level notify("notify_new_airburst_quake");
  level endon("notify_new_airburst_quake");
  level.player._id_4B39 = var_0;
  earthquake(var_0, 1.2, level.player.origin, 5000);
  wait 0.5;
  level.player._id_4B39 = level.player._id_4B39 * 0.5;
  wait 0.25;
  level.player._id_4B39 = level.player._id_4B39 * 0.5;
  wait 0.25;
  level.player._id_4B39 = level.player._id_4B39 * 0.0;
}

_id_88BC(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7) {
  if (!isdefined(var_7))
  var_7 = 0;

  var_8 = var_0;
  var_9 = self.team;
  var_10 = 0;
  var_11 = vectornormalize(var_1 - var_8);

  if (isdefined(var_4._id_32BA)) {
  if (var_4._id_32BA - var_4._id_DCCC < var_4._id_DCCB) {
  var_12 = var_4._id_32BA - var_4._id_DCCB;

  if (var_12 < 0)
  var_12 = 0.01;
  }
  else
  var_12 = var_4._id_DCCC;

  var_13 = var_4._id_32BA + randomfloatrange(-1 * var_12, var_12);
  }
  else
  var_13 = var_4._id_DCCA;

  var_14 = undefined;
  var_15 = undefined;
  var_16 = 0;
  var_1 = var_8 + var_11 * var_2;
  var_17 = distancesquared(var_8, var_1);

  for (;;) {
  var_1 = var_8 + var_11 * var_2;

  if (var_7) {}

  var_14 = _id_8913(var_8, var_1, var_11, var_9, var_17);

  if (isdefined(var_14)) {
  if (isdefined(level._id_D127) && level._id_D127._id_02A9 != "hover") {
  var_15 = bullettrace(var_8, var_1, 1);

  if (isdefined(var_15["entity"])) {
  var_16 = 1;
  break;
  }
  }
  } else {
  var_10 = var_10 + var_2;

  if (var_10 >= var_13)
  return var_1;
  }

  var_8 = var_1;
  wait(level._id_11937);
  }

  thread _id_4C7C(var_14, var_15, var_1, var_3, var_6);
  var_18 = _id_0B4D::_id_C097(0, var_13, var_10);
  var_19 = _id_0B4D::_id_6A8E(var_4._id_B428, var_4._id_B73D, var_18);
  var_20 = _id_0B4D::_id_6A8E(var_4._id_B465, var_4._id_B753, var_18);

  if (!isdefined(var_5))
  var_5 = level.player;

  if (var_16)
  var_14 _id_54DF(int(var_19), var_1, var_5);
}

_id_88ED() {
  self endon("stop_shooting");
  self endon("death");
  self endon("entitydeleted");
  level endon("ship_infil_triggered");
  level._id_9D8F = 0;
  var_0 = 0;
  var_1 = 0;
  var_2 = self._id_45E3;
  var_3 = self._id_45E4;

  for (;;) {
  if (isdefined(level._id_D127) && level._id_D127._id_02A9 == "hover")
  var_0 = var_0 + 0.05;
  else
  var_0 = var_0 - 0.05;

  if (var_0 >= 0.6)
  level._id_9D8F = 1;
  else
  level._id_9D8F = 0;

  wait 0.05;
  }
}

_id_54DF(var_0, var_1, var_2) {
  if (isdefined(self._id_8CBE))
  var_3 = self._id_8CBE;
  else
  var_3 = self;

  var_3 _meth_80B0(var_0, var_1, var_2, var_2, "MOD_EXPLOSIVE");
}

_id_8913(var_0, var_1, var_2, var_3, var_4) {
  var_5 = undefined;

  if (isdefined(level._id_1678))
  var_5 = _id_3DA7(level._id_1656, var_0, var_1, var_2, var_3, var_4);

  if (isdefined(var_5))
  return var_5;

  var_6[0] = level._id_D127;
  var_5 = _id_3DA7(var_6, var_0, var_1, var_2, var_3, var_4);

  if (isdefined(var_5))
  return var_5;

  if (isdefined(level._id_A056._id_1630)) {
  var_7 = level._id_A056._id_1630;
  var_5 = _id_3DA7(var_7, var_0, var_1, var_2, var_3, var_4);
  }

  return var_5;
}

_id_3DA7(var_0, var_1, var_2, var_3, var_4, var_5) {
  if (!isdefined(var_0))
  return;

  foreach (var_7 in var_0) {
  if (!isdefined(var_0))
  return;

  if (!isdefined(var_7))
  continue;

  if (!isdefined(var_7.team))
  var_7.team = "allies";

  if (var_7.team != var_4) {
  var_8 = vectornormalize(var_1 - var_7.origin);
  var_9 = vectordot(var_3, var_8);

  if (var_9 > 0) {
  var_10 = distancesquared(var_7.origin, var_2);

  if (var_10 < 65536.0)
  return var_7;
  else if (var_10 < var_5) {
  if (var_9 > 0.85 || var_9 < -0.85)
  return var_7;
  }
  }
  }
  }

  return;
}

_id_4C7C(var_0, var_1, var_2, var_3, var_4) {
  self endon("death");

  if (isdefined(var_0) && isdefined(var_0._id_112DC))
  var_5 = var_0._id_112DC;
  else if (isdefined(var_0) && isdefined(var_0._id_02D9))
  var_5 = var_0._id_02D9;
  else if (isdefined(var_1) && isdefined(var_1["surfacetype"]))
  var_5 = var_1["surfacetype"];
  else
  var_5 = "metal";

  if (!isdefined(var_4))
  var_6 = _id_4C45(var_5, var_3);
  else
  var_6[0] = var_4;

  playfx(scripts\engine\utility::_id_7ECB(var_6[0]), var_2);

  if (isdefined(var_6[1]))
  thread _id_D528(var_6[1], var_2);
}

_id_4C45(var_0, var_1) {
  var_2 = "";
  var_3 = "";
  var_4 = 0;

  if (!isdefined(var_0))
  var_0 = "jackal";

  if (!isdefined(var_1))
  var_1 = "turret";

  switch (var_0) {
  case "metal":
  switch (var_1) {
  case "turret":
  var_2 = "jet_gun_imp_metal";
  var_3 = "capitalship_cannon_impact";
  var_4 = 5;
  break;
  case "viper_gun_small":
  var_2 = "jet_gun_imp_metal";
  var_3 = "viper_bullet_player_metal";
  var_4 = 5;
  break;
  case "viper_gun_large":
  var_2 = "jet_gun_imp_large_metal";
  var_3 = "viper_bullet_player_metal";
  var_4 = 5;
  break;
  case "missile":
  var_2 = "capital_missile_imp_capship_gen";
  var_3 = "capitalship_missile_impact";
  var_4 = 5;
  break;
  }

  break;
  case "rock":
  switch (var_1) {
  case "turret":
  var_2 = "jet_gun_imp_rock";
  var_3 = "capitalship_cannon_impact";
  var_4 = 5;
  break;
  case "viper_gun_small":
  var_2 = "jet_gun_imp_rock";
  var_3 = "viper_bullet_player_metal";
  var_4 = 5;
  break;
  case "viper_gun_large":
  var_2 = "jet_gun_imp_large_rock";
  var_3 = "viper_bullet_player_metal";
  var_4 = 5;
  break;
  case "missile":
  var_2 = "jet_missile_imp_generic";
  var_3 = "capitalship_missile_impact";
  var_4 = 5;
  break;
  }

  break;
  case "water":
  switch (var_1) {
  case "turret":
  var_2 = "jet_gun_imp_water";
  var_3 = "turret_bullet_impact_water";
  var_4 = 5;
  break;
  case "viper_gun_small":
  var_2 = "jet_gun_imp_water";
  var_3 = "jet_bullet_impact_water";
  var_4 = 5;
  break;
  case "viper_gun_large":
  var_2 = "jet_gun_imp_water";
  var_3 = "jet_bullet_impact_water";
  var_4 = 5;
  break;
  case "missile":
  var_2 = "jet_missile_imp_water";
  var_3 = "capitalship_missile_impact";
  var_4 = 5;
  break;
  }

  break;
  case "jackal":
  switch (var_1) {
  case "turret":
  var_2 = "fighter_spaceship_damage_med";
  var_3 = "capitalship_cannon_impact";
  var_4 = 5;
  break;
  case "viper_gun_small":
  var_2 = "fighter_spaceship_damage_med";
  var_3 = "viper_bullet_player_metal";
  var_4 = 5;
  break;
  case "viper_gun_large":
  var_2 = "fighter_spaceship_damage_med";
  var_3 = "viper_bullet_player_metal";
  var_4 = 5;
  break;
  case "missile":
  var_2 = "jet_missile_imp_generic";
  var_3 = "capitalship_missile_impact";
  var_4 = 5;
  break;
  }

  break;
  default:
  switch (var_1) {
  case "turret":
  var_2 = "jet_gun_imp_boat_dx";
  var_3 = "capitalship_cannon_impact";
  var_4 = 5;
  break;
  case "viper_gun_small":
  var_2 = "jet_gun_imp_boat_dx";
  var_3 = "viper_bullet_player_metal";
  var_4 = 5;
  break;
  case "viper_gun_large":
  var_2 = "jet_gun_imp_boat_dx";
  var_3 = "viper_bullet_player_metal";
  var_4 = 5;
  break;
  case "missile":
  var_2 = "capital_missile_imp_capship_gen";
  var_3 = "capitalship_missile_impact";
  var_4 = 5;
  break;
  }

  break;
  }

  return [var_2, var_3, var_4];
}

_id_D528(var_0, var_1) {
  var_2 = spawn("script_origin", var_1);
  var_2 playsound(var_0, "sounddone");
  var_2 waittill("sounddone");
  var_2 delete();
}

_id_39B7(var_0, var_1, var_2) {
  self notify("stop_shooting_missiles");
  self endon("stop_shooting_missiles");
  self endon("death");
  self endon("entitydeleted");
  self.team = self._id_EEDE;
  var_3 = _id_39DC(self._id_12A83[var_0][0]._id_01F1);
  var_4 = 0;
  var_5 = 0;
  var_6 = undefined;

  if (isdefined(self._id_12A83[var_0][0]._id_10241))
  var_6 = self._id_12A83[var_0][0]._id_10241;
  else if (isdefined(level._id_39DD[self._id_12A83[var_0][0].class]._id_10241))
  var_6 = level._id_39DD[self._id_12A83[var_0][0].class]._id_10241;

  if (isdefined(self._id_12A83[var_0][0]._id_4D1E) && isdefined(self._id_12A83[var_0][0]._id_4D1E._id_DCCA))
  var_7 = self._id_12A83[var_0][0]._id_4D1E._id_DCCA;
  else
  var_7 = 5000;

  wait(randomfloat(2));

  for (;;) {
  if (_id_0B91::_id_65DF("player_inside_ship") && _id_0B91::_id_65DB("player_inside_ship")) {
  wait 1;
  continue;
  }

  if (isdefined(var_6) && isdefined(self._id_1D65) && self._id_1D65 == 1)
  var_8 = var_6._id_1DFC;
  else
  var_8 = 100;

  if (isdefined(var_6) && randomfloat(1) < var_8)
  var_4 = randomfloatrange(var_6._id_13536[0], var_6._id_13536[1]);
  else
  var_4 = 1;

  var_9 = 0;

  while (var_4 > 0) {
  if (!isdefined(self._id_12A83[var_0]))
  return;

  self._id_12A83[var_0] = _id_0BA9::_id_DFE9(self._id_12A83[var_0]);

  if (isdefined(self._id_12A83[var_0]) && self._id_12A83[var_0].size == 0)
  return;

  if (_id_12A3B(var_7, self._id_114FB) || scripts\engine\utility::_id_9CEE(self._id_1D62))
  _id_B2CA(var_7);

  if (!isdefined(self._id_114FB) || self._id_114FB == self) {
  wait 0.1;
  continue;
  }

  if (isdefined(self._id_114FB) && isdefined(level._id_D127) && self._id_114FB == level._id_D127)
  wait 2;

  if (!isdefined(level._id_B898)) {
  level._id_B898 = 0;
  level._id_B8AD = [];
  }

  if (scripts\engine\utility::_id_9CEE(var_2)) {
  if (isdefined(self._id_114FB)) {
  foreach (var_11 in var_3)
  thread _id_399B(var_11, var_1);
  }
  }
  else if (isdefined(var_6._id_10943))
  self [[var_6._id_10943]](var_0, var_6, var_3, var_7);
  else
  {
  var_13 = 0;

  foreach (var_15 in self._id_12A83[var_0]) {
  if (isdefined(var_15)) {
  foreach (var_11 in var_3) {
  var_17 = var_15 _id_12A36(var_11);
  var_18 = var_15 _id_12A37(var_11, var_17);

  if (self._id_114FB != self)
  var_15._id_114FB = self._id_114FB;

  if (scripts\engine\utility::_id_B8F8(var_13, level._id_C214) == var_9) {
  var_19 = [];
  var_19[0] = var_11;
  var_15 _id_0B76::_id_1945(var_15._id_114FB, var_19, 1);
  }
  }

  if (isdefined(var_6))
  wait(var_6._id_6D39);
  else
  wait 1;
  }

  var_13++;
  }
  }

  if (isdefined(var_6)) {
  wait(var_6._id_6D20);
  var_4 = var_4 - var_6._id_6D20;
  continue;
  }

  wait 1;
  var_4 = var_4 - 1;
  }

  var_9++;

  if (var_9 == level._id_C214)
  var_9 = 0;

  if (isdefined(var_6))
  var_5 = randomfloatrange(var_6._id_13535[0], var_6._id_13535[1]);
  else
  var_5 = 0.5;

  wait(var_5);
  }
}

_id_39B8(var_0, var_1, var_2, var_3, var_4) {
  self notify("stop_shooting_missiles");
  self endon("stop_shooting_missiles");
  self endon("death");
  self endon("entitydeleted");
  self.team = self._id_EEDE;
  self._id_8B4F[var_0] = scripts\engine\utility::_id_22BC(self._id_8B4F[var_0]);

  if (self._id_8B4F[var_0].size == 0)
  return;

  var_5 = _id_39DC(self._id_8B4F[var_0][0]._id_01F1);
  var_6 = 0;
  var_7 = 0;
  var_8 = undefined;

  if (isdefined(self._id_8B4F[var_0][0]._id_10241))
  var_8 = self._id_8B4F[var_0][0]._id_10241;
  else if (isdefined(level._id_39DD[self._id_8B4F[var_0][0].class]._id_10241))
  var_8 = level._id_39DD[self._id_8B4F[var_0][0].class]._id_10241;

  if (isdefined(self._id_8B4F[var_0][0]._id_4D1E) && isdefined(self._id_8B4F[var_0][0]._id_4D1E._id_DCCA))
  var_9 = self._id_8B4F[var_0][0]._id_4D1E._id_DCCA;
  else
  var_9 = 5000;

  wait(randomfloat(2));

  for (;;) {
  if (_id_0B91::_id_65DF("player_inside_ship") && _id_0B91::_id_65DB("player_inside_ship")) {
  wait 1;
  continue;
  }

  if (isdefined(var_8) && isdefined(self._id_1D65) && self._id_1D65 == 1)
  var_10 = var_8._id_1DFC;
  else
  var_10 = 100;

  if (isdefined(var_8) && randomfloat(1) < var_10)
  var_6 = randomfloatrange(var_8._id_13536[0], var_8._id_13536[1]);
  else
  var_6 = 1;

  var_11 = 0;

  while (var_6 > 0) {
  self._id_8B4F[var_0] = scripts\engine\utility::_id_22BC(self._id_8B4F[var_0]);

  if (isdefined(self._id_8B4F[var_0]) && self._id_8B4F[var_0].size == 0)
  return;

  if (isdefined(var_3))
  self._id_114FB = var_3;
  else if (isdefined(self._id_1DF8))
  self._id_114FB = self._id_1DF8;
  else if (_id_12A3B(var_9, self._id_114FB) || scripts\engine\utility::_id_9CEE(self._id_1D62))
  _id_B2CA(var_9);

  if (!isdefined(self._id_114FB) || self._id_114FB == self) {
  wait 0.1;
  continue;
  }

  if (!isdefined(self._id_114FB) || self._id_114FB == self) {
  wait 0.1;
  continue;
  }

  if (isdefined(self._id_114FB) && isdefined(level._id_D127) && self._id_114FB == level._id_D127)
  wait 2;

  if (!isdefined(level._id_B898)) {
  level._id_B898 = 0;
  level._id_B8AD = [];
  }

  if (scripts\engine\utility::_id_9CEE(var_2)) {
  if (isdefined(self._id_114FB)) {
  foreach (var_13 in var_5)
  thread _id_399B(var_13, var_1);
  }
  }
  else if (isdefined(var_8._id_10943))
  self [[var_8._id_10943]](var_0, var_8, var_5, var_9);
  else
  {
  var_15 = 0;

  foreach (var_17 in self._id_8B4F[var_0]) {
  if (isdefined(var_17)) {
  if (isdefined(var_4)) {
  if (!isdefined(self._id_8B46) || !isdefined(self._id_8B46[var_4])) {
  wait 0.05;
  var_15++;
  continue;
  }

  var_18 = self._id_8B46[var_4];

  if (!scripts\engine\utility::array_contains(var_18, var_17._id_AD42)) {
  wait 0.05;
  var_15++;
  continue;
  }
  }

  foreach (var_13 in var_5) {
  var_20 = var_17 _id_12A36(var_13);
  var_21 = var_17 _id_12A37(var_13, var_20);

  if (self._id_114FB != self)
  var_17._id_114FB = self._id_114FB;

  if (level._id_C214 == -1 || scripts\engine\utility::_id_B8F8(var_15, level._id_C214) == var_11) {
  var_22 = [];
  var_22[0] = var_13;
  var_17 _id_0B76::_id_1945(var_17._id_114FB, var_22, 1);
  }
  }

  if (isdefined(var_8))
  wait(var_8._id_6D39);
  else
  wait 1;
  }

  var_15++;
  }
  }

  if (isdefined(var_8)) {
  wait(var_8._id_6D20);
  var_6 = var_6 - var_8._id_6D20;
  continue;
  }

  wait 1;
  var_6 = var_6 - 1;
  }

  var_11++;

  if (var_11 == level._id_C214)
  var_11 = 0;

  if (isdefined(var_8))
  var_7 = randomfloatrange(var_8._id_13535[0], var_8._id_13535[1]);
  else
  var_7 = 0.5;

  wait(var_7);
  }
}

_id_399B(var_0, var_1) {
  var_2 = randomint(self._id_12A69.size);
  scripts\engine\utility::_id_22D2(self._id_12A69[var_2], ::_id_6D52, self, var_0, var_1);
}

_id_39BF(var_0, var_1, var_2, var_3) {
  var_4 = self._id_12A83[var_2];
  var_5 = scripts\engine\utility::_id_22A7(var_4);
  var_6 = 0;

  foreach (var_8 in var_5) {
  if (isdefined(var_8)) {
  var_9 = var_8 _id_12A36(var_0);
  var_10 = var_8 _id_12A37(var_0, var_9);
  var_9 = var_9 + (randomfloatrange(-10, 10), randomfloatrange(-10, 10), randomfloatrange(-10, 10));

  if (self._id_114FB != self)
  var_8._id_114FB = self._id_114FB;

  var_8 thread _id_6D51(var_10, var_9, var_0, 1);
  var_6++;

  if (var_6 > 6)
  return;

  if (isdefined(var_1))
  wait(var_1._id_6D39);
  else
  wait 0.2;
  }
  }
}

_id_6D52(var_0, var_1, var_2) {
  var_3 = self;
  wait(randomfloatrange(0.05, 1));

  if (isdefined(var_3) && isdefined(var_0)) {
  if (var_0._id_114FB != var_0)
  var_3._id_114FB = var_0._id_114FB;

  var_4 = var_3 _id_12A36(var_1);
  var_5 = var_3 _id_12A37(var_1, var_4);
  var_4 = var_4 + (randomfloatrange(-10, 10), randomfloatrange(-10, 10), randomfloatrange(-10, 10));

  if (!isdefined(var_0._id_114FB))
  return;

  var_6 = [];
  var_6[0] = var_1;
  var_3 _id_0B76::_id_1945(var_0._id_114FB, var_6, 1);
  }
}

_id_6D51(var_0, var_1, var_2, var_3) {
  if (!isdefined(self._id_114FB) || self._id_114FB == self)
  return;

  if (scripts\engine\utility::_id_9CEE(var_3)) {
  if (!isdefined(self._id_6D1D))
  return;

  var_4 = self;
  var_5 = var_0 + 10000 * anglestoforward(var_1);
  var_6 = magicbullet(var_4._id_6D1D, var_0, var_5);
  var_6 thread _id_396D();
  var_6.team = self._id_EEDE;
  var_6 setcandamage(1);

  if (isdefined(level._id_D127) && self._id_114FB == level._id_D127 && isdefined(level._id_B8B5) && level._id_B8B5)
  level.player thread _id_11AA8(var_6);

  level._id_B898++;
  wait(randomfloatrange(0.25, 1));

  if (isdefined(var_6) && isvalidmissile(var_6) && isdefined(var_4) && isdefined(var_4._id_114FB)) {
  var_6 _meth_8206(var_4._id_114FB);
  return;
  }
  } else {
  var_6 = spawn("script_model", var_0);
  var_6 setmodel("projectile_c12rocket_boxcoll");
  var_6.origin = var_0;
  var_6.angles = var_1;
  var_6.team = self._id_EEDE;
  var_6 _meth_80C7();

  if (isdefined(level._id_D127) && self._id_114FB == level._id_D127 && isdefined(level._id_B8B5) && level._id_B8B5)
  level.player thread _id_11AA8(var_6);

  var_7 = getent("missile_trigger", "targetname");
  var_8 = spawn("script_model", var_0);
  var_6._id_438D = var_8;
  var_6._id_438D clonebrushmodeltoscriptmodel(var_7);
  var_6._id_438D.origin = var_0;
  var_6._id_438D.angles = var_1;
  var_6._id_438D setcandamage(1);
  var_6._id_438D linkto(var_6);
  var_6._id_438D.owner = var_6;
  thread _id_B887(var_6._id_438D);
  thread _id_51BB(var_6._id_438D);
  var_9 = self._id_114FB.origin;

  if (isdefined(self._id_114FB._id_5099) && isdefined(self._id_114FB._id_5099._id_B738) && isdefined(self._id_114FB._id_5099._id_B417))
  var_10 = randomfloatrange(self._id_114FB._id_5099._id_B738, self._id_114FB._id_5099._id_B417);
  else
  var_10 = 0;

  if (isdefined(self._id_114FB)) {
  var_11 = self._id_114FB;
  var_12 = 1;
  } else {
  var_11 = scripts\engine\utility::_id_107E6();
  var_11.origin = var_9;
  var_11._id_5F27 = 1;
  var_12 = 1;
  }

  if (isdefined(self._id_4D1E) && isdefined(self._id_4D1E._id_7542) && isdefined(self._id_4D1E._id_7542._id_BDFF))
  playfx(scripts\engine\utility::_id_7ECB(self._id_4D1E._id_7542._id_BDFF), var_0, anglestoforward(var_1), anglestoup(var_1));
  else
  playfx(scripts\engine\utility::_id_7ECB("capital_turret_muzzle_smt"), var_0, anglestoforward(var_1), anglestoup(var_1));

  self._id_114FB notify("missile_inbound");
  level._id_B898++;
  level._id_B8AD[level._id_B8AD.size] = var_8;

  if (isdefined(self._id_4D1E)) {
  var_6._id_B048 = "jackal_missile_lp_space";
  var_6._id_AA99 = "capitalship_missile_launch";
  var_6._id_69E9 = "capitalship_cannon_impact";
  var_6 _id_0B76::_id_A332(var_11, var_12, self, self._id_4D1E._id_7542._id_B036, undefined, (0, 0, 500), var_10, [self._id_4D1E._id_7542._id_69DA, "capitalship_cannon_impact", 5], undefined, undefined, undefined, 1);
  }
  else
  var_6 _id_0B76::_id_A332(var_11, var_12, self);

  if (isdefined(var_6) && isdefined(self) && isdefined(self._id_4D1E))
  radiusdamage(var_6.origin, self._id_4D1E._id_DCCA, self._id_4D1E._id_B428, self._id_4D1E._id_B73D, self, "MOD_EXPLOSIVE", "viper_missile");
  else if (isdefined(var_6) && !isdefined(self))
  radiusdamage(var_6.origin, 500, 50, 50, var_6, "MOD_EXPLOSIVE", "viper_missile");

  scripts\engine\utility::waitframe();

  if (isdefined(var_8))
  var_8 delete();

  if (isdefined(var_6))
  var_6 delete();

  level._id_B898--;
  level._id_B8AD = scripts\engine\utility::_id_22BC(level._id_B8AD);
  }
}

_id_B887(var_0) {
  var_0.health = 9999;

  if (isdefined(self._id_4D1E) && isdefined(self._id_4D1E._id_7542) && isdefined(self._id_4D1E._id_7542._id_B036))
  var_1 = self._id_4D1E._id_7542._id_B036;
  else
  var_1 = "capital_missile_flare_smt";

  var_2 = "jackal_missile_lp_space";

  if (isdefined(self._id_4D1E) && isdefined(self._id_4D1E._id_7542) && isdefined(self._id_4D1E._id_7542._id_69DA))
  var_3 = [self._id_4D1E._id_7542._id_69DA, "capitalship_missile_impact", 5];
  else
  var_3 = ["capital_missile_imp_airburst_smt", "capitalship_missile_impact", 5];

  var_4 = 0;

  for (;;) {
  var_0 waittill("damage", var_5, var_6, var_7, var_8, var_9);

  if (isdefined(var_6) && isdefined(var_6.team) && isdefined(var_0.owner.team) && var_6.team != var_0.owner.team) {
  if (isplayer(var_6))
  var_4++;

  if (isdefined(var_0)) {
  if (isdefined(var_0.owner)) {
  var_0.owner notify("missile_destroyed");
  stopfxontag(scripts\engine\utility::_id_7ECB(var_1), var_0.owner, "tag_origin");
  var_0.owner stoploopsound(var_2);
  var_10 = scripts\engine\trace::_id_DCED(var_0.owner.origin, var_8, [var_0.owner, var_6], undefined, 1);
  thread _id_0B76::_id_4C7B(var_10, "missile", var_3);
  }

  var_0 delete();
  break;
  }
  }
  }
}

_id_51BB(var_0) {
  if (isdefined(self._id_4D1E) && isdefined(self._id_4D1E._id_7542) && isdefined(self._id_4D1E._id_7542._id_B036))
  var_1 = self._id_4D1E._id_7542._id_B036;
  else
  var_1 = "capital_missile_flare_smt";

  var_2 = "jackal_missile_lp_space";

  if (isdefined(self._id_4D1E) && isdefined(self._id_4D1E._id_7542) && isdefined(self._id_4D1E._id_7542._id_69DA))
  var_3 = [self._id_4D1E._id_7542._id_69DA, "capitalship_missile_impact", 5];
  else
  var_3 = ["capital_missile_imp_airburst_smt", "capitalship_missile_impact", 5];

  self waittill("death", var_4, var_5, var_6);

  if (isdefined(self) && isdefined(var_0)) {
  var_0.owner notify("missile_destroyed");

  if (isdefined(var_0.owner)) {
  stopfxontag(scripts\engine\utility::_id_7ECB(var_1), var_0.owner, "tag_origin");
  var_0.owner stoploopsound(var_2);
  var_0.owner delete();
  }

  var_7 = scripts\engine\trace::_id_DCED(var_0.origin, self.origin, [var_0, var_4], undefined, 1);
  thread _id_0B76::_id_4C7B(var_7, "missile", var_3);
  var_0 delete();
  }
}

_id_396D() {
  self waittill("death");
  level._id_B898--;
}

_id_129DD() {
  self endon("entitydeleted");
  var_0 = self _meth_8138();
  self.health = int(self.health * level._id_A48E._id_39F9);
  self.health = self.health + 30000;

  for (;;) {
  self waittill("damage", var_1, var_2, var_3, var_3, var_4, var_3, var_3, var_3, var_3, var_5);

  if (self.health > 0 && isdefined(var_2._id_EEDE) && var_2._id_EEDE == self._id_EEDE) {
  self.health = self.health + var_1;
  continue;
  }
  else if (self.health > 0 && isdefined(var_2.classname) && var_2.classname == "worldspawn") {
  self.health = self.health + var_1;
  continue;
  }

  if (var_2 == level.player || isdefined(level._id_D127) && var_2 == level._id_D127) {
  if (self._id_C841.classname == "script_vehicle_capitalship_missileboat_ca") {
  if (var_4 != "MOD_PROJECTILE") {
  var_6 = ["spaceship_cannon_projectile", "spaceship_cannon_projectile_weapupgrade", "spaceship_cleaver_projectile", "spaceship_cleaver_projectile_weapupgrade", "spaceship_anvil_projectile", "spaceship_anvil_projectile_weapupgrade"];

  if (var_4 == "MOD_PROJECTILE_SPLASH" && scripts\engine\utility::array_contains(var_6, var_5))
  self.health = self.health + int(var_1 * 0.45);
  }
  }
  }

  if (!isalive(self) || self.health <= 30000) {
  if (isdefined(self)) {
  foreach (var_8 in var_0._id_12A83)
  var_8 = scripts\engine\utility::array_remove(var_8, self);

  thread _id_129DF();
  return;
  }
  }
  }
}

_id_129E0(var_0) {
  wait(randomfloatrange(0.25, 1));

  if (isdefined(self))
  _id_129DF(var_0);
}

_id_129DF(var_0) {
  var_1 = self _meth_8138();
  var_1 notify("turret_destroyed", self.class);
  level notify("turret_destroyed", self.class, var_1);

  if (isdefined(level._id_12A71) && level._id_12A71)
  var_1 _id_12DFA(self);

  if (!isdefined(var_1._id_10381))
  var_1._id_10381 = [];

  var_2 = scripts\engine\utility::_id_107E6();
  thread _id_129C5(var_2);
  var_2 linkto(var_1, self._id_AD42, (0, 0, 0), (0, 0, 0));
  var_2._id_AD42 = self._id_AD42;
  var_1._id_10381 = scripts\engine\utility::_id_2279(var_1._id_10381, var_2);
  self delete();

  if (isdefined(self._id_4D1E)) {
  playfxontag(scripts\engine\utility::_id_7ECB(self._id_4D1E._id_7542._id_00E6), var_2, "tag_origin");

  if (isdefined(self._id_4D1E._id_7542._id_1037F)) {
  playfxontag(scripts\engine\utility::_id_7ECB(self._id_4D1E._id_7542._id_1037F), var_2, "tag_origin");
  var_2._id_10380 = self._id_4D1E._id_7542._id_1037F;
  }
  }

  if (!isdefined(var_0))
  var_0 = 0;

  if (!var_0)
  var_2 playsound("capital_ship_turret_explode");
}

_id_129C5(var_0) {
  if (isdefined(self._id_129D9) && !self._id_129D9)
  return;

  var_1 = [];

  switch (self._id_01F1) {
  case "ship_exterior_ca_cannon_a_rig_periph":
  case "sdf_ship_exterior_un_turret_b_rig_s0p75":
  case "sdf_ship_exterior_un_turret_b_rig":
  case "ship_exterior_un_cannon_b_rig":
  case "ship_exterior_ca_cannon_a_rig":
  var_1 = ["ship_exterior_damage_piece_d_crater_01_dst", "ship_exterior_damage_piece_d_crater_04_dst_s1p2", "ship_exterior_damage_piece_d_crater_16_dst_s0p8", "ship_exterior_damage_piece_d_crater_22_dst"];
  break;
  case "ship_exterior_ca_turret_missile_b_s0p75":
  case "ship_exterior_ca_turret_missile_b":
  case "ship_exterior_missile_pod_a_rig":
  var_1 = ["ship_exterior_ca_turret_missile_b_01_dst", "ship_exterior_ca_turret_missile_b_02_dst", "ship_exterior_ca_turret_missile_b_03_dst", "ship_exterior_ca_turret_missile_b_04_dst"];
  break;
  case "veh_mil_air_ca_missile_boat_turret":
  var_1 = ["ship_exterior_ca_turret_missile_b_01_dst_s0p75", "ship_exterior_ca_turret_missile_b_02_dst_s0p75", "ship_exterior_ca_turret_missile_b_03_dst_s0p75", "ship_exterior_ca_turret_missile_b_04_dst_s0p75"];
  break;
  default:
  var_2 = self._id_01F1 + "_dst";
  break;
  }

  if (var_1.size == 0)
  return;

  var_2 = scripts\engine\utility::_id_DC6B(var_1);
  var_0 setmodel(var_2);
  var_0 show();
  var_0 _meth_8271(randomintrange(0, 360), 0.05);
}

_id_12A06() {
  if (!isdefined(self._id_B8A4))
  return;

  self._id_B8A4 = scripts\engine\utility::_id_22BC(self._id_B8A4);

  foreach (var_1 in self._id_B8A4) {
  thread scripts\engine\utility::_id_CE2B("capitalship_missile_impact");
  playfx(scripts\engine\utility::_id_7ECB("jet_missile_imp_airburst"), self.origin, anglestoforward(self.angles), anglestoup(self.angles));
  self delete();
  }
}

_id_1150D(var_0, var_1, var_2, var_3, var_4, var_5, var_6) {
  if (!isdefined(var_0))
  return;

  if (!isdefined(var_4))
  var_4 = (0, 0, 0);

  if (!isdefined(var_5))
  var_5 = 16;

  if (!isdefined(var_6))
  var_6 = 24;

  _func_1FD(var_0, var_4);
  _func_214(var_0, var_1);
  _func_213(var_0, 1);
  _func_201(var_0);
  _func_200(var_0);
  _func_1FF(var_0, 1);

  if (isdefined(var_2))
  _func_20D(var_0, var_2);

  _func_210(var_0, var_6);
  _func_211(var_0, var_5, 0);
  wait(level._id_12A91 * 0.05);
  _func_202(var_0);
}

_id_11509(var_0) {
  if (!isdefined(var_0))
  return;

  _func_20A(var_0);
}

_id_8935(var_0) {
  var_1 = getent(var_0, "targetname");
  level._id_12A90 = [];

  foreach (var_3 in self._id_12A83) {
  foreach (var_5 in var_3) {
  if (ispointinvolume(var_5.origin, var_1)) {
  var_5 _id_0B91::_id_F40A("enemy", 0, 0);
  level._id_12A90[level._id_12A90.size] = var_5;
  }

  scripts\engine\utility::waitframe();
  }
  }

  _id_13819(level._id_12A90, level._id_12A90.size);
  scripts\engine\utility::_id_6E3E("turrets_destroyed");
}

_id_13819(var_0, var_1, var_2) {
  var_10 = spawnstruct();

  if (isdefined(var_2)) {
  var_10 endon("thread_timed_out");
  var_10 thread _id_0B92::_id_13758(var_2);
  }

  var_10._id_00C1 = var_0.size;

  if (isdefined(var_1) && var_1 < var_10._id_00C1)
  var_10._id_00C1 = var_1;

  scripts\engine\utility::_id_22D2(var_0, _id_0B92::_id_13757, var_10);

  while (var_10._id_00C1 > 0)
  var_10 waittill("waittill_dead guy died");
}

_id_8933(var_0) {
  if (isdefined(level._id_FD6C))
  level._id_FD6C._id_4C11 destroy();
  else
  level._id_FD6C = spawnstruct();

  level._id_FD6C._id_4C11 = level.player _id_0B3F::_id_4999("default", 2);
  level._id_FD6C._id_4C11._id_0177 = 1;
  level._id_FD6C._id_4C11._id_0175 = 1;
  level._id_FD6C._id_4C11._id_002B = "left";
  level._id_FD6C._id_4C11._id_002C = "top";
  level._id_FD6C._id_4C11._id_017D = "left";
  level._id_FD6C._id_4C11._id_0382 = "top";
  level._id_FD6C._id_4C11.alpha = 1;
  level._id_FD6C._id_4C11._id_013A = "default";
  level._id_FD6C._id_4C11._id_00B9 = (1, 1, 1);

  if (isdefined(var_0)) {
  level._id_C3F7 = level._id_B4D0;
  level._id_12A91 = var_0;
  level._id_B4D0 = var_0;
  }

  level._id_FD6C._id_4C11 _meth_834D(_id_0B91::_id_11145(level._id_12A91) + " / " + _id_0B91::_id_11145(level._id_B4D0) + " Turrets");
}

_id_12DFA(var_0) {
  if (level._id_12A91 == 0)
  return;

  if (isdefined(self._id_592A) && int(self._id_592A))
  return;

  level._id_12A91--;
  level._id_FD6C._id_4C11 _meth_834D(_id_0B91::_id_11145(level._id_12A91) + " / " + _id_0B91::_id_11145(level._id_B4D0) + " Turrets");

  if (level._id_12A91 == 0)
  thread _id_409E();
}

_id_409E() {
  scripts\engine\utility::_id_6E3E("turrets_destroyed");
  wait 1;

  if (isdefined(level._id_FD6C) && isdefined(level._id_FD6C._id_4C11)) {
  level._id_FD6C._id_4C11 _meth_834D("Turrets Destroyed");

  for (var_0 = 1; var_0 > 0; var_0 = var_0 - 0.1) {
  level._id_FD6C._id_4C11.alpha = var_0;
  wait 0.5;
  }

  scripts\engine\utility::waitframe();
  level._id_FD6C._id_4C11 destroy();
  }
}

_id_B7EA() {
  if (isdefined(self._id_912F))
  return;

  self._id_912F = [];
  self._id_912F["lock_on"] = _id_0B3F::_id_499B("hud_iw7_warning", 256, 64);
  self._id_912F["lock_on"]._id_002B = "center";
  self._id_912F["lock_on"]._id_002C = "top";
  self._id_912F["lock_on"]._id_017D = "center";
  self._id_912F["lock_on"]._id_0382 = "top";
  self._id_912F["lock_on"].y = 50;
  self._id_912F["lock_on"]._id_0142 = 0;
  self._id_912F["lock_on"].alpha = 0;
  self._id_912F["lock_on"]._id_02A4 = -99;
  var_0 = 22;
  var_1 = 16;
  var_2 = 0.25;
  thread _id_C8E0(self._id_912F["lock_on"], var_0, var_1, var_2);
  self._id_8D63 = [];
  self._id_AEEF = [];
  self._id_AEF0 = [];
  thread _id_88FB();
}

_id_C8E0(var_0, var_1, var_2, var_3, var_4) {
  var_0 notify("visor_parallaxing");
  var_0 endon("visor_parallaxing");
  var_0 endon("element_off");
  var_0 endon("death");

  while (!isdefined(self._id_C09D))
  wait 0.1;

  var_5 = 0;
  var_6 = 0;
  var_7 = var_0.x;
  var_8 = var_0.y;
  var_9 = 0.15;
  var_10 = 0.15;

  for (;;) {
  if (isdefined(var_0.alpha) && var_0.alpha == 0) {
  wait 0.05;
  continue;
  }

  var_11 = var_1 * self._id_C09D[1];
  var_12 = var_2 * self._id_C09D[0];
  var_13 = var_11 - var_5;
  var_14 = var_12 - var_6;

  if (!isdefined(var_4))
  var_15 = 0;
  else
  var_15 = randomfloatrange(0, var_4);

  var_16 = var_5 + var_13 * var_9 + var_15;
  var_17 = var_6 + var_14 * var_10 + var_15;
  var_0 _meth_820C(0.05);
  var_0.x = var_7 - var_16;
  var_0.y = var_8 + var_17;
  var_5 = var_16;
  var_6 = var_17;
  wait 0.05;
  }
}

_id_88FB() {
  thread _id_88FD();
  thread _id_88FF();

  for (;;) {
  self waittill("locking_target", var_0);

  if (self._id_AEF0.size == 0)
  self notify("start_locking");

  thread _id_11AA8(var_0);
  }
}

_id_11AA8(var_0) {
  var_0._id_928E = newclienthudelem(self);
  var_0._id_928E setshader("ac130_hud_friendly_vehicle_diamond_s_w", 32, 32);
  var_0._id_928E._id_00B9 = (1, 0, 0);
  var_0._id_928E.alpha = 1.0;
  var_0._id_928E setwaypoint(0, 0, 1);
  var_0._id_928E _meth_8346(var_0);
  var_0._id_928C = newclienthudelem(self);
  var_0._id_928C setshader("heli_warning_missile_red", 1, 2);
  var_0._id_928C._id_00B9 = (1, 0, 0);
  var_0._id_928C.alpha = 0.5;
  var_0._id_928C setwaypoint(0, 1, 1);
  var_0._id_928C _meth_8346(var_0);
  var_0._id_928C thread _id_9141(0.1, 0.1, 0.9, "death");
  self._id_AEEF = scripts\engine\utility::_id_2279(self._id_AEEF, var_0);
  var_0 scripts\engine\utility::waittill_any("death", "guided_missile_fire", "target_lost");
  self._id_AEEF = scripts\engine\utility::array_remove(self._id_AEEF, var_0);
  var_0._id_928E destroy();
  var_0._id_928C destroy();

  if (self._id_AEEF.size == 0)
  self notify("stop_locking");
}

_id_88FD() {
  for (;;) {
  self waittill("start_locking");
  self._id_912F["lock_on"] setshader("hud_iw7_warning", 256, 64);
  self._id_912F["lock_on"] thread _id_9141(0.5, 0, 0.9, "stop_locking");

  foreach (var_1 in self._id_8D63)
  var_1 thread _id_9142(0.5, (1, 0, 0), (0, 1, 0), "stop_locking");

  thread scripts\engine\utility::_id_CD7F("unguided_missile_warning");
  self waittill("stop_locking");
  self._id_912F["lock_on"] notify("stop_locking");
  self._id_912F["lock_on"].alpha = 0.0;

  foreach (var_1 in self._id_8D63) {
  var_1 notify("stop_locking");
  var_1._id_00B9 = (0, 1, 0);
  }

  thread scripts\engine\utility::_id_11018("unguided_missile_warning");
  }
}

_id_88FF() {
  for (;;) {
  self waittill("start_warning");
  self notify("stop_locking");
  self._id_912F["lock_on"] setshader("hud_iw7_incoming", 256, 64);
  self._id_912F["lock_on"] thread _id_9141(0.1, 0.25, 0.9, "stop_warning");

  foreach (var_1 in self._id_8D63)
  var_1 thread _id_9142(0.1, (0.9, 0, 0), (0.75, 0, 0), "stop_warning");

  thread scripts\engine\utility::_id_CD7F("guided_missile_incoming");
  scripts\engine\utility::_id_13736(2, "stop_warning");
  thread scripts\engine\utility::_id_11018("guided_missile_incoming");
  self._id_912F["lock_on"] notify("stop_warning");

  foreach (var_1 in self._id_8D63) {
  var_1 notify("stop_warning");
  var_1._id_00B9 = (0, 1, 0);
  }

  if (self._id_AEEF.size > 0) {
  self notify("start_locking");
  continue;
  }

  self._id_912F["lock_on"].alpha = 0.0;
  }
}

_id_88FE() {
  self._id_912F["lock_on"] setshader("hud_iw7_warning", 256, 64);
  self._id_912F["lock_on"] thread _id_9141(0.5, 0, 0.9, "stop_locking");
  self._id_912F["lock_on"]._id_AF21 = 1;

  foreach (var_1 in self._id_8D63)
  var_1 thread _id_9142(0.5, (1, 0, 0), (0, 1, 0), "stop_locking");

  thread scripts\engine\utility::_id_CD7F("missile_locking");
  self._id_912F["lock_on"] scripts\engine\utility::_id_13736(2, "stop_locking");
  thread _id_88FC();
  self._id_912F["lock_on"]._id_AF21 = 0;
  self._id_912F["lock_on"] notify("stop_locking");
  self._id_912F["lock_on"].alpha = 0.0;

  foreach (var_1 in self._id_8D63) {
  var_1 notify("stop_locking");
  var_1._id_00B9 = (0, 1, 0);
  }

  thread scripts\engine\utility::_id_11018("missile_locking");
}

_id_9141(var_0, var_1, var_2, var_3) {
  self endon(var_3);
  var_0 = scripts\engine\utility::ter_op(isdefined(var_0), var_0, 0.05);
  var_0 = scripts\engine\utility::ter_op(var_0 > 0.05, var_0, 0.05);

  for (;;) {
  self.alpha = var_2;
  wait(var_0);
  self.alpha = var_1;
  wait(var_0);
  }
}

_id_9142(var_0, var_1, var_2, var_3) {
  self endon(var_3);
  var_0 = scripts\engine\utility::ter_op(isdefined(var_0), var_0, 0.05);
  var_0 = scripts\engine\utility::ter_op(var_0 > 0.05, var_0, 0.05);

  for (;;) {
  self._id_00B9 = var_1;
  wait(var_0);
  self._id_00B9 = var_2;
  wait(var_0);
  }
}

_id_88FC() {
  self._id_912F["lock_on"] setshader("hud_iw7_incoming", 256, 64);
  self._id_912F["lock_on"] thread _id_9141(0.1, 0.25, 0.9, "stop_warning");

  foreach (var_1 in self._id_8D63)
  var_1 thread _id_9142(0.1, (0.9, 0, 0), (0.75, 0, 0), "stop_warning");

  thread scripts\engine\utility::_id_CD7F("missile_locked");
  scripts\engine\utility::_id_13736(6, "missile_barrage_end");
  thread scripts\engine\utility::_id_11018("missile_locked");
  self._id_912F["lock_on"] notify("stop_warning");

  foreach (var_1 in self._id_8D63) {
  var_1 notify("stop_warning");
  var_1._id_00B9 = (0, 1, 0);
  }

  self._id_912F["lock_on"].alpha = 0.0;
}

_id_4098() {
  for (;;) {
  if (scripts\engine\utility::_id_9CEE(level.player._id_912F["lock_on"]._id_AF21))
  level.player._id_912F["lock_on"] notify("stop_locking");

  if (isdefined(level._id_B898) && level._id_B898 == 0) {
  level.player notify("missile_barrage_end");
  break;
  }

  if (isdefined(level._id_FD6C) && !isdefined(level._id_FD6C._id_4C11)) {
  level.player notify("missile_barrage_end");
  break;
  }

  scripts\engine\utility::waitframe();
  }
}

_id_4335(var_0, var_1, var_2, var_3) {
  var_4 = spawnstruct();
  var_4._id_B898 = [];
  var_5 = undefined;

  if (!isdefined(var_2))
  var_2 = 1;

  if (var_1 == level._id_D127)
  thread _id_0B76::_id_D195(1);

  var_6 = 0;

  if (isdefined(var_3)) {
  if (_id_0B91::_id_8C32(self._id_01F1, var_3 + "_1"))
  var_6 = 1;
  }

  if (isdefined(var_1._id_EE01))
  var_5 = var_1 _id_0B91::_id_7A97();

  for (var_7 = 1; var_7 < var_0; var_7++) {
  if (isdefined(var_5))
  var_1 = scripts\engine\utility::_id_DC6B(var_5);

  if (var_6) {
  var_8 = var_3 + "_" + var_7;
  var_9 = _id_433A("cap_mons_projectile", var_1, var_8);
  }
  else
  var_9 = _id_433A("cap_mons_projectile", var_1, var_3);

  if (isdefined(var_9)) {
  if (isdefined(level._id_D127) && var_1 == level._id_D127) {
  if (var_2) {
  var_9 makeentitysentient("axis");
  var_9._id_0184 = 1;
  var_9 _meth_84BE("turret");
  var_9 _meth_8339(0);
  var_4._id_B898[var_4._id_B898.size] = var_9;
  var_9._id_8677 = var_4;
  }

  var_9 thread _id_433B(self);
  }
  else
  var_9 childthread _id_4338();
  }

  wait 0.75;
  }

  _id_13748(var_4);
  _id_0B76::_id_D195(0);
}

_id_13748(var_0) {
  for (;;) {
  var_0._id_B898 = scripts\engine\utility::_id_22BC(var_0._id_B898);

  if (!var_0._id_B898.size)
  return;

  wait 0.5;
  }
}

_id_529F(var_0) {
  if (isdefined(var_0._id_9BBA))
  return;

  var_0._id_9BBA = 1;
  var_0._id_B898 = scripts\engine\utility::_id_22BC(var_0._id_B898);
  var_1 = 0;

  foreach (var_3 in var_0._id_B898) {
  wait 0.15;

  if (isdefined(var_3) && isvalidmissile(var_3))
  var_3 _meth_8099();
  }
}

_id_433B(var_0) {
  thread _id_4337();
  self endon("death");
  self _meth_8206(level._id_D127, scripts\engine\utility::_id_DCC9(200, 400));
  childthread _id_4336(level._id_D127, var_0);
  childthread _id_4338();
  childthread _id_4339();
}

_id_4336(var_0, var_1) {
  var_2 = level._id_D127._id_6E9C._id_12B86;
  var_3 = undefined;

  for (;;) {
  if (distancesquared(self.origin, var_0.origin) < squared(7000) || var_2.size > 0)
  break;

  wait 0.05;
  }

  if (isdefined(var_1) && var_1.class == "cannon_missileboat_small") {
  var_4 = self._id_0040;
  self _meth_8206(var_0);

  for (var_5 = 0; var_5 < 40; var_5++) {
  if (distancesquared(self.origin, var_0.origin) < squared(1000) || var_2.size > 0)
  break;

  wait 0.05;
  }

  if (level._id_D127._id_B855 < 0.06 && var_2.size < 1)
  self._id_0040 = 999999;
  else
  {
  if (var_2.size > 0)
  var_3 = scripts\engine\utility::_id_DC6B(var_2);
  else
  var_3 = var_0;

  self _meth_8207(var_3.origin);

  if (_func_209(self))
  _func_20A(self);
  }

  wait 2.0;
  self._id_0040 = var_4;
  }
  else
  self _meth_8206(var_0, (600, 0, 0));
}

_id_433A(var_0, var_1, var_2) {
  var_2 = scripts\engine\utility::ter_op(isdefined(var_2), var_2, "tag_origin");
  var_3 = self gettagorigin(var_2);

  if (isdefined(self) && self.class == "cannon_missileboat_small")
  var_0 = "cap_missileboat_projectile";

  var_0 = scripts\engine\utility::ter_op(isdefined(var_0), var_0, "cap_turret_proj_weapon");

  if (isdefined(self) && self.class == "cannon_missileboat_small")
  var_4 = magicbullet(var_0, var_3, var_1.origin);
  else
  var_4 = magicbullet(var_0, var_3, var_3 + (0, 0, 500));

  return var_4;
}

_id_4339() {
  wait 1.0;
  level notify("locked_on_player");
  _func_20B(self);
  _func_213(self, 0);
  _func_214(self, "apache_target_lock");
  _func_211(self, 15, 0);
  _func_210(self, 20, 0);
}

_id_4337() {
  self setcandamage(1);
  self.health = 10000;

  for (;;) {
  self waittill("damage", var_0, var_1);
  var_2 = "undefined";

  if (isdefined(var_1) && isdefined(var_1.classname))
  var_2 = var_1.classname;

  if (isdefined(var_1) && var_1.classname == "script_vehicle_jackal_friendly") {
  var_3 = self.origin;
  _id_529F(self._id_8677);
  return;
  }
  }
}

_id_4338() {
  self endon("death");

  for (var_0 = 0; _id_0B76::_id_9C19(self) || var_0 <= 3; var_0++)
  wait 1.5;

  if (isdefined(self._id_8677))
  _id_529F(self._id_8677);

  wait 0.05;
  self delete();
}
