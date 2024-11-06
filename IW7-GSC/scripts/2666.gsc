/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2666.gsc
***************************************/

_id_98EA() {
  level._id_134FE = ["highest", "high", "medium", "low"];
  level._id_134B4 = [];
  level._id_134BF = [];
  level._id_134C0 = [];
  level._id_134CA = [];
  level._id_13519 = "cp/" + getdvar("ui_mapname") + "_vo_table.csv";
  level thread _id_C904();
  level thread _id_BE3E();
}

_id_97CC() {
  _id_97A1();
  thread _id_10D5B();
  level thread game_ended_vo_watcher();
}

_id_97A1() {
  var_0 = spawnstruct();
  var_0._id_134C6 = undefined;
  var_0._id_9A89 = undefined;
  var_0._id_9C80 = 0;
  var_1 = [];

  foreach (var_4, var_3 in level._id_134FE)
  var_1[var_3] = [];

  var_0._id_134FF = var_1;
  self._id_13516 = var_0;
  scripts\engine\utility::_id_6E39("vo_system_busy");
}

_id_C904() {
  var_0 = level._id_13519;
  var_1 = 1;

  for (;;) {
  var_2 = tablelookupbyrow(var_0, var_1, 0);

  if (var_2 == "")
  break;

  var_3 = tablelookupbyrow(var_0, var_1, 1);
  var_4 = int(tablelookupbyrow(var_0, var_1, 2));
  var_5 = int(tablelookupbyrow(var_0, var_1, 3));
  var_6 = int(tablelookupbyrow(var_0, var_1, 4));
  var_7 = tablelookupbyrow(var_0, var_1, 5);
  var_8 = tablelookupbyrow(var_0, var_1, 6);
  var_9 = tablelookupbyrow(var_0, var_1, 7);
  var_10 = tablelookupbyrow(var_0, var_1, 8);
  var_11 = tablelookupbyrow(var_0, var_1, 9);
  var_12 = int(tablelookupbyrow(var_0, var_1, 10));
  var_13 = int(tablelookupbyrow(var_0, var_1, 11));
  var_14 = tablelookupbyrow(var_0, var_1, 12);
  var_15 = int(tablelookupbyrow(var_0, var_1, 13));
  var_16 = tablelookupbyrow(var_0, var_1, 15);
  var_17 = int(tablelookupbyrow(var_0, var_1, 16));
  var_18 = int(tablelookupbyrow(var_0, var_1, 17));
  _id_DEDE(var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14, var_15, var_16, var_17, var_18);

  if (var_1 % 5 == 1)
  wait 0.05;

  var_1++;
  }
}

_id_DEDE(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14, var_15, var_16) {
  var_17 = spawnstruct();

  if (isdefined(var_2) && var_2 > 0) {
  var_17._id_4613 = var_2;
  var_17._id_A9CE = 0;
  }

  if (isdefined(var_13) && var_13 > 0)
  var_17._id_C9CA = var_13;

  if (scripts\engine\utility::_id_9CEE(var_10))
  var_17._id_C555 = 1;
  else
  var_17._id_C555 = 0;

  if (isdefined(var_11) && var_11 > 0)
  var_17._id_32A0 = var_11;

  if (isdefined(var_12))
  var_17._id_D925 = var_12;

  if (isdefined(var_4) && var_4 > 0)
  var_17._id_B44F = var_4;

  if (isdefined(var_3) && var_3 > 0)
  var_17._id_3C39 = var_3;

  if (isdefined(var_7) && var_7 != "")
  var_17._id_1383B = var_7;

  if (isdefined(var_5) && var_5 != "") {
  if (!isdefined(level._id_134BF[var_5]))
  level._id_134BF[var_5] = [];

  var_17._id_3B96 = var_5;
  level._id_134BF[var_5][level._id_134BF[var_5].size] = var_1;

  if (!isdefined(level._id_134C0[var_5]))
  level._id_134C0[var_5] = 0;
  }

  if (isdefined(var_6) && var_6 != "") {
  if (!isdefined(level._id_134BF[var_6]))
  level._id_134BF[var_6] = [];

  var_17._id_3B97 = var_6;
  level._id_134BF[var_6][level._id_134BF[var_6].size] = var_1;

  if (!isdefined(level._id_134C0[var_6]))
  level._id_134C0[var_6] = 0;
  }

  if (isdefined(var_8) && var_8 != "") {
  if (!isdefined(level._id_134CA[var_8]))
  level._id_134CA[var_8] = [];

  var_17._id_54AA = var_8;
  level._id_134CA[var_1] = var_8;
  }

  if (isdefined(var_9) && var_9 != "")
  var_17._id_BF7B = var_9;

  if (isdefined(var_14))
  var_17._id_18E3 = var_14;

  if (isdefined(var_15))
  var_17.pap_approval = var_15;

  if (isdefined(var_16))
  var_17.rave_approval = var_16;

  level._id_134B4[var_1] = var_17;
}

