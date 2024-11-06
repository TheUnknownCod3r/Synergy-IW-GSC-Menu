/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2915.gsc
***************************************/

_id_9768() {
  self._id_10E53["kills"] = 0;
  self._id_10E53["kills_melee"] = 0;
  self._id_10E53["kills_explosives"] = 0;
  self._id_10E53["kills_juggernaut"] = 0;
  self._id_10E53["kills_vehicle"] = 0;
  self._id_10E53["kills_sentry"] = 0;
  self._id_10E53["headshots"] = 0;
  self._id_10E53["shots_fired"] = 0;
  self._id_10E53["shots_hit"] = 0;
  self._id_10E53["weapon"] = [];
  thread _id_FF05();
}

_id_13901() {
  if (isdefined(self._id_54CA) && self._id_54CA)
  return 1;

  if (!isdefined(self._id_00DD))
  return 0;

  return self._id_00DD == "helmet" || self._id_00DD == "head" || self._id_00DD == "neck";
}

_id_DEBD(var_0, var_1, var_2, var_3) {
  var_4 = self;

  if (isdefined(self.owner))
  var_4 = self.owner;

  if (!isplayer(var_4)) {
  if (isdefined(level._id_D5ED) && level._id_D5ED)
  var_4 = level.players[randomint(level.players.size)];
  }

  if (!isplayer(var_4))
  return;

  if (isdefined(level._id_10259) && isdefined(var_0._id_5BD6) && var_0._id_5BD6)
  return;

  var_4._id_10E53["kills"]++;

  if (isdefined(var_0)) {
  if (var_0 _id_13901())
  var_4._id_10E53["headshots"]++;

  if (isdefined(var_0._id_A4A3))
  var_4._id_10E53["kills_juggernaut"]++;

  if (isdefined(var_0._id_9F45))
  var_4._id_10E53["kills_sentry"]++;

  if (var_0.code_classname == "script_vehicle") {
  var_4._id_10E53["kills_vehicle"]++;

  if (isdefined(var_0._id_E4FB)) {
  foreach (var_6 in var_0._id_E4FB) {
  if (isdefined(var_6))
  var_4 _id_DEBD(var_6, var_1, var_2, var_3);
  }
  }
  }
  }

  if (_id_3B9F(var_1))
  var_4._id_10E53["kills_explosives"]++;

  if (!isdefined(var_2))
  var_2 = var_4 getcurrentweapon();

  if (issubstr(tolower(var_1), "melee")) {
  var_4._id_10E53["kills_melee"]++;

  if (weaponinventorytype(var_2) == "primary")
  return;
  }

  if (var_4 _id_9C49(var_2))
  var_4 _id_DEC5(var_2);

  var_4._id_10E53["weapon"][var_2].kills++;
}

_id_DED8() {
  if (!isplayer(self))
  return;

  if (isdefined(self._id_DEF6))
  return;

  self._id_DEF6 = 1;
  self._id_10E53["shots_hit"]++;
  var_0 = self getcurrentweapon();

  if (_id_9C49(var_0))
  _id_DEC5(var_0);

  self._id_10E53["weapon"][var_0]._id_FF06++;
  waittillframeend;
  self._id_DEF6 = undefined;
}

_id_FF05() {
  self endon("death");

  for (;;) {
  self waittill("weapon_fired");
  var_0 = self getcurrentweapon();

  if (!isdefined(var_0) || !_id_0B91::_id_9F0E(var_0))
  continue;

  self._id_10E53["shots_fired"]++;

  if (_id_9C49(var_0))
  _id_DEC5(var_0);

  self._id_10E53["weapon"][var_0]._id_FF04++;
  }
}

_id_9C49(var_0) {
  if (isdefined(self._id_10E53["weapon"][var_0]))
  return 0;

  return 1;
}

_id_3B9F(var_0) {
  var_0 = tolower(var_0);

  switch (var_0) {
  case "splash":
  case "mod_explosive":
  case "mod_projectile_splash":
  case "mod_projectile":
  case "mod_grenade_splash":
  case "mod_grenade":
  return 1;
  default:
  return 0;
  }

  return 0;
}

_id_DEC5(var_0) {
  self._id_10E53["weapon"][var_0] = spawnstruct();
  self._id_10E53["weapon"][var_0].name = var_0;
  self._id_10E53["weapon"][var_0]._id_FF04 = 0;
  self._id_10E53["weapon"][var_0]._id_FF06 = 0;
  self._id_10E53["weapon"][var_0].kills = 0;
}

_id_F5B2() {
  var_0 = 1;

  foreach (var_2 in level.players) {
  setdvar("stats_" + var_0 + "_kills_melee", var_2._id_10E53["kills_melee"]);
  setdvar("stats_" + var_0 + "_kills_juggernaut", var_2._id_10E53["kills_juggernaut"]);
  setdvar("stats_" + var_0 + "_kills_explosives", var_2._id_10E53["kills_explosives"]);
  setdvar("stats_" + var_0 + "_kills_vehicle", var_2._id_10E53["kills_vehicle"]);
  setdvar("stats_" + var_0 + "_kills_sentry", var_2._id_10E53["kills_sentry"]);
  var_3 = var_2 _id_7867(5);

  foreach (var_5 in var_3) {
  var_5._id_0010 = 0;

  if (var_5._id_FF04 > 0)
  var_5._id_0010 = int(var_5._id_FF06 / var_5._id_FF04 * 100);
  }

  for (var_7 = 1; var_7 < 6; var_7++) {
  setdvar("stats_" + var_0 + "_weapon" + var_7 + "_name", " ");
  setdvar("stats_" + var_0 + "_weapon" + var_7 + "_kills", " ");
  setdvar("stats_" + var_0 + "_weapon" + var_7 + "_shots", " ");
  setdvar("stats_" + var_0 + "_weapon" + var_7 + "_accuracy", " ");
  }

  for (var_7 = 0; var_7 < var_3.size; var_7++) {
  if (!isdefined(var_3[var_7]))
  break;

  setdvar("stats_" + var_0 + "_weapon" + (var_7 + 1) + "_name", var_3[var_7].name);
  setdvar("stats_" + var_0 + "_weapon" + (var_7 + 1) + "_kills", var_3[var_7].kills);
  setdvar("stats_" + var_0 + "_weapon" + (var_7 + 1) + "_shots", var_3[var_7]._id_FF04);
  setdvar("stats_" + var_0 + "_weapon" + (var_7 + 1) + "_accuracy", var_3[var_7]._id_0010 + "%");
  }

  var_0++;
  }
}

_id_7867(var_0) {
  var_1 = [];

  for (var_2 = 0; var_2 < var_0; var_2++)
  var_1[var_2] = _id_7D73(var_1);

  return var_1;
}

_id_7D73(var_0) {
  if (!isdefined(var_0))
  var_0 = [];

  var_1 = undefined;

  foreach (var_3 in self._id_10E53["weapon"]) {
  var_4 = 0;

  foreach (var_6 in var_0) {
  if (var_3.name == var_6.name) {
  var_4 = 1;
  break;
  }
  }

  if (var_4)
  continue;

  if (!isdefined(var_1)) {
  var_1 = var_3;
  continue;
  }

  if (var_3.kills > var_1.kills)
  var_1 = var_3;
  }

  return var_1;
}
