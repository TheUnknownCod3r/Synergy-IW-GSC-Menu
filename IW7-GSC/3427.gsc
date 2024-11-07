/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3427.gsc
***************************************/

init() {
  _id_0A66::_id_10A34();
  _id_8C64();
  _id_6A78();
  level.facemelter_globs = [];
}

_id_1600(var_0) {
  var_0 thread _id_18F0(var_0);
}

_id_4DD8(var_0) {
  var_0 unlink();

  if (isdefined(level._id_4DD9))
  [[level._id_4DD9]](var_0);
}

_id_18F0(var_0) {
  var_1 = 5;
  var_2 = bullettrace(var_0.origin, var_0.origin + (0, 0, 170), 0, var_0);
  var_3 = var_2["position"];
  var_4 = var_3[2] - var_0.origin[2];
  var_5 = min(var_4, 170) - 70;
  var_6 = spawn("script_origin", var_0.origin);
  var_6.angles = var_0.angles;
  var_0._id_5793 = 1;
  var_0 linkto(var_6);
  var_6 moveto(var_0.origin + (0, 0, var_5), var_1);
  var_7 = var_6 _id_0A77::_id_1372D(level, "deactivate zero g", var_0, "death");

  if (isdefined(var_0))
  var_0._id_5793 = 0;

  var_6 delete();
}

_id_75FA() {
  self endon("death");
  self._id_11196 = 1;
  thread _id_0D53::_id_20E6(self);
  wait 0.5;
  self._id_11196 = undefined;
}

_id_1094D(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11) {
  if (isdefined(self.agent_type) && (self.agent_type == "zombie_brute" || self.agent_type == "zombie_grey"))
  return;

  var_12 = scripts\engine\utility::_id_9CEE(var_1._id_98F3);
  var_13 = scripts\engine\utility::_id_9CEE(self._id_9CDD);
  var_14 = getweaponbasename(var_5);

  if (!isdefined(var_14))
  return;

  var_15 = 0;

  if (!var_13) {
  switch (var_14) {
  case "iw7_headcutter3_zm":
  case "iw7_headcutter2_zm":
  case "iw7_headcutter_zm_pap1":
  case "iw7_headcutter_zm":
  if (var_4 != "MOD_MELEE" && var_2 >= self.health && !scripts\engine\utility::_id_9CEE(self._id_9E0C)) {
  self.health = var_2 + 1;
  self._id_0033 = 1;
  self._id_A64E = var_1;
  thread _id_8C5D(var_1, var_6, var_8, var_2, var_5);
  var_15 = 1;
  }

  break;
  case "iw7_dischord_zm_pap1":
  case "iw7_dischord_zm":
  if (var_4 != "MOD_MELEE" && var_2 >= self.health && !scripts\engine\utility::_id_9CEE(self._id_9E0C)) {
  self.health = var_2 + 1;
  self._id_0033 = 1;
  self._id_A64E = var_1;
  thread _id_5622(var_1, var_6, var_8, var_2, var_5);
  }

  break;
  case "iw7_facemelter_zm_pap1":
  case "iw7_facemelter_zm":
  if (var_4 != "MOD_MELEE" && var_2 >= self.health && !scripts\engine\utility::_id_9CEE(self._id_9E0C)) {
  self.health = var_2 + 1;
  self._id_0033 = 1;
  self._id_A64E = var_1;
  thread _id_6A76(var_1, var_6, var_8, var_2, var_5);
  }

  break;
  case "iw7_shredder_zm_pap1":
  case "iw7_shredder_zm":
  if (var_4 != "MOD_MELEE" && var_2 >= self.health && !scripts\engine\utility::_id_9CEE(self._id_9E0C)) {
  self.health = var_2 + 1;
  self._id_0033 = 1;
  self._id_A64E = var_1;
  thread _id_10167(var_1, var_6, var_8, var_2);
  }

  break;
  default:
  break;
  }

  if (self.health - var_2 < 1) {
  if (isdefined(level._id_B53A)) {
  var_16 = [[level._id_B53A]](self);

  if (isdefined(var_16)) {
  self._id_C026 = 1;
  self._id_BE77 = var_16;
  }
  else
  self._id_BE77 = undefined;
  }

  if (isdefined(level._id_4ADD)) {
  if (isplayer(var_1) && isdefined(var_5) && var_5 != "none") {
  var_17 = [[level._id_4ADD]](self, var_5);

  if (var_17) {
  self._id_C026 = 1;
  self._id_BE74 = 1;
  }
  else
  self._id_BE74 = undefined;
  }
  else
  self._id_BE74 = undefined;
  }
  }
  }

  if (self.health - var_2 < 1) {
  if (isdefined(level.lethaldamage_func))
  [[level.lethaldamage_func]](var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11);

  if (!var_12 && !var_15) {
  if (var_1 _id_0A77::_id_9BA0("headshot_explosion"))
  _id_3DD7(var_1, var_6, var_2, var_4, var_5, var_8, var_13);
  else if (var_1 _id_0A77::_id_8BBE("perk_machine_change"))
  [[level.change_chew_explosion_func]](var_1, var_6, var_2, var_4, var_5, var_8);
  }
  }
}

