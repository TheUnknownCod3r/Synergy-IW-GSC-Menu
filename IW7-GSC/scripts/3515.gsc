/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3515.gsc
***************************************/

init() {
  level._id_DF70["laserTarget"] = loadfx("vfx/misc/laser_glow");
  level._id_DF70["missileExplode"] = loadfx("vfx/core/expl/bouncing_betty_explosion");
  level._id_DF70["deathExplode"] = loadfx("vfx/core/expl/uav_advanced_death");
  scripts\mp\killstreaks\killstreaks::registerkillstreak("remote_mortar", ::_id_128FD);
  level._id_DF6F = undefined;
}

_id_128FD(var_0, var_1) {
  if (isdefined(level._id_DF6F)) {
  self iprintlnbold(&"KILLSTREAKS_AIR_SPACE_TOO_CROWDED");
  return 0;
  }

  scripts\mp\utility\game::_id_FB09("remote_mortar");
  var_2 = scripts\mp\killstreaks\killstreaks::_id_98C2("remote_mortar");

  if (var_2 != "success") {
  if (var_2 != "disconnect")
  scripts\mp\utility\game::_id_41E9();

  return 0;
  }
  else if (isdefined(level._id_DF6F)) {
  self iprintlnbold(&"KILLSTREAKS_AIR_SPACE_TOO_CROWDED");
  scripts\mp\utility\game::_id_41E9();
  return 0;
  }

  scripts\mp\matchdata::_id_AFC9("remote_mortar", self.origin);
  return _id_10DE9(var_0);
}

_id_10DE9(var_0) {
  var_1 = _id_10906(var_0, self);

  if (!isdefined(var_1))
  return 0;

  level._id_DF6F = var_1;
  _id_DF87(var_1);
  thread scripts\mp\utility\game::_id_115DE("used_remote_mortar", self);
  return 1;
}

_id_10906(var_0, var_1) {
  var_2 = spawnplane(var_1, "script_model", level._id_12AF5 gettagorigin("tag_origin"), "compass_objpoint_reaper_friendly", "compass_objpoint_reaper_enemy");

  if (!isdefined(var_2))
  return undefined;

  var_2 setmodel("vehicle_predator_b");
  var_2._id_AC68 = var_0;
  var_2.team = var_1.team;
  var_2.owner = var_1;
  var_2._id_C22B = 1;
  var_2 setcandamage(1);
  var_2 thread _id_4D72();
  var_2.helitype = "remote_mortar";
  var_2._id_12AFA = "remote_mortar";
  var_2 scripts\mp\killstreaks\uav::_id_1867();
  var_3 = 6300;
  var_4 = randomint(360);
  var_5 = 6100;
  var_6 = cos(var_4) * var_5;
  var_7 = sin(var_4) * var_5;
  var_8 = vectornormalize((var_6, var_7, var_3));
  var_8 = var_8 * 6100;
  var_2 linkto(level._id_12AF5, "tag_origin", var_8, (0, var_4 - 90, 10));
  var_1 setclientdvar("ui_reaper_targetDistance", -1);
  var_1 setclientdvar("ui_reaper_ammoCount", 14);
  var_2 thread _id_898E(var_1);
  var_2 thread _id_89F3(var_1);
  var_2 thread _id_89CE(var_1);
  var_2 thread _id_89CF(var_1);
  var_2 thread _id_89B7();
  var_2 thread _id_89B6();
  return var_2;
}

_id_B011(var_0) {
  self endon("disconnect");
  level endon("game_ended");
  var_0 endon("death");
  wait 0.05;
  var_1 = vectortoangles(level._id_12AF5.origin - var_0 gettagorigin("tag_player"));
  self setplayerangles(var_1);
}

