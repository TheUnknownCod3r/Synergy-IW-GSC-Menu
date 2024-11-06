/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3397.gsc
***************************************/

init() {
  _id_0A4B::_id_10C5A("mp/zombieMatchdata.ddl", "mp/zombieclientmatchdata.ddl", "cp/zombies/zombie_analytics.csv");
  level._id_1192B = 0;
  level._id_1192C = 0;
  level._id_1192D = 0;
  level._id_1192E = 0;
  level._id_10490 = " ";
  level._id_E4BB = [];
  level._id_E4BC = [];
  level._id_76CB = [];
  level._id_76CC = [];
  level._id_76CD = 0;
  level._id_E4BD = 0;
  level._id_AA0B = 0;
  level._id_3C2B = [];
  level._id_28BF = 0;
  level._id_13BD1 = 0;
  level._id_13BD2 = 0;
  level._id_13BCD = 0;
  level._id_13BCE = 0;
  level._id_13BCF = 0;
  level._id_13BD0 = 0;
  level._id_8288 = 0;
  level._id_8286 = 0;
  level._id_8287 = 0;
  level._id_5093 = 0;
  level._id_12631 = 0;
  level._id_1E5F = ::_id_13F5C;
  level._id_311A = 0;
  level._id_D71D = ["front_gate", "hidden_room", "moon", "moon_outside_begin", "moon_rocket_space", "moon_second", "moon_bridge", "arcade", "arcade_back", "europa_tunnel", "room_europa", "europa_2", "roller_coast_back", "swamp_stage", "mars_3", "mars"];
  level._id_D745 = 0;
  level._id_D746 = 0;
  level._id_2137 = 0;
  level._id_E4A4 = ::_id_13F51;
  level._id_C8A3 = 0;
  level._id_AE60 = ["iw7_nrg", "iw7_emc", "iw7_revolver", "iw7_g18", "iw7_g18c", "iw7_erad", "iw7_crb", "iw7_smgmags", "iw7_ripper", "iw7_fhr", "iw7_ump45", "iw7_ump45c", "iw7_knife", "iw7_fists", "iw7_reaperblade", "iw7_ar57", "iw7_ake", "iw7_m4", "iw7_fmg", "iw7_sdfar", "iw7_arclassic", "iw7_kbs", "iw7_m8", "iw7_cheytac", "iw7_cheytacc", "iw7_m1", "iw7_m1c", "iw7_devastator", "iw7_sonic", "iw7_sdfshotty", "iw7_spas", "iw7_spasc", "iw7_mauler", "iw7_sdflmg", "iw7_lmg03", "iw7_lockon", "iw7_glprox", "iw7_chargeshot", "iw7_rvn", "iw7_udm45", "iw7_vr", "iw7_crdb", "iw7_mp28", "iw7_minilmg", "iw7_mod2187", "iw7_ba50cal", "iw7_gauss", "iw7_longshot", "iw7_unsalmg", "iw7_mag", "iw7_tacburst"];
  level._id_2115 = ["arcade_spider", "arcade_barnstorming", "arcade_cosmic", "arcade_demon", "arcade_pitfall", "arcade_riverraid", "arcade_robottank", "arcade_starmaster", "bowling_for_planets", "bowling_for_planets_afterlife", "coaster", "laughingclown", "laughingclown_afterlife", "basketball_game", "basketball_game_afterlife", "clown_tooth_game", "clown_tooth_game_afterlife", "game_race", "shooting_gallery", "shooting_gallery_afterlife"];
}

_id_13F51(var_0) {
  _id_0A4B::_id_AF6A("revived_another_player", 1, [var_0._id_41F0], [var_0._id_41F0], [var_0._id_41F0]);
}

