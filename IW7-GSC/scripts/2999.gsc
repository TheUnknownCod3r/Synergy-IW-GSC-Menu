/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2999.gsc
***************************************/

_id_F8F9() {
  self.type = "cap_turret_cannon_large_un";
  self._id_12AE6 = "cap_turret_cannon_large_un_zerog";
  self._id_01F1 = "ship_exterior_un_cannon_b_rig";
  self._id_02DD = ["amb_turret_l", "amb_turret_m", "amb_turret_r"];
  self.team = "allies";
  self._id_B8F9 = "manual";
  self._id_2103 = 150;
  self._id_2107 = 150;
  self._id_2109 = 80;
  self._id_2100 = 10;
  self._id_2106 = [];
  self._id_45E4 = 0.75;
  self._id_45E3 = 0.75;
  self._id_10241 = spawnstruct();
  self._id_10241.health = 5000;
  self._id_10241._id_6D20 = 3;
  self._id_10241._id_13536 = [1, 1.1];
  self._id_10241._id_13535 = [8, 12];
  self._id_10241._id_1DFC = 1.0;
  self._id_10241._id_6CF8 = _id_0BB6::_id_6D4D;
  self._id_10241._id_6D32 = "capitalship_megacannon_fire";
  self._id_DCCA = 25000;
  self._id_10AA2 = 600;
  var_0 = 1;
  var_1 = 1;
  self._id_4D1E = spawnstruct();
  self._id_4D1E._id_DCCA = 30000;
  self._id_4D1E._id_10AA2 = 600;
  self._id_4D1E._id_B428 = 500 * int(var_1);
  self._id_4D1E._id_B73D = 250 * int(var_1);
  self._id_4D1E._id_B465 = 1 * int(var_1);
  self._id_4D1E._id_B753 = 1 * int(var_1);
  self._id_4D1E._id_1060D = 50;
  self._id_4D1E._id_7542 = spawnstruct();
  self._id_4D1E._id_7542._id_BDFF = "capital_un_turret_sml_cheap";
  self._id_4D1E._id_7542._id_1037F = "capital_turret_smolder_lg";
  self._id_4D1E._id_7542._id_4CD9 = "capital_turret_damage1_lg";
  self._id_4D1E._id_7542._id_4CDA = "capital_turret_damage2_lg";
  self._id_4D1E._id_7542._id_00E6 = "capital_turret_death_lg";
  self._id_4D1E._id_7542._id_A865 = "capital_turret_laser_lg";
  self._id_4D1E._id_7542._id_6D02 = "capital_turret_fire_laser_lg";
  self._id_3AF3 = "large_target";
  self._id_11549 = "JACKAL_76MM_DSM";
}

_id_F8F8() {
  self.type = "cap_turret_cannon_large_ca";
  self._id_12AE6 = "cap_turret_cannon_large_ca_zerog";
  self._id_01F1 = "ship_exterior_ca_cannon_a_rig";
  self._id_02DD = ["amb_turret_l", "amb_turret_m", "amb_turret_r"];
  self.team = "axis";
  self._id_B8F9 = "manual";
  self._id_2103 = 150;
  self._id_2107 = 150;
  self._id_2109 = 80;
  self._id_2100 = 15;
  self._id_2106 = [];
  self._id_45E4 = 0.4;
  self._id_45E3 = 0.4;
  self._id_10241 = spawnstruct();
  self._id_10241.health = 2500;
  self._id_10241._id_6D20 = 3;
  self._id_10241._id_13536 = [1, 1.1];
  self._id_10241._id_13535 = [4, 10];
  self._id_10241._id_1DFC = 1.0;
  self._id_10241._id_6CF8 = _id_0BB6::_id_6D4D;
  self._id_10241._id_6D32 = "capitalship_megacannon_fire";
  self._id_DCCA = 25000;
  self._id_10AA2 = 600;
  var_0 = 1;
  var_1 = 1;
  self._id_4D1E = spawnstruct();
  self._id_4D1E._id_DCCA = 30000;
  self._id_4D1E._id_10AA2 = 600;
  self._id_4D1E._id_B428 = 500 * int(var_1);
  self._id_4D1E._id_B73D = 250 * int(var_1);
  self._id_4D1E._id_B465 = 1 * int(var_1);
  self._id_4D1E._id_B753 = 1 * int(var_1);
  self._id_4D1E._id_1060D = 50;
  self._id_4D1E._id_7542 = spawnstruct();
  self._id_4D1E._id_7542._id_BDFF = "capital_turret_muzzle_lg";
  self._id_4D1E._id_7542._id_1037F = "capital_turret_smolder_lg";
  self._id_4D1E._id_7542._id_4CD9 = "capital_turret_damage1_lg";
  self._id_4D1E._id_7542._id_4CDA = "capital_turret_damage2_lg";
  self._id_4D1E._id_7542._id_00E6 = "capital_turret_death_lg";
  self._id_4D1E._id_7542._id_A865 = "capital_turret_laser_lg";
  self._id_4D1E._id_7542._id_6D02 = "capital_turret_fire_laser_lg";
  self._id_3AF3 = "large_target";
  self._id_11549 = "JACKAL_76MM_DSM";
}

