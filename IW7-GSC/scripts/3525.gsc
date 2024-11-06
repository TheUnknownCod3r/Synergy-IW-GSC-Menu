/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3525.gsc
***************************************/

_id_98D7() {
  level._id_115ED["ammo_regen"] = spawnstruct();
  level._id_115ED["ammo_regen"]._id_118A3 = 1;
  level._id_115ED["ammo_regen"]._id_5F36 = 60;
  level._id_115ED["ammo_regen"]._id_6369 = "ammo_regen_complete";
  level._id_115ED["super_speed"] = spawnstruct();
  level._id_115ED["super_speed"]._id_118A3 = 2;
  level._id_115ED["super_speed"]._id_5F36 = 30;
  level._id_115ED["super_speed"]._id_6369 = "super_speed_complete";
  level._id_115ED["jugg_squad"] = spawnstruct();
  level._id_115ED["jugg_squad"]._id_118A3 = 3;
  level._id_115ED["jugg_squad"]._id_5F36 = 15;
  level._id_115ED["jugg_squad"]._id_6369 = "jugg_squad_complete";
  var_0 = scripts\mp\utility\game::_id_8105();
  level._id_D410 = [];
  level._id_D410["axis"] = 0;
  level._id_D410["allies"] = 0;
  level._id_115EC = [];
  level._id_115EC["axis"] = 0;
  level._id_115EC["allies"] = 0;
  level thread _id_13AF9();
  level thread _id_11B02();
  setomnvar("ui_teamstreak_threshold", 4500);
  game["dialog"]["enemy_jugg"] = "enemy_juggernaut";
  game["dialog"]["friendly_jugg"] = "friendly_juggernaut";
}

_id_13AF9() {
  level endon("game_ended");
  level endon("stop_teamstreaks");

  for (;;) {
  level waittill("connected", var_0);
  var_0 thread _id_13AFC();
  var_0 thread _id_13B0C();
  }
}

_id_13AFC() {
  level endon("game_ended");
  self endon("disconnect");

  for (;;) {
  self waittill("death");

  if (self.team != "spectator") {
  if (!level._id_115EC[self.team]) {
  var_0 = level._id_D410[self.team] - 30;

  if (var_0 <= 0)
  level._id_D410[self.team] = 0;
  else
  level._id_D410[self.team] = level._id_D410[self.team] - 30;

  _id_12F3D(self.team, level._id_D410[self.team]);
  }
  }
  }
}

_id_13B0C() {
  level endon("game_ended");
  self endon("disconnect");

  for (;;) {
  self waittill("spawned_player");
  wait 1;

  if (self.team != "spectator")
  self setclientomnvar("ui_teamstreak_score", level._id_D410[self.team]);
  }
}

_id_11B02() {
  level endon("game_ended");
  level endon("stop_teamstreaks");

  for (;;) {
  level waittill("update_player_score", var_0, var_1);

  if (!isdefined(var_0))
  continue;

  if (!level._id_115EC[var_0.team]) {
  level._id_D410[var_0.team] = level._id_D410[var_0.team] + var_1;
  _id_12F3D(var_0.team, level._id_D410[var_0.team]);

  if (level._id_D410[var_0.team] >= 4500) {
  var_2 = _id_81BB(3);
  var_3 = level._id_115ED[var_2]._id_5F36;
  var_4 = level._id_115ED[var_2]._id_6369;

  foreach (var_6 in level.players) {
  if (var_6.team != var_0.team) {
  var_6 scripts\mp\utility\game::leaderdialogonplayer("enemy_jugg");
  continue;
  }

  var_6 _id_10DF9(var_2, var_3, var_4);
  var_6 scripts\mp\utility\game::leaderdialogonplayer("friendly_jugg");
  }

  level._id_115EC[var_0.team] = 1;
  }
  }
  }
}

_id_81BB(var_0) {
  var_1 = undefined;

  foreach (var_4, var_3 in level._id_115ED) {
  if (var_3._id_118A3 != var_0)
  continue;

  var_1 = var_4;
  break;
  }

  return var_1;
}

_id_12F3D(var_0, var_1) {
  foreach (var_3 in level.players) {
  if (var_3.team != var_0)
  continue;

  var_3 setclientomnvar("ui_teamstreak_score", var_1);
  }
}

_id_10DF9(var_0, var_1, var_2) {
  thread _id_13B7D(var_1, var_2);

  switch (var_0) {
  case "ammo_regen":
  thread _id_1E4A(var_2);
  break;
  case "super_speed":
  _id_11266(var_2);
  break;
  case "jugg_squad":
  _id_A4AE(var_2);
  break;
  default:
  break;
  }
}

_id_13B7D(var_0, var_1) {
  self endon("disconnect");
  wait(var_0);
  self notify(var_1);
}

_id_1E4A(var_0) {
  self endon("disconnect");
  self endon(var_0);

  for (;;) {
  var_1 = self getcurrentprimaryweapon();
  var_2 = self getweaponammoclip(var_1);

  if (var_2 != weaponclipsize(var_1))
  self setweaponammoclip(var_1, var_2 + 1);

  wait 0.5;
  }
}

_id_11266(var_0) {
  thread _id_13B70(var_0);
  scripts\mp\utility\game::giveperk("specialty_fastreload");
  scripts\mp\utility\game::giveperk("specialty_quickdraw");
  scripts\mp\utility\game::giveperk("specialty_fastoffhand");
  scripts\mp\utility\game::giveperk("specialty_fastsprintrecovery");
  scripts\mp\utility\game::giveperk("specialty_marathon");
  scripts\mp\utility\game::giveperk("specialty_quickswap");
  scripts\mp\utility\game::giveperk("specialty_stalker");
  self._id_BCF6 = 1.2;
  scripts\mp\weapons::_id_12ED5();
}

_id_13B70(var_0) {
  self endon(var_0);
  self waittill("spawned_player");
  _id_11266(var_0);
}

_id_A4AE(var_0) {
  var_1 = _id_80BE();
  scripts\mp\killstreaks\juggernaut::_id_8371(var_1);
}

_id_80BE() {
  var_0 = [];
  var_0[0] = "juggernaut";
  var_0[1] = "juggernaut_recon";
  var_0[2] = "juggernaut_maniac";
  var_1 = randomint(3);
  return var_0[var_1];
}
