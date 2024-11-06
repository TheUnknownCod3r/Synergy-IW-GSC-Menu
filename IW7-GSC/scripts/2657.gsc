/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2657.gsc
***************************************/

init() {
  scripts\engine\utility::_id_6E39("vo_system_setup_done");
  scripts\engine\utility::_id_6E39("dialogue_done");
  _id_0A6A::_id_98EA();
  level thread _id_C56E();
  level thread _id_EF35();

  if (!isdefined(level._id_134DC))
  level._id_134DC = [];

  if (isdefined(level._id_ABE9))
  level._id_134DC = [[level._id_ABE9]](level._id_134DC);

  level._id_18E8 = ::_id_9D12;
}

blank() {}

_id_3837() {
  if (level.players.size != 4)
  return 0;

  if (_id_0A6A::_id_9D13())
  return 0;

  foreach (var_1 in level.players) {
  if (var_1._id_134FD == "p5_")
  return 0;
  }

  return 1;
}

_id_134DF() {
  if (level._id_2001 || scripts\engine\utility::_id_9CEE(level.elvira_playing))
  return 1;
  else if (level._id_D336)
  return 1;
  else
  {
  foreach (var_1 in level.players) {
  if (scripts\engine\utility::_id_9CEE(var_1._id_13518))
  return 1;
  }
  }

  return 0;
}

_id_7F65(var_0) {
  var_1 = 0;

  for (var_2 = 0; var_2 < var_0.size; var_2++) {
  var_3 = level._id_134CA[var_0[var_2]];
  var_1 = var_1 + _id_0A6A::_id_7C76(var_3 + var_0[var_2]);
  }

  return var_1;
}

_id_7DD2(var_0, var_1) {
  var_2 = [var_0];
  var_3 = var_0;

  for (;;) {
  if (var_1 && isdefined(level._id_134B4[var_3]._id_BF7B)) {
  var_2[var_2.size] = level._id_134B4[var_3]._id_BF7B;
  var_3 = level._id_134B4[var_3]._id_BF7B;
  continue;
  }

  break;
  }

  return var_2;
}

_id_C56E() {
  for (;;) {
  level waittill("connected", var_0);
  var_0 thread onplayerspawned();
  }
}

_id_9D12(var_0) {
  if (isdefined(level._id_134B4[var_0]._id_18E3)) {
  if (int(level._id_134B4[var_0]._id_18E3) == 1)
  return 1;
  else
  return 0;
  }
}

onplayerspawned() {
  self endon("disconnect");
  self waittill("spawned_player");

  if (!level._id_10A56 || level._id_10A56 && !isdefined(level._id_CF34)) {
  if (level._id_10A56)
  level._id_CF34 = 1;
  }

  if (!scripts\engine\utility::_id_6E25("vo_system_setup_done"))
  scripts\engine\utility::_id_6E3E("vo_system_setup_done");
}

_id_D58B(var_0, var_1) {
  if (_id_0A77::_id_9F02() || level._id_C552)
  return;

  var_2 = var_0._id_134FD + "laststand";
  var_0 thread _id_0A6A::_id_CE8A(var_2);
}

_id_D5BB(var_0, var_1) {
  var_2 = var_0._id_134FD + "reviving";
  var_0 thread _id_0A6A::_id_CE8A(var_2);
}

_id_D5BD(var_0) {
  var_1 = 45000;
  var_2 = gettime();

  if (!isdefined(level._id_BF59) || level._id_BF59 < var_2) {
  if (isdefined(level._id_BF59)) {
  if (randomint(100) < 60)
  return;
  }

  level._id_BF59 = var_2 + randomintrange(var_1, var_1 + 5000);
  var_3 = _id_0A77::_id_7833();
  var_4 = scripts\engine\utility::_id_DC6B(var_3);

  if (!isdefined(var_4))
  return;

  switch (var_0) {
  case "scriptable_alien_lynx_jump":
  case "scriptable_alien_tatra_t815_jump":
  var_5 = var_4._id_134FD + "alien_approach_truck";
  var_4 _id_0A6A::_id_CE8A(var_5);
  break;
  }
  }
}

