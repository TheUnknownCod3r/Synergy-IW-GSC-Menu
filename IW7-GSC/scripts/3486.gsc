/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3486.gsc
***************************************/

_id_2A6A(var_0, var_1, var_2) {
  var_3 = getent("airstrikeheight", "targetname");

  if (isdefined(var_3))
  var_4 = var_3.origin[2];
  else if (isdefined(level._id_1AF8))
  var_4 = 850 * level._id_1AF8;
  else
  var_4 = 850;

  var_2 = var_2 * (1, 1, 0);
  var_5 = var_2 + (0, 0, var_4);
  var_6 = _id_10845(var_0, self, var_1, var_5);
  var_6._id_C96C = var_5;
  return var_6;
}

_id_7E3E(var_0, var_1, var_2) {
  var_3 = 1200;
  var_4 = _id_11A87(var_0, var_1);
  var_5 = var_4 + var_3;

  if (isdefined(level._id_1AF8) && var_5 < 850 * level._id_1AF8)
  var_5 = 950 * level._id_1AF8;

  var_5 = var_5 + randomint(var_2);
  return var_5;
}

_id_10845(var_0, var_1, var_2, var_3) {
  var_4 = vectortoangles(var_3 - var_2);
  var_5 = spawnhelicopter(var_1, var_2, var_4, "harrier_mp", "vehicle_av8b_harrier_jet_mp");

  if (!isdefined(var_5))
  return;

  var_5 _id_184E();
  var_5 thread _id_E10A();
  var_5 thread _id_8992();
  var_5._id_02B3 = 250;
  var_5._id_1545 = 175;
  var_5.health = 2500;
  var_5.maxhealth = var_5.health;
  var_5.team = var_1.team;
  var_5.owner = var_1;
  var_5 setcandamage(1);
  var_5.owner = var_1;
  var_5 thread _id_8B5B();
  var_5 setmaxpitchroll(0, 90);
  var_5 vehicle_setspeed(var_5._id_02B3, var_5._id_1545);
  var_5 thread _id_D494();
  var_5 _meth_82CE(3);
  var_5._id_B898 = 6;
  var_5.pers["team"] = var_5.team;
  var_5 sethoverparams(50, 100, 50);
  var_5 _meth_8354(0.05);
  var_5 setyawspeed(45, 25, 25, 0.5);
  var_5._id_5087 = var_3;
  var_5._id_AC68 = var_0;
  var_5._id_1C9F = 1;
  var_5._id_9E20 = 1;
  var_5._id_4D2E = ::_id_3758;
  level._id_8B5F = scripts\engine\utility::_id_22BC(level._id_8B5F);
  level._id_8B5F[level._id_8B5F.size] = var_5;
  level._id_8B58 = undefined;
  return var_5;
}

_id_5088(var_0) {
  var_0 endon("death");
  var_0 thread _id_8B61();
  var_0 setvehgoalpos(var_0._id_C96C, 1);
  var_0 thread _id_42AB(var_0._id_C96C);
  var_0 waittill("goal");
  var_0 _id_11075();
  var_0 _id_658C();
  var_0 thread _id_B9FF();
}

_id_42AB(var_0) {
  self endon("goal");
  self endon("death");

  for (;;) {
  if (distance2d(self.origin, var_0) < 768) {
  self setmaxpitchroll(45, 25);
  break;
  }

  wait 0.05;
  }
}

_id_658C() {
  self notify("engageGround");
  self endon("engageGround");
  self endon("death");
  thread _id_8B5D();
  thread _id_DCB0();
  var_0 = self._id_5087;
  self vehicle_setspeed(15, 5);
  self setvehgoalpos(var_0, 1);
  self waittill("goal");
}

_id_8B5E() {
  self endon("death");
  self setmaxpitchroll(0, 0);
  self notify("leaving");
  _id_2FC0(1);
  self notify("stopRand");

  for (;;) {
  self vehicle_setspeed(35, 25);
  var_0 = self.origin + anglestoforward((0, randomint(360), 0)) * 500;
  var_0 = var_0 + (0, 0, 900);
  var_1 = bullettrace(self.origin, self.origin + (0, 0, 900), 0, self);

  if (var_1["surfacetype"] == "none")
  break;

  wait 0.1;
  }

  self setvehgoalpos(var_0, 1);
  thread _id_10DA1();
  self waittill("goal");
  self playsoundonmovingent("harrier_fly_away");
  var_2 = _id_8051();
  self vehicle_setspeed(250, 75);
  self setvehgoalpos(var_2, 1);
  self waittill("goal");
  level._id_8B5F[level._id_8B5F.size - 1] = undefined;
  self notify("harrier_gone");
  thread _id_8B5A();
}

