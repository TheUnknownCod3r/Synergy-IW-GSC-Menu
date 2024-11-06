/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2639.gsc
***************************************/

updatedamagefeedback(var_0, var_1, var_2, var_3, var_4, var_5, var_6) {
  if (isdefined(level._id_73A6) && [[level._id_73A6]](var_4, var_5, var_6))
  return;

  if (!isplayer(self))
  return;

  var_7 = "standard_cp";
  var_8 = undefined;

  if (isdefined(var_1) && var_1)
  self playlocalsound("cp_hit_alert_strong");
  else if (scripts\engine\utility::_id_9CEE(self.deadeye_charge))
  self playlocalsound("cp_hit_alert_perk");
  else
  self playlocalsound("cp_hit_alert");

  switch (var_0) {
  case "hitalienarmor":
  self setclientomnvar("damage_feedback_icon", var_0);
  self setclientomnvar("damage_feedback_icon_notify", gettime());
  var_3 = 1;
  break;
  case "hitcritical":
  case "hitaliensoft":
  var_8 = 1;
  break;
  case "stun":
  case "meleestun":
  if (!isdefined(self._id_B649)) {
  self playlocalsound("crate_impact");
  self._id_B649 = 1;
  }

  self setclientomnvar("damage_feedback_icon", "hitcritical");
  self setclientomnvar("damage_feedback_icon_notify", gettime());
  wait 0.2;
  self._id_B649 = undefined;
  break;
  case "high_damage":
  var_7 = "high_damage_cp";
  break;
  case "special_weapon":
  var_7 = "wor_weapon_cp";
  break;
  case "card_boosted":
  var_7 = "fnf_card_damage_cp";
  break;
  case "red_arcane_cp":
  var_7 = "red_arcane_cp";
  break;
  case "blue_arcane_cp":
  var_7 = "blue_arcane_cp";
  break;
  case "yellow_arcane_cp":
  var_7 = "yellow_arcane_cp";
  break;
  case "green_arcane_cp":
  var_7 = "green_arcane_cp";
  break;
  case "pink_arcane_cp":
  var_7 = "pink_arcane_cp";
  break;
  case "dewdrops_cp":
  var_7 = "dewdrops_cp";
  break;
  case "none":
  break;
  default:
  break;
  }

  _id_12EA8(var_7, var_8, var_2, var_3, var_1);
}

_id_C57D(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9) {
  if (level._id_7669 == 1)
  return;

  if (_id_A624())
  return;

  _id_F446(self, 1);
  _id_0A5B::_id_373E(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, _id_0A55::_id_7F56());
}

_id_A624() {
  return scripts\engine\utility::_id_9CEE(self._id_A623);
}

_id_F446(var_0, var_1) {
  self._id_A623 = var_1;
}

_id_12EA8(var_0, var_1, var_2, var_3, var_4) {
  if (!isdefined(var_0))
  return;

  if (!isdefined(var_4))
  var_4 = 0;

  if (!isdefined(var_1))
  var_1 = 0;

  if (!isdefined(var_3))
  var_3 = 0;

  self setclientomnvar("damage_scale_type", "standard");

  if (var_4)
  self setclientomnvar("damage_feedback_kill", 1);
  else
  self setclientomnvar("damage_feedback_kill", 0);

  if (var_3)
  self setclientomnvar("damage_scale_type", "hitalienarmor");

  if (var_1) {
  self setclientomnvar("damage_scale_type", "hitaliensoft");
  self setclientomnvar("damage_feedback_headshot", 1);
  }
  else
  self setclientomnvar("damage_feedback_headshot", 0);

  if (isdefined(var_2))
  self setclientomnvar("ui_damage_amount", int(var_2));

  self setclientomnvar("damage_feedback", var_0);
  self setclientomnvar("damage_feedback_notify", gettime());
}

