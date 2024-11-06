/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3480.gsc
***************************************/

init() {}

_id_C56E() {
  for (;;) {
  level waittill("connected", var_0);
  var_0 thread onplayerspawned();
  }
}

onplayerspawned() {
  self endon("disconnect");

  for (;;) {
  self waittill("spawned_player");

  if (level.teambased && level._id_115C9[self.team] || !level.teambased && isdefined(level._id_61AD) && level._id_61AD != self)
  self _meth_82DA(1);
  }
}

_id_618B(var_0, var_1) {
  var_2 = self.pers["team"];

  if (level._id_BDCC)
  thread _id_6166(var_2);
  else if (level.teambased) {
  var_3 = level._id_C74B[var_2];
  thread _id_6165(var_3);
  }
  else
  thread _id_6164(self);

  scripts\mp\matchdata::_id_AFC9("emp", self.origin);
  self notify("used_emp");
  return 1;
}

_id_6166(var_0) {
  level endon("game_ended");
  thread scripts\mp\utility\game::_id_115DE("used_emp", self);
  level notify("EMP_JamTeam" + var_0);
  level endon("EMP_JamTeam" + var_0);

  foreach (var_2 in level.players) {
  var_2 playlocalsound("emp_activate");

  if (var_2.team == var_0)
  continue;

  if (var_2 scripts\mp\utility\game::_id_12D6("specialty_localjammer"))
  var_2 _meth_807C();
  }

  visionsetnaked("coup_sunblind", 0.1);
  thread _id_619F();
  wait 0.1;
  visionsetnaked("coup_sunblind", 0);
  visionsetnaked("", 3.0);

  for (var_4 = 0; var_4 < level._id_115DA.size; var_4++) {
  if (var_0 != level._id_115DA[var_4])
  level._id_115C9[level._id_115DA[var_4]] = 1;
  }

  level notify("emp_update");

  for (var_4 = 0; var_4 < level._id_115DA.size; var_4++) {
  if (var_0 != level._id_115DA[var_4])
  level _id_52CA(self, level._id_115DA[var_4]);
  }

  level thread _id_A577();
  scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause(level._id_61B5);

  for (var_4 = 0; var_4 < level._id_115DA.size; var_4++) {
  if (var_0 != level._id_115DA[var_4])
  level._id_115C9[level._id_115DA[var_4]] = 0;
  }

  foreach (var_2 in level.players) {
  if (var_2.team == var_0)
  continue;

  if (var_2 scripts\mp\utility\game::_id_12D6("specialty_localjammer"))
  var_2 _meth_81F4();
  }

  level notify("emp_update");
}

_id_6165(var_0) {
  level endon("game_ended");
  thread scripts\mp\utility\game::_id_115DE("used_emp", self);
  level notify("EMP_JamTeam" + var_0);
  level endon("EMP_JamTeam" + var_0);

  foreach (var_2 in level.players) {
  var_2 playlocalsound("emp_activate");

  if (var_2.team != var_0)
  continue;

  if (var_2 scripts\mp\utility\game::_id_12D6("specialty_localjammer"))
  var_2 _meth_807C();

  var_2 visionsetnakedforplayer("coup_sunblind", 0.1);
  }

  thread _id_619F();
  wait 0.1;
  visionsetnaked("coup_sunblind", 0);
  visionsetnaked("", 3.0);
  level._id_115C9[var_0] = 1;
  level notify("emp_update");
  level _id_52CA(self, var_0);
  level thread _id_A577();
  scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause(level._id_61B5);
  level._id_115C9[var_0] = 0;

  foreach (var_2 in level.players) {
  if (var_2.team != var_0)
  continue;

  if (var_2 scripts\mp\utility\game::_id_12D6("specialty_localjammer"))
  var_2 _meth_81F4();
  }

  level notify("emp_update");
}

_id_6164(var_0) {
  level notify("EMP_JamPlayers");
  level endon("EMP_JamPlayers");

  foreach (var_2 in level.players) {
  var_2 playlocalsound("emp_activate");

  if (var_2 == var_0)
  continue;

  if (var_2 scripts\mp\utility\game::_id_12D6("specialty_localjammer"))
  var_2 _meth_807C();
  }

  visionsetnaked("coup_sunblind", 0.1);
  thread _id_619F();
  wait 0.1;
  visionsetnaked("coup_sunblind", 0);
  visionsetnaked("", 3.0);
  level notify("emp_update");
  level._id_61AD = var_0;
  level._id_61AD thread _id_61AE();
  level _id_52CA(var_0);
  level notify("emp_update");
  level thread _id_A577();
  scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause(level._id_61B5);

  foreach (var_2 in level.players) {
  if (var_2 == var_0)
  continue;

  if (var_2 scripts\mp\utility\game::_id_12D6("specialty_localjammer"))
  var_2 _meth_81F4();
  }

  level._id_61AD = undefined;
  level notify("emp_update");
  level notify("emp_ended");
}

_id_A577() {
  level notify("keepEMPTimeRemaining");
  level endon("keepEMPTimeRemaining");
  level endon("emp_ended");

  for (level._id_61B6 = int(level._id_61B5); level._id_61B6; level._id_61B6--)
  wait 1.0;
}

_id_61AE() {
  level endon("EMP_JamPlayers");
  level endon("emp_ended");
  self waittill("disconnect");
  level notify("emp_update");
}

_id_619F() {
  foreach (var_1 in level.players) {
  var_2 = anglestoforward(var_1.angles);
  var_2 = (var_2[0], var_2[1], 0);
  var_2 = vectornormalize(var_2);
  var_3 = 20000;
  var_4 = spawn("script_model", var_1.origin + (0, 0, 8000) + var_2 * var_3);
  var_4 setmodel("tag_origin");
  var_4.angles = var_4.angles + (270, 0, 0);
  var_4 thread _id_619E(var_1);
  }
}