_id_DF87(var_0) {
  scripts\mp\utility\game::_id_12C6("mortar_remote_mp");
  scripts\mp\utility\game::_id_141A("mortar_remote_mp");
  thread _id_13714(1.0, var_0);
  thread scripts\mp\utility\game::_id_DF2E(var_0);

  if (getdvarint("camera_thirdPerson"))
  scripts\mp\utility\game::_id_F887(0);

  self _meth_823E(var_0, "tag_player", 1.0, 40, 40, 25, 40);
  thread _id_B011(var_0);
  scripts\engine\utility::_id_1C76(0);
  thread _id_DF88(var_0);
  thread _id_DF7A(var_0);
  thread _id_DFB3(var_0);
}

_id_13714(var_0, var_1) {
  self endon("disconnect");
  var_1 endon("death");
  wait(var_0);
  self _meth_8401(level._id_1537._id_65D1, 0);
  self._id_AA42 = level._id_1537._id_65D1;
  self _meth_83BE();
}

_id_DF88(var_0) {
  level endon("game_ended");
  self endon("disconnect");
  var_0 endon("remote_done");
  var_0 endon("death");
  var_0._id_1155F = spawnfx(level._id_DF70["laserTarget"], (0, 0, 0));

  for (;;) {
  var_1 = self geteye();
  var_2 = anglestoforward(self getplayerangles());
  var_3 = var_1 + var_2 * 15000;
  var_4 = bullettrace(var_1, var_3, 0, var_0._id_1155F);

  if (isdefined(var_4["position"])) {
  var_0._id_1155F.origin = var_4["position"];
  triggerfx(var_0._id_1155F);
  }

  wait 0.05;
  }
}

_id_DF7A(var_0) {
  level endon("game_ended");
  self endon("disconnect");
  var_0 endon("remote_done");
  var_0 endon("death");
  var_1 = gettime();
  var_2 = var_1 - 2200;
  var_3 = 14;
  self._id_6DB6 = 0;

  for (;;) {
  var_1 = gettime();

  if (self attackbuttonpressed() && var_1 - var_2 > 3000) {
  var_3--;
  self setclientdvar("ui_reaper_ammoCount", var_3);
  var_2 = var_1;
  self._id_6DB6 = 1;
  self playlocalsound("reaper_fire");
  self playrumbleonentity("damage_heavy");
  var_4 = self geteye();
  var_5 = anglestoforward(self getplayerangles());
  var_6 = anglestoright(self getplayerangles());
  var_7 = var_4 + var_5 * 100 + var_6 * -100;
  var_8 = scripts\mp\utility\game::_id_1309("remote_mortar_missile_mp", var_7, var_0._id_1155F.origin, self);
  var_8.type = "remote_mortar";
  earthquake(0.3, 0.5, var_4, 256);
  var_8 _meth_8206(var_0._id_1155F);
  var_8 _meth_8204();
  var_8 thread _id_DF7F(var_0);
  var_8 thread _id_DF81(var_0);
  var_8 waittill("death");
  self setclientdvar("ui_reaper_targetDistance", -1);
  self._id_6DB6 = 0;

  if (var_3 == 0)
  break;
  }
  else
  wait 0.05;
  }

  self notify("removed_reaper_ammo");
  _id_DF78(var_0);
  var_0 thread _id_DF7C();
}

_id_89F4(var_0) {
  level endon("game_ended");
  self endon("disconnect");
  var_0 endon("remote_done");
  var_0 endon("death");
  self notifyonplayercommand("remote_mortar_toggleZoom1", "+ads_akimbo_accessible");

  if (!level._id_4542)
  self notifyonplayercommand("remote_mortar_toggleZoom1", "+toggleads_throw");

  for (;;) {
  var_1 = scripts\engine\utility::_id_13734("remote_mortar_toggleZoom1");

  if (!isdefined(self._id_DF71))
  self._id_DF71 = 0;

  self._id_DF71 = 1 - self._id_DF71;
  }
}

