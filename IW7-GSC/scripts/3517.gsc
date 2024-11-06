/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3517.gsc
***************************************/

init() {
  level._id_12A9A = [];
  level._id_12A9A["mg_turret"] = "remote_mg_turret";
  scripts\mp\killstreaks\killstreaks::registerkillstreak("remote_mg_turret", ::_id_128FC);
  level._id_12A8D = [];
  level._id_12A8D["mg_turret"] = spawnstruct();
  level._id_12A8D["mg_turret"]._id_F269 = "manual";
  level._id_12A8D["mg_turret"]._id_F268 = "sentry_offline";
  level._id_12A8D["mg_turret"]._id_11901 = 60.0;
  level._id_12A8D["mg_turret"].health = 999999;
  level._id_12A8D["mg_turret"].maxhealth = 1000;
  level._id_12A8D["mg_turret"]._id_110EA = "remote_mg_turret";
  level._id_12A8D["mg_turret"]._id_039B = "remote_turret_mp";
  level._id_12A8D["mg_turret"]._id_B91A = "mp_remote_turret";
  level._id_12A8D["mg_turret"]._id_B924 = "mp_remote_turret_placement";
  level._id_12A8D["mg_turret"]._id_B925 = "mp_remote_turret_placement_failed";
  level._id_12A8D["mg_turret"]._id_B91D = "mp_remote_turret";
  level._id_12A8D["mg_turret"]._id_115EB = "used_remote_mg_turret";
  level._id_12A8D["mg_turret"]._id_901A = &"KILLSTREAKS_ENTER_REMOTE_TURRET";
  level._id_12A8D["mg_turret"]._id_901B = &"KILLSTREAKS_EARLY_EXIT";
  level._id_12A8D["mg_turret"]._id_901F = &"KILLSTREAKS_DOUBLE_TAP_TO_CARRY";
  level._id_12A8D["mg_turret"]._id_CC28 = &"KILLSTREAKS_TURRET_PLACE";
  level._id_12A8D["mg_turret"]._id_38E3 = &"KILLSTREAKS_TURRET_CANNOT_PLACE";
  level._id_12A8D["mg_turret"]._id_13523 = "remote_sentry_destroyed";
  level._id_12A8D["mg_turret"]._id_A84D = "killstreak_remote_turret_laptop_mp";
  level._id_12A8D["mg_turret"]._id_DF7B = "killstreak_remote_turret_remote_mp";
  level._effect["sentry_explode_mp"] = loadfx("vfx/core/mp/killstreaks/vfx_sentry_gun_explosion");
  level._effect["sentry_smoke_mp"] = loadfx("vfx/core/mp/killstreaks/vfx_sg_damage_blacksmoke");
  level._effect["antenna_light_mp"] = loadfx("vfx/core/lights/light_detonator_blink");
}

_id_128FC(var_0, var_1) {
  var_2 = _id_128FF(var_0, "mg_turret");

  if (var_2)
  scripts\mp\matchdata::_id_AFC9(level._id_12A8D["mg_turret"]._id_110EA, self.origin);

  self._id_9D81 = 0;
  return var_2;
}

_id_1146D(var_0) {
  scripts\mp\utility\game::_id_141E(level._id_12A8D[var_0]._id_A84D);
  scripts\mp\utility\game::_id_141E(level._id_12A8D[var_0]._id_DF7B);
}

_id_128FF(var_0, var_1) {
  if (scripts\mp\utility\game::isusingremote())
  return 0;

  var_2 = _id_4A2C(var_1, self);
  _id_E152();
  _id_F68B(var_2, 1);
  thread _id_E2E0();

  if (isdefined(var_2))
  return 1;
  else
  return 0;
}

