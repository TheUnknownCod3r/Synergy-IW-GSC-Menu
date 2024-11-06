/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3522.gsc
***************************************/

init() {
  return;
}

_id_1082D(var_0, var_1, var_2) {
  var_3 = self _meth_83DA("tank", var_0);
  var_3.health = 3000;
  var_3._id_11568 = 1;
  var_3.team = var_0.team;
  var_3.pers["team"] = var_3.team;
  var_3.owner = var_0;
  var_3 setcandamage(1);
  var_3._id_10B68 = 12;
  var_3 thread _id_51CB();
  var_3 _id_185E();
  var_3._id_4D2E = ::_id_3758;
  return var_3;
}

_id_51CB() {
  self endon("death");
  var_0 = self.origin[2];

  for (;;) {
  if (var_0 - self.origin[2] > 2048) {
  self.health = 0;
  self notify("death");
  return;
  }

  wait 1.0;
  }
}

_id_130E4(var_0) {
  return _id_12907();
}

_id_12907() {
  if (isdefined(level._id_114E2) && level._id_114E2) {
  self iprintlnbold("Armor support unavailable.");
  return 0;
  }

  if (!isdefined(getvehiclenode("startnode", "targetname"))) {
  self iprintlnbold("Tank is currently not supported in this level, bug your friendly neighborhood LD.");
  return 0;
  }

  if (!vehicle_getspawnerarray().size)
  return 0;

  if (self.team == "allies")
  var_0 = level._id_114E5["allies"] _id_1082D(self, "vehicle_bradley");
  else
  var_0 = level._id_114E5["axis"] _id_1082D(self, "vehicle_bmp");

  var_0 _id_10DF8();
  return 1;
}

_id_10DF8(var_0) {
  var_1 = getvehiclenode("startnode", "targetname");
  var_2 = getvehiclenode("waitnode", "targetname");
  self._id_C053 = getvehiclenodearray("info_vehicle_node", "classname");
  level._id_114E2 = 1;
  thread _id_114E9(var_1, var_2);
  thread _id_114D9();
  level._id_114B1 = self;

  if (level.teambased) {
  var_3 = scripts\mp\objidpoolmanager::requestminimapid(1);

  if (var_3 != -1) {
  scripts\mp\objidpoolmanager::minimap_objective_add(var_3, "invisible", (0, 0, 0));
  scripts\mp\objidpoolmanager::minimap_objective_team(var_3, "allies");
  }

  level._id_114B1._id_C2B5["allies"] = var_3;
  var_4 = scripts\mp\objidpoolmanager::requestminimapid(1);

  if (var_4 != -1) {
  scripts\mp\objidpoolmanager::minimap_objective_add(var_4, "invisible", (0, 0, 0));
  scripts\mp\objidpoolmanager::minimap_objective_team(var_4, "axis");
  }

  level._id_114B1._id_C2B5["axis"] = var_4;
  var_5 = self.team;
  level._id_114B1.team = var_5;
  level._id_114B1.pers["team"] = var_5;
  }

  var_6 = spawnturret("misc_turret", self.origin, "abrams_minigun_mp");
  var_6 linkto(self, "tag_engine_left", (0, 0, -20), (0, 0, 0));
  var_6 setmodel("sentry_minigun");
  var_6.angles = self.angles;
  var_6.owner = self.owner;
  var_6 maketurretinoperable();
  self._id_B6BD = var_6;
  self._id_B6BD setdefaultdroppitch(0);
  var_7 = self.angles;
  self.angles = (0, 0, 0);
  var_8 = self gettagorigin("tag_flash");
  self.angles = var_7;
  var_9 = var_8 - self.origin;
  thread _id_136B0();
  thread _id_136B8();
  self._id_118F3 = gettime();
  var_10 = spawn("script_origin", self gettagorigin("tag_flash"));
  var_10 linkto(self, "tag_origin", var_9, (0, 0, 0));
  var_10 hide();
  self._id_BEF5 = var_10;
  thread _id_114E1();
  thread _id_5329();
  thread _id_114DF();
  thread _id_3E02();
  thread _id_13A78();
}

_id_136B0() {
  self endon("death");
  self.owner endon("disconnect");
  self.owner waittill("joined_team");
  self.health = 0;
  self notify("death");
}

_id_136B8() {
  self endon("death");
  self.owner waittill("disconnect");
  self.health = 0;
  self notify("death");
}

_id_F6C4(var_0) {
  if (self._id_0376 != var_0) {
  if (var_0 == "forward")
  _id_11096();
  else
  _id_11097();
  }
}

_id_F6E3() {
  self endon("death");
  self notify("path_abandoned");

  while (isdefined(self.changingdirection))
  wait 0.05;

  var_0 = 2;
  self vehicle_setspeed(var_0, 10, 10);
  self._id_109C6 = "engage";
}

_id_F799() {
  self endon("death");
  self notify("path_abandoned");

  while (isdefined(self.changingdirection))
  wait 0.05;

  var_0 = 2;
  self vehicle_setspeed(var_0, 10, 10);
  self._id_109C6 = "engage";
}

_id_F85D() {
  self endon("death");

  while (isdefined(self.changingdirection))
  wait 0.05;

  self vehicle_setspeed(self._id_10B68, 10, 10);
  self._id_109C6 = "standard";
}

_id_F6ED() {
  self endon("death");

  while (isdefined(self.changingdirection))
  wait 0.05;

  self vehicle_setspeed(15, 15, 15);
  self._id_109C6 = "evade";
  wait 1.5;
  self vehicle_setspeed(self._id_10B68, 10, 10);
}

_id_F6B0() {
  self endon("death");

  while (isdefined(self.changingdirection))
  wait 0.05;

  self vehicle_setspeed(5, 5, 5);
  self._id_109C6 = "danger";
}

