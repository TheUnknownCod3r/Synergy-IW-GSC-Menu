/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2673.gsc
***************************************/

init() {
  level._effect["boombox_c4light"] = loadfx("vfx/iw7/_requests/coop/vfx_boombox_blink");
  level._effect["boombox_explode"] = loadfx("vfx/iw7/_requests/coop/vfx_ghetto_blast.vfx");
  var_0 = spawnstruct();
  var_0._id_11901 = 18.0;
  var_0._id_B91A = "boom_box_c4_wm";
  var_0._id_B924 = "boom_box_c4_wm";
  var_0._id_B925 = "boom_box_c4_wm_bad";
  var_0._id_CC12 = "boom_box_c4_wm";
  var_0._id_CC28 = &"COOP_CRAFTABLES_PLACE";
  var_0._id_38E3 = &"COOP_CRAFTABLES_CANNOT_PLACE";
  var_0._id_CC0A = &"COOP_CRAFTABLES_PLACE_CANCELABLE";
  var_0._id_CC22 = 30.0;
  var_0._id_CC25 = 16.0;
  var_0._id_3AA7 = (0, 0, 35);
  var_0._id_3AA6 = (0, 180, 0);
  level._id_47AE = [];
  level._id_47AE["crafted_boombox"] = var_0;
}

_id_82B4(var_0, var_1) {
  var_1 thread _id_13932();
  var_1 notify("new_power", "crafted_boombox");
  var_1 setclientomnvar("zom_crafted_weapon", 5);
  var_1 thread _id_0A77::_id_1308C(var_1, "iw7_pickup_zm");
  _id_0A77::_id_F313("crafted_boombox", ::_id_82B4, var_1);
}

_id_13932() {
  self endon("disconnect");
  self endon("death");
  self notify("craft_dpad_watcher");
  self endon("craft_dpad_watcher");
  self notifyonplayercommand("pullout_boombox", "+actionslot 3");

  for (;;) {
  self waittill("pullout_boombox");

  if (scripts\engine\utility::_id_9CEE(self._id_9D81))
  continue;

  if (scripts\engine\utility::_id_9CEE(self._id_AD2C))
  continue;

  if (isdefined(self.allow_carry) && self.allow_carry == 0)
  continue;

  if (_id_0A77::_id_9D05())
  break;
  }

  thread _id_82A8(1);
}

_id_82A8(var_0, var_1) {
  self endon("disconnect");
  _id_0A77::_id_41C4("msg_power_hint");
  var_2 = _id_4989(self);
  self._id_A039 = var_2.name;
  _id_E152();
  var_2 = _id_4989(self);
  self._id_3AA5 = var_2;
  var_2._id_6DEC = 1;
  var_3 = _id_F682(var_2, var_0, var_1);
  self._id_3AA5 = undefined;
  thread _id_1370F();
  self._id_9D81 = 0;

  if (isdefined(var_2))
  return 1;
  else
  return 0;
}

_id_F682(var_0, var_1, var_2) {
  self endon("disconnect");
  var_0 _id_2CA3(self, var_1);
  scripts\engine\utility::_id_1C71(0);
  self notifyonplayercommand("place_boombox", "+attack");
  self notifyonplayercommand("place_boombox", "+attack_akimbo_accessible");
  self notifyonplayercommand("cancel_boombox", "+actionslot 3");

  if (!level._id_4542) {
  self notifyonplayercommand("cancel_boombox", "+actionslot 5");
  self notifyonplayercommand("cancel_boombox", "+actionslot 6");
  self notifyonplayercommand("cancel_boombox", "+actionslot 7");
  }

  for (;;) {
  var_3 = scripts\engine\utility::_id_13734("place_boombox", "cancel_boombox", "force_cancel_placement");

  if (!isdefined(var_0)) {
  scripts\engine\utility::_id_1C71(1);
  return 1;
  }

  if (!isdefined(var_3))
  var_3 = "force_cancel_placement";

  if (var_3 == "cancel_boombox" || var_3 == "force_cancel_placement") {
  if (!var_1 && var_3 == "cancel_boombox")
  continue;

  scripts\engine\utility::_id_1C71(1);
  var_0 _id_2CA2();

  if (var_3 != "force_cancel_placement")
  thread _id_13932();
  else if (var_1)
  _id_0A77::_id_DFE0(self);

  return 0;
  }

  if (!var_0._id_3872)
  continue;

  if (var_1)
  _id_0A77::_id_DFE0(self);

  var_0 _id_2CA5(var_2, self);
  scripts\engine\utility::_id_1C71(1);
  return 1;
  }
}