_id_8B5A() {
  self delete();
}

_id_8B61() {
  self endon("death");
  scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause(90);
  _id_8B5E();
}

_id_DCB0() {
  self notify("randomHarrierMovement");
  self endon("randomHarrierMovement");
  self endon("stopRand");
  self endon("death");
  self endon("acquiringTarget");
  self endon("leaving");
  var_0 = self._id_5087;

  for (;;) {
  var_1 = _id_7FE2(self.origin);
  self setvehgoalpos(var_1, 1);
  self waittill("goal");
  wait(randomintrange(1, 2));
  self notify("randMove");
  }
}

_id_7FE2(var_0, var_1) {
  self endon("stopRand");
  self endon("death");
  self endon("acquiringTarget");
  self endon("leaving");

  if (!isdefined(var_1)) {
  var_2 = [];

  foreach (var_4 in level.players) {
  if (var_4 == self)
  continue;

  if (!level.teambased || var_4.team != self.team)
  var_2[var_2.size] = var_4.origin;
  }

  if (var_2.size > 0) {
  var_6 = averagepoint(var_2);
  var_7 = var_6[0];
  var_8 = var_6[1];
  } else {
  var_9 = level.mapcenter;
  var_10 = level._id_B339 / 4;
  var_7 = randomfloatrange(var_9[0] - var_10, var_9[0] + var_10);
  var_8 = randomfloatrange(var_9[1] - var_10, var_9[1] + var_10);
  }

  var_11 = _id_7E3E(var_7, var_8, 20);
  }
  else if (scripts\engine\utility::_id_4347()) {
  var_12 = self.origin - self._id_2A9A.origin;
  var_7 = var_12[0];
  var_8 = var_12[1] * -1;
  var_11 = _id_7E3E(var_7, var_8, 20);
  var_13 = (var_8, var_7, var_11);

  if (distance2d(self.origin, var_13) > 1200) {
  var_8 = var_8 * 0.5;
  var_7 = var_7 * 0.5;
  var_13 = (var_8, var_7, var_11);
  }
  } else {
  if (distance2d(self.origin, self._id_2A9A.origin) < 200)
  return;

  var_14 = self.angles[1];
  var_15 = (0, var_14, 0);
  var_16 = self.origin + anglestoforward(var_15) * randomintrange(200, 400);
  var_11 = _id_7E3E(var_16[0], var_16[1], 20);
  var_7 = var_16[0];
  var_8 = var_16[1];
  }

  for (;;) {
  var_17 = _id_11A8A(var_7, var_8, var_11);

  if (var_17 != 0)
  return var_17;

  var_7 = randomfloatrange(var_0[0] - 1200, var_0[0] + 1200);
  var_8 = randomfloatrange(var_0[1] - 1200, var_0[1] + 1200);
  var_11 = _id_7E3E(var_7, var_8, 20);
  }
}

