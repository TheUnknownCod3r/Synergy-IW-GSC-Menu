/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2668.gsc
***************************************/

init() {
  level._effect["sentry_overheat_mp"] = loadfx("vfx/core/mp/killstreaks/vfx_sg_overheat_smoke");
  level._effect["sentry_explode_mp"] = loadfx("vfx/core/mp/killstreaks/vfx_ims_explosion");
  level._effect["sentry_smoke_mp"] = loadfx("vfx/core/mp/killstreaks/vfx_sg_damage_blacksmoke");
  level._id_F26B = [];
  level._id_F26B["crafted_autosentry"] = spawnstruct();
  level._id_F26B["crafted_autosentry"].health = 999999;
  level._id_F26B["crafted_autosentry"].maxhealth = 300;
  level._id_F26B["crafted_autosentry"]._id_32C1 = 20;
  level._id_F26B["crafted_autosentry"]._id_32C0 = 40;
  level._id_F26B["crafted_autosentry"]._id_C9D3 = 0.15;
  level._id_F26B["crafted_autosentry"]._id_C9D1 = 0.25;
  level._id_F26B["crafted_autosentry"]._id_F269 = "sentry";
  level._id_F26B["crafted_autosentry"]._id_F268 = "sentry_offline";
  level._id_F26B["crafted_autosentry"]._id_11901 = 90.0;
  level._id_F26B["crafted_autosentry"]._id_10A13 = 1.0;
  level._id_F26B["crafted_autosentry"]._id_C7FB = 15.0;
  level._id_F26B["crafted_autosentry"]._id_461D = 0.2;
  level._id_F26B["crafted_autosentry"]._id_7645 = 0.3;
  level._id_F26B["crafted_autosentry"]._id_039B = "alien_sentry_minigun_4_mp";
  level._id_F26B["crafted_autosentry"]._id_B91A = "weapon_sentry_chaingun";
  level._id_F26B["crafted_autosentry"]._id_B924 = "weapon_sentry_chaingun";
  level._id_F26B["crafted_autosentry"]._id_B925 = "weapon_sentry_chaingun_obj_red";
  level._id_F26B["crafted_autosentry"]._id_B91D = "weapon_sentry_chaingun_destroyed";
  level._id_F26B["crafted_autosentry"]._id_017B = &"COOP_CRAFTABLES_PICKUP";
  level._id_F26B["crafted_autosentry"]._id_016F = 1;
  level._id_F26B["crafted_autosentry"]._id_13523 = "sentry_destroyed";
  level._id_F26B["crafted_autosentry"]._id_9F43 = 0;
}

_id_82BA(var_0, var_1) {
  var_1 thread _id_13932();
  var_1 notify("new_power", "crafted_autosentry");
  var_1 setclientomnvar("zom_crafted_weapon", 1);
  var_1 thread _id_0A77::_id_1308C(var_1, "iw7_pickup_zm");
  _id_0A77::_id_F313("crafted_autosentry", ::_id_82BA, var_1);
}

_id_13932() {
  self endon("disconnect");
  self endon("death");
  self notify("craft_dpad_watcher");
  self endon("craft_dpad_watcher");
  self notifyonplayercommand("pullout_sentry", "+actionslot 3");

  for (;;) {
  self waittill("pullout_sentry");

  if (scripts\engine\utility::_id_9CEE(self._id_9D81))
  continue;

  if (scripts\engine\utility::_id_9CEE(self._id_AD2C))
  continue;

  if (isdefined(self.allow_carry) && self.allow_carry == 0)
  continue;

  if (_id_0A77::_id_9D05())
  break;
  }

  thread _id_83A3("crafted_autosentry");
}

_id_83A3(var_0) {
  self endon("disconnect");
  self._id_A904 = var_0;
  _id_0A77::_id_41C4("msg_power_hint");
  var_1 = _id_4A11(var_0, self);
  self._id_A039 = var_0;
  _id_0A77::_id_E077();
  self._id_3AA5 = var_1;
  var_2 = _id_F688(var_1, 1);
  self._id_3AA5 = undefined;
  thread _id_0A77::_id_1365D();
  self._id_9D81 = 0;

  if (isdefined(var_1))
  return 1;
  else
  return 0;
}