_id_5622(var_0, var_1, var_2, var_3, var_4) {
  if (isdefined(self._id_AD05))
  return;

  self endon("death");

  if (scripts\engine\utility::_id_9CEE(self._id_9BB0) || self._id_EF64) {
  self._id_5793 = 1;
  self _meth_80B0(self.health + 1000, self.origin, var_0, var_0, "MOD_GRENADE_SPLASH", "iw7_dischorddummy_zm");
  }

  self._id_EF64 = 1;
  var_5 = 0;
  var_6 = _id_0A77::_id_13C90(var_4, "pap1");
  var_7 = 50;

  if (var_6) {
  var_7 = 100;
  self._id_12F77 = 1;
  }

  self._id_5624 = 1;

  if (scripts\engine\utility::_id_9CEE(self._id_9CEC)) {
  thread _id_5625(var_0, var_1, var_2, var_3, var_7, 5);
  playfxontag(level._effect["dischord_tornado"], self, "tag_origin");
  var_5 = 1;

  while (scripts\engine\utility::_id_9CEE(self._id_9CEC))
  wait 0.1;

  self notify("stop_spin");
  }

  thread kill_me_after_timeout(5, "ready_to_spin");

  if (!var_5)
  self setscriptablepartstate("dischord_spin_fx", "active", 1);

  self waittill("ready_to_spin");
  self._id_AD05 = spawn("script_origin", self.origin);
  self._id_AD05 thread _id_A5F3(self);

  if (!var_6)
  self linkto(self._id_AD05);

  thread _id_5625(var_0, var_1, var_2, var_3, var_7, 0.5);
  self._id_AD05 _meth_8271(360, 1.0);
  wait 0.5;
  thread _id_5625(var_0, var_1, var_2, var_3, var_7, 0.5);
  self._id_AD05 _meth_8271(720, 1.0);
  wait 0.5;
  thread _id_5625(var_0, var_1, var_2, var_3, var_7, 1);
  self._id_AD05 _meth_8271(1080, 1.0);
  wait 1;
  thread _id_5625(var_0, var_1, var_2, var_3, var_7, 1);
  self._id_AD05 _meth_8271(1240, 1.0);
  wait 1;

  if (var_6) {
  thread _id_5625(var_0, var_1, var_2, var_3, var_7, 2);
  wait 2;
  }
  else
  thread _id_5625(var_0, var_1, var_2, var_3, var_7, 0.1);

  playloopsound(self.origin, "zombie_dischord_zmb_spin_explo");
  self._id_74B5 = 1;
  self._id_C026 = 1;
  self._id_828A = "dischord_explosion";
  self setscriptablepartstate("dischord_spin_fx", "inactive", 1);
  var_8 = 128;

  if (var_6)
  var_8 = 256;

  if (isdefined(var_0))
  var_0 _meth_8253(self.origin, var_8, 2000, 2000, var_0, "MOD_GRENADE_SPLASH", "iw7_dischorddummy_zm");
  else
  level.players[0] _meth_8253(self.origin, var_8, 2000, 2000, level.players[0], "MOD_GRENADE_SPLASH", "iw7_dischorddummy_zm");

  if (isdefined(self._id_AD05)) {
  self._id_5624 = 0;
  self._id_4E4C = "dischord";
  self _meth_80B0(self.health + 1000, self.origin, var_0, self._id_AD05, "MOD_GRENADE_SPLASH", "iw7_dischorddummy_zm");
  }
}

_id_A5F3(var_0) {
  var_0 waittill("death");
  wait 0.25;
  self delete();
}

kill_me_after_timeout(var_0, var_1) {
  if (isdefined(var_1))
  self endon(var_1);

  wait(var_0);
  self suicide();
}

_id_5625(var_0, var_1, var_2, var_3, var_4, var_5) {
  self endon("death");
  self endon("stop_spin");
  var_6 = var_5;
  var_7 = 0.1;
  var_8 = 2;
  var_3 = 3000;

  if (var_4 == 100)
  var_3 = 7000;

  while (var_6 > 0) {
  var_9 = 0;
  var_10 = scripts\engine\utility::_id_782F(self.origin, level._id_1084F, [self], 30, var_4);

  if (isdefined(var_10)) {
  foreach (var_12 in var_10) {
  if (var_12.agent_type == "zombie_brute" || var_12.agent_type == "zombie_grey")
  continue;

  if (var_12 _id_0F72::_id_5F70())
  continue;

  var_13 = undefined;

  if (scripts\engine\utility::_id_9CEE(self._id_9CEC))
  var_13 = 1;

  if (!scripts\engine\utility::_id_9CEE(var_12._id_4C87)) {
  var_9++;

  if (var_9 >= var_8)
  var_13 = 1;

  var_12 thread _id_6F32(var_3, self._id_AD05, var_0, var_13);
  }
  }
  }

  var_6 = var_6 - var_7;
  wait(var_7);
  }
}

_id_6F32(var_0, var_1, var_2, var_3) {
  self._id_5793 = 1;
  self._id_4C87 = 1;
  self._id_5502 = 1;
  playfx(level._effect["blackhole_trap_death"], self.origin, anglestoforward((-90, 0, 0)), anglestoup((-90, 0, 0)));
  wait 0.05;

  if (scripts\engine\utility::_id_9CEE(var_3)) {
  self._id_C026 = 1;
  self._id_74B5 = 1;

  if (isdefined(var_2))
  self _meth_80B0(self.health + 1000, self.origin, var_2, var_2, "MOD_UNKNOWN", "iw7_dischorddummy_zm");
  else
  self _meth_80B0(self.health + 1000, self.origin, level.players[0], level.players[0], "MOD_UNKNOWN", "iw7_dischorddummy_zm");
  } else {
  self _meth_8366(vectornormalize(self.origin - var_1.origin) * 200 + (0, 0, 800));
  wait 0.1;

  if (isdefined(var_2))
  self _meth_80B0(self.health + 1000, var_1.origin, var_2, var_1, "MOD_UNKNOWN", "iw7_dischorddummy_zm");
  else
  self _meth_80B0(self.health + 1000, var_1.origin, var_1, var_1, "MOD_UNKNOWN", "iw7_dischorddummy_zm");
  }
}

_id_FFA6(var_0) {
  var_1 = 3;

  if (var_0 _id_0A77::_id_8BBE("perk_machine_more"))
  var_1 = 4;

  var_2 = var_0 _meth_8172("primary");
  return var_2.size >= var_1;
}

_id_6A78() {
  level._effect["base_plasma_explosion_enemy"] = loadfx("vfx/iw7/_requests/mp/vfx_plasma_large_explosion_enemy.vfx");
  level._effect["glob_plasma_pool_enemy"] = loadfx("vfx/iw7/_requests/mp/vfx_plasma_med_flames_enemy.vfx");
  level._effect["glob_plasma_impact_enemy"] = loadfx("vfx/iw7/_requests/mp/vfx_plasma_small_explosion_enemy.vfx");
  level._effect["glob_plasma_trail_enemy"] = loadfx("vfx/iw7/_requests/mp/vfx_plasma_trail_enemy.vfx");
  level._effect["dischord_tornado"] = loadfx("vfx/iw7/core/zombie/weapon/dischord/vfx_zmb_dischord_energy_tornado.vfx");
  level._effect["player_plasma_enemy"] = loadfx("vfx/iw7/_requests/mp/power/vfx_splash_grenade_light_en.vfx");
  level._effect["player_plasma_friendly"] = loadfx("vfx/iw7/_requests/mp/power/vfx_splash_grenade_light_fr.vfx");
}