_id_E18E() {
  if (self.hasriotshield) {
  var_0 = _id_0A77::_id_E55C();
  self._id_E2E6 = var_0;
  self._id_E556 = self getammocount(var_0);
  self _meth_83B8(var_0);
  }
}

_id_E152() {
  if (_id_0A77::_id_12D6("specialty_explosivebullets")) {
  self._id_E2DF = "specialty_explosivebullets";
  _id_0A77::_id_1430("specialty_explosivebullets");
  }
}

_id_E2E8() {
  if (isdefined(self._id_E2E6)) {
  _id_0A77::_id_12C6(self._id_E2E6);

  if (self.hasriotshield) {
  var_0 = _id_0A77::_id_E55C();
  self setweaponammoclip(var_0, self._id_E556);
  }
  }

  self._id_E2E6 = undefined;
}

_id_E2E0() {
  if (isdefined(self._id_E2DF)) {
  _id_0A77::giveperk(self._id_E2DF);
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

_id_4989(var_0) {
  var_1 = spawnturret("misc_turret", var_0.origin + (0, 0, 25), "sentry_minigun_mp");
  var_1.angles = var_0.angles;
  var_1.owner = var_0;
  var_1.name = "crafted_boombox";
  var_1._id_3A9C = spawn("script_model", var_1.origin);
  var_1._id_3A9C.angles = var_0.angles;
  var_1 maketurretinoperable();
  var_1 _meth_835B(1);
  var_1 _meth_830F("sentry_offline");
  var_1 makeunusable();
  var_1 _meth_8336(var_0);
  var_1 _id_2CA0(var_0);
  return var_1;
}

_id_2CA0(var_0) {
  self._id_3872 = 1;
  _id_2CA4();
}

_id_2C9E(var_0) {
  self waittill("death");

  if (!isdefined(self))
  return;

  _id_2CA4();
  self playsound("sentry_explode");

  if (isdefined(self._id_3CBF))
  self._id_3CBF delete();

  if (isdefined(self._id_13E61))
  self._id_13E61 delete();

  _id_0A77::_id_E11E();

  if (isdefined(self))
  self delete();
}

_id_2CA5(var_0, var_1) {
  var_2 = getgroundposition(self._id_3A9C.origin, 4);
  var_3 = spawn("script_model", self._id_3A9C.origin);
  var_3.angles = self._id_3A9C.angles;
  var_3 solid();
  var_3 setmodel(level._id_47AE["crafted_boombox"]._id_CC12);
  var_3 physicslaunchserver(var_3.origin, (0, 0, 1));
  self._id_3A9D _meth_80F3();
  self._id_3A9D = undefined;
  var_1._id_9D81 = 0;
  self._id_3A9C delete();
  self delete();
  var_3 moveto(var_2, 0.5);
  wait 0.6;
  var_4 = spawn("script_model", var_3.origin);
  var_4.angles = var_3.angles;
  var_4.owner = var_1;
  var_4.team = "allies";
  var_4 setmodel(level._id_47AE["crafted_boombox"]._id_CC12);
  var_4.name = "crafted_boombox";
  var_3 delete();
  var_4._id_A9A9 = gettime();
  var_4._id_A9C2 = gettime();
  var_4 thread _id_2CA1(var_0);
  var_4 playsound("trap_boom_box_drop");
  self notify("placed");
}

_id_2CA2() {
  self._id_3A9D _meth_80F3();

  if (isdefined(self.owner))
  self.owner._id_9D81 = 0;

  self._id_3A9C delete();
  self delete();
}

_id_2CA3(var_0, var_1) {
  if (isdefined(self._id_C731)) {} else {}

  self setmodel(level._id_47AE["crafted_boombox"]._id_B924);
  self hide();
  self _meth_8335(var_0);
  self setcandamage(0);
  self._id_3A9D = var_0;
  var_0._id_9D81 = 1;
  var_0 thread _id_0A77::_id_12E3F(self, self._id_3A9C, level._id_47AE["crafted_boombox"], 1);
  thread _id_0A77::_id_A025(var_0);
  thread _id_0A77::_id_A026(var_0);
  thread _id_0A77::_id_A027(var_0);
  _id_2CA4();
  self notify("carried");
}

_id_2CA1(var_0) {
  _id_48A7((1, 1, 0), 0, 10, 48);
  thread _id_2C9E(self.owner);
  thread _id_0A77::_id_A021("elecboombox_handleOwner");
  thread _id_0A77::_id_A030(var_0, level._id_47AE["crafted_boombox"]._id_11901, "explode");
  thread _id_2CA6();
  thread _id_2C9D();
  _id_0A77::_id_1861();
  wait 1;
  playfxontag(level._effect["boombox_c4light"], self, "c4_fx_tag");
}

_id_2CA4() {
  _id_0A77::_id_E11E();
}

_id_2CA6() {
  self endon("death");
  self endon("boombox_explode");
  self._id_4D7E = [];
  self playloopsound("mus_zombies_boombox");
  var_0 = 262144;

  for (;;) {
  var_1 = _id_0A4A::_id_7DB0("axis");
  var_1 = scripts\engine\utility::_id_782F(self.origin, var_1);

  foreach (var_3 in var_1) {
  if (!_id_0A77::_id_FF18(var_3) || var_3._id_152C)
  continue;

  if (scripts\engine\utility::_id_9CEE(self._id_9CDD))
  continue;

  if (distancesquared(self.origin, var_3.origin) < var_0) {
  var_4 = _id_78AD(self, var_3);
  var_3 thread _id_841C(self, var_4);
  var_3 thread _id_DF44(self);
  scripts\engine\utility::waitframe();
  }
  }

  wait 0.1;
  }
}

_id_841C(var_0, var_1) {
  var_0 endon("death");
  var_0 endon("boombox_explode");
  self endon("death");
  self endon("turned");
  self._id_152C = 1;
  self._id_EF64 = 1;
  self._id_C37F = self._id_015C;
  self._id_015C = 32;
  var_2 = var_0.origin - var_1.origin;
  var_3 = vectortoangles(var_2);
  self._id_5273 = (0, var_3[1], 0);
  self _meth_82EF(var_1.origin);
  scripts\engine\utility::waittill_any("goal", "goal_reached");
  self._id_9BB0 = 1;
  var_0._id_4D7E[var_0._id_4D7E.size] = self;
}

_id_DF44(var_0) {
  self endon("death");
  var_0 scripts\engine\utility::waittill_any("boombox_explode", "death");

  if (isdefined(self._id_C37F))
  self._id_015C = self._id_C37F;

  self._id_C37F = undefined;
  self._id_152C = 0;
  self._id_EF64 = 0;
}

_id_2C9D() {
  self waittill("explode");
  self playsound("mus_zombies_boombox_slow_down");
  self stoploopsound();
  self playsound("trap_boombox_warning");
  self notify("boombox_explode");
  wait(lookupsoundlength("mus_zombies_boombox_slow_down") / 1000);
  self playsound("trap_boom_box_explode");
  playfx(level._effect["boombox_explode"], self.origin);
  physicsexplosionsphere(self.origin, 256, 256, 2);
  var_0 = self._id_4D7E;
  var_1 = 0;
  var_2 = 65536;

  foreach (var_4 in var_0) {
  if (var_1 > 5) {
  var_4._id_C026 = 1;
  var_4._id_74B5 = 1;
  var_4._id_4E4C = "boombox";
  var_4 _meth_80B0(var_4.health + 100, self.origin, self, self, "MOD_EXPLOSIVE", "zmb_imsprojectile_mp");
  continue;
  }

  var_4 _meth_8366(vectornormalize(var_4.origin - self.origin) * 400 + (0, 0, 200));
  var_4._id_5793 = 1;
  var_4._id_4C87 = 1;
  var_4 thread _id_2C9C(self);
  var_1++;
  }

  scripts\engine\utility::waitframe();
  radiusdamage(self.origin + (0, 0, 40), 350, 1000000, 1000000, self, "MOD_EXPLOSIVE", "zmb_imsprojectile_mp");
  self hide();
  wait 3;
  self notify("death");
}

_id_2C9C(var_0) {
  self endon("death");
  wait 0.1;
  self _meth_80B0(self.health + 100, self.origin, var_0, var_0, "MOD_EXPLOSIVE", "zmb_imsprojectile_mp");
}

_id_78AD(var_0, var_1) {
  var_2 = sortbydistance(var_0._id_254B, var_1.origin);

  foreach (var_4 in var_2) {
  if (!var_4._id_C2CF) {
  var_4._id_C2CF = 1;
  return var_4;
  }
  }

  return var_2[0];
}

_id_48A7(var_0, var_1, var_2, var_3) {
  self endon("death");
  var_4 = 38416;
  var_5 = 0;
  var_6 = 360 / var_2;
  self._id_254B = [];
  self._id_C2D1 = 0;
  self._id_563E = 0;

  for (var_7 = var_1; var_7 < 360 + var_1; var_7 = var_7 + var_6) {
  var_8 = var_0 * var_3;
  var_9 = (cos(var_7) * var_8[0] - sin(var_7) * var_8[1], sin(var_7) * var_8[0] + cos(var_7) * var_8[1], var_8[2]);
  var_10 = getclosestpointonnavmesh(self.origin + var_9 + (0, 0, 10));

  if (!_id_0A76::_id_9C0E(var_10))
  continue;

  if (isdefined(var_10) && distancesquared(var_10, self.origin) > var_4)
  continue;
  else
  {
  if (abs(var_10[2] - self.origin[2]) < 60) {
  if (level.script != "cp_disco") {
  if (ispointinvolume(var_10, level._id_4D7C)) {
  if (isdefined(level._id_563D))
  continue;
  else if (!self._id_563E) {
  self._id_563E = 1;
  var_11 = scripts\engine\utility::_id_8180("interaction_discoballtrap", "script_noteworthy");
  level thread _id_0A59::_id_9A0D(var_11[0], 30);
  }
  }
  }

  var_12 = spawnstruct();
  var_12.origin = var_10;
  var_12._id_C2CF = 0;
  self._id_254B[self._id_254B.size] = var_12;
  continue;
  }

  var_5++;
  }
  }

  for (var_7 = var_1; var_7 < 360 + var_1; var_7 = var_7 + var_6) {
  var_8 = var_0 * (var_3 + 56);
  var_9 = (cos(var_7) * var_8[0] - sin(var_7) * var_8[1], sin(var_7) * var_8[0] + cos(var_7) * var_8[1], var_8[2]);
  var_10 = getclosestpointonnavmesh(self.origin + var_9 + (0, 0, 10));

  if (!_id_0A76::_id_9C0E(var_10))
  continue;

  if (isdefined(var_10) && distancesquared(var_10, self.origin) > var_4)
  continue;
  else
  {
  if (abs(var_10[2] - self.origin[2]) < 60) {
  var_12 = spawnstruct();
  var_12.origin = var_10;
  var_12._id_C2CF = 0;
  self._id_254B[self._id_254B.size] = var_12;
  continue;
  }

  var_5++;
  }
  }

  return var_5;
}