_id_11097() {
  _id_4F52("tank changing direction at " + gettime());
  self vehicle_setspeed(0, 5, 6);
  self.changingdirection = 1;

  while (self._id_037A > 0)
  wait 0.05;

  wait 0.25;
  self.changingdirection = undefined;
  _id_4F52("tank done changing direction");
  self._id_037D = "reverse";
  self._id_0376 = "reverse";
  self vehicle_setspeed(self._id_10B68, 5, 6);
}

_id_11096() {
  _id_4F52("tank changing direction at " + gettime());
  self vehicle_setspeed(0, 5, 6);
  self.changingdirection = 1;

  while (self._id_037A > 0)
  wait 0.05;

  wait 0.25;
  self.changingdirection = undefined;
  _id_4F52("tank done changing direction");
  self._id_037D = "forward";
  self._id_0376 = "forward";
  self vehicle_setspeed(self._id_10B68, 5, 6);
}

_id_3E02() {
  self endon("death");
  var_0 = [];
  var_1 = level.players;
  self._id_C225 = 0;

  for (;;) {
  foreach (var_3 in var_1) {
  if (!isdefined(var_3))
  continue;

  if (var_3.team == self.team) {
  wait 0.05;
  continue;
  }

  var_4 = distance2d(var_3.origin, self.origin);

  if (var_4 < 2048)
  self._id_C225++;

  wait 0.05;
  }

  if (isdefined(self._id_109C6) && (self._id_109C6 == "evade" || self._id_109C6 == "engage")) {
  self._id_C225 = 0;
  continue;
  }

  if (self._id_C225 > 1)
  thread _id_F6B0();
  else
  thread _id_F85D();

  self._id_C225 = 0;
  wait 0.05;
  }
}

_id_114E9(var_0, var_1) {
  self endon("tankDestroyed");
  self endon("death");

  if (!isdefined(level._id_848E)) {
  self startpath(var_0);
  return;
  }

  self attachpath(var_0);
  self startpath(var_0);
  var_0 notify("trigger", self, 1);
  wait 0.05;

  for (;;) {
  while (isdefined(self.changingdirection))
  wait 0.05;

  var_2 = getnodenearenemies();

  if (isdefined(var_2))
  self.endnode = var_2;
  else
  self.endnode = undefined;

  wait 0.65;
  }
}

_id_3758(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11) {
  if ((var_1 == self || var_1 == self._id_B6BD || isdefined(var_1.pers) && var_1.pers["team"] == self.team) && (var_1 != self.owner || var_4 == "MOD_MELEE"))
  return;

  var_12 = _id_B938(var_4, var_2, var_1);
  self vehicle_finishdamage(var_0, var_1, var_12, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11);
}

_id_114D9() {
  self endon("death");
  self._id_00E1 = 0;
  var_0 = self vehicle_getspeed();
  var_1 = self.health;
  var_2 = 0;
  var_3 = 0;
  var_4 = 0;

  for (;;) {
  self waittill("damage", var_5, var_6, var_7, var_8, var_9);

  if (isdefined(var_6.classname) && var_6.classname == "script_vehicle") {
  if (isdefined(self._id_2A9A) && self._id_2A9A != var_6) {
  self._id_72B8 = var_6;
  thread _id_698D();
  }
  }
  else if (isplayer(var_6)) {
  var_6 scripts\mp\damagefeedback::updatedamagefeedback("hitHelicopter");

  if (var_6 scripts\mp\utility\game::_id_12D6("specialty_armorpiercing")) {
  var_10 = var_5 * level._id_218B;
  self.health = self.health - int(var_10);
  }
  }

  if (self.health <= 0) {
  self notify("death");
  return;
  }
  else if (self.health < var_1 / 4 && var_4 == 0)
  var_4 = 1;
  else if (self.health < var_1 / 2 && var_3 == 0)
  var_3 = 1;
  else if (self.health < var_1 / 1.5 && var_2 == 0)
  var_2 = 1;

  if (var_5 > 1000)
  _id_89F2(var_6);
  }
}

_id_89F2(var_0) {
  self endon("death");
  var_1 = randomint(100);

  if (isdefined(self._id_2A9A) && self._id_2A9A != var_0 && var_1 > 30) {
  var_2 = [];
  var_2[0] = self._id_2A9A;
  _id_698D(1, self._id_2A9A);
  thread _id_1572(var_2);
  }
  else if (!isdefined(self._id_2A9A) && var_1 > 30) {
  var_2 = [];
  var_2[0] = var_0;
  thread _id_1572(var_2);
  }
  else if (var_1 < 30) {
  playfx(level._id_114D8, self.origin);
  thread _id_F6ED();
  } else {
  self fireweapon();
  self playsound("bmp_fire");
  }
}

_id_89D4(var_0) {
  self endon("death");
  var_1 = _id_DF30(var_0);
  var_2 = distance(self.origin, var_0.origin);

  if (randomint(4) < 3)
  return;

  if (var_1 == "front" && var_2 < 768)
  thread _id_F6ED();
  else if (var_1 == "rear_side" || var_1 == "rear" && var_2 >= 768) {
  playfx(level._id_114D8, self.origin);
  thread _id_F6ED();
  }
  else if (var_1 == "rear" && var_2 < 768) {
  _id_11097();
  _id_F6ED();
  wait 4;
  _id_11096();
  }
  else if (var_1 == "front_side" || var_1 == "front") {
  playfx(level._id_114D8, self.origin);
  _id_11097();
  _id_F6ED();
  wait 8;
  _id_11096();
  }
}