_id_EF35() {
  level endon("game_ended");
  level._id_EF36 = [];

  for (;;) {
  level waittill("scriptable", var_0);
  level thread _id_D5BD(var_0);
  }
}

_id_6A20(var_0) {
  var_0 playlocalsound("mantle_cloth_plr_24_up");
  wait 0.65;

  if (var_0._id_134FD == "p1_")
  var_0 playlocalsound("p1_breathing_better");
  else if (var_0._id_134FD == "p2_")
  var_0 playlocalsound("p2_breathing_better");
  else if (var_0._id_134FD == "p3_")
  var_0 playlocalsound("p3_breathing_better");
  else if (var_0._id_134FD == "p4_")
  var_0 playlocalsound("p4_breathing_better");
  else if (var_0._id_134FD == "p5_")
  var_0 playlocalsound("p5_breathing_better");
  else
  var_0 playlocalsound("p3_breathing_better");
}

_id_CE1D(var_0, var_1, var_2, var_3, var_4, var_5) {
  var_6 = var_0 + "_solo";

  if (soundexists(var_6))
  _id_0A6A::_id_CE8A(var_6);
}

_id_D52E(var_0, var_1, var_2) {
  if (level._id_10A56) {
  if (isdefined(level.players[0]))
  level.players[0] playlocalsound(var_0);
  }
  else if (isdefined(var_1)) {
  if (isdefined(var_2)) {
  for (var_3 = 0; var_3 < level.players.size; var_3++) {
  var_4 = level.players[var_3];

  if (var_4 issplitscreenplayer() && !var_4 isreloading())
  continue;

  if (isdefined(var_4.pers["team"]) && var_4.pers["team"] == var_1 && !_id_9DE5(var_4, var_2))
  var_4 playlocalsound(var_0);
  }

  return;
  }

  for (var_3 = 0; var_3 < level.players.size; var_3++) {
  var_4 = level.players[var_3];

  if (var_4 issplitscreenplayer() && !var_4 isreloading())
  continue;

  if (isdefined(var_4.pers["team"]) && var_4.pers["team"] == var_1)
  var_4 playlocalsound(var_0);
  }

  return;
  }
  else if (isdefined(var_2)) {
  for (var_3 = 0; var_3 < level.players.size; var_3++) {
  if (level.players[var_3] issplitscreenplayer() && !level.players[var_3] isreloading())
  continue;

  if (!_id_9DE5(level.players[var_3], var_2))
  level.players[var_3] playlocalsound(var_0);
  }
  } else {
  for (var_3 = 0; var_3 < level.players.size; var_3++) {
  if (level.players[var_3] issplitscreenplayer() && !level.players[var_3] isreloading())
  continue;

  level.players[var_3] playlocalsound(var_0);
  }
  }
}

_id_9DE5(var_0, var_1) {
  for (var_2 = 0; var_2 < var_1.size; var_2++) {
  if (var_0 == var_1[var_2])
  return 1;
  }

  return 0;
}

_id_D468(var_0, var_1, var_2, var_3, var_4, var_5, var_6) {
  var_7 = _id_0A77::_id_7833();

  if (var_7.size < 1)
  return;

  var_8 = scripts\engine\utility::_id_DC6B(var_7);
  var_9 = var_8._id_134FD + var_0;
  var_8 _id_0A6A::_id_CE8A(var_9);
}

_id_CE7F(var_0, var_1) {
  var_2 = var_0._id_134FD + var_1;
  var_0 thread _id_0A6A::_id_CE8A(var_2, undefined, 2);
}

_id_D5A5(var_0, var_1) {
  if (_id_0A77::_id_9F02() || level._id_C552)
  return;

  var_2 = var_0._id_134FD + "last_stand";
  var_0 thread _id_0A6A::_id_CE8A(var_2, undefined, 1);
}

_id_3D8A() {
  self endon("disconnect");
  self endon("death");

  for (;;) {
  self waittill("last_stand");
  _id_5AF8();
  }
}

