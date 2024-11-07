/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3516.gsc
***************************************/

init() {
  scripts\mp\killstreaks\killstreaks::registerkillstreak("remote_tank", ::_id_128FE);
  level._id_114E4 = [];
  level._id_114E4["remote_tank"] = spawnstruct();
  level._id_114E4["remote_tank"]._id_11901 = 60.0;
  level._id_114E4["remote_tank"].health = 99999;
  level._id_114E4["remote_tank"].maxhealth = 1000;
  level._id_114E4["remote_tank"]._id_110EA = "remote_tank";
  level._id_114E4["remote_tank"]._id_B6BF = "ugv_turret_mp";
  level._id_114E4["remote_tank"]._id_B88D = "remote_tank_projectile_mp";
  level._id_114E4["remote_tank"]._id_F268 = "sentry_offline";
  level._id_114E4["remote_tank"]._id_13260 = "remote_ugv_mp";
  level._id_114E4["remote_tank"]._id_B91A = "vehicle_ugv_talon_mp";
  level._id_114E4["remote_tank"]._id_B922 = "vehicle_ugv_talon_gun_mp";
  level._id_114E4["remote_tank"]._id_B924 = "vehicle_ugv_talon_obj";
  level._id_114E4["remote_tank"]._id_B925 = "vehicle_ugv_talon_obj_red";
  level._id_114E4["remote_tank"]._id_B91D = "vehicle_ugv_talon_mp";
  level._id_114E4["remote_tank"]._id_1114D = &"KILLSTREAKS_REMOTE_TANK_PLACE";
  level._id_114E4["remote_tank"]._id_1114C = &"KILLSTREAKS_REMOTE_TANK_CANNOT_PLACE";
  level._id_114E4["remote_tank"]._id_A84D = "killstreak_remote_tank_laptop_mp";
  level._id_114E4["remote_tank"]._id_DF7B = "killstreak_remote_tank_remote_mp";
  level._effect["remote_tank_dying"] = loadfx("vfx/core/expl/killstreak_explosion_quick");
  level._effect["remote_tank_explode"] = loadfx("vfx/core/expl/bouncing_betty_explosion");
  level._effect["remote_tank_spark"] = loadfx("vfx/core/impacts/large_metal_painted_hit");
  level._effect["remote_tank_antenna_light_mp"] = loadfx("vfx/core/vehicles/aircraft_light_red_blink");
  level._effect["remote_tank_camera_light_mp"] = loadfx("vfx/core/vehicles/aircraft_light_wingtip_green");
  level._id_DF72 = 0.5;
}

_id_128FE(var_0, var_1) {
  var_2 = 1;

  if (scripts\mp\utility\game::_id_4BD7() >= scripts\mp\utility\game::_id_B4D2() || level._id_6BAA + var_2 >= scripts\mp\utility\game::_id_B4D2()) {
  self iprintlnbold(&"KILLSTREAKS_TOO_MANY_VEHICLES");
  return 0;
  }

  scripts\mp\utility\game::_id_93FA();
  var_3 = _id_83AC(var_0, "remote_tank");

  if (var_3) {
  scripts\mp\matchdata::_id_AFC9("remote_tank", self.origin);
  thread scripts\mp\utility\game::_id_115DE("used_remote_tank", self);
  _id_1146D("remote_tank");
  }
  else
  scripts\mp\utility\game::_id_4FC1();

  self._id_9D81 = 0;
  return var_3;
}

_id_1146D(var_0) {
  var_1 = scripts\mp\utility\game::_id_7F55(level._id_114E4[var_0]._id_110EA);
  scripts\mp\killstreaks\killstreaks::_id_1146C(var_1);
  scripts\mp\utility\game::_id_141E(level._id_114E4[var_0]._id_A84D);
  scripts\mp\utility\game::_id_141E(level._id_114E4[var_0]._id_DF7B);
}