_id_F8F7(var_0, var_1, var_2) {
  if (isdefined(var_0) && var_0 == "allies") {
  self._id_01F1 = "ship_exterior_un_cannon_b_rig";
  self.team = "allies";
  } else {
  self._id_01F1 = "ship_exterior_un_cannon_b_rig";
  self.team = "axis";
  }

  if (!isdefined(var_1) || int(var_1) < 0)
  var_1 = 1;

  if (!isdefined(var_2) || int(var_2) < 0)
  var_2 = 1;

  self._id_B8F9 = "manual";
  self.type = "cap_turret_cannon_large_ca";
  self._id_12AE6 = "cap_turret_cannon_large_ca_zerog_noexp";
  self._id_02DD = ["amb_turret_lrg_m", "amb_turret_lrg_m_b"];
  self._id_2103 = 180;
  self._id_2107 = 180;
  self._id_2109 = 90;
  self._id_2100 = 15;
  self._id_2106 = [];
  self._id_4D1E = spawnstruct();
  self._id_4D1E._id_DCCA = 30000;
  self._id_4D1E._id_10AA2 = 600;
  self._id_4D1E._id_B428 = 500 * int(var_2);
  self._id_4D1E._id_B73D = 250 * int(var_2);
  self._id_4D1E._id_B465 = 1 * int(var_2);
  self._id_4D1E._id_B753 = 1 * int(var_2);
  self._id_4D1E._id_1060D = 50;
  self._id_4D1E._id_7542 = spawnstruct();
  self._id_4D1E._id_7542._id_BDFF = "capital_turret_muzzle_lg";
  self._id_4D1E._id_7542._id_11A7B = "capital_turret_trace_lg";
  self._id_4D1E._id_7542._id_1037F = "capital_turret_smolder_lg";
  self._id_4D1E._id_7542._id_4CD9 = "capital_turret_damage1_lg";
  self._id_4D1E._id_7542._id_4CDA = "capital_turret_damage2_lg";
  self._id_4D1E._id_7542._id_00E6 = "capital_turret_death_lg";
  self._id_4D1E._id_7542._id_A865 = "capital_turret_laser_lg";
  self._id_4D1E._id_7542._id_6D02 = "capital_turret_fire_laser_lg";
  self._id_10241 = spawnstruct();
  self._id_10241._id_6D20 = 3;
  self._id_10241._id_13536 = [1, 1.5];
  self._id_10241._id_13535 = [1, 3];
  self._id_10241._id_1DFC = 1.0;
  self._id_10241.health = 2500 * int(var_1);
  self._id_10241._id_AF57 = _id_0BB6::_id_6D4D;

  if (isdefined(var_0) && var_0 == "allies")
  self._id_10241._id_6D32 = "capitalship_megacannon_fire";
  else
  self._id_10241._id_6D32 = "capitalship_megacannon_fire";

  self._id_3AF3 = "large_target";
  self._id_11549 = "JACKAL_76MM_DSM";
}

