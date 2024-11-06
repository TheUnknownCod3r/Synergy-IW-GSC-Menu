/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2670.gsc
***************************************/

init() {
  level._effect["medusa_death"] = loadfx("vfx/core/base/vfx_alien_soul_fly.vfx");
  level._effect["medusa_crawler_death"] = loadfx("vfx/iw7/core/zombie/vfx_alien_soul_fly_crawler.vfx");
  level._effect["medusa_blast_lg"] = loadfx("vfx/core/base/vfx_alien_cortex_blast_01.vfx");
  level._id_B548 = [];
  var_0 = spawnstruct();
  var_0._id_11901 = 300.0;
  var_0._id_B91A = "zmb_medusa_energy_collector_01_empty";
  var_0._id_B924 = "zmb_medusa_energy_collector_01_empty";
  var_0._id_B925 = "zmb_medusa_energy_collector_bad";
  var_0._id_017B = &"COOP_CRAFTABLES_PICKUP";
  var_0._id_CC28 = &"COOP_CRAFTABLES_PLACE";
  var_0._id_38E3 = &"COOP_CRAFTABLES_CANNOT_PLACE";
  var_0._id_CC0A = &"COOP_CRAFTABLES_PLACE_CANCELABLE";
  var_0._id_74BF = &"ZOMBIE_CRAFTING_SOUVENIRS_DETONATE";
  var_0._id_9F43 = 0;
  var_0._id_CC22 = 30.0;
  var_0._id_CC25 = 16.0;
  var_0._id_3AA7 = (0, 0, 25);
  var_0._id_3AA6 = (0, 0, 0);
  level._id_B53A = ::_id_65F5;
  level._id_B540 = ::_id_A630;
  level._id_B549 = [];
  level._id_B549["crafted_medusa"] = var_0;
}

_id_65F5(var_0) {
  var_1 = 262144;

  if (level._id_B548.size < 1)
  return undefined;

  var_2 = [];

  foreach (var_4 in level._id_B548) {
  if (!isdefined(var_4) || var_4._id_74BE)
  continue;

  if (distancesquared(var_4.origin, var_0.origin) < var_1)
  var_2[var_2.size] = var_4;
  }

  if (var_2.size == 0)
  return undefined;
  else
  {
  var_6 = sortbydistance(var_2, var_0.origin);
  return var_6[0];
  }
}

_id_A630(var_0, var_1, var_2) {
  if (var_2) {
  var_3 = level._effect["medusa_crawler_death"];
  playfx(var_3, var_0);
  } else {
  var_3 = level._effect["medusa_death"];
  playfx(var_3, var_0 + (0, 0, 5));
  }

  scripts\engine\utility::waitframe();
  var_4 = spawn("script_model", var_0 + (0, 0, 40));
  var_4 setmodel("tag_origin_soultrail");

  if (!isdefined(var_1)) {
  var_4 delete();
  return;
  }

  var_5 = var_1.origin;
  var_6 = distance(var_0 + (0, 0, 40), var_5 + (0, 0, 75));
  var_7 = 350;
  var_8 = var_6 / var_7;

  if (var_8 < 0.05)
  var_8 = 0.05;

  var_4 moveto(var_1 gettagorigin("tag_fx"), var_8);
  var_4 waittill("movedone");
  var_4 setscriptablepartstate("tag", "collect");
  wait 0.5;
  var_4 delete();

  if (isdefined(var_1))
  var_1 notify("soul_collected");
}

_id_82B8(var_0, var_1) {
  var_1._id_A039 = "crafted_medusa";
  var_1 thread _id_13932();
  var_1 notify("new_power", "crafted_medusa");
  var_1 setclientomnvar("zom_crafted_weapon", 3);
  var_1 thread _id_0A77::_id_1308C(var_1, "iw7_pickup_zm");
  _id_0A77::_id_F313("crafted_medusa", ::_id_82B8, var_1);
}

_id_13932() {
  self endon("disconnect");
  self endon("death");
  self notify("craft_dpad_watcher");
  self endon("craft_dpad_watcher");
  self notifyonplayercommand("pullout_medusa", "+actionslot 3");

  for (;;) {
  self waittill("pullout_medusa");

  if (scripts\engine\utility::_id_9CEE(self._id_9D81))
  continue;

  if (scripts\engine\utility::_id_9CEE(self._id_AD2C))
  continue;

  if (_id_0A77::_id_9D05())
  break;
  }

  thread _id_837E(1);
}

_id_837E(var_0, var_1, var_2) {
  self endon("disconnect");
  _id_0A77::_id_41C4("msg_power_hint");
  var_3 = _id_49E8(self);
  _id_0A77::_id_E077();
  self._id_3AA5 = var_3;
  var_4 = _id_F685(var_3, var_0, var_1, var_2);
  self._id_3AA5 = undefined;
  thread _id_0A77::_id_1365D();
  self._id_9D81 = 0;

  if (isdefined(var_3))
  return 1;
  else
  return 0;
}

