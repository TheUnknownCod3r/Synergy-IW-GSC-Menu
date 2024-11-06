/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2635.gsc
***************************************/

_id_10C5A(var_0, var_1, var_2) {
  init(var_2);
  _id_9679(var_0, var_1);
}

_id_9679(var_0, var_1) {
  setmatchdatadef(var_0);
  setclientmatchdatadef(var_1);
  setmatchdata("commonMatchData", "map", level.script);
  setmatchdata("commonMatchData", "gametype", getdvar("ui_gametype"));
  setmatchdata("commonMatchData", "buildVersion", getbuildversion());
  setmatchdata("commonMatchData", "buildNumber", getbuildnumber());
  setmatchdata("commonMatchData", "utcStartTimeSeconds", getsystemtime());
  setmatchdata("commonMatchData", "isPrivateMatch", getdvarint("xblive_privatematch"));
  setmatchdata("commonMatchData", "isRankedMatch", 1);
  setmatchdataid();
  level thread _id_13663();
}

init(var_0) {
  var_1 = spawnstruct();
  var_2 = [];
  var_1._id_1020C = var_2;
  var_3 = [];
  var_1._id_3C1F = var_3;
  level._id_13F0B = var_1;
  _id_94FA(var_0);
  level.player_count = 0;
  level.player_count_left = 0;
}

_id_13663() {
  level endon("gameEnded");
  level waittill("prematch_done");
  setmatchdata("commonMatchData", "playerCountStart", _id_13134(level.players.size));
}

_id_C4B8() {
  _id_D0F6();
  set_player_count();
  _id_F5AC();
  _id_F443();
  setmatchdata("players", self._id_41F0, "playerID", "xuid", _id_0A77::_id_81EC());
  setmatchdata("players", self._id_41F0, "gamertag", self.name);
  setmatchdata("players", self._id_41F0, "waveStart", level._id_13BD3);
  setmatchdata("players", self._id_41F0, "quit", 0);
  level.player_count = level.player_count + 1;
}

on_player_disconnect(var_0) {
  setmatchdata("players", self._id_41F0, "disconnectReason", var_0);
  setmatchdata("players", self._id_41F0, "quit", var_0 == "EXE_DISCONNECTED");
  set_custom_stats();
  level.player_count_left = level.player_count_left + 1;
}

_id_D0F6() {
  var_0 = spawnstruct();
  var_1 = [];
  var_1["cashSpentOnWeapon"] = _id_7C6B(0, "int");
  var_1["cashSpentOnAbility"] = _id_7C6B(0, "int");
  var_1["cashSpentOnTrap"] = _id_7C6B(0, "int");
  var_0._id_1020C = var_1;
  var_2 = [];
  var_2["timesDowned"] = [];
  var_2["timesRevived"] = [];
  var_2["timesBledOut"] = [];
  var_0._id_AA03 = var_2;
  self._id_13F0B = var_0;
}

set_player_count() {
  if (!isdefined(level.max_concurrent_player_count))
  level.max_concurrent_player_count = 0;

  if (level.players.size >= level.max_concurrent_player_count)
  level.max_concurrent_player_count = level.players.size + 1;
}

_id_F5AC() {
  setmatchdata("players", self._id_41F0, "isSplitscreen", self issplitscreenplayer());
}

_id_F443() {
  if (_id_D84A())
  setmatchdata("players", self._id_41F0, "joinInProgress", 1);
}

_id_D84A() {
  if (scripts\engine\utility::_id_6E34("introscreen_over") && scripts\engine\utility::_id_6E25("introscreen_over"))
  return 1;

  return 0;
}

_id_12D9F(var_0, var_1) {
  if (level._id_13F0B._id_3C1F.size > 25)
  return;

  var_2 = spawnstruct();
  var_2._id_3C1B = var_0;
  var_2._id_0264 = var_1;
  level._id_13F0B._id_3C1F[level._id_13F0B._id_3C1F.size] = var_2;
}

_id_93C1() {
  _id_93C4("timesDowned");
}

_id_93C7() {
  _id_93C4("timesRevived");
}

_id_93BE() {
  _id_93C4("timesBledOut");
}

_id_93C4(var_0) {
  if (!isdefined(self._id_13F0B._id_AA03[var_0][level._id_13BD3]))
  self._id_13F0B._id_AA03[var_0][level._id_13BD3] = 0;

  self._id_13F0B._id_AA03[var_0][level._id_13BD3]++;
}