_id_6A76(var_0, var_1, var_2, var_3, var_4) {
  self endon("death");

  if (isdefined(self._id_AD05))
  return;

  self._id_EF64 = 1;
  self._id_0180 = 1;
  var_5 = _id_0A77::_id_13C90(var_4, "pap1");

  if (isdefined(self._id_8C14) && !self._id_8C14) {
  level thread _id_6A77(self, 5, var_0);
  self._id_C026 = 1;
  self _meth_80B0(self.health + 1000, self.origin, var_0, var_0, "MOD_GRENADE_SPLASH", "iw7_facemelterdummy_zm");
  return;
  }
  else if (isdefined(self._id_9CEC)) {
  self._id_E5C9 = 1;
  level thread _id_6A77(self, 5, var_0, var_5, 1);
  self setscriptablepartstate("burning", "active", 1);

  while (scripts\engine\utility::_id_9CEE(self._id_9CEC))
  wait 0.1;
  }

  self._id_E5C9 = 1;

  if (isdefined(self.pooltrigger))
  self.pooltrigger notify("fire_pool_done");

  thread _id_E07F();
  level thread _id_6A77(self, 5, var_0, var_5);

  if (!scripts\engine\utility::_id_9CEE(self._id_9BA7)) {
  thread turn_on_rocket_feet();
  self waittill("ready_to_launch");
  self._id_AD05 = spawn("script_origin", self.origin);
  self._id_AD05.angles = self.angles;
  self._id_AD05 thread _id_A5F3(self);
  self linkto(self._id_AD05);
  var_6 = self.origin + (0, 0, 200);
  var_7 = self aiphysicstrace(self.origin, self.origin + (0, 0, 200), 15, 60, 1, 1);
  var_8 = 1;

  if (isdefined(var_7) && isdefined(var_7["position"])) {
  var_6 = var_7["position"] + (0, 0, -40);
  var_8 = var_6[2] - self._id_AD05.origin[2];

  if (var_8 < 20) {
  var_8 = 20;
  var_6 = (var_6[0], var_6[1], self._id_AD05.origin[2] + 20);
  }

  var_8 = var_8 / 200;
  }

  self._id_AD05 moveto(var_6, var_8);
  wait 0.1;
  self setscriptablepartstate("left_leg", "detached", 1);
  self setscriptablepartstate("right_leg", "detached", 1);
  wait(0.8 * var_8);
  self playsound("zombie_facemelter_rocket_launch");
  } else {
  wait 0.9;
  self._id_74B5 = 1;
  self._id_C026 = 1;
  }

  self setscriptablepartstate("rocket_explosion", "active", 1);
  wait 0.1;
  var_9 = self.origin;
  var_10 = var_0;
  var_11 = var_10.team;

  if (var_5) {
  var_12 = 3;

  for (var_13 = 0; var_13 < var_12; var_13++) {
  var_14 = randomintrange(-200, 200);
  var_15 = randomintrange(-200, 200);
  var_16 = randomintrange(200, 400);
  var_17 = var_9 + (var_14, var_15, var_16) - var_9;
  var_18 = var_0 _meth_8449("zmb_globproj_zm", var_9, var_17, 8);
  var_18.owner = var_0;
  var_18.team = var_0.team;
  var_18._id_12816 = "zmb_globproj_zm";

  if (var_13 == 0)
  var_18 setscriptablepartstate("explosion", "active");
  else
  var_18 setscriptablepartstate("explosion", "neutral");

  var_18 setscriptablepartstate("trail", "active");
  level.facemelter_globs = scripts\engine\utility::_id_1756(level.facemelter_globs, var_18);
  var_18 thread _id_13A8B("iw7_facemelterdummy_zm", var_5);
  scripts\engine\utility::waitframe();
  }
  }

  var_19 = self._id_AD05;

  if (isalive(self)) {
  self._id_E5C9 = 0;
  self setscriptablepartstate("rocket_feet", "inactive", 1);
  self setscriptablepartstate("rocket_explosion", "inactive", 1);

  if (!isdefined(var_0))
  var_0 = undefined;

  self _meth_80B0(self.health + 1000, self.origin, var_0, self._id_AD05, "MOD_GRENADE_SPLASH", "iw7_facemelterdummy_zm");
  }

  if (isdefined(var_19))
  var_19 delete();
}

turn_on_rocket_feet() {
  self endon("death");
  self playsound("zombie_facemelter_rocket_feet");
  self waittill("facemelter_launch_chosen");

  if (scripts\engine\utility::_id_9CEE(self._id_565C))
  wait 0.3;
  else
  wait 0.1;

  self setscriptablepartstate("rocket_feet", "active", 1);
}

_id_E07F() {
  self endon("death");
  wait 6;
  self._id_E5C9 = 0;
}

_id_6A77(var_0, var_1, var_2, var_3, var_4) {
  var_5 = 75;
  var_6 = 30;

  if (isdefined(var_4)) {
  wait 0.1;
  self.pooltrigger = spawn("trigger_rotatable_radius", var_0.origin, 0, var_5, var_6);
  self.pooltrigger thread _id_E7F5(var_0, var_1, var_2, var_3);
  self.pooltrigger thread _id_6D1C(var_1);
  wait(var_1);
  } else {
  var_7 = spawnfx(level._effect["fire_pool_wide"], var_0.origin);
  var_7 playsound("zombie_facemelter_fire_pool");
  wait 0.1;
  var_8 = spawn("trigger_rotatable_radius", var_0.origin, 0, var_5, var_6);
  var_8 thread _id_E7F5(var_0, var_1, var_2, var_3);
  var_8 thread _id_6D1C(var_1);
  var_7 _meth_82EC();
  triggerfx(var_7);
  wait(var_1);
  var_7 delete();
  }
}

_id_E7F5(var_0, var_1, var_2, var_3) {
  self endon("fire_pool_done");
  var_4 = var_1 * 10;

  for (;;) {
  self waittill("trigger", var_5);

  if (isdefined(var_5._id_E5C9)) {
  wait 0.1;
  continue;
  }
  else if (isplayer(var_5)) {
  if (var_2 == var_5 && !scripts\engine\utility::_id_9CEE(var_3) && !isdefined(var_5._id_3294)) {
  if (!scripts\engine\utility::_id_9CEE(var_5._id_98F3)) {
  var_5._id_3294 = 1;
  var_5 thread dodamageandunsetburnstate(var_5, self);
  }
  }

  wait 0.1;
  continue;
  }
  else if (isalive(var_5))
  level thread _id_0A77::_id_4D0D(var_5, var_2, 5, var_5.health + 1000, undefined, "iw7_facemelterdummy_zm", 0, "burning");

  wait 0.1;
  }
}

dodamageandunsetburnstate(var_0, var_1) {
  var_0 notify("doDamageAndUnsetBurnState");
  var_0 endon("doDamageAndUnsetBurnState");
  var_0 endon("disconnect");

  if (isalive(var_0))
  var_0 _meth_80B0(int(var_0.maxhealth * 0.15), var_1.origin, var_1, var_1, "MOD_UNKNOWN", "iw7_facemelterdummy_zm");

  wait 1;
  var_0._id_3294 = undefined;
}