_id_DF30(var_0) {
  self endon("death");
  var_0 endon("death");
  var_0 endon("disconnect");
  var_1 = anglestoforward(self.angles);
  var_2 = var_0.origin - self.origin;
  var_1 = var_1 * (1, 1, 0);
  var_2 = var_2 * (1, 1, 0);
  var_2 = vectornormalize(var_2);
  var_1 = vectornormalize(var_1);
  var_3 = vectordot(var_2, var_1);

  if (var_3 > 0) {
  if (var_3 > 0.9)
  return "front";
  else
  return "front_side";
  }
  else if (var_3 < -0.9)
  return "rear";
  else
  return "rear_side";

  var_0 iprintlnbold(var_3);
}

_id_13A78() {
  self endon("death");

  for (;;) {
  var_0 = [];
  var_1 = level.players;

  foreach (var_3 in var_1) {
  if (!isdefined(var_3)) {
  wait 0.05;
  continue;
  }

  if (!_id_9F97(var_3)) {
  wait 0.05;
  continue;
  }

  var_4 = var_3 getcurrentweapon();

  if (issubstr(var_4, "at4") || issubstr(var_4, "stinger") || issubstr(var_4, "javelin")) {
  thread _id_89D4(var_3);
  wait 8;
  }

  wait 0.15;
  }
  }
}

_id_3E2E() {
  if (!isdefined(self.owner) || !isdefined(self.owner.pers["team"]) || self.owner.pers["team"] != self.team) {
  self notify("abandoned");
  return 0;
  }

  return 1;
}

_id_B938(var_0, var_1, var_2) {
  if (var_0 == "MOD_RIFLE_BULLET")
  return var_1;
  else if (var_0 == "MOD_PISTOL_BULLET")
  return var_1;
  else if (var_0 == "MOD_IMPACT")
  return var_1;
  else if (var_0 == "MOD_MELEE")
  return 0;
  else if (var_0 == "MOD_EXPLOSIVE_BULLET")
  return var_1;
  else if (var_0 == "MOD_GRENADE")
  return var_1 * 5;
  else if (var_0 == "MOD_GRENADE_SPLASH")
  return var_1 * 5;
  else
  return var_1 * 10;
}

_id_5329() {
  self waittill("death");

  if (level.teambased) {
  var_0 = level._id_114B1.team;

  if (level._id_114B1._id_C2B5[var_0] != -1)
  scripts\mp\objidpoolmanager::minimap_objective_state(level._id_114B1._id_C2B5[var_0], "invisible");

  if (level._id_114B1._id_C2B5[level._id_C74B[var_0]] != -1)
  scripts\mp\objidpoolmanager::minimap_objective_state(level._id_114B1._id_C2B5[level._id_C74B[var_0]], "invisible");
  }

  self notify("tankDestroyed");
  self vehicle_setspeed(0, 10, 10);
  level._id_114E2 = 0;
  playfx(level._id_10888, self.origin);
  playfx(level._id_114DD, self.origin);
  _id_E11C();
  var_1 = spawn("script_model", self.origin);
  var_1 setmodel("vehicle_m1a1_abrams_d_static");
  var_1.angles = self.angles;
  self._id_B6BD delete();
  self delete();
  wait 4;
  var_1 delete();
}

_id_C53C() {
  self notify("onTargOrTimeOut");
  self endon("onTargOrTimeOut");
  self endon("turret_on_target");
  self waittill("turret_pitch_clamped");
  thread _id_698D(0, self._id_2A9A);
}

_id_6D7A() {
  self endon("abandonedTarget");
  self endon("killedTarget");
  self endon("death");
  self endon("targetRemoved");
  self endon("lostLOS");

  for (;;) {
  _id_C53C();

  if (!isdefined(self._id_2A9A))
  continue;

  var_0 = self gettagorigin("tag_flash");
  var_1 = bullettrace(self.origin, var_0, 0, self);

  if (var_1["position"] != var_0)
  thread _id_698D(0, self._id_2A9A);

  var_1 = bullettrace(var_0, self._id_2A9A.origin, 1, self);
  var_2 = distance(self.origin, var_1["position"]);
  var_3 = distance(self._id_2A9A.origin, self.origin);

  if (var_2 < 384 || var_2 + 256 < var_3) {
  wait 0.5;

  if (var_2 > 384) {
  _id_136F4();
  self fireweapon();
  self playsound("bmp_fire");
  self._id_118F3 = gettime();
  }

  var_4 = _id_DF30(self._id_2A9A);
  thread _id_698D(0, self._id_2A9A);
  return;
  }

  _id_136F4();
  self fireweapon();
  self playsound("bmp_fire");
  self._id_118F3 = gettime();
  }
}

_id_136F4() {
  self endon("abandonedTarget");
  self endon("killedTarget");
  self endon("death");
  self endon("targetRemoved");
  self endon("lostLOS");
  var_0 = gettime() - self._id_118F3;

  if (var_0 < 1499)
  wait(1.5 - var_0 / 1000);
}

_id_114E1(var_0) {
  self endon("death");
  self endon("leaving");
  var_1 = [];

  for (;;) {
  var_1 = [];
  var_2 = level.players;

  if (isdefined(self._id_72B8)) {
  var_1 = [];
  var_1[0] = self._id_72B8;
  _id_1572(var_1);
  self._id_72B8 = undefined;
  }

  if (isdefined(level._id_8B55) && level._id_8B55.team != self.team && isalive(level._id_8B55)) {
  if (_id_9FF1(level._id_114B1))
  var_1[var_1.size] = level._id_114B1;
  }

  if (isdefined(level._id_3F14) && level._id_3F14.team != self.team && isalive(level._id_3F14)) {
  if (_id_9FF1(level._id_3F14))
  var_1[var_1.size] = level._id_3F14;
  }

  foreach (var_4 in var_2) {
  if (!isdefined(var_4)) {
  wait 0.05;
  continue;
  }

  if (isdefined(var_0) && var_4 == var_0)
  continue;

  if (_id_9F97(var_4)) {
  if (isdefined(var_4))
  var_1[var_1.size] = var_4;

  continue;
  }

  continue;
  }

  if (var_1.size > 0) {
  _id_1572(var_1);
  continue;
  }

  wait 1;
  }
}

