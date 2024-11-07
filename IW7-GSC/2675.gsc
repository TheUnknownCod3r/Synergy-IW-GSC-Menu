/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2675.gsc
***************************************/

init() {
  level._id_6DA3 = [];
  var_0 = spawnstruct();
  var_0._id_039B = "zmb_fireworksprojectile_mp";
  var_0._id_B91A = "park_fireworks_trap";
  var_0._id_B924 = "park_fireworks_trap_good";
  var_0._id_B925 = "park_fireworks_trap_bad";
  var_0._id_017B = &"COOP_CRAFTABLES_PICKUP";
  var_0._id_CC28 = &"COOP_CRAFTABLES_PLACE";
  var_0._id_38E3 = &"COOP_CRAFTABLES_CANNOT_PLACE";
  var_0._id_CC0A = &"COOP_CRAFTABLES_PLACE_CANCELABLE";
  var_0._id_AC71 = 120.0;
  var_0._id_DDAC = 2;
  var_0._id_8487 = 0.4;
  var_0._id_C228 = 12;
  var_0._id_6A03 = "park_fireworks_trap_rocket";
  var_0._id_CC22 = 30.0;
  var_0._id_CC25 = 16.0;
  var_0._id_3AA7 = (0, 0, 35);
  var_0._id_3AA6 = (0, 0, 0);
  level._id_6DA3["crafted_ims"] = var_0;
}

_id_82B5(var_0, var_1) {
  var_1 thread _id_13932();
  var_1 notify("new_power", "crafted_ims");
  var_1 setclientomnvar("zom_crafted_weapon", 2);
  var_1 thread _id_0A77::_id_1308C(var_1, "iw7_pickup_zm");
  _id_0A77::_id_F313("crafted_ims", ::_id_82B5, var_1);
}

_id_13932() {
  self endon("death");
  self endon("disconnect");
  self notify("craft_dpad_watcher");
  self endon("craft_dpad_watcher");
  self notifyonplayercommand("pullout_ims", "+actionslot 3");

  for (;;) {
  self waittill("pullout_ims");

  if (scripts\engine\utility::_id_9CEE(self._id_9D81))
  continue;

  if (scripts\engine\utility::_id_9CEE(self._id_AD2C))
  continue;

  if (isdefined(self.allow_carry) && self.allow_carry == 0)
  continue;

  if (_id_0A77::_id_9D05())
  break;
  }

  thread _id_82CA("crafted_ims");
}

_id_82CA(var_0) {
  self endon("disconnect");
  _id_0A77::_id_41C4("msg_power_hint");
  var_1 = _id_48EB(var_0, self);
  self._id_A039 = var_1.name;
  _id_0A77::_id_E077();
  self._id_3A9A = var_1;
  var_1._id_6DEC = 1;
  var_2 = _id_F684(var_1, 1);
  self._id_3A9A = undefined;
  thread _id_0A77::_id_E2CC();
  return var_2;
}

