/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2672.gsc
***************************************/

init() {
  level._id_13CBD = spawnstruct();
  level._id_13CBD._id_DCD4 = [];
  var_0 = 0;

  for (;;) {
  var_1 = int(tablelookuprownum("mp/weaponRankTable.csv", 0, var_0));

  if (!isdefined(var_1) || var_1 < 0)
  break;

  var_2 = spawnstruct();
  level._id_13CBD._id_DCD4[var_0] = var_2;
  var_2._id_B7CF = int(tablelookupbyrow("mp/weaponRankTable.csv", var_0, 1));
  var_2._id_13E29 = int(tablelookupbyrow("mp/weaponRankTable.csv", var_0, 2));
  var_2._id_B4D6 = int(tablelookupbyrow("mp/weaponRankTable.csv", var_0, 3));
  var_0++;
  }

  level._id_13CBD._id_B4C0 = var_0 - 1;
  level._id_13CBD._id_B4D4 = [];
  var_3 = 1;

  for (;;) {
  var_1 = int(tablelookuprownum("mp/statstable.csv", 0, var_3));

  if (!isdefined(var_1) || var_1 < 0)
  break;

  var_4 = tablelookupbyrow("mp/statstable.csv", var_1, 4);
  var_5 = tablelookupbyrow("mp/statstable.csv", var_1, 42);

  if (!isdefined(var_4) || var_4 == "" || !isdefined(var_5) || var_5 == "") {} else {
  var_5 = int(var_5);
  level._id_13CBD._id_B4D4[var_4] = var_5;
  }

  var_3++;
  }

  init_weapon_rank_events();
}

init_weapon_rank_events() {
  var_0 = "scripts/cp/maps/cp_zmb/cp_zmb_weaponrank_event.csv";

  if (isdefined(level.weapon_rank_event_table))
  var_0 = level.weapon_rank_event_table;

  level.weapon_rank_event = [];
  var_1 = 1;

  for (;;) {
  var_2 = tablelookup(var_0, 0, var_1, 1);

  if (!isdefined(var_2) || var_2 == "")
  break;

  var_3 = int(tablelookup(var_0, 0, var_1, 2));
  level.weapon_rank_event[var_2] = var_3;
  var_1++;
  }
}

_id_1285E(var_0, var_1, var_2, var_3) {
  if (!level.onlinegame)
  return;

  if (isai(var_0) || !isplayer(var_0) || !_id_13C3E() || !_id_9D1B(var_0, var_1))
  return;

  var_4 = _id_0A77::_id_7DF7(var_1);

  if (!_id_13C48(var_4))
  return;

  _id_831B(var_0, var_4, _id_7D83(var_0, var_2, var_3));
}

_id_831B(var_0, var_1, var_2) {
  var_3 = get_player_weapon_rank_cp_xp(var_0, var_1);
  var_4 = get_player_weapon_rank_mp_xp(var_0, var_1);
  var_5 = var_3 + var_4;
  var_6 = get_weapon_rank_for_xp(var_5);
  var_7 = _id_7ACF(var_1);
  var_8 = _id_7D65(var_1);
  var_9 = var_8 - var_4;
  var_10 = var_3 + var_2;

  if (var_10 > var_9)
  var_10 = var_9;

  var_11 = var_10 + var_4;
  var_12 = var_0 getrankedplayerdata("common", "sharedProgression", "weaponLevel", var_1, "prestige");
  var_13 = int(min(get_weapon_rank_for_xp(var_11), var_7));
  var_0 setrankedplayerdata("common", "sharedProgression", "weaponLevel", var_1, "cpXP", var_10);

  if (var_6 < var_13)
  var_0 _id_0A57::showsplash("ranked_up_weapon_" + var_1, var_13 + 1);
}

_id_13C3E() {
  if (scripts\engine\utility::_id_9CEE(level._id_55A5))
  return 0;

  return 1;
}

_id_9D1B(var_0, var_1) {
  var_2 = var_0 _id_0A63::_id_7BAA();
  var_3 = _id_0A77::_id_7DF7(var_1);
  var_4 = int(tablelookup("mp/unlocks/CPWeaponUnlocks.csv", 0, var_3, 7));

  if (var_2 >= var_4)
  return 1;
  else
  return 0;
}

get_player_weapon_rank_cp_xp(var_0, var_1) {
  var_2 = var_0 getrankedplayerdata("common", "sharedProgression", "weaponLevel", var_1, "cpXP");
  return var_2;
}

get_player_weapon_rank_mp_xp(var_0, var_1) {
  var_2 = var_0 getrankedplayerdata("common", "sharedProgression", "weaponLevel", var_1, "mpXP");
  return var_2;
}

_id_13C48(var_0) {
  return _id_13C19(var_0);
}

_id_13C19(var_0) {
  if (!isdefined(level._id_13CBD._id_B4D4[var_0]))
  return 0;

  return 1;
}

get_weapon_rank_for_xp(var_0) {
  if (var_0 == 0)
  return 0;

  for (var_1 = get_max_weapon_rank() - 1; var_1 >= 0; var_1--) {
  if (var_0 >= get_weapon_rank_info_min_xp(var_1))
  return var_1;
  }

  return var_1;
}

get_max_weapon_rank() {
  return level._id_13CBD._id_B4C0;
}

get_weapon_rank_info_min_xp(var_0) {
  return level._id_13CBD._id_DCD4[var_0]._id_B7CF;
}

_id_7D65(var_0) {
  var_1 = _id_7ACF(var_0);
  return _id_7D6E(var_1);
}

_id_7ACF(var_0) {
  return level._id_13CBD._id_B4D4[var_0];
}

_id_7D6E(var_0) {
  return level._id_13CBD._id_DCD4[var_0]._id_B4D6;
}

_id_7D83(var_0, var_1, var_2) {
  var_3 = _id_79A2(var_1);
  var_4 = _id_79A3(var_2);
  var_5 = get_player_weapon_xp_scalar(var_0);
  var_6 = int(var_3 * var_4 * var_5);
  return var_6;
}

_id_12861(var_0, var_1, var_2, var_3, var_4) {
  _id_1285E(var_0, var_1, var_4, _id_7D88(var_1, var_2, var_3, var_0));
}

_id_7D88(var_0, var_1, var_2, var_3) {
  if (_id_0A77::isheadshot(var_0, var_1, var_2, var_3))
  return "headshot";

  return undefined;
}

get_player_weapon_xp_scalar(var_0) {
  if (isdefined(var_0.weaponxpscale))
  return var_0.weaponxpscale;
  else
  return 1;
}

_id_79A2(var_0) {
  if (!isdefined(level.weapon_rank_event[var_0]))
  return 0;

  return level.weapon_rank_event[var_0];
}

_id_79A3(var_0) {
  if (!isdefined(var_0))
  return 1;

  switch (var_0) {
  case "headshot":
  return 1.5;
  default:
  }
}