_id_6D1C(var_0) {
  wait(var_0);
  self notify("fire_pool_done");
  self delete();
}

_id_10167(var_0, var_1, var_2, var_3) {
  self endon("death");

  if (_id_0F72::_id_5F70())
  return;

  self._id_10166 = 1;
  self._id_0180 = 1;
  self _meth_841F();
  wait 0.1;
  var_4 = ["left_arm", "right_arm"];
  var_4 = scripts\engine\utility::_id_22A7(var_4);

  if (!scripts\engine\utility::_id_9CEE(self._id_9BA7)) {
  foreach (var_6 in var_4) {
  self setscriptablepartstate(var_6, "disintegrate", 1);
  wait 0.25;
  }

  var_4 = ["right_leg", "left_leg"];
  var_4 = scripts\engine\utility::_id_22A7(var_4);

  foreach (var_6 in var_4) {
  self setscriptablepartstate(var_6, "disintegrate", 1);
  wait 0.25;
  }

  self setscriptablepartstate("shredder_fx", "active", 1);
  wait 0.25;
  self setscriptablepartstate("head", "detached", 1);
  } else {
  foreach (var_6 in var_4) {
  self setscriptablepartstate(var_6, "disintegrate", 1);
  wait 0.1;
  }

  var_4 = ["right_leg", "left_leg"];
  var_4 = scripts\engine\utility::_id_22A7(var_4);

  foreach (var_6 in var_4) {
  self setscriptablepartstate(var_6, "disintegrate", 1);
  wait 0.1;
  }

  self._id_74B5 = 1;
  }

  wait 0.1;
  self._id_C026 = 1;
  self._id_4E4C = "shredder";
  self._id_10166 = 0;
  self _meth_80B0(self.health + 1000, self.origin, var_0, undefined, "MOD_UNKNOWN", "iw7_shredderdummy_zm");
}

_id_3DD7(var_0, var_1, var_2, var_3, var_4, var_5, var_6) {
  var_7 = scripts\engine\utility::_id_9D74(var_3) || var_3 == "MOD_EXPLOSIVE_BULLET" && var_5 != "none";

  if (!var_7)
  return;

  if (!_id_0A77::isheadshot(var_4, var_5, var_3, var_0))
  return;

  var_0 _id_0A77::_id_C151("headshot_explosion");
  thread _id_6996(var_0, var_5, var_2, "bloody_death", undefined, var_6);
}

_id_6996(var_0, var_1, var_2, var_3, var_4, var_5) {
  if (_id_0F72::_id_5F70())
  return;

  if (_id_0A77::agentisfnfimmune())
  return;

  self._id_8C5F = 1;
  var_4 = self gettagorigin("J_Spine4");
  playloopsound(self.origin, "zmb_fnf_headpopper_explo");
  playfx(level._effect[var_3], var_4);

  foreach (var_7 in level.players) {
  if (distance(var_7.origin, var_4) <= 350)
  var_7 thread _id_10142();
  }

  if (isdefined(self._id_8C98))
  self _meth_8096(self._id_8C98);

  if (!var_5)
  self setscriptablepartstate("head", "hide");
}

_id_10142() {
  self notify("turn_on_screen_blood_on");
  self endon("turn_on_screen_blood_on");
  self setscriptablepartstate("on_screen_blood", "on");
  scripts\engine\utility::_id_13736(2, "death", "last_stand");
  self setscriptablepartstate("on_screen_blood", "neutral");
}

_id_8C64() {
  level._effect["head_exploder"] = loadfx("vfx/iw7/_requests/coop/zmb_head_exploder.vfx");
  level._effect["head_expander"] = loadfx("vfx/iw7/_requests/coop/zmb_head_expander.vfx");
  level._effect["head_blood_explosion"] = loadfx("vfx/iw7/_requests/coop/zmb_head_blood_explosion.vfx");
}

_id_8C5D(var_0, var_1, var_2, var_3, var_4) {
  self endon("death");

  if (_id_0F72::_id_5F70())
  return;

  self._id_8C5F = 1;
  wait(randomfloatrange(0.0, 0.5));

  if (!scripts\engine\utility::_id_9CEE(self._id_9BA7))
  self setscriptablepartstate("eyes", "headcutter_eyes");

  self._id_0180 = 1;
  self _meth_841F();
  wait 1;
  self setscriptablepartstate("eyes", "eye_glow_off");
  wait 0.1;
  self setscriptablepartstate("headcutter_fx", "active");
  wait 0.1;
  self setscriptablepartstate("head", "hide", 1);
  wait 0.1;
  var_1 = self gettagorigin("J_Spine4");
  var_0 thread _id_6995(var_0, var_1, self, var_4);

  if (scripts\engine\utility::_id_9CEE(self._id_9BA7)) {
  self._id_74B5 = 1;
  self._id_C026 = 1;
  }

  self _meth_80B0(self.health + 1000, self.origin, var_0, undefined, "MOD_UNKNOWN", "iw7_headcutterdummy_zm");
}

_id_6995(var_0, var_1, var_2, var_3) {
  var_4 = _id_0A77::_id_13C90(var_3, "pap1");
  var_5 = getweaponbasename(var_3);
  var_6 = "iw7_headcutterdummy_zm";
  var_7 = 15000;

  switch (var_5) {
  case "iw7_headcutter_zm_pap1":
  case "iw7_headcutter_zm":
  if (var_4)
  var_6 = "iw7_headcutter2_zm+hcpap1";
  else
  var_6 = "iw7_headcutter2_zm";

  break;
  case "iw7_headcutter2_zm":
  if (var_4)
  var_6 = "iw7_headcutter3_zm+hcpap1";
  else
  var_6 = "iw7_headcutterdummy_zm";

  break;
  }

  var_8 = [];
  var_8 = level._id_1084F;
  var_9 = [var_2];
  var_10 = 128;

  if (var_4)
  var_10 = 256;

  var_11 = scripts\engine\utility::_id_782F(var_1, var_8, var_9, undefined, var_10, 0);

  foreach (var_13 in var_11) {
  if (isdefined(var_13.agent_type) && (var_13.agent_type == "zombie_grey" || var_13.agent_type == "zombie_brute"))
  var_14 = 100;
  else
  var_14 = 100000;

  var_13 _meth_80B0(var_14, var_1, var_0, var_0, "MOD_EXPLOSIVE", var_6);
  }
}

