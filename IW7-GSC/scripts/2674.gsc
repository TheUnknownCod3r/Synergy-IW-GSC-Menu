/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2674.gsc
***************************************/

init() {
  level._effect["electric_trap_idle"] = loadfx("vfx/iw7/_requests/coop/generator_idle.vfx");
  level._effect["electric_trap_attack"] = loadfx("vfx/iw7/core/zombie/vfx_electrap_shock_beam.vfx");
  level._effect["electric_trap_shock"] = loadfx("vfx/iw7/core/zombie/traps/electric_trap/vfx_zmb_hit_shock.vfx");
  var_0 = spawnstruct();
  var_0._id_11901 = 60.0;
  var_0._id_B91A = "zom_machinery_generator_portable_01";
  var_0._id_B924 = "zom_machinery_generator_portable_01";
  var_0._id_B925 = "zom_machinery_generator_portable_01_red";
  var_0._id_017B = &"COOP_CRAFTABLES_PICKUP";
  var_0._id_9F43 = 0;
  var_0._id_017B = &"COOP_CRAFTABLES_PICKUP";
  var_0._id_CC28 = &"COOP_CRAFTABLES_PLACE";
  var_0._id_38E3 = &"COOP_CRAFTABLES_CANNOT_PLACE";
  var_0._id_CC0A = &"COOP_CRAFTABLES_PLACE_CANCELABLE";
  var_0._id_CC22 = 30.0;
  var_0._id_CC25 = 32.0;
  var_0._id_3AA7 = (0, 0, 25);
  var_0._id_3AA6 = (0, 0, 0);

  if (!isdefined(level._id_47B3))
  level._id_47B3 = [];

  level._id_47B3["crafted_electric_trap"] = var_0;
}

_id_82BB(var_0, var_1) {
  var_1 thread _id_13932();
  var_1 notify("new_power", "crafted_electric_trap");
  var_1 setclientomnvar("zom_crafted_weapon", 4);
  var_1 thread _id_0A77::_id_1308C(var_1, "iw7_pickup_zm");
  _id_0A77::_id_F313("crafted_electric_trap", ::_id_82BB, var_1);
}

_id_13932() {
  self endon("disconnect");
  self endon("death");
  self notify("craft_dpad_watcher");
  self endon("craft_dpad_watcher");
  self notifyonplayercommand("pullout_trap", "+actionslot 3");

  for (;;) {
  self waittill("pullout_trap");

  if (scripts\engine\utility::_id_9CEE(self._id_9D81))
  continue;

  if (scripts\engine\utility::_id_9CEE(self._id_AD2C))
  continue;

  if (isdefined(self.allow_carry) && self.allow_carry == 0)
  continue;

  if (_id_0A77::_id_9D05())
  break;
  }

  thread _id_8342(1);
}

_id_8342(var_0, var_1) {
  self endon("disconnect");
  _id_0A77::_id_41C4("msg_power_hint");
  var_2 = _id_4A2A(self);
  self._id_A039 = var_2.name;
  _id_E152();
  self._id_3AA5 = var_2;

  if (var_0)
  var_2._id_6DEC = 1;

  var_3 = _id_F68A(var_2, var_0, var_1);
  self._id_3AA5 = undefined;
  thread _id_1370F();
  self._id_9D81 = 0;

  if (isdefined(var_2))
  return 1;
  else
  return 0;
}

