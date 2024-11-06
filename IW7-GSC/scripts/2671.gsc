/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2671.gsc
***************************************/

_id_DEE0() {
  level._id_12EE0 = ::_id_12EDF;
  level._id_12EE2 = ::_id_12EE1;
  level._id_12EDE = ::_id_12EDD;
  level._id_462E = [];

  if (!isdefined(level._id_CA5B))
  level._id_CA5B = ["perk_machine_tough", "perk_machine_revive", "perk_machine_flash", "perk_machine_more", "perk_machine_rat_a_tat", "perk_machine_run", "perk_machine_fwoosh", "perk_machine_smack", "perk_machine_zap", "perk_machine_boom"];

  level._id_C54A = [];
  level._id_C54A["passive_nuke"] = ::_id_11AF4;
  level._id_C54A["passive_random_perks"] = ::trackkillsforrandomperks;
  level._id_C54A["passive_headshot_ammo"] = ::_id_89AE;
  level._id_C54A["passive_headshot_super"] = ::_id_1869;
  level._id_C54A["passive_refresh"] = ::_id_89D1;
  level._id_C54A["passive_double_kill_reload"] = ::_id_5AE4;
  level._id_C54A["passive_gore"] = ::_id_89AB;
  level._id_C54A["passive_health_regen_on_kill"] = ::_id_89B1;
  level._id_C54A["passive_move_speed_on_kill"] = ::_id_89C8;
  level._id_C54A["passive_hitman"] = ::_id_89B3;
  level._id_C54A["passive_meleekill"] = ::handlemeleekillpassive;
  level._id_C54A["passive_health_on_kill"] = ::handlehealthonkillpassive;
  level._id_C54A["passive_last_shots_ammo"] = ::handleammoonlastshotskill;
  level._id_C54A["passive_visor_detonation"] = ::handlevisordetonation;
  level._id_C54A["passive_melee_super"] = ::handlemeleesuper;
  level._id_C54A["passive_jump_super"] = ::handleairbornesuper;
  level._id_C54A["passive_double_kill_super"] = ::handledoublekillssuper;
  level._id_C54A["passive_melee_cone_expl"] = ::handlemeleeconeexplode;
  level._id_C54A["passive_berserk"] = ::handleberserk;
  _id_DEDF("passive_last_shots_ammo", ::init_passive_last_shots_ammo, ::set_passive_last_shots_ammo, ::unset_passive_last_shots_ammo);
  _id_DEDF("passive_nuke", ::_id_96BA, ::_id_F4C0, ::_id_12C0D);
  _id_DEDF("passive_headshot_ammo", ::_id_961A, ::_id_F3FB, ::_id_12BFF);
  _id_DEDF("passive_headshot_super", ::_id_961B, ::_id_F3FC, ::_id_12C00);
  _id_DEDF("passive_refresh", ::_id_96BB, ::_id_F4C1, ::_id_12C0E);
  _id_DEDF("passive_double_kill_reload", ::_id_96B1, ::_id_F4B7, ::_id_12C04);
  _id_DEDF("passive_gore", ::_id_96B2, ::_id_F4B8, ::_id_12C05);
  _id_DEDF("passive_meleekill", ::init_passive_melee_kill, ::set_passive_melee_kill, ::unset_passive_melee_kill);
  _id_DEDF("passive_health_on_kill", ::init_passive_health_on_kill, ::set_passive_health_on_kill, ::unset_passive_health_on_kill);
  _id_DEDF("passive_health_regen_on_kill", ::_id_96B3, ::_id_F4B9, ::_id_12C06);
  _id_DEDF("passive_move_speed_on_kill", ::_id_96B9, ::_id_F4BF, ::_id_12C0C);
  _id_DEDF("passive_hitman", ::_id_96B4, ::_id_F4BA, ::_id_12C07);
  _id_DEDF("passive_score_bonus_kills", ::_id_96BC, ::_id_F4C2, ::_id_12C0F);
  _id_DEDF("passive_scorestreak_pack", ::_id_96BC, ::_id_F4C2, ::_id_12C0F);
  _id_DEDF("passive_random_perks", ::init_passive_random_perks, ::set_passive_random_perks, ::unset_passive_random_perks);
  _id_DEDF("passive_visor_detonation", ::init_passive_visor_detonation, ::set_passive_visor_detonation, ::unset_passive_visor_detonation);
  _id_DEDF("passive_melee_super", ::init_passive_melee_super, ::set_passive_melee_super, ::unset_passive_melee_super);
  _id_DEDF("passive_jump_super", ::init_passive_jump_super, ::set_passive_jump_super, ::unset_passive_jump_super);
  _id_DEDF("passive_double_kill_super", ::init_passive_double_kill_super, ::set_passive_double_kill_super, ::unset_passive_double_kill_super);
  _id_DEDF("passive_mode_switch_score", ::init_passive_mode_switch_score, ::set_passive_mode_switch_score, ::unset_passive_mode_switch_score);
  _id_DEDF("passive_melee_cone_expl", ::init_passive_melee_cone_expl, ::set_passive_melee_cone_expl, ::unset_passive_melee_cone_expl);
  _id_DEDF("passive_berserk", ::init_passive_berserk, ::set_passive_berserk, ::unset_passive_berserk);
  level._id_C5C9 = [];
  level._id_C5C9["passive_infinite_ammo"] = ::_id_89B8;
  level._id_C5C9["passive_ninja"] = ::handleninjaonlastshot;
  level._id_C5C9["passive_fortified"] = ::handlefortified;
  _id_DEDF("passive_infinite_ammo", ::_id_96B6, ::_id_F4BC, ::_id_12C09);
  _id_DEDF("passive_crouch_move_speed", ::init_passive_crouch_move_speed, ::set_passive_crouch_move_speed, ::unset_passive_crouch_move_speed);
  level._id_C4E6 = [];
  level._id_C4E6["passive_sonic"] = ::handlepassivesonic;
  level._id_C4E6["passive_minimap_damage"] = ::updatepassiveminimapdamage;
  level._id_C4E6["passive_cold_damage"] = ::updatepassivecolddamage;
  _id_DEDF("passive_wallrun_quieter", ::init_passive_ninja, ::set_passive_ninja, ::unset_passive_ninja);
  _id_DEDF("passive_slide_blastshield", ::init_passive_fortified, ::set_passive_fortified, ::unset_passive_fortified);
  _id_DEDF("passive_cold_damage", ::init_passive_cold_damage, ::set_passive_cold_damage, ::unset_passive_cold_damage);
  _id_DEDF("passive_sonic", ::init_passive_sonic, ::set_passive_sonic, ::unset_passive_sonic);
  _id_DEDF("passive_below_the_belt", ::_id_96B0, ::_id_F4B5, ::_id_12C03);
  _id_DEDF("passive_minimap_damage", ::init_passive_minimap_damage, ::set_passive_minimap_damage, ::unset_passive_minimap_damage);
  _id_DEDF("passive_extra_xp", ::_id_95D6, ::_id_F39A, ::_id_12BF8);
  _id_DEDF("passive_fast_melee", ::init_passive_fast_melee, ::set_passive_fast_melee, ::unset_passive_fast_melee);
  _id_DEDF("coop_passive_snap_to_head", ::_id_974D, ::_id_F5A3, ::_id_12C62);
  _id_DEDF("passive_empty_reload_speed", ::init_passive_empty_reload_speed, ::set_passive_empty_reload_speed, ::unset_passive_empty_reload_speed);
  _id_DEDF("passive_increased_scope_breath", ::init_passive_increased_scope_breath, ::set_passive_increased_scope_breath, ::unset_passive_increased_scope_breath);
  _id_DEDF("passive_hunter_killer", ::_id_96B5, ::_id_F4BB, ::_id_12C08);
  _id_DEDF("passive_move_speed", ::_id_96B8, ::_id_F4BE, ::_id_12C0B);
  _id_DEDF("passive_miss_refund", ::_id_96B7, ::_id_F4BD, ::_id_12C0A);
  _id_DEDF("passive_scoutping", ::_id_96BD, ::_id_F4C3, ::_id_12C10);
  _id_DEDF("passive_scrambler", ::init_passive_scrambler, ::set_passive_scrambler, ::unset_passive_scrambler);
  _id_DEDF("passive_random_attachment", ::init_passive_random_attachment, ::set_passive_random_attachment, ::unset_passive_random_attachment);
  _id_DEDF("passive_scope_radar", ::init_passive_scope_radar, ::set_passive_scope_radar, ::unset_passive_scope_radar);
  _id_DEDF("passive_scorestreak_damage", ::init_passive_scorestreak_damage, ::set_passive_scorestreak_damage, ::unset_passive_scorestreak_damage);
  _id_DEDF("passive_scorestreak_damage_e", ::init_passive_scorestreak_damage, ::set_passive_scorestreak_damage, ::unset_passive_scorestreak_damage);
}