_id_E152() {
  if (scripts\mp\utility\game::_id_12D6("specialty_explosivebullets")) {
  self._id_E2DF = "specialty_explosivebullets";
  scripts\mp\utility\game::_id_E150("specialty_explosivebullets");
  }
}

_id_E2E0() {
  if (isdefined(self._id_E2DF)) {
  scripts\mp\utility\game::giveperk(self._id_E2DF);
  self._id_E2DF = undefined;
  }
}

_id_1370F() {
  self endon("death");
  self endon("disconnect");
  level endon("game_ended");
  wait 0.05;
  _id_E2E0();
}

_id_E18E() {
  var_0 = self getweaponslistprimaries();

  foreach (var_2 in var_0) {
  var_3 = strtok(var_2, "_");

  if (var_3[0] == "alt") {
  self._id_E2E7[var_2] = self getweaponammoclip(var_2);
  self._id_E2E9[var_2] = self getweaponammostock(var_2);
  continue;
  }

  self._id_E2E7[var_2] = self getweaponammoclip(var_2);
  self._id_E2E9[var_2] = self getweaponammostock(var_2);
  }

  self._id_13CD2 = [];

  foreach (var_2 in var_0) {
  var_3 = strtok(var_2, "_");
  self._id_13CD2[self._id_13CD2.size] = var_2;

  if (var_3[0] == "alt")
  continue;

  scripts\mp\utility\game::_id_141E(var_2);
  }
}

_id_E2E8() {
  if (!isdefined(self._id_E2E7) || !isdefined(self._id_E2E9) || !isdefined(self._id_13CD2))
  return;

  var_0 = [];

  foreach (var_2 in self._id_13CD2) {
  var_3 = strtok(var_2, "_");

  if (var_3[0] == "alt") {
  var_0[var_0.size] = var_2;
  continue;
  }

  scripts\mp\utility\game::_id_12C6(var_2);

  if (isdefined(self._id_E2E7[var_2]))
  self setweaponammoclip(var_2, self._id_E2E7[var_2]);

  if (isdefined(self._id_E2E9[var_2]))
  self setweaponammostock(var_2, self._id_E2E9[var_2]);
  }

  foreach (var_6 in var_0) {
  if (isdefined(self._id_E2E7[var_6]))
  self setweaponammoclip(var_6, self._id_E2E7[var_6]);

  if (isdefined(self._id_E2E9[var_6]))
  self setweaponammostock(var_6, self._id_E2E9[var_6]);
  }

  self._id_E2E7 = undefined;
  self._id_E2E9 = undefined;
}

_id_13710() {
  self endon("death");
  self endon("disconnect");
  level endon("game_ended");
  wait 0.05;
  _id_E2E8();
}

_id_83AC(var_0, var_1) {
  var_2 = _id_4A20(var_1, self);
  var_2._id_AC68 = var_0;
  _id_E152();
  _id_E18E();
  var_3 = _id_F689(var_2, 1);
  thread _id_E2E0();
  thread _id_E2E8();

  if (!isdefined(var_3))
  var_3 = 0;

  return var_3;
}

_id_4A20(var_0, var_1) {
  var_2 = spawnturret("misc_turret", var_1.origin + (0, 0, 25), level._id_114E4[var_0]._id_B6BF);
  var_2.angles = var_1.angles;
  var_2._id_114E8 = var_0;
  var_2.owner = var_1;
  var_2 setmodel(level._id_114E4[var_0]._id_B91A);
  var_2 maketurretinoperable();
  var_2 _meth_835B(1);
  var_2 _meth_830F("sentry_offline");
  var_2 makeunusable();
  var_2 _meth_8336(var_1);
  return var_2;
}