_id_5120(var_0, var_1, var_2, var_3) {
  var_3 endon("disconnect");
  wait(var_0);
  var_4 = magicbullet("iw7_headcuttershards_mp", var_1, var_2, var_3);
}

_id_13C66() {
  self endon("disconnect");
  level endon("game_ended");
  self endon("death");
  self._id_26E1 = 0;
  self._id_C24F = 0;
  self._id_72F6 = 0;
  var_0 = getweaponbasename(self getcurrentprimaryweapon());
  var_1 = self getcurrentweapon();
  var_2 = undefined;

  for (;;) {
  if (isdefined(var_0) && var_0 == "iw7_axe_zm" && self._id_26E1 < 3) {
  _id_0A77::_id_F78C("msg_axe_hint", &"CP_ZOMBIE_AXE_HINT", 4);
  self._id_26E1 = self._id_26E1 + 1;
  }
  else if (isdefined(var_0) && var_0 == "iw7_forgefreeze_zm" && self._id_72F6 < 5) {
  _id_0A77::_id_F78C("msg_axe_hint", &"CP_ZOMBIE_FORGEFREEZE_HINT", 4);
  self._id_72F6 = self._id_72F6 + 1;
  }

  updatecamoscripts(var_1, var_2);
  var_2 = var_1;
  self waittill("weapon_change");
  wait 0.5;
  var_0 = getweaponbasename(self getcurrentprimaryweapon());
  var_1 = self getcurrentweapon();
  }
}

updatecamoscripts(var_0, var_1) {
  if (isdefined(var_0))
  var_2 = getweaponcamoname(var_0);
  else
  var_2 = undefined;

  if (isdefined(var_1))
  var_3 = getweaponcamoname(var_1);
  else
  var_3 = undefined;

  if (!isdefined(var_2))
  var_2 = "none";

  if (!isdefined(var_3))
  var_3 = "none";

  clearcamoscripts(var_1, var_3);
  runcamoscripts(var_0, var_2);
}

runcamoscripts(var_0, var_1) {
  if (!isdefined(var_1))
  return;

  switch (var_1) {
  case "camo211":
  self setscriptablepartstate("camo_211", "reset");
  break;
  case "camo212":
  self setscriptablepartstate("camo_212", "reset");
  break;
  case "camo204":
  self setscriptablepartstate("camo_204", "activate");
  break;
  case "camo205":
  self setscriptablepartstate("camo_205", "activate");
  break;
  case "camo84":
  thread blood_camo_84();
  break;
  case "camo222":
  thread blood_camo_222();
  break;
  case "camo92":
  self setscriptablepartstate("camo_92", "reset");
  break;
  case "camo93":
  self setscriptablepartstate("camo_93", "reset");
  break;
  }
}

clearcamoscripts(var_0, var_1) {
  if (!isdefined(var_1))
  return;

  switch (var_1) {
  case "camo204":
  self setscriptablepartstate("camo_204", "neutral");
  break;
  case "camo205":
  self setscriptablepartstate("camo_205", "neutral");
  break;
  case "camo84":
  self notify("blood_camo_84");
  break;
  case "camo222":
  self notify("blood_camo_222");
  break;
  }
}

blood_camo_84() {
  self endon("disconnect");
  self endon("death");
  self endon("blood_camo_84");

  if (!isdefined(self.bloodcamokillcount))
  self.bloodcamokillcount = 0;

  var_0 = 1;

  for (;;) {
  self waittill("zombie_killed");
  self.bloodcamokillcount = self.bloodcamokillcount + 1;

  if (self.bloodcamokillcount / 5 == var_0) {
  var_1 = int(self.bloodcamokillcount / 5);

  if (var_1 > 14)
  break;

  self setscriptablepartstate("camo_84", var_1 + "_kills");
  var_0++;
  }
  }
}

blood_camo_222() {
  self endon("disconnect");
  self endon("death");
  self endon("blood_camo_222");
  self.katanacamokillcount = 0;
  self setscriptablepartstate("camo_222", "null_state");
  var_0 = 1;

  for (;;) {
  self waittill("zombie_killed");
  self.katanacamokillcount = self.katanacamokillcount + 1;

  if (self.katanacamokillcount / 5 == var_0) {
  var_1 = int(self.katanacamokillcount / 5);

  if (var_1 > 10)
  break;

  self setscriptablepartstate("camo_222", var_1 + "_kills");
  var_0++;
  }
  }
}

_id_26E0() {
  self endon("disconnect");
  level endon("game_ended");
  self endon("death");

  for (;;) {
  self waittill("axe_melee_hit", var_0, var_1, var_2);
  var_3 = getweaponbasename(var_0);
  var_4 = _id_0A6B::_id_7D62(var_3);
  var_5 = _id_7AD8(var_3, var_4);
  var_6 = _id_7AD9(var_3, var_4);
  var_7 = _id_7ADA(var_3, var_4);
  var_8 = _id_3E08(var_5, var_6, var_7);
  thread _id_F653(self);

  foreach (var_10 in var_8) {
  if (var_10 == var_1)
  continue;

  var_10 thread _id_26DF(var_10, self, var_2, var_10.origin, self.origin, var_0, 0.5);
  }
  }
}

_id_F652(var_0) {
  var_0 setscriptablepartstate("axe - idle", "neutral");
  wait 0.5;
  var_0 setscriptablepartstate("axe - idle", "level 1");
}

_id_F653(var_0) {
  var_0 notify("setaxeblooddrip");
  var_0 endon("setaxeblooddrip");
  var_0 setscriptablepartstate("axe", "neutral");
  wait 0.5;
  var_0 setscriptablepartstate("axe", "blood on");
  wait 5;
  var_0 setscriptablepartstate("axe", "neutral");
}

_id_7AD8(var_0, var_1) {
  if (!isdefined(var_0) && !isdefined(var_1))
  return 45;

  switch (var_1) {
  case 2:
  return 52;
  case 3:
  return 60;
  default:
  return 45;
  }
}

_id_7AD9(var_0, var_1) {
  if (!isdefined(var_0) && !isdefined(var_1))
  return 125;

  switch (var_1) {
  case 2:
  return 150;
  case 3:
  return 175;
  default:
  return 125;
  }
}

_id_7ADA(var_0, var_1) {
  if (!isdefined(var_0) && !isdefined(var_1))
  return 1;

  switch (var_1) {
  case 2:
  return 8;
  case 3:
  return 24;
  default:
  return 4;
  }
}

