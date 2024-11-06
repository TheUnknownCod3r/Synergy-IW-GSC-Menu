/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3457.gsc
***************************************/

init() {
  precacheitem("aamissile_projectile_mp");
  precachemodel("vehicle_av8b_harrier_jet_mp");
  level._id_115C0["axis"] = 0;
  level._id_115C0["allies"] = 0;
  level._id_E5DE = [];
  scripts\mp\killstreaks\killstreaks::registerkillstreak("aastrike", ::_id_128D1);
}

_id_128D1(var_0, var_1) {
  scripts\mp\matchdata::_id_AFC9("aastrike", self.origin);
  thread _id_6CD2(var_0);
  thread scripts\mp\utility\game::_id_115DE("used_aastrike", self, self.team);
  return 1;
}

_id_4CD2() {
  self endon("stopFindingTargets");
  self endon("disconnect");
  self endon("owner_gone");
  self endon("game_ended");

  for (;;) {
  wait 0.05;
  _id_6CC7();
  wait(randomintrange(4, 5));
  }
}

_id_6CC7() {
  self endon("disconnect");
  self endon("owner_gone");
  self endon("game_ended");
  var_0 = [];
  var_1 = [];
  var_2 = [];

  if (isdefined(level._id_AD8B) && level._id_AD8B.size) {
  foreach (var_4 in level._id_AD8B) {
  if (isdefined(var_4.team) && var_4.team != self.team)
  var_0[var_0.size] = var_4;
  }
  }

  if (isdefined(level._id_8DD3) && level._id_8DD3.size) {
  foreach (var_7 in level._id_8DD3) {
  if (var_7.team != self.team)
  var_1[var_1.size] = var_7;
  }
  }

  var_9 = scripts\mp\utility\game::_id_8027(self.team);

  if (isdefined(level._id_1679[var_9])) {
  foreach (var_11 in level._id_12AF3[var_9])
  var_2[var_2.size] = var_11;
  }

  var_13 = 0;

  foreach (var_4 in var_0) {
  wait 3;

  if (var_13 % 2)
  thread _id_6D58(var_4, self.team, 1);
  else
  thread _id_6D58(var_4, self.team, 0);

  var_13++;
  }

  foreach (var_7 in var_1) {
  wait 3;
  thread _id_6D58(var_7, self.team, 1);
  }

  foreach (var_11 in var_2) {
  wait 0.5;
  thread _id_6D58(var_11, self.team, 0);
  }
}

_id_5FB5() {
  self endon("stopFindingTargets");
  var_0 = self.team;

  if (scripts\mp\utility\game::bot_is_fireteam_mode())
  self waittill("killstreak_disowned");
  else
  scripts\engine\utility::_id_13762("killstreak_disowned", "game_ended");

  self notify("owner_gone");
  level._id_115C0[scripts\mp\utility\game::_id_8027(var_0)] = 0;
  level._id_1A94 = undefined;
}

_id_6CD2(var_0) {
  self endon("disconnect");
  self endon("owner_gone");
  self endon("game_ended");
  level._id_115C0[scripts\mp\utility\game::_id_8027(self.team)] = 1;
  level._id_1A94 = self;
  thread _id_5FB5();
  thread _id_4CD2();

  for (var_1 = 0; var_1 < 4; var_1++) {
  wait 6;

  if (var_1 == 1 || var_1 == 3) {
  thread _id_5857(1);
  continue;
  }

  thread _id_5857(0);
  }

  wait 3;
  self notify("stopFindingTargets");
  level._id_115C0[scripts\mp\utility\game::_id_8027(self.team)] = 0;
  level._id_1A94 = undefined;
}