_id_F689(var_0, var_1) {
  self endon("death");
  self endon("disconnect");
  var_0 thread _id_114CE(self);
  scripts\engine\utility::_id_1C71(0);
  self notifyonplayercommand("place_tank", "+attack");
  self notifyonplayercommand("place_tank", "+attack_akimbo_accessible");
  self notifyonplayercommand("cancel_tank", "+actionslot 4");

  if (!level._id_4542) {
  self notifyonplayercommand("cancel_tank", "+actionslot 5");
  self notifyonplayercommand("cancel_tank", "+actionslot 6");
  self notifyonplayercommand("cancel_tank", "+actionslot 7");
  }

  for (;;) {
  var_2 = scripts\engine\utility::_id_13734("place_tank", "cancel_tank", "force_cancel_placement");

  if (var_2 == "cancel_tank" || var_2 == "force_cancel_placement") {
  if (!var_1 && var_2 == "cancel_tank")
  continue;

  if (level._id_4542) {
  var_3 = scripts\mp\utility\game::_id_7F55(level._id_114E4[var_0._id_114E8]._id_110EA);

  if (isdefined(self._id_A6A1) && var_3 == scripts\mp\utility\game::_id_7F55(self.pers["killstreaks"][self._id_A6A1]._id_110EA) && !self getweaponlistitems().size) {
  scripts\mp\utility\game::_id_12C6(var_3, 0);
  scripts\mp\utility\game::_id_13CB(4, "weapon", var_3);
  }
  }

  var_0 _id_114CD();
  scripts\engine\utility::_id_1C71(1);
  return 0;
  }

  if (!var_0._id_3872)
  continue;

  var_0 thread _id_114D0();
  scripts\engine\utility::_id_1C71(1);
  return 1;
  }
}

_id_114CE(var_0) {
  self setmodel(level._id_114E4[self._id_114E8]._id_B924);
  self _meth_8335(var_0);
  self _meth_82C7(0);
  self setcandamage(0);
  self._id_3A9D = var_0;
  var_0._id_9D81 = 1;
  var_0 thread _id_12F34(self);
  thread _id_114C6(var_0);
  thread _id_114C7(var_0);
  thread _id_114C8();
  self notify("carried");
}

_id_12F34(var_0) {
  self endon("death");
  self endon("disconnect");
  level endon("game_ended");
  var_0 endon("placed");
  var_0 endon("death");
  var_0._id_3872 = 1;
  var_1 = -1;

  for (;;) {
  var_2 = self _meth_805E(25.0, 25.0, 50.0, 40.0, 80.0, 0.7);
  var_0.origin = var_2["origin"];
  var_0.angles = var_2["angles"];
  var_0._id_3872 = self isonground() && var_2["result"] && abs(var_2["origin"][2] - self.origin[2]) < 20;

  if (var_0._id_3872 != var_1) {
  if (var_0._id_3872) {
  var_0 setmodel(level._id_114E4[var_0._id_114E8]._id_B924);

  if (self.team != "spectator")
  self _meth_80F4(level._id_114E4[var_0._id_114E8]._id_1114D);
  } else {
  var_0 setmodel(level._id_114E4[var_0._id_114E8]._id_B925);

  if (self.team != "spectator")
  self _meth_80F4(level._id_114E4[var_0._id_114E8]._id_1114C);
  }
  }

  var_1 = var_0._id_3872;
  wait 0.05;
  }
}

_id_114C6(var_0) {
  self endon("placed");
  self endon("death");
  var_0 waittill("death");
  _id_114CD();
}

_id_114C7(var_0) {
  self endon("placed");
  self endon("death");
  var_0 waittill("disconnect");
  _id_114CD();
}

_id_114C8(var_0) {
  self endon("placed");
  self endon("death");
  level waittill("game_ended");
  _id_114CD();
}

_id_114CD() {
  if (isdefined(self._id_3A9D))
  self._id_3A9D _meth_80F3();

  if (isdefined(self.owner))
  self.owner._id_9D81 = 0;

  if (isdefined(self))
  self delete();
}

