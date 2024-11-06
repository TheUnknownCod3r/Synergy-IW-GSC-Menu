/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3488.gsc
***************************************/

init() {
  precachevehicle("attack_littlebird_mp");
  precachemodel("vehicle_apache_mp");
  precachemodel("vehicle_apache_mg");
  precacheturret("apache_minigun_mp");
  precachevehicle("apache_strafe_mp");
  scripts\mp\killstreaks\killstreaks::registerkillstreak("littlebird_flock", ::_id_128ED);
  level._id_8D4F = [];
}

_id_128ED(var_0, var_1) {
  var_2 = 5;

  if (_id_8DB7() || scripts\mp\utility\game::_id_4BD7() >= scripts\mp\utility\game::_id_B4D2() || level._id_6BAA + var_2 >= scripts\mp\utility\game::_id_B4D2()) {
  self iprintlnbold(&"KILLSTREAKS_TOO_MANY_VEHICLES");
  return 0;
  }

  scripts\mp\utility\game::_id_93FA();
  scripts\mp\utility\game::_id_93FA();
  scripts\mp\utility\game::_id_93FA();
  scripts\mp\utility\game::_id_93FA();
  scripts\mp\utility\game::_id_93FA();
  var_3 = _id_F1C9(var_0, "littlebird_flock");

  if (!isdefined(var_3) || !var_3) {
  scripts\mp\utility\game::_id_4FC1();
  scripts\mp\utility\game::_id_4FC1();
  scripts\mp\utility\game::_id_4FC1();
  scripts\mp\utility\game::_id_4FC1();
  scripts\mp\utility\game::_id_4FC1();
  return 0;
  }

  level thread scripts\mp\utility\game::_id_115DE("used_littlebird_flock", self, self.team);
  return 1;
}

_id_8DB7() {
  var_0 = 0;

  for (var_1 = 0; var_1 < level._id_8D4F.size; var_1++) {
  if (isdefined(level._id_8D4F[var_1])) {
  var_0 = 1;
  break;
  }
  }

  return var_0;
}

_id_F1C9(var_0, var_1) {
  self playlocalsound(game["voice"][self.team] + "KS_lbd_inposition");
  scripts\mp\utility\game::_id_1197(var_1, "map_artillery_selector", 1, 500);
  self endon("stop_location_selection");
  self waittill("confirm_location", var_2, var_3);

  if (_id_8DB7() || scripts\mp\utility\game::_id_4BD7() >= scripts\mp\utility\game::_id_B4D2() || level._id_6BAA >= scripts\mp\utility\game::_id_B4D2()) {
  self iprintlnbold(&"KILLSTREAKS_TOO_MANY_VEHICLES");
  self notify("cancel_location");
  return 0;
  }

  level._id_8D4F = [];
  level._id_8D50 = [];
  thread _id_AD8A();
  thread _id_6CDC(var_0, var_2, ::_id_3785, var_3);
  self setblurforplayer(0, 0.3);
  return 1;
}

_id_AD8A() {
  self endon("death");
  self endon("disconnect");
  self playlocalsound(game["voice"][self.team] + "KS_hqr_littlebird");
  wait 3.0;
  self playlocalsound(game["voice"][self.team] + "KS_lbd_inbound");
}

_id_6CDC(var_0, var_1, var_2, var_3) {
  self notify("used");
  wait 0.05;
  thread scripts\mp\utility\game::_id_11079(0);

  if (isdefined(self))
  self thread [[var_2]](var_0, var_1, var_3);
}

_id_3785(var_0, var_1, var_2) {
  level endon("game_ended");
  self endon("disconnect");
  thread _id_89D0();
  var_3 = _id_7EBE(var_1, var_2, 0);
  var_4 = _id_7EBE(var_1, var_2, -520);
  var_5 = _id_7EBE(var_1, var_2, 520);
  var_6 = _id_7EBE(var_1, var_2, -1040);
  var_7 = _id_7EBE(var_1, var_2, 1040);
  level thread _id_58E8(var_0, self, var_3, 0);
  wait 0.3;
  level thread _id_58E8(var_0, self, var_4, 1);
  level thread _id_58E8(var_0, self, var_5, 2);
  wait 0.3;
  level thread _id_58E8(var_0, self, var_6, 3);
  level thread _id_58E8(var_0, self, var_7, 4);
  scripts\mp\matchdata::_id_AFC9("littlebird_flock", var_1);
}