_id_619E(var_0) {
  var_0 endon("disconnect");
  wait 0.5;
  playfxontagforclients(level._effect["emp_flash"], self, "tag_origin", var_0);
}

_id_6187() {
  level endon("game_ended");

  for (;;) {
  level scripts\engine\utility::_id_13762("joined_team", "emp_update");

  foreach (var_1 in level.players) {
  if (var_1.team == "spectator")
  continue;

  if (!level._id_115C9[var_1.team] && !var_1 scripts\mp\killstreaks\emp_common::_id_9D29()) {
  var_1 _id_626B(0);
  continue;
  }

  var_1 _id_626B(1);
  }
  }
}

_id_617C() {
  level endon("game_ended");

  for (;;) {
  level scripts\engine\utility::_id_13762("joined_team", "emp_update");

  foreach (var_1 in level.players) {
  if (var_1.team == "spectator")
  continue;

  if (isdefined(level._id_61AD) && level._id_61AD != var_1) {
  var_1 _id_626B(1);
  continue;
  }

  if (!var_1 scripts\mp\killstreaks\emp_common::_id_9D29())
  var_1 _id_626B(0);
  }
  }
}

_id_52CA(var_0, var_1) {
  thread _id_52C2(var_0, var_1);
  thread _id_52C4(var_0, var_1);
  thread _id_52C7(var_0, var_1);
  thread _id_52C6(var_0, var_1);
  thread _id_52C8(var_0, var_1);
  thread _id_52C3(var_0, var_1);
  thread _id_52C9(var_0, var_1);
  thread _id_52C0(var_0, var_1);
  thread _id_52C1(var_0, var_1);
  thread _id_532B(var_0, var_1, level._id_DF74);
  thread _id_532B(var_0, var_1, level._id_12F81);
}

_id_532B(var_0, var_1, var_2) {
  var_3 = "MOD_EXPLOSIVE";
  var_4 = "killstreak_emp_mp";
  var_5 = 5000;
  var_6 = (0, 0, 0);
  var_7 = (0, 0, 0);
  var_8 = "";
  var_9 = "";
  var_10 = "";
  var_11 = undefined;

  foreach (var_13 in var_2) {
  if (level.teambased && isdefined(var_1)) {
  if (isdefined(var_13.team) && var_13.team != var_1)
  continue;
  }
  else if (isdefined(var_13.owner) && var_13.owner == var_0)
  continue;

  var_13 notify("damage", var_5, var_0, var_6, var_7, var_3, var_8, var_9, var_10, var_11, var_4);
  wait 0.05;
  }
}

_id_52C2(var_0, var_1) {
  _id_532B(var_0, var_1, level._id_8DD3);
}

_id_52C4(var_0, var_1) {
  _id_532B(var_0, var_1, level._id_AD8B);
}

_id_52C7(var_0, var_1) {
  _id_532B(var_0, var_1, level._id_12A83);
}

_id_52C6(var_0, var_1) {
  var_2 = "MOD_EXPLOSIVE";
  var_3 = "killstreak_emp_mp";
  var_4 = 5000;
  var_5 = (0, 0, 0);
  var_6 = (0, 0, 0);
  var_7 = "";
  var_8 = "";
  var_9 = "";
  var_10 = undefined;

  foreach (var_12 in level._id_E5DE) {
  if (level.teambased && isdefined(var_1)) {
  if (isdefined(var_12.team) && var_12.team != var_1)
  continue;
  }
  else if (isdefined(var_12.owner) && var_12.owner == var_0)
  continue;

  playfx(level._id_DF7E["explode"], var_12.origin);
  var_12 delete();
  wait 0.05;
  }
}

_id_52C8(var_0, var_1) {
  var_2 = level._id_12AF3;

  if (level.teambased && isdefined(var_1))
  var_2 = level._id_12AF3[var_1];

  _id_532B(var_0, var_1, var_2);
}

_id_52C3(var_0, var_1) {
  _id_532B(var_0, var_1, level._id_935F);
}

_id_52C9(var_0, var_1) {
  _id_532B(var_0, var_1, level._id_12B14);
}

_id_52C0(var_0, var_1) {
  var_2 = "MOD_EXPLOSIVE";
  var_3 = "killstreak_emp_mp";
  var_4 = 5000;
  var_5 = (0, 0, 0);
  var_6 = (0, 0, 0);
  var_7 = "";
  var_8 = "";
  var_9 = "";
  var_10 = undefined;

  if (level.teambased && isdefined(var_1)) {
  if (isdefined(level._id_1541) && isdefined(level._id_1541.team) && level._id_1541.team == var_1)
  level._id_1537._id_CC44 notify("damage", var_4, var_0, var_5, var_6, var_2, var_7, var_8, var_9, var_10, var_3);
  }
  else if (isdefined(level._id_1541)) {
  if (!isdefined(level._id_1537.owner) || isdefined(level._id_1537.owner) && level._id_1537.owner != var_0)
  level._id_1537._id_CC44 notify("damage", var_4, var_0, var_5, var_6, var_2, var_7, var_8, var_9, var_10, var_3);
  }
}

_id_52C1(var_0, var_1) {
  _id_532B(var_0, var_1, level._id_27EF);
}

_id_626B(var_0) {
  self _meth_82DA(var_0);
  var_1 = 0;

  if (var_0)
  var_1 = 1;

  thread scripts\mp\killstreaks\emp_common::_id_10D95();
}