_id_114D0() {
  self endon("death");
  level endon("game_ended");
  self notify("placed");
  self._id_3A9D _meth_80F3();
  self._id_3A9D = undefined;

  if (!isdefined(self.owner))
  return 0;

  var_0 = self.owner;
  var_0._id_9D81 = 0;
  var_1 = _id_4A1F(self);

  if (!isdefined(var_1))
  return 0;

  var_1 playsound("sentry_gun_plant");
  var_1 notify("placed");
  var_1 thread _id_114CC();
  self delete();
}

_id_114BB() {
  self endon("death");
  level endon("game_ended");

  if (!isdefined(self.owner))
  return;

  var_0 = self.owner;
  var_0 endon("death");
  self waittill("placed");
  var_0 _id_1146D(self._id_114E8);
  var_0 scripts\mp\utility\game::_id_12C6(level._id_114E4[self._id_114E8]._id_A84D);
  var_0 scripts\mp\utility\game::_id_141B(level._id_114E4[self._id_114E8]._id_A84D);
}

_id_4A1F(var_0) {
  var_1 = var_0.owner;
  var_2 = var_0._id_114E8;
  var_3 = var_0._id_AC68;
  var_4 = spawnvehicle(level._id_114E4[var_2]._id_B91A, var_2, level._id_114E4[var_2]._id_13260, var_0.origin, var_0.angles, var_1);

  if (!isdefined(var_4))
  return undefined;

  var_5 = var_4 gettagorigin("tag_turret_attach");
  var_6 = spawnturret("misc_turret", var_5, level._id_114E4[var_2]._id_B6BF, 0);
  var_6 linkto(var_4, "tag_turret_attach", (0, 0, 0), (0, 0, 0));
  var_6 setmodel(level._id_114E4[var_2]._id_B922);
  var_6.health = level._id_114E4[var_2].health;
  var_6.owner = var_1;
  var_6.angles = var_1.angles;
  var_6._id_10955 = ::_id_3758;
  var_6._id_114B1 = var_4;
  var_6 makeunusable();
  var_6 setdefaultdroppitch(0);
  var_6 setcandamage(0);
  var_4._id_10955 = ::_id_3758;
  var_4._id_AC68 = var_3;
  var_4.team = var_1.team;
  var_4.owner = var_1;
  var_4 _meth_831F(var_1);
  var_4._id_B6BD = var_6;
  var_4.health = level._id_114E4[var_2].health;
  var_4.maxhealth = level._id_114E4[var_2].maxhealth;
  var_4._id_00E1 = 0;
  var_4._id_52D0 = 0;
  var_4 setcandamage(0);
  var_4._id_114E8 = var_2;
  var_4 scripts\mp\sentientpoolmanager::registersentient("Killstreak_Ground", var_1, 1);
  var_6 _meth_835B(1);
  var_4 _id_114CF();
  var_6 _meth_8336(var_1);
  var_1._id_13106 = 0;
  var_4._id_61A3 = 0;
  var_4._id_4D49 = 1.0;
  var_4 thread _id_114C5();
  var_4 thread _id_114D7();
  var_4 thread _id_114BB();
  return var_4;
}

_id_114CC() {
  self endon("death");
  self.owner endon("disconnect");
  level endon("game_ended");
  self makeunusable();
  self._id_B6BD _meth_81F7();
  self makevehiclesolidcapsule(23, 23, 23);

  if (!isdefined(self.owner))
  return;

  var_0 = self.owner;
  var_1 = (0, 0, 20);

  if (level.teambased) {
  self.team = var_0.team;
  self._id_B6BD.team = var_0.team;
  self._id_B6BD _meth_835E(var_0.team);

  foreach (var_3 in level.players) {
  if (var_3 != var_0 && var_3.team == var_0.team) {
  var_4 = self._id_B6BD scripts\mp\entityheadicons::_id_F73D(var_3, scripts\mp\teams::_id_81B0(self.team), var_1, 10, 10, 0, 0.05, 0, 1, 0, 1);

  if (isdefined(var_4))
  var_4 _meth_8346(self);
  }
  }
  }

  thread _id_114BF();
  thread _id_114C0();
  thread _id_114BC();
  thread _id_114BE();
  thread _id_114C1();
  thread _id_114B2();
  thread _id_114B3();
  _id_10E09();
}