_id_7EBE(var_0, var_1, var_2) {
  var_0 = var_0 * (1, 1, 0);
  var_3 = (0, var_1, 0);
  var_4 = 12000;
  var_5 = [];

  if (isdefined(var_2) && var_2 != 0)
  var_0 = var_0 + anglestoright(var_3) * var_2 + (0, 0, randomint(300));

  var_6 = var_0 + anglestoforward(var_3) * (-1 * var_4);
  var_7 = var_0 + anglestoforward(var_3) * var_4;
  var_8 = scripts\mp\killstreaks\airdrop::_id_7EC0(var_0) + 256;
  var_5["start"] = var_6 + (0, 0, var_8);
  var_5["end"] = var_7 + (0, 0, var_8);
  return var_5;
}

_id_58E8(var_0, var_1, var_2, var_3) {
  level endon("game_ended");

  if (!isdefined(var_1))
  return;

  var_4 = vectortoangles(var_2["end"] - var_2["start"]);
  var_5 = _id_1082F(var_1, var_2["start"], var_4, var_3);
  var_5._id_AC68 = var_0;
  var_5._id_1D41 = 0;
  var_5 thread _id_13B7E();
  var_5 thread _id_139E8();
  var_5 thread _id_6F4A();
  var_5 thread _id_10DBD();
  var_5 thread _id_B9E7();
  var_5 endon("death");
  var_5 setmaxpitchroll(120, 60);
  var_5 vehicle_setspeed(48, 48);
  var_5 setvehgoalpos(var_2["end"], 0);
  var_5 waittill("goal");
  var_5 setmaxpitchroll(30, 40);
  var_5 vehicle_setspeed(32, 32);
  var_5 setvehgoalpos(var_2["start"], 0);
  wait 2;
  var_5 setmaxpitchroll(100, 60);
  var_5 vehicle_setspeed(64, 64);
  var_5 waittill("goal");
  var_5 notify("gone");
  var_5 scripts\mp\killstreaks\helicopter::_id_E139();
}

_id_1082F(var_0, var_1, var_2, var_3) {
  var_4 = spawnhelicopter(var_0, var_1, var_2, "apache_strafe_mp", "vehicle_apache_mp");

  if (!isdefined(var_4))
  return;

  var_4 scripts\mp\killstreaks\helicopter::_id_1852();
  var_4 thread scripts\mp\killstreaks\helicopter::_id_E111();
  var_4.health = 999999;
  var_4.maxhealth = 2000;
  var_4._id_00E1 = 0;
  var_4 setcandamage(1);
  var_4.owner = var_0;
  var_4.team = var_0.team;
  var_4._id_A644 = 0;
  var_4._id_110EA = "littlebird_flock";
  var_4.helitype = "littlebird";
  var_4._id_10955 = ::_id_3758;
  var_5 = spawnturret("misc_turret", var_4.origin, "apache_minigun_mp");
  var_5 linkto(var_4, "tag_turret", (0, 0, 0), (0, 0, 0));
  var_5 setmodel("vehicle_apache_mg");
  var_5.angles = var_4.angles;
  var_5.owner = var_4.owner;
  var_5.team = var_5.owner.team;
  var_5 maketurretinoperable();
  var_5.vehicle = var_4;
  var_6 = var_4.origin + (anglestoforward(var_4.angles) * -200 + anglestoright(var_4.angles) * -200) + (0, 0, 50);
  var_5._id_A63A = spawn("script_model", var_6);
  var_5._id_A63A setscriptmoverkillcam("explosive");
  var_5._id_A63A linkto(var_4, "tag_origin");
  var_4._id_B6BC = var_5;
  var_4._id_B6BC setdefaultdroppitch(0);
  var_4._id_B6BC _meth_830F("auto_nonai");
  var_4._id_B6BC _meth_8336(var_4.owner);

  if (level.teambased)
  var_4._id_B6BC _meth_835E(var_4.owner.team);

  level._id_8D4F[var_3] = var_4;
  return var_4;
}

_id_13B7E() {
  level endon("game_ended");
  self endon("gone");
  self endon("death");
  scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause(60.0);
  self notify("death");
}

_id_B9E7() {
  level endon("game_ended");
  self endon("gone");
  self endon("death");
  self endon("stopFiring");

  for (;;) {
  self waittill("killedPlayer", var_0);
  self._id_A644++;
  level._id_8D50[level._id_8D50.size] = var_0;
  }
}