_id_1572(var_0) {
  self endon("death");

  if (var_0.size == 1)
  self._id_2A9A = var_0[0];
  else
  self._id_2A9A = _id_7E05(var_0);

  thread _id_F6E3();
  thread _id_13B74(var_0);
  self setturrettargetent(self._id_2A9A);
  _id_6D7A();
  thread _id_F7B8();
}

_id_F7B8() {
  self endon("death");
  _id_F85D();
  _id_E17A();
  self setturrettargetent(self._id_BEF5);
}

_id_7E05(var_0) {
  self endon("death");
  var_1 = self gettagorigin("tag_flash");
  var_2 = self.origin;
  var_3 = undefined;
  var_4 = undefined;
  var_5 = 0;

  foreach (var_7 in var_0) {
  var_8 = abs(vectortoangles(var_7.origin - self.origin)[1]);
  var_9 = abs(self gettagangles("tag_flash")[1]);
  var_8 = abs(var_8 - var_9);

  if (isdefined(level._id_3F14) && var_7 == level._id_3F14)
  return var_7;

  if (isdefined(level._id_8B55) && var_7 == level._id_8B55)
  return var_7;

  var_10 = var_7 getweaponlistitems();

  foreach (var_12 in var_10) {
  if (issubstr(var_12, "at4") || issubstr(var_12, "jav") || issubstr(var_12, "c4"))
  var_8 = var_8 - 40;
  }

  if (!isdefined(var_3)) {
  var_3 = var_8;
  var_4 = var_7;
  continue;
  }

  if (var_3 > var_8) {
  var_3 = var_8;
  var_4 = var_7;
  }
  }

  return var_4;
}

_id_13B74(var_0) {
  self endon("abandonedTarget");
  self endon("lostLOS");
  self endon("death");
  self endon("targetRemoved");
  var_1 = self._id_2A9A;
  var_1 endon("disconnect");
  var_1 waittill("death");
  self notify("killedTarget");
  _id_E17A();
  _id_F85D();
  thread _id_F7B8();
}

_id_698D(var_0, var_1) {
  self endon("death");
  self notify("abandonedTarget");
  _id_F85D();
  thread _id_F7B8();
  _id_E17A();

  if (isdefined(var_1)) {
  self._id_275E = var_1;
  _id_275F();
  }

  if (isdefined(var_0) && var_0)
  return;

  return;
}

_id_275F() {
  self endon("death");
  wait 1.5;
  self._id_275E = undefined;
}

_id_E17A() {
  self notify("targetRemoved");
  self._id_2A9A = undefined;
  self._id_A9AF = undefined;
}

_id_9FF1(var_0) {
  if (distance2d(var_0.origin, self.origin) > 4096)
  return 0;

  if (distance(var_0.origin, self.origin) < 512)
  return 0;

  return _id_12A8F(var_0, 0);
}

_id_9F97(var_0) {
  self endon("death");
  var_1 = distancesquared(var_0.origin, self.origin);

  if (!level.teambased && isdefined(self.owner) && var_0 == self.owner)
  return 0;

  if (!isalive(var_0) || var_0.sessionstate != "playing")
  return 0;

  if (var_1 > 16777216)
  return 0;

  if (var_1 < 262144)
  return 0;

  if (!isdefined(var_0.pers["team"]))
  return 0;

  if (var_0 == self.owner)
  return 0;

  if (level.teambased && var_0.pers["team"] == self.team)
  return 0;

  if (var_0.pers["team"] == "spectator")
  return 0;

  if (isdefined(var_0._id_10916) && (gettime() - var_0._id_10916) / 1000 <= 5)
  return 0;

  if (var_0 scripts\mp\utility\game::_id_12D6("specialty_blindeye"))
  return 0;

  return self vehicle_canturrettargetpoint(var_0.origin, 1, self);
}

_id_12A8F(var_0, var_1) {
  var_2 = var_0 sightconetrace(self gettagorigin("tag_turret"), self);

  if (var_2 < 0.7)
  return 0;

  if (isdefined(var_1) && var_1)
  thread scripts\mp\utility\game::_id_5B7A(var_0.origin, self gettagorigin("tag_turret"), 10, (1, 0, 0));

  return 1;
}

_id_9EA1(var_0) {
  self endon("death");

  if (!isalive(var_0) || var_0.sessionstate != "playing")
  return 0;

  if (!isdefined(var_0.pers["team"]))
  return 0;

  if (var_0 == self.owner)
  return 0;

  if (distancesquared(var_0.origin, self.origin) > 1048576)
  return 0;

  if (level.teambased && var_0.pers["team"] == self.team)
  return 0;

  if (var_0.pers["team"] == "spectator")
  return 0;

  if (isdefined(var_0._id_10916) && (gettime() - var_0._id_10916) / 1000 <= 5)
  return 0;

  if (isdefined(self)) {
  var_1 = self._id_B6BD.origin + (0, 0, 64);
  var_2 = var_0 sightconetrace(var_1, self);

  if (var_2 < 1)
  return 0;
  }

  return 1;
}

_id_114DF() {
  self endon("death");
  self endon("leaving");
  var_0 = [];

  for (;;) {
  var_0 = [];
  var_1 = level.players;

  for (var_2 = 0; var_2 <= var_1.size; var_2++) {
  if (_id_9EA1(var_1[var_2])) {
  if (isdefined(var_1[var_2]))
  var_0[var_0.size] = var_1[var_2];
  }
  else
  continue;

  wait 0.05;
  }

  if (var_0.size > 0) {
  _id_1571(var_0);
  return;
  }
  else
  wait 0.5;
  }
}