_id_DFB3(var_0) {
  level endon("game_ended");
  self endon("disconnect");
  var_0 endon("remote_done");
  var_0 endon("death");
  self._id_DF71 = undefined;
  thread _id_89F4(var_0);
  var_0._id_13FCA = 0;
  var_1 = 0;

  for (;;) {
  if (self adsbuttonpressed()) {
  wait 0.05;

  if (isdefined(self._id_DF71))
  var_1 = 1;

  break;
  }

  wait 0.05;
  }

  for (;;) {
  if (!var_1 && self adsbuttonpressed() || var_1 && self._id_DF71) {
  if (var_0._id_13FCA == 0) {
  scripts\mp\utility\game::_id_12C6("mortar_remote_zoom_mp");
  scripts\mp\utility\game::_id_141A("mortar_remote_zoom_mp");
  var_0._id_13FCA = 1;
  }
  }
  else if (!var_1 && !self adsbuttonpressed() || var_1 && !self._id_DF71) {
  if (var_0._id_13FCA == 1) {
  scripts\mp\utility\game::_id_12C6("mortar_remote_mp");
  scripts\mp\utility\game::_id_141A("mortar_remote_mp");
  var_0._id_13FCA = 0;
  }
  }

  wait 0.05;
  }
}

_id_DF7F(var_0) {
  level endon("game_ended");
  var_0 endon("death");
  var_0 endon("remote_done");
  self endon("death");

  for (;;) {
  var_1 = distance(self.origin, var_0._id_1155F.origin);
  var_0.owner setclientdvar("ui_reaper_targetDistance", int(var_1 / 12));
  wait 0.05;
  }
}

_id_DF81(var_0) {
  self endon("death");
  scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause(6);
  playfx(level._id_DF70["missileExplode"], self.origin);
  self delete();
}

_id_DF78(var_0) {
  if (!scripts\mp\utility\game::isusingremote())
  return;

  if (isdefined(var_0))
  var_0 notify("helicopter_done");

  self thermalvisionoff();
  self thermalvisionfofoverlayoff();
  self _meth_8401(game["thermal_vision"], 0);
  scripts\mp\utility\game::restorebasevisionset(0);
  self unlink();
  scripts\mp\utility\game::_id_41E9();

  if (getdvarint("camera_thirdPerson"))
  scripts\mp\utility\game::_id_F887(1);

  scripts\mp\utility\game::_id_141A(scripts\engine\utility::_id_7F62());
  var_1 = scripts\mp\utility\game::_id_7F55("remote_mortar");
  scripts\mp\utility\game::_id_141E(var_1);
  scripts\mp\utility\game::_id_141E("mortar_remote_zoom_mp");
  scripts\mp\utility\game::_id_141E("mortar_remote_mp");
  scripts\engine\utility::_id_1C76(1);
}

_id_89F3(var_0) {
  level endon("game_ended");
  var_0 endon("disconnect");
  var_0 endon("removed_reaper_ammo");
  self endon("death");
  var_1 = 40.0;
  scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause(var_1);

  while (var_0._id_6DB6)
  wait 0.05;

  if (isdefined(var_0))
  var_0 _id_DF78(self);

  thread _id_DF7C();
}

_id_898E(var_0) {
  level endon("game_ended");
  var_0 endon("disconnect");
  self endon("remote_removed");
  self endon("remote_done");
  self waittill("death");

  if (isdefined(var_0))
  var_0 _id_DF78(self);

  level thread _id_E161(self, 1);
}

_id_89CE(var_0) {
  level endon("game_ended");
  self endon("remote_done");
  self endon("death");
  var_0 endon("disconnect");
  var_0 endon("removed_reaper_ammo");
  var_0 scripts\engine\utility::waittill_any("joined_team", "joined_spectators");

  if (isdefined(var_0))
  var_0 _id_DF78(self);

  thread _id_DF7C();
}

_id_89CF(var_0) {
  level endon("game_ended");
  self endon("remote_done");
  self endon("death");
  var_0 endon("removed_reaper_ammo");
  var_0 waittill("disconnect");
  thread _id_DF7C();
}