_id_11A8A(var_0, var_1, var_2) {
  self endon("stopRand");
  self endon("death");
  self endon("acquiringTarget");
  self endon("leaving");
  self endon("randMove");

  for (var_3 = 1; var_3 <= 10; var_3++) {
  switch (var_3) {
  case 1:
  var_4 = bullettrace(self.origin, (var_0, var_1, var_2), 0, self);
  break;
  case 2:
  var_4 = bullettrace(self gettagorigin("tag_left_wingtip"), (var_0, var_1, var_2), 0, self);
  break;
  case 3:
  var_4 = bullettrace(self gettagorigin("tag_right_wingtip"), (var_0, var_1, var_2), 0, self);
  break;
  case 4:
  var_4 = bullettrace(self gettagorigin("tag_engine_left2"), (var_0, var_1, var_2), 0, self);
  break;
  case 5:
  var_4 = bullettrace(self gettagorigin("tag_engine_right2"), (var_0, var_1, var_2), 0, self);
  break;
  case 6:
  var_4 = bullettrace(self gettagorigin("tag_right_alamo_missile"), (var_0, var_1, var_2), 0, self);
  break;
  case 7:
  var_4 = bullettrace(self gettagorigin("tag_left_alamo_missile"), (var_0, var_1, var_2), 0, self);
  break;
  case 8:
  var_4 = bullettrace(self gettagorigin("tag_right_archer_missile"), (var_0, var_1, var_2), 0, self);
  break;
  case 9:
  var_4 = bullettrace(self gettagorigin("tag_left_archer_missile"), (var_0, var_1, var_2), 0, self);
  break;
  case 10:
  var_4 = bullettrace(self gettagorigin("tag_light_tail"), (var_0, var_1, var_2), 0, self);
  break;
  default:
  var_4 = bullettrace(self.origin, (var_0, var_1, var_2), 0, self);
  }

  if (var_4["surfacetype"] != "none")
  return 0;

  wait 0.05;
  }

  var_5 = (var_0, var_1, var_2);
  return var_5;
}

_id_11A87(var_0, var_1) {
  self endon("death");
  self endon("acquiringTarget");
  self endon("leaving");
  var_2 = -9999999;
  var_3 = 9999999;
  var_4 = -9999999;
  var_5 = self.origin[2];
  var_6 = undefined;
  var_7 = undefined;

  for (var_8 = 1; var_8 <= 5; var_8++) {
  switch (var_8) {
  case 1:
  var_9 = bullettrace((var_0, var_1, var_5), (var_0, var_1, var_4), 0, self);
  break;
  case 2:
  var_9 = bullettrace((var_0 + 20, var_1 + 20, var_5), (var_0 + 20, var_1 + 20, var_4), 0, self);
  break;
  case 3:
  var_9 = bullettrace((var_0 - 20, var_1 - 20, var_5), (var_0 - 20, var_1 - 20, var_4), 0, self);
  break;
  case 4:
  var_9 = bullettrace((var_0 + 20, var_1 - 20, var_5), (var_0 + 20, var_1 - 20, var_4), 0, self);
  break;
  case 5:
  var_9 = bullettrace((var_0 - 20, var_1 + 20, var_5), (var_0 - 20, var_1 + 20, var_4), 0, self);
  break;
  default:
  var_9 = bullettrace(self.origin, (var_0, var_1, var_4), 0, self);
  }

  if (var_9["position"][2] > var_2) {
  var_2 = var_9["position"][2];
  var_6 = var_9;
  }
  else if (var_9["position"][2] < var_3) {
  var_3 = var_9["position"][2];
  var_7 = var_9;
  }

  wait 0.05;
  }

  return var_2;
}

_id_D494() {
  self endon("death");
  wait 0.2;
  playfxontag(level._id_7546, self, "tag_right_wingtip");
  playfxontag(level._id_7546, self, "tag_left_wingtip");
  wait 0.2;
  playfxontag(level._id_8B56, self, "tag_engine_right");
  playfxontag(level._id_8B56, self, "tag_engine_left");
  wait 0.2;
  playfxontag(level._id_8B56, self, "tag_engine_right2");
  playfxontag(level._id_8B56, self, "tag_engine_left2");
  wait 0.2;
  playfxontag(level._id_3F19["light"]["left"], self, "tag_light_L_wing");
  wait 0.2;
  playfxontag(level._id_3F19["light"]["right"], self, "tag_light_R_wing");
  wait 0.2;
  playfxontag(level._id_3F19["light"]["belly"], self, "tag_light_belly");
  wait 0.2;
  playfxontag(level._id_3F19["light"]["tail"], self, "tag_light_tail");
}

_id_11075() {
  stopfxontag(level._id_7546, self, "tag_right_wingtip");
  stopfxontag(level._id_7546, self, "tag_left_wingtip");
}

_id_10DA1() {
  wait 3.0;

  if (!isdefined(self))
  return;

  playfxontag(level._id_7546, self, "tag_right_wingtip");
  playfxontag(level._id_7546, self, "tag_left_wingtip");
}

_id_8054(var_0) {
  var_1 = 100;
  var_2 = 15000;
  var_3 = 850;
  var_4 = randomfloat(360);
  var_5 = (0, var_4, 0);
  var_6 = var_0 + anglestoforward(var_5) * (-1 * var_2);
  var_6 = var_6 + ((randomfloat(2) - 1) * var_1, (randomfloat(2) - 1) * var_1, 0);
  return var_6;
}