_id_1118C(var_0, var_1, var_2) {
  scripts\engine\utility::waitframe();
  playfxontag(level._effect["stun_attack"], var_0._id_11192._id_24B2, "TAG_ORIGIN");
  playfxontag(level._effect["stun_shock"], var_0._id_11192._id_24B2, "TAG_ORIGIN");
  var_3 = undefined;

  if (isdefined(self.agent_type) && _id_0A4A::_id_77D7(self) == "seeder_spore")
  var_3 = self gettagorigin("J_Spore_46");
  else if (isdefined(self) && isalive(self) && _id_0A77::_id_8BB1(self._id_01F1, "J_SpineUpper"))
  var_3 = self gettagorigin("J_SpineUpper");

  if (isdefined(var_3)) {
  var_0._id_11192._id_24B2 moveto(var_3, 0.05);
  wait 0.05;

  if (isdefined(self) && var_2 == "MOD_MELEE")
  self playsound("trap_electric_shock");

  wait 0.05;
  var_4 = int(var_1 / 2);

  if (isdefined(self)) {
  var_5 = self;

  if (isdefined(self.agent_type) && _id_0A4A::_id_77D7(self) == "seeder_spore")
  var_5 = self._id_4353;

  if (isdefined(var_5))
  var_5 _meth_80B0(var_4, self.origin, var_0, var_0._id_11192._id_24B2, var_2);
  }
  }

  stopfxontag(level._effect["stun_attack"], var_0._id_11192._id_24B2, "TAG_ORIGIN");
}

_id_F29B(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9) {
  if (isdefined(var_1)) {
  if (var_1 == "xm25_mp" && var_0 == "MOD_IMPACT")
  var_2 = 95;

  if (var_1 == "spider_beam_mp")
  var_2 = var_2 * 15;

  if (var_1 == "alienthrowingknife_mp" && var_0 == "MOD_IMPACT") {
  if (_id_381F(var_3, 0, var_4, var_0, var_1, var_5, var_6, var_7, var_8, var_9))
  var_2 = 20000;
  else if (_id_0A4A::_id_77D7(self) != "elite")
  var_2 = 500;
  }
  }

  return var_2;
}

_id_381F(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9) {
  if (isdefined(self._id_38E0) && self._id_38E0)
  return 0;

  switch (self.agent_type) {
  case "seeder":
  case "locust":
  case "spitter":
  case "brute":
  case "goon4":
  case "goon3":
  case "goon2":
  case "goon":
  return 1;
  case "elite":
  if (var_0 _id_0A77::_id_9CF3("hypno_rhino_upgrade") || var_1)
  return 1;
  default:
  return 0;
  }
}

_id_EB9D(var_0, var_1, var_2, var_3) {
  var_4 = 1.05;

  if (scripts\engine\utility::_id_9D74(var_2) && !_id_9D39(var_3) && !_id_9DB8(var_3)) {
  if (!_id_9D39(var_3))
  var_1 = int(var_1 * var_0 _id_0CFC::_id_CA32());
  else if (_id_9D38(var_3))
  var_1 = int(var_1 * var_0 _id_0CFC::_id_CA43());

  if (isdefined(var_0._id_1517))
  var_1 = int(var_1 * var_0._id_1517);
  }

  if (var_2 == "MOD_EXPLOSIVE")
  var_1 = int(var_1 * var_0 _id_0CFC::_id_CA36());

  if (var_2 == "MOD_MELEE") {
  if (_id_FF75(var_0))
  playfxontag(level._effect["melee_blood"], var_0, "tag_weapon_right");

  var_1 = int(var_1 * var_0 _id_0CFC::_id_CA3A());

  if (isdefined(var_0._id_1518))
  var_1 = int(var_1 * var_0._id_1518);
  }

  if (var_0 _id_0A77::_id_9CF3("damage_booster_upgrade"))
  var_1 = int(var_1 * var_4);

  return var_1;
}

_id_FF75(var_0) {
  if (isdefined(level._id_FF76))
  return [[level._id_FF76]](var_0);

  return 1;
}