_id_F8FE(var_0, var_1, var_2, var_3) {
  if (isdefined(var_0) && var_0 == "allies") {
  self._id_01F1 = "ship_exterior_un_turret_b_rig";
  self.team = "allies";
  } else {
  self._id_01F1 = "sdf_ship_exterior_un_turret_b_rig";
  self.team = "axis";
  }

  if (!isdefined(var_1) || int(var_1) < 0)
  var_1 = 1;

  if (!isdefined(var_2) || int(var_2) < 0)
  var_2 = 1;

  self._id_B8F9 = "manual";
  self.type = "cap_turret_small_constant";
  self._id_12AE6 = "cap_turret_small_constant";
  self._id_6D1D = "cap_turret_proj_small_constant";
  self._id_02DD = ["amb_turret_sml_m", "amb_turret_sml_t_l", "amb_turret_sml_t_r", "amb_turret_ts_l", "amb_turret_ts_r"];
  self._id_2103 = 75;
  self._id_2107 = 75;
  self._id_2109 = 90;
  self._id_2100 = 5;
  self._id_2106 = [];
  self._id_45E4 = 1;
  self._id_45E3 = 1;
  self._id_4D1E = spawnstruct();
  self._id_4D1E._id_DCCA = 30000;
  self._id_4D1E._id_10AA2 = 600;
  self._id_4D1E._id_B465 = 1 * int(var_2);
  self._id_4D1E._id_B753 = 1 * int(var_2);
  self._id_4D1E._id_1060D = 1;
  self._id_4D1E._id_7542 = spawnstruct();
  self._id_4D1E._id_7542._id_BDFF = "capital_turret_sml_cheap";
  self._id_4D1E._id_7542._id_11A7B = "capital_turret_sml_cheap";
  self._id_4D1E._id_7542._id_1037F = "capital_turret_smolder_sm";
  self._id_4D1E._id_7542._id_4CD9 = "capital_turret_damage1_sm";
  self._id_4D1E._id_7542._id_4CDA = "capital_turret_damage2_sm";
  self._id_4D1E._id_7542._id_00E6 = "capital_turret_death_sm";
  self._id_934D = "turret";
  self._id_10241 = spawnstruct();
  self._id_10241._id_6D20 = 0.16;
  self._id_10241._id_13536 = [2, 2.5];
  self._id_10241._id_13535 = [2, 3.5];
  self._id_10241._id_1DFC = 1.0;
  self._id_10241.health = 2500 * int(var_1);
  self._id_10241._id_AF57 = _id_0BB6::_id_6D4D;
  self._id_10241._id_6CF8 = _id_0BB6::_id_6D4F;

  if (isdefined(var_0) && var_0 == "allies")
  self._id_10241._id_6CF8 = _id_0BB6::_id_6D4D;

  self._id_10241._id_6D34 = "capship_phalanx_fire_lp";
  self._id_10241._id_6D36 = "capship_phalanx_fire_stop";
  self._id_10241._id_6D35 = "capship_phalanx_fire_lp_plr";
  self._id_10241._id_6D37 = "capship_phalanx_fire_stop_plr";
  self._id_1D52 = 4;
  self._id_3AF3 = "large_target";

  if (isdefined(var_3) && var_3.classname == "script_vehicle_capitalship_missileboat_ca") {
  self._id_01F1 = "sdf_ship_exterior_un_turret_b_rig_s0p75";
  self._id_4D1E._id_7542._id_1037F = "capital_turret_smolder_sm_mb";
  self._id_4D1E._id_7542._id_00E6 = "capital_turret_death_sm_mb";
  self._id_3AF3 = "small_target";
  self._id_10241.health = 1500 * int(var_1);
  }

  self._id_11549 = "JACKAL_30MM_GRUNION";
}

_id_F8FF(var_0, var_1, var_2, var_3) {
  _id_F8FE(var_0, var_1, var_2, var_3);
  self._id_4D1E._id_7542._id_BDFF = "capital_turret_sml_mons_cheap";
  self._id_10241._id_6CF8 = _id_0BB6::_id_6D4D;
  self._id_02DD = ["amb_turret_sml_l", "amb_turret_sml_r", "amb_turret_l", "amb_turret_r"];
}