_id_8051() {
  var_0 = 150;
  var_1 = 15000;
  var_2 = 850;
  var_3 = self.angles[1];
  var_4 = (0, var_3, 0);
  var_5 = self.origin + anglestoforward(var_4) * var_1;
  return var_5;
}

_id_6D7A(var_0, var_1) {
  self endon("leaving");
  self endon("stopfiring");
  self endon("explode");
  self endon("death");
  self._id_2A9A endon("death");
  self._id_2A9A endon("disconnect");
  var_2 = gettime();
  var_3 = gettime();
  var_4 = 0;
  self _meth_8365("harrier_20mm_mp");

  if (!isdefined(var_1))
  var_1 = 50;

  for (;;) {
  if (_id_9F16(var_0))
  break;
  else
  wait 0.25;
  }

  self setturrettargetent(self._id_2A9A, (0, 0, 50));
  var_5 = 25;

  for (;;) {
  if (var_5 == 25)
  self playloopsound("weap_hind_20mm_fire_npc");

  var_5--;
  self fireweapon("tag_flash", self._id_2A9A, (0, 0, 0), 0.05);
  wait 0.1;

  if (var_5 <= 0) {
  self stoploopsound();
  wait 1;
  var_5 = 25;
  }
  }
}

_id_9F16(var_0) {
  self endon("death");
  self endon("leaving");

  if (!isdefined(var_0))
  var_0 = 10;

  var_1 = anglestoforward(self.angles);
  var_2 = self._id_2A9A.origin - self.origin;
  var_1 = var_1 * (1, 1, 0);
  var_2 = var_2 * (1, 1, 0);
  var_2 = vectornormalize(var_2);
  var_1 = vectornormalize(var_1);
  var_3 = vectordot(var_2, var_1);
  var_4 = cos(var_0);

  if (var_3 >= var_4)
  return 1;
  else
  return 0;
}

_id_1570(var_0) {
  self endon("death");
  self endon("leaving");

  if (var_0.size == 1)
  self._id_2A9A = var_0[0];
  else
  self._id_2A9A = _id_7E05(var_0);

  _id_2737(0);
  self notify("acquiringTarget");
  self setturrettargetent(self._id_2A9A);
  self setlookatent(self._id_2A9A);
  var_1 = _id_7FE2(self.origin, 1);

  if (!isdefined(var_1))
  var_1 = self.origin;

  self setvehgoalpos(var_1, 1);
  thread _id_13B74();
  thread _id_13B77();
  self _meth_8365("harrier_20mm_mp");
  thread _id_6D7A();
}

_id_2737(var_0) {
  self setvehgoalpos(self._id_5087, 1);

  if (isdefined(var_0) && var_0)
  self waittill("goal");
}

_id_13DCF(var_0) {
  var_1 = bullettrace(self.origin, var_0, 1, self);

  if (var_1["position"] == var_0)
  return 0;
  else
  return 1;
}

_id_13B74() {
  self notify("watchTargetDeath");
  self endon("watchTargetDeath");
  self endon("newTarget");
  self endon("death");
  self endon("leaving");
  self._id_2A9A waittill("death");
  thread _id_2FC0();
}

_id_13B77(var_0) {
  self endon("death");
  self._id_2A9A endon("death");
  self._id_2A9A endon("disconnect");
  self endon("leaving");
  self endon("newTarget");
  var_1 = undefined;

  if (!isdefined(var_0))
  var_0 = 1000;

  for (;;) {
  if (!_id_9F97(self._id_2A9A)) {
  thread _id_2FC0();
  return;
  }

  if (!isdefined(self._id_2A9A)) {
  thread _id_2FC0();
  return;
  }

  if (self._id_2A9A sightconetrace(self.origin, self) < 1) {
  if (!isdefined(var_1))
  var_1 = gettime();

  if (gettime() - var_1 > var_0) {
  thread _id_2FC0();
  return;
  }
  }
  else
  var_1 = undefined;

  wait 0.25;
  }
}