_id_9D39(var_0) {
  if (!isdefined(var_0))
  return 0;

  switch (var_0) {
  case "ball_drone_gun_mp":
  case "turret_minigun_alien_shock":
  case "alientank_rigger_turret_mp":
  case "alientank_turret_mp":
  case "turret_minigun_alien_grenade":
  case "turret_minigun_alien_railgun":
  case "turret_minigun_alien":
  case "alien_manned_minigun_turret4_mp":
  case "alien_manned_minigun_turret3_mp":
  case "alien_manned_minigun_turret2_mp":
  case "alien_manned_minigun_turret1_mp":
  case "alien_manned_minigun_turret_mp":
  case "alien_manned_gl_turret4_mp":
  case "alien_manned_gl_turret3_mp":
  case "alien_manned_gl_turret2_mp":
  case "alien_manned_gl_turret1_mp":
  case "alien_manned_gl_turret_mp":
  case "sentry_minigun_mp":
  case "alien_sentry_minigun_4_mp":
  case "alien_sentry_minigun_3_mp":
  case "alien_sentry_minigun_2_mp":
  case "alien_sentry_minigun_1_mp":
  case "alienvulture_mp":
  case "alien_ball_drone_gun4_mp":
  case "alien_ball_drone_gun3_mp":
  case "alien_ball_drone_gun2_mp":
  case "alien_ball_drone_gun1_mp":
  case "alien_ball_drone_gun_mp":
  return 1;
  default:
  return 0;
  }

  return 0;
}

_id_9DB8(var_0) {
  if (!isdefined(var_0))
  return 0;

  switch (var_0) {
  case "iw6_alienminigun4_mp":
  case "iw6_alienminigun3_mp":
  case "iw6_alienminigun2_mp":
  case "iw6_alienminigun1_mp":
  case "iw6_alienminigun_mp":
  return 1;
  default:
  return 0;
  }

  return 0;
}

_id_9D38(var_0) {
  if (!isdefined(var_0))
  return 0;

  switch (var_0) {
  case "alientank_rigger_turret_mp":
  case "alientank_turret_mp":
  case "turret_minigun_alien_grenade":
  case "turret_minigun_alien_railgun":
  case "turret_minigun_alien":
  return 1;
  default:
  return 0;
  }

  return 0;
}

_id_EB9F(var_0, var_1, var_2, var_3, var_4) {
  if (isdefined(var_4) && var_4 != "none")
  var_1 = _id_3D84(self, var_1, var_0, var_3, var_2);

  if (isdefined(var_2) && var_2 == "MOD_EXPLOSIVE_BULLET" && var_4 != "none") {
  if (_id_0A77::_id_4626(var_3) == "weapon_shotgun")
  var_1 = var_1 + int(var_1 * level._id_FEFD);
  else
  var_1 = var_1 + int(var_1 * level._id_69D8);
  }

  return var_1;
}

_id_EB9E(var_0, var_1) {
  if (isplayer(var_0)) {
  var_2 = var_0 _id_0CFF::_id_D880();
  var_1 = var_1 * var_2;
  var_1 = int(var_1);
  }

  return var_1;
}

_id_3D84(var_0, var_1, var_2, var_3, var_4) {
  var_5 = 500;

  if (!isdefined(var_0) || !_id_0A77::isreallyalive(var_0))
  return var_1;

  if (!isdefined(var_2) || !isplayer(var_2) || var_4 != "MOD_EXPLOSIVE_BULLET")
  return var_1;

  if (_id_0A77::_id_4626(var_3) == "weapon_shotgun") {
  var_6 = distance(var_2.origin, var_0.origin);
  var_7 = max(1, var_6 / var_5);
  var_8 = var_1 * 8;
  var_9 = var_8 * var_7;

  if (var_6 > var_5)
  return var_1;

  return int(var_9);
  }

  return var_1;
}