_id_10E09() {
  var_0 = self.owner;
  var_0 scripts\mp\utility\game::_id_FB09(self._id_114E8);

  if (getdvarint("camera_thirdPerson"))
  var_0 scripts\mp\utility\game::_id_F887(0);

  var_0._id_E2D7 = var_0.angles;
  var_0 scripts\mp\utility\game::_id_7385(1);
  var_1 = var_0 scripts\mp\killstreaks\killstreaks::_id_98C2("remote_tank");

  if (var_1 != "success") {
  if (var_1 != "disconnect")
  var_0 scripts\mp\utility\game::_id_41E9();

  if (isdefined(var_0._id_55E6) && var_0._id_55E6)
  var_0 scripts\engine\utility::_id_1C71(1);

  self notify("death");
  return 0;
  }

  var_0 scripts\mp\utility\game::_id_7385(0);
  self._id_B6BD setcandamage(1);
  self setcandamage(1);
  var_2 = spawnstruct();
  var_2._id_CF14 = 1;
  var_2._id_4E53 = ::_id_114C9;
  thread scripts\mp\movers::_id_892F(var_2);
  var_0 remotecontrolvehicle(self);
  var_0 remotecontrolturret(self._id_B6BD);
  var_0 thread _id_114D6(self);
  var_0 thread _id_114B9(self);
  thread _id_114B7();
  thread _id_114CA();
  var_0._id_13106 = 1;
  var_0 scripts\mp\utility\game::_id_12C6(level._id_114E4[self._id_114E8]._id_DF7B);
  var_0 scripts\mp\utility\game::_id_141B(level._id_114E4[self._id_114E8]._id_DF7B);
  thread _id_114BD();
  self._id_B6BD thread _id_114D5();
}

_id_114B2() {
  self endon("death");

  for (;;) {
  playfxontag(scripts\engine\utility::_id_7ECB("remote_tank_antenna_light_mp"), self._id_B6BD, "tag_headlight_right");
  wait 1.0;
  stopfxontag(scripts\engine\utility::_id_7ECB("remote_tank_antenna_light_mp"), self._id_B6BD, "tag_headlight_right");
  }
}

_id_114B3() {
  self endon("death");

  for (;;) {
  playfxontag(scripts\engine\utility::_id_7ECB("remote_tank_camera_light_mp"), self._id_B6BD, "tag_tail_light_right");
  wait 2.0;
  stopfxontag(scripts\engine\utility::_id_7ECB("remote_tank_camera_light_mp"), self._id_B6BD, "tag_tail_light_right");
  }
}

_id_114CF() {
  self._id_B6BD _meth_830F(level._id_114E4[self._id_114E8]._id_F268);

  if (level.teambased)
  scripts\mp\entityheadicons::_id_F877("none", (0, 0, 0));
  else if (isdefined(self.owner))
  scripts\mp\entityheadicons::_id_F7F2(undefined, (0, 0, 0));

  if (!isdefined(self.owner))
  return;

  var_0 = self.owner;

  if (isdefined(var_0._id_13106) && var_0._id_13106) {
  var_0 notify("end_remote");
  var_0 remotecontrolvehicleoff(self);
  var_0 remotecontrolturretoff(self._id_B6BD);
  var_0 scripts\mp\utility\game::_id_141A(var_0 scripts\engine\utility::_id_7F62());
  var_0 scripts\mp\utility\game::_id_41E9();
  var_0 setplayerangles(var_0._id_E2D7);

  if (getdvarint("camera_thirdPerson"))
  var_0 scripts\mp\utility\game::_id_F887(1);

  if (isdefined(var_0._id_55E4) && var_0._id_55E4)
  var_0 scripts\engine\utility::_id_1C6E(1);

  var_0 _id_1146D(level._id_114E4[self._id_114E8]._id_110EA);
  var_0._id_13106 = 0;
  var_0 thread _id_114BA();
  }
}