_id_F68A(var_0, var_1, var_2) {
  self endon("disconnect");
  var_0 _id_126A8(self, var_1);
  scripts\engine\utility::_id_1C71(0);
  self notifyonplayercommand("place_trap", "+attack");
  self notifyonplayercommand("place_trap", "+attack_akimbo_accessible");
  self notifyonplayercommand("cancel_trap", "+actionslot 3");

  if (!level._id_4542) {
  self notifyonplayercommand("cancel_trap", "+actionslot 5");
  self notifyonplayercommand("cancel_trap", "+actionslot 6");
  self notifyonplayercommand("cancel_trap", "+actionslot 7");
  }

  for (;;) {
  var_3 = scripts\engine\utility::_id_13734("place_trap", "cancel_trap", "force_cancel_placement");

  if (!isdefined(var_0)) {
  scripts\engine\utility::_id_1C71(1);
  return 1;
  }

  if (!isdefined(var_3))
  var_3 = "force_cancel_placement";

  if (var_3 == "cancel_trap" || var_3 == "force_cancel_placement") {
  if (!var_1 && var_3 == "cancel_trap")
  continue;

  scripts\engine\utility::_id_1C71(1);
  var_0 _id_126A7();

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

  var_0 _id_126AA(var_2, self);
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

_id_4A2A(var_0) {
  var_1 = spawnturret("misc_turret", var_0.origin + (0, 0, 40), "sentry_minigun_mp");
  var_1.angles = var_0.angles;
  var_1.owner = var_0;
  var_1.name = "crafted_electric_trap";
  var_1._id_3A9B = spawn("script_model", var_1.origin);
  var_1._id_3A9B.angles = var_0.angles;
  var_1 maketurretinoperable();
  var_1 _meth_835B(1);
  var_1 _meth_830F("sentry_offline");
  var_1 makeunusable();
  var_1 _meth_8336(var_0);
  var_1 _id_126A2(var_0);
  return var_1;
}

_id_126A2(var_0) {
  self._id_3872 = 1;
}

_id_126A0(var_0) {
  self waittill("death");

  if (!isdefined(self))
  return;

  _id_126A9();
  self playsound("sentry_explode");
  _id_0A77::_id_E11E();

  if (isdefined(self)) {
  playfxontag(scripts\engine\utility::_id_7ECB("sentry_explode_mp"), self, "tag_origin");
  self playsound("sentry_explode_smoke");
  wait 0.1;

  if (isdefined(self)) {
  if (isdefined(self._id_3A9B))
  self._id_3A9B delete();

  self delete();
  }
  }
}

_id_126A1() {
  self endon("death");
  level endon("game_ended");

  for (;;) {
  self waittill("trigger", var_0);

  if (!var_0 _id_0A77::_id_9D05())
  continue;

  if (scripts\engine\utility::_id_9CEE(var_0._id_9D81))
  continue;

  var_0 thread _id_8342(0, self._id_AC71);

  if (isdefined(self._id_3CBF))
  self._id_3CBF delete();

  _id_0A77::_id_E11E();
  self delete();
  }
}

_id_126AA(var_0, var_1) {
  var_2 = spawn("script_model", self.origin + (0, 0, 1.5));
  var_2.angles = self.angles;
  var_2 solid();
  var_2 setmodel(level._id_47B3["crafted_electric_trap"]._id_B91A);
  self._id_3A9D _meth_80F3();
  self._id_3A9D = undefined;
  var_1._id_9D81 = 0;
  var_2.owner = var_1;
  var_2.name = "crafted_electric_trap";
  var_2 thread _id_126A6(var_0);
  var_2 playsound("sentry_gun_plant");
  self notify("placed");
  self._id_3A9B delete();
  self delete();
}

_id_126A7() {
  self._id_3A9D _meth_80F3();

  if (isdefined(self.owner))
  self.owner._id_9D81 = 0;

  self._id_3A9B delete();
  self delete();
}

_id_126A8(var_0, var_1) {
  self _meth_8335(var_0);
  self setcandamage(0);
  self stoploopsound();
  self._id_3A9D = var_0;
  var_0._id_9D81 = 1;
  var_0 thread _id_0A77::_id_12E3F(self, self._id_3A9B, level._id_47B3["crafted_electric_trap"]);
  thread _id_0A77::_id_A025(var_0);
  thread _id_0A77::_id_A026(var_0);
  thread _id_0A77::_id_A027(var_0);
  _id_126A9();
  self notify("carried");
}

_id_126A6(var_0) {
  self setscriptablepartstate("fx", "on");
  self setcursorhint("HINT_NOICON");
  self sethintstring(level._id_47B3["crafted_electric_trap"]._id_017B);
  self makeusable();
  self _meth_84A7("tag_fx");
  self _meth_84A5(120);
  self _meth_84A2(96);
  thread _id_126A0(self.owner);
  thread _id_0A77::_id_A021("electrap_handleOwner");
  thread _id_0A77::_id_A030(var_0, level._id_47B3["crafted_electric_trap"]._id_11901);
  thread _id_126A1();
  thread _id_126AF();
  _id_0A77::_id_1861();
}

_id_126A9() {
  self makeunusable();
  _id_0A77::_id_E11E();
}

_id_126AF() {
  self endon("death");
  var_0 = 36864;
  wait 1;

  for (;;) {
  var_1 = _id_0A4A::_id_7DAF();
  var_1 = scripts\engine\utility::_id_782F(self.origin, var_1);

  foreach (var_3 in var_1) {
  if (!_id_0A77::_id_FF18(var_3, undefined, 1) || scripts\engine\utility::_id_9CEE(var_3._id_9BC9))
  continue;

  if (distancesquared(self.origin + (0, 0, 20), var_3.origin + (0, 0, 20)) < var_0) {
  self playsound("trap_electric_shock");
  thread _id_601A(var_3);

  if (scripts\engine\utility::_id_9CEE(var_3._id_565C))
  var_3 thread _id_0A77::_id_4D0D(var_3, self, 1, var_3.health + 10, "MOD_RIFLE_BULLET", "zmb_imsprojectile_mp", undefined, "electrified");
  else
  var_3 thread _id_0A77::_id_4D0D(var_3, self, 3, var_3.health + 10, "MOD_RIFLE_BULLET", "zmb_imsprojectile_mp", undefined, "electrified");

  wait 1.5;
  }
  }

  wait 0.1;
  }
}

_id_601A(var_0) {
  var_0 endon("death");
  self endon("death");
  var_1 = ["J_Shoulder_LE", "J_Shoulder_RI", "J_Wrist_LE", "J_Wrist_RI", "J_Elbow_RI", "J_Elbow_LE"];
  var_2 = ["J_Hip_RI", "J_Hip_LE", "J_Knee_LE", "J_Ankle_LE", "J_Knee_RI", "J_Ankle_RI"];
  var_3 = ["J_SpineLower", "J_Chest", "J_Head", "J_Neck", "J_Crotch"];
  var_4 = [scripts\engine\utility::_id_DC6B(var_1), scripts\engine\utility::_id_DC6B(var_2), scripts\engine\utility::_id_DC6B(var_3)];

  foreach (var_6 in var_4) {
  if (!_id_0A77::_id_8BB1(var_0._id_01F1, var_6))
  continue;

  var_7 = var_0 gettagorigin(var_6);
  playfxbetweenpoints(level._effect["electric_trap_attack"], self.origin + (0, 0, 24), vectortoangles(var_7 - self.origin + (0, 0, 24)), var_7);
  scripts\engine\utility::waitframe();
  playfxontag(level._effect["electric_trap_shock"], var_0, var_6);
  scripts\engine\utility::waitframe();
  }
}