_id_F8F6(var_0, var_1, var_2) {
  if (isdefined(var_0) && var_0 == "allies") {
  self._id_01F1 = "ship_exterior_ca_cannon_a_rig";
  self.team = "allies";
  } else {
  self._id_01F1 = "ship_exterior_ca_cannon_a_rig";
  self.team = "axis";
  }

  if (!isdefined(var_1) || int(var_1) < 0)
  var_1 = 1;

  if (!isdefined(var_2) || int(var_2) < 0)
  var_2 = 1;

  self._id_B8F9 = "manual";
  self.type = "cap_turret_med_flak";
  self._id_12AE6 = "cap_turret_med_flak";
  self._id_6D1D = "cap_turret_proj_med_flak";
  self._id_02DD = ["amb_turret_l", "amb_turret_r"];
  self._id_2103 = 90;
  self._id_2107 = 90;
  self._id_2109 = 75;
  self._id_2100 = 2;
  self._id_2106 = [];
  self._id_45E4 = 1;
  self._id_45E3 = 1;
  self._id_4D1E = spawnstruct();
  self._id_4D1E._id_DCCA = 30000;
  self._id_4D1E._id_10AA2 = 600;
  self._id_4D1E._id_DCCC = 15000;
  self._id_4D1E._id_DCCB = 2000;
  self._id_4D1E._id_B428 = 0 * int(var_2);
  self._id_4D1E._id_B73D = 0 * int(var_2);
  self._id_4D1E._id_B465 = self._id_4D1E._id_B428;
  self._id_4D1E._id_B753 = self._id_4D1E._id_B73D;
  self._id_4D1E._id_1060D = 500;
  self._id_4D1E._id_32B9 = 500;
  self._id_4D1E._id_32B2 = self._id_4D1E._id_B428;
  self._id_4D1E._id_7542 = spawnstruct();
  self._id_4D1E._id_7542._id_BDFF = "capital_turret_flak_cheap";
  self._id_4D1E._id_7542._id_11A7B = "capital_turret_flak_cheap";
  self._id_4D1E._id_7542._id_1037F = "capital_turret_smolder_md";
  self._id_4D1E._id_7542._id_4CD9 = "capital_turret_damage1_md";
  self._id_4D1E._id_7542._id_4CDA = "capital_turret_damage2_md";
  self._id_4D1E._id_7542._id_00E6 = "capital_turret_death_md";
  self._id_4D1E._id_7542._id_69DA = "capital_turret_explosion_md";
  self._id_934D = "turret";
  self._id_10241 = spawnstruct();
  self._id_10241._id_6D20 = 3;
  self._id_10241._id_13536 = [1, 1];
  self._id_10241._id_13535 = [0.5, 2];
  self._id_10241._id_1DFC = 1.0;
  self._id_10241.health = 2500 * int(var_1);
  self._id_10241._id_AF57 = _id_0BB6::_id_6D4D;
  self._id_10241._id_6CF8 = _id_0BB6::_id_6D4C;
  self._id_10241._id_6D32 = "weap_capital_ship_flak_fire";
  self._id_10241._id_6D33 = "capitalship_cannon_fire_plr";
  self._id_3AF3 = "large_target";
  self._id_11549 = "JACKAL_R28_TASKMASTER";
}

_id_F8FD(var_0, var_1, var_2) {
  self._id_01F1 = "ship_exterior_un_turret_a_rig";
  self.team = var_0;

  if (!isdefined(var_1) || int(var_1) < 0)
  var_1 = 1;

  if (!isdefined(var_2) || int(var_2) < 0)
  var_2 = 1;

  self._id_B8F9 = "manual";
  self.type = "cap_turret_phalanx";
  self._id_12AE6 = "cap_turret_phalanx";
  self._id_02DD = ["amb_turret_sml_m"];
  self._id_2103 = 180;
  self._id_2107 = 180;
  self._id_2109 = 80;
  self._id_2100 = 0;
  self._id_2106 = [];
  self._id_45E4 = 1;
  self._id_45E3 = 1;
  self._id_4D1E = spawnstruct();
  self._id_4D1E._id_DCCA = 30000;
  self._id_4D1E._id_10AA2 = 600;
  self._id_4D1E._id_DCCC = 15000;
  self._id_4D1E._id_DCCB = 2000;
  self._id_4D1E._id_B465 = self._id_4D1E._id_B428;
  self._id_4D1E._id_B753 = self._id_4D1E._id_B73D;
  self._id_4D1E._id_1060D = 500;
  self._id_4D1E._id_32B9 = 500;
  self._id_4D1E._id_32B2 = self._id_4D1E._id_B428;
  self._id_4D1E._id_7542 = spawnstruct();
  self._id_4D1E._id_7542._id_BDFF = "capital_turret_muzzle_md";
  self._id_4D1E._id_7542._id_11A7B = "capital_turret_trace_md";
  self._id_4D1E._id_7542._id_1037F = "capital_turret_smolder_md";
  self._id_4D1E._id_7542._id_4CD9 = "capital_turret_damage1_md";
  self._id_4D1E._id_7542._id_4CDA = "capital_turret_damage2_md";
  self._id_4D1E._id_7542._id_00E6 = "capital_turret_death_md";
  self._id_4D1E._id_7542._id_69DA = "capital_turret_explosion_md";
  self._id_934D = "turret";
  self._id_10241 = spawnstruct();
  self._id_10241._id_6D20 = 1;
  self._id_10241._id_13536 = [1, 1];
  self._id_10241._id_13535 = [0.05, 0.5];
  self._id_10241._id_1DFC = 1.0;
  self._id_10241.health = 400 * int(var_1);
  self._id_10241._id_10943 = ::_id_CA98;
  self._id_10241._id_102A6 = 1;
  self._id_10241._id_AF57 = ::_id_5F1E;
  self._id_10241._id_6CF8 = ::_id_5F1E;
  self._id_10241._id_6D32 = "capship_phalanx_fire_lp";
  self._id_10241._id_6D36 = "capship_phalanx_fire_stop";
  self._id_3AF3 = "small_target";
  self._id_11549 = "JACKAL_20MM_OST";
}