_id_7DFD(var_0) {
  self endon("death");
  var_1 = self.origin;
  var_2 = undefined;
  var_3 = undefined;

  foreach (var_5 in var_0) {
  var_6 = distance(self.origin, var_5.origin);
  var_7 = var_5 getcurrentweapon();

  if (issubstr(var_7, "at4") || issubstr(var_7, "jav") || issubstr(var_7, "c4") || issubstr(var_7, "smart") || issubstr(var_7, "grenade"))
  var_6 = var_6 - 200;

  if (!isdefined(var_2)) {
  var_2 = var_6;
  var_3 = var_5;
  continue;
  }

  if (var_2 > var_6) {
  var_2 = var_6;
  var_3 = var_5;
  }
  }

  return var_3;
}

_id_1571(var_0) {
  self endon("death");

  if (var_0.size == 1)
  self._id_2A97 = var_0[0];
  else
  self._id_2A97 = _id_7DFD(var_0);

  if (distance2d(self.origin, self._id_2A97.origin) > 768)
  thread _id_F799();

  self notify("acquiringMiniTarget");
  self._id_B6BD settargetentity(self._id_2A97, (0, 0, 64));
  wait 0.15;
  thread _id_6D74();
  thread _id_13AD1(var_0);
  thread _id_13AD2(var_0);
  thread _id_13AD3(self._id_2A97);
}

_id_6D74() {
  self endon("death");
  self endon("abandonedMiniTarget");
  self endon("killedMiniTarget");
  var_0 = undefined;
  var_1 = gettime();

  if (!isdefined(self._id_2A97))
  return;

  for (;;) {
  if (!isdefined(self._id_B6BD getturrettarget(1))) {
  if (!isdefined(var_0))
  var_0 = gettime();

  var_2 = gettime();

  if (var_0 - var_2 > 1) {
  var_0 = undefined;
  thread _id_698C();
  return;
  }

  wait 0.5;
  continue;
  }

  if (gettime() > var_1 + 1000 && !isdefined(self._id_2A9A)) {
  if (distance2d(self.origin, self._id_2A97.origin) > 768) {
  var_3[0] = self._id_2A97;
  _id_1572(var_3);
  }
  }

  var_4 = randomintrange(10, 16);

  for (var_5 = 0; var_5 < var_4; var_5++) {
  self._id_B6BD shootturret();
  wait 0.1;
  }

  wait(randomfloatrange(0.5, 3.0));
  }
}

_id_13AD1(var_0) {
  self endon("abandonedMiniTarget");
  self endon("death");

  if (!isdefined(self._id_2A97))
  return;

  self._id_2A97 waittill("death");
  self notify("killedMiniTarget");
  self._id_2A97 = undefined;
  self._id_B6BD cleartargetentity();
  _id_114DF();
}

_id_13AD2(var_0) {
  self endon("abandonedMiniTarget");
  self endon("death");

  for (;;) {
  if (!isdefined(self._id_2A97))
  return;

  var_1 = bullettrace(self._id_B6BD.origin, self._id_2A97.origin, 0, self);
  var_2 = distance(self.origin, var_1["position"]);

  if (var_2 > 1024) {
  thread _id_698C();
  return;
  }

  wait 2;
  }
}

_id_13AD3(var_0) {
  self endon("abandonedMiniTarget");
  self endon("death");
  self endon("killedMiniTarget");

  for (;;) {
  var_1 = [];
  var_2 = level.players;

  for (var_3 = 0; var_3 <= var_2.size; var_3++) {
  if (_id_9EA1(var_2[var_3])) {
  if (!isdefined(var_2[var_3]))
  continue;

  if (!isdefined(var_0))
  return;

  var_4 = distance(self.origin, var_0.origin);
  var_5 = distance(self.origin, var_2[var_3].origin);

  if (var_5 < var_4) {
  thread _id_698C();
  return;
  }
  }

  wait 0.05;
  }

  wait 0.25;
  }
}

_id_698C(var_0) {
  self notify("abandonedMiniTarget");
  self._id_2A97 = undefined;
  self._id_B6BD cleartargetentity();

  if (isdefined(var_0) && var_0)
  return;

  thread _id_114DF();
  return;
}

_id_185E() {
  level._id_114E3[self getentitynumber()] = self;
}

_id_E11C() {
  level._id_114E3[self getentitynumber()] = undefined;
}

getnodenearenemies() {
  var_0 = [];

  foreach (var_2 in level.players) {
  if (var_2.team == "spectator")
  continue;

  if (var_2.team == self.team)
  continue;

  if (!isalive(var_2))
  continue;

  var_2._id_56E8 = 0;
  var_0[var_0.size] = var_2;
  }

  if (!var_0.size)
  return undefined;

  for (var_4 = 0; var_4 < var_0.size; var_4++) {
  for (var_5 = var_4 + 1; var_5 < var_0.size; var_5++) {
  var_6 = distancesquared(var_0[var_4].origin, var_0[var_5].origin);
  var_0[var_4]._id_56E8 = var_0[var_4]._id_56E8 + var_6;
  var_0[var_5]._id_56E8 = var_0[var_5]._id_56E8 + var_6;
  }
  }

  var_7 = var_0[0];

  foreach (var_2 in var_0) {
  if (var_2._id_56E8 < var_7._id_56E8)
  var_7 = var_2;
  }

  var_10 = var_7.origin;
  var_11 = sortbydistance(level._id_848E, var_10);
  return var_11[0];
}