_id_10D5B() {
  self endon("disconnect");
  level endon("game_ended");

  for (;;) {
  if (_id_9D13()) {
  if (scripts\engine\utility::_id_6E34("vo_system_busy"))
  scripts\engine\utility::_id_6E5A("vo_system_busy");
  }

  var_0 = _id_7D4E();

  if (!isdefined(var_0)) {
  _id_F60D(0);
  self waittill("play_VO_system");

  if (_id_9D14())
  self waittill("unpause_VO_system");

  continue;
  }

  _id_CE8B(var_0);
  }
}

_id_CE8B(var_0, var_1) {
  self endon("disconnect");
  _id_F60D(1);
  _id_F60B(var_0);
  _id_CE77(var_0, var_1);
  _id_C9B8(var_0);
  _id_12C63();
}

_id_7D4E() {
  var_0 = _id_E409();

  if (isdefined(var_0))
  return var_0;

  foreach (var_3, var_2 in level._id_134FE) {
  var_0 = _id_E40A(var_2);

  if (isdefined(var_0))
  return var_0;
  }

  return undefined;
}

_id_E409() {
  var_0 = self._id_13516._id_9A89;
  _id_E1F9();
  return var_0;
}

_id_E1F9() {
  self._id_13516._id_9A89 = undefined;
}

_id_E40A(var_0) {
  _id_E009(var_0);
  return _id_D659(var_0);
}

_id_D659(var_0) {
  var_1 = self._id_13516._id_134FF[var_0][0];

  if (!isdefined(var_1))
  return var_1;

  var_2 = [];

  for (var_3 = 1; var_3 < self._id_13516._id_134FF[var_0].size; var_3++) {
  if (!isdefined(self._id_13516._id_134FF[var_0][var_3]))
  break;

  var_2[var_3 - 1] = self._id_13516._id_134FF[var_0][var_3];
  }

  self._id_13516._id_134FF[var_0] = var_2;
  return var_1;
}

_id_E009(var_0) {
  var_1 = gettime();
  var_2 = [];

  foreach (var_5, var_4 in self._id_13516._id_134FF[var_0]) {
  if (!_id_134D5(var_4, var_1)) {
  var_2[var_2.size] = self._id_13516._id_134FF[var_0][var_5];
  continue;
  }
  }

  self._id_13516._id_134FF[var_0] = var_2;
}

_id_134D5(var_0, var_1) {
  return var_1 > var_0._id_698A;
}

_id_F60D(var_0) {
  self._id_13516._id_9C80 = var_0;
}

_id_9D14() {
  return scripts\engine\utility::_id_9CEE(self._id_C9CB);
}

_id_9D13() {
  return scripts\engine\utility::_id_6E25("vo_system_busy");
}

_id_F60C(var_0) {
  level._id_13517 = var_0;

  if (!var_0)
  scripts\engine\utility::_id_6E2A("vo_system_busy");
  else
  scripts\engine\utility::_id_6E3E("vo_system_busy");
}

_id_F60B(var_0) {
  self._id_13516._id_134C6 = var_0;
}