_id_3D9D(var_0, var_1, var_2) {
  if (var_2 == "MOD_MELEE" && weapontype(var_1) != "riotshield")
  return;

  if (isdefined(var_1) && var_1 == "alienims_projectile_mp")
  return;

  if (!isdefined(var_0._id_9B81) && isalive(var_0)) {
  if ((_id_0A77::_id_D0C6(self, "incendiary_ammo") || _id_0A77::_id_D0C6(self, "combined_ammo")) && var_2 != "MOD_UNKNOWN")
  var_0 thread _id_3B23(self, undefined, undefined, 1);
  else if (var_1 == "iw5_alienriotshield4_mp" && self._id_6D82 == 1.0)
  var_0 thread _id_3B23(self);
  else if ((scripts\engine\utility::_id_9CEE(self._id_8B86) || scripts\engine\utility::_id_9CEE(self._id_8BAC)) && var_2 != "MOD_UNKNOWN")
  var_0 thread _id_3B23(self, undefined, undefined, 1);

  switch (var_1) {
  case "iw6_alienmk323_mp":
  case "iw6_alienmk324_mp":
  case "iw6_alienminigun4_mp":
  case "iw6_alienminigun3_mp":
  case "alien_manned_gl_turret4_mp":
  case "alienvulture_mp":
  var_0 thread _id_3B23(self);
  break;
  }
  } else {
  var_3 = _id_0A77::_id_80D8(var_1);

  if (isdefined(self._id_10935) && isdefined(self._id_10935[var_3]) && self._id_10935[var_3] > 0)
  return;
  }
}

_id_3B23(var_0, var_1, var_2, var_3) {
  self endon("death");
  _id_1B6A();
  _id_4CDC(var_0, var_1, var_2, var_3);
  _id_1B69();
}

_id_4CDC(var_0, var_1, var_2, var_3) {
  self endon("death");

  if (!isdefined(var_1) && !isdefined(var_2)) {
  var_4 = _id_0A4A::_id_77D7(self);

  switch (var_4) {
  case "goon4":
  case "goon3":
  case "goon2":
  case "goon":
  var_2 = 75;
  var_1 = 3;
  case "brute4":
  case "brute3":
  case "brute2":
  case "brute":
  var_2 = 100;
  var_1 = 4;
  case "spitter":
  var_2 = 133;
  var_1 = 4;
  case "elite_boss":
  case "elite":
  var_2 = 500;
  var_1 = 4;
  case "minion":
  var_2 = 100;
  var_1 = 2;
  default:
  var_2 = self.maxhealth * 0.5;
  var_1 = 3;
  }
  } else {
  if (!isdefined(var_2))
  var_2 = 150;

  if (!isdefined(var_1))
  var_1 = 3;
  }

  if (isdefined(var_0) && isdefined(var_3) && var_0 _id_0A77::_id_9CF3("incendiary_ammo_upgrade") && isdefined(var_3))
  var_2 = var_2 * 1.2;

  var_2 = var_2 * level._id_1B71[level.players.size];
  var_5 = 0;
  var_6 = 6;
  var_7 = var_1 / var_6;
  var_8 = var_2 / var_6;

  for (var_9 = 0; var_9 < var_6; var_9++) {
  wait(var_7);

  if (isalive(self))
  self _meth_80B0(var_8, self.origin, var_0, var_0, "MOD_UNKNOWN");
  }
}

_id_1B6A() {
  if (!isdefined(self._id_9B81))
  self._id_9B81 = 0;

  self._id_9B81++;

  if (self._id_9B81 == 1 && self._id_1096F == "alien") {
  if (isdefined(self.agent_type) && self.agent_type != "minion")
  self setscriptablepartstate("animpart", "burning");
  }
}

_id_1B69() {
  self._id_9B81--;

  if (self._id_9B81 > 0)
  return;

  self._id_9B81 = undefined;
  self notify("fire_off");

  if (self._id_1096F == "alien")
  self setscriptablepartstate("animpart", "normal");
}

_id_12DA8(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9) {
  if (!isdefined(level._id_24B8) || var_1 != level._id_24B8) {
  if (isdefined(var_1) && isdefined(var_1.owner))
  _id_0A4A::_id_110A4(var_1.owner, var_2 * 0.75);
  else if (isdefined(var_1) && isdefined(var_1._id_CA80) && var_1._id_CA80 == 1)
  _id_0A4A::_id_110A4(var_1.owner, var_2);
  else
  _id_0A4A::_id_110A4(var_1, var_2);

  if (isdefined(var_1) && isdefined(var_5)) {
  if (isdefined(level._id_12D86))
  level thread [[level._id_12D86]](var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, self);
  }
  }

  _id_12D87(var_1, var_2, var_4);
}