_id_7ADB(var_0, var_1) {
  if (!isdefined(var_0) && !isdefined(var_1))
  return 1100;

  switch (var_1) {
  case 2:
  return 1500;
  case 3:
  return 2000;
  default:
  return 1100;
  }
}

_id_48DD(var_0) {
  var_1 = var_0 / 2;
  var_2 = vectornormalize(anglestoforward(self.angles));
  var_3 = var_2 * var_1;
  var_4 = self.origin + var_3;
  physicsexplosionsphere(var_4, var_1, 1, 2.0);
}

_id_D505() {
  var_0 = spawnfxforclient(level._effect["repulsor_view_red"], self gettagorigin("tag_eye"), self);
  triggerfx(var_0);
  var_0 thread _id_0A77::_id_5106(1);
  playrumbleonentity("slide_collision", self.origin);
  self _meth_844F(0.5, 0.5, self.origin, 62.5);
}

_id_3E08(var_0, var_1, var_2) {
  if (!isdefined(var_2))
  var_2 = 6;

  var_3 = cos(var_0);
  var_4 = [];
  var_5 = _id_0A4A::_id_7DB0("axis");
  var_6 = scripts\engine\utility::_id_782F(self.origin, var_5, undefined, 24, var_1, 1);

  foreach (var_8 in var_6) {
  var_9 = anglestoforward(self.angles);
  var_10 = vectornormalize(var_9) * -25;
  var_11 = 0;
  var_12 = var_8.origin;
  var_13 = scripts\engine\utility::within_fov(self geteye() + var_10, self.angles, var_12 + (0, 0, 30), var_3);

  if (var_13) {
  if (isdefined(var_1)) {
  var_14 = distance2d(self.origin, var_12);

  if (var_14 < var_1)
  var_11 = 1;
  }
  else
  var_11 = 1;
  }

  if (var_11 && var_4.size < var_2)
  var_4[var_4.size] = var_8;
  }

  return var_4;
}

_id_26DF(var_0, var_1, var_2, var_3, var_4, var_5, var_6) {
  var_0 endon("death");

  if (var_0 _id_0CBC::_id_9C50())
  var_0._id_0033 = 1;

  var_0 _meth_80B0(var_2, var_3, var_1, var_1, "MOD_MELEE", var_5);
  wait(var_6);

  if (scripts\engine\utility::_id_9CEE(var_0._id_0033))
  var_0._id_0033 = 0;
}

_id_DF57() {
  self endon("disconnect");
  level endon("game_ended");
  self endon("death");

  for (;;) {
  self waittill("reload_start");
  self waittill("reload");

  if (_id_0A77::_id_9BD8()) {
  var_0 = self getcurrentweapon();
  var_1 = self getweaponammostock(var_0);
  var_2 = weaponclipsize(var_0);
  self setweaponammostock(var_0, var_1 + var_2);
  }
  }
}

_id_211E(var_0) {
  scripts\engine\utility::_id_6E4C("doors_initialized");
  level endon("game_ended");
  var_0 endon("disconnect");
  var_0 endon("death");

  while (!isdefined(var_0._id_111BC))
  wait 0.1;

  var_0 thread unsetstatewhenadswithsniper(var_0);

  for (;;) {
  var_1 = var_0 scripts\engine\utility::waittill_any("weapon_change", "weapon_switch_started", "ads_out");
  var_0 _id_412B(var_0);
  var_0 _id_12976();
  var_0 thread _id_13642(var_0);
  }
}

_id_EF2F() {
  scripts\engine\utility::_id_6E4C("doors_initialized");
  level endon("game_ended");
  self endon("disconnect");

  for (;;) {
  self waittill("scriptableNotification", var_0, var_1, var_2);

  if (!isdefined(var_0))
  continue;

  wait 0.05;
  }
}

unsetstatewhenadswithsniper(var_0) {
  var_0 endon("disconnect");
  var_0 notifyonplayercommand("ads_in", "+speed_throw");
  var_0 notifyonplayercommand("ads_out", "-speed_throw");

  for (;;) {
  var_1 = var_0 scripts\engine\utility::_id_13734("ads_in", "ads_out");

  if (var_0 _id_0A77::_id_4626(var_0 getcurrentweapon()) == "weapon_sniper") {
  if (var_1 == "ads_in") {
  var_0 clear_arcane_scriptable_effects(var_0);
  var_0.pause_arcane_logic = 1;
  continue;
  }

  var_0.pause_arcane_logic = undefined;
  }
  }
}

clear_arcane_scriptable_effects(var_0) {
  var_0 setscriptablepartstate("arcane", "neutral", 1);
}

_id_412B(var_0) {
  var_0 setclientomnvar("zm_ui_specialammo", 0);
  var_0._id_10932 = undefined;
  var_0 setscriptablepartstate("arcane", "neutral", 1);

  if (var_0 _id_0A77::_id_12D6("specialty_explosivebullets"))
  var_0 _id_0A77::_id_1430("specialty_explosivebullets");

  if (var_0 _id_0A77::_id_12D6("specialty_armorpiercing"))
  var_0 _id_0A77::_id_1430("specialty_armorpiercing");

  if (var_0 _id_0A77::_id_12D6("specialty_bulletdamage"))
  var_0 _id_0A77::_id_1430("specialty_bulletdamage");
}

_id_13642(var_0, var_1) {
  level endon("game_ended");
  var_0 notify("wait_for_weapon_switch_done");
  var_0 endon("wait_for_weapon_switch_done");
  var_0 endon("disconnect");
  var_0 endon("weapon_switch_started");

  while (var_0 _meth_81C2())
  wait 0.05;

  var_2 = var_0 getcurrentweapon();
  var_0 notify("weapon_switch_done", var_2);
  var_0 _id_23BB(var_0, undefined, var_2);
  var_0 _id_896F(var_0, var_2);
}