_id_F8FA(var_0, var_1, var_2) {
  if (isdefined(var_0) && var_0 == "allies") {
  self._id_01F1 = "cap_turret_missile_un";
  self.team = "allies";
  } else {
  self._id_01F1 = "ship_exterior_ca_turret_missile_b";
  self.team = "axis";
  }

  if (!isdefined(var_1) || int(var_1) < 0)
  var_1 = 1;

  if (!isdefined(var_2) || int(var_2) < 0)
  var_2 = 1;

  self._id_B8F9 = "manual";
  self.type = "cap_turret_missile_barrage";
  self._id_12AE6 = "cap_turret_missile_barrage";
  self._id_6D1D = "cap_turret_proj_missile_barrage";
  self._id_02DD = ["amb_missile_l", "amb_missile_r"];
  self._id_2103 = 0;
  self._id_2107 = 0;
  self._id_2109 = 0;
  self._id_2100 = 0;
  self._id_2106 = [];
  self._id_4D1E = spawnstruct();
  self._id_4D1E._id_DCCA = 30000;
  self._id_4D1E._id_DCCC = 600;
  self._id_4D1E._id_B428 = 100 * int(var_2);
  self._id_4D1E._id_B73D = 50 * int(var_2);
  self._id_4D1E._id_B465 = 10 * int(var_2);
  self._id_4D1E._id_B753 = 5 * int(var_2);
  self._id_4D1E._id_1060D = 500;
  self._id_4D1E._id_7542 = spawnstruct();
  self._id_4D1E._id_7542._id_BDFF = "capital_turret_muzzle_smt";
  self._id_4D1E._id_7542._id_BE00 = 256;
  self._id_4D1E._id_7542._id_1037F = "capital_turret_smolder_smt";
  self._id_4D1E._id_7542._id_4CD9 = "capital_turret_damage1_smt";
  self._id_4D1E._id_7542._id_4CDA = "capital_turret_damage2_smt";
  self._id_4D1E._id_7542._id_00E6 = "capital_turret_death_smt";
  self._id_4D1E._id_7542._id_B036 = "capital_missile_flare_smt";
  self._id_4D1E._id_7542._id_69DA = "capital_missile_imp_airburst_smt";
  self._id_934D = "missile";
  self._id_10241 = spawnstruct();
  self._id_10241._id_6D20 = 10;
  self._id_10241._id_6D39 = 0.05;
  self._id_10241._id_13536 = [1, 5];
  self._id_10241._id_13535 = [1, 5];
  self._id_10241._id_1DFC = 1.0;
  self._id_10241._id_AC75 = 6;
  self._id_10241.health = 1000 * int(var_1);
  self._id_10241._id_AF57 = _id_0BB6::_id_6D4D;
  self._id_3AF3 = "small_target";
  self._id_11549 = "JACKAL_MMT38_WHIPLASH";
}

_id_F8FC(var_0, var_1, var_2) {
  if (isdefined(var_0) && var_0 == "allies") {
  self._id_01F1 = "cap_turret_missile_un";
  self.team = "allies";
  } else {
  self._id_01F1 = "ship_exterior_ca_turret_missile_b";
  self.team = "axis";
  }

  if (!isdefined(var_1) || int(var_1) < 0)
  var_1 = 1;

  if (!isdefined(var_2) || int(var_2) < 0)
  var_2 = 1;

  self._id_B8F9 = "manual";
  self.type = "cap_turret_missile_barrage";
  self._id_12AE6 = "cap_turret_missile_barrage";
  self._id_02DD = ["amb_missile_l", "amb_missile_r"];
  self._id_2103 = 0;
  self._id_2107 = 0;
  self._id_2109 = 0;
  self._id_2100 = 0;
  self._id_2106 = [];
  self._id_4D1E = spawnstruct();
  self._id_4D1E._id_DCCA = 100000;
  self._id_4D1E._id_DCCC = 600;
  self._id_4D1E._id_B428 = 100 * int(var_2);
  self._id_4D1E._id_B73D = 50 * int(var_2);
  self._id_4D1E._id_B465 = 10 * int(var_2);
  self._id_4D1E._id_B753 = 5 * int(var_2);
  self._id_4D1E._id_1060D = 500;
  self._id_4D1E._id_7542 = spawnstruct();
  self._id_4D1E._id_7542._id_BDFF = "capital_turret_muzzle_smt";
  self._id_4D1E._id_7542._id_BE00 = 256;
  self._id_4D1E._id_7542._id_1037F = "capital_turret_smolder_smt";
  self._id_4D1E._id_7542._id_4CD9 = "capital_turret_damage1_smt";
  self._id_4D1E._id_7542._id_4CDA = "capital_turret_damage2_smt";
  self._id_4D1E._id_7542._id_00E6 = "capital_turret_death_smt";
  self._id_4D1E._id_7542._id_B036 = "capital_missile_flare_smt";
  self._id_4D1E._id_7542._id_69DA = "capital_missile_imp_airburst_smt";
  self._id_934D = "missile";
  self._id_10241 = spawnstruct();
  self._id_10241._id_6D20 = 5;
  self._id_10241._id_6D39 = 0.3;
  self._id_10241._id_13536 = [1, 5];
  self._id_10241._id_13535 = [1, 5];
  self._id_10241._id_1DFC = 1.0;
  self._id_10241._id_AC75 = 70;
  self._id_10241.health = 2500 * int(var_1);
  self._id_10241._id_AF57 = _id_0BB6::_id_6D4D;
  self._id_3AF3 = "small_target";
  self._id_11549 = "JACKAL_MMT38_WHIPLASH";
}