init_passive_random_attachment(var_0) {
  var_1 = getweaponswithpassive(var_0, "passive_random_attachment");
  var_2 = [];

  foreach (var_4 in var_1) {
  var_5 = _id_0A77::_id_80D8(var_4);
  var_6 = _id_0A77::_id_8234(var_4);
  var_7 = _id_0A77::getweaponcamo(var_6);
  var_8 = _id_0A77::getweaponcosmeticattachment(var_6);
  var_9 = _id_0A77::getweaponreticle(var_6);
  var_10 = _id_0A77::getweaponpaintjobid(var_6);
  var_0._id_13C00[var_5] = _id_0A77::_id_BD68(var_6, var_2, var_7, var_9, _id_0A77::_id_7D72(var_0, var_4), self getentitynumber(), self._id_41F0, var_10, var_8);
  }
}

set_passive_random_attachment(var_0) {}

unset_passive_random_attachment(var_0) {}

getweaponswithpassive(var_0, var_1) {
  var_2 = [];
  var_3 = getarraykeys(var_0._id_13C38);

  foreach (var_5 in var_3) {
  for (var_6 = 0; var_6 < var_0._id_13C38[var_5].size; var_6++) {
  if (var_0._id_13C38[var_5][var_6] == var_1)
  var_2[var_2.size] = var_5;
  }
  }

  var_2 = scripts\engine\utility::_id_22AF(var_2);
  return var_2;
}

init_passive_fast_melee(var_0) {}

set_passive_fast_melee(var_0) {
  var_0.increased_melee_damage = 150;
}

unset_passive_fast_melee(var_0) {
  var_0.increased_melee_damage = undefined;
}

_id_95D6(var_0) {
  var_0._id_13C37 = 1;
  var_0.kill_with_extra_xp_passive = 0;
}

_id_F39A(var_0) {
  var_0._id_13C37 = 1.25;
}

_id_12BF8(var_0) {
  var_0._id_13C37 = 1;
  var_0.kill_with_extra_xp_passive = 0;
}

_id_96B0(var_0) {
  var_0._id_4A9A = undefined;
}

_id_F4B5(var_0) {
  var_0._id_4A9A = 3.75;
}

_id_12C03(var_0) {
  var_0._id_4A9A = undefined;
}

_id_96B8(var_0) {
  var_0._id_13C37 = 1;
}

_id_F4BE(var_0) {
  var_0._id_13CB2 = 0.05;
  var_0 [[level._id_BC70]]();
}

_id_12C0B(var_0) {
  var_0._id_13CB2 = undefined;
  var_0 [[level._id_BC70]]();
}

init_passive_empty_reload_speed(var_0) {}

set_passive_empty_reload_speed(var_0) {
  var_0 _id_0A77::_id_13D1("specialty_fastreload_empty");
}

unset_passive_empty_reload_speed(var_0) {
  var_0 _id_0A77::_id_1430("specialty_fastreload_empty");
}

init_passive_increased_scope_breath(var_0) {}

set_passive_increased_scope_breath(var_0) {
  var_0 _id_0A77::_id_13D1("specialty_holdbreath");
}

unset_passive_increased_scope_breath(var_0) {
  var_0 _id_0A77::_id_1430("specialty_holdbreath");
}

_id_974D(var_0) {}

_id_F5A3(var_0) {
  var_0 _id_0A77::_id_13D1("specialty_autoaimhead");
}

_id_12C62(var_0) {
  var_0 _id_0A77::_id_1430("specialty_autoaimhead");
}

_id_96B5(var_0) {
  self._id_91EE = 0;
}

_id_F4BB(var_0) {
  self endon("passive_hunter_killer_cancel");
  var_1 = _id_0A4A::_id_7DB0("axis");
  thread _id_12EAE(var_1);
  thread _id_91EA();

  foreach (var_0 in var_1) {
  thread _id_91EC(var_0);
  thread _id_91EB(var_0);
  }
}

_id_12C08(var_0) {
  self notify("passive_hunter_killer_cancel");

  foreach (var_2 in self._id_91E9) {
  var_0 = self._id_91E8[var_2];
  _id_0A62::_id_5562(var_0, level.players);
  }

  self._id_91E9 = undefined;
  self._id_91E8 = undefined;
}

_id_12EAE(var_0) {
  if (!isdefined(self._id_91E9))
  self._id_91E9 = [];

  if (!isdefined(self._id_91E8))
  self._id_91E8 = [];

  foreach (var_2 in var_0) {
  if (var_2 == self || !isdefined(self) || !isdefined(self.team) || !isdefined(var_2) || !isdefined(var_2.team))
  continue;

  var_3 = _id_7F09(var_2);

  if (level.teambased && self.team != var_2.team && var_2.health / var_2.maxhealth <= 0.5 && var_2.health > 0) {
  if (var_3 < 0) {
  self._id_91EE++;
  _id_0A62::_id_6220(var_2, self, 1, 0, 1, "high");
  var_4 = self._id_91EE;
  self._id_91E9[self._id_91E9.size] = var_4;
  self._id_91E8[var_4] = var_2;
  thread _id_91ED(var_2);
  }

  continue;
  }

  if (var_3 >= 0) {
  var_5 = [];
  var_6 = [];
  _id_0A62::_id_5561(var_2, self);

  foreach (var_4 in self._id_91E9) {
  var_8 = self._id_91E8[var_4];

  if (var_8 == var_2)
  continue;

  var_5[var_5.size] = var_4;
  var_6[var_4] = var_8;
  }

  self._id_91E9 = var_5;
  self._id_91E8 = var_6;
  var_2 notify("passive_hunter_killer_listen_cancel");
  }
  }
}

_id_91ED(var_0) {
  self endon("passive_hunter_killer_cancel");
  var_0 endon("passive_hunter_killer_listen_cancel");

  for (;;) {
  wait 1.0;
  thread _id_12EAD(var_0);
  }
}

_id_7F09(var_0) {
  if (!isdefined(self._id_91E9) || !isdefined(self._id_91E8))
  return -1;

  foreach (var_2 in self._id_91E9) {
  var_3 = self._id_91E8[var_2];

  if (!isdefined(var_3))
  continue;

  if (var_3 == var_0)
  return var_2;
  }

  return -1;
}

_id_91EA() {
  self endon("passive_hunter_killer_cancel");

  for (;;) {
  level waittill("agent_spawned", var_0);
  thread _id_12EAD(var_0);
  thread _id_91EB(var_0);
  }
}

_id_91EC(var_0) {
  self endon("passive_hunter_killer_cancel");
  var_0 waittill("disconnect");
  thread _id_12EAD(var_0);
}