_id_12E2E(var_0, var_1) {
  switch (var_1) {
  case "weapon":
  self._id_13F0B._id_1020C["cashSpentOnWeapon"]._id_13153 = self._id_13F0B._id_1020C["cashSpentOnWeapon"]._id_13153 + var_0;
  break;
  case "ability":
  self._id_13F0B._id_1020C["cashSpentOnAbility"]._id_13153 = self._id_13F0B._id_1020C["cashSpentOnAbility"]._id_13153 + var_0;
  break;
  case "trap":
  self._id_13F0B._id_1020C["cashSpentOnTrap"]._id_13153 = self._id_13F0B._id_1020C["cashSpentOnTrap"]._id_13153 + var_0;
  break;
  default:
  break;
  }
}

endgame(var_0, var_1) {
  _id_F3C5(var_0, var_1);
  _id_13DFF();
  log_matchdata_at_game_end();

  foreach (var_4, var_3 in level.players) {
  _id_0A63::increment_player_career_total_waves(var_3);
  _id_0A63::increment_player_career_total_score(var_3);
  var_3 set_player_data(var_1);
  var_3 _id_F52B();
  var_3 _id_13DFD(var_3, var_4);
  }

  if (isdefined(level._id_1E5F))
  [[level._id_1E5F]]();

  sendmatchdata();
  sendclientmatchdata();
}

set_player_data(var_0) {
  var_1 = self getrankedplayerdata("cp", "coopCareerStats", "totalGameplayTime");
  var_2 = self getrankedplayerdata("cp", "coopCareerStats", "gamesPlayed");

  if (!isdefined(var_1))
  var_1 = 0;

  if (!isdefined(var_2))
  var_2 = 0;

  var_1 = var_1 + var_0 / 1000;
  var_2 = var_2 + 1;
  self setrankedplayerdata("cp", "coopCareerStats", "totalGameplayTime", int(var_1));
  self setrankedplayerdata("cp", "coopCareerStats", "gamesPlayed", int(var_2));
}

_id_F3C5(var_0, var_1) {
  var_2 = "challengesCompleted";
  var_3 = level._id_13F0B;

  foreach (var_7, var_5 in var_3._id_1020C)
  var_6 = _id_13137(var_5._id_13153, var_5._id_13155);

  foreach (var_10, var_9 in var_3._id_3C1F) {}

  setmatchdata("commonMatchData", "playerCountEnd", level.players.size);
  setmatchdata("commonMatchData", "utcEndTimeSeconds", getsystemtime());
  setmatchdata("commonMatchData", "playerCount", _id_13134(level.player_count));
  setmatchdata("commonMatchData", "playerCountLeft", _id_13134(level.player_count_left));
  setmatchdata("playerCountMaxConcurrent", _id_13134(level.max_concurrent_player_count));
}

_id_F52B() {
  _id_4642();
  _id_F44C();
  _id_F59E();
  set_custom_stats();
}

get_player_matchdata(var_0, var_1) {
  if (isdefined(level._id_B3DF["player"][self._id_41F0]) && isdefined(level._id_B3DF["player"][self._id_41F0][var_0]))
  return level._id_B3DF["player"][self._id_41F0][var_0];

  return var_1;
}

set_custom_stats() {
  var_0 = self getrankedplayerdata("cp", "coopCareerStats", "totalGameplayTime");
  var_1 = self getrankedplayerdata("cp", "coopCareerStats", "gamesPlayed");
  var_2 = self getrankedplayerdata("cp", "progression", "playerLevel", "rank");
  var_3 = self getrankedplayerdata("cp", "progression", "playerLevel", "prestige");

  if (isdefined(self.wave_num_when_joined))
  setmatchdata("players", self._id_41F0, "waveEnd", level._id_13BD3 - self.wave_num_when_joined);
  else
  setmatchdata("players", self._id_41F0, "waveEnd", level._id_13BD3);

  setmatchdata("players", self._id_41F0, "doorsOpened", get_player_matchdata("opening_the_doors", 0));
  setmatchdata("players", self._id_41F0, "moneyEarned", int(get_player_matchdata("currency_earned", 0)));
  setmatchdata("players", self._id_41F0, "kills", get_player_matchdata("zombie_death", 0));
  setmatchdata("players", self._id_41F0, "downs", get_player_matchdata("dropped_to_last_stand", 0));
  setmatchdata("players", self._id_41F0, "revives", get_player_matchdata("revived_another_player", 0));
  setmatchdata("players", self._id_41F0, "headShots", self._id_11A25);
  setmatchdata("players", self._id_41F0, "shots", self.accuracy_shots_fired);
  setmatchdata("players", self._id_41F0, "hits", self._id_154B);
  setmatchdata("players", self._id_41F0, "rank", _id_13134(var_2));
  setmatchdata("players", self._id_41F0, "prestige", _id_13134(var_3));
  setmatchdata("players", self._id_41F0, "totalGameplayTime", _id_13135(var_0));
  setmatchdata("players", self._id_41F0, "gamesPlayed", _id_13135(var_1));
}