_id_F688(var_0, var_1) {
  self endon("disconnect");
  var_0 _id_F255(self, var_1);
  scripts\engine\utility::_id_1C71(0);
  self notifyonplayercommand("place_sentry", "+attack");
  self notifyonplayercommand("place_sentry", "+attack_akimbo_accessible");
  self notifyonplayercommand("cancel_sentry", "+actionslot 3");

  if (!level._id_4542) {
  self notifyonplayercommand("cancel_sentry", "+actionslot 5");
  self notifyonplayercommand("cancel_sentry", "+actionslot 6");
  self notifyonplayercommand("cancel_sentry", "+actionslot 7");
  }

  for (;;) {
  var_2 = scripts\engine\utility::_id_13734("place_sentry", "cancel_sentry", "force_cancel_placement");

  if (!isdefined(var_0)) {
  scripts\engine\utility::_id_1C71(1);
  return 1;
  }

  if (!isdefined(var_2))
  var_2 = "force_cancel_placement";

  if (var_2 == "cancel_sentry" || var_2 == "force_cancel_placement") {
  if (!var_1 && var_2 == "cancel_sentry")
  continue;

  scripts\engine\utility::_id_1C71(1);
  var_0 _id_F253();

  if (var_2 != "force_cancel_placement")
  thread _id_13932();
  else if (var_1)
  _id_0A77::_id_DFE0(self);

  return 0;
  }

  if (!var_0._id_3872)
  continue;

  if (var_1)
  _id_0A77::_id_DFE0(self);

  var_0 _id_F259();
  scripts\engine\utility::_id_1C71(1);
  return 1;
  }
}

_id_4A11(var_0, var_1) {
  var_2 = spawnturret("misc_turret", var_1.origin, level._id_F26B[var_0]._id_039B);
  var_2.angles = var_1.angles;
  var_2.name = "crafted_autosentry";
  var_2 _id_F246(var_0, var_1);
  return var_2;
}

_id_F246(var_0, var_1) {
  self._id_F26E = var_0;
  self._id_3872 = 1;
  self setmodel(level._id_F26B[self._id_F26E]._id_B91A);
  self._id_10085 = 1;
  self setcandamage(1);

  switch (var_0) {
  case "crafted_autosentry":
  default:
  self maketurretinoperable();
  self _meth_82FB(100);
  self _meth_8330(100);
  self _meth_82B6(90);
  self _meth_8353(60);
  self _meth_82C9(0.3, "pitch");
  self _meth_82C9(0.3, "yaw");
  self _meth_82C8(0.65);
  self setdefaultdroppitch(-89.0);
  break;
  }

  self _meth_835B(1);
  _id_F257();
  _id_F258(var_1);
  thread _id_F242(var_1);
  thread _id_0A77::_id_A030(undefined, level._id_F26B[self._id_F26E]._id_11901);
  thread _id_F244();
  thread _id_F239();
  thread _id_F23A();
}

_id_F242(var_0) {
  self waittill("death");

  if (!isdefined(self))
  return;

  self setmodel(level._id_F26B[self._id_F26E]._id_B91D);
  _id_F257();
  self setdefaultdroppitch(40);

  if (isdefined(self._id_3A9D))
  self _meth_8335(undefined);

  self _meth_8336(undefined);
  self playsound("sentry_explode");

  if (isdefined(self))
  thread _id_F23F();
}

_id_F23F() {
  self notify("sentry_delete_turret");
  self endon("sentry_delete_turret");

  if (isdefined(self._id_9B05)) {
  playfxontag(scripts\engine\utility::_id_7ECB("sentry_explode_mp"), self, "tag_origin");
  playfxontag(scripts\engine\utility::_id_7ECB("sentry_smoke_mp"), self, "tag_aim");
  self._id_9B05 _id_0A77::_id_E2CC();
  self notify("deleting");
  self _meth_83D3(self._id_9B05);
  wait 1.0;
  } else {
  wait 1.5;
  playfxontag(scripts\engine\utility::_id_7ECB("sentry_explode_mp"), self, "tag_aim");
  playfxontag(scripts\engine\utility::_id_7ECB("sentry_smoke_mp"), self, "tag_aim");
  self playsound("sentry_explode_smoke");
  wait 0.1;
  self notify("deleting");
  }

  if (isdefined(self._id_A63A))
  self._id_A63A delete();

  if (isdefined(self))
  self delete();
}

_id_F244() {
  self endon("death");
  level endon("game_ended");

  for (;;) {
  self waittill("trigger", var_0);

  if (!var_0 _id_0A77::_id_9D05())
  continue;

  if (scripts\engine\utility::_id_9CEE(var_0._id_9D81))
  continue;

  if (scripts\engine\utility::_id_9CEE(var_0.kung_fu_mode))
  continue;

  var_0 _id_F688(self, 0);
  }
}

_id_F258(var_0) {
  var_0._id_4BAE = self;
  self.owner = var_0;
  self _meth_8336(self.owner);
  self.team = self.owner.team;
  self _meth_835E(self.team);
  thread _id_0A77::_id_A021("sentry_handleOwner");
}