_id_F9D6(var_0, var_1, var_2) {
  self._id_01F1 = "ship_exterior_missile_pod_a_rig";
  self.team = "allies";
  self._id_B8F9 = "manual";
  self.type = "cap_turret_missile_barrage";
  self._id_12AE6 = "cap_turret_missile_barrage";
  self._id_6D1D = "cap_turret_proj_missile_barrage";
  self._id_02DD = ["amb_missile_r", "amb_missile_l"];
  self._id_2103 = 180;
  self._id_2107 = 180;
  self._id_2109 = 88;
  self._id_2100 = 10;
  self._id_2106 = [];
  self._id_4D1E = spawnstruct();
  self._id_4D1E._id_DCCA = 30000;
  self._id_4D1E._id_DCCC = 600;
  self._id_4D1E._id_B428 = 100;
  self._id_4D1E._id_B73D = 50;
  self._id_4D1E._id_B465 = 10;
  self._id_4D1E._id_B753 = 5;
  self._id_4D1E._id_1060D = 500;
  self._id_4D1E._id_7542 = spawnstruct();
  self._id_4D1E._id_7542._id_BDFF = "capital_turret_muzzle_smt";
  self._id_4D1E._id_7542._id_BE00 = 256;
  self._id_4D1E._id_7542._id_1037F = "capital_turret_smolder_smt";
  self._id_4D1E._id_7542._id_4CD9 = "capital_turret_damage1_smt";
  self._id_4D1E._id_7542._id_4CDA = "capital_turret_damage2_smt";
  self._id_4D1E._id_7542._id_00E6 = "capital_turret_death_smt";
  self._id_4D1E._id_7542._id_B036 = "capital_missile_flare_smt";
  self._id_4D1E._id_7542._id_69DA = "capital_missile_imp_airburst_smt";
  self._id_934D = "missile";
  self._id_10241 = spawnstruct();
  self._id_10241._id_6D20 = 10;
  self._id_10241._id_6D39 = 0.05;
  self._id_10241._id_13536 = [1, 5];
  self._id_10241._id_13535 = [1, 5];
  self._id_10241._id_1DFC = 1.0;
  self._id_10241._id_AC75 = 6;
  self._id_10241.health = 1000;
  self._id_10241._id_AF57 = _id_0BB6::_id_6D0E;
  self._id_3AF3 = "small_target";
  self._id_11549 = "JACKAL_MMT38_WHIPLASH";
}