game_ended_vo_watcher() {
  var_0 = "";
  level scripts\engine\utility::waittill_any("game_ended");

  foreach (var_2 in level.players) {
  foreach (var_4 in level._id_134FE) {
  if (isdefined(var_2._id_13516._id_134FF[var_4]) && var_2._id_13516._id_134FF[var_4].size > 0) {
  foreach (var_6 in var_2._id_13516._id_134FF[var_4]) {
  if (isdefined(var_6)) {
  if (soundexists(var_6._id_1B46))
  var_2 stopolcalsound(var_6._id_1B46);
  }
  }

  var_2._id_13516._id_134FF[var_4] = [];
  }
  }

  if (isdefined(level._id_540D) && level._id_540D.size > 0) {
  foreach (var_10 in level._id_540D) {
  if (issubstr(var_10, "pg_"))
  var_2 stopolcalsound(var_10);

  if (soundexists(var_2._id_134FD + var_10))
  var_2 stopolcalsound(var_2._id_134FD + var_10);

  if (soundexists(var_2._id_134FD + "plr_" + var_10))
  var_2 stopolcalsound(var_2._id_134FD + "plr_" + var_10);
  }
  }

  if (isdefined(var_2.current_vo_queue) && var_2.current_vo_queue.size > 0) {
  foreach (var_13 in var_2.current_vo_queue) {
  if (isdefined(var_13)) {
  if (soundexists(var_13)) {
  var_2 stopolcalsound(var_13);
  continue;
  }

  if (soundexists(var_2._id_134FD + var_13)) {
  var_2 stopolcalsound(var_2._id_134FD + var_13);
  continue;
  }

  if (soundexists(var_2._id_134FD + "plr_" + var_13))
  var_2 stopolcalsound(var_2._id_134FD + "plr_" + var_13);
  }
  }
  }

  if (!isdefined(var_2._id_134FD))
  return;

  switch (var_2._id_134FD) {
  case "p1_":
  var_0 = "_valley_girl";
  break;
  case "p2_":
  var_0 = "_nerd";
  break;
  case "p3_":
  var_0 = "_rapper";
  break;
  case "p4_":
  var_0 = "_jock";
  break;
  case "p5_":
  var_0 = "_jock";
  break;
  }

  var_2 stopolcalsound("mus_zombies" + var_0);
  var_2 stopolcalsound("mus_zombies" + var_0 + "_lsrs");
  }
}

_id_CE77(var_0, var_1) {
  self endon("interrupt_current_VO");
  level endon("game_ended");
  self endon("death");
  self endon("disconnect");

  if (self.sessionstate != "playing")
  return;

  var_2 = var_0._id_1B46;

  if (!soundexists(var_2)) {
  wait 0.1;
  return;
  }

  self._id_13518 = 1;

  if (_id_0A77::_id_9C82(self)) {
  var_3 = _id_0A77::_id_7B64(self);

  if (isdefined(var_3))
  self stopolcalsound(var_3);
  }

  if (isdefined(var_0._id_2896))
  var_4 = var_0._id_2896;
  else
  var_4 = var_2;

  foreach (var_6 in level.players) {
  if (var_6 issplitscreenplayer() && !var_6 isreloading())
  continue;

  if (isdefined(var_6.current_vo_queue))
  var_6.current_vo_queue = scripts\engine\utility::_id_2279(var_6.current_vo_queue, var_4);

  if (var_6 == self) {
  if (isdefined(level.get_alias_2d_func))
  var_7 = [[level.get_alias_2d_func]](var_6, var_2, var_4);
  else
  var_7 = _id_77ED(var_6, var_2, var_4);

  if (isdefined(var_7))
  var_6 playlocalsound(var_7);
  else
  var_6 playlocalsound(var_2);

  if (scripts\engine\utility::_id_9CEE(var_1)) {
  var_8 = var_7 + var_6.vo_suffix;
  var_6 thread alias_specific_vo(var_8);
  }

  continue;
  }

  if (!scripts\engine\utility::_id_9CEE(var_0._id_C551))
  self playsoundtoplayer(var_2, var_6);
  }

  foreach (var_11 in var_0._id_3B94)
  level._id_134C0[var_11] = gettime();

  if (!isdefined(self._id_C1F6[var_4]))
  self._id_C1F6[var_4] = 1;
  else
  self._id_C1F6[var_4]++;

  wait(_id_7C76(var_2));
  self notify("play_char_specific_intro");
  self._id_13518 = 0;
}

alias_specific_vo(var_0) {
  self endon("disconnected");
  level endon("game_ended");
  self endon("death");
  self waittill("play_char_specific_intro");
  self playlocalsound(var_0);
}

_id_1B47(var_0, var_1) {
  var_2 = _id_77ED(var_0, var_1);
  return soundexists(var_2);
}

_id_77ED(var_0, var_1, var_2) {
  var_3 = strtok(var_1, "_");

  if (var_3[0] == "ww" || var_3[0] == "dj" || var_3[0] == "ks" || var_3[0] == "el")
  return var_1;
  else
  {
  var_4 = var_0._id_134FD + "plr_" + var_2;

  if (soundexists(var_4))
  return var_4;

  return undefined;
  }
}