_id_97A4(var_0) {
  var_0 endon("disconnect");
  var_0._id_1567 = _id_0D2A::_id_DEAA;
  _id_0D2A::_id_96D8(var_0);

  while (!isdefined(var_0.pers))
  wait 1;

  var_0._id_1193D = [];
  var_0._id_A6C6 = [];
  var_0._id_A039 = " ";
  var_0._id_118F0 = [];

  if (!isdefined(level._id_311A))
  level._id_311A = 0;

  if (level._id_13BD3 == 0) {
  var_0.pers["timesPerWave"] = spawnstruct();
  var_0.pers["timesPerWave"]._id_11930 = [];
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1] = [];
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["bowling_for_planets"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["bowling_for_planets_afterlife"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["coaster"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["laughingclown"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["laughingclown_afterlife"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["basketball_game"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["basketball_game_afterlife"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["clown_tooth_game"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["clown_tooth_game_afterlife"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["game_race"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["shooting_gallery"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["shooting_gallery_afterlife"] = 0;
  }

  if (!isdefined(var_0.pers["timesPerWave"])) {
  var_0.pers["timesPerWave"] = spawnstruct();
  var_0.pers["timesPerWave"]._id_11930 = [];
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3] = [];
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3]["bowling_for_planets"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3]["bowling_for_planets_afterlife"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3]["coaster"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3]["laughingclown"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3]["laughingclown_afterlife"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3]["basketball_game"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3]["basketball_game_afterlife"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3]["clown_tooth_game"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3]["clown_tooth_game_afterlife"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3]["game_race"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3]["shooting_gallery"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3]["shooting_gallery_afterlife"] = 0;
  }
  else if (!isdefined(var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1])) {
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["bowling_for_planets"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["bowling_for_planets_afterlife"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["coaster"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["laughingclown"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["laughingclown_afterlife"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["basketball_game"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["basketball_game_afterlife"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["clown_tooth_game"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["clown_tooth_game_afterlife"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["game_race"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["shooting_gallery"] = 0;
  var_0.pers["timesPerWave"]._id_11930[level._id_13BD3 + 1]["shooting_gallery_afterlife"] = 0;
  }

  var_0._id_A03C = [];
  var_0._id_A034 = [];
  var_0._id_A032 = " ";
  var_0._id_A037 = " ";
  var_0._id_A035 = " ";
  var_0._id_A03C[var_0._id_A035] = 0;
  var_0._id_A034[var_0._id_A035] = 0;

  if (!isdefined(var_0._id_11A3D))
  var_0._id_11A3D = 0;

  if (!isdefined(var_0.score_earned))
  var_0.score_earned = 0;

  var_0._id_5AFC = [];
  var_0._id_A682 = [];
  var_0._id_13BE3 = [];
  var_0._id_FF09 = [];
  var_0._id_FF0A = [];
  var_0.headshots = [];
  var_0._id_11A25 = 0;
  var_0._id_190B = [];
  var_0._id_13C2F = " ";
  var_0.accuracy_shots_fired = 0;
  var_0._id_154B = 0;
  var_0.explosive_kills = 0;
  var_0.total_trap_kills = 0;

  if (!isdefined(var_0._id_6977))
  var_0._id_6977 = 0;

  var_0._id_B625 = 0;
  var_0.kung_fu_vo = 0;

  if (!isdefined(var_0._id_126B0))
  var_0._id_126B0 = [];

  var_1 = ["trap_gator", "trap_dragon", "trap_gravitron", "trap_danceparty", "trap_rocket", "trap_spin"];

  foreach (var_3 in var_1) {
  if (!isdefined(var_0._id_126B0[var_3]))
  var_0._id_126B0[var_3] = 0;
  }

  var_5 = var_0._id_8235;

  if (isdefined(var_5)) {
  foreach (var_7 in var_5) {
  var_0._id_13C2F = _id_0A77::_id_7DF7(var_7);

  if (!isdefined(var_0._id_190B[var_0._id_13C2F]))
  var_0._id_190B[var_0._id_13C2F] = 0;
  }
  }
}

_id_AF67(var_0, var_1) {
  if (isdefined(var_0.score_earned))
  var_0.score_earned = var_0.score_earned + var_1;

  _id_0A4B::_id_AF6A("currency_earned", var_1, [var_1], [var_0._id_41F0], [var_0._id_41F0]);
}

_id_AF92(var_0, var_1, var_2, var_3, var_4, var_5) {
  if (isdefined(var_3) && var_3 != "none")
  _id_0A4B::_id_AF6A("zombie_death", var_0, [var_1, var_2._id_41F0, var_3, var_4, "" + var_5], [var_2._id_41F0, var_3], [var_2._id_41F0]);
}

_id_AF90(var_0, var_1, var_2, var_3) {
  _id_0A4B::_id_AF6A("wave_complete", 1, [level.script, var_0, var_1, var_2, var_3], [level.script]);

  foreach (var_5 in level.players)
  var_5._id_AF9B = "wave_complete";
}

_id_AF68(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7) {
  if (isdefined(var_4))
  var_8 = var_4.agent_type;
  else
  var_8 = "";

  _id_0A4B::_id_AF6A("dropped_to_last_stand", var_0, [var_1._id_41F0, var_3, var_8, "" + var_5, var_6, var_7], [var_1._id_41F0, var_2], [var_1._id_41F0]);

  if (!isdefined(var_1._id_AF9B))
  var_1._id_AF9B = "droppedToLastStand";

  var_1._id_AF9B = "droppedToLastStand";
}

_id_AF69(var_0, var_1, var_2, var_3, var_4) {
  _id_0A4B::_id_AF6A("entering_afterlife_arcade", var_0, [var_1._id_41F0, var_2, var_3, var_4], [var_1._id_41F0, var_3], [var_1._id_41F0]);
}

_id_45F3(var_0) {
  switch (var_0) {
  case "Wave Complete":
  return 1;
  case "Self Revive":
  return 2;
  default:
  return 1;
  }
}

_id_AF6B(var_0, var_1, var_2, var_3, var_4) {
  var_5 = _id_45F3(var_3);
  _id_0A4B::_id_AF6A("exiting_afterlife_arcade", var_0, [var_1._id_41F0, var_2, var_5, var_4], [var_1._id_41F0, var_5]);
}

_id_AF8E(var_0, var_1) {
  _id_0A4B::_id_AF6A("turning_on_the_power", 1, [level.script, var_0, var_1], [level.script]);
}

_id_AF7E(var_0, var_1, var_2, var_3, var_4) {
  _id_0A63::increment_player_career_doors_opened(var_1);
  _id_0A4B::_id_AF6A("opening_the_doors", var_0, [var_1._id_41F0, var_2, var_3, var_4], [var_1._id_41F0, var_2]);
}

log_purchasingforateamdoor(var_0, var_1, var_2, var_3, var_4) {
  _id_0A4B::_id_AF6A("purchasing_for_a_team_door", var_0, [var_1._id_41F0, var_2, var_3, var_4], [var_1._id_41F0, var_2]);
}

_id_AF62(var_0, var_1) {
  if (var_0 != "next_challenge")
  _id_0A4B::_id_AF6A("challenge_activated", 1, [level.script, var_0, var_1], [level.script]);
}

_id_AF63(var_0, var_1, var_2) {
  _id_0A4B::_id_AF6A("challenge_completed", 1, [level.script, var_0, var_1, var_2], [level.script]);
}

_id_AF64(var_0, var_1, var_2, var_3) {
  _id_0A4B::_id_AF6A("challenge_failed", 1, [level.script, var_0, var_1, int(var_2), var_3], [level.script]);
}

_id_AF79(var_0) {
  _id_0A4B::_id_AF6A("magic_box_used", 1, [level.script, var_0], [level.script]);
}

_id_AF86(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8) {
  if (!isdefined(var_3))
  var_3 = "none";

  if (var_3 == "none") {
  var_1._id_13BE3[getweaponbasename(var_2)] = var_4;

  if (isdefined(var_7[var_3]))
  var_9 = var_7[var_3];
  else
  var_9 = 0;

  if (isdefined(var_8[var_3]))
  var_10 = var_8[var_3];
  else
  var_10 = 0;

  var_6 = 0;
  } else {
  var_11 = var_1._id_13BE3[getweaponbasename(var_3)];
  var_6 = var_4 - var_11;
  var_1._id_13BE3[getweaponbasename(var_2)] = var_4;

  if (!isdefined(var_1._id_A682[var_3]))
  var_1._id_A682[var_3] = 0;

  if (!isdefined(var_1._id_5AFC[var_3]))
  var_1._id_5AFC[var_3] = 0;

  var_9 = var_1._id_A682[var_3];
  var_10 = var_1._id_5AFC[var_3];
  }

  _id_0A4B::_id_AF6A("purchasing_weapon", var_0, [var_1._id_41F0, var_2, var_3, var_4, var_5, var_6, var_9, var_10], [var_1._id_41F0, var_9]);
}

_id_AF5D(var_0, var_1, var_2) {
  _id_0A4B::_id_AF6A("atm_used", var_0, [var_1, var_2._id_41F0], [var_2._id_41F0, var_1]);
}

_id_AF85(var_0, var_1) {
  _id_0A4B::_id_AF6A("portal_used", 1, [level.script, var_0, var_1], [level.script]);
}

_id_AF77(var_0, var_1) {
  _id_0A4B::_id_AF6A("souvenir_item_crafted", 1, [level.script, var_0, var_1], [level.script]);
}

_id_AF78(var_0, var_1, var_2) {
  _id_0A4B::_id_AF6A("lost_and_found", 1, [level.script, var_0, var_1, var_2], [level.script]);
}

_id_AF6C(var_0, var_1, var_2, var_3) {
  _id_0A4B::_id_AF6A("faf_card_used", var_0, [var_1, var_2, var_3._id_41F0], [var_3._id_41F0, var_2]);
}

_id_AF6D(var_0, var_1, var_2) {
  _id_0A4B::_id_AF6A("faf_card_refill", var_0, [var_1, var_2._id_41F0], [var_2._id_41F0, var_1]);
}

_id_AF7F(var_0, var_1, var_2) {
  var_3 = _id_0A77::_id_7DF7(var_1);
  _id_0A4B::_id_AF6A("pack_a_punch_used", 1, [level.script, var_0, var_3, var_2], [level.script]);
}

_id_AF89(var_0, var_1) {
  _id_0A4B::_id_AF6A("souvenir_coin_used", 1, [level.script, var_0, var_1], [level.script]);
}

_id_AF66(var_0, var_1, var_2, var_3, var_4, var_5) {
  _id_0A4B::_id_AF6A("crafted_item_placed", var_0, [var_1._id_41F0, var_2, var_3, var_4, var_5], [var_1._id_41F0, var_3]);
}

_id_AF74(var_0, var_1) {
  _id_0A4B::_id_AF6A("interaction_status", 1, [level.script, var_0, var_1], [level.script]);
}

_id_AF80(var_0, var_1) {
  _id_0A4B::_id_AF6A("perk_machine_used", 1, [level.script, var_0, var_1], [level.script]);
}

_id_AF81(var_0, var_1) {
  _id_0A4B::_id_AF6A("perk_returned", 1, [level.script, var_0, var_1], [level.script]);
}

_id_AF6E(var_0, var_1, var_2, var_3, var_4, var_5, var_6) {
  var_1 _id_0D2A::_id_12D7E(var_1, var_3, var_2);

  if (var_5 > 0 && var_3 != "coaster")
  var_1 thread _id_0A6A::_id_12885("arcade_complete", "zmb_comment_vo", "low", 10, 0, 0, 0, 45);

  _id_0A4B::_id_AF6A("finished_mini_game", var_0, [var_1._id_41F0, var_2, var_3, var_4, var_5, var_6], [var_1._id_41F0, var_3]);
}

_id_AF82(var_0, var_1, var_2, var_3, var_4, var_5) {
  _id_0A4B::_id_AF6A("pillage_event", var_0, [var_1._id_41F0, var_2, var_3, var_4, var_5], [var_1._id_41F0, var_3]);
}

_id_AF75(var_0, var_1, var_2) {
  _id_0A4B::_id_AF6A("item_purchase_with_tickets", 1, [level.script, var_0, var_1, var_2], [level.script]);
}

_id_AF76(var_0, var_1) {
  _id_0A4B::_id_AF6A("item_replaced", 1, [level.script, var_0, var_1], [level.script]);
}

_id_AF7D(var_0, var_1) {
  _id_0A4B::_id_AF6A("neil_head_found", var_0, [level.script, var_0], [level.script]);
  _id_0A4B::_id_AF6A("neil_head_placed", var_1, [level.script, var_1], [level.script]);
}

_id_AF7B(var_0, var_1) {
  _id_0A4B::_id_AF6A("neil_battery", var_0, [level.script, var_0, var_1], [level.script]);
}

_id_AF7C(var_0, var_1) {
  _id_0A4B::_id_AF6A("neil_floppy", var_0, [level.script, var_0, var_1], [level.script]);
}

_id_AF5E(var_0) {
  _id_0A4B::_id_AF6A("balloons_popped", var_0, [level.script, var_0], [level.script]);
}

_id_AF88(var_0) {
  _id_0A4B::_id_AF6A("shot_icemonster", var_0, [level.script, var_0], [level.script]);
}

_id_AF71(var_0) {
  _id_0A4B::_id_AF6A("ghost_spelled", var_0, [level.script, var_0], [level.script]);
}

_id_AF5A(var_0) {
  _id_0A4B::_id_AF6A("1984_kills", undefined, [var_0], undefined);
}

_id_AF5F(var_0) {
  _id_0A4B::_id_AF6A("beating_arcade_games", var_0, [level.script, var_0], [level.script]);
}

_id_AF61(var_0) {
  _id_0A4B::_id_AF6A("brute_hits_cabinet", var_0, [level.script, var_0], [level.script]);
}

_id_AF5B(var_0) {
  _id_0A4B::_id_AF6A("activate_enter_ghostskulls_game", var_0, [level.script, var_0], [level.script]);
}

_id_AF83(var_0, var_1, var_2) {
  _id_0A4B::_id_AF6A("player_exits_ghostskulls_games", var_0, [level.script, var_0, var_1, int(var_2)], [level.script]);
}

_id_AF6F(var_0, var_1, var_2) {
  _id_0A4B::_id_AF6A("frequency_device_collected", var_0, [level.script, var_0, var_1, var_2], [level.script]);
}

_id_AF70(var_0, var_1) {
  _id_0A4B::_id_AF6A("frequency_device_crafted_dj", var_0, [level.script, var_0, var_1], [level.script]);
}

_id_AF8A(var_0, var_1, var_2, var_3) {
  _id_0A4B::_id_AF6A("speaker_defence_sequence_ends", var_0, [level.script, var_0, "" + var_1, var_2, var_3], [level.script]);
}

_id_AF8D(var_0) {
  _id_0A4B::_id_AF6A("tone_sequence_activated", var_0, [level.script, var_0], [level.script]);
}

_id_AF8B(var_0) {
  _id_0A4B::_id_AF6A("suicide_bomber_sequence_activated", var_0, [level.script, var_0], [level.script]);
}

_id_AF72(var_0) {
  _id_0A4B::_id_AF6A("grey_sequence_activated", var_0, [level.script, var_0], [level.script]);
}

_id_AF8F(var_0) {
  _id_0A4B::_id_AF6A("ufo_destroyed", var_0, [level.script, var_0], [level.script]);
}

_id_AF87(var_0, var_1, var_2, var_3) {
  _id_0A4B::_id_AF6A("xp_earned", var_0, [var_1, var_2._id_41F0, var_3], [var_2._id_41F0, var_1]);
}

_id_AF73(var_0, var_1) {
  foreach (var_6, var_3 in var_1.headshots) {
  if (var_6 == "none" || var_6 == "" || var_3 == 0 || !scripts\engine\utility::array_contains(level._id_AE60, var_6))
  continue;

  var_4 = _id_0A77::_id_7DF7(var_6);
  setclientmatchdata("player", var_0, "headShots", var_4, var_3);
  var_5 = var_1 getrankedplayerdata("cp", "headShots", var_4);
  var_1 setrankedplayerdata("cp", "headShots", var_4, var_5 + var_3);
  }

  setclientmatchdata("player", var_0, "total_headshots", var_1._id_11A25);
}

log_card_data(var_0, var_1) {
  if (!isdefined(var_1._id_456B))
  return;

  foreach (var_5, var_3 in var_1._id_456B) {
  var_4 = var_1 getrankedplayerdata("cp", "cards_used", var_5);
  var_1 setrankedplayerdata("cp", "cards_used", var_5, var_4 + var_3._id_11925);
  }
}

log_explosive_kills(var_0, var_1) {
  if (!isdefined(var_1.explosive_kills))
  return;

  var_2 = var_1 getrankedplayerdata("cp", "explosive_kills");
  var_1 setrankedplayerdata("cp", "explosive_kills", var_2 + var_1.explosive_kills);
}

_id_AF91(var_0, var_1) {
  var_2 = 0;
  var_3 = 0;
  var_4 = "";

  foreach (var_8, var_6 in var_1._id_190B) {
  if (var_8 == "none" || var_8 == "" || var_6 == 0 || !scripts\engine\utility::array_contains(level._id_AE60, var_8))
  continue;

  setclientmatchdata("player", var_0, "killsPerWeapon", _id_0A77::_id_7DF7(var_8), var_6);
  var_7 = var_1 getrankedplayerdata("cp", "killsPerWeapon", _id_0A77::_id_7DF7(var_8));
  var_1 setrankedplayerdata("cp", "killsPerWeapon", _id_0A77::_id_7DF7(var_8), var_7 + var_6);

  if (var_1._id_190B[var_8] > 0 && var_2 == 0) {
  var_3 = var_1._id_190B[var_8];
  var_2 = 1;
  var_4 = _id_0A77::_id_7DF7(var_8);
  }

  if (var_1._id_190B[var_8] > var_3) {
  var_3 = var_1._id_190B[var_8];
  var_4 = _id_0A77::_id_7DF7(var_8);
  }
  }

  if (var_3 > 0) {
  setclientmatchdata("player", var_0, "DeadliestWeapon", var_4);
  setclientmatchdata("player", var_0, "DeadliestWeaponKills", var_3);
  }

  var_9 = var_1 getrankedplayerdata("cp", "DeadliestWeaponName");
  var_7 = var_1 getrankedplayerdata("cp", "DeadliestWeaponKills", var_9);

  if (var_7 < var_3) {
  if (var_3 > 0) {
  var_10 = var_1 getrankedplayerdata("cp", "killsPerWeapon", var_4);

  if (!isdefined(var_1._id_190B[var_4]))
  var_1 setrankedplayerdata("cp", "DeadliestWeaponKills", var_4, var_10);
  else
  var_1 setrankedplayerdata("cp", "DeadliestWeaponKills", var_4, var_10);

  var_1 setrankedplayerdata("cp", "DeadliestWeaponName", var_4);
  }
  } else {
  var_11 = var_1 getrankedplayerdata("cp", "killsPerWeapon", var_9);

  if (!isdefined(var_1._id_190B[var_9]))
  var_1 setrankedplayerdata("cp", "DeadliestWeaponKills", var_9, var_11);
  else
  var_1 setrankedplayerdata("cp", "DeadliestWeaponKills", var_9, var_1._id_190B[var_9] + var_11);

  var_1 setrankedplayerdata("cp", "DeadliestWeaponName", var_9);
  }
}

_id_13F5C() {
  var_0 = ["trap_gator", "trap_dragon", "trap_gravitron", "trap_danceparty", "trap_rocket", "trap_spin"];

  foreach (var_6, var_2 in level.players) {
  _id_AF91(var_6, var_2);
  _id_AF73(var_6, var_2);
  log_card_data(var_6, var_2);
  log_explosive_kills(var_6, var_2);

  foreach (var_4 in var_0) {
  if (isdefined(var_2._id_126B0[var_4]))
  var_2.total_trap_kills = var_2.total_trap_kills + var_2._id_126B0[var_4];
  }
  }
}

_id_AF84(var_0, var_1) {}

log_playershotsontarget(var_0, var_1, var_2) {
  _id_0A4B::_id_AF6A("shots_on_target", var_0, [var_1._id_41F0, var_2], [var_1._id_41F0, var_2]);
}

_id_AF8C(var_0, var_1) {
  if (!isdefined(var_1.pers["timesPerWave"]._id_11930))
  var_1.pers["timesPerWave"]._id_11930 = [];

  if (!isdefined(var_1.pers["timesPerWave"]._id_11930[level._id_13BD4]))
  var_1.pers["timesPerWave"]._id_11930[level._id_13BD4] = [];

  if (!isdefined(var_1.pers["timesPerWave"]._id_11930[level._id_13BD4][var_0]))
  var_1.pers["timesPerWave"]._id_11930[level._id_13BD4][var_0] = 0;

  var_1.pers["timesPerWave"]._id_11930[level._id_13BD4][var_0]++;
}

log_hidden_song_one_found(var_0) {
  _id_0A4B::_id_AF6A("hidden_song_one_discovered", undefined, [var_0], undefined);
}

log_hidden_song_two_found(var_0) {
  _id_0A4B::_id_AF6A("hidden_song_two_discovered", undefined, [var_0], undefined);
}

log_crafted_wor_facemelter(var_0) {
  _id_0A4B::_id_AF6A("crafted_wor_facemelter", undefined, [var_0], undefined);
}

log_crafted_wor_headcutter(var_0) {
  _id_0A4B::_id_AF6A("crafted_wor_headcutter", undefined, [var_0], undefined);
}

log_crafted_wor_dischord(var_0) {
  _id_0A4B::_id_AF6A("crafted_wor_dischord", undefined, [var_0], undefined);
}

log_crafted_wor_shredder(var_0) {
  _id_0A4B::_id_AF6A("crafted_wor_shredder", undefined, [var_0], undefined);
}

log_pink_ark_obtained(var_0) {
  _id_0A4B::_id_AF6A("pink_ark_obtained", undefined, [var_0], undefined);
}