_id_114BA() {
  self endon("disconnect");
  self endon("death");
  level endon("game_ended");
  scripts\mp\utility\game::_id_7385(1);
  wait 0.5;
  scripts\mp\utility\game::_id_7385(0);
}

_id_114BF() {
  self endon("death");
  self.owner waittill("disconnect");

  if (isdefined(self._id_B6BD))
  self._id_B6BD notify("death");

  self notify("death");
}

_id_114C0() {
  self endon("death");
  self.owner waittill("stop_using_remote");
  self notify("death");
}

_id_114BC() {
  self endon("death");
  self.owner scripts\engine\utility::waittill_any("joined_team", "joined_spectators");
  self notify("death");
}

_id_114C1() {
  self endon("death");
  var_0 = level._id_114E4[self._id_114E8]._id_11901;
  scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause(var_0);
  self notify("death");
}

_id_114C9(var_0) {
  self notify("death");
}

_id_114BE() {
  level endon("game_ended");
  var_0 = self getentitynumber();
  _id_1864(var_0);
  self waittill("death");
  self playsound("talon_destroyed");
  _id_E122(var_0);
  self setmodel(level._id_114E4[self._id_114E8]._id_B91D);

  if (isdefined(self.owner) && (self.owner._id_13106 || self.owner scripts\mp\utility\game::isusingremote())) {
  _id_114CF();
  self.owner._id_13106 = 0;
  }

  self._id_B6BD setdefaultdroppitch(40);
  self._id_B6BD _meth_8336(undefined);
  self playsound("sentry_explode");
  playfxontag(level._effect["remote_tank_dying"], self._id_B6BD, "tag_aim");
  wait 2.0;
  playfx(level._effect["remote_tank_explode"], self.origin);
  self._id_B6BD delete();
  scripts\mp\utility\game::_id_4FC1();
  self delete();
}