_id_3D80() {
  for (;;) {
  level waittill("drill_planted", var_0);
  level notify("vo_notify", "drill_planted", "drill_planted", var_0);
  }
}

_id_5AF8() {
  self endon("disconnect");
  self endon("death");
  self endon("revive");
  wait 4.0;
  level notify("vo_notify", "reaction_casualty_generic", "reaction_casualty_generic", self);
  wait 10.0;

  while (self._id_2A85)
  wait 0.1;

  self notify("vo_notify", "bleeding_out", "bleeding_out", self);
  wait 8.0;

  while (self._id_2A85)
  wait 0.1;

  self notify("vo_notify", "bleeding_out", "bleeding_out", self);
}

_id_CFBC(var_0, var_1, var_2, var_3, var_4, var_5, var_6) {
  if (!isplayer(self))
  return;

  var_7 = _id_0A77::_id_7833();
  var_7 = scripts\engine\utility::array_remove(var_7, self);

  if (var_7.size < 1)
  return;

  var_8 = var_7[0];
  var_9 = var_8._id_134FD + "reaction_casualty_generic";
  var_8 _id_0A6A::_id_CE8A(var_9, undefined, 1);
}

_id_9C13(var_0, var_1) {
  for (var_2 = 0; var_2 < var_0.size; var_2++) {
  if (var_0[var_2] == var_1)
  return 1;
  }

  return 0;
}

_id_4EBA() {
  self endon("disconnect");
  level endon("game_ended");

  for (;;) {
  var_0 = getdvarint("scr_player_vo_prefix", 0);

  if (var_0 != 0) {
  switch (var_0) {
  case 1:
  self._id_134FD = "p1_";
  break;
  case 2:
  self._id_134FD = "p2_";
  break;
  case 3:
  self._id_134FD = "p3_";
  break;
  case 4:
  self._id_134FD = "p4_";
  break;
  case 5:
  self._id_134FD = "p5_";
  break;
  default:
  break;
  }

  setdvar("scr_player_vo_prefix", 0);
  }

  wait 1;
  }
}

_id_1752(var_0, var_1, var_2, var_3, var_4, var_5, var_6) {
  if (!isdefined(level._id_1DF4)) {
  level._id_1DF4 = [];
  level thread _id_1DF4();
  }

  var_7 = spawnstruct();
  var_7._id_1B46 = var_0;
  var_7._id_CDB8 = var_1;
  var_7._id_B73E = var_2;
  var_7._id_B42B = var_3;
  var_7._id_BF53 = 0;
  var_7._id_3C39 = var_5;
  var_7._id_B44D = var_4;

  if (isdefined(var_6))
  var_7._id_BF53 = gettime() + var_6 * 1000;

  level._id_1DF4 = scripts\engine\utility::_id_1756(level._id_1DF4, var_7);
}

_id_1DF4() {
  for (;;) {
  while (level._id_1DF4.size == 0)
  wait 1;

  var_0 = scripts\engine\utility::_id_22A7(level._id_1DF4);

  foreach (var_2 in var_0) {
  if (gettime() < var_2._id_BF53 || isdefined(level._id_572E))
  continue;

  var_3 = randomintrange(var_2._id_B73E, var_2._id_B42B + 1);
  var_4 = var_2._id_3C39;

  if (_id_0A77::_id_203D(var_2._id_CDB8, 4096)) {
  wait 1;
  continue;
  }

  var_5 = _id_0A77::_id_203D(var_2._id_CDB8, var_2._id_B44D);

  if (!var_5 || randomint(100) > var_4) {
  wait 1;
  continue;
  }

  var_6 = var_2._id_1B46;

  if (isarray(var_2._id_1B46))
  var_6 = scripts\engine\utility::_id_DC6B(var_2._id_1B46);

  if (soundexists(var_6))
  playloopsound(var_2._id_CDB8, var_6);

  var_2._id_BF53 = gettime() + var_3 * 1000;
  wait 1;
  }

  wait 1;
  }
}