_id_F8FB(var_0, var_1, var_2, var_3) {
  self._id_8B3B = 1;
  self._id_02DD = ["amb_missile_l", "amb_missile_r"];
  self.team = "allies";
  self._id_B8F9 = "manual";
  self.type = "cap_hardpoint_missile_barrage";
  self._id_10241 = spawnstruct();
  self._id_10241._id_6D20 = 10;
  self._id_10241._id_6D39 = 0.05;
  self._id_10241._id_13536 = [1, 5];
  self._id_10241._id_13535 = [1, 5];
  self._id_10241._id_1DFC = 1.0;
  self._id_10241._id_AC75 = 6;
  self._id_10241.health = 1300;
  self._id_10241._id_AF57 = _id_0BB6::_id_6D4D;
  self._id_10241._id_B46E = 9;
  self._id_10241._id_EF5F = "capitalship_missile_fire";
  self._id_10241._id_EF60 = "capitalship_missile_fire_for_plr";
  self._id_4D1E = spawnstruct();
  self._id_4D1E._id_7542 = spawnstruct();
  self._id_4D1E._id_7542._id_1037F = "capital_turret_smolder_smt";
  self._id_4D1E._id_7542._id_00E6 = "capital_turret_death_smt";

  if (isdefined(var_0) && var_0 == "allies") {
  self._id_01F1 = "ship_exterior_ca_turret_missile_b";
  self.team = "allies";
  self._id_10241._id_6CF8 = _id_0BB6::_id_6D0C;
  } else {
  self._id_01F1 = "ship_exterior_ca_turret_missile_b";
  self.team = "axis";
  self._id_10241._id_6CF8 = _id_0BB6::_id_6D0C;
  }

  self._id_3AF3 = "small_target";

  if (isdefined(var_3) && var_3.classname == "script_vehicle_capitalship_missileboat_ca") {
  self._id_01F1 = "ship_exterior_ca_turret_missile_b_s0p75";
  self._id_10241.health = 1800;
  self._id_10241._id_EF5F = "missileboat_missile_launch";
  self._id_10241._id_EF60 = "missileboat_missile_launch_for_plr";
  self._id_4D1E._id_7542._id_1037F = "capital_turret_smolder_smt_mb";
  self._id_4D1E._id_7542._id_00E6 = "capital_turret_death_smt_mb";
  }

  self._id_11549 = "JACKAL_MMT38_WHIPLASH";
}

_id_F9DA(var_0) {
  self.type = "cap_missile_tube_un";
  self._id_8B3B = 1;
  self._id_02DD = ["amb_missile_l", "amb_missile_r"];
  self.team = "allies";
  self._id_B8F9 = "manual";
  self._id_10241 = spawnstruct();
  self._id_10241._id_6D20 = 0.3;
  self._id_10241._id_13535 = [18, 32];
  self._id_10241._id_6CF8 = _id_0BB6::_id_6D0E;
  self._id_10241._id_B46E = 6;
}

_id_F9D8(var_0) {
  self.type = "cap_missile_tube_ca";
  self._id_8B3B = 1;
  self._id_02DD = ["amb_missile_l", "amb_missile_r"];
  self.team = "axis";
  self._id_B8F9 = "manual";
  self._id_10241 = spawnstruct();
  self._id_10241._id_6D20 = 0.1;
  self._id_10241._id_13535 = [24, 36];
  self._id_10241._id_6CF8 = _id_0BB6::_id_6D0C;
  self._id_10241._id_B46E = 9;
}

_id_F9D9(var_0) {}

_id_F9DB(var_0, var_1) {
  self._id_01F1 = "veh_mil_air_ca_missile_boat_turret";
  self.team = "axis";

  if (!isdefined(var_0) || int(var_0) < 0)
  var_0 = 1;

  if (!isdefined(var_1) || int(var_1) < 0)
  var_1 = 1;

  self._id_B8F9 = "manual";
  self.type = "cap_turret_small_constant";
  self._id_12AE6 = "cap_turret_small_constant";
  self._id_02DD = ["amb_turret_sml_m", "amb_turret_sml_t_l", "amb_turret_sml_t_r"];
  self._id_2103 = 180;
  self._id_2107 = 180;
  self._id_2109 = 90;
  self._id_2100 = 5;
  self._id_2106 = [];
  self._id_45E4 = 1;
  self._id_4D1E = spawnstruct();
  self._id_4D1E._id_DCCA = 15000;
  self._id_4D1E._id_10AA2 = 600;
  self._id_4D1E._id_B428 = 10 * int(var_1);
  self._id_4D1E._id_B73D = 5 * int(var_1);
  self._id_4D1E._id_B465 = 1 * int(var_1);
  self._id_4D1E._id_B753 = 1 * int(var_1);
  self._id_4D1E._id_1060D = 1;
  self._id_4D1E._id_7542 = spawnstruct();
  self._id_4D1E._id_7542._id_BDFF = "capital_turret_muzzle_sm";
  self._id_4D1E._id_7542._id_BE00 = 60;
  self._id_4D1E._id_7542._id_11A7B = "capital_turret_trace_sm";
  self._id_4D1E._id_7542._id_1037F = "capital_turret_smolder_sm";
  self._id_4D1E._id_7542._id_4CD9 = "capital_turret_damage1_sm";
  self._id_4D1E._id_7542._id_4CDA = "capital_turret_damage2_sm";
  self._id_4D1E._id_7542._id_00E6 = "capital_turret_death_sm";
  self._id_10241 = spawnstruct();
  self._id_10241._id_6D20 = 0.1;
  self._id_10241._id_13536 = [0.5, 1.5];
  self._id_10241._id_13535 = [0.25, 0.5];
  self._id_10241._id_1DFC = 1.0;
  self._id_10241.health = 4000 * int(var_0);
  self._id_10241._id_AF57 = _id_0BB6::_id_6D4D;
  self._id_10241._id_6CF8 = _id_0BB6::_id_6D4F;
  self._id_1D52 = 4;
  self._id_3AF3 = "none";
  self._id_11549 = "JACKAL_MMT38_WHIPLASH";
}