_id_12D87(var_0, var_1, var_2) {
  if (isdefined(level._id_12D87))
  [[level._id_12D87]](var_0, var_1, var_2);
}

_id_89C6(var_0, var_1, var_2) {
  var_3 = var_2;

  switch (var_0) {
  case "iw6_panzerfaust3_mp":
  case "aamissile_projectile_mp":
  case "maverick_projectile_mp":
  case "drone_hive_projectile_mp":
  case "bomb_site_mp":
  case "ac130_40mm_mp":
  case "ac130_105mm_mp":
  case "odin_projectile_small_rod_mp":
  case "odin_projectile_large_rod_mp":
  self._id_A859 = 1;
  var_3 = self.maxhealth + 1;
  break;
  case "hind_missile_mp":
  case "hind_bomb_mp":
  case "remote_tank_projectile_mp":
  case "switch_blade_child_mp":
  self._id_A859 = 0;
  var_3 = self.maxhealth + 1;
  break;
  case "heli_pilot_turret_mp":
  case "a10_30mm_turret_mp":
  self._id_A859 = 0;
  var_3 = var_3 * 2;
  break;
  case "sam_projectile_mp":
  self._id_A859 = 1;
  var_3 = var_2;
  break;
  }

  return var_3;
}

_id_89AC(var_0, var_1, var_2) {
  if (isexplosivedamagemod(var_1)) {
  switch (var_0) {
  case "iw6_rgm_mp":
  case "proximity_explosive_mp":
  case "c4_zm":
  var_2 = var_2 * 3;
  break;
  case "iw6_mk32_mp":
  case "semtexproj_mp":
  case "bouncingbetty_mp":
  case "semtex_zm":
  case "semtex_mp":
  case "frag_grenade_mp":
  var_2 = var_2 * 4;
  break;
  default:
  if (_id_0A77::_id_9F7C(var_0, "alt_"))
  var_2 = var_2 * 3;

  break;
  }
  }

  return var_2;
}

_id_8975(var_0, var_1, var_2, var_3) {
  if (var_1 == "MOD_RIFLE_BULLET" || var_1 == "MOD_PISTOL_BULLET") {
  if (var_3 _id_0A77::_id_12D6("specialty_armorpiercing") || _id_0A77::_id_9DFF(var_0, var_1, var_3))
  return var_2 * level._id_218B;
  }

  return var_2;
}

onkillstreakkilled(var_0, var_1, var_2, var_3, var_4, var_5, var_6) {
  var_7 = 0;
  var_8 = undefined;

  if (isdefined(var_0) && isdefined(self.owner)) {
  if (isdefined(var_0.owner) && isplayer(var_0.owner))
  var_0 = var_0.owner;

  if (self.owner _id_0A77::isenemy(var_0))
  var_8 = var_0;
  }

  if (isdefined(var_8)) {
  var_8 notify("destroyed_killstreak", var_1);
  var_9 = 100;
  var_7 = 1;
  }

  if (isdefined(self.owner) && isdefined(var_5))
  self.owner thread _id_0A77::leaderdialogonplayer(var_5, undefined, undefined, self.origin);

  self notify("death");
  return var_7;
}

_id_89C3(var_0, var_1, var_2) {
  if (var_1 == "MOD_MELEE")
  return self.maxhealth + 1;

  return var_2;
}

_id_8999(var_0, var_1, var_2) {
  if (var_0 == "emp_grenade_mp" && var_1 == "MOD_GRENADE_SPLASH") {
  self notify("emp_damage", var_0.owner, 8.0);
  return 0;
  }

  return var_2;
}