_id_FAD8() {
  var_0 = [];
  var_1 = [];
  var_2 = [];
  var_3 = [];
  var_4 = getvehiclenode("startnode", "targetname");
  var_0[var_0.size] = var_4;
  var_1[var_1.size] = var_4;

  while (isdefined(var_4._id_0334)) {
  var_5 = var_4;
  var_4 = getvehiclenode(var_4._id_0334, "targetname");
  var_4._id_D886 = var_5;

  if (var_4 == var_0[0])
  break;

  var_0[var_0.size] = var_4;

  if (!isdefined(var_4._id_0334))
  return;
  }

  var_0[0]._id_2F45 = [];
  var_0[0] thread _id_897F("forward");
  var_3[var_3.size] = var_0[0];
  var_6 = getvehiclenodearray("branchnode", "targetname");

  foreach (var_8 in var_6) {
  var_4 = var_8;
  var_0[var_0.size] = var_4;
  var_1[var_1.size] = var_4;

  while (isdefined(var_4._id_0334)) {
  var_5 = var_4;
  var_4 = getvehiclenode(var_4._id_0334, "targetname");
  var_0[var_0.size] = var_4;
  var_4._id_D886 = var_5;

  if (!isdefined(var_4._id_0334))
  var_2[var_2.size] = var_4;
  }
  }

  foreach (var_4 in var_0) {
  var_11 = 0;

  foreach (var_13 in var_1) {
  if (var_13 == var_4)
  continue;

  if (var_13._id_0334 == var_4._id_0336)
  continue;

  if (isdefined(var_4._id_0334) && var_4._id_0334 == var_13._id_0336)
  continue;

  if (distance2d(var_4.origin, var_13.origin) > 80)
  continue;

  var_13 thread _id_8982(var_4, "reverse");
  var_13._id_D886 = var_4;

  if (!isdefined(var_4._id_2F45))
  var_4._id_2F45 = [];

  var_4._id_2F45[var_4._id_2F45.size] = var_13;
  var_11 = 1;
  }

  if (var_11)
  var_4 thread _id_897F("forward");

  var_15 = 0;

  foreach (var_17 in var_2) {
  if (var_17 == var_4)
  continue;

  if (!isdefined(var_4._id_0334))
  continue;

  if (var_4._id_0334 == var_17._id_0336)
  continue;

  if (isdefined(var_17._id_0334) && var_17._id_0334 == var_4._id_0336)
  continue;

  if (distance2d(var_4.origin, var_17.origin) > 80)
  continue;

  var_17 thread _id_8982(var_4, "forward");
  var_17._id_BF2E = getvehiclenode(var_4._id_0336, "targetname");
  var_17._id_AB5D = distance(var_17.origin, var_4.origin);

  if (!isdefined(var_4._id_2F45))
  var_4._id_2F45 = [];

  var_4._id_2F45[var_4._id_2F45.size] = var_17;
  var_15 = 1;
  }

  if (var_15)
  var_4 thread _id_897F("reverse");

  if (var_15 || var_11)
  var_3[var_3.size] = var_4;
  }

  if (var_3.size < 3) {
  level notify("end_tankPathHandling");
  return;
  }

  var_20 = [];

  foreach (var_4 in var_0) {
  if (!isdefined(var_4._id_2F45))
  continue;

  var_20[var_20.size] = var_4;
  }

  foreach (var_24 in var_20) {
  var_4 = var_24;
  var_25 = 0;

  while (isdefined(var_4._id_0334)) {
  var_26 = var_4;
  var_4 = getvehiclenode(var_4._id_0334, "targetname");
  var_25 = var_25 + distance(var_4.origin, var_26.origin);

  if (var_4 == var_24)
  break;

  if (isdefined(var_4._id_2F45))
  break;
  }

  if (var_25 > 1000) {
  var_4 = var_24;
  var_27 = 0;

  while (isdefined(var_4._id_0334)) {
  var_26 = var_4;
  var_4 = getvehiclenode(var_4._id_0334, "targetname");
  var_27 = var_27 + distance(var_4.origin, var_26.origin);

  if (var_27 < var_25 / 2)
  continue;

  var_4._id_2F45 = [];
  var_4 thread _id_897F("forward");
  var_3[var_3.size] = var_4;
  break;
  }
  }
  }

  level._id_848E = _id_98A6(var_3);

  foreach (var_4 in var_0) {
  if (!isdefined(var_4._id_848D))
  var_4 thread _id_C059();
  }
}

_id_80B4(var_0) {
  var_1 = [];

  foreach (var_4, var_3 in self._id_AD40) {
  if (self._id_AD17[var_4] != var_0)
  continue;

  var_1[var_1.size] = var_3;
  }

  return var_1[randomint(var_1.size)];
}

_id_7FE9(var_0, var_1) {
  var_2 = level._id_848E[self._id_848D];
  var_3 = _id_7732(var_2, var_0, undefined, var_1);
  var_4 = var_3[0]._id_7646;
  var_5 = _id_7732(var_2, var_0, undefined, level._id_C74A[var_1]);
  var_6 = var_5[0]._id_7646;

  if (!getdvarint("tankDebug"))
  var_6 = 9999999;

  if (var_4 <= var_6)
  return var_3[1];
}

_id_897F(var_0) {
  level endon("end_tankPathHandling");

  for (;;) {
  self waittill("trigger", var_1, var_2);
  var_3 = level._id_848E[self._id_848D];
  var_1._id_0205 = self;
  var_4 = undefined;

  if (isdefined(var_1.endnode) && var_1.endnode != var_3) {
  var_4 = _id_7FE9(var_1.endnode, var_1._id_0376);

  if (!isdefined(var_4))
  var_1 thread _id_F6C4(level._id_C74A[var_1._id_0376]);
  }

  if (!isdefined(var_4) || var_4 == var_3)
  var_4 = var_3 _id_80B4(var_1._id_0376);

  var_5 = var_3._id_AD41[var_4._id_848D];

  if (var_1._id_0376 == "forward")
  var_6 = _id_7FE8();
  else
  var_6 = _id_809A();

  if (var_6 != var_5)
  var_1 startpath(var_5);
  }
}