_id_3758(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11) {
  var_12 = self;

  if (isdefined(self._id_114B1))
  var_12 = self._id_114B1;

  if (isdefined(var_12._id_1D41) && var_12._id_1D41)
  return;

  if (!scripts\mp\weapons::_id_7415(var_12.owner, var_1))
  return;

  if (isdefined(var_3) && var_3 & level.idflags_penetration)
  var_12._id_1390E = 1;

  if (isdefined(var_3) && var_3 & level.idflags_no_team_protection)
  var_12._id_1390F = 1;

  var_12._id_1390B = 1;
  var_12._id_4D49 = 0.0;
  playfxontagforclients(level._effect["remote_tank_spark"], var_12, "tag_player", var_12.owner);

  if (isdefined(var_5)) {
  switch (var_5) {
  case "stealth_bomb_mp":
  case "artillery_mp":
  var_2 = var_2 * 4;
  break;
  }
  }

  if (var_4 == "MOD_MELEE")
  var_2 = var_12.maxhealth * 0.5;

  var_13 = var_2;

  if (isplayer(var_1)) {
  var_1 scripts\mp\damagefeedback::updatedamagefeedback("remote_tank");

  if (var_4 == "MOD_RIFLE_BULLET" || var_4 == "MOD_PISTOL_BULLET") {
  if (var_1 scripts\mp\utility\game::_id_12D6("specialty_armorpiercing"))
  var_13 = var_13 + var_2 * level._id_218B;
  }

  if (isexplosivedamagemod(var_4))
  var_13 = var_13 + var_2;
  }

  if (isexplosivedamagemod(var_4) && (isdefined(var_5) && var_5 == "destructible_car"))
  var_13 = var_12.maxhealth;

  if (isdefined(var_1.owner) && isplayer(var_1.owner))
  var_1.owner scripts\mp\damagefeedback::updatedamagefeedback("remote_tank");

  if (isdefined(var_5)) {
  switch (var_5) {
  case "remotemissile_projectile_mp":
  case "javelin_mp":
  case "remote_mortar_missile_mp":
  case "stinger_mp":
  case "ac130_40mm_mp":
  case "ac130_105mm_mp":
  var_12._id_A859 = 1;
  var_13 = var_12.maxhealth + 1;
  break;
  case "stealth_bomb_mp":
  case "artillery_mp":
  var_12._id_A859 = 0;
  var_13 = var_12.maxhealth * 0.5;
  break;
  case "bomb_site_mp":
  var_12._id_A859 = 0;
  var_13 = var_12.maxhealth + 1;
  break;
  case "emp_grenade_mp":
  var_13 = 0;
  var_12 thread _id_114B8();
  break;
  case "ims_projectile_mp":
  var_12._id_A859 = 1;
  var_13 = var_12.maxhealth * 0.5;
  break;
  }

  scripts\mp\killstreaks\killstreaks::_id_A6A0(var_1, var_5, self);
  }

  var_12._id_00E1 = var_12._id_00E1 + var_13;
  var_12 playsound("talon_damaged");

  if (var_12._id_00E1 >= var_12.maxhealth) {
  if (isplayer(var_1) && (!isdefined(var_12.owner) || var_1 != var_12.owner)) {
  var_12._id_1D41 = 1;
  var_1 notify("destroyed_killstreak", var_5);
  thread scripts\mp\utility\game::_id_115DE("callout_destroyed_remote_tank", var_1);
  var_1 thread scripts\mp\utility\game::_id_83B4("kill", var_5, 300);
  }

  var_12 notify("death");
  }
}

_id_114B8() {
  self notify("tank_EMPGrenaded");
  self endon("tank_EMPGrenaded");
  self endon("death");
  self.owner endon("disconnect");
  level endon("game_ended");
  self._id_61A3 = 1;
  self._id_B6BD _meth_83C6();
  wait 3.5;
  self._id_61A3 = 0;
  self._id_B6BD _meth_83C7();
}

_id_114C5() {
  self endon("death");
  level endon("game_ended");
  var_0 = 0;

  for (;;) {
  if (!self._id_61A3) {
  if (self._id_4D49 < 1.0) {
  self._id_4D49 = self._id_4D49 + 0.1;
  var_0 = 1;
  }
  else if (var_0) {
  self._id_4D49 = 1.0;
  var_0 = 0;
  }
  }

  wait 0.1;
  }
}

_id_114D7() {
  self endon("death");
  level endon("game_ended");
  var_0 = 0.1;
  var_1 = 1;
  var_2 = 1;

  for (;;) {
  if (var_2) {
  if (self._id_00E1 > 0) {
  var_2 = 0;
  var_1++;
  }
  }
  else if (self._id_00E1 >= self.maxhealth * (var_0 * var_1))
  var_1++;

  wait 0.05;
  }
}