_id_23BB(var_0, var_1, var_2) {
  if (scripts\engine\utility::_id_9CEE(var_0.pause_arcane_logic))
  return;

  if (!isdefined(var_1)) {
  if (!isdefined(var_2))
  var_2 = self getcurrentweapon();

  if (!issubstr(var_2, "ark"))
  return;

  var_3 = strtok(var_2, "+");

  foreach (var_5 in var_3) {
  if (issubstr(var_5, "ark")) {
  var_1 = var_5;
  break;
  }
  }
  }

  if (!isdefined(var_1))
  var_1 = "blank";

  switch (var_1) {
  case "arkblue_sm":
  case "arkblue_akimbo":
  case "blue":
  case "arkblue":
  self setclientomnvar("zm_ui_specialammo", 1);
  self._id_10932 = "stun_ammo";
  self.special_ammo_weapon = var_2;

  if (!_id_0A77::_id_12D6("specialty_bulletdamage"))
  _id_0A77::giveperk("specialty_bulletdamage");

  _id_0A77::_id_1430("specialty_explosivebullets");
  _id_0A77::_id_1430("specialty_armorpiercing");
  self setscriptablepartstate("arcane", "blue_on", 0);
  break;
  case "arkgreen_sm":
  case "arkgreen_akimbo":
  case "arkgreen":
  case "green":
  self._id_10932 = "poison_ammo";
  self setclientomnvar("zm_ui_specialammo", 0);
  _id_0A77::_id_1430("specialty_explosivebullets");
  _id_0A77::_id_1430("specialty_armorpiercing");
  _id_0A77::_id_1430("specialty_bulletdamage");
  self setscriptablepartstate("arcane", "green_on", 0);
  break;
  case "arkyellow_sm":
  case "arkyellow_akimbo":
  case "yellow":
  case "arkyellow":
  self setclientomnvar("zm_ui_specialammo", 3);
  self._id_10932 = "explosive_ammo";

  if (!_id_0A77::_id_12D6("specialty_explosivebullets"))
  _id_0A77::giveperk("specialty_explosivebullets");

  _id_0A77::_id_1430("specialty_armorpiercing");
  _id_0A77::_id_1430("specialty_bulletdamage");
  self setscriptablepartstate("arcane", "yellow_on", 0);
  break;
  case "arkred_sm":
  case "arkred_akimbo":
  case "arkred":
  case "red":
  self setclientomnvar("zm_ui_specialammo", 2);
  self._id_10932 = "incendiary_ammo";
  _id_0A77::_id_1430("specialty_explosivebullets");
  _id_0A77::_id_1430("specialty_armorpiercing");
  _id_0A77::_id_1430("specialty_bulletdamage");
  self setscriptablepartstate("arcane", "red_on", 0);
  break;
  case "arkpink_sm":
  case "arkpink_akimbo":
  case "arkpink_lmg":
  case "arkpink":
  case "pink":
  self setclientomnvar("zm_ui_specialammo", 5);
  self._id_10932 = "combined_ammo";

  if (!_id_0A77::_id_12D6("specialty_bulletdamage"))
  _id_0A77::giveperk("specialty_bulletdamage");

  if (!_id_0A77::_id_12D6("specialty_armorpiercing"))
  _id_0A77::giveperk("specialty_armorpiercing");

  self setscriptablepartstate("arcane", "pink_on", 0);
  break;
  default:
  self setclientomnvar("zm_ui_specialammo", 0);
  self._id_10932 = undefined;
  _id_0A77::_id_1430("specialty_explosivebullets");
  _id_0A77::_id_1430("specialty_armorpiercing");
  _id_0A77::_id_1430("specialty_bulletdamage");
  self setscriptablepartstate("arcane", "neutral", 0);
  break;
  }
}

_id_896F(var_0, var_1) {
  if (!isdefined(var_1))
  var_1 = self getcurrentweapon();

  var_2 = getweaponbasename(var_1);
  _id_12976();

  if (isdefined(var_2)) {
  switch (var_2) {
  case "iw7_facemelter_zm_pap1":
  case "iw7_facemelter_zm":
  self setscriptablepartstate("facemelter", "active");
  break;
  case "iw7_headcutter_zm_pap1":
  case "iw7_headcutter_zm":
  self setscriptablepartstate("headcutter", "active");
  break;
  case "iw7_dischord_zm_pap1":
  case "iw7_dischord_zm":
  self setscriptablepartstate("dischord", "active");
  break;
  case "iw7_shredder_zm_pap1":
  case "iw7_shredder_zm":
  self setscriptablepartstate("shredder", "active");
  break;
  }
  }
}

_id_12976() {
  self setscriptablepartstate("headcutter", "inactive");
  self setscriptablepartstate("facemelter", "inactive");
  self setscriptablepartstate("dischord", "inactive");
  self setscriptablepartstate("shredder", "inactive");
}

_id_782A(var_0) {
  var_1 = strtok(var_0, "+");

  foreach (var_3 in var_1) {
  var_4 = getsubstr(var_3, 0, 3);

  if (var_4 == "ark") {
  switch (var_3) {
  case "arkblueburst":
  case "arkblueshotgun":
  case "arkblueautospread":
  case "arkblueauto":
  case "arkbluesingle":
  return "arkblue";
  case "arkgreenburst":
  case "arkgreenshotgun":
  case "arkgreenautospread":
  case "arkgreenauto":
  case "arkgreensingle":
  return "arkgreen";
  case "arkyellowburst":
  case "arkyellowshotgun":
  case "arkyellowautospread":
  case "arkyellowauto":
  case "arkyellowsingle":
  return "arkyellow";
  case "arkpinkburst":
  case "arkpinkshotgun":
  case "arkpinkautospread":
  case "arkpinkauto":
  case "arkpinksingle":
  return "arkpink";
  case "arkredburst":
  case "arkredshotgun":
  case "arkredautospread":
  case "arkredauto":
  case "arkredsingle":
  return "arkred";
  case "arkwhiteburst":
  case "arkwhiteshotgun":
  case "arkwhiteautospread":
  case "arkwhiteauto":
  case "arkwhitesingle":
  return "arkwhite";
  }
  }
  }

  return undefined;
}

_id_13C1C(var_0) {
  var_1 = self getweaponslistprimaries();

  foreach (var_3 in var_1) {
  if (var_3 == var_0)
  return 1;
  }

  return 0;
}

_id_13A8B(var_0, var_1) {
  self endon("death");
  thread remove_from_glob_array_on_death();
  self waittill("missile_stuck", var_2);

  if (!isdefined(self.owner))
  return;

  self setscriptablepartstate("trail", "neutral");
  self setscriptablepartstate("explosion", "active");
  playloopsound(self.origin, "plasma_grenade_impact");
  radiusdamage(self.origin, 128, 10, 5, self.owner, "MOD_EXPLOSIVE", var_0);

  if (level.facemelter_globs.size > 5) {
  self delete();
  return;
  }

  var_3 = spawn("trigger_rotatable_radius", self.origin, 0, 60, 60);
  var_3.angles = self.angles;
  var_3.owner = self.owner;
  var_3.team = self.owner.team;
  var_3 thread _id_13B0E(var_0, var_1);
  var_3 thread _id_0A77::_id_5106(8);
  var_3 thread _id_511D(0.1, "plasma_grenade_fire_glob");
  self._id_D654 = "poolGround";
  self setscriptablepartstate("poolGround", "active");
  wait 8;
  self setscriptablepartstate(self._id_D654, "activeEnd", 0);
  self delete();
}