_id_E161(var_0, var_1) {
  self notify("remote_removed");

  if (isdefined(var_0._id_1155F))
  var_0._id_1155F delete();

  if (isdefined(var_0)) {
  var_0 delete();
  var_0 scripts\mp\killstreaks\uav::_id_E182();
  }

  if (!isdefined(var_1) || var_1 == 1)
  level._id_DF6F = undefined;
}

_id_DF7C() {
  level._id_DF6F = undefined;
  level endon("game_ended");
  self endon("death");
  self notify("remote_done");
  self unlink();
  var_0 = self.origin + anglestoforward(self.angles) * 20000;
  self moveto(var_0, 30);
  playfxontag(level._effect["ac130_engineeffect"], self, "tag_origin");
  scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause(3);
  self moveto(var_0, 4, 4, 0.0);
  scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause(4);
  level thread _id_E161(self, 0);
}

_id_DF79() {
  self notify("death");
  self hide();
  var_0 = anglestoright(self.angles) * 200;
  playfx(level._id_DF70["deathExplode"], self.origin, var_0);
}

_id_4D72() {
  level endon("game_ended");
  self.owner endon("disconnect");
  self.health = 999999;
  self.maxhealth = 1500;
  self._id_00E1 = 0;

  for (;;) {
  self waittill("damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9);

  if (!scripts\mp\weapons::_id_7415(self.owner, var_1))
  continue;

  if (!isdefined(self))
  return;

  if (isdefined(var_8) && var_8 & level.idflags_penetration)
  self._id_1390E = 1;

  if (isdefined(var_8) && var_8 & level.idflags_no_team_protection)
  self._id_1390F = 1;

  self._id_1390B = 1;
  var_10 = var_0;

  if (isplayer(var_1)) {
  var_1 scripts\mp\damagefeedback::updatedamagefeedback("");

  if (var_4 == "MOD_RIFLE_BULLET" || var_4 == "MOD_PISTOL_BULLET") {
  if (var_1 scripts\mp\utility\game::_id_12D6("specialty_armorpiercing"))
  var_10 = var_10 + var_0 * level._id_218B;
  }
  }

  if (isdefined(var_9)) {
  switch (var_9) {
  case "javelin_mp":
  case "stinger_mp":
  self._id_A859 = 1;
  var_10 = self.maxhealth + 1;
  break;
  case "sam_projectile_mp":
  self._id_A859 = 1;
  break;
  }

  scripts\mp\killstreaks\killstreaks::_id_A6A0(var_1, var_9, self);
  }

  self._id_00E1 = self._id_00E1 + var_10;

  if (isdefined(self.owner))
  self.owner playlocalsound("reaper_damaged");

  if (self._id_00E1 >= self.maxhealth) {
  if (isplayer(var_1) && (!isdefined(self.owner) || var_1 != self.owner)) {
  var_1 notify("destroyed_killstreak", var_9);
  thread scripts\mp\utility\game::_id_115DE("callout_destroyed_remote_mortar", var_1);
  var_1 thread scripts\mp\utility\game::_id_83B4("kill", var_9, 50);
  }

  if (isdefined(self.owner))
  self.owner stopolcalsound("missile_incoming");

  thread _id_DF79();
  level._id_DF6F = undefined;
  return;
  }
  }
}

_id_89B7() {
  level endon("game_ended");
  self endon("death");
  self endon("remote_done");

  for (;;) {
  level waittill("stinger_fired", var_0, var_1, var_2);

  if (!isdefined(var_2) || var_2 != self)
  continue;

  var_1 thread _id_10FA8(var_2, var_0);
  }
}

_id_10FA8(var_0, var_1) {
  self endon("death");
  var_0 endon("death");

  if (isdefined(var_0.owner))
  var_0.owner playlocalsound("missile_incoming");

  self _meth_8206(var_0);
  var_2 = distance(self.origin, var_0 getpointinbounds(0, 0, 0));
  var_3 = var_0 getpointinbounds(0, 0, 0);

  for (;;) {
  if (!isdefined(var_0))
  var_4 = var_3;
  else
  var_4 = var_0 getpointinbounds(0, 0, 0);

  var_3 = var_4;
  var_5 = distance(self.origin, var_4);

  if (var_5 < 3000 && var_0._id_C22B > 0) {
  var_0._id_C22B--;
  var_0 thread _id_0D9B::_id_6EAE();
  var_6 = var_0 _id_0D9B::_id_6EA0();
  self _meth_8206(var_6);
  var_0 = var_6;

  if (isdefined(var_0.owner))
  var_0.owner stopolcalsound("missile_incoming");

  return;
  }

  if (var_5 < var_2)
  var_2 = var_5;

  if (var_5 > var_2) {
  if (var_5 > 1536)
  return;

  if (isdefined(var_0.owner)) {
  var_0.owner stopolcalsound("missile_incoming");

  if (level.teambased) {
  if (var_0.team != var_1.team)
  radiusdamage(self.origin, 1000, 1000, 1000, var_1, "MOD_EXPLOSIVE", "stinger_mp");
  }
  else
  radiusdamage(self.origin, 1000, 1000, 1000, var_1, "MOD_EXPLOSIVE", "stinger_mp");
  }

  self hide();
  wait 0.05;
  self delete();
  }

  wait 0.05;
  }
}

_id_89B6() {
  level endon("game_ended");
  self endon("death");
  self endon("remote_done");

  for (;;) {
  level waittill("sam_fired", var_0, var_1, var_2);

  if (!isdefined(var_2) || var_2 != self)
  continue;

  level thread _id_EB18(var_2, var_0, var_1);
  }
}

_id_EB18(var_0, var_1, var_2) {
  var_0 endon("death");

  if (isdefined(var_0.owner))
  var_0.owner playlocalsound("missile_incoming");

  var_3 = 150;
  var_4 = 1000;
  var_5 = [];

  for (var_6 = 0; var_6 < var_2.size; var_6++) {
  if (isdefined(var_2[var_6])) {
  var_5[var_6] = distance(var_2[var_6].origin, var_0 getpointinbounds(0, 0, 0));
  continue;
  }

  var_5[var_6] = undefined;
  }

  for (;;) {
  var_7 = var_0 getpointinbounds(0, 0, 0);
  var_8 = [];

  for (var_6 = 0; var_6 < var_2.size; var_6++) {
  if (isdefined(var_2[var_6]))
  var_8[var_6] = distance(var_2[var_6].origin, var_7);
  }

  for (var_6 = 0; var_6 < var_8.size; var_6++) {
  if (isdefined(var_8[var_6])) {
  if (var_8[var_6] < 3000 && var_0._id_C22B > 0) {
  var_0._id_C22B--;
  var_0 thread _id_0D9B::_id_6EAE();
  var_9 = var_0 _id_0D9B::_id_6EA0();

  for (var_10 = 0; var_10 < var_2.size; var_10++) {
  if (isdefined(var_2[var_10]))
  var_2[var_10] _meth_8206(var_9);
  }

  if (isdefined(var_0.owner))
  var_0.owner stopolcalsound("missile_incoming");

  return;
  }

  if (var_8[var_6] < var_5[var_6])
  var_5[var_6] = var_8[var_6];

  if (var_8[var_6] > var_5[var_6]) {
  if (var_8[var_6] > 1536)
  continue;

  if (isdefined(var_0.owner)) {
  var_0.owner stopolcalsound("missile_incoming");

  if (level.teambased) {
  if (var_0.team != var_1.team)
  radiusdamage(var_2[var_6].origin, var_4, var_3, var_3, var_1, "MOD_EXPLOSIVE", "sam_projectile_mp");
  }
  else
  radiusdamage(var_2[var_6].origin, var_4, var_3, var_3, var_1, "MOD_EXPLOSIVE", "sam_projectile_mp");
  }

  var_2[var_6] hide();
  wait 0.05;
  var_2[var_6] delete();
  }
  }
  }

  wait 0.05;
  }
}