_id_77EE(var_0, var_1) {
  if (issubstr(var_1, "ww_") || issubstr(var_1, "dj_") || issubstr(var_1, "p1_") || issubstr(var_1, "p2_") || issubstr(var_1, "p3_") || issubstr(var_1, "p4_") || issubstr(var_1, "jaroslav_anc"))
  return var_1;

  var_2 = getsubstr(var_1, var_0._id_134FD.size);
  return var_0._id_134FD + var_2;
}

_id_7C76(var_0) {
  return lookupsoundlength(var_0) / 1000;
}

_id_C9B8(var_0) {
  if (_id_9D14())
  self waittill("unpause_VO_system");

  if (var_0._id_C9CA > 0)
  wait(var_0._id_C9CA);
}

_id_12C63() {
  self._id_13516._id_134C6 = undefined;
}

_id_12886(var_0, var_1) {
  if (!isdefined(var_0))
  return;

  if (!isdefined(level.players))
  return;

  if (!scripts\engine\utility::_id_9CEE(var_1)) {
  foreach (var_3 in level.players)
  var_3 thread _id_12885(var_0, "zmb_comment_vo", "highest", 10, 0, 0, 1, 100);
  } else {
  foreach (var_3 in level.players)
  var_3 thread _id_1769(var_0, "zmb_comment_vo", 60, 45, 6, 1);
  }
}

_id_12885(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8) {
  level endon("game_ended");
  self endon("death");
  self endon("disconnect");
  var_9 = isdefined(level._id_134B4[var_0]);

  if (var_9) {
  if (isdefined(level._id_134B4[var_0]._id_3C39))
  var_7 = level._id_134B4[var_0]._id_3C39;
  }

  if (!isdefined(var_7))
  var_7 = 100;

  if (randomint(100) > var_7)
  return;

  if (_id_FF79(var_0, var_1, var_2, var_3, var_4, var_5, var_6)) {
  if (var_9 && isdefined(level._id_134B4[var_0]._id_C9CA))
  var_5 = level._id_134B4[var_0]._id_C9CA;

  if (var_9 && isdefined(level._id_134B4[var_0]._id_C555))
  var_6 = level._id_134B4[var_0]._id_C555;

  var_10 = _id_788D(var_0);

  foreach (var_12 in var_10)
  level._id_134C0[var_12] = gettime();

  if (var_9 && isdefined(level._id_134B4[var_0]._id_32A0))
  var_3 = level._id_134B4[var_0]._id_32A0;

  if (var_9 && isdefined(level._id_134B4[var_0]._id_D925))
  var_2 = level._id_134B4[var_0]._id_D925;

  if (var_9 && isdefined(level._id_134B4[var_0]._id_A9CE))
  level._id_134B4[var_0]._id_A9CE = gettime();

  thread _id_1781(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_8);
  }
}

_id_FF79(var_0, var_1, var_2, var_3, var_4, var_5, var_6) {
  if (!isdefined(level._id_134B4[var_0]))
  return 1;

  if (_id_0D44::_id_9C10(self)) {
  if (isdefined(level._id_18E8)) {
  if (![[level._id_18E8]](var_0))
  return 0;
  }
  }

  if (scripts\engine\utility::_id_9CEE(self._id_DCEB)) {
  if (isdefined(level.rave_vo_approve_func)) {
  if (isplayer(self)) {
  if (!self [[level.rave_vo_approve_func]](var_0))
  return 0;
  }
  }
  }

  if (isdefined(level.pap_vo_approve_func)) {
  if (isplayer(self)) {
  if (!self [[level.pap_vo_approve_func]](var_0))
  return 0;
  }
  }

  var_7 = gettime();

  if (isdefined(level._id_134B4[var_0]._id_4613) && isdefined(level._id_134B4[var_0]._id_A9CE)) {
  if (var_7 < level._id_134B4[var_0]._id_A9CE + level._id_134B4[var_0]._id_4613 * 1000)
  return 0;
  }

  var_8 = _id_788D(var_0);

  foreach (var_10 in var_8) {
  var_11 = scripts\engine\utility::ter_op(isdefined(level._id_134B4[var_0]._id_4613), level._id_134B4[var_0]._id_4613, 30);

  if (var_7 < level._id_134C0[var_10] + var_11 * 1000)
  return 0;
  }

  if (isdefined(level._id_134B4[var_0]._id_B44F)) {
  if (!isdefined(self._id_C1F6))
  self._id_C1F6 = [];

  if (!isdefined(self._id_C1F6[var_0]))
  self._id_C1F6[var_0] = 0;

  if (self._id_C1F6[var_0] < level._id_134B4[var_0]._id_B44F)
  return 1;
  else
  return 0;
  }
  else
  return 1;
}