_id_4642() {}

_id_F44C() {}

_id_F59E() {}

_id_13137(var_0, var_1) {
  switch (var_1) {
  case "byte":
  return _id_13134(var_0);
  case "short":
  return _id_13136(var_0);
  case "int":
  return _id_13135(var_0);
  default:
  }
}

_id_13134(var_0) {
  return int(min(var_0, 127));
}

_id_13136(var_0) {
  return int(min(var_0, 32767));
}

_id_13135(var_0) {
  return int(min(var_0, 2147483647));
}

_id_7C6B(var_0, var_1) {
  var_2 = spawnstruct();
  var_2._id_13153 = var_0;
  var_2._id_13155 = var_1;
  return var_2;
}

_id_94FA(var_0) {
  var_1 = 0;
  var_2 = 1;
  var_3 = 2;
  var_4 = 1;
  var_5 = 2;
  var_6 = 3;
  var_7 = 4;
  var_8 = 5;
  var_9 = 6;
  var_10 = 1;
  var_11 = 100;
  var_12 = 101;
  var_13 = 300;
  level._id_2B23 = [];
  level._id_B3E2 = [];
  level._id_B3E0 = [];
  level._id_B3DF = [];
  level._id_41F3 = [];
  level._id_41F2 = [];
  level._id_41F1 = [];

  for (var_14 = var_12; var_14 <= var_13; var_14++) {
  var_15 = tablelookup(var_0, var_1, var_14, var_4);

  if (var_15 == "")
  continue;

  var_16 = tablelookup(var_0, var_1, var_14, var_5);

  if (var_16 != "")
  level._id_2B23[var_15] = var_16;

  var_17 = tablelookup(var_0, var_1, var_14, var_6);

  if (var_17 != "")
  level._id_B3E0[var_15] = var_17;

  var_18 = tablelookup(var_0, var_1, var_14, var_7);

  if (var_18 != "") {
  level._id_B3E2[var_15] = [];
  level._id_B3DF[var_15] = [];
  }

  var_19 = tablelookup(var_0, var_1, var_14, var_8);

  if (var_19 != "")
  level._id_41F2[var_15] = var_19;

  var_20 = tablelookup(var_0, var_1, var_14, var_9);

  if (var_20 != "") {
  level._id_41F3[var_15] = [];
  level._id_41F1[var_15] = [];
  }
  }

  level._id_1E5C = [];

  for (var_14 = var_10; var_14 <= var_11; var_14++) {
  var_21 = tablelookup(var_0, var_1, var_14, var_2);

  if (var_21 == "")
  break;

  var_22 = tablelookup(var_0, var_1, var_14, var_3);
  level._id_1E5C[var_21] = var_22;
  var_23 = strtok(var_22, " ");

  foreach (var_25 in var_23) {
  if (isdefined(level._id_B3E2[var_25]))
  level._id_B3E2[var_25][var_21] = 0;

  if (isdefined(level._id_41F3[var_25]) && isdefined(level._id_41F2[var_21]))
  level._id_41F3[var_25][var_21] = 0;
  }
  }
}

_id_AF6A(var_0, var_1, var_2, var_3, var_4) {
  var_5 = _id_7925(var_0);
  _id_AF60(var_0, var_5, var_2);
  _id_AF7A(var_0, var_5, var_1, var_3);
  _id_AF65(var_0, var_5, var_1, var_4);
}

log_matchdata_at_game_end() {
  foreach (var_8, var_1 in level._id_B3DF) {
  foreach (var_7, var_3 in var_1) {
  foreach (var_6, var_5 in var_3) {
  if (var_8 == "match") {
  setmatchdata("matchData", var_6, int(var_5));
  continue;
  }

  setmatchdata("players", int(var_7), var_6, int(var_5));
  }
  }
  }
}