remove_from_glob_array_on_death() {
  self waittill("death");
  level.facemelter_globs = scripts\engine\utility::array_remove(level.facemelter_globs, self);
}

_id_10D82(var_0, var_1, var_2, var_3, var_4) {
  self endon("death");
  self endon("disconnect");
  var_1 endon("disconnect");
  self._id_10D94 = 1;
  self._id_10D93 = undefined;
  self._id_9B81 = 1;
  thread _id_13A91();
  thread _id_13B5A(var_0, var_1);

  if (isdefined(level._id_10A32) && isalive(self) && isdefined(self._id_1096F) && self._id_1096F == "zombie")
  self thread [[level._id_10A32]](self);
  else
  {}

  thread _id_10B72(var_0, var_1, var_2, var_3, var_4);
}

_id_CD19(var_0, var_1, var_2) {
  var_3 = undefined;
  var_3 = spawnfx(scripts\engine\utility::_id_7ECB(var_1), var_0);

  if (isdefined(var_3))
  triggerfx(var_3);

  var_3 thread _id_0A77::_id_5106(var_2);
  return var_3;
}

_id_13B0E(var_0, var_1) {
  self endon("death");
  self.owner endon("disconnect");

  for (;;) {
  self waittill("trigger", var_2);

  if (_id_0A77::isreallyalive(var_2) && !isdefined(var_2._id_10D94) && (var_2.team != self.owner.team || var_2 == self.owner)) {
  if (var_1) {
  if (var_2 == self.owner)
  continue;
  }

  var_2 notify("start_plasma_stand");
  var_2 thread _id_10D82(var_0, self.owner, 33, 0.5, self);
  var_2 thread _id_13AAB(self);
  }
  }
}

_id_13AAB(var_0) {
  self endon("death");
  self endon("disconnect");

  for (;;) {
  if (!isdefined(var_0) || !self istouching(var_0)) {
  self notify("plasma_dot_end");
  break;
  }

  scripts\engine\utility::waitframe();
  }
}

_id_13A91() {
  level endon("game_ended");
  self endon("death");
  scripts\engine\utility::waittill_any("plasma_dot_end");
  self._id_10D94 = undefined;
  self._id_10D93 = undefined;
  self._id_83E1 = undefined;
  self._id_9B81 = undefined;
  stopfxontag(scripts\engine\utility::_id_7ECB("glob_plasma_trail_enemy"), self, "j_mainroot");
  stopfxontag(scripts\engine\utility::_id_7ECB("player_plasma_enemy"), self, "j_mainroot");
  stopfxontag(scripts\engine\utility::_id_7ECB("player_plasma_friendly"), self, "j_mainroot");
}

_id_13B5A(var_0, var_1) {
  self endon("death");
  self endon("disconnect");
  self endon("plasma_dot_end");
  var_1 endon("disconnect");
  self waittill("start_plasma_linger");
  var_2 = 1;
  var_3 = 25;
  var_4 = 1;
  self._id_10D94 = undefined;
  self._id_10D93 = 1;
  var_5 = spawnfxforclient(scripts\engine\utility::_id_7ECB("player_plasma_screen_linger"), self geteye(), self);
  triggerfx(var_5);
  var_5 thread _id_0A77::_id_5106(1);
  var_5 thread _id_0A77::_id_51C7(self);
  var_5 thread _id_51CA(self);
  thread _id_4D61(var_0, var_1, var_3, var_4, var_2, "start_plasma_stand", "plasma_dot_end");
}

_id_51C3(var_0) {
  self endon("death");
  var_0 endon("death");
  var_0 endon("disconnect");
  var_0 waittill("plasma_dot_end");

  if (isdefined(self))
  self delete();
}

_id_511B(var_0, var_1, var_2, var_3) {
  var_2 endon("death");
  wait(var_0);

  if (isdefined(var_2) && isdefined(self))
  playfxontagforclients(scripts\engine\utility::_id_7ECB(var_1), var_2, var_3, self);
}

_id_10B72(var_0, var_1, var_2, var_3, var_4) {
  self endon("death");
  self endon("disconnect");
  var_1 endon("disconnect");

  if (isdefined(var_4))
  var_4 endon("death");

  var_5 = int(var_2 / 4);
  var_6 = var_3;
  childthread _id_4D61(var_0, var_1, var_5, var_6, undefined, "start_stage2_plasma");
  wait 1;
  self notify("start_stage2_plasma");
  var_5 = int(var_2 / 2);
  var_6 = var_3 / 2;
  childthread _id_4D61(var_0, var_1, var_5, var_6, undefined, "start_stage3_plasma");
  wait 0.5;
  self notify("start_stage3_plasma");
  var_5 = var_2;
  var_6 = var_3 / 4;
  childthread _id_4D61(var_0, var_1, var_5, var_6);
}

_id_4D61(var_0, var_1, var_2, var_3, var_4, var_5, var_6) {
  self endon("death");
  self endon("disconnect");

  if (isdefined(var_5))
  self endon(var_5);

  var_1 endon("disconnect");

  if (!isdefined(var_4)) {
  for (;;) {
  self _meth_80B0(var_2, self.origin, var_1, undefined, "MOD_EXPLOSIVE", var_0);
  self._id_6E82 = gettime() + 500;
  wait(var_3);
  }
  } else {
  if (var_3 > var_4)
  return;

  var_7 = var_2;

  if (self.health <= var_7) {
  self _meth_80B0(var_2, self.origin, var_1, undefined, "MOD_EXPLOSIVE", var_0);
  self._id_6E82 = gettime() + 500;
  }

  while (var_4 > 0) {
  if (self.health > 15 && self.health - var_2 < 15)
  var_2 = var_2 - (15 - (self.health - var_2));

  if (self.health > var_7 && self.health <= 15)
  var_2 = 1;

  if (var_2 > 0) {
  self _meth_80B0(var_2, self.origin, var_1, undefined, "MOD_EXPLOSIVE", var_0);
  self._id_6E82 = gettime() + 500;
  }

  var_4 = var_4 - var_3;
  wait(var_3);
  }

  if (isdefined(var_6))
  self notify(var_6);
  }
}

_id_51CA(var_0) {
  self endon("death");
  var_0 endon("death");
  var_0 endon("disconnect");
  var_0 waittill("start_plasma_stand");

  if (isdefined(self))
  self delete();
}

_id_511D(var_0, var_1) {
  self endon("death");
  wait(var_0);
  self playsound(var_1);
}