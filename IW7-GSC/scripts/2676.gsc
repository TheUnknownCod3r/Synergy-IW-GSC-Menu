/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2676.gsc
***************************************/

init() {
  level._effect["candypile_fire"] = loadfx("vfx/iw7/_requests/coop/zmb_candypile_fire.vfx");
  level._effect["candypile_idle"] = loadfx("vfx/iw7/_requests/coop/zmb_candypile_idle.vfx");
  level._id_47AF = [];
  level._id_47AF["crafted_gascan"] = spawnstruct();
  level._id_47AF["crafted_gascan"]._id_11901 = 180;
  level._id_47AF["crafted_gascan"]._id_B91A = "zmb_candybox_crafted_lod0";
  level._id_47AF["crafted_gascan"]._id_B924 = "zmb_candybox_crafted_lod0";
  level._id_47AF["crafted_gascan"]._id_B925 = "zmb_candybox_crafted_lod0";
  level._id_47AF["crafted_gascan"]._id_CC12 = "zmb_candybox_crafted_lod0";
}

_id_82B6(var_0, var_1) {
  var_1 thread _id_13932();
  var_1 notify("new_power", "crafted_gascan");
  var_1 setclientomnvar("zom_crafted_weapon", 7);
  var_1 thread _id_0A77::_id_1308C(var_1, "iw7_pickup_zm");
  _id_0A77::_id_F313("crafted_gascan", ::_id_82B6, var_1);
}

_id_13932() {
  self endon("disconnect");
  self notify("craft_dpad_watcher");
  self endon("craft_dpad_watcher");
  self endon("death");
  self notifyonplayercommand("pullout_gascan", "+actionslot 3");

  for (;;) {
  self waittill("pullout_gascan");

  if (scripts\engine\utility::_id_9CEE(self._id_9D81))
  continue;

  if (scripts\engine\utility::_id_9CEE(self._id_AD2C))
  continue;

  if (isdefined(self.allow_carry) && self.allow_carry == 0)
  continue;

  if (_id_0A77::_id_9D05())
  break;
  }

  thread _id_82D1(1);
}

_id_82D1(var_0, var_1) {
  self endon("disconnect");
  _id_0A77::_id_41C4("msg_power_hint");
  var_2 = _id_49CD(self);
  self._id_A039 = var_2.name;
  _id_E152();
  self._id_3AA5 = var_2;
  var_3 = _id_F683(var_2, var_0, var_1);
  self._id_3AA5 = undefined;
  thread _id_1370F();
  self._id_9D81 = 0;

  if (isdefined(var_2))
  return 1;
  else
  return 0;
}