_id_AF60(var_0, var_1, var_2) {
  var_3 = _id_785B(var_1);
  var_4 = "analytics_cp_";

  switch (var_2.size) {
  case 1:
  bbprint(var_4 + var_0, var_3, var_2[0]);
  break;
  case 2:
  bbprint(var_4 + var_0, var_3, var_2[0], var_2[1]);
  break;
  case 3:
  bbprint(var_4 + var_0, var_3, var_2[0], var_2[1], var_2[2]);
  break;
  case 4:
  bbprint(var_4 + var_0, var_3, var_2[0], var_2[1], var_2[2], var_2[3]);
  break;
  case 5:
  bbprint(var_4 + var_0, var_3, var_2[0], var_2[1], var_2[2], var_2[3], var_2[4]);
  break;
  case 6:
  bbprint(var_4 + var_0, var_3, var_2[0], var_2[1], var_2[2], var_2[3], var_2[4], var_2[5]);
  break;
  case 7:
  bbprint(var_4 + var_0, var_3, var_2[0], var_2[1], var_2[2], var_2[3], var_2[4], var_2[5], var_2[6]);
  break;
  case 8:
  bbprint(var_4 + var_0, var_3, var_2[0], var_2[1], var_2[2], var_2[3], var_2[4], var_2[5], var_2[6], var_2[7]);
  break;
  case 9:
  bbprint(var_4 + var_0, var_3, var_2[0], var_2[1], var_2[2], var_2[3], var_2[4], var_2[5], var_2[6], var_2[7], var_2[8]);
  break;
  case 10:
  bbprint(var_4 + var_0, var_3, var_2[0], var_2[1], var_2[2], var_2[3], var_2[4], var_2[5], var_2[6], var_2[7], var_2[8], var_2[9]);
  break;
  }
}

_id_785B(var_0) {
  var_1 = "";

  foreach (var_4, var_3 in var_0) {
  var_1 = var_1 + (var_3 + " " + level._id_2B23[var_3]);

  if (var_4 != var_0.size - 1)
  var_1 = var_1 + " ";
  }

  return var_1;
}

_id_7925(var_0) {
  var_1 = level._id_1E5C[var_0];
  return strtok(var_1, " ");
}

_id_AF7A(var_0, var_1, var_2, var_3) {
  var_4 = 0;

  foreach (var_6 in var_1) {
  if (_id_9C41(var_6)) {
  var_7 = var_3[var_4];

  if (!isdefined(level._id_B3DF[var_6][var_7]))
  level._id_B3DF[var_6][var_7] = level._id_B3E2[var_6];

  level._id_B3DF[var_6][var_7][var_0] = level._id_B3DF[var_6][var_7][var_0] + var_2;
  var_4++;
  }
  }
}

_id_AF65(var_0, var_1, var_2, var_3) {
  if (!isdefined(var_3))
  return;

  var_4 = 0;

  if (_id_9B8E(var_0)) {
  foreach (var_6 in var_1) {
  if (_id_9B8F(var_6)) {
  var_7 = var_3[var_4];

  if (!isdefined(level._id_41F1[var_6][var_7]))
  level._id_41F1[var_6][var_7] = level._id_41F3[var_6];

  level._id_41F1[var_6][var_7][var_0] = level._id_41F1[var_6][var_7][var_0] + var_2;
  var_4++;
  }
  }
  }
}

_id_9C41(var_0) {
  return isdefined(level._id_B3E2[var_0]);
}

_id_9B8F(var_0) {
  return isdefined(level._id_41F3[var_0]);
}

_id_9B8E(var_0) {
  return isdefined(level._id_41F2[var_0]);
}

_id_13DFF() {
  setclientmatchdata("waves_survived", level._id_13BD3);
  setclientmatchdata("time_survived", level._id_118DB);
  setclientmatchdata("scoreboardPlayerCount", level.players.size);
  setclientmatchdata("map", level.script);

  if (isdefined(level._id_13E00))
  [[level._id_13E00]]();
}

_id_13DFD(var_0, var_1) {
  setclientmatchdata("player", var_1, "username", var_0.name);
  setclientmatchdata("player", var_1, "rank", var_0 _id_0A63::_id_7BAA());

  if (!isdefined(var_0._id_CFC3))
  return;

  setclientmatchdata("player", var_1, "characterIndex", var_0._id_CFC3);
  var_2 = level._id_41F1["player"][var_0._id_41F0];

  if (isdefined(var_2)) {
  foreach (var_5, var_4 in var_2)
  setclientmatchdata("player", var_1, var_5, int(var_4));
  }

  if (isdefined(level._id_6324))
  [[level._id_6324]](var_0, var_1);
}