_id_F259() {
  self setmodel(level._id_F26B[self._id_F26E]._id_B91A);

  if (self _meth_813D() == "manual")
  self _meth_830F(level._id_F26B[self._id_F26E]._id_F268);

  self _meth_8335(undefined);
  _id_F24A();
  self._id_3A9D _meth_80F3();
  self._id_3A9D = undefined;

  if (isdefined(self.owner)) {
  self.owner._id_9D81 = 0;

  if (level._id_F26B[self._id_F26E]._id_9F43)
  _id_0A77::_id_B268(self.owner.team);

  self.owner notify("new_sentry", self);
  }

  _id_F252();
  self playsound("sentry_gun_plant");
  self laseron();
  self notify("placed");
}

_id_F253() {
  self._id_3A9D _meth_80F3();

  if (isdefined(self.owner))
  self.owner._id_9D81 = 0;

  self delete();
}

_id_F255(var_0, var_1) {
  self setmodel(level._id_F26B[self._id_F26E]._id_B924);
  self _meth_8335(var_0);
  self setcandamage(0);
  self laseroff();
  _id_F249();
  self._id_3A9D = var_0;
  var_0._id_9D81 = 1;
  var_0 thread _id_12F16(self, var_1);
  thread _id_0A77::_id_A025(var_0);
  thread _id_0A77::_id_A026(var_0);
  thread _id_0A77::_id_A027(var_0);
  self _meth_80F7();
  self setdefaultdroppitch(-89.0);
  _id_F257();
  self notify("carried");
}

_id_12F16(var_0, var_1) {
  self endon("death");
  self endon("disconnect");
  level endon("game_ended");
  var_0 endon("placed");
  var_0 endon("death");
  var_0._id_3872 = 1;
  var_2 = -1;

  for (;;) {
  var_0._id_3872 = _id_3834(var_0);

  if (var_0._id_3872 != var_2) {
  if (var_0._id_3872) {
  var_0 setmodel(level._id_F26B[var_0._id_F26E]._id_B924);

  if (!var_1)
  self _meth_80F4(&"COOP_CRAFTABLES_PLACE");
  else
  self _meth_80F4(&"COOP_CRAFTABLES_PLACE_CANCELABLE");
  } else {
  var_0 setmodel(level._id_F26B[var_0._id_F26E]._id_B925);
  self _meth_80F4(&"COOP_CRAFTABLES_CANNOT_PLACE");
  }
  }

  var_2 = var_0._id_3872;
  wait 0.05;
  }
}

_id_3834(var_0) {
  var_1 = self canplayerplacesentry();
  var_0.origin = var_1["origin"];
  var_0.angles = var_1["angles"];

  if (_id_0A77::_id_65F0(var_0))
  return 0;

  return self isonground() && var_1["result"] && abs(var_0.origin[2] - self.origin[2]) < 10;
}

_id_F252() {
  self _meth_830F(level._id_F26B[self._id_F26E]._id_F269);
  self setcursorhint("HINT_NOICON");
  self sethintstring(level._id_F26B[self._id_F26E]._id_017B);
  self makeusable();
  self _meth_84A5(120);
  self _meth_84A2(96);

  foreach (var_1 in level.players) {
  switch (self._id_F26E) {
  case "crafted_autosentry":
  var_2 = self getentitynumber();
  _id_1862(var_2, var_1);
  break;
  }
  }
}

_id_F257() {
  self _meth_830F(level._id_F26B[self._id_F26E]._id_F268);
  self makeunusable();
  var_0 = self getentitynumber();
  _id_E11F(var_0);
}

_id_F24A() {
  self _meth_81F7();
}

_id_F249() {
  self _meth_82C7(0);
}

_id_1862(var_0, var_1) {
  level._id_12A83 = scripts\engine\utility::_id_1756(level._id_12A83, self);

  if (level._id_12A83.size > 4) {
  if (isdefined(level._id_12A83[0])) {
  level._id_12A83[0] notify("death");
  var_1 playlocalsound("ww_magicbox_laughter");
  }
  }
}

_id_E11F(var_0) {
  level._id_12A83 = scripts\engine\utility::array_remove(level._id_12A83, self);
}

_id_F239() {
  self endon("death");
  level endon("game_ended");
  self._id_B941 = 0;
  self._id_8CDE = 0;
  self._id_C7F9 = 0;
  thread _id_F245();

  for (;;) {
  scripts\engine\utility::_id_13762("turretstatechange", "cooled");

  if (self _meth_81A0()) {
  thread _id_F23B();
  continue;
  }

  _id_F25B();
  thread _id_F23C();
  }
}

_id_F260() {
  self endon("death");
  self playsound("sentry_gun_target_lock_beep");
  wait 0.19;
  self playsound("sentry_gun_target_lock_beep");
  wait 0.19;
  self playsound("sentry_gun_target_lock_beep");
}