_id_F68B(var_0, var_1) {
  self endon("death");
  self endon("disconnect");
  var_0 _id_12A2C(self);
  scripts\engine\utility::_id_1C71(0);
  self notifyonplayercommand("place_turret", "+attack");
  self notifyonplayercommand("place_turret", "+attack_akimbo_accessible");
  self notifyonplayercommand("cancel_turret", "+actionslot 4");

  if (!level._id_4542) {
  self notifyonplayercommand("cancel_turret", "+actionslot 5");
  self notifyonplayercommand("cancel_turret", "+actionslot 6");
  self notifyonplayercommand("cancel_turret", "+actionslot 7");
  }

  for (;;) {
  var_2 = scripts\engine\utility::_id_13734("place_turret", "cancel_turret", "force_cancel_placement");

  if (var_2 == "cancel_turret" || var_2 == "force_cancel_placement") {
  if (var_2 == "cancel_turret" && !var_1)
  continue;

  if (level._id_4542) {
  var_3 = scripts\mp\utility\game::_id_7F55(level._id_12A8D[var_0._id_12A9A]._id_110EA);

  if (isdefined(self._id_A6A1) && var_3 == scripts\mp\utility\game::_id_7F55(self.pers["killstreaks"][self._id_A6A1]._id_110EA) && !self getweaponlistitems().size) {
  scripts\mp\utility\game::_id_12C6(var_3, 0);
  scripts\mp\utility\game::_id_13CB(4, "weapon", var_3);
  }
  }

  var_0 _id_12A2B();
  scripts\engine\utility::_id_1C71(1);
  return 0;
  }

  if (!var_0._id_3872)
  continue;

  var_0 _id_12A2E();
  scripts\engine\utility::_id_1C71(1);
  return 1;
  }
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
  foreach (var_1 in self._id_13CA0) {
  var_2 = strtok(var_1, "_");

  if (var_2[0] == "alt") {
  self._id_E2E7[var_1] = self getweaponammoclip(var_1);
  self._id_E2E9[var_1] = self getweaponammostock(var_1);
  continue;
  }

  self._id_E2E7[var_1] = self getweaponammoclip(var_1);
  self._id_E2E9[var_1] = self getweaponammostock(var_1);
  }

  self._id_13CD2 = [];

  foreach (var_1 in self._id_13CA0) {
  var_2 = strtok(var_1, "_");

  if (var_2[0] == "alt")
  continue;

  self._id_13CD2[self._id_13CD2.size] = var_1;
  scripts\mp\utility\game::_id_141E(var_1);
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

_id_12A2E() {
  self setmodel(level._id_12A8D[self._id_12A9A]._id_B91A);
  self _meth_8335(undefined);
  self setcandamage(1);
  self._id_3A9D _meth_80F3();
  self._id_3A9D = undefined;

  if (isdefined(self.owner)) {
  self.owner._id_9D81 = 0;
  scripts\mp\sentientpoolmanager::registersentient("Killstreak_Air", self.owner);
  }

  self playsound("sentry_gun_plant");
  thread _id_12A2A();
  self notify("placed");
}

_id_12A2B() {
  self._id_3A9D _meth_80F3();

  if (isdefined(self.owner))
  self.owner._id_9D81 = 0;

  self delete();
}

_id_12A2C(var_0) {
  self setmodel(level._id_12A8D[self._id_12A9A]._id_B924);
  self setcandamage(0);
  self _meth_8335(var_0);
  self _meth_82C7(0);
  self._id_3A9D = var_0;
  var_0._id_9D81 = 1;
  var_0 thread _id_12F4F(self);
  thread _id_12A16(var_0);
  thread _id_12A17(var_0);
  thread _id_12A15(var_0);
  thread _id_12A18();
  self setdefaultdroppitch(-89.0);
  _id_12A2D();
  self notify("carried");
}

_id_12F4F(var_0) {
  self endon("death");
  self endon("disconnect");
  level endon("game_ended");
  var_0 endon("placed");
  var_0 endon("death");
  var_0._id_3872 = 1;
  var_1 = -1;

  for (;;) {
  var_2 = self canplayerplacesentry();
  var_0.origin = var_2["origin"];
  var_0.angles = var_2["angles"];
  var_0._id_3872 = self isonground() && var_2["result"] && abs(var_0.origin[2] - self.origin[2]) < 10;

  if (var_0._id_3872 != var_1) {
  if (var_0._id_3872) {
  var_0 setmodel(level._id_12A8D[var_0._id_12A9A]._id_B924);
  self _meth_80F4(level._id_12A8D[var_0._id_12A9A]._id_CC28);
  } else {
  var_0 setmodel(level._id_12A8D[var_0._id_12A9A]._id_B925);
  self _meth_80F4(level._id_12A8D[var_0._id_12A9A]._id_38E3);
  }
  }

  var_1 = var_0._id_3872;
  wait 0.05;
  }
}

_id_12A16(var_0) {
  self endon("placed");
  self endon("death");
  var_0 waittill("death");

  if (self._id_3872)
  _id_12A2E();
  else
  self delete();
}

_id_12A17(var_0) {
  self endon("placed");
  self endon("death");
  var_0 waittill("disconnect");
  self delete();
}

_id_12A15(var_0) {
  self endon("placed");
  self endon("death");
  var_0 scripts\engine\utility::waittill_any("joined_team", "joined_spectators");
  self delete();
}

_id_12A18(var_0) {
  self endon("placed");
  self endon("death");
  level waittill("game_ended");
  self delete();
}

_id_4A2C(var_0, var_1) {
  var_2 = spawnturret("misc_turret", var_1.origin, level._id_12A8D[var_0]._id_039B);
  var_2.angles = var_1.angles;
  var_2 setmodel(level._id_12A8D[var_0]._id_B91A);
  var_2.owner = var_1;
  var_2.health = level._id_12A8D[var_0].health;
  var_2.maxhealth = level._id_12A8D[var_0].maxhealth;
  var_2._id_00E1 = 0;
  var_2._id_12A9A = var_0;
  var_2._id_11196 = 0;
  var_2._id_11199 = 5.0;
  var_2 _meth_835B(1);
  var_2 _id_12A2D();
  var_2 _meth_8336(var_1);
  var_2 _meth_835A(1, var_0);
  var_2 setdefaultdroppitch(-89.0);
  var_2 thread _id_129FC();
  var_2._id_4D49 = 1.0;
  var_2 thread _id_12A03();
  var_2 thread _id_12A50();
  return var_2;
}

_id_12A2A() {
  self endon("death");
  self.owner endon("disconnect");
  self setdefaultdroppitch(0.0);
  self makeunusable();
  self _meth_81F7();

  if (!isdefined(self.owner))
  return;

  var_0 = self.owner;

  if (isdefined(var_0._id_DF89)) {
  foreach (var_2 in var_0._id_DF89)
  var_2 notify("death");
  }

  var_0._id_DF89 = [];
  var_0._id_DF89[0] = self;
  var_0._id_13107 = 0;
  var_0._id_CB39 = 0;
  var_0._id_6617 = 1;

  if (isalive(var_0))
  var_0 scripts\mp\utility\game::_id_F78C("pickup_remote_turret", level._id_12A8D[self._id_12A9A]._id_901F, undefined, undefined, undefined, undefined, undefined, undefined, 1);

  var_0 thread _id_13AE5(self);

  if (level.teambased) {
  self.team = var_0.team;
  self _meth_835E(var_0.team);
  scripts\mp\entityheadicons::_id_F877(self.team, (0, 0, 65));
  }
  else
  scripts\mp\entityheadicons::_id_F7F2(self.owner, (0, 0, 65));

  self._id_C840 = spawn("trigger_radius", self.origin + (0, 0, 1), 0, 32, 64);
  self._id_C840 _meth_80D2();
  self._id_C840 linkto(self);
  var_0 thread _id_129FD(self);
  thread _id_13A1D();
  thread _id_129FB();
  thread _id_129FA();
  thread _id_12A44();
  thread _id_129CD();
}

_id_10E08() {
  var_0 = self.owner;
  var_0 scripts\mp\utility\game::_id_FB09(self._id_12A9A);
  var_0 scripts\mp\utility\game::_id_7385(1);
  var_1 = var_0 scripts\mp\killstreaks\killstreaks::_id_98C2();

  if (var_1 != "success") {
  if (var_1 != "disconnect")
  var_0 scripts\mp\utility\game::_id_41E9();

  return 0;
  }

  var_0 scripts\mp\utility\game::_id_12C6(level._id_12A8D[self._id_12A9A]._id_DF7B);
  var_0 scripts\mp\utility\game::_id_141B(level._id_12A8D[self._id_12A9A]._id_DF7B);
  var_0 scripts\mp\utility\game::_id_7385(0);
  var_0 thread _id_13714(1.0, self);

  if (isdefined(level._id_9181["thermal_mode"]))
  level._id_9181["thermal_mode"] _meth_834D("");

  if (getdvarint("camera_thirdPerson"))
  var_0 scripts\mp\utility\game::_id_F887(0);

  var_0 _meth_823E(self, "tag_player", 0, 180, 180, 50, 25, 0);
  var_0 _meth_8236(0);
  var_0 _meth_8235(1);
  var_0 remotecontrolturret(self);
  var_0 scripts\mp\utility\game::_id_41C4("enter_remote_turret");
  var_0 scripts\mp\utility\game::_id_41C4("pickup_remote_turret");
  var_0 scripts\mp\utility\game::_id_F78C("early_exit", level._id_12A8D[self._id_12A9A]._id_901B, undefined, undefined, undefined, undefined, undefined, undefined, 1);
}

_id_13714(var_0, var_1) {
  self endon("disconnect");
  var_1 endon("death");
  wait(var_0);
  self _meth_8401(game["thermal_vision"], 1.5);
  self _meth_83C0();
  self _meth_83BE();
}

_id_1109C() {
  var_0 = self.owner;

  if (var_0 scripts\mp\utility\game::isusingremote()) {
  var_0 thermalvisionoff();
  var_0 thermalvisionfofoverlayoff();
  var_0 remotecontrolturretoff(self);
  var_0 unlink();
  var_0 scripts\mp\utility\game::_id_141A(var_0 scripts\engine\utility::_id_7F62());
  var_0 scripts\mp\utility\game::_id_41E9();

  if (getdvarint("camera_thirdPerson"))
  var_0 scripts\mp\utility\game::_id_F887(1);

  var_0 _meth_8401(game["thermal_vision"], 0);
  var_1 = scripts\mp\utility\game::_id_7F55(level._id_12A8D[self._id_12A9A]._id_110EA);
  var_0 scripts\mp\killstreaks\killstreaks::_id_1146C(var_1);
  }

  if (self._id_11196)
  var_0 _meth_83AA();

  var_0 scripts\mp\utility\game::_id_41C4("early_exit");

  if (!isdefined(var_0._id_13108) || !var_0._id_13108)
  var_0 scripts\mp\utility\game::_id_F78C("enter_remote_turret", level._id_12A8D[self._id_12A9A]._id_901A, undefined, undefined, undefined, 1, 0.25, 1.5, 1);

  self notify("exit");
}

_id_13AE5(var_0) {
  self endon("disconnect");
  var_0 endon("death");
  self._id_13108 = 0;

  for (;;) {
  if (isalive(self))
  self waittill("death");

  scripts\mp\utility\game::_id_41C4("enter_remote_turret");
  scripts\mp\utility\game::_id_41C4("pickup_remote_turret");

  if (self._id_13107)
  self._id_13108 = 1;
  else
  self._id_13108 = 0;

  self waittill("spawned_player");

  if (!self._id_13108) {
  scripts\mp\utility\game::_id_F78C("enter_remote_turret", level._id_12A8D[var_0._id_12A9A]._id_901A, undefined, undefined, undefined, 1, 0.25, 1.5, 1);
  continue;
  }

  var_0 notify("death");
  }
}

_id_13A1D() {
  self endon("death");
  self endon("carried");
  level endon("game_ended");
  var_0 = self.owner;

  for (;;) {
  var_1 = var_0 getcurrentweapon();

  if (scripts\mp\utility\game::_id_9E6C(var_1) && var_1 != level._id_12A8D[self._id_12A9A]._id_039B && var_1 != level._id_12A8D[self._id_12A9A]._id_A84D && var_1 != level._id_12A8D[self._id_12A9A]._id_DF7B && var_1 != "none" && (!var_0 scripts\mp\utility\game::isjuggernaut() || var_0 scripts\mp\utility\game::isusingremote())) {
  if (!isdefined(var_0._id_6617) || !var_0._id_6617) {
  var_0._id_6617 = 1;
  var_0 scripts\mp\utility\game::_id_41C4("enter_remote_turret");
  }

  wait 0.05;
  continue;
  }

  if (var_0 istouching(self._id_C840)) {
  if (!isdefined(var_0._id_6617) || !var_0._id_6617) {
  var_0._id_6617 = 1;
  var_0 scripts\mp\utility\game::_id_41C4("enter_remote_turret");
  }

  wait 0.05;
  continue;
  }

  if (isdefined(var_0._id_61A3) && var_0._id_61A3) {
  if (!isdefined(var_0._id_6617) || !var_0._id_6617) {
  var_0._id_6617 = 1;
  var_0 scripts\mp\utility\game::_id_41C4("enter_remote_turret");
  }

  wait 0.05;
  continue;
  }

  if (var_0 _meth_81AB() && !var_0._id_13107) {
  if (!isdefined(var_0._id_6617) || !var_0._id_6617) {
  var_0._id_6617 = 1;
  var_0 scripts\mp\utility\game::_id_41C4("enter_remote_turret");
  }

  wait 0.05;
  continue;
  }

  if (isdefined(var_0._id_6617) && var_0._id_6617 && var_1 != "none") {
  var_0 scripts\mp\utility\game::_id_F78C("enter_remote_turret", level._id_12A8D[self._id_12A9A]._id_901A, undefined, undefined, undefined, 1, 0.25, 1.5, 1);
  var_0._id_6617 = 0;
  }

  var_2 = 0;

  while (var_0 usebuttonpressed() && !var_0 fragbuttonpressed() && !var_0 scripts\mp\utility\game::_id_85C7() && !var_0 secondaryoffhandbuttonpressed() && !var_0 isusingturret() && var_0 isonground() && !var_0 istouching(self._id_C840) && (!isdefined(var_0._id_61A3) || !var_0._id_61A3)) {
  if (isdefined(var_0._id_9D81) && var_0._id_9D81)
  break;

  if (isdefined(var_0._id_9D7F) && var_0._id_9D7F)
  break;

  if (!isalive(var_0))
  break;

  if (!var_0._id_13107 && var_0 scripts\mp\utility\game::isusingremote())
  break;

  if (var_0 _meth_81AB() && !var_0._id_13107)
  break;

  var_2 = var_2 + 0.05;

  if (var_2 > 0.75) {
  var_0._id_13107 = !var_0._id_13107;

  if (var_0._id_13107) {
  var_0 _id_E18E();
  var_0 _id_1146D(self._id_12A9A);
  var_0 scripts\mp\utility\game::_id_12C6(level._id_12A8D[self._id_12A9A]._id_A84D);
  var_0 scripts\mp\utility\game::_id_141B(level._id_12A8D[self._id_12A9A]._id_A84D);
  _id_10E08();
  var_0 _id_E2E8();
  } else {
  var_0 _id_1146D(self._id_12A9A);
  _id_1109C();
  }

  wait 2.0;
  break;
  }

  wait 0.05;
  }

  wait 0.05;
  }
}

_id_129FD(var_0) {
  self endon("disconnect");
  level endon("game_ended");
  var_0 endon("death");

  if (!isdefined(var_0._id_C840))
  return;

  if (isdefined(self.pers["isBot"]) && self.pers["isBot"])
  return;

  var_1 = 0;

  for (;;) {
  var_2 = self getcurrentweapon();

  if (scripts\mp\utility\game::_id_9E6C(var_2) && var_2 != "killstreak_remote_turret_mp" && var_2 != level._id_12A8D[var_0._id_12A9A]._id_039B && var_2 != level._id_12A8D[var_0._id_12A9A]._id_A84D && var_2 != level._id_12A8D[var_0._id_12A9A]._id_DF7B && var_2 != "none" && (!scripts\mp\utility\game::isjuggernaut() || scripts\mp\utility\game::isusingremote())) {
  if (!isdefined(self._id_CB39) || !self._id_CB39) {
  self._id_CB39 = 1;
  scripts\mp\utility\game::_id_41C4("pickup_remote_turret");
  }

  wait 0.05;
  continue;
  }

  if (!self istouching(var_0._id_C840)) {
  if (!isdefined(self._id_CB39) || !self._id_CB39) {
  self._id_CB39 = 1;
  scripts\mp\utility\game::_id_41C4("pickup_remote_turret");
  }

  wait 0.05;
  continue;
  }

  if (scripts\mp\utility\game::isreallyalive(self) && self istouching(var_0._id_C840) && !isdefined(var_0._id_3A9D) && self isonground()) {
  if (isdefined(self._id_CB39) && self._id_CB39 && var_2 != "none") {
  scripts\mp\utility\game::_id_F78C("pickup_remote_turret", level._id_12A8D[var_0._id_12A9A]._id_901F, undefined, undefined, undefined, undefined, undefined, undefined, 1);
  self._id_CB39 = 0;
  }

  if (self usebuttonpressed()) {
  if (isdefined(self._id_13107) && self._id_13107)
  continue;

  var_1 = 0;

  while (self usebuttonpressed()) {
  var_1 = var_1 + 0.05;
  wait 0.05;
  }

  if (var_1 >= 0.5)
  continue;

  var_1 = 0;

  while (!self usebuttonpressed() && var_1 < 0.5) {
  var_1 = var_1 + 0.05;
  wait 0.05;
  }

  if (var_1 >= 0.5)
  continue;

  if (!scripts\mp\utility\game::isreallyalive(self))
  continue;

  if (isdefined(self._id_13107) && self._id_13107)
  continue;

  var_0 _meth_830F(level._id_12A8D[var_0._id_12A9A]._id_F268);
  thread _id_F68B(var_0, 0);
  var_0._id_C840 delete();
  self._id_DF89 = undefined;
  scripts\mp\utility\game::_id_41C4("pickup_remote_turret");
  return;
  }
  }

  wait 0.05;
  }
}

_id_129CD() {
  self endon("death");
  self endon("carried");

  for (;;) {
  playfxontag(scripts\engine\utility::_id_7ECB("antenna_light_mp"), self, "tag_fx");
  wait 1.0;
  stopfxontag(scripts\engine\utility::_id_7ECB("antenna_light_mp"), self, "tag_fx");
  }
}

_id_12A2D() {
  self _meth_830F(level._id_12A8D[self._id_12A9A]._id_F268);

  if (level.teambased)
  scripts\mp\entityheadicons::_id_F877("none", (0, 0, 0));
  else if (isdefined(self.owner))
  scripts\mp\entityheadicons::_id_F7F2(undefined, (0, 0, 0));

  if (!isdefined(self.owner))
  return;

  var_0 = self.owner;

  if (isdefined(var_0._id_13107) && var_0._id_13107) {
  var_0 thermalvisionoff();
  var_0 thermalvisionfofoverlayoff();
  var_0 remotecontrolturretoff(self);
  var_0 unlink();
  var_0 scripts\mp\utility\game::_id_141A(var_0 scripts\engine\utility::_id_7F62());
  var_0 scripts\mp\utility\game::_id_41E9();

  if (getdvarint("camera_thirdPerson"))
  var_0 scripts\mp\utility\game::_id_F887(1);

  var_0 scripts\mp\killstreaks\killstreaks::_id_41D6();
  var_0 _meth_8401(game["thermal_vision"], 0);

  if (isdefined(var_0._id_55E4) && var_0._id_55E4)
  var_0 scripts\engine\utility::_id_1C6E(1);

  var_0 _id_1146D(self._id_12A9A);
  }
}

_id_129FC() {
  self endon("death");
  level endon("game_ended");
  self notify("turret_handleOwner");
  self endon("turret_handleOwner");
  self.owner scripts\engine\utility::waittill_any("disconnect", "joined_team", "joined_spectators");
  self notify("death");
}

_id_12A44() {
  self endon("death");
  level endon("game_ended");
  var_0 = level._id_12A8D[self._id_12A9A]._id_11901;

  while (var_0) {
  wait 1.0;
  scripts\mp\hostmigration::waittillhostmigrationdone();

  if (!isdefined(self._id_3A9D))
  var_0 = max(0, var_0 - 1.0);
  }

  if (isdefined(self.owner))
  self.owner thread scripts\mp\utility\game::leaderdialogonplayer("sentry_gone");

  self notify("death");
}

_id_129FB() {
  self endon("carried");
  var_0 = self getentitynumber();
  self waittill("death");

  if (!isdefined(self))
  return;

  self setmodel(level._id_12A8D[self._id_12A9A]._id_B91D);
  _id_12A2D();
  self setdefaultdroppitch(40);
  self _meth_8336(undefined);
  self _meth_835A(0);

  if (isdefined(self._id_C840))
  self._id_C840 delete();

  var_1 = self.owner;

  if (isdefined(var_1)) {
  var_1._id_13107 = 0;
  var_1 scripts\mp\utility\game::_id_41C4("enter_remote_turret");
  var_1 scripts\mp\utility\game::_id_41C4("early_exit");
  var_1 scripts\mp\utility\game::_id_41C4("pickup_remote_turret");
  var_1 _id_E2E0();
  var_1 _id_E2E8();

  if (var_1 getcurrentweapon() == "none")
  var_1 scripts\mp\utility\game::_id_141A(var_1 scripts\engine\utility::_id_7F62());

  if (self._id_11196)
  var_1 _meth_83AA();
  }

  self playsound("sentry_explode");
  playfxontag(scripts\engine\utility::_id_7ECB("sentry_explode_mp"), self, "tag_aim");
  wait 1.5;
  self playsound("sentry_explode_smoke");

  for (var_2 = 8; var_2 > 0; var_2 = var_2 - 0.4) {
  playfxontag(scripts\engine\utility::_id_7ECB("sentry_smoke_mp"), self, "tag_aim");
  wait 0.4;
  }

  self notify("deleting");

  if (isdefined(self._id_11512))
  self._id_11512 delete();

  self delete();
}

_id_129FA() {
  self endon("death");
  self endon("carried");
  self setcandamage(1);

  for (;;) {
  self waittill("damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9);

  if (!scripts\mp\weapons::_id_7415(self.owner, var_1))
  continue;

  if (isdefined(var_9)) {
  switch (var_9) {
  case "sensor_grenade_mp":
  case "flash_grenade_mp":
  case "concussion_grenade_mp":
  if (var_4 == "MOD_GRENADE_SPLASH" && self.owner._id_13107) {
  self._id_11196 = 1;
  thread _id_12A35();
  }
  case "smoke_grenadejugg_mp":
  case "smoke_grenade_mp":
  continue;
  }
  }

  if (!isdefined(self))
  return;

  if (var_4 == "MOD_MELEE")
  self._id_00E1 = self._id_00E1 + self.maxhealth;

  if (isdefined(var_8) && var_8 & level.idflags_penetration)
  self._id_1390E = 1;

  if (isdefined(var_8) && var_8 & level.idflags_no_team_protection)
  self._id_1390F = 1;

  self._id_1390B = 1;
  self._id_4D49 = 0.0;
  var_10 = var_0;

  if (isplayer(var_1)) {
  var_1 scripts\mp\damagefeedback::updatedamagefeedback("remote_turret");

  if (var_1 scripts\mp\utility\game::_id_12D6("specialty_armorpiercing"))
  var_10 = var_0 * level._id_218B;
  }

  if (isdefined(var_1.owner) && isplayer(var_1.owner))
  var_1.owner scripts\mp\damagefeedback::updatedamagefeedback("remote_turret");

  if (isdefined(var_9)) {
  switch (var_9) {
  case "remotemissile_projectile_mp":
  case "javelin_mp":
  case "remote_mortar_missile_mp":
  case "stinger_mp":
  case "ac130_40mm_mp":
  case "ac130_105mm_mp":
  self._id_A859 = 1;
  var_10 = self.maxhealth + 1;
  break;
  case "stealth_bomb_mp":
  case "artillery_mp":
  self._id_A859 = 0;
  var_10 = var_10 + var_0 * 4;
  break;
  case "emp_grenade_mp":
  case "bomb_site_mp":
  self._id_A859 = 0;
  var_10 = self.maxhealth + 1;
  break;
  }

  scripts\mp\killstreaks\killstreaks::_id_A6A0(var_1, var_9, self, var_4);
  }

  self._id_00E1 = self._id_00E1 + var_10;

  if (self._id_00E1 >= self.maxhealth) {
  if (isplayer(var_1) && (!isdefined(self.owner) || var_1 != self.owner)) {
  var_1 thread scripts\mp\utility\game::_id_83B4("kill", var_9, 100);
  var_1 notify("destroyed_killstreak");
  }

  if (isdefined(self.owner))
  self.owner thread scripts\mp\utility\game::leaderdialogonplayer(level._id_12A8D[self._id_12A9A]._id_13523, undefined, undefined, self.origin);

  self notify("death");
  return;
  }
  }
}

_id_12A03() {
  self endon("death");
  level endon("game_ended");
  var_0 = 0;

  for (;;) {
  if (self._id_4D49 < 1.0) {
  self._id_4D49 = self._id_4D49 + 0.1;
  var_0 = 1;
  }
  else if (var_0) {
  self._id_4D49 = 1.0;
  var_0 = 0;
  }

  wait 0.1;
  }
}

_id_12A50() {
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

_id_12A35() {
  self notify("stunned");
  self endon("stunned");
  self endon("death");

  while (self._id_11196) {
  self.owner shellshock("concussion_grenade_mp", self._id_11199);
  playfxontag(scripts\engine\utility::_id_7ECB("sentry_explode_mp"), self, "tag_origin");
  var_0 = 0;

  while (var_0 < self._id_11199) {
  var_0 = var_0 + 0.05;
  wait 0.05;
  }

  self._id_11196 = 0;
  }
}