_id_F683(var_0, var_1, var_2) {
  self endon("disconnect");
  var_0 _id_76CA(self, var_1);
  scripts\engine\utility::_id_1C71(0);
  self notifyonplayercommand("place_gascan", "+attack");
  self notifyonplayercommand("place_gascan", "+attack_akimbo_accessible");
  self notifyonplayercommand("cancel_gascan", "+actionslot 3");

  if (!level._id_4542) {
  self notifyonplayercommand("cancel_gascan", "+actionslot 5");
  self notifyonplayercommand("cancel_gascan", "+actionslot 6");
  self notifyonplayercommand("cancel_gascan", "+actionslot 7");
  }

  for (;;) {
  var_3 = scripts\engine\utility::_id_13734("place_gascan", "cancel_gascan", "force_cancel_placement");

  if (!isdefined(var_0)) {
  scripts\engine\utility::_id_1C71(1);
  return 1;
  }

  if (!isdefined(var_3))
  var_3 = "force_cancel_placement";

  if (var_3 == "cancel_gascan" || var_3 == "force_cancel_placement") {
  if (!var_1 && var_3 == "cancel_gascan")
  continue;

  scripts\engine\utility::_id_1C71(1);
  var_0 _id_76C9();

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

  var_0 thread _id_76C8(var_2, self);
  self waittill("gas_poured");
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

_id_49CD(var_0) {
  var_1 = spawnturret("misc_turret", var_0.origin + (0, 0, 25), "sentry_minigun_mp");
  var_1.angles = var_0.angles;
  var_1.owner = var_0;
  var_1.name = "crafted_gascan";
  var_1._id_3A9E = spawn("script_model", var_1.origin);
  var_1._id_3A9E.angles = var_0.angles;
  var_1 maketurretinoperable();
  var_1 _meth_835B(1);
  var_1 _meth_830F("sentry_offline");
  var_1 makeunusable();
  var_1 _meth_8336(var_0);
  var_1 _id_76C7(var_0);
  var_1 _meth_82C7(0);
  var_1._id_3A9E _meth_82C7(0);
  return var_1;
}

_id_76C7(var_0) {
  self._id_3872 = 1;
}

_id_76C8(var_0, var_1) {
  var_1 endon("disconnect");
  self._id_9F05 = 1;

  if (!isdefined(level._id_38B3))
  level._id_38B3 = [];

  var_2 = 0;

  for (;;) {
  while (var_1 attackbuttonpressed() && var_2 <= 4) {
  if (!self._id_3872) {
  wait 0.05;
  continue;
  }

  if (!isdefined(self._id_8C16))
  self._id_8C16 = 0;

  var_1 playsound("trap_kindle_pops_pour");
  self._id_9F05 = 1;
  _id_1070D(var_1, self);
  self._id_8C16++;
  self._id_BE9C = 1;
  wait 0.35;
  var_2++;
  }

  if (var_2 > 4)
  break;

  self._id_9F05 = undefined;
  wait 0.05;
  }

  self._id_9F05 = undefined;
  var_1 notify("gas_poured");
  var_3 = spawn("script_model", self._id_3A9E.origin);
  var_3.angles = self._id_3A9E.angles;
  var_3 setmodel(level._id_47AF["crafted_gascan"]._id_CC12);
  var_3 physicslaunchserver(var_3.origin + (randomfloatrange(-20, 20), randomfloatrange(-20, 20), 0), (randomfloatrange(-20, 20), randomfloatrange(-20, 20), 10));
  var_3 playsound("trap_kindle_pops_can_drop");
  self._id_3A9D _meth_80F3();
  self._id_3A9D = undefined;
  var_1._id_9D81 = 0;
  self notify("placed");
  self._id_3A9E delete();
  self delete();
  wait 1;
  var_1 _id_0A77::_id_F78C("candy_hint", &"ZOMBIE_CRAFTING_SOUVENIRS_SHOOT_TO_IGNITE", 4);
  wait 15;
  var_3 delete();
}

_id_135B5(var_0) {
  thread _id_92DF();
  thread _id_76C2();
  thread _id_76C3(level._id_47AF["crafted_gascan"]._id_11901);
  self waittill("gas_spot_damaged");
  self playsound("trap_kindle_pops_ignite");
  var_1 = gettime() + 40000;
  self notify("damage_monitor");
  thread _id_76C0(var_1, var_0);
}

_id_92DF() {
  self endon("gas_spot_damaged");
  self._id_7542 = spawnfx(level._effect["candypile_idle"], self.origin);
  scripts\engine\utility::waitframe();
  triggerfx(self._id_7542);
}

_id_76C3(var_0) {
  self endon("gas_spot_damaged");
  wait(var_0);
  self notify("damage_monitor");
  level._id_38B3 = scripts\engine\utility::array_remove(level._id_38B3, self);
  self._id_7542 delete();
  _id_0A77::_id_E11E();
  self delete();
}

_id_76C2() {
  self endon("damage_monitor");
  var_0 = 9216;

  for (;;) {
  self waittill("damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10);

  if (isplayer(var_2) && isdefined(var_10) && var_5 != "MOD_MELEE") {
  self notify("gas_spot_damaged");

  foreach (var_12 in level._id_38B3) {
  if (var_12 == self)
  continue;

  if (distancesquared(var_12.origin, self.origin) > var_0)
  continue;
  else
  var_12 notify("damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10);
  }

  return;
  }
  }
}

_id_76C0(var_0, var_1) {
  self._id_7542 delete();
  scripts\engine\utility::waitframe();
  self playloopsound("trap_kindle_pops_fire_lp");
  self._id_7542 = spawnfx(level._effect["candypile_fire"], self.origin);
  scripts\engine\utility::waitframe();
  triggerfx(self._id_7542);
  self._id_4D27 = spawn("trigger_radius", self.origin, 1, 64, 32);
  self._id_4D27._id_0336 = "kindlepops_trig";
  self._id_4D27.owner = var_1;
  thread _id_76C1();

  while (gettime() < var_0)
  wait 0.1;

  playloopsound(self.origin, "trap_kindle_pops_fire_end");
  self stoploopsound();
  self._id_4D27 delete();
  self._id_7542 delete();
  level._id_38B3 = scripts\engine\utility::array_remove(level._id_38B3, self);
  self delete();
}

_id_76C1() {
  self._id_4D27 endon("death");

  for (;;) {
  self._id_4D27 waittill("trigger", var_0);

  if (isplayer(var_0) && isalive(var_0) && !_id_0A5B::_id_D0EF(var_0) && !isdefined(var_0._id_C85F)) {
  var_0._id_C85F = 1;
  var_0 _meth_80B0(15, var_0.origin);
  var_0 thread _id_E069();
  }

  if (!_id_0A77::_id_FF18(var_0))
  continue;

  var_0 _id_3B25(2, var_0.health + 5, self._id_4D27);
  }
}

_id_E069() {
  self endon("disconnect");
  wait 0.5;
  self._id_C85F = undefined;
}

_id_3B25(var_0, var_1, var_2) {
  if (isalive(self) && !scripts\engine\utility::_id_9CEE(self._id_B36E) && !scripts\engine\utility::_id_9CEE(self._id_9B8A))
  thread _id_0A77::_id_4D0D(self, var_2, var_0, var_1, undefined, "iw7_kindlepops_zm", undefined, "chemBurn");
}

_id_1070D(var_0, var_1) {
  var_2 = ["zmb_candy_pile_01", "zmb_candy_pile_02"];
  var_3 = spawn("script_model", var_1.origin + (0, 0, 5));
  var_3.angles = self.angles;
  var_3 setmodel(scripts\engine\utility::_id_DC6B(var_2));
  var_4 = 100;
  var_5 = getgroundposition(var_1.origin, 4);
  var_3 moveto(var_5 + (0, 0, 1), 0.25);

  foreach (var_7 in level._id_38B3) {
  if (distancesquared(var_7.origin, var_3.origin) < 100) {
  var_3 delete();
  break;
  }
  }

  if (!isdefined(var_3))
  return;

  var_3 setcandamage(1);
  var_3.health = 10000;
  var_3.owner = var_0;
  var_3.name = "crafted_gascan";
  var_0._id_A039 = var_3.name;
  level._id_38B3[level._id_38B3.size] = var_3;
  var_3 _id_0A77::_id_1861();
  var_3 thread _id_135B5(var_0);
}

_id_76C9() {
  self._id_3A9D _meth_80F3();

  if (isdefined(self.owner))
  self.owner._id_9D81 = 0;

  self._id_3A9E delete();
  self delete();
}

_id_76CA(var_0, var_1) {
  if (isdefined(self._id_C731)) {} else {}

  self setmodel(level._id_47AF["crafted_gascan"]._id_B924);
  self hide();
  self _meth_8335(var_0);
  self setcandamage(0);
  self._id_3A9D = var_0;
  var_0._id_9D81 = 1;
  var_0 thread _id_12EA0(self, var_1);
  thread _id_0A77::_id_A025(var_0);
  thread _id_0A77::_id_A026(var_0);
  thread _id_0A77::_id_A027(var_0);
  self notify("carried");
}

_id_12EA0(var_0, var_1) {
  self endon("death");
  self endon("disconnect");
  level endon("game_ended");
  var_0 endon("placed");
  var_0 endon("death");
  var_0._id_3872 = 1;
  var_2 = -1;
  var_0._id_BE9C = 0;

  for (;;) {
  var_0._id_3872 = _id_3831(var_0);

  if (var_0._id_3872 != var_2 || var_0._id_BE9C) {
  var_0._id_BE9C = 0;

  if (var_0._id_3872) {
  var_0._id_3A9E setmodel(level._id_47AF["crafted_gascan"]._id_B924);

  if (!isdefined(var_0._id_8C16))
  self _meth_80F4(&"ZOMBIE_CRAFTING_SOUVENIRS_POUR_CANCELABLE");
  else if (var_0._id_8C16 == 1)
  self _meth_80F4(&"ZOMBIE_CRAFTING_SOUVENIRS_POUR_80");
  else if (var_0._id_8C16 == 2)
  self _meth_80F4(&"ZOMBIE_CRAFTING_SOUVENIRS_POUR_60");
  else if (var_0._id_8C16 == 3)
  self _meth_80F4(&"ZOMBIE_CRAFTING_SOUVENIRS_POUR_40");
  else if (var_0._id_8C16 == 4)
  self _meth_80F4(&"ZOMBIE_CRAFTING_SOUVENIRS_POUR_20");
  } else {
  var_0._id_3A9E setmodel(level._id_47AF["crafted_gascan"]._id_B925);
  self _meth_80F4(&"COOP_CRAFTABLES_CANNOT_PLACE");
  }
  }

  var_2 = var_0._id_3872;
  wait 0.05;
  }
}

_id_3831(var_0) {
  var_1 = self canplayerplacesentry();
  var_0.origin = var_1["origin"];
  var_0.angles = var_1["angles"];
  var_0._id_3A9E.origin = var_1["origin"] + (0, 0, 35);
  var_0.name = "crafted_gascan";
  var_0._id_3A9E.name = "crafted_gascan";

  if (isdefined(var_0._id_9F05))
  var_0._id_3A9E.angles = var_1["angles"] + (35, 0, 0);
  else
  var_0._id_3A9E.angles = var_1["angles"];

  return self isonground() && var_1["result"] && abs(var_1["origin"][2] - self.origin[2]) < 30;
}