_id_F684(var_0, var_1, var_2) {
  self endon("disconnect");
  var_0 thread _id_6DA0(self);
  scripts\engine\utility::_id_1C71(0);
  self notifyonplayercommand("place_ims", "+attack");
  self notifyonplayercommand("place_ims", "+attack_akimbo_accessible");
  self notifyonplayercommand("cancel_ims", "+actionslot 3");

  if (!level._id_4542) {
  self notifyonplayercommand("cancel_ims", "+actionslot 5");
  self notifyonplayercommand("cancel_ims", "+actionslot 6");
  self notifyonplayercommand("cancel_ims", "+actionslot 7");
  }

  for (;;) {
  var_3 = scripts\engine\utility::_id_13734("place_ims", "cancel_ims", "force_cancel_placement", "player_action_slot_restart");

  if (!isdefined(var_3))
  var_3 = "force_cancel_placement";

  if (var_3 == "cancel_ims" || var_3 == "force_cancel_placement" || var_3 == "player_action_slot_restart") {
  if (!var_1 && var_3 == "cancel_ims")
  continue;

  var_0 _id_6D9F(var_3 == "force_cancel_placement" && !isdefined(var_0._id_6DEC));

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

  var_0 thread _id_6DA2(var_2);
  self notify("IMS_placed");
  scripts\engine\utility::_id_1C71(1);
  return 1;
  }
}

_id_48EB(var_0, var_1) {
  if (isdefined(var_1._id_9D81) && var_1._id_9D81)
  return;

  var_2 = spawnturret("misc_turret", var_1.origin + (0, 0, 25), "sentry_minigun_mp");
  var_2.angles = var_1.angles;
  var_2._id_6DA4 = var_0;
  var_2.owner = var_1;
  var_2.name = "crafted_ims";
  var_2._id_3A9A = spawn("script_model", var_2.origin);
  var_2._id_3A9A.angles = var_1.angles;
  var_2 maketurretinoperable();
  var_2 _meth_835B(1);
  var_2 _meth_830F("sentry_offline");
  var_2 makeunusable();
  var_2 _meth_8336(var_1);
  return var_2;
}

_id_48EA(var_0, var_1) {
  var_2 = var_0.owner;
  var_3 = var_0._id_6DA4;
  var_4 = spawn("script_model", var_0.origin + (0, 0, 1));
  var_4 setmodel(level._id_6DA3[var_3]._id_B91A);
  var_4._id_EB9C = 3;
  var_4.angles = var_0.angles;
  var_4._id_6DA4 = var_3;
  var_4.owner = var_2;
  var_4 _meth_831F(var_2);
  var_4.team = var_2.team;
  var_4.name = "crafted_ims";
  var_4._id_10085 = 0;
  var_4._id_8E5A = 0;
  var_4._id_252E = 1;
  var_4._id_8BF0 = [];
  var_4._id_451C = level._id_6DA3[var_3];
  var_4 thread _id_6D9D();

  if (isdefined(var_1))
  var_4 thread _id_0A77::_id_A030(var_1);
  else
  var_4 thread _id_0A77::_id_A030(undefined, level._id_6DA3[self._id_6DA4]._id_AC71);

  return var_4;
}

_id_936D(var_0) {
  self._id_933C = 1;
  self notify("death");
}

_id_9367(var_0) {
  self endon("carried");
  self waittill("death");

  if (!isdefined(self))
  return;

  _id_6DA1();

  if (isdefined(self._id_9B05)) {
  self._id_9B05 _id_0A77::_id_E2CC();
  self notify("deleting");
  wait 1.0;
  }

  _id_66A7();
  self delete();
}

_id_66A7() {
  self setscriptablepartstate("base", "explode");
  wait 0.5;
  radiusdamage(self.origin + (0, 0, 40), 200, 500, 250, self, "MOD_EXPLOSIVE", "zmb_imsprojectile_mp");
  wait 0.65;
}

_id_6D9D() {
  self endon("death");
  level endon("game_ended");

  for (;;) {
  self waittill("trigger", var_0);

  if (!var_0 _id_0A77::_id_9D05())
  continue;

  if (scripts\engine\utility::_id_9CEE(var_0._id_9D81))
  continue;

  var_1 = _id_48EB(self._id_6DA4, var_0);

  if (!isdefined(var_1))
  continue;

  _id_6DA1();

  if (isdefined(self _meth_8138()))
  self unlink();

  var_0 thread _id_F684(var_1, 0, self._id_AC71);
  self delete();
  break;
  }
}

_id_6DA2(var_0) {
  self endon("death");
  level endon("game_ended");

  if (isdefined(self._id_3A9D))
  self._id_3A9D _meth_80F3();

  self._id_3A9D = undefined;

  if (isdefined(self.owner))
  self.owner._id_9D81 = 0;

  self._id_6DEC = undefined;
  var_1 = _id_48EA(self, var_0);
  var_1._id_9EE4 = 1;
  var_1 thread _id_9367(self.owner);
  self playsound("ims_plant");
  self notify("placed");
  var_1 thread _id_6D9E();
  var_2 = spawnstruct();

  if (isdefined(self._id_BD3B))
  var_2._id_AD39 = self._id_BD3B;

  var_2._id_6371 = "carried";
  var_2._id_4E53 = ::_id_936D;
  var_1 thread _id_0A60::_id_892F(var_2);
  self._id_3A9A delete();
  self delete();
}

_id_6D9F(var_0) {
  if (isdefined(self._id_3A9D)) {
  var_1 = self._id_3A9D;
  var_1 _meth_80F3();
  var_1._id_9D81 = undefined;
  var_1._id_3AA0 = undefined;
  var_1 scripts\engine\utility::_id_1C71(1);
  }

  if (isdefined(var_0) && var_0)
  _id_66A7();

  self._id_3A9A delete();
  self delete();
}

_id_6DA0(var_0) {
  self _meth_8335(var_0);
  self _meth_82C7(0);
  self setcandamage(0);
  self._id_3A9D = var_0;
  var_0._id_9D81 = 1;
  var_0 thread _id_0A77::_id_12E3F(self, self._id_3A9A, level._id_6DA3["crafted_ims"]);
  thread _id_0A77::_id_A025(var_0);
  thread _id_936F(var_0);
  thread _id_9371(var_0);

  if (isdefined(level._id_5CF2))
  self thread [[level._id_5CF2]](var_0);

  self notify("carried");
}

_id_936F(var_0) {
  self endon("placed");
  self endon("death");
  var_0 endon("last_stand");
  var_0 waittill("disconnect");
  _id_6D9F();
}

_id_9371(var_0) {
  self endon("placed");
  self endon("death");
  var_0 endon("last_stand");
  level waittill("game_ended");
  _id_6D9F();
}

_id_6D9E() {
  self endon("death");
  self setcursorhint("HINT_NOICON");
  self sethintstring(level._id_6DA3[self._id_6DA4]._id_017B);
  _id_0A77::_id_1861();
  var_0 = self.owner;
  var_0 _meth_80F3();
  self makeusable();
  self _meth_84A5(120);
  self _meth_84A2(96);
  wait 0.05;
  var_1 = (0, 0, 27);
  var_2 = (0, 0, 500) - var_1;
  var_3 = self.origin;
  var_4 = self.origin + var_1;
  var_5 = bullettrace(var_4, var_4 + var_2, 0, self);
  var_6 = var_5;
  self._id_2514 = var_6["position"] - (0, 0, 20) - self.origin;

  if (self._id_2514[2] < 250)
  self._id_AA7B = "launch_low";
  else if (self._id_2514[2] < 450)
  self._id_AA7B = "launch_med";
  else
  self._id_AA7B = "launch_high";

  var_7 = spawn("trigger_radius", self.origin, 0, 256, 100);
  self._id_2536 = var_7;
  self._id_2536 _meth_80D2();
  self._id_2536 linkto(self);
  self._id_2528 = length(self._id_2514) / 400;
  wait 0.75;
  self setscriptablepartstate("base", "on");
  thread _id_6D9C();
  thread _id_0A77::_id_A021("fireworks_disconnect");
}

_id_6DA1() {
  self makeunusable();

  if (isdefined(self._id_2536))
  self._id_2536 delete();

  if (isdefined(self._id_69F6)) {
  self._id_69F6 delete();
  self._id_69F6 = undefined;
  }

  _id_0A77::_id_E11E();
}

_id_6D9C() {
  self endon("death");
  level endon("game_ended");

  for (;;) {
  if (!isdefined(self._id_2536))
  break;

  self._id_2536 waittill("trigger", var_0);

  if (isplayer(var_0) || isdefined(var_0._id_CA80) || isdefined(var_0.agent_type) && var_0.agent_type == "the_hoff")
  continue;

  var_1 = var_0.origin + (0, 0, 50);

  if (!sighttracepassed(self._id_2514 + self.origin, var_1, 0, self))
  continue;

  if (!isdefined(self._id_2536))
  break;

  if (!isdefined(self._id_8BF0[self._id_252E])) {
  self._id_8BF0[self._id_252E] = 1;
  thread _id_AA75(var_0, self._id_252E);
  self._id_252E++;
  }

  if (self._id_252E > self._id_451C._id_C228) {
  self setscriptablepartstate("firework", "off");
  break;
  }

  self waittill("firework_exploded");
  self setscriptablepartstate("firework", "off");
  wait(self._id_451C._id_DDAC);

  if (!isdefined(self.owner))
  break;
  }

  if (isdefined(self._id_3A9D) && isdefined(self.owner) && self._id_3A9D == self.owner)
  return;

  self notify("death");
}

_id_AA75(var_0, var_1) {
  self setscriptablepartstate("firework", self._id_AA7B);
  var_2 = spawn("script_model", self.origin);
  var_2 setmodel(self._id_451C._id_6A03);
  var_2.angles = self.angles;
  var_2 setscriptablepartstate("rocket", "launch");
  var_3 = self._id_451C._id_039B;
  var_4 = self.owner;
  var_2 moveto(self._id_2514 + self.origin, self._id_2528, self._id_2528 * 0.5, 0);
  var_2 waittill("movedone");
  var_2 setscriptablepartstate("rocket", "explode");
  wait 0.1;

  if (isdefined(var_4))
  magicbullet(var_3, var_2.origin, var_0.origin, var_4);
  else
  magicbullet(var_3, var_2.origin, var_0.origin, level.players[0]);

  var_2 delete();
  self notify("firework_exploded");
}