_id_114BD() {
  self endon("death");
  level endon("game_ended");

  for (;;) {
  self waittill("damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9);

  if (isdefined(self._id_10955))
  self [[self._id_10955]](undefined, var_1, var_0, var_8, var_4, var_9, var_3, var_2, undefined, undefined, var_5, var_7);
  }
}

_id_114D5() {
  self endon("death");
  level endon("game_ended");

  for (;;) {
  self waittill("damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9);

  if (isdefined(self._id_10955) && isdefined(self._id_114B1) && (!isexplosivedamagemod(var_4) || isdefined(var_9) && isexplosivedamagemod(var_4) && (var_9 == "stealth_bomb_mp" || var_9 == "artillery_mp")))
  self._id_114B1 [[self._id_10955]](undefined, var_1, var_0, var_8, var_4, var_9, var_3, var_2, undefined, undefined, var_5, var_7);
  }
}

_id_114D6(var_0) {
  self endon("disconnect");
  self endon("end_remote");
  var_0 endon("death");
  var_1 = 50;
  var_2 = var_1;
  var_3 = weaponfiretime(level._id_114E4[var_0._id_114E8]._id_B6BF);

  for (;;) {
  if (var_0._id_B6BD _meth_81A1()) {
  var_2--;

  if (var_2 <= 0) {
  var_0._id_B6BD _meth_83C6();
  wait 2.5;
  var_0 playsound("talon_reload");
  self playlocalsound("talon_reload_plr");
  var_2 = var_1;
  var_0._id_B6BD _meth_83C7();
  }
  }

  wait(var_3);
  }
}

_id_114B9(var_0) {
  self endon("disconnect");
  self endon("end_remote");
  level endon("game_ended");
  var_0 endon("death");
  var_1 = 0;

  for (;;) {
  if (self fragbuttonpressed() && !var_0._id_61A3) {
  var_2 = var_0._id_B6BD.origin;
  var_3 = var_0._id_B6BD.angles;

  switch (var_1) {
  case 0:
  var_2 = var_0._id_B6BD gettagorigin("tag_missile1");
  var_3 = var_0._id_B6BD gettagangles("tag_player");
  break;
  case 1:
  var_2 = var_0._id_B6BD gettagorigin("tag_missile2");
  var_3 = var_0._id_B6BD gettagangles("tag_player");
  break;
  }

  var_0 playsound("talon_missile_fire");
  self playlocalsound("talon_missile_fire_plr");
  var_4 = var_2 + anglestoforward(var_3) * 100;
  var_5 = scripts\mp\utility\game::_id_1309(level._id_114E4[var_0._id_114E8]._id_B88D, var_2, var_4, self);
  var_1 = (var_1 + 1) % 2;
  wait 5.0;
  var_0 playsound("talon_rocket_reload");
  self playlocalsound("talon_rocket_reload_plr");
  continue;
  }

  wait 0.05;
  }
}

_id_114B6(var_0) {
  self endon("disconnect");
  self endon("end_remote");
  level endon("game_ended");
  var_0 endon("death");

  for (;;) {
  if (self secondaryoffhandbuttonpressed()) {
  var_1 = bullettrace(var_0.origin + (0, 0, 4), var_0.origin - (0, 0, 4), 0, var_0);
  var_2 = vectornormalize(var_1["normal"]);
  var_3 = vectortoangles(var_2);
  var_3 = var_3 + (90, 0, 0);
  var_4 = scripts\mp\weapons::_id_108E3(var_0.origin, self, "equipment", var_3);
  var_0 playsound("item_blast_shield_on");
  wait 8.0;
  continue;
  }

  wait 0.05;
  }
}

_id_114B7() {
  self endon("death");
  self.owner endon("end_remote");

  for (;;) {
  earthquake(0.1, 0.25, self._id_B6BD gettagorigin("tag_player"), 50);
  wait 0.25;
  }
}

_id_1864(var_0) {
  level._id_12B14[var_0] = self;
}

_id_E122(var_0) {
  level._id_12B14[var_0] = undefined;
}

_id_114CA() {
  if (!isdefined(self.owner))
  return;

  var_0 = self.owner;
  level endon("game_ended");
  var_0 endon("disconnect");
  var_0 endon("end_remote");
  self endon("death");

  for (;;) {
  var_1 = 0;

  while (var_0 usebuttonpressed()) {
  var_1 = var_1 + 0.05;

  if (var_1 > 0.75) {
  self notify("death");
  return;
  }

  wait 0.05;
  }

  wait 0.05;
  }
}