_id_2FC0(var_0) {
  self endon("death");
  self _meth_8076();
  self stoploopsound();
  self notify("stopfiring");

  if (isdefined(var_0) && var_0)
  return;

  thread _id_DCB0();
  self notify("newTarget");
  thread _id_8B5D();
}

_id_8B5D() {
  self notify("harrierGetTargets");
  self endon("harrierGetTargets");
  self endon("death");
  self endon("leaving");
  var_0 = [];

  for (;;) {
  var_0 = [];
  var_1 = level.players;

  if (isdefined(level._id_3F14) && level._id_3F14.team != self.team && isalive(level._id_3F14)) {
  if (!isdefined(level._id_3F14._id_C084) || isdefined(level._id_3F14._id_C084) && !level._id_3F14._id_C084) {
  thread _id_6591(level._id_3F14);
  return;
  }
  else
  _id_2737(1);
  }

  if (isdefined(level._id_AD8B)) {
  foreach (var_3 in level._id_AD8B) {
  if (isdefined(var_3) && var_3.team != self.team && (isdefined(var_3._id_8DCF) && var_3._id_8DCF == "heli_pilot")) {
  thread _id_6591(var_3);
  return;
  }
  }
  }

  for (var_5 = 0; var_5 < var_1.size; var_5++) {
  var_6 = var_1[var_5];

  if (_id_9F97(var_6)) {
  if (isdefined(var_1[var_5]))
  var_0[var_0.size] = var_1[var_5];
  }
  else
  continue;

  wait 0.05;
  }

  if (var_0.size > 0) {
  _id_1570(var_0);
  return;
  }

  wait 1;
  }
}

_id_9F97(var_0) {
  self endon("death");

  if (!isalive(var_0) || var_0.sessionstate != "playing")
  return 0;

  if (isdefined(self.owner) && var_0 == self.owner)
  return 0;

  if (distance(var_0.origin, self.origin) > 8192)
  return 0;

  if (distance2d(var_0.origin, self.origin) < 150)
  return 0;

  if (!isdefined(var_0.pers["team"]))
  return 0;

  if (level.teambased && var_0.pers["team"] == self.team)
  return 0;

  if (var_0.pers["team"] == "spectator")
  return 0;

  if (isdefined(var_0._id_10916) && (gettime() - var_0._id_10916) / 1000 <= 5)
  return 0;

  if (var_0 scripts\mp\utility\game::_id_12D6("specialty_blindeye"))
  return 0;

  var_1 = self.origin + (0, 0, -160);
  var_2 = anglestoforward(self.angles);
  var_3 = var_1 + 144 * var_2;
  var_4 = var_0 sightconetrace(self.origin, self);

  if (var_4 < 1)
  return 0;

  return 1;
}

_id_7E05(var_0) {
  self endon("death");
  var_1 = self gettagorigin("tag_flash");
  var_2 = self.origin;
  var_3 = anglestoforward(self.angles);
  var_4 = undefined;
  var_5 = undefined;
  var_6 = 0;

  foreach (var_8 in var_0) {
  var_9 = abs(vectortoangles(var_8.origin - self.origin)[1]);
  var_10 = abs(self gettagangles("tag_flash")[1]);
  var_9 = abs(var_9 - var_10);
  var_11 = var_8 getweaponlistitems();

  foreach (var_13 in var_11) {
  if (issubstr(var_13, "at4") || issubstr(var_13, "stinger") || issubstr(var_13, "jav"))
  var_9 = var_9 - 40;
  }

  if (distance(self.origin, var_8.origin) > 2000)
  var_9 = var_9 + 40;

  if (!isdefined(var_4)) {
  var_4 = var_9;
  var_5 = var_8;
  continue;
  }

  if (var_4 > var_9) {
  var_4 = var_9;
  var_5 = var_8;
  }
  }

  return var_5;
}

_id_6D75(var_0) {
  self endon("death");
  self endon("leaving");

  if (self._id_B898 <= 0)
  return;

  var_1 = _id_3E13(var_0, 256);

  if (!isdefined(var_0))
  return;

  if (distance2d(self.origin, var_0.origin) < 512)
  return;

  if (isdefined(var_1) && var_1)
  return;

  self._id_B898--;
  self _meth_8365("aamissile_projectile_mp");

  if (isdefined(var_0._id_1155F))
  var_2 = self fireweapon("tag_flash", var_0._id_1155F, (0, 0, -250));
  else
  var_2 = self fireweapon("tag_flash", var_0, (0, 0, -250));

  var_2 _meth_8204();
  var_2 _meth_8206(var_0);
}