_id_F685(var_0, var_1, var_2, var_3) {
  self endon("disconnect");
  var_0 _id_B543(self, var_1);
  scripts\engine\utility::_id_1C71(0);
  self notifyonplayercommand("place_medusa", "+attack");
  self notifyonplayercommand("place_medusa", "+attack_akimbo_accessible");
  self notifyonplayercommand("cancel_medusa", "+actionslot 3");

  if (!level._id_4542) {
  self notifyonplayercommand("cancel_medusa", "+actionslot 5");
  self notifyonplayercommand("cancel_medusa", "+actionslot 6");
  self notifyonplayercommand("cancel_medusa", "+actionslot 7");
  }

  for (;;) {
  var_4 = scripts\engine\utility::_id_13734("place_medusa", "cancel_medusa", "force_cancel_placement");

  if (!isdefined(var_0)) {
  scripts\engine\utility::_id_1C71(1);
  return 1;
  }

  if (!isdefined(var_4))
  var_4 = "force_cancel_placement";

  if (var_4 == "cancel_medusa" || var_4 == "force_cancel_placement") {
  if (!var_1 && var_4 == "cancel_medusa")
  continue;

  scripts\engine\utility::_id_1C71(1);
  var_0 _id_B542();

  if (var_4 != "force_cancel_placement")
  thread _id_13932();
  else if (var_1)
  _id_0A77::_id_DFE0(self);

  return 0;
  }

  if (!var_0._id_3872)
  continue;

  if (var_1)
  _id_0A77::_id_DFE0(self);

  var_0 _id_B545(var_2, var_3, self);
  scripts\engine\utility::_id_1C71(1);
  return 1;
  }
}

_id_49E8(var_0) {
  var_1 = spawnturret("misc_turret", var_0.origin + (0, 0, 25), "sentry_minigun_mp");
  var_1.angles = var_0.angles;
  var_1.owner = var_0;
  var_1.name = "crafted_medusa";
  var_1 hide();
  var_1._id_3AA1 = spawn("script_model", var_1.origin + (0, 0, 25));
  var_1._id_3AA1 setmodel(level._id_B549["crafted_medusa"]._id_B91A);
  var_1 maketurretinoperable();
  var_1 _meth_835B(1);
  var_1 _meth_830F("sentry_offline");
  var_1 makeunusable();
  var_1 _meth_8336(var_0);
  var_1 _id_B53F(var_0);
  return var_1;
}

_id_B53F(var_0) {
  self._id_3872 = 1;
  _id_B544();
}

_id_B53C(var_0) {
  self waittill("death");

  if (!isdefined(self))
  return;

  _id_B544();
  self playsound("sentry_explode");

  if (isdefined(self._id_3CBF))
  self._id_3CBF delete();

  _id_E11F();

  if (isdefined(self)) {
  playfxontag(scripts\engine\utility::_id_7ECB("sentry_explode_mp"), self, "tag_origin");
  self playsound("sentry_explode_smoke");
  wait 0.1;

  if (isdefined(self))
  self delete();
  }
}

_id_B53D() {
  self endon("death");
  level endon("game_ended");

  for (;;) {
  self waittill("trigger", var_0);

  if (!var_0 _id_0A77::_id_9D05())
  continue;

  if (scripts\engine\utility::_id_9CEE(var_0._id_9D81))
  continue;

  if (self._id_74BE) {
  level thread _id_B53B(self.origin, var_0);
  wait 0.6;
  } else {
  var_0 thread _id_837E(0, self._id_AC71, self._id_3CC3);
  self playsound("trap_medusa_pickup");
  }

  if (isdefined(self._id_3CBF))
  self._id_3CBF delete();

  _id_E11F();
  self delete();
  }
}

_id_B53B(var_0, var_1) {
  playloopsound(var_0, "trap_medusa_explo");
  playfx(level._effect["medusa_blast_lg"], var_0);
  var_1._id_A039 = "crafted_medusa";
  wait 0.5;
  var_2 = _id_0A4A::_id_7DB0("axis");
  var_2 = sortbydistance(var_2, var_0);

  foreach (var_4 in var_2) {
  if (!isdefined(var_4) || !isdefined(var_4.agent_type))
  continue;

  if (var_4.agent_type == "zombie_grey" || var_4.agent_type == "zombie_ghost" || var_4.agent_type == "zombie_brute")
  continue;

  var_4 _meth_80B0(var_4.health + 1000, var_4.origin);
  wait 0.1;
  }
}