_id_10DBD() {
  self endon("gone");
  self endon("death");
  self endon("stopFiring");

  for (;;) {
  self._id_B6BC waittill("turret_on_target");
  var_0 = 1;
  var_1 = self._id_B6BC getturrettarget(0);

  foreach (var_3 in level._id_8D50) {
  if (var_1 == var_3) {
  self._id_B6BC cleartargetentity();
  var_0 = 0;
  break;
  }
  }

  if (var_0)
  self._id_B6BC shootturret();
  }
}

_id_89D0() {
  level endon("game_ended");
  self endon("flock_done");
  thread _id_C169();
  self waittill("killstreak_disowned");

  for (var_0 = 0; var_0 < level._id_8D4F.size; var_0++) {
  if (isdefined(level._id_8D4F[var_0]))
  level._id_8D4F[var_0] notify("stopFiring");
  }

  for (var_0 = 0; var_0 < level._id_8D4F.size; var_0++) {
  if (isdefined(level._id_8D4F[var_0])) {
  level._id_8D4F[var_0] notify("death");
  wait 0.1;
  }
  }
}

_id_C169() {
  level endon("game_ended");
  self endon("disconnect");

  if (!scripts\mp\utility\game::bot_is_fireteam_mode()) {
  self endon("joined_team");
  self endon("joined_spectators");
  }

  while (_id_8DB7())
  wait 0.5;

  self notify("flock_done");
}

_id_6F4A() {
  self endon("death");
  level endon("game_ended");

  for (;;) {
  self waittill("damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9);

  if (isdefined(self._id_10955))
  self [[self._id_10955]](undefined, var_1, var_0, var_8, var_4, var_9, var_3, var_2, undefined, undefined, var_5, var_7);
  }
}

_id_3758(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11) {
  if (isdefined(self._id_1D41) && self._id_1D41)
  return;

  if (!isdefined(var_1) || var_1 == self)
  return;

  if (!scripts\mp\weapons::_id_7415(self.owner, var_1))
  return;

  if (isdefined(var_3) && var_3 & level.idflags_penetration)
  self._id_1390E = 1;

  if (isdefined(var_3) && var_3 & level.idflags_no_team_protection)
  self._id_1390F = 1;

  self._id_1390B = 1;
  var_12 = var_2;

  if (isplayer(var_1)) {
  var_1 scripts\mp\damagefeedback::updatedamagefeedback("helicopter");

  if (var_4 == "MOD_RIFLE_BULLET" || var_4 == "MOD_PISTOL_BULLET") {
  if (var_1 scripts\mp\utility\game::_id_12D6("specialty_armorpiercing"))
  var_12 = var_12 + var_2 * level._id_218B;
  }
  }

  if (isdefined(var_1.owner) && isplayer(var_1.owner))
  var_1.owner scripts\mp\damagefeedback::updatedamagefeedback("helicopter");

  if (isdefined(var_5)) {
  switch (var_5) {
  case "remotemissile_projectile_mp":
  case "javelin_mp":
  case "remote_mortar_missile_mp":
  case "stinger_mp":
  case "ac130_40mm_mp":
  case "ac130_105mm_mp":
  self._id_A859 = 1;
  var_12 = self.maxhealth + 1;
  break;
  case "sam_projectile_mp":
  self._id_A859 = 1;
  var_12 = self.maxhealth * 0.25;
  break;
  case "emp_grenade_mp":
  self._id_A859 = 0;
  var_12 = self.maxhealth + 1;
  break;
  }

  scripts\mp\killstreaks\killstreaks::_id_A6A0(var_1, var_5, self);
  }

  self._id_00E1 = self._id_00E1 + var_12;

  if (self._id_00E1 >= self.maxhealth) {
  if (isplayer(var_1) && (!isdefined(self.owner) || var_1 != self.owner)) {
  self._id_1D41 = 1;
  var_1 notify("destroyed_helicopter");
  var_1 notify("destroyed_killstreak", var_5);
  thread scripts\mp\utility\game::_id_115DE("callout_destroyed_helicopter", var_1);
  var_1 thread scripts\mp\utility\game::_id_83B4("kill", var_5, 300);
  }

  self notify("death");
  }
}

_id_139E8() {
  self endon("gone");
  self waittill("death");
  thread scripts\mp\killstreaks\helicopter::_id_AAC7();
}