_id_3E13(var_0, var_1) {
  self endon("death");
  self endon("leaving");
  var_2 = [];
  var_3 = level.players;
  var_4 = var_0.origin;

  for (var_5 = 0; var_5 < var_3.size; var_5++) {
  var_6 = var_3[var_5];

  if (var_6.team != self.team)
  continue;

  var_7 = var_6.origin;

  if (distance2d(var_7, var_4) < 512)
  return 1;
  }

  return 0;
}

_id_8992() {
  self waittill("damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9);

  if (var_9 == "aamissile_projectile_mp" && var_4 == "MOD_EXPLOSIVE" && var_0 >= self.health)
  _id_3758(var_1, var_1, 9001, 0, var_4, var_9, var_3, var_2, var_3, 0, 0, var_7);
}

_id_3758(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11) {
  if ((var_1 == self || isdefined(var_1.pers) && var_1.pers["team"] == self.team && !level._id_740A && level.teambased) && var_1 != self.owner)
  return;

  if (self.health <= 0)
  return;

  var_2 = scripts\mp\damage::_id_8975(var_5, var_4, var_2);

  switch (var_5) {
  case "iw6_rocketmutli_mp":
  case "iw6_rocketplyr_mp":
  case "remotemissile_projectile_mp":
  case "odin_projectile_large_rod_mp":
  case "javelin_mp":
  case "stinger_mp":
  case "ac130_40mm_mp":
  case "ac130_105mm_mp":
  self._id_A859 = 1;
  var_2 = self.maxhealth + 1;
  break;
  case "at4_mp":
  case "rpg_mp":
  self._id_A859 = 1;
  var_2 = self.maxhealth - 900;
  break;
  case "odin_projectile_small_rod_mp":
  case "remote_tank_projectile_mp":
  var_2 = int(self.maxhealth * 0.34);
  self._id_A859 = 1;
  break;
  case "iw6_panzerfaust3_mp":
  case "switch_blade_child_mp":
  case "drone_hive_projectile_mp":
  var_2 = int(self.maxhealth * 0.25);
  self._id_A859 = 1;
  break;
  default:
  if (var_5 != "none")
  var_2 = int(var_2 / 2);

  self._id_A859 = 0;
  break;
  }

  scripts\mp\killstreaks\killstreaks::_id_A6A0(var_1, var_5, self);
  var_1 scripts\mp\damagefeedback::updatedamagefeedback("");

  if (isplayer(var_1) && var_1 scripts\mp\utility\game::_id_12D6("specialty_armorpiercing")) {
  var_12 = int(var_2 * level._id_218B);
  var_2 = var_2 + var_12;
  }

  if (self.health <= var_2) {
  if (isplayer(var_1) && (!isdefined(self.owner) || var_1 != self.owner)) {
  thread scripts\mp\utility\game::_id_115DE("callout_destroyed_harrier", var_1);
  var_1 thread scripts\mp\utility\game::_id_83B4("kill", var_5);
  var_1 notify("destroyed_killstreak");
  }

  if (var_5 == "heli_pilot_turret_mp")
  var_1 scripts\mp\missions::_id_D992("ch_enemy_down");

  scripts\mp\missions::_id_3DE3(var_1, self, var_5);
  self notify("death");
  }

  if (self.health - var_2 <= 900 && (!isdefined(self._id_1037E) || !self._id_1037E)) {
  thread _id_CF0B();
  self._id_1037E = 1;
  }

  self vehicle_finishdamage(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11);
}

_id_CF0B() {
  self endon("death");
  stopfxontag(level._id_8B56, self, "tag_engine_left");
  playfxontag(level._id_8B59, self, "tag_engine_left");
  stopfxontag(level._id_8B56, self, "tag_engine_right");
  playfxontag(level._id_8B59, self, "tag_engine_right");
  wait 0.15;
  stopfxontag(level._id_8B56, self, "tag_engine_left2");
  playfxontag(level._id_8B59, self, "tag_engine_left2");
  stopfxontag(level._id_8B56, self, "tag_engine_right2");
  playfxontag(level._id_8B59, self, "tag_engine_right2");
  playfxontag(level._id_3F19["damage"]["heavy_smoke"], self, "tag_engine_left");
}

_id_8B5B() {
  self endon("harrier_gone");
  self waittill("death");

  if (!isdefined(self))
  return;

  if (!isdefined(self._id_A859)) {
  self vehicle_setspeed(25, 5);
  thread _id_8B60(randomintrange(180, 220));
  wait(randomfloatrange(0.5, 1.5));
  }

  _id_8B5C();
}

_id_8B5C() {
  self playsound("harrier_jet_crash");
  level._id_8B5F[level._id_8B5F.size - 1] = undefined;
  var_0 = self gettagangles("tag_deathfx");
  playfx(level._id_8B57, self gettagorigin("tag_deathfx"), anglestoforward(var_0), anglestoup(var_0));
  self notify("explode");
  wait 0.05;
  thread _id_8B5A();
}

_id_8B60(var_0) {
  self endon("explode");
  playfxontag(level._id_3F19["explode"]["medium"], self, "tag_origin");
  self setyawspeed(var_0, var_0, var_0);

  while (isdefined(self)) {
  self _meth_8348(self.angles[1] + var_0 * 0.9);
  wait 1;
  }
}

_id_6591(var_0) {
  var_0 endon("death");
  var_0 endon("leaving");
  var_0 endon("crashing");
  self endon("death");
  _id_1574(var_0);
  thread _id_6D7C();
}

_id_6D7C() {
  self endon("leaving");
  self endon("stopfiring");
  self endon("explode");
  self._id_2A9A endon("crashing");
  self._id_2A9A endon("leaving");
  self._id_2A9A endon("death");
  var_0 = gettime();

  if (isdefined(self._id_2A9A) && self._id_2A9A.classname == "script_vehicle") {
  self setturrettargetent(self._id_2A9A);

  for (;;) {
  var_1 = distance2d(self.origin, self._id_2A9A.origin);

  if (gettime() - var_0 > 2500 && var_1 > 1000) {
  _id_6D75(self._id_2A9A);
  var_0 = gettime();
  }

  wait 0.1;
  }
  }
}

_id_1574(var_0) {
  self endon("death");
  self endon("leaving");
  self notify("newTarget");
  self._id_2A9A = var_0;
  self notify("acquiringVehTarget");
  self setlookatent(self._id_2A9A);
  thread _id_13B9E();
  thread _id_13B9D();
  self setturrettargetent(self._id_2A9A);
}

_id_13B9D() {
  self endon("death");
  self endon("leaving");
  self._id_2A9A endon("death");
  self._id_2A9A endon("drop_crate");
  self._id_2A9A waittill("crashing");
  _id_2FC1();
}

_id_13B9E() {
  self endon("death");
  self endon("leaving");
  self._id_2A9A endon("crashing");
  self._id_2A9A endon("drop_crate");
  self._id_2A9A waittill("death");
  _id_2FC1();
}

_id_2FC1() {
  self _meth_8076();

  if (isdefined(self._id_2A9A) && !isdefined(self._id_2A9A._id_C084))
  self._id_2A9A._id_C084 = 1;

  self notify("stopfiring");
  self notify("newTarget");
  thread _id_11075();
  thread _id_658C();
}

_id_67E4() {
  self setmaxpitchroll(15, 80);
  self vehicle_setspeed(50, 100);
  self setyawspeed(90, 30, 30, 0.5);
  var_0 = self.origin;
  var_1 = self.angles[1];

  if (scripts\engine\utility::_id_4347())
  var_2 = (0, var_1 + 90, 0);
  else
  var_2 = (0, var_1 - 90, 0);

  var_3 = self.origin + anglestoforward(var_2) * 500;
  self setvehgoalpos(var_3, 1);
  self waittill("goal");
}

_id_184E() {
  level._id_8DD3[self getentitynumber()] = self;
}

_id_E10A() {
  var_0 = self getentitynumber();
  self waittill("death");
  level._id_8DD3[var_0] = undefined;
}

_id_B9FF() {
  self endon("death");
  self endon("leaving");

  if (!isdefined(self.owner) || self.owner.team != self.team) {
  thread _id_8B5E();
  return;
  }

  self.owner scripts\engine\utility::waittill_any("joined_team", "disconnect");
  thread _id_8B5E();
}