_id_B545(var_0, var_1, var_2) {
  var_3 = spawn("script_model", self.origin + (0, 0, 0));
  var_3.angles = self.angles;
  var_3.name = "crafted_medusa";
  self._id_3AA1 delete();
  var_3 solid();

  if (!isdefined(var_2._id_B546)) {
  var_2 iprintlnbold(&"ZOMBIE_CRAFTING_SOUVENIRS_KILL_NEAR_MEDUSA");
  var_2._id_B546 = 1;
  }

  var_4 = "zmb_medusa_energy_collector_01_empty";

  if (!isdefined(var_1))
  var_4 = "zmb_medusa_energy_collector_01_empty";
  else
  {
  if (var_1 > 3)
  var_4 = "zmb_medusa_energy_collector_01_1";

  if (var_1 > 5)
  var_4 = "zmb_medusa_energy_collector_01_2";

  if (var_1 > 7)
  var_4 = "zmb_medusa_energy_collector_01_3";

  if (var_1 > 9)
  var_4 = "zmb_medusa_energy_collector_01";
  }

  var_3 setmodel(var_4);
  self._id_3A9D _meth_80F3();
  self._id_3A9D = undefined;
  var_2._id_9D81 = 0;
  var_3.owner = var_2;
  var_3 thread _id_B541(var_0, var_1);
  self notify("placed");
  self delete();
}

_id_B542() {
  self._id_3A9D _meth_80F3();

  if (isdefined(self.owner))
  self.owner._id_9D81 = 0;

  self._id_3AA1 delete();
  self delete();
}

_id_B543(var_0, var_1) {
  self setmodel(level._id_B549["crafted_medusa"]._id_B924);
  self _meth_8335(var_0);
  self setcandamage(0);
  self._id_3A9D = var_0;
  var_0._id_9D81 = 1;

  if (var_1)
  self._id_6DEC = 1;

  var_0 thread _id_0A77::_id_12E3F(self, self._id_3AA1, level._id_B549["crafted_medusa"]);
  thread _id_0A77::_id_A025(var_0);
  thread _id_0A77::_id_A026(var_0);
  thread _id_0A77::_id_A027(var_0);
  _id_B544();
  self notify("carried");
}

_id_B541(var_0, var_1) {
  self setcursorhint("HINT_NOICON");
  self sethintstring(level._id_B549["crafted_medusa"]._id_017B);
  self makeusable();
  self _meth_84A7("tag_fx");
  self _meth_84A5(120);
  self _meth_84A2(96);
  thread _id_B53C(self.owner);
  thread _id_0A77::_id_A021("medusa_handleOwner");
  thread _id_0A77::_id_A030(var_0, level._id_B549["crafted_medusa"]._id_11901);
  thread _id_B53D();
  thread _id_B547();
  self._id_3CC3 = 0;
  self._id_74BE = 0;

  if (isdefined(var_1))
  self._id_3CC3 = var_1;

  if (self._id_3CC3 >= 10) {
  self._id_74BE = 1;
  self sethintstring(level._id_B549["crafted_medusa"]._id_74BF);
  }

  _id_1862();

  if (!self._id_74BE)
  self setscriptablepartstate("base", "charge_level_1");
  else
  self setscriptablepartstate("base", "charge_level_2");
}

_id_B547() {
  self endon("death");

  for (;;) {
  self waittill("soul_collected");
  self._id_3CC3++;
  var_0 = "zmb_medusa_energy_collector_01_empty";

  if (self._id_3CC3 >= 3)
  var_0 = "zmb_medusa_energy_collector_01_1";

  if (self._id_3CC3 > 5)
  var_0 = "zmb_medusa_energy_collector_01_2";

  if (self._id_3CC3 > 7)
  var_0 = "zmb_medusa_energy_collector_01_3";

  if (self._id_3CC3 > 9)
  var_0 = "zmb_medusa_energy_collector_01";

  if (self._id_01F1 != var_0) {
  self setmodel(var_0);

  if (self._id_3CC3 != 10)
  self setscriptablepartstate("base", "charge_level_1");
  else
  {
  self sethintstring(level._id_B549["crafted_medusa"]._id_74BF);
  self._id_74BE = 1;
  self setscriptablepartstate("base", "charge_level_2");
  }

  self makeusable();
  self _meth_84A7("tag_fx");
  self _meth_84A5(120);
  self _meth_84A2(96);
  }
  }
}

_id_B544() {
  self makeunusable();
  _id_E11F();
}

_id_1862(var_0) {
  level._id_B548 = scripts\engine\utility::_id_1756(level._id_B548, self);
  _id_0A77::_id_1861();
}

_id_E11F(var_0) {
  level._id_B548 = scripts\engine\utility::array_remove(level._id_B548, self);
  _id_0A77::_id_E11E();
}

_id_B539() {
  self endon("death");
  level endon("game_ended");

  for (;;) {
  wait 3.0;

  if (!isdefined(self._id_3A9D))
  self playsound("sentry_gun_beep");
  }
}