_id_788D(var_0) {
  if (!isdefined(level._id_134BF))
  return [];

  var_1 = getarraykeys(level._id_134BF);
  var_2 = [];

  foreach (var_4 in var_1) {
  if (scripts\engine\utility::array_contains(level._id_134BF[var_4], var_0))
  var_2[var_2.size] = var_4;
  }

  return var_2;
}

_id_FF12(var_0) {
  if (issubstr(var_0, "ww_") || issubstr(var_0, "dj_") || issubstr(var_0, "jaroslav_anc"))
  return 0;
  else
  return 1;
}

should_append_player_suffix(var_0, var_1) {
  if (scripts\engine\utility::_id_9CEE(var_1)) {
  if (issubstr(var_0, "ww_") && issubstr(var_0, "_p"))
  return 1;
  else
  return 0;
  }

  return 0;
}

_id_1781(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7) {
  level endon("game_ended");
  self endon("death");
  self endon("disconnect");

  if (isplayer(self)) {
  if (isdefined(var_1) && isdefined(level._id_134DC[var_1])) {
  if (isdefined(var_7))
  self thread [[level._id_134DC[var_1]]](var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7);
  else
  self thread [[level._id_134DC[var_1]]](var_0, var_1, var_2, var_3, var_4, var_5, var_6);

  return;
  } else {
  var_8 = self._id_134FD + var_0;
  thread _id_CE8A(var_8, var_2, var_3, var_4, var_5, var_6, var_0);
  }
  }
  else if (isdefined(var_1) && isdefined(level._id_134DC[var_1])) {
  if (isdefined(var_7))
  self thread [[level._id_134DC[var_1]]](var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7);
  else
  self thread [[level._id_134DC[var_1]]](var_0, var_1, var_2, var_3, var_4, var_5, var_6);

  return;
  } else {
  var_8 = var_0;
  level thread _id_CE89(var_8, var_2, var_3, var_4, var_5, var_6, var_0);
  }
}

_id_CE89(var_0, var_1, var_2, var_3, var_4, var_5, var_6) {
  foreach (var_8 in level.players)
  var_8 _id_1782(var_0, var_1, var_2, var_3, var_4, var_5, var_6);
}

_id_CE8A(var_0, var_1, var_2, var_3, var_4, var_5, var_6) {
  _id_1782(var_0, var_1, var_2, var_3, var_4, var_5, var_6);
}

_id_1782(var_0, var_1, var_2, var_3, var_4, var_5, var_6) {
  if (!isdefined(self.current_vo_queue))
  self.current_vo_queue = [];

  thread _id_1783(var_0, var_1, var_2, var_3, var_4, var_5, var_6);
}

_id_1783(var_0, var_1, var_2, var_3, var_4, var_5, var_6) {
  var_1 = _id_7D3E(var_1);
  var_7 = _id_4978(var_0, var_2, var_4, var_5, var_6);

  if (_id_FF5B(var_3)) {
  _id_1767(var_7);

  if (_id_9D15())
  _id_9A85();
  }
  else
  _id_1777(var_7, var_1);

  if (!_id_9D15())
  _id_C14E();
}

_id_7D3E(var_0) {
  if (!isdefined(var_0))
  return level._id_134FE[level._id_134FE.size - 1];

  return var_0;
}

_id_4978(var_0, var_1, var_2, var_3, var_4) {
  var_5 = 999;
  var_6 = 1.5;
  var_7 = 3;
  var_8 = spawnstruct();
  var_8._id_1B46 = var_0;
  var_8._id_3B94 = _id_788D(var_0);
  var_8._id_2896 = var_4;

  if (!isdefined(var_1))
  var_1 = var_5;

  var_8._id_698A = gettime() + var_1 * 1000;

  if (!isdefined(var_2))
  var_2 = randomfloatrange(var_6, var_7);

  var_8._id_C9CA = var_2;

  if (scripts\engine\utility::_id_9CEE(var_3))
  var_8._id_C551 = 1;
  else
  var_8._id_C551 = 0;

  return var_8;
}

_id_FF5B(var_0) {
  return isdefined(var_0) && var_0;
}

_id_1767(var_0) {
  self._id_13516._id_9A89 = var_0;
}

_id_9D15() {
  return scripts\engine\utility::_id_9CEE(self._id_13516._id_9C80);
}