_id_3343() {
  self endon("death");
  self setcandamage(1);
  self.maxhealth = 100000;
  self.health = self.maxhealth;
  var_0 = undefined;

  for (;;) {
  self waittill("damage", var_1, var_0, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9);

  if (!isplayer(var_0) && !isagent(var_0))
  continue;

  if (!_id_7415(self.owner, var_0))
  continue;

  if (isdefined(var_9)) {
  switch (var_9) {
  case "ztransponder_mp":
  case "transponder_mp":
  case "concussion_grenade_mp":
  case "smoke_grenade_mp":
  case "flash_grenade_mp":
  continue;
  }
  }

  break;
  }

  if (level._id_334B)
  wait(0.1 + randomfloat(0.4));
  else
  wait 0.05;

  if (!isdefined(self))
  return;

  level._id_334B = 1;
  thread _id_E24B();

  if (isdefined(var_4) && (issubstr(var_4, "MOD_GRENADE") || issubstr(var_4, "MOD_EXPLOSIVE")))
  self._id_13908 = 1;

  if (isdefined(var_8) && var_8 & level.idflags_penetration)
  self._id_1390E = 1;

  self._id_1390B = 1;

  if (isdefined(var_0))
  self._id_4D3F = var_0;

  if (isplayer(var_0))
  var_0 updatedamagefeedback("c4");

  if (level.teambased) {
  if (isdefined(var_0) && isdefined(self.owner)) {
  var_10 = var_0.pers["team"];
  var_11 = self.owner.pers["team"];

  if (isdefined(var_10) && isdefined(var_11) && var_10 != var_11)
  var_0 notify("destroyed_equipment");
  }
  }
  else if (isdefined(self.owner) && isdefined(var_0) && var_0 != self.owner)
  var_0 notify("destroyed_equipment");

  if (self._id_13C2E == "transponder_mp" || self._id_13C2E == "ztransponder_mp")
  self.owner notify("transponder_update", 0);

  waittillframeend;
  self notify("detonateExplosive", var_0);
}

_id_7415(var_0, var_1, var_2) {
  if (!isdefined(var_0))
  return 1;

  if (!level.teambased)
  return 1;

  var_3 = var_1.team;
  var_4 = level._id_740A;

  if (isdefined(var_2))
  var_4 = var_2;

  if (var_4 != 0)
  return 1;

  if (var_1 == var_0)
  return 0;

  if (!isdefined(var_3))
  return 1;

  if (var_3 != var_0.team)
  return 1;

  return 0;
}

_id_E24B() {
  wait 0.05;
  level._id_334B = 0;
}

_id_20B9() {
  thread _id_20BA();
}

_id_20BA() {
  self notify("stop_applyAlienSnare");
  self endon("stop_applyAlienSnare");
  self endon("disconnect");
  self endon("death");
  self._id_1BD8++;
  self._id_1BD9 = _func_17B(0.68, (self._id_1BD8 + 1) * 0.35);
  self._id_1BD9 = max(0.58, self._id_1BD9);
  _id_0CFD::_id_12E78();
  wait 0.8;
  self._id_1BD8 = 0;
  self._id_1BD9 = 1.0;
  _id_0CFD::_id_12E78();
}

_id_9BE5(var_0, var_1, var_2) {
  if (isdefined(var_2) && _id_0A77::_id_9CEB(var_2))
  return 0;

  if (var_0 == "MOD_UNKNOWN" && var_1 != "none")
  return 1;
  else
  return 0;
}

_id_A010(var_0) {
  if (!isdefined(var_0))
  return 0;

  var_1 = getweaponbasename(var_0);

  switch (var_1) {
  case "iw7_shredderdummy_zm":
  case "iw7_facemelterdummy_zm":
  case "iw7_dischorddummy_zm":
  case "iw7_headcutterdummy_zm":
  case "iw7_headcutter3_zm":
  case "iw7_headcutter2_zm":
  case "iw7_headcutter_zm_pap1":
  case "iw7_headcutter_zm":
  case "iw7_facemelter_zm_pap1":
  case "iw7_facemelter_zm":
  case "iw7_dischord_zm_pap1":
  case "iw7_dischord_zm":
  case "iw7_shredder_zm_pap1":
  case "iw7_shredder_zm":
  return 1;
  default:
  return 0;
  }

  return 0;
}