#using_animtree("vehicles");

_id_B878(var_0, var_1, var_2) {
  var_0._id_EEDE = "axis";
  var_0.health = 2000;
  var_0 _meth_83D0(#animtree);
  var_0._id_BEED = scripts\engine\utility::_id_107E6();
  var_0._id_BEED linkto(var_0, "tag_origin", (500, 0, 0), (0, 0, 0));
  var_0._id_5978 = spawn("script_model", var_1.origin);
  var_0._id_5978 setmodel("veh_mil_air_ca_missile_boat_turret_door");
  var_0._id_5978 linkto(var_1, var_2, (0, 0, 0), (0, 0, 0));
  var_0._id_5978._id_1BE4 = 1;
  var_0._id_5978._id_10E19 = "open";
  var_0._id_5978 _meth_83D0(#animtree);
  var_3 = 1;
  var_0._id_4D1E = spawnstruct();
  var_0._id_4D1E._id_DCCA = 30000;
  var_0._id_4D1E._id_10AA2 = 1;
  var_0._id_4D1E._id_B832 = 50;
  var_0._id_4D1E._id_B428 = 10 * int(var_3);
  var_0._id_4D1E._id_B73D = 5 * int(var_3);
  var_0._id_4D1E._id_B465 = 1 * int(var_3);
  var_0._id_4D1E._id_B753 = 1 * int(var_3);
  var_0._id_4D1E._id_1060D = 1;
  var_0._id_4D1E._id_7542 = spawnstruct();
  var_0._id_4D1E._id_7542._id_BDFF = "capital_turret_muzzle_sm";
  var_0._id_4D1E._id_7542._id_BE00 = 60;
  var_0._id_4D1E._id_7542._id_11A7B = "capital_turret_trace_sm";
  var_0._id_4D1E._id_7542._id_1037F = "capital_turret_smoke_trail";
  var_0._id_4D1E._id_7542._id_4CD9 = "capital_turret_damage1_sm";
  var_0._id_4D1E._id_7542._id_4CDA = "capital_turret_damage2_sm";
  var_0._id_4D1E._id_7542._id_00E6 = "capital_turret_death_md";
  var_0._id_4D1E._id_7542._id_B036 = "capital_missile_flare_smt";
  var_0._id_4D1E._id_7542._id_69DA = "capital_missile_imp_airburst_smt";
  var_0._id_934D = "turret";
  var_0._id_2103 = 120;
  var_0._id_2107 = 120;
  var_0._id_2109 = 20;
  var_0._id_2100 = 20;
  var_0._id_2106 = [];
  var_0 _meth_82FB(120);
  var_0 _meth_8330(120);
  var_0 _meth_8353(20);
  var_0 _meth_82B6(20);
  var_0 _meth_82C9(0.5, "yaw");
  var_0 _meth_82C9(0.5, "pitch");
  var_4 = "JACKAL_MMT38_WHIPLASH";
  var_5 = "small_target";

  if (_id_0B91::_id_B324()) {
  var_0 [[level._id_A056._id_11543]]("missileboat_turret", var_4, var_5, "enemy_jackal");
  var_0 [[level._id_A056._id_F389]]("tag_lockon", [var_0._id_5978]);
  }
}

_id_5F1E(var_0, var_1, var_2, var_3, var_4) {}

_id_CA98(var_0) {
  if (isdefined(self._id_CA99))
  return;

  self._id_CA99 = 1;
  playfxontag(level._effect["phalanx_burst_fire"], self, var_0);

  if (!isdefined(self._id_B04A) && isdefined(self._id_10241._id_6D32)) {
  self._id_B04A = spawn("script_origin", self gettagorigin("TAG_FLASH"));
  self._id_B04A.angles = self gettagangles("TAG_FLASH");
  self._id_B04A linkto(self);
  self._id_B04A playloopsound(self._id_10241._id_6D32);
  }
}