_id_8982(var_0, var_1) {
  for (;;) {
  self waittill("trigger", var_2);

  if (var_2._id_0376 != var_1)
  continue;

  _id_4F52("tank starting path at join node: " + var_0._id_848D);
  var_2 startpath(var_0);
  }
}

_id_C059() {
  self._id_7334 = _id_7EC4()._id_848D;
  self._id_E492 = _id_80EF()._id_848D;

  for (;;) {
  self waittill("trigger", var_0, var_1);
  var_0._id_0205 = self;
  var_0._id_7334 = self._id_7334;
  var_0._id_E492 = self._id_E492;

  if (!isdefined(self._id_0334) || self._id_0336 == "branchnode")
  var_2 = "TRANS";
  else
  var_2 = "NODE";

  if (isdefined(var_1)) {
  _id_4F50(self.origin, var_2, (1, 0.5, 0), 1, 2, 100);
  continue;
  }

  _id_4F50(self.origin, var_2, (0, 1, 0), 1, 2, 100);
  }
}

_id_72EA(var_0, var_1, var_2) {
  var_1 endon("trigger");
  var_0 endon("trigger");
  var_2 endon("death");
  var_3 = distancesquared(var_2.origin, var_1.origin);
  var_4 = var_2._id_0376;
  _id_4F50(var_0.origin + (0, 0, 30), "LAST", (0, 0, 1), 0.5, 1, 100);
  _id_4F50(var_1.origin + (0, 0, 60), "NEXT", (0, 1, 0), 0.5, 1, 100);
  var_5 = 0;

  for (;;) {
  wait 0.05;

  if (var_4 != var_2._id_0376) {
  _id_4F52("tank missed node: reversing direction");
  var_2 thread _id_72EA(var_1, var_0, var_2);
  return;
  }

  if (var_5) {
  _id_4F52("... sending notify.");
  var_1 notify("trigger", var_2, 1);
  return;
  }

  var_6 = distancesquared(var_2.origin, var_1.origin);

  if (var_6 > var_3) {
  var_5 = 1;
  _id_4F52("tank missed node: forcing notify in one frame...");
  }

  var_3 = var_6;
  }
}

_id_7EC4() {
  for (var_0 = self; !isdefined(var_0._id_848D); var_0 = var_0 _id_7FE8()) {}

  return var_0;
}

_id_80EF() {
  for (var_0 = self; !isdefined(var_0._id_848D); var_0 = var_0 _id_809A()) {}

  return var_0;
}

_id_7FE8() {
  if (isdefined(self._id_0334))
  return getvehiclenode(self._id_0334, "targetname");
  else
  return self._id_BF2E;
}

_id_809A() {
  return self._id_D886;
}

_id_98A6(var_0) {
  var_1 = [];

  foreach (var_3 in var_0) {
  var_4 = spawnstruct();
  var_4._id_AD35 = [];
  var_4._id_AD40 = [];
  var_4._id_AD36 = [];
  var_4._id_AD17 = [];
  var_4._id_AD41 = [];
  var_4._id_0205 = var_3;
  var_4.origin = var_3.origin;
  var_4._id_848D = var_1.size;
  var_3._id_848D = var_1.size;
  _id_4F50(var_4.origin + (0, 0, 80), var_4._id_848D, (1, 1, 1), 0.65, 2, 100000);
  var_1[var_1.size] = var_4;
  }

  foreach (var_3 in var_0) {
  var_7 = var_3._id_848D;
  var_8 = getvehiclenode(var_3._id_0334, "targetname");
  var_9 = distance(var_3.origin, var_8.origin);
  var_10 = var_8;

  while (!isdefined(var_8._id_848D)) {
  var_9 = var_9 + distance(var_8.origin, var_8._id_D886.origin);

  if (isdefined(var_8._id_0334)) {
  var_8 = getvehiclenode(var_8._id_0334, "targetname");
  continue;
  }

  var_8 = var_8._id_BF2E;
  }

  var_1[var_7] _id_17EC(var_1[var_8._id_848D], var_9, "forward", var_10);
  var_8 = var_3._id_D886;
  var_9 = distance(var_3.origin, var_8.origin);

  for (var_10 = var_8; !isdefined(var_8._id_848D); var_8 = var_8._id_D886)
  var_9 = var_9 + distance(var_8.origin, var_8._id_D886.origin);

  var_1[var_7] _id_17EC(var_1[var_8._id_848D], var_9, "reverse", var_10);

  foreach (var_12 in var_3._id_2F45) {
  var_8 = var_12;
  var_9 = distance(var_3.origin, var_8.origin);
  var_10 = var_8;

  if (var_8._id_0336 == "branchnode") {
  while (!isdefined(var_8._id_848D)) {
  if (isdefined(var_8._id_0334))
  var_13 = getvehiclenode(var_8._id_0334, "targetname");
  else
  var_13 = var_8._id_BF2E;

  var_9 = var_9 + distance(var_8.origin, var_13.origin);
  var_8 = var_13;
  }

  var_1[var_7] _id_17EC(var_1[var_8._id_848D], var_9, "forward", var_10);
  continue;
  }

  while (!isdefined(var_8._id_848D)) {
  var_9 = var_9 + distance(var_8.origin, var_8._id_D886.origin);
  var_8 = var_8._id_D886;
  }

  var_1[var_7] _id_17EC(var_1[var_8._id_848D], var_9, "reverse", var_10);
  }
  }

  return var_1;
}