_id_F25C() {
  thread _id_F260();

  while (self._id_B941 < level._id_F26B[self._id_F26E]._id_10A13) {
  self._id_B941 = self._id_B941 + 0.1;
  wait 0.1;
  }
}

_id_F25B() {
  self._id_B941 = 0;
}

_id_F23B() {
  self endon("death");
  self endon("stop_shooting");
  level endon("game_ended");
  _id_F25C();
  var_0 = weaponfiretime(level._id_F26B[self._id_F26E]._id_039B);
  var_1 = level._id_F26B[self._id_F26E]._id_32C1;
  var_2 = level._id_F26B[self._id_F26E]._id_32C0;
  var_3 = level._id_F26B[self._id_F26E]._id_C9D3;
  var_4 = level._id_F26B[self._id_F26E]._id_C9D1;

  for (;;) {
  var_5 = randomintrange(var_1, var_2 + 1);

  for (var_6 = 0; var_6 < var_5 && !self._id_C7F9; var_6++) {
  self shootturret();
  self notify("bullet_fired");
  self._id_8CDE = self._id_8CDE + var_0;
  wait(var_0);
  }

  wait(randomfloatrange(var_3, var_4));
  }
}

_id_F23C() {
  self notify("stop_shooting");
}

_id_12A31(var_0) {
  self endon("death");
  self endon("disconnect");
  level endon("game_ended");
  var_0 endon("death");
  var_0 endon("player_dismount");
  var_1 = weaponfiretime(level._id_F26B[var_0._id_F26E]._id_039B);

  for (;;) {
  var_0 waittill("turret_fire");
  var_0 _meth_8165() notify("turret_fire");
  var_0._id_8CDE = var_0._id_8CDE + var_1;
  var_0._id_4621 = var_1;
  }
}

_id_F245() {
  self endon("death");
  var_0 = weaponfiretime(level._id_F26B[self._id_F26E]._id_039B);
  var_1 = 0;
  var_2 = 0;
  var_3 = level._id_F26B[self._id_F26E]._id_C7FB;
  var_4 = level._id_F26B[self._id_F26E]._id_461D;

  for (;;) {
  if (self._id_8CDE != var_1)
  wait(var_0);
  else
  self._id_8CDE = max(0, self._id_8CDE - 0.05);

  if (self._id_8CDE > var_3) {
  self._id_C7F9 = 1;
  thread _id_D497();

  switch (self._id_F26E) {
  case "crafted_autosentry":
  playfxontag(scripts\engine\utility::_id_7ECB("sentry_smoke_mp"), self, "tag_aim");
  break;
  default:
  break;
  }

  while (self._id_8CDE) {
  self._id_8CDE = max(0, self._id_8CDE - 0.1);
  wait 0.1;
  }

  self._id_C7F9 = 0;
  self notify("not_overheated");
  }

  var_1 = self._id_8CDE;
  wait 0.05;
  }
}

_id_12A00() {
  self endon("death");
  var_0 = level._id_F26B[self._id_F26E]._id_C7FB;

  for (;;) {
  if (self._id_8CDE > var_0) {
  self._id_C7F9 = 1;
  thread _id_D497();

  switch (self._id_F26E) {
  case "gl_turret":
  playfxontag(scripts\engine\utility::_id_7ECB("sentry_smoke_mp"), self, "tag_aim");
  break;
  default:
  break;
  }

  while (self._id_8CDE)
  wait 0.1;

  self._id_C7F9 = 0;
  self notify("not_overheated");
  }

  wait 0.05;
  }
}

_id_129D7() {
  self endon("death");

  for (;;) {
  if (self._id_8CDE > 0) {
  if (self._id_4621 <= 0)
  self._id_8CDE = max(0, self._id_8CDE - 0.05);
  else
  self._id_4621 = max(0, self._id_4621 - 0.05);
  }

  wait 0.05;
  }
}

_id_D497() {
  self endon("death");
  self endon("not_overheated");
  level endon("game_ended");
  self notify("playing_heat_fx");
  self endon("playing_heat_fx");

  for (;;) {
  playfxontag(scripts\engine\utility::_id_7ECB("sentry_overheat_mp"), self, "tag_flash");
  wait(level._id_F26B[self._id_F26E]._id_7645);
  }
}

_id_D51F() {
  self endon("death");
  self endon("not_overheated");
  level endon("game_ended");

  for (;;) {
  playfxontag(scripts\engine\utility::_id_7ECB("sentry_smoke_mp"), self, "tag_aim");
  wait 0.4;
  }
}

_id_F23A() {
  self endon("death");
  level endon("game_ended");

  for (;;) {
  wait 3.0;

  if (!isdefined(self._id_3A9D))
  self playsound("sentry_gun_beep");
  }
}