_id_6D58(var_0, var_1, var_2) {
  if (!isdefined(var_0))
  return;

  var_3 = (0, 0, 14000);
  var_4 = (0, 0, 1500);
  var_5 = 15000;
  var_6 = 20000;
  var_7 = var_0.origin;
  var_3 = (0, 0, 1) * var_7 + (0, 0, 1000);
  var_8 = var_0.angles * (0, 1, 0);
  var_9 = anglestoforward(var_8);
  var_10 = var_0.origin + var_4 + var_9 * var_5 * -1;
  var_11 = var_0.origin + var_4 + var_9 * var_6;
  var_12 = scripts\mp\utility\game::_id_1309("aamissile_projectile_mp", var_10 + (0, 0, -75), var_0.origin, self);
  var_12 _meth_8206(var_0);
  var_12 _meth_8204();
  var_13 = scripts\mp\utility\game::_id_1309("aamissile_projectile_mp", var_10 + (randomint(500), randomint(500), -75), var_0.origin, self);
  var_13 _meth_8206(var_0);
  var_13 _meth_8204();

  if (var_2)
  var_14 = spawnplane(self, "script_model", var_10, "compass_objpoint_airstrike_friendly", "compass_objpoint_airstrike_friendly");
  else
  var_14 = spawnplane(self, "script_model", var_10);

  if (self.team == "allies")
  var_14 setmodel("vehicle_av8b_harrier_jet_mp");
  else
  var_14 setmodel("vehicle_av8b_harrier_jet_opfor_mp");

  var_15 = distance(var_10, var_11);
  var_14.angles = vectortoangles(var_11 - var_10);
  var_14 thread _id_1506(var_15);
  var_14 thread _id_D4FA();
  var_15 = distance(var_10, var_11);
  var_14 moveto(var_11 * 2, var_15 / 2000, 0, 0);
  wait(var_15 / 3000);
  var_14 delete();
}

_id_1506(var_0) {
  self playloopsound("veh_aastrike_flyover_loop");
  wait(var_0 / 2 / 2000);
  self stoploopsound();
  self playloopsound("veh_aastrike_flyover_outgoing_loop");
}

_id_5857(var_0) {
  self endon("disconnect");
  var_1 = randomint(level._id_108FB.size - 1);
  var_2 = level._id_108FB[var_1].origin * (1, 1, 0);
  var_3 = 20000;
  var_4 = 20000;
  var_5 = getent("airstrikeheight", "targetname");
  var_6 = (0, 0, var_5.origin[2] + randomintrange(-100, 600));
  var_7 = anglestoforward((0, randomint(45), 0));
  var_8 = var_2 + var_6 + var_7 * var_3 * -1;
  var_9 = var_2 + var_6 + var_7 * var_4;
  var_10 = var_8 + (randomintrange(400, 500), randomintrange(400, 500), randomintrange(200, 300));
  var_11 = var_9 + (randomintrange(400, 500), randomintrange(400, 500), randomintrange(200, 300));

  if (var_0)
  var_12 = spawnplane(self, "script_model", var_8, "hud_minimap_harrier_green", "hud_minimap_harrier_red");
  else
  var_12 = spawnplane(self, "script_model", var_8);

  var_13 = spawnplane(self, "script_model", var_10);

  if (self.team == "allies") {
  var_12 setmodel("vehicle_av8b_harrier_jet_mp");
  var_13 setmodel("vehicle_av8b_harrier_jet_mp");
  } else {
  var_12 setmodel("vehicle_av8b_harrier_jet_opfor_mp");
  var_13 setmodel("vehicle_av8b_harrier_jet_opfor_mp");
  }

  var_12.angles = vectortoangles(var_9 - var_8);
  var_12 playloopsound("veh_aastrike_flyover_loop");
  var_12 thread _id_D4FA();
  var_13.angles = vectortoangles(var_9 - var_10);
  var_13 thread _id_D4FA();
  var_14 = distance(var_8, var_9);
  var_12 moveto(var_9 * 2, var_14 / 1800, 0, 0);
  wait(randomfloatrange(0.25, 0.5));
  var_13 moveto(var_11 * 2, var_14 / 1800, 0, 0);
  wait(var_14 / 1600);
  var_12 delete();
  var_13 delete();
}

_id_D4FA() {
  self endon("death");
  wait 0.5;
  playfxontag(level._id_7545, self, "tag_engine_right");
  wait 0.5;
  playfxontag(level._id_7545, self, "tag_engine_left");
  wait 0.5;
  playfxontag(level._id_7546, self, "tag_right_wingtip");
  wait 0.5;
  playfxontag(level._id_7546, self, "tag_left_wingtip");
}