_id_17EC(var_0, var_1, var_2, var_3) {
  self._id_AD40[var_0._id_848D] = var_0;
  self._id_AD36[var_0._id_848D] = var_1;
  self._id_AD17[var_0._id_848D] = var_2;
  self._id_AD41[var_0._id_848D] = var_3;
  var_4 = spawnstruct();
  var_4._id_119D3 = var_0;
  var_4._id_119D2 = var_0._id_848D;
  var_4._id_AB5D = var_1;
  var_4._id_00F2 = var_2;
  var_4._id_10DCD = var_3;
  self._id_AD35[var_0._id_848D] = var_4;
}

_id_7732(var_0, var_1, var_2, var_3) {
  level._id_C62D = [];
  level._id_428F = [];
  var_4 = 0;
  var_5 = [];

  if (!isdefined(var_2))
  var_2 = [];

  var_1._id_7646 = 0;
  var_1._id_877B = _id_7F0A(var_1, var_0);
  var_1._id_6A62 = var_1._id_7646 + var_1._id_877B;
  _id_184C(var_1);
  var_6 = var_1;

  for (;;) {
  foreach (var_9, var_8 in var_6._id_AD40) {
  if (scripts\engine\utility::array_contains(var_2, var_8))
  continue;

  if (scripts\engine\utility::array_contains(level._id_428F, var_8))
  continue;

  if (isdefined(var_3) && var_8._id_AD17[var_6._id_848D] != var_3)
  continue;

  if (!scripts\engine\utility::array_contains(level._id_C62D, var_8)) {
  _id_1854(var_8);
  var_8._id_C8F6 = var_6;
  var_8._id_7646 = _id_7EED(var_8, var_6);
  var_8._id_877B = _id_7F0A(var_8, var_0);
  var_8._id_6A62 = var_8._id_7646 + var_8._id_877B;

  if (var_8 == var_0)
  var_4 = 1;

  continue;
  }

  if (var_8._id_7646 < _id_7EED(var_6, var_8))
  continue;

  var_8._id_C8F6 = var_6;
  var_8._id_7646 = _id_7EED(var_8, var_6);
  var_8._id_6A62 = var_8._id_7646 + var_8._id_877B;
  }

  if (var_4)
  break;

  _id_184C(var_6);
  var_10 = level._id_C62D[0];

  foreach (var_12 in level._id_C62D) {
  if (var_12._id_6A62 > var_10._id_6A62)
  continue;

  var_10 = var_12;
  }

  _id_184C(var_10);
  var_6 = var_10;
  }

  for (var_6 = var_0; var_6 != var_1; var_6 = var_6._id_C8F6)
  var_5[var_5.size] = var_6;

  var_5[var_5.size] = var_6;
  return var_5;
}

_id_1854(var_0) {
  var_0._id_C62E = level._id_C62D.size;
  level._id_C62D[level._id_C62D.size] = var_0;
  var_0._id_4290 = undefined;
}

_id_184C(var_0) {
  if (isdefined(var_0._id_4290))
  return;

  var_0._id_4290 = level._id_428F.size;
  level._id_428F[level._id_428F.size] = var_0;

  if (!scripts\engine\utility::array_contains(level._id_C62D, var_0))
  return;

  level._id_C62D[var_0._id_C62E] = level._id_C62D[level._id_C62D.size - 1];
  level._id_C62D[var_0._id_C62E]._id_C62E = var_0._id_C62E;
  level._id_C62D[level._id_C62D.size - 1] = undefined;
  var_0._id_C62E = undefined;
}

_id_7F0A(var_0, var_1) {
  return distance(var_0._id_0205.origin, var_1._id_0205.origin);
}

_id_7EED(var_0, var_1) {
  return var_0._id_C8F6._id_7646 + var_0._id_AD36[var_1._id_848D];
}

_id_5B83(var_0) {
  for (var_1 = 1; var_1 < var_0.size; var_1++) {
  var_2 = var_0[var_1 - 1];
  var_3 = var_0[var_1];

  if (var_2._id_AD17[var_3._id_848D] == "reverse")
  level thread _id_5B7C(var_2._id_0205.origin, var_3._id_0205.origin, (1, 0, 0));
  else
  level thread _id_5B7C(var_2._id_0205.origin, var_3._id_0205.origin, (0, 1, 0));

  var_4 = var_2._id_AD41[var_3._id_848D];
  level thread _id_5B7C(var_2._id_0205.origin + (0, 0, 4), var_4.origin + (0, 0, 4), (0, 0, 1));

  if (var_2._id_AD17[var_3._id_848D] == "reverse") {
  while (!isdefined(var_4._id_848D)) {
  var_5 = var_4;
  var_4 = var_4._id_D886;
  level thread _id_5B7C(var_5.origin + (0, 0, 4), var_4.origin + (0, 0, 4), (0, 1, 1));
  }

  continue;
  }

  while (!isdefined(var_4._id_848D)) {
  var_5 = var_4;

  if (isdefined(var_4._id_0334))
  var_4 = getvehiclenode(var_4._id_0334, "targetname");
  else
  var_4 = var_4._id_BF2E;

  level thread _id_5B7C(var_5.origin + (0, 0, 4), var_4.origin + (0, 0, 4), (0, 1, 1));
  }
  }
}

_id_5B79(var_0) {}

_id_5B7C(var_0, var_1, var_2) {
  level endon("endpath");

  for (;;)
  wait 0.05;
}

_id_4F52(var_0) {}

_id_4F51(var_0) {}

_id_4F50(var_0, var_1, var_2, var_3, var_4, var_5) {}

_id_5B8B() {}