_id_91EB(var_0) {
  self endon("passive_hunter_killer_cancel");

  for (;;) {
  var_0 waittill("damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10);
  thread _id_12EAD(var_0);
  }
}

_id_12EAD(var_0) {
  var_1 = [];
  var_1[var_1.size] = var_0;
  thread _id_12EAE(var_1);
}

_id_96BB(var_0) {
  var_0._id_BFA0 = 0;
}

_id_F4C1(var_0) {
  var_0._id_C54A["passive_refresh"] = 1;
}

_id_12C0E(var_0) {
  var_0._id_C54A["passive_refresh"] = 0;
}

_id_89D1(var_0, var_1, var_2, var_3, var_4, var_5) {
  var_1._id_BFA0++;

  if (var_1._id_BFA0 >= 50) {
  var_1 _id_0D15::_id_D71A(undefined, "primary", 1);
  var_1._id_BFA0 = 0;
  }
}

_id_96B1(var_0) {
  if (!isdefined(var_0._id_5AD5))
  var_0._id_5AD5 = [];
}

_id_F4B7(var_0) {
  var_0._id_C54A["passive_double_kill_reload"] = 1;

  if (!isdefined(var_0._id_5AD5[getweaponbasename(var_0 getcurrentweapon())]))
  var_0._id_5AD5[getweaponbasename(var_0 getcurrentweapon())] = getweaponbasename(var_0 getcurrentweapon());
}

_id_12C04(var_0) {
  var_0._id_C54A["passive_double_kill_reload"] = 0;
}

_id_5AE4(var_0, var_1, var_2, var_3, var_4, var_5) {
  if (!scripts\engine\utility::array_contains(var_1._id_5AD5, getweaponbasename(var_0)))
  return;

  if (var_1._id_DDC2 == 4) {
  var_6 = weaponclipsize(var_0);
  var_7 = var_1 getweaponammostock(var_0);
  var_8 = var_1 getweaponammoclip(var_0);
  var_9 = min(var_6 - var_8, var_7);
  var_10 = min(var_8 + var_9, var_6);
  var_1 setweaponammoclip(var_0, int(var_10));
  var_1 setweaponammostock(var_0, int(var_7 - var_9));

  if (var_1 _meth_819C()) {
  var_7 = var_1 getweaponammostock(var_0);
  var_8 = var_1 getweaponammoclip(var_0, "left");
  var_9 = min(var_6 - var_8, var_7);
  var_10 = min(var_8 + var_9, var_6);
  var_1 setweaponammoclip(var_0, int(var_10), "left");
  var_1 setweaponammostock(var_0, int(var_7 - var_9));
  }
  }
}

init_passive_melee_kill(var_0) {
  var_0.passive_melee_kill_damage = 0;
}

set_passive_melee_kill(var_0) {
  var_0.skip_weapon_check = 1;
  var_0.passive_melee_kill_damage = 1000;
  var_0._id_C54A["passive_meleekill"] = 1;
}

unset_passive_melee_kill(var_0) {
  var_0.skip_weapon_check = undefined;
  var_0.passive_melee_kill_damage = 0;
  var_0._id_C54A["passive_meleekill"] = 0;
}

handlemeleekillpassive(var_0, var_1, var_2, var_3, var_4, var_5) {
  level endon("game_ended");
  self endon("disconnect");

  if (var_3 != "MOD_MELEE")
  return;

  level thread _id_89AA(var_2);
  wait 0.05;
  var_6 = var_2 _meth_8113();

  if (isdefined(var_6)) {
  var_6 hide();
  var_6._id_CA6C = 1;
  }
}

_id_89AA(var_0) {
  var_1 = var_0 gettagorigin("j_spine4");
  playfx(level._effect["gore"], var_1, (1, 0, 0));
  playloopsound(var_1, "gib_fullbody");

  foreach (var_3 in level.players)
  var_3 _meth_844F(0.5, 1.5, var_1, 120);
}

_id_96B2(var_0) {}

_id_F4B8(var_0) {
  var_0._id_C54A["passive_gore"] = 1;
}

_id_12C05(var_0) {
  var_0._id_C54A["passive_gore"] = 0;
}

_id_89AB(var_0, var_1, var_2, var_3, var_4, var_5) {
  level endon("game_ended");
  self endon("disconnect");
  var_2 endon("diconnect");
  wait 0.05;
  var_6 = var_2 _meth_8113();

  if (!isdefined(var_6))
  return;

  var_7 = var_6.origin;
  earthquake(0.5, 1.5, var_7, 120);
  playfx(level._effect["corpse_pop"], var_7 + (0, 0, 12));

  if (isdefined(var_6)) {
  var_6 hide();
  var_6._id_CA6C = 1;
  }
}

init_passive_health_on_kill(var_0) {
  var_0._id_C93F = 0;
}

set_passive_health_on_kill(var_0) {
  var_0._id_C54A["passive_health_on_kill"] = 1;
}

unset_passive_health_on_kill(var_0) {
  var_0._id_C54A["passive_health_on_kill"] = 0;
}

handlehealthonkillpassive(var_0, var_1, var_2, var_3, var_4, var_5) {
  var_1._id_C93F++;

  if (var_1._id_C93F >= 2) {
  var_1 notify("force_regeneration");
  var_1._id_C93F = 0;
  }
}

_id_96B3(var_0) {
  var_0._id_C93F = 0;
}

_id_F4B9(var_0) {
  var_0._id_C54A["passive_health_regen_on_kill"] = 1;
}

_id_12C06(var_0) {
  var_0._id_C54A["passive_health_regen_on_kill"] = 0;
}

_id_89B1(var_0, var_1, var_2, var_3, var_4, var_5) {
  if (var_1._id_C93F >= 2) {
  var_1 notify("force_regeneration");
  var_1._id_C93F = 0;
  }
  else
  var_1._id_C93F++;
}

_id_96B9(var_0) {
  var_0._id_13CB3 = 0;
}

_id_F4BF(var_0) {
  var_0._id_C54A["passive_move_speed_on_kill"] = 1;
}

_id_12C0C(var_0) {
  var_0._id_C54A["passive_move_speed_on_kill"] = 0;
}

_id_89C8(var_0, var_1, var_2, var_3, var_4, var_5) {
  var_6 = "passive_move_speed_on_kill";
  var_1 notify(var_6);
  var_1 endon(var_6);

  if (var_1._id_13CB3 != 0.075) {
  var_1._id_13CB3 = 0.075;
  var_1 [[level._id_BC70]]();
  }

  var_1 scripts\engine\utility::_id_13736(5, "death", "disconnect");

  if (!isdefined(var_1))
  return;

  var_1._id_13CB3 = 0;
  var_1 [[level._id_BC70]]();
}

_id_96BC(var_0) {}

_id_F4C2(var_0) {
  var_0._id_3B0F = var_0._id_3B0F + 0.1;
  var_0.cash_scalar_weapon = _id_0A77::_id_80D8(var_0 getcurrentweapon());
}

_id_12C0F(var_0) {
  var_0._id_3B0F = var_0._id_3B0F - 0.1;
  var_0.cash_scalar_weapon = undefined;
}

_id_96B4(var_0) {}

_id_F4BA(var_0) {
  var_0._id_C54A["passive_hitman"] = 1;
}

_id_12C07(var_0) {
  var_0._id_C54A["passive_hitman"] = 0;
}

_id_89B3(var_0, var_1, var_2, var_3, var_4, var_5) {
  if (!isdefined(var_1) || !_id_0A77::isreallyalive(var_1) || !isdefined(var_2))
  return;

  if (!isdefined(var_1._id_903C))
  var_1._id_903C = [];
  else if (_id_903B(var_1, var_2._id_0064))
  return;

  var_1 thread _id_E252();
  var_1._id_903C[var_1._id_903C.size] = var_2._id_0064;

  if (var_1._id_903C.size >= 10) {
  var_1 notify("consumable_charge", 200);
  var_1._id_903C = [];
  }
}

_id_E252() {
  self notify("hitman_timeout");
  self endon("hitman_timeout");
  self endon("death");
  level endon("game_ended");
  wait 10;
  self._id_903C = [];
}

_id_903B(var_0, var_1) {
  if (!isdefined(var_0._id_903C))
  return 0;

  foreach (var_3 in var_0._id_903C) {
  if (var_3 == var_1)
  return 1;
  }

  return 0;
}

_id_903D() {
  self endon("disconnect");
  self waittill("death");
  self._id_903C = undefined;
}

_id_96BA(var_0) {
  var_0._id_C944 = 0;
  var_0._id_A9CA = 0;
  var_0 thread _id_11AF6(var_0);
}

_id_F4C0(var_0) {
  var_0._id_C54A["passive_nuke"] = 1;
}

_id_12C0D(var_0) {
  var_0._id_C54A["passive_nuke"] = 0;
}

_id_11AF4(var_0, var_1, var_2, var_3, var_4, var_5) {
  var_1._id_C944++;

  if (var_1._id_C944 >= 150 && var_1._id_A9CA + 3 <= level._id_13BD3) {
  var_1._id_C944 = 0;
  level _id_0A76::_id_5CF6(var_1.origin, var_1, "kill_50", 1);
  }
}

_id_11AF6(var_0) {
  level endon("game_ended");
  var_0 endon("disconnect");

  for (;;) {
  var_0 waittill("last_stand");
  var_0._id_C944 = 0;
  }
}

_id_961A(var_0) {}

_id_F3FB(var_0) {
  var_0._id_C54A["passive_headshot_ammo"] = 1;
}

_id_12BFF(var_0) {
  var_0._id_C54A["passive_headshot_ammo"] = 0;
}

_id_89AE(var_0, var_1, var_2, var_3, var_4, var_5) {
  if (!isdefined(var_1) || !isdefined(var_0))
  return;

  if (!_id_0A77::isheadshot(var_0, var_4, var_3, var_1))
  return;

  var_6 = weaponclipsize(var_0);
  adjust_clip_ammo_from_stock(var_1, var_0, "right", var_6);

  if (var_1 _meth_819C())
  adjust_clip_ammo_from_stock(var_1, var_0, "left", var_6);
}

adjust_clip_ammo_from_stock(var_0, var_1, var_2, var_3) {
  var_4 = var_0 getweaponammostock(var_1);

  if (var_4 < 1)
  return;

  var_5 = var_0 getweaponammoclip(var_1, var_2);
  var_6 = var_3 - var_5;

  if (var_4 >= var_6)
  var_0 setweaponammostock(var_1, var_4 - var_6);
  else
  {
  var_6 = var_4;
  var_0 setweaponammostock(var_1, 0);
  }

  var_7 = min(var_5 + var_6, var_3);
  var_0 setweaponammoclip(var_1, int(var_7), var_2);
}

init_passive_fortified(var_0) {
  var_0.has_fortified_passive = 0;
}

set_passive_fortified(var_0) {
  var_0._id_C5C9["passive_fortified"] = 1;
  var_0.has_fortified_passive = 1;
}

unset_passive_fortified(var_0) {
  var_0._id_C5C9["passive_fortified"] = 0;
  var_0.has_fortified_passive = 0;
}

handlefortified(var_0, var_1, var_2) {}

init_passive_ninja(var_0) {
  var_0.stealth_used = [];
  var_0.stealth_stacks = 0;
}

set_passive_ninja(var_0) {
  var_0._id_C5C9["passive_ninja"] = 1;
}

unset_passive_ninja(var_0) {
  var_0._id_C5C9["passive_ninja"] = 0;
}

handleninjaonlastshot(var_0, var_1, var_2) {
  if (!isdefined(var_0) || !isdefined(var_1))
  return;

  var_3 = weaponclipsize(var_1);
  var_4 = var_0 getweaponammoclip(var_1, "right");

  if (var_4 == 0 && !scripts\engine\utility::array_contains(var_0.stealth_used, "right"))
  set_player_stealthed(var_0, "right");
  else if (var_4 > 0)
  var_0.stealth_used = scripts\engine\utility::array_remove(var_0.stealth_used, "right");

  if (var_0 _meth_819C()) {
  var_5 = var_0 getweaponammoclip(var_1, "left");

  if (var_5 == 0 && !scripts\engine\utility::array_contains(var_0.stealth_used, "left"))
  set_player_stealthed(var_0, "left");
  else if (var_5 > 0)
  var_0.stealth_used = scripts\engine\utility::array_remove(var_0.stealth_used, "left");
  }
}

set_player_stealthed(var_0, var_1) {
  var_0 _id_0A77::_id_1C5C(1);
  playfx(level._effect["stimulus_glow_burst"], scripts\engine\utility::_id_5D14(var_0.origin) - (0, 0, 30));
  scripts\engine\utility::_id_CE2B("zmb_fnf_stimulus", scripts\engine\utility::_id_5D14(var_0.origin) - (0, 0, 30));
  var_0.stealth_used = scripts\engine\utility::_id_1756(var_0.stealth_used, var_1);
  var_0.stealth_stacks++;

  if (var_0 _meth_819C())
  wait 3.0;
  else
  wait 4.0;

  var_0.stealth_stacks--;

  if (var_0.stealth_stacks <= 0)
  var_0 _id_0A77::_id_1C5C(0);

  var_0.stealth_stacks = 0;
}

init_passive_last_shots_ammo(var_0) {}

set_passive_last_shots_ammo(var_0) {
  var_0._id_C54A["passive_ninja"] = 1;
}

unset_passive_last_shots_ammo(var_0) {
  var_0._id_C54A["passive_ninja"] = 0;
}

handleammoonlastshotskill(var_0, var_1, var_2, var_3, var_4, var_5) {
  if (!isdefined(var_1) || !isdefined(var_0))
  return;

  var_6 = weaponclipsize(var_0);
  var_7 = var_1 getweaponammoclip(var_0, "right");

  if (var_7 <= int(var_6 * 0.2))
  adjust_clip_ammo_from_stock(var_1, var_0, "right", var_6);

  if (var_1 _meth_819C()) {
  var_7 = var_1 getweaponammoclip(var_0, "left");

  if (var_7 <= int(var_6 * 0.2))
  adjust_clip_ammo_from_stock(var_1, var_0, "left", var_6);
  }
}

_id_961B(var_0) {
  var_0.delayedsuperbonus = 0;
}

_id_F3FC(var_0) {
  var_0._id_C54A["passive_headshot_super"] = 1;
}

_id_12C00(var_0) {
  var_0._id_C54A["passive_headshot_super"] = 0;
}

_id_1869(var_0, var_1, var_2, var_3, var_4, var_5) {
  var_1.delayedsuperbonus++;
  wait(0.05 * var_1.delayedsuperbonus);
  var_1.delayedsuperbonus--;

  if (var_1.delayedsuperbonus < 0)
  var_1.delayedsuperbonus = 0;

  var_1 notify("consumable_charge", 10);
}

init_passive_sonic(var_0) {
  var_0.sonictimer = 0;
}

set_passive_sonic(var_0) {
  var_0._id_C4E6["passive_sonic"] = 1;
}

unset_passive_sonic(var_0) {
  var_0._id_C4E6["passive_sonic"] = 0;
}

handlepassivesonic(var_0, var_1, var_2) {
  var_3 = gettime();

  if (var_2 _id_0A77::agentisfnfimmune())
  return;

  if (var_3 <= var_0.sonictimer)
  return;

  if (distance2dsquared(var_0.origin, var_2.origin) <= 62500)
  thread _id_0A6B::_id_75FA(var_2, var_0);

  var_0.sonictimer = var_3 + 1000;
}

init_passive_crouch_move_speed(var_0) {}

set_passive_crouch_move_speed(var_0) {
  var_0 thread adjust_move_speed_while_crouched(var_0);
}

unset_passive_crouch_move_speed(var_0) {
  var_0 notify("remove_crouch_speed_mod");
  var_0._id_13CB2 = undefined;
}

adjust_move_speed_while_crouched(var_0, var_1) {
  level endon("game_ended");
  var_0 endon("disconnect");
  var_0 endon("remove_crouch_speed_mod");

  for (;;) {
  if (var_0 getstance() == "crouch") {
  if (isdefined(level._id_BC70)) {
  var_0._id_13CB2 = 0.5;
  var_0 [[level._id_BC70]]();
  }
  }

  while (var_0 getstance() == "crouch")
  wait 0.1;

  var_0._id_13CB2 = undefined;
  var_0 [[level._id_BC70]]();
  var_0 waittill("adjustedStance");
  }
}

_id_96B6(var_0) {}

_id_F4BC(var_0) {
  var_0 _id_0A77::enable_infinite_ammo(1);
  var_0._id_C5C9["passive_infinite_ammo"] = 1;
}

_id_12C09(var_0) {
  var_0 _id_0A77::enable_infinite_ammo(0);
  var_0._id_C5C9["passive_infinite_ammo"] = 0;
}

_id_89B8(var_0, var_1) {
  var_0 thread _id_AD6F(var_1);
  var_2 = 4;
  var_3 = self.health;

  if (var_3 - var_2 < 1)
  var_2 = var_3 - 1;

  if (var_2 > 0)
  var_0 _meth_80B0(var_2, var_0 gettagorigin("j_wrist_ri"), var_0, undefined, "MOD_RIFLE_BULLET", "iw7_pickup_zm");

  var_0 _id_12EB2(var_1);
}

_id_AD6F(var_0) {
  self endon("disconnect");
  self endon("last_stand");
  self notify("infinite_ammo_fire");
  self endon("infinite_ammo_fire");
  self._id_F1E8 = 1;
  wait 0.2;
  self._id_F1E8 = 0;
}

_id_12EB2(var_0) {
  var_1 = self.health;
  var_2 = weaponclipsize(var_0);
  self setweaponammoclip(var_0, var_2);

  if (self _meth_819C())
  self setweaponammoclip(var_0, var_2, "left");
}

_id_96B7(var_0) {}

_id_F4BD(var_0) {
  var_1 = var_0 getcurrentweapon();
  var_0 thread _id_B8D5(var_1);
}

_id_12C0A(var_0) {
  var_0 notify("removeMissRefundPassive");
}

_id_B8D5(var_0) {
  self endon("death");
  self endon("disconnect");
  self endon("removeMissRefundPassive");

  for (;;) {
  self waittill("shot_missed", var_1);

  if (var_1 == var_0) {
  if (randomfloat(1.0) > 0.75) {
  var_2 = self getweaponammostock(var_0);
  self setweaponammostock(var_0, var_2 + 1);
  }
  }
  }
}

init_passive_scrambler(var_0) {}

set_passive_scrambler(var_0) {
  var_0 thread handlepassivescrambler(var_0);
}

unset_passive_scrambler(var_0) {
  var_0 notify("handlePassiveScrambler");
}

scrambler_executevisuals(var_0) {
  level endon("game_ended");
  self endon("disconnect");
  var_1 = spawn("script_model", self gettagorigin("tag_eye"));
  var_1 setmodel("prop_mp_optic_wave_scr");
  var_1.angles = self getplayerangles();
  var_1 _meth_831F(self);
  var_1 setscriptablepartstate("effects", "active", 0);
  var_2 = var_1.origin + anglestoforward(var_1.angles) * 256;
  var_1 moveto(var_2, var_0);
  scripts\engine\utility::_id_13736(var_0, "last_stand", "death");

  if (isdefined(var_1))
  var_1 delete();
}

handlepassivescrambler(var_0) {
  var_0 notify("handlePassiveScrambler");
  var_0 endon("handlePassiveScrambler");
  level endon("game_ended");
  var_0 endon("disconnect");
  var_0 endon("last_stand");
  var_0 endon("death");

  for (;;) {
  if (randomint(100) > 85) {
  var_1 = _id_0A4A::_id_7DB0("axis");
  var_2 = scripts\engine\utility::_id_782F(var_0.origin, var_1, undefined, 24, 256);
  var_3 = 0;

  foreach (var_5 in var_2) {
  if (scripts\engine\utility::within_fov(var_0 geteye(), var_0.angles, var_5.origin, cos(65))) {
  if (!var_3)
  var_0 thread scrambler_executevisuals(0.8);

  thread scrambler_stun_damage(var_5, var_0);
  var_3++;
  }

  if (var_3 >= 5)
  break;
  }
  }

  wait(randomfloatrange(5.0, 10.0));
  }
}

scrambler_stun_damage(var_0, var_1) {
  var_0 endon("death");

  if (isdefined(var_0._id_11190)) {
  if (gettime() > var_0._id_11190) {
  if (var_0 _id_0F74::_id_9D9E()) {
  var_0._id_EF64 = 1;
  var_0._id_0180 = 1;
  var_0 _meth_82EF(var_0.origin);
  }

  var_0._id_0033 = 1;
  var_0._id_11190 = gettime() + 1000;
  var_0._id_11196 = 1;
  }
  else
  return;
  } else {
  if (var_0 _id_0F74::_id_9D9E()) {
  var_0._id_EF64 = 1;
  var_0._id_0180 = 1;
  var_0 _meth_82EF(var_0.origin);
  }

  var_0._id_0033 = 1;
  var_0._id_11190 = gettime() + 1000;
  var_0._id_11196 = 1;
  }

  var_0 _meth_80B0(1, var_0.origin, var_1, var_1, "MOD_UNKNOWN", "iw7_scrambler_zm");
  var_0 thread addhealthback(var_0);
  wait 1;

  if (var_0 _id_0F74::_id_9D9E()) {
  var_0._id_EF64 = 0;
  var_0._id_0180 = 0;
  }

  var_0._id_0033 = 0;
  var_0._id_11196 = undefined;
}

addhealthback(var_0) {
  var_0 endon("death");
  waittillframeend;

  if (var_0.health < var_0.maxhealth)
  var_0.health = var_0.health + 1;
}

init_passive_random_perks(var_0) {
  var_0.passiverandomperkskillcount = 0;
  var_0 thread tracklaststandforpassiverandomperks(var_0);
}

tracklaststandforpassiverandomperks(var_0) {
  level endon("game_ended");
  var_0 endon("disconnect");

  for (;;) {
  var_0 waittill("last_stand");
  var_0.passiverandomperkskillcount = 0;
  }
}

set_passive_random_perks(var_0) {
  var_0._id_C54A["passive_random_perks"] = 1;
}

trackkillsforrandomperks(var_0, var_1, var_2, var_3, var_4, var_5) {
  var_1 endon("disconnect");
  var_1 endon("last_stand");
  var_1 endon("death");
  var_1.passiverandomperkskillcount++;

  if (var_1.passiverandomperkskillcount >= 75) {
  var_6 = level._id_CA5B;
  var_1.passiverandomperkskillcount = 0;

  if (!isdefined(var_1._id_13FA4) || var_1._id_13FA4.size < 5) {
  for (;;) {
  var_7 = scripts\engine\utility::_id_DC6B(var_6);

  if (!var_1 _id_0A77::_id_8BBE(var_7)) {
  var_1 _id_0D5D::_id_834E(var_7, 0);
  break;
  }
  else
  var_6 = scripts\engine\utility::array_remove(var_6, var_7);

  scripts\engine\utility::waitframe();
  }
  }
  }
}

unset_passive_random_perks(var_0) {
  var_0._id_C54A["passive_random_perks"] = 0;
}

init_passive_melee_super(var_0) {}

set_passive_melee_super(var_0) {
  var_0.skip_weapon_check = 1;
  var_0._id_C54A["passive_melee_super"] = 1;
}

unset_passive_melee_super(var_0) {
  var_0.skip_weapon_check = undefined;
  var_0._id_C54A["passive_melee_super"] = 0;
}

handlemeleesuper(var_0, var_1, var_2, var_3, var_4, var_5) {
  level endon("game_ended");
  var_1 endon("disconnect");

  if (isdefined(var_3) && var_3 == "MOD_MELEE")
  var_1 notify("consumable_charge", 125);
}

init_passive_jump_super(var_0) {}

set_passive_jump_super(var_0) {
  var_0._id_C54A["passive_jump_super"] = 1;
  var_0.current_weapon_jump_super = _id_0A77::_id_80D8(var_0 getcurrentweapon());
}

unset_passive_jump_super(var_0) {
  var_0._id_C54A["passive_jump_super"] = 0;
  var_0.current_weapon_jump_super = undefined;
}

handleairbornesuper(var_0, var_1, var_2, var_3, var_4, var_5) {
  level endon("game_ended");
  var_1 endon("disconnect");

  if (!var_1 isonground() && (isdefined(var_1.current_weapon_jump_super) && _id_0A77::_id_80D8(var_0) == var_1.current_weapon_jump_super))
  var_1 notify("consumable_charge", 75);
}

init_passive_double_kill_super(var_0) {}

set_passive_double_kill_super(var_0) {
  var_0._id_C54A["passive_double_kill_super"] = 1;
  var_0.current_weapon_double_super = _id_0A77::_id_80D8(var_0 getcurrentweapon());
}

unset_passive_double_kill_super(var_0) {
  var_0._id_C54A["passive_double_kill_super"] = 0;
  var_0.current_weapon_double_super = undefined;
}

handledoublekillssuper(var_0, var_1, var_2, var_3, var_4, var_5) {
  level endon("game_ended");
  var_1 endon("disconnect");

  if (isdefined(var_1._id_DDC2) && (isdefined(var_1.current_weapon_double_super) && _id_0A77::_id_80D8(var_0) == var_1.current_weapon_double_super)) {
  if (var_1._id_DDC2 == 2)
  var_1 notify("consumable_charge", 125);
  }
}

init_passive_mode_switch_score(var_0) {}

set_passive_mode_switch_score(var_0) {
  var_0.alt_mode_passive = 1;
  var_0.cash_scalar_alt_weapon = _id_0A77::_id_80D8(var_0 getcurrentweapon());
  var_0._id_3B0F = var_0._id_3B0F + 0.1;
}

unset_passive_mode_switch_score(var_0) {
  var_0._id_3B0F = var_0._id_3B0F - 0.1;
  var_0.cash_scalar_alt_weapon = undefined;
  var_0.alt_mode_passive = 0;
}

init_passive_visor_detonation(var_0) {}

set_passive_visor_detonation(var_0) {
  var_0._id_C54A["passive_visor_detonation"] = 1;
}

unset_passive_visor_detonation(var_0) {
  var_0._id_C54A["passive_visor_detonation"] = 0;
}

handlevisordetonation(var_0, var_1, var_2, var_3, var_4, var_5) {
  if (!scripts\engine\utility::_id_9D74(var_3))
  return 0;

  if (!_id_0A77::isheadshot(var_0, var_4, var_3, var_1))
  return 0;

  if (isdefined(var_2.agent_type) && (var_2.agent_type == "zombie_brute" || var_2.agent_type == "zombie_grey" || var_2.agent_type == "slasher" || var_2.agent_type == "superslasher" || var_2.agent_type == "zombie_sasquatch" || var_2.agent_type == "lumberjack"))
  return;

  var_6 = scripts\engine\utility::_id_9CEE(var_2._id_9CDD);
  var_2._id_8C5F = 1;
  var_7 = var_2 gettagorigin("j_spine4");
  playloopsound(var_2.origin, "zmb_fnf_headpopper_explo");
  playfx(level._effect["bloody_death"], var_7);

  foreach (var_1 in level.players) {
  if (distance(var_1.origin, var_7) <= 350)
  var_1 thread _id_0D63::_id_10142();
  }

  if (isdefined(var_2._id_8C98))
  var_2 _meth_8096(var_2._id_8C98);

  if (!var_6)
  var_2 setscriptablepartstate("head", "hide");
}

passive_visor_detonation_activate() {
  self endon("death");
  self endon("disconnect");
  self endon("end_passive_visor_detonation");

  for (;;) {
  self waittill("headshot_done_with_this_weapon", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9);
  scripts\engine\utility::waitframe();
  }
}

init_passive_berserk(var_0) {}

set_passive_berserk(var_0) {
  var_0._id_C54A["passive_berserk"] = 1;
}

unset_passive_berserk(var_0) {
  var_0._id_C54A["passive_berserk"] = 0;
}

handleberserk(var_0, var_1, var_2, var_3, var_4, var_5) {
  if (!scripts\engine\utility::_id_9CEE(var_1.berserk)) {
  var_1.berserk = 1;
  var_1 _meth_85C1(65);
  var_6 = var_1 _meth_85C0();

  if (var_6 < 0)
  var_6 = 100;

  var_6 = max(var_6 - 20, 0);
  var_1 _meth_822D(int(var_6));
  }

  var_1 notify("stop_berserk_timer");
  var_1 thread remove_berserk_after_timeout(2);
}

remove_berserk_after_timeout(var_0) {
  self endon("end_berserk");
  self endon("stop_berserk_timer");
  self endon("death");
  self endon("disconnect");
  thread listencancelberserk();
  wait(var_0);
  unset_berserk();
}

listencancelberserk() {
  self endon("end_berserk");
  self endon("stop_berserk_timer");
  self endon("disconnect");
  scripts\engine\utility::waittill_any("death", "weapon_change");
  unset_berserk();
}

unset_berserk() {
  if (scripts\engine\utility::_id_9CEE(self.berserk)) {
  self.berserk = 0;
  self _meth_85C2();
  var_0 = self _meth_85C0();
  var_0 = min(var_0 + 20, 100);
  self _meth_822D(int(var_0));
  self notify("end_berserk");
  }
}

unsetquadfeederpassive() {
  self notify("end_quadFeederEffect");
  self notify("end_quadFeederPassive");
  unset_berserk();
}

init_passive_melee_cone_expl(var_0) {}

set_passive_melee_cone_expl(var_0) {
  var_0._id_C54A["passive_melee_cone_expl"] = 1;
  var_0.skip_weapon_check = 1;
}

unset_passive_melee_cone_expl(var_0) {
  var_0._id_C54A["passive_melee_cone_expl"] = 0;
  var_0.skip_weapon_check = undefined;
}

handlemeleeconeexplode(var_0, var_1, var_2, var_3, var_4, var_5) {
  if (var_3 != "MOD_MELEE")
  return;

  if (!issubstr(var_0, "meleervn") && !var_1 _meth_8519(var_0))
  return;

  var_6 = var_2 gettagorigin("j_spineupper");
  var_7 = var_1 getplayerangles();
  var_8 = anglestoforward(var_7);
  var_9 = anglestoup(var_7);
  var_10 = var_6 - var_8 * 128;
  var_11 = 384;
  playfx(level._effect["cone_expl_fx"], var_6 + (0, 2, 0), var_8, var_9);
  var_12 = _id_0A4A::_id_77FD();

  foreach (var_14 in var_12) {
  if (isdefined(var_14._id_6F73) || isdefined(var_14.agent_type) && (var_14.agent_type == "zombie_brute" || var_14.agent_type == "zombie_ghost" || var_14.agent_type == "zombie_grey" || var_14.agent_type == "slasher" || var_14.agent_type == "superslasher"))
  continue;

  if (!_id_0A77::_id_D64B(var_14 gettagorigin("tag_origin"), var_10, var_8, var_9, var_11, 128, 12))
  continue;

  if (var_14 _meth_808F(var_6, var_1) <= 0)
  continue;

  var_15 = int(1500 * var_1 _id_0A6B::_id_7D62(var_0));
  wait 0.05;
  var_14 _meth_80B0(var_15, var_6, var_1, var_1, "MOD_EXPLOSIVE", var_0);
  }
}

init_passive_minimap_damage(var_0) {}

set_passive_minimap_damage(var_0) {
  var_0._id_C4E6["passive_minimap_damage"] = 1;
}

unset_passive_minimap_damage(var_0) {
  var_0._id_C4E6["passive_minimap_damage"] = 0;
}

updatepassiveminimapdamage(var_0, var_1, var_2) {
  if (!isdefined(var_2))
  return;

  var_3 = 4;
  var_4 = 1;
  var_5 = 1;

  if (isdefined(var_2._id_4D32))
  var_3 = 5;

  if (isdefined(var_2._id_B36D))
  var_3 = 0;
  else
  var_3 = 4;

  level thread set_outline_passive_minimap_damage(var_0, var_2, var_3, var_4, var_5);
}

_id_6221(var_0, var_1, var_2, var_3, var_4, var_5) {
  var_0 _meth_8190(var_1, var_2, var_3, var_4);
}

set_outline_passive_minimap_damage(var_0, var_1, var_2, var_3, var_4) {
  level endon("game_ended");
  level endon("outline_disabled");

  if (!isdefined(var_1))
  return;

  if (!isdefined(var_2))
  var_2 = 4;

  if (!isdefined(var_3))
  var_3 = 1;

  if (!isdefined(var_4))
  var_4 = 1;

  _id_6221(var_1, level.players, var_2, 1, 1, "high");
  wait 10;
  unset_outline_passive_minimap_damage(var_1);
}

_id_5562(var_0, var_1) {
  var_0 _meth_818D(var_1);
}

unset_outline_passive_minimap_damage(var_0) {
  if (!isdefined(var_0))
  return;

  _id_0A62::_id_5562(var_0, level.players);
}

activate_adrenaline_boost(var_0) {
  level endon("game_ended");
  var_0 endon("disconnect");
  var_0 endon("last_stand");
  var_0 endon("death");
  var_0 _id_0A77::_id_17C0("health_boost", 0.2, 0);
  var_0 notify("force_regeneration");
  var_0 playlocalsound("breathing_heartbeat_alt");
  wait 5;
  var_0 _id_0A77::_id_E0E6("health_boost", 0);
  var_0 playlocalsound("breathing_limp");
}

adr_boost(var_0) {
  var_0 notify("updatepassiveminimapdamage");
  level endon("game_ended");
  var_0 endon("disconnect");
  var_0 endon("last_stand");
  var_0 endon("death");

  for (;;) {
  if (randomint(100) > 30) {
  thread run_adrenaline_visuals(var_0, 5);
  thread activate_adrenaline_boost(var_0);
  }

  wait(randomfloatrange(5.0, 15.0));
  }
}

remove_adrenaline_visuals(var_0) {
  var_0 endon("disconnect");
  var_0 endon("last_stand");
  var_0 endon("death");
  var_0 setscriptablepartstate("passive_armor", "neutral", 0);
  var_0 setscriptablepartstate("armor_active", "neutral", 0);
  var_0 visionsetnakedforplayer("", 0.5);
}

run_adrenaline_visuals(var_0, var_1) {
  var_0 endon("disconnect");
  var_0 endon("last_stand");
  var_0 endon("death");
  var_0 endon("remove_adrenaline_visuals");
  self setscriptablepartstate("passive_armor", "active", 0);
  self setscriptablepartstate("armor_active", "active", 0);
  var_0 visionsetnakedforplayer("missilecam", scripts\engine\utility::ter_op(1, 0.1, 0.0));
  var_0 scripts\engine\utility::_id_13736(var_1, "last_stand");
  var_0 thread remove_adrenaline_visuals(var_0);
}

init_passive_cold_damage(var_0) {}

set_passive_cold_damage(var_0) {
  var_0._id_C4E6["passive_cold_damage"] = 1;
  var_0.cold_weapon = var_0 getcurrentweapon();
}

unset_passive_cold_damage(var_0) {
  var_0._id_C4E6["passive_cold_damage"] = 0;
  var_0.cold_weapon = undefined;
}

updatepassivecolddamage(var_0, var_1, var_2) {
  var_3 = isdefined(var_2.agent_type) && var_2.agent_type == "zombie_brute";
  var_4 = isdefined(var_2.agent_type) && var_2.agent_type == "zombie_grey";
  var_5 = scripts\engine\utility::_id_9CEE(var_2._id_9CDD);

  if (var_3 || var_4 || var_5)
  return;

  if (isdefined(var_0.cold_weapon)) {
  if (_id_0A77::_id_80D8(var_0.cold_weapon) == _id_0A77::_id_80D8(var_1)) {
  var_2._id_01F5 = "slow_walk";
  var_2 scripts\asm\asm_bb::_id_2968("slow_walk");
  }
  }
}

init_passive_scorestreak_damage(var_0) {}

set_passive_scorestreak_damage(var_0) {
  var_0.special_zombie_damage = 1.1;
}

unset_passive_scorestreak_damage(var_0) {
  var_0.special_zombie_damage = undefined;
}

init_passive_scope_radar(var_0) {
  var_0.activate_radar = 0;
  var_0 notifyonplayercommand("scope_radar_ads_in", "+speed_throw");
  var_0 notifyonplayercommand("scope_radar_ads_out", "-speed_throw");
}

set_passive_scope_radar(var_0) {
  var_0 thread updatescoperadar(var_0);
}

unset_passive_scope_radar(var_0) {
  var_0 notify("unsetScopeRadar");
  var_0 thread cleanup_outlines(var_0);
}

updatescoperadar(var_0) {
  var_0 notify("updateScopeRadar");
  var_0 endon("updateScopeRadar");
  level endon("game_ended");
  var_0 endon("death");
  var_0 endon("disconnect");
  var_0 endon("unsetScopeRadar");
  var_1 = 2.4;
  var_2 = 1750;

  for (;;) {
  if (!var_0 adsbuttonpressed())
  var_3 = var_0 scripts\engine\utility::_id_13735("scope_radar_ads_in", "scope_radar_ads_out", "last_stand", "death", "weapon_change");
  else
  var_3 = "scope_radar_ads_in";

  if (var_3 == "scope_radar_ads_in")
  runscoperadarinloop(var_0, var_1, var_2);

  var_0 thread remove_visuals(var_0);
  }
}

runscoperadarinloop(var_0, var_1, var_2) {
  level endon("game_ended");
  var_0 notify("runScopeRadarInLoop");
  var_0 endon("runScopeRadarInLoop");
  var_0 endon("scope_radar_ads_out");
  var_0 endon("last_stand");
  var_0 endon("death");
  var_0 endon("disconnect");
  var_3 = 0.75;

  while (var_0 adsbuttonpressed()) {
  if (var_0 playerads() >= var_3) {
  var_0 playlocalsound("uav_ping");
  var_0 thread scoperadar_executeping(var_0, var_1, var_2);
  var_0 scoperadar_executevisuals(var_0, var_1);
  }

  scripts\engine\utility::waitframe();
  }
}

scoperadar_executeping(var_0, var_1, var_2) {
  level endon("game_ended");
  var_0 endon("death");
  var_0 endon("scope_radar_ads_out");
  var_3 = 0;
  var_4 = _id_0A4A::_id_7DB0("axis");
  var_5 = scripts\engine\utility::_id_782F(var_0.origin, var_4, undefined, 24, var_2);
  var_0.closestenemies = var_5;
  var_6 = 0;

  foreach (var_8 in var_0.closestenemies) {
  var_8.is_outlined_from_scoperadar = 0;

  if (scripts\engine\utility::within_fov(var_0 geteye(), var_0.angles, var_8.origin, cos(65))) {
  var_6++;
  var_9 = var_8.origin - var_0.origin;

  if (1 && vectordot(anglestoforward(var_0.angles), var_9) < 0)
  continue;

  var_10 = var_2 * var_2;

  if (length2dsquared(var_9) > var_10)
  continue;

  var_0 thread _id_C7A7(var_8, var_0, distance2d(var_0.origin, var_8.origin) / var_2, var_1);
  var_3 = 1;
  }
  }
}

_id_6220(var_0, var_1, var_2, var_3, var_4, var_5) {
  var_0 _meth_818F(var_1, var_2, var_3, var_4);
}

_id_C7A7(var_0, var_1, var_2, var_3) {
  level endon("game_ended");
  var_1 endon("scope_radar_ads_out");
  var_1 endon("last_stand");
  var_1 endon("death");
  var_1 endon("disconnect");
  var_1 endon("weapon_change");
  wait(var_3 * var_2);
  var_4 = 1;
  var_0.is_outlined_from_scoperadar = 1;
  _id_6220(var_0, var_1, var_4, 1, 1, "high");
}

_id_13AA0(var_0, var_1, var_2) {
  var_0 endon("disconnect");
  level endon("game_ended");
  var_0 scripts\engine\utility::_id_13737(var_2);

  if (isdefined(var_1))
  _id_5561(var_1, var_0);
}

_id_5561(var_0, var_1) {
  var_0 _meth_818C(var_1);
}

scoperadar_executevisuals(var_0, var_1) {
  level endon("game_ended");
  var_0 endon("disconnect");
  var_0 visionsetnakedforplayer("opticwave_mp", 0.2);
  var_0.fxent = spawn("script_model", var_0 gettagorigin("tag_eye"));
  var_0.fxent setmodel("prop_mp_optic_wave_scr");
  var_0.fxent.angles = var_0 getplayerangles();
  var_0.fxent _meth_831F(var_0);
  var_0.fxent setscriptablepartstate("effects", "active", 0);
  var_2 = var_0.fxent.origin + anglestoforward(var_0.fxent.angles) * 1750;
  var_0.fxent moveto(var_2, var_1);
  var_0 scripts\engine\utility::_id_13737(var_1, "last_stand", "death", "scope_radar_ads_out", "weapon_change", "unsetScopeRadar");

  if (isdefined(var_0.closestenemies)) {
  foreach (var_4 in var_0.closestenemies) {
  if (isdefined(var_4)) {
  if (scripts\engine\utility::_id_9CEE(var_4.is_outlined_from_scoperadar)) {
  _id_5561(var_4, var_0);
  var_4.is_outlined_from_scoperadar = 0;
  }
  }
  }
  }

  if (scripts\engine\utility::_id_9CEE(var_0._id_13CE5))
  var_0 visionsetnakedforplayer("cp_zmb_bw", 0.1);
  else if (scripts\engine\utility::_id_9CEE(var_0._id_DCEB))
  var_0 visionsetnakedforplayer("cp_rave_rave_mode", 0.1);
  else
  var_0 visionsetnakedforplayer("", 0.1);

  if (isdefined(var_0.fxent))
  var_0.fxent delete();
}

remove_visuals(var_0) {
  var_1 = _id_0A4A::_id_7DB0("axis");

  foreach (var_3 in var_1) {
  if (isdefined(var_3)) {
  if (scripts\engine\utility::_id_9CEE(var_3.is_outlined_from_scoperadar)) {
  _id_5561(var_3, var_0);
  var_3.is_outlined_from_scoperadar = 0;
  }
  }
  }

  if (scripts\engine\utility::_id_9CEE(var_0._id_13CE5))
  var_0 visionsetnakedforplayer("cp_zmb_bw", 0.1);
  else if (scripts\engine\utility::_id_9CEE(var_0._id_DCEB))
  var_0 visionsetnakedforplayer("cp_rave_rave_mode", 0.1);
  else
  var_0 visionsetnakedforplayer("", 0.1);

  if (isdefined(var_0.fxent))
  var_0.fxent delete();
}

cleanup_outlines(var_0) {
  level endon("game_ended");
  var_0 endon("disconnect");
  var_0 endon("last_stand");
  var_0 endon("death");
  var_1 = _id_0A4A::_id_7DB0("axis");

  foreach (var_3 in var_1) {
  if (isdefined(var_3)) {
  if (scripts\engine\utility::_id_9CEE(var_3.is_outlined_from_scoperadar)) {
  _id_5561(var_3, var_0);
  var_3.is_outlined_from_scoperadar = 0;
  }
  }
  }
}

_id_96BD(var_0) {}

_id_F4C3(var_0) {
  var_0 thread _id_12F0D(var_0);
}

_id_12C10(var_0) {
  var_0 notify("unsetScoutPing");
}

_id_12F0D(var_0) {
  var_0 endon("death");
  var_0 endon("disconnect");
  var_0 endon("unsetScoutPing");
  var_1 = 50;
  var_2 = 0.1;

  for (;;) {
  var_3 = _id_0A4A::_id_7DB0("axis");
  var_4 = var_1;
  var_5 = var_2;
  var_4 = int(var_4);
  var_5 = int(var_5);
  var_6 = scripts\engine\utility::_id_782F(var_0.origin, var_3, undefined, 24, var_4);

  if (var_6.size >= 1) {
  foreach (var_8 in var_6) {
  _id_0A62::_id_6221(var_8, level.players, 7, 0, 0, "low");
  wait(var_5);
  }

  continue;
  }

  wait(var_2 / 1200);
  }
}

_id_12EDF(var_0, var_1, var_2, var_3, var_4) {
  var_5 = gettime();
  var_6 = getarraykeys(var_1._id_C54A);

  if (!scripts\engine\utility::_id_9CEE(var_1.skip_weapon_check) && isdefined(var_1.current_passive_weapon) && var_0 != var_1.current_passive_weapon)
  return;

  foreach (var_8 in var_6) {
  if (scripts\engine\utility::_id_9CEE(var_1._id_C54A[var_8]))
  thread [[level._id_C54A[var_8]]](var_0, var_1, var_2, var_3, var_4, var_5);
  }
}

_id_12EE1(var_0, var_1) {
  var_2 = gettime();
  var_3 = getarraykeys(var_0._id_C5C9);

  foreach (var_5 in var_3) {
  if (scripts\engine\utility::_id_9CEE(var_0._id_C5C9[var_5]))
  thread [[level._id_C5C9[var_5]]](var_0, var_1);
  }
}

_id_12EDD(var_0, var_1, var_2) {
  var_3 = gettime();
  var_4 = getarraykeys(var_0._id_C4E6);

  foreach (var_6 in var_4) {
  if (scripts\engine\utility::_id_9CEE(var_0._id_C4E6[var_6]))
  thread [[level._id_C4E6[var_6]]](var_0, var_1, var_2);
  }
}

init() {
  _id_DEE0();
  level thread _id_CFD5();
}

_id_CFD5() {
  level endon("game_ended");

  for (;;) {
  level waittill("connected", var_0);
  var_0 thread _id_13C36(var_0);
  }
}

_id_13C36(var_0) {
  level endon("game_ended");
  var_0 endon("disconnect");
  var_1 = undefined;
  var_0._id_D8A7 = undefined;
  var_0._id_1607 = [];

  while (!isdefined(var_0.weaponkitinitialized))
  wait 0.1;

  var_0 _id_94F1(var_0);

  for (;;) {
  if (!isdefined(var_1) || isdefined(var_1) && !_id_0A77::_id_9C42(getweaponbasename(var_1), 1)) {
  var_2 = var_0 getcurrentprimaryweapon();

  if (!isdefined(var_2)) {
  wait 0.05;
  continue;
  }

  if (var_2 == "none") {
  wait 0.05;
  continue;
  }

  if (isdefined(var_0._id_D8A7))
  _id_12C64(var_0, var_0._id_D8A7);

  _id_F616(var_0, var_2);
  var_0.current_passive_weapon = var_2;
  var_0._id_D8A7 = var_2;
  }

  var_0 waittill("weapon_change", var_1);
  }
}

_id_94F1(var_0) {
  var_1 = [];

  foreach (var_3 in var_0._id_13C38) {
  foreach (var_5 in var_3) {
  if (scripts\engine\utility::array_contains(var_1, var_5))
  continue;

  if (isdefined(level._id_462E[var_5])) {
  var_6 = level._id_462E[var_5];

  if (isdefined(var_6) && isdefined(var_6._id_95F2))
  [[var_6._id_95F2]](var_0);
  }

  var_1 = scripts\engine\utility::_id_2279(var_1, var_5);
  }
  }
}

_id_12C64(var_0, var_1) {
  var_1 = _id_0A77::_id_8234(var_1);

  if (!isdefined(var_0._id_13C38[var_1]))
  return;

  var_2 = var_0._id_13C38[var_1];

  foreach (var_4 in var_2) {
  if (isdefined(level._id_462E[var_4])) {
  var_5 = level._id_462E[var_4];

  if (isdefined(var_5) && isdefined(var_5._id_12BFB))
  [[var_5._id_12BFB]](var_0);
  }

  var_0._id_1607 = scripts\engine\utility::array_remove(var_0._id_1607, var_4);
  }
}

_id_F616(var_0, var_1) {
  var_1 = _id_0A77::_id_8234(var_1);

  if (!isdefined(var_0._id_13C38[var_1]))
  return;

  var_2 = var_0._id_13C38[var_1];

  foreach (var_4 in var_2) {
  if (scripts\engine\utility::array_contains(var_0._id_1607, var_4))
  continue;

  var_5 = level._id_462E[var_4];

  if (isdefined(var_5) && isdefined(var_5._id_F3C3))
  [[var_5._id_F3C3]](var_0);

  var_0._id_1607 = scripts\engine\utility::_id_2279(var_0._id_1607, var_4);
  }
}

_id_DEDF(var_0, var_1, var_2, var_3) {
  var_4 = spawnstruct();
  var_4._id_95F2 = var_1;
  var_4._id_F3C3 = var_2;
  var_4._id_12BFB = var_3;
  level._id_462E[var_0] = var_4;
}

_id_7D6C(var_0, var_1) {
  var_2 = _id_0A77::_id_7D72(var_0, var_1);
  var_3 = [];

  if (!isdefined(var_2) || var_2 == -1)
  return var_3;

  var_4 = "mp/loot/weapon/" + var_1 + ".csv";
  var_5 = tablelookuprownum(var_4, 0, var_2);

  for (var_6 = 0; var_6 < 3; var_6++) {
  var_7 = tablelookupbyrow(var_4, var_5, 21 + var_6);

  if (isdefined(var_7) && var_7 != "")
  var_3[var_3.size] = var_7;
  }

  return var_3;
}

_id_1772(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7) {
  if (!isdefined(level._id_C943))
  level._id_C943 = [];

  var_8 = spawnstruct();
  var_8.name = var_0;
  var_8._id_13CDE = scripts\engine\utility::ter_op(isdefined(var_4), 0, 1);
  var_8._id_A6BB = scripts\engine\utility::ter_op(isdefined(var_5), 0, 1);
  var_8._id_ABCA = scripts\engine\utility::ter_op(isdefined(var_6), 0, 1);
  var_8._id_113D1 = scripts\engine\utility::ter_op(isdefined(var_7), 0, 1);

  if (isdefined(var_1))
  var_8._id_249B = var_1;

  if (isdefined(var_2))
  var_8._id_CA59 = var_2;

  if (isdefined(var_3))
  var_8._id_B689 = var_3;

  if (!isdefined(level._id_C943[var_0]))
  level._id_C943[var_0] = var_8;
}