_id_9A85() {
  var_0 = _id_790D();

  if (isdefined(var_0))
  self stopolcalsound(var_0);

  self notify("interrupt_current_VO");
}

_id_790D() {
  if (isdefined(self._id_13516)) {
  if (isdefined(self._id_13516._id_134C6)) {
  if (isdefined(self._id_13516._id_134C6._id_1B46))
  return self._id_13516._id_134C6._id_1B46;
  }
  }

  return undefined;
}

_id_1777(var_0, var_1) {
  self._id_13516._id_134FF[var_1][self._id_13516._id_134FF[var_1].size] = var_0;
}

_id_C14E() {
  self notify("play_VO_system");
}

_id_E0A9(var_0, var_1) {
  var_2 = [];

  foreach (var_5, var_4 in self._id_13516._id_134FF[var_1]) {
  if (!(var_4._id_1B46 == self._id_134FD + var_0 || var_4._id_1B46 == self._id_134FD + "plr_" + var_0))
  var_2[var_2.size] = self._id_13516._id_134FF[var_1][var_5];
  }

  self._id_13516._id_134FF[var_1] = var_2;
}

_id_C9CB(var_0) {
  if (var_0.size == 1)
  var_0[0]._id_C9CB = 1;
  else
  {
  foreach (var_2 in var_0)
  var_2._id_C9CB = 1;
  }
}

_id_12BE3(var_0) {
  foreach (var_2 in var_0)
  var_2._id_C9CB = 0;

  foreach (var_2 in var_0)
  var_2 notify("unpause_VO_system");
}

_id_BE3E() {
  level endon("game_ended");

  if (!isdefined(level._id_BE3D)) {
  level._id_BE3D = [];
  level._id_BE3F = [];
  level._id_C9C1 = 0;
  }

  var_0 = 60;

  for (;;) {
  while (level._id_C9C1)
  wait 0.1;

  var_1 = gettime();

  foreach (var_4, var_3 in level._id_BE3D) {
  if (var_1 > var_3._id_BF53) {
  if (isdefined(var_3._id_EC12))
  var_3._id_EC12 _id_12885(var_4, var_3._id_1351C, "low", 3, 0, 0, var_3._id_C551);
  else
  level _id_12885(var_4, var_3._id_1351C, "low", 3, 0, 0, var_3._id_C551);

  var_3._id_11923++;

  if (var_3._id_B468 != -1 && var_3._id_B468 <= var_3._id_11923)
  _id_E01F(var_4);

  var_3._id_BF53 = var_1 + var_3._id_4613 * min(var_3._id_11923, 3) * 1000;
  wait(var_0);
  }
  }

  wait 1;
  }
}

_id_1769(var_0, var_1, var_2, var_3, var_4, var_5) {
  if (!isdefined(level._id_BE3D)) {
  level._id_BE3D = [];
  level._id_BE3F = [];
  level._id_C9C1 = 0;
  }

  if (isdefined(level._id_BE3D[var_0]))
  return;

  if (isdefined(level._id_BE3F[var_0]))
  return;

  if (!isdefined(var_2))
  var_2 = 60;

  if (!isdefined(var_1))
  var_1 = "zmb_comment_vo";

  var_6 = undefined;

  if (isplayer(self))
  var_6 = self;

  var_7 = spawnstruct();
  var_7._id_11923 = 0;
  var_7._id_4613 = var_2;
  var_7._id_1351C = var_1;

  if (isdefined(var_6))
  var_7._id_EC12 = var_6;

  if (isdefined(var_5))
  var_7._id_C551 = var_5;
  else
  var_7._id_C551 = 0;

  if (isdefined(var_3))
  var_7._id_BF53 = gettime() + var_3 * 1000;
  else
  var_7._id_BF53 = 0;

  if (isdefined(var_4))
  var_7._id_B468 = var_4;
  else
  var_7._id_B468 = -1;

  level._id_BE3D[var_0] = var_7;
}

_id_E01F(var_0, var_1) {
  level._id_BE3D = _id_0A77::_id_22B0(level._id_BE3D, var_0, 1);

  if (scripts\engine\utility::_id_9CEE(var_1))
  level._id_BE3F[var_0] = 1;
}

_id_11908(var_0, var_1) {
  level endon(var_0 + "_about_to_play");
  wait(var_1);
  level._id_2001 = 0;
  level notify(var_0 + "_timed_out");
}
