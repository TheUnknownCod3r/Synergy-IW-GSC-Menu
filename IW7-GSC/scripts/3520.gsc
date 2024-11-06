/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3520.gsc
***************************************/

_id_105BC() {
  _id_105E0();
  _id_105BD();
  _id_105BE();
}

_id_105BD() {
  level._effect["spaceship_death"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_death_01_cheap.vfx");
  level._effect["spaceship_dmg"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_hit_damage");
  level._effect["spaceship_dmg_trail"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_hit_damage_linger");
  level._effect["spaceship_engine_idle"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_thrust_idle");
  level._effect["spaceship_engine_max"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_thrust_max");
  level._effect["spaceship_hover"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_hover");
  level._effect["spaceship_remove"] = loadfx("vfx/iw7/_requests/equipment/retractable_shield/vfx_iw7_equip_retractable_shield_melee_energy_burst.vfx");
  level._effect["cockpit_sparks"] = loadfx("vfx/core/mp/killstreaks/vfx_ims_sparks");
  level._effect["cockpit_smoke"] = loadfx("vfx/core/mp/killstreaks/vfx_helo_damage.vfx");
  level._effect["cockpit_fire"] = loadfx("vfx/iw7/_requests/mp/vfx_debug_warning.vfx");
  level._effect["cockpit_expl"] = loadfx("vfx/iw7/_requests/mp/vfx_generic_equipment_exp_lg.vfx");
  level._effect["space_particles"] = loadfx("vfx/old/space_fighter/space_particulate_player_oneshot.vfx");
  level._effect["spaceship_trail_f"] = loadfx("vfx/core/vehicles/vfx_jackal_wingtip_trail_b");
  level._effect["spaceship_trail_e"] = loadfx("vfx/core/vehicles/vfx_jackal_wingtip_trail_o");
}

_id_105BE() {
  level._id_105C8["explode"] = "exp_helicopter_fuel";
}

_id_10588(var_0) {
  _id_105BC();
  level._id_A407 = var_0;
  var_0._id_1051B = isdefined(var_0._id_1051B) && var_0._id_1051B;
  thread _id_1058C();
  var_0._id_1C94 = !isdefined(var_0._id_1C94) || var_0._id_1C94;

  if (var_0._id_1C94)
  _id_1058A("landingExclusionZone");
  else
  _id_1058B("landingzone");

  var_0._id_1C95 = !isdefined(var_0._id_1C95) || var_0._id_1C95;

  if (var_0._id_1C95)
  _id_1058F("summonExclusionZone");
  else
  _id_10590("spaceship_summon_trigger");

  if (!isdefined(var_0._id_1C2D))
  var_0._id_1C2D = "spaceship_spawner_allies";

  if (!isdefined(var_0._id_26FB))
  var_0._id_26FB = "spaceship_spawner_axis";

  level._id_FE33["axis"] = getentarray(var_0._id_26FB, "targetname");
  level._id_FE33["allies"] = getentarray(var_0._id_1C2D, "targetname");
  var_0._id_10DBB = isdefined(var_0._id_10DBB) && var_0._id_10DBB;

  if (!var_0._id_10DBB) {
  foreach (var_2 in level._id_FE33["axis"])
  _id_105CB(var_2, "axis");

  foreach (var_2 in level._id_FE33["allies"])
  _id_105CB(var_2, "allies");
  }

  var_0._id_1C91 = isdefined(var_0._id_1C91) && var_0._id_1C91;
  _id_1058E("speedZone");
  thread _id_105E2();
}

_id_1058C() {
  while (!isdefined(level.gametypestarted) || level.gametypestarted == 0)
  scripts\engine\utility::waitframe();

  level._id_8CC1 = 1;
}

_id_105E0() {
  level._id_105EA = [];
  level._id_1676 = [];
  level._id_105E9 = [];
}

_id_105B5(var_0, var_1, var_2) {
  _id_1057D(var_1);
  var_1._id_10574 = var_0;
  var_1 _id_0AE2::_id_D729();
  _id_10580(var_0);

  if (!isdefined(var_2))
  var_2 = 0;

  var_1 _id_0BD3::_id_D31A(var_0, undefined, var_2);
  var_0.owner = var_1;
  _id_10585(var_0, var_1);
  _id_105DE(var_0, 1500, 1500 - var_0._id_00E1);
  thread _id_105A5(var_0, var_1);
  thread _id_1059F(var_0, var_1);
  var_0 notify("playerEnter");
}

_id_105B6(var_0, var_1) {
  var_1 _id_0AE2::_id_D72F();
  var_1 _id_0BD3::_id_D05B();
  var_1 _meth_80F3();
  _id_105CD(var_0);
  var_0.owner = undefined;
  var_1._id_10574 = undefined;
  var_1._id_105E8 = gettime();
  var_1._id_A9F2 = var_0;
  thread _id_105A6(var_0);
}

_id_10585(var_0, var_1) {
  level._id_1676 = scripts\engine\utility::_id_2279(level._id_1676, var_0);
  thread _id_1059E(var_0, var_1);
  thread _id_105A3(var_0, var_1);
  thread _id_105A2(var_0, var_1);
  thread _id_105BA(var_0, var_1);
}

_id_1057E(var_0) {
  level._id_1676 = scripts\engine\utility::array_remove(level._id_1676, var_0);
  _id_105CE(var_0);
}

_id_1057C(var_0) {
  if (isdefined(var_0._id_130F2)) {
  var_0._id_130F2 delete();
  var_0._id_130AD scripts\mp\gameobjects::_id_51DA();
  }

  _id_105C0(var_0);
}

_id_1057F(var_0, var_1, var_2) {
  var_0 scripts\engine\utility::_id_13731(var_2);
  var_1 delete();
}

_id_105C3() {
  if (!isdefined(level._id_105BB)) {
  level._id_105BB = scripts\engine\utility::_id_817E("player_safe_zone", "targetname");
  level._id_105BB.origin = (0, 0, 0);
  }

  return level._id_105BB;
}

_id_105A6(var_0) {
  var_0 endon("death");
  var_0 endon("playerReserved");
  level endon("game_ended");
  var_0 scripts\engine\utility::_id_13736(20, "spaceshipTimeout");

  while (gettime() - var_0._id_A96A < 5000)
  wait 0.25;

  playfx(scripts\engine\utility::_id_7ECB("spaceship_remove"), var_0.origin);
  _id_1057C(var_0);
  _id_1057B();
}

_id_1059E(var_0, var_1) {
  var_1 endon("exit_jackal");
  var_0 endon("death");
  var_1 endon("disconnect");

  if (!isai(var_1)) {
  var_1 notifyonplayercommand("ads_on", "+speed_throw");
  var_1 notifyonplayercommand("ads_off", "-speed_throw");
  }

  var_2 = 0;

  for (;;) {
  var_1 waittill("ads_on");
  var_1 playlocalsound("jackal_hud_ads_on");
  var_1 waittill("ads_off");
  var_1 playlocalsound("jackal_hud_ads_off");
  }
}

_id_105CE(var_0) {
  if (isdefined(var_0) && isdefined(var_0._id_C79F)) {
  foreach (var_2 in var_0._id_C79F)
  scripts\mp\utility\game::_id_C78F(var_2, var_0);

  var_0._id_C79F = undefined;
  }

  _id_105DF(var_0, undefined, var_0._id_90E1);
  _id_105DF(var_0, undefined, var_0._id_2CCB);
}

_id_105A3(var_0, var_1) {
  var_1 endon("exit_jackal");
  var_0 endon("death");
  var_1 endon("disconnect");
  scripts\engine\utility::waitframe();
  _id_10575(var_0, var_1);
  var_0._id_C79F = [];

  if (level.teambased) {
  var_0._id_C79F[0] = scripts\mp\utility\game::_id_C795(var_0, "cyan", var_1.team, 1, 0, "equipment");
  var_0._id_C79F[1] = scripts\mp\utility\game::_id_C795(var_0, "orange", scripts\mp\utility\game::_id_8027(var_1.team), 1, 0, "equipment");
  }
  else
  var_0._id_C79F[0] = scripts\mp\utility\game::_id_C793(var_0, "orange", 1, 0, "equipment");

  var_0 _meth_818C(var_1);
  _id_10575(var_0, var_1);
  var_2 = [];
  var_2["tag_engine_left"] = "spaceship_engine_idle";
  var_2["tag_engine_right"] = "spaceship_engine_idle";
  var_2["tag_vtol_frontrightbottom"] = "spaceship_hover";
  var_2["tag_vtol_frontleftbottom"] = "spaceship_hover";
  var_2["tag_vtol_frontcenterbottom"] = "spaceship_hover";
  var_3 = [];
  var_3["tag_engine_left"] = "spaceship_engine_max";
  var_3["tag_engine_right"] = "spaceship_engine_max";
  var_0._id_90E1 = var_2;
  var_0._id_2CCB = var_3;

  for (;;) {
  _id_105DF(var_0, var_2, var_3);
  var_1 waittill("engage boost");
  _id_105DF(var_0, var_3, var_2);
  var_1 waittill("disengage boost");
  }
}

_id_105DF(var_0, var_1, var_2, var_3) {
  var_0 endon("death");

  while (isdefined(var_0._id_12F6B) && var_0._id_12F6B)
  scripts\engine\utility::waitframe();

  if (!isdefined(var_0))
  return;

  var_0._id_12F6B = 1;

  if (isdefined(var_2) && var_2.size > 0) {
  foreach (var_6, var_5 in var_2) {
  stopfxontag(scripts\engine\utility::_id_7ECB(var_5), var_0, var_6);
  scripts\engine\utility::waitframe();
  }
  }

  if (isdefined(var_1) && var_1.size > 0) {
  foreach (var_6, var_5 in var_1) {
  if (isdefined(var_3))
  playfxontagforclients(scripts\engine\utility::_id_7ECB(var_5), var_0, var_6, var_3);
  else
  playfxontag(scripts\engine\utility::_id_7ECB(var_5), var_0, var_6);

  scripts\engine\utility::waitframe();
  }
  }

  var_0._id_12F6B = undefined;
}

_id_10575(var_0, var_1) {
  var_2 = [];
  var_2["tag_enginebottom_right"] = "spaceship_trail_f";
  var_2["tag_enginebottom_left"] = "spaceship_trail_f";
  var_3 = [];
  var_3["tag_enginebottom_right"] = "spaceship_trail_e";
  var_3["tag_enginebottom_left"] = "spaceship_trail_e";

  foreach (var_5 in level._id_1676) {
  if (!isdefined(var_5))
  continue;

  if (var_5 == var_0)
  continue;

  if (!isdefined(var_5.owner))
  continue;

  if (!level.teambased || var_1.team != var_5.owner.team) {
  thread _id_105DF(var_5, var_3, undefined, var_1);
  thread _id_105DF(var_0, var_3, undefined, var_5.owner);
  continue;
  }

  thread _id_105DF(var_5, var_2, undefined, var_1);
  thread _id_105DF(var_0, var_2, undefined, var_5.owner);
  }
}

_id_105A2(var_0, var_1) {
  var_0 endon("death");
  var_1 endon("exit_jackal");
  level endon("game_ended");
  var_1 waittill("disconnect");
  _id_1057E(var_0);
  _id_1057C(var_0);
  _id_1057B();
}

_id_1057B() {
  level._id_1676 = scripts\engine\utility::_id_22BC(level._id_1676);
  level._id_105EA = scripts\engine\utility::_id_22BC(level._id_105EA);
  var_0 = [];

  foreach (var_3, var_2 in level._id_105E9) {
  if (isdefined(var_2))
  var_0[var_3] = var_2;
  }

  level._id_105E9 = var_0;
}

_id_105A1(var_0) {
  level endon("game_ended");
  var_1 = var_0._id_10483;
  var_2 = var_0.team;
  var_3 = var_0.owner;
  var_0 scripts\engine\utility::waittill_any("death", "spaceship_crashing");
  _id_1057E(var_0);
  _id_1057C(var_0);
  _id_1057B();

  if (isdefined(var_1) && !level._id_A407._id_10DBB) {
  wait 2.0;
  _id_105CB(var_1, var_2);
  }
}

_id_105A0(var_0) {
  var_0 endon("spaceship_crashing");
  level endon("game_ended");
  var_0._id_10586 = 1500;
  var_0._id_A96A = 0;
  var_0 scripts\mp\damage::monitordamage(1500, "", ::_id_105AA, ::_id_105A9, 0, 1);
}

_id_105A9(var_0, var_1, var_2, var_3, var_4) {
  var_5 = self;

  if (scripts\mp\utility\game::_id_9F7C(var_1, "spaceship"))
  playfxontag(scripts\engine\utility::_id_7ECB("spaceship_dmg"), var_5, "tag_origin");

  var_5._id_A96A = gettime();

  if (isdefined(var_5.owner)) {
  var_6 = var_5.maxhealth - var_5._id_00E1;
  var_7 = var_6 - var_3;
  _id_105DE(var_5, var_6, var_7);
  thread _id_10587(var_5);

  if (isdefined(var_0.owner))
  var_0 = var_0.owner;
  }

  return var_3;
}

_id_105A5(var_0, var_1) {
  self endon("disconnect");
  var_1 endon("exit_jackal");
  level endon("game_ended");
  var_1 waittill("death");

  if (isdefined(var_1._id_10574) && var_1._id_10574 == var_0) {
  level._id_105EA = scripts\engine\utility::array_remove(level._id_105EA, var_0);
  level._id_105E9[var_0 getentitynumber()] = undefined;
  level._id_1676 = scripts\engine\utility::array_remove(level._id_1676, var_0);
  var_0 _meth_80B0(var_0.health + 1, var_0.origin, var_1, undefined, "MOD_EXPLOSIVE");
  thread _id_105B6(var_0, var_1);
  }
}

_id_1059F(var_0, var_1) {
  self endon("disconnect");
  var_1 endon("exit_jackal");
  var_0 endon("spaceship_crashing");
  level endon("game_ended");
  var_2 = 100;
  var_3 = 700;
  var_4 = 50;
  var_5 = 200;
  var_6 = 440;

  for (;;) {
  var_0 waittill("spaceship_collision", var_7, var_8, var_9, var_10);
  var_11 = var_1 _meth_814C();
  var_12 = (var_11[0] + 1) / 2;
  var_13 = var_5 + (var_6 - var_5) * var_12;
  var_14 = (var_8 - var_4) / (var_13 - var_4);

  if (var_14 > 1.0)
  var_14 = 1.0;
  else if (var_14 < 0.0)
  var_14 = 0.0;

  var_15 = var_14 * var_7;

  if (var_15 > 0) {
  var_16 = var_2 + (var_3 - var_2) * var_15;
  var_0 _meth_80B0(var_16, var_10, var_1, var_1, "MOD_IMPACT");
  }
  }
}

_id_10587(var_0) {
  level endon("game_ended");
  var_0 endon("death");
  var_0 notify("healthRegen");
  var_0 endon("healthRegen");
  wait 5;
  var_1 = 18.75;

  while (var_0._id_00E1 > 0) {
  var_2 = 1500 - var_0._id_00E1;
  var_0._id_00E1 = var_0._id_00E1 - var_1;

  if (var_0._id_00E1 < 0)
  var_0._id_00E1 = 0;

  var_3 = 1500 - var_0._id_00E1;
  _id_105DE(var_0, var_2, var_3);
  scripts\engine\utility::waitframe();
  }

  _id_105CD(var_0);
}

_id_105DE(var_0, var_1, var_2) {
  if (!isdefined(var_0.owner))
  return;

  if (var_2 < var_1) {
  if (var_2 < 495.0 && var_1 >= 495.0) {
  _id_105CD(var_0);
  var_0._id_FE12 = scripts\engine\utility::_id_7ECB("cockpit_fire");
  playfxontagforclients(var_0._id_FE12, var_0, "j_stickleft", var_0.owner);
  var_3 = [];
  var_3["tag_thrust_rear1"] = "spaceship_dmg_trail";
  _id_105DF(var_0, var_3);
  }
  else if (var_2 < 990.0 && var_1 >= 990.0) {
  var_0._id_FE12 = scripts\engine\utility::_id_7ECB("cockpit_smoke");
  playfxontagforclients(var_0._id_FE12, var_0, "j_stickleft", var_0.owner);
  }
  else
  playfxontagforclients(scripts\engine\utility::_id_7ECB("cockpit_sparks"), var_0, "j_stickleft", var_0.owner);
  }
  else if (var_2 >= 990.0 && var_1 < 990.0)
  _id_105CD(var_0);
  else if (var_2 >= 495.0 && var_1 < 495.0) {
  _id_105CD(var_0);
  var_0._id_FE12 = scripts\engine\utility::_id_7ECB("cockpit_smoke");
  playfxontagforclients(var_0._id_FE12, var_0, "j_stickleft", var_0.owner);
  var_3 = [];
  var_3["tag_thrust_rear1"] = "spaceship_dmg_trail";
  _id_105DF(var_0, [], var_3);
  }
}

_id_105CD(var_0) {
  if (isdefined(var_0._id_FE12)) {
  stopfxontag(var_0._id_FE12, var_0, "j_stickleft");
  var_0._id_FE12 = undefined;
  }
}

_id_105AA(var_0, var_1, var_2, var_3) {
  var_4 = self;

  if (isdefined(var_0.owner))
  var_0 = var_0.owner;

  if (isdefined(var_4._id_FE12))
  _id_105CD(var_4);

  var_4 playsound(level._id_105C8["explode"]);
  playfx(scripts\engine\utility::_id_7ECB("spaceship_death"), var_4.origin, anglestoforward(var_4.angles), anglestoup(var_4.angles));

  if (isdefined(var_4.owner))
  var_4.owner _meth_80B0(var_4.health + 1, var_4.owner.origin, var_0, undefined, var_2);

  var_4 notify("spaceship_crashing");
}

_id_105BF(var_0) {
  level._id_105EA = scripts\engine\utility::_id_2279(level._id_105EA, var_0);
  level._id_105E9[var_0 getentitynumber()] = var_0;
}

_id_105C0(var_0) {
  if (isdefined(var_0)) {
  level._id_105EA = scripts\engine\utility::array_remove(level._id_105EA, var_0);
  level._id_105E9[var_0 getentitynumber()] = undefined;
  var_0 delete();
  }
}

_id_105A4(var_0) {
  var_0 notify("monitorMissileFire");
  var_0 endon("monitorMissileFire");
  var_0 endon("spaceship_crashing");
  var_0 endon("death");

  for (;;) {
  var_0 waittill("missile_fire", var_1, var_2);

  if (var_2 != "spaceship_assault_mp" && var_2 != "spaceship_strike_mp")
  continue;

  var_1._id_105E6 = var_1.origin;
  }
}

_id_3758(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11) {
  if (var_4 != "MOD_IMPACT") {
  if (!isdefined(var_0) || !isdefined(var_0._id_105E6))
  return var_2;

  if (var_5 != "spaceship_assault_mp" && var_5 != "spaceship_strike_mp")
  return var_2;
  }

  if (var_5 == "spaceship_strike_mp") {
  var_12 = var_0;
  var_13 = distance(var_12.origin, var_12._id_105E6);

  if (var_13 < 10000)
  var_2 = var_2 * 1.0;
  else if (var_13 < 30000)
  var_2 = var_2 * 0.5;
  else
  var_2 = var_2 * 0.25;
  }

  var_2 = int(max(var_2, 1));
  self vehicle_finishdamage(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11);
}

_id_105E2() {
  level endon("game_ended");

  for (;;) {
  level waittill("player_spawned", var_0);

  if (level._id_A407._id_1C91)
  thread _id_105B8(var_0);

  if (level._id_A407._id_10DBB)
  level thread _id_105B1(var_0);
  }
}

_id_105B1(var_0) {
  var_0 endon("death");
  var_0 endon("disconnect");

  for (;;) {
  var_1 = _id_105C4(var_0.team);
  var_2 = _id_105CB(var_1, var_0.team);

  if (isdefined(var_2))
  break;

  scripts\engine\utility::waitframe();
  }

  var_0 setplayerangles(var_1.angles);
  var_2 _meth_83E7(var_2.origin, var_1.angles);
  scripts\engine\utility::waitframe();
  _id_105B5(var_2, var_0, 1);
}

_id_105CB(var_0, var_1) {
  var_2 = var_0 _meth_83DA();

  if (!isdefined(var_2))
  return undefined;

  var_2._id_10483 = var_0;
  return _id_1058D(var_2, var_1);
}

_id_105C4(var_0) {
  var_1 = level._id_FE33[var_0];
  var_1 = scripts\engine\utility::_id_227F(var_1, level._id_FE33[scripts\mp\utility\game::_id_8027(var_0)]);
  var_2 = undefined;
  var_3 = 0;

  foreach (var_5 in var_1) {
  if (!_id_10595(var_5))
  continue;

  var_6 = 0;

  foreach (var_8 in level._id_1676) {
  if (isdefined(var_8) && isdefined(var_8.owner) && isdefined(var_8.owner.team) && var_8.owner.team != var_0) {
  var_9 = distancesquared(var_8.origin, var_5.origin);

  if (!isdefined(var_6) || var_9 > var_6)
  var_6 = var_9;
  }
  }

  if (!isdefined(var_2) || var_6 > var_3) {
  var_3 = var_6;
  var_2 = var_5;
  }
  }

  if (!isdefined(var_2))
  var_2 = var_1[randomint(var_1.size)];

  return var_2;
}

_id_10595(var_0) {
  if (isdefined(var_0._id_11931) && var_0._id_11931 - gettime() < 3000)
  return 0;

  foreach (var_2 in level._id_1676) {
  if (!isdefined(var_2))
  continue;

  if (distancesquared(var_2.origin, var_0.origin) <= 1600)
  return 0;
  }

  var_4 = physics_createcontents(["physicscontents_aiavoid", "physicscontents_solid", "physicscontents_structural"]);
  var_5 = physics_getclosestpointtosphere(var_0.origin, 300, 0, var_4, undefined, "physicsquery_any");
  return var_5 == 0;
}

_id_105CA(var_0, var_1, var_2) {
  var_3 = _func_26D(var_0, var_1, var_2, "veh_spaceship_mp", "veh_mil_air_ca_jackal_drone_atmos_periph_mp");
  return _id_1058D(var_3, var_0.team);
}

_id_1058D(var_0, var_1) {
  var_0.team = var_1;
  var_0._id_13CC3 = [];
  var_0._id_13CC3["hover"] = "spaceship_assault_mp";
  var_0._id_13CC3["fly"] = "spaceship_strike_mp";
  var_0._id_13CC3["land"] = var_0._id_13CC3["hover"];
  _id_105BF(var_0);
  var_0 _meth_84BC(level._id_A407._id_1051B);
  var_0 _meth_84BE("spaceship");
  thread _id_105A1(var_0);
  thread _id_105A0(var_0);
  thread _id_105A4(var_0);
  var_0._id_4D2E = ::_id_3758;
  return var_0;
}

_id_105C5(var_0, var_1) {
  var_2 = undefined;
  var_2 = spawn("trigger_radius", _id_10578(var_0), 0, 150, 200);
  var_0._id_130F2 = var_2;
  var_3 = scripts\mp\gameobjects::createuseobject(var_1, var_2, []);
  var_3 scripts\mp\gameobjects::_id_FB08(2);
  var_3 scripts\mp\gameobjects::_id_FB07(&"MP_JACKAL_BOARDING");

  if (var_2.classname == "trigger_use")
  var_3 scripts\mp\gameobjects::_id_FB06(&"MP_JACKAL_BOARD");

  var_3 scripts\mp\gameobjects::allowuse("friendly");
  var_3 scripts\mp\gameobjects::_id_FB0E("friendly");
  var_3._id_C5BB = ::_id_105B3;
  var_3._id_10574 = var_0;
  var_0._id_130AD = var_3;
}

_id_105B3(var_0) {
  var_1 = self._id_10574;

  if (!isdefined(var_1))
  return;

  _id_105B5(var_1, var_0);
}

_id_10580(var_0) {
  if (isdefined(var_0._id_130AD)) {
  var_0._id_130AD scripts\mp\gameobjects::_id_FB0E("none");
  var_0._id_130AD scripts\mp\gameobjects::allowuse("none");
  }
}

_id_10583(var_0) {
  if (isdefined(var_0._id_130AD)) {
  var_0._id_130AD scripts\mp\gameobjects::_id_FB0E("friendly");
  var_0._id_130AD scripts\mp\gameobjects::allowuse("friendly");
  var_0._id_130AD.trigger.origin = _id_10578(var_0);
  }
}

_id_105E1(var_0, var_1) {
  var_1 endon("death");
  var_1 endon("disconnect");
  level endon("game_ended");

  if (!isai(var_1))
  var_1 notifyonplayercommand("exitJackal", "+actionslot 2");

  while (isdefined(var_0.owner)) {
  var_1 waittill("exitJackal");

  if (_id_10579(var_0, var_1))
  thread _id_10581(var_0, var_1);
  }
}

_id_10579(var_0, var_1) {
  if (level._id_A407._id_1C94) {
  if (isdefined(var_0._id_A83C)) {
  if (!isdefined(var_0._id_A83C.team) || var_0._id_A83C.team == var_1.team) {
  var_1 iprintlnbold(&"MP_JACKAL_CANT_LAND");
  return 0;
  }
  }

  return 1;
  }
  else if (!_id_10591(var_0)) {
  var_1 iprintlnbold(&"MP_JACKAL_CANT_LAND");
  return 0;
  }

  return 1;
}

_id_10581(var_0, var_1, var_2) {
  level endon("game_ended");
  var_0 endon("death");
  var_3 = _id_10584(var_0, var_1);

  if (!isdefined(var_3)) {
  var_1 iprintlnbold(&"MP_JACKAL_CANT_LAND");
  return;
  }

  var_1 setorigin(var_3);
  var_1 setplayerangles(var_0.angles);
  _id_105B6(var_0, var_1);
  thread _id_1057E(var_0);

  if (isdefined(var_2))
  _id_105B7(var_1, var_2.origin, var_2.angles);
}

_id_10578(var_0) {
  return var_0 gettagorigin("j_cockpit") - (0, 0, 100);
}

_id_10584(var_0, var_1) {
  var_2 = anglestoright(var_0.angles);
  var_3 = scripts\engine\trace::_id_48CC(1);
  var_4 = var_0 gettagorigin("j_cockpit");
  var_5 = var_4 - 64 * var_2;
  var_6 = physics_getclosestpointtocharacter(var_5, var_1, 0, var_0.angles, 0, var_3, var_0, "physicsquery_any");

  if (var_6 == 0)
  return var_5;

  var_5 = var_4 + 64 * var_2;
  var_6 = physics_getclosestpointtocharacter(var_5, var_1, 0, var_0.angles, 0, var_3, var_0, "physicsquery_any");

  if (var_6 == 0)
  return var_5;

  var_7 = anglestoforward(var_0.angles);
  var_5 = var_4 + 100 * var_7;
  var_6 = physics_getclosestpointtocharacter(var_5, var_1, 0, var_0.angles, 0, var_3, var_0, "physicsquery_any");

  if (var_6 == 0)
  return var_5;

  return undefined;
}

_id_105B8(var_0) {
  level endon("game_ended");
  var_0 endon("death");
  var_0 endon("disconnect");

  if (!scripts\mp\utility\game::_id_766C("prematch_done"))
  level waittill("prematch_done");

  thread _id_105A7(var_0);

  for (;;) {
  var_0 waittill("useSpaceship");

  if (isdefined(var_0._id_A40D))
  continue;

  if (isdefined(var_0._id_10574)) {
  if (_id_10579(var_0._id_10574, var_0))
  _id_10581(var_0._id_10574, var_0);
  else
  var_0 iprintlnbold(&"MP_JACKAL_CANT_LAND");

  continue;
  }

  if (!isdefined(var_0._id_A40D)) {
  var_1 = _id_10593(var_0);

  if (isdefined(var_1))
  _id_10576(var_1, var_0);
  else if (_id_1057A(var_0))
  _id_105CF(var_0);
  }
  }
}

_id_105A7(var_0) {
  level endon("game_ended");
  var_0 endon("death");
  var_0 endon("disconnect");

  if (!isai(var_0))
  var_0 notifyonplayercommand("useButton", "+usereload");

  for (;;) {
  var_0 waittill("useButton");
  var_1 = 0.0001;
  var_0 setclientomnvar("ui_securing", 8);
  var_0 setclientomnvar("ui_securing_progress", var_1);

  while (var_0 usebuttonpressed()) {
  scripts\engine\utility::waitframe();
  var_1 = var_1 + 0.0666667;

  if (var_1 > 1.0)
  var_1 = 1.0;

  var_0 setclientomnvar("ui_securing_progress", var_1);

  if (var_1 == 1.0) {
  var_0 setclientomnvar("ui_securing", 0);
  var_0 notify("useSpaceship");
  wait 0.25;
  var_1 = 0;
  }
  }

  var_0 setclientomnvar("ui_securing", 0);
  }
}

_id_10593(var_0) {
  var_1 = var_0 geteye();
  var_2 = var_0 getplayerangles();
  var_3 = var_1 + 750 * anglestoforward(var_2);
  var_4 = physics_spherecast(var_1, var_3, 15, scripts\engine\trace::_id_4972(), undefined, "physicsquery_closest");

  if (var_4.size == 0)
  return undefined;

  var_5 = var_4[0]["entity"];

  if (!_id_10592(var_5))
  return undefined;

  if (isdefined(var_5.owner))
  return undefined;

  return var_5;
}

_id_1058B(var_0) {
  var_1 = getentarray(var_0, "targetname");

  if (var_1.size > 0) {
  level._id_A841 = var_1;

  foreach (var_3 in var_1) {
  _id_105E3(var_3);

  if (var_3._id_2699)
  thread _id_105E5(var_3, ::_id_105AC, ::_id_105B2, ::_id_105AF);
  }
  }
}

_id_1058A(var_0) {
  var_1 = getentarray(var_0, "targetname");
  level._id_A83D = var_1;

  if (var_1.size > 0) {
  foreach (var_3 in var_1) {
  _id_105E3(var_3);
  thread _id_105E5(var_3, ::_id_105AB, undefined, ::_id_105AE);
  }
  }
}

_id_10591(var_0) {
  if (isdefined(level._id_A841)) {
  foreach (var_2 in level._id_A841) {
  if ((!isdefined(var_2.team) || var_2.team == var_0.owner.team) && var_0 istouching(var_2))
  return 1;
  }

  return 0;
  }
  else
  return 1;
}

_id_105AC(var_0, var_1) {
  var_0.owner _meth_80F4(&"MP_JACKAL_EXIT");
}

_id_105B2(var_0, var_1, var_2) {
  if (gettime() - var_2 >= 2000) {
  var_3 = var_0 getentitynumber();
  var_1._id_A41D[var_3] = undefined;
  var_1._id_A41E[var_3] = undefined;
  var_4 = var_0.owner;

  if (_id_10579(var_0, var_4)) {
  var_5 = _id_10596(var_1, var_4);
  thread _id_10581(var_0, var_4, var_5);
  }
  }
}

_id_105AF(var_0, var_1) {
  if (isdefined(var_0.owner))
  var_0.owner _meth_80F3();
}

_id_105AB(var_0, var_1) {
  var_0._id_A83C = var_1;
}

_id_105AE(var_0, var_1) {
  var_0._id_A83C = undefined;
}

_id_10596(var_0, var_1) {
  if (isdefined(var_0._id_D42C)) {
  var_2 = var_1 _meth_8435();
  var_3 = var_2["radius"];
  var_4 = var_2["half_height"];

  foreach (var_6 in var_0._id_D42C) {
  if (isdefined(var_6._id_AA3B) && gettime() - var_6._id_AA3B < 10000)
  continue;

  if (capsuletracepassed(var_6.origin + (0, 0, var_4), var_3, var_4, var_1, 0, 1)) {
  var_6._id_AA3B = gettime();
  return var_6;
  }
  }
  }

  return undefined;
}

_id_10590(var_0) {
  var_1 = getentarray(var_0, "targetname");

  if (var_1.size > 0) {
  level._id_105ED = var_1;

  foreach (var_3 in var_1)
  _id_105E3(var_3);
  }
}

_id_1058F(var_0) {
  var_1 = getentarray(var_0, "targetname");
  level._id_105EC = var_1;

  if (var_1.size > 0) {
  foreach (var_3 in var_1)
  _id_105E3(var_3);
  }
}

_id_1057A(var_0) {
  if (var_0 _meth_81AD() || var_0 isonladder()) {
  var_0 iprintlnbold(&"MP_JACKAL_CANT_SUMMON");
  return 0;
  }

  if (isdefined(var_0._id_105E8) && gettime() - var_0._id_105E8 < 1000)
  return 0;

  if (level._id_A407._id_1C95) {
  foreach (var_2 in level._id_105EC) {
  if (var_0 istouching(var_2)) {
  var_0 iprintlnbold(&"MP_JACKAL_CANT_SUMMON");
  return 0;
  }
  }

  return 1;
  }
  else if (isdefined(level._id_105ED)) {
  foreach (var_2 in level._id_105ED) {
  if (_id_105DD(var_2, var_0))
  return 1;
  }
  }

  var_0 iprintlnbold(&"MP_JACKAL_CANT_SUMMON");
  return 0;
}

_id_105DD(var_0, var_1) {
  if (isdefined(var_0.team) && var_0.team != var_1.team)
  return 0;

  return var_1 istouching(var_0);
}

_id_105CF(var_0) {
  var_1 = var_0 geteye();
  var_2 = anglestoforward(var_0 getplayerangles());
  var_3 = var_1 + 500 * var_2;
  var_4 = physics_createcontents(["physicscontents_aiavoid", "physicscontents_solid", "physicscontents_structural"]);
  var_5 = physics_charactercast(var_1, var_3, var_0, 0, var_0.angles, var_4, var_0, "physicsquery_any");

  if (var_5) {
  var_0 iprintlnbold(&"MP_JACKAL_CANT_SUMMON");
  return;
  }

  var_6 = 332 * anglestoright(var_0.angles);
  var_7 = var_3 + var_6;
  var_8 = 350;
  var_5 = physics_getclosestpointtosphere(var_7, var_8, 0, var_4, undefined, "physicsquery_any");

  if (var_5) {
  var_7 = var_7 + (0, 0, var_8 + 1);
  var_5 = physics_getclosestpointtosphere(var_7, var_8, 0, var_4, undefined, "physicsquery_any");

  if (var_5) {
  var_0 iprintlnbold(&"MP_JACKAL_CANT_SUMMON");
  return;
  }
  }

  var_9 = _id_105CA(var_0, var_7, var_0.angles);
  _id_105B7(var_0, var_3, var_0.angles, 0.25);
  _id_105B5(var_9, var_0);
}

_id_10576(var_0, var_1) {
  level endon("game_ended");
  var_1 endon("death");
  var_1 endon("disconnect");
  var_2 = vectornormalize(var_1.origin - var_0.origin);
  var_3 = anglestoright(var_0.angles);
  var_4 = vectordot(var_2, var_3) > 0;

  if (!var_4)
  var_3 = -1 * var_3;

  var_5 = var_0 gettagorigin("j_cockpit");
  var_6 = var_5 + 64 * var_3;
  var_0 notify("playerReserved");
  _id_105B7(var_1, var_6, var_1.angles);

  if (isdefined(var_0))
  _id_105B5(var_0, var_1);
}

_id_105B7(var_0, var_1, var_2, var_3) {
  level endon("game_ended");

  if (!isdefined(var_3))
  var_3 = 0.375;

  var_4 = spawn("script_model", var_0.origin);
  var_4.angles = var_0.angles;
  var_4 setmodel("tag_origin");
  var_0._id_A40D = 1;
  var_0 _meth_823A(var_4, "tag_origin");
  var_5 = var_0 _meth_82C7(0);
  var_4 moveto(var_1, var_3, 0, 0);
  var_4 rotateto(var_2, 0.25 * var_3, 0.05 * var_3, 0);
  wait(var_3);

  if (isdefined(var_0)) {
  var_0 _meth_82C7(var_5);
  var_0 unlink();
  var_0._id_A40D = undefined;
  }

  var_4 delete();
}

_id_1057D(var_0) {
  var_1 = var_0._id_A9F2;
  var_0._id_A9F2 = undefined;

  if (isdefined(var_1) && !isdefined(var_1.owner))
  var_1 notify("spaceshipTimeout");
}

_id_1058E(var_0) {
  var_1 = getentarray(var_0, "targetname");

  if (var_1.size > 0) {
  level._id_105EB = var_1;

  foreach (var_3 in var_1) {
  _id_105E3(var_3);

  if (!isdefined(var_3._id_B4C9))
  var_3._id_B4C9 = 0.5;

  thread _id_105E5(var_3, ::_id_105AD, undefined, ::_id_105B0);
  }
  }
}

_id_105AD(var_0, var_1) {
  if (isdefined(var_0.owner))
  var_0 _meth_8476(var_1._id_B4C9);
}

_id_105B0(var_0, var_1) {
  if (isdefined(var_0.owner))
  var_0 _meth_8476(1.0);
}

_id_105E5(var_0, var_1, var_2, var_3) {
  level endon("game_ended");
  var_0 endon("disable");
  var_0._id_A41D = [];
  var_0._id_A41E = [];
  thread _id_105E4(var_0, var_2, var_3);

  for (;;) {
  var_0 waittill("trigger", var_4);

  if (!_id_10594(var_4, var_0))
  continue;

  var_5 = var_4 getentitynumber();
  var_0._id_A41E[var_5] = var_4;

  if (!isdefined(var_0._id_A41D[var_5])) {
  var_0._id_A41D[var_5] = gettime();

  if (isdefined(var_1))
  [[var_1]](var_4, var_0);
  }
  }
}

_id_105E4(var_0, var_1, var_2) {
  level endon("game_ended");
  var_0 endon("disable");

  for (;;) {
  wait 0.05;
  waittillframeend;

  foreach (var_6, var_4 in var_0._id_A41D) {
  var_5 = level._id_105E9[var_6];

  if (!isdefined(var_0._id_A41E[var_6])) {
  var_0._id_A41D[var_6] = undefined;

  if (isdefined(var_5) && isdefined(var_2))
  [[var_2]](var_5, var_0);

  continue;
  }

  if (isdefined(var_1))
  [[var_1]](var_5, var_0, var_4);
  }

  var_0._id_A41E = [];
  }
}

_id_105E3(var_0) {
  var_0._id_2699 = 0;

  if (!isdefined(var_0.script_noteworthy))
  return;

  var_1 = strtok(var_0.script_noteworthy, ",");

  foreach (var_3 in var_1) {
  var_4 = strtok(var_3, "=");

  switch (var_4[0]) {
  case "team":
  var_0.team = var_4[1];
  break;
  case "playerStarts":
  case "spawnpoints":
  var_0._id_D42C = scripts\engine\utility::_id_8180(var_4[1], "targetname");
  break;
  case "jackalStarts":
  var_0._id_A422 = scripts\engine\utility::_id_8180(var_4[1], "targetname");
  break;
  case "autouse":
  var_0._id_2699 = var_4[1] == "true";
  break;
  case "spawners":
  var_0._id_10879 = var_4[1];
  break;
  case "maxSpeed":
  var_0._id_B4C9 = float(var_4[1]);
  default:
  break;
  }
  }
}

_id_10594(var_0, var_1) {
  if (!_id_10592(var_0))
  return 0;

  if (!isdefined(var_0.owner))
  return 0;

  if (isdefined(var_1.team) && var_1.team != var_0.team)
  return 0;

  return 1;
}

_id_105B9(var_0, var_1, var_2, var_3, var_4) {
  var_5 = spawnfxforclient(scripts\engine\utility::_id_7ECB(var_2), var_1 geteye() + var_3, var_1);
  triggerfx(var_5);
  var_1 scripts\engine\utility::_id_13736(var_4, "death", "disconnect");
  var_5 delete();
}

_id_105BA(var_0, var_1) {
  var_0 endon("death");
  var_1 endon("exit_jackal");
  var_1 endon("disconnect");
  level endon("game_ended");

  for (;;) {
  var_2 = var_0 _meth_83E0();
  var_3 = lengthsquared(var_2);

  if (var_3 < 100) {
  var_4 = anglestoforward(var_0.angles);
  thread _id_105B9(var_0, var_1, "space_particles", var_4 * 300, 3.0);
  wait 0.75;
  continue;
  }

  var_4 = vectornormalize(var_2);
  thread _id_105B9(var_0, var_1, "space_particles", var_4 * 256, 1.0);
  wait 0.1;
  }
}

_id_10592(var_0) {
  return var_0.classname == "script_vehicle_jackal_mp" || var_0.classname == "script_vehicle" && var_0._id_01F1 == "veh_mil_air_ca_jackal_drone_atmos_periph_mp";
}

_id_105C1(var_0) {
  var_0 _id_0AE2::_id_E15E(var_0._id_AE7B);
  var_0 _id_0AE2::_id_E15E(var_0._id_AE7D);
}

_id_105C2(var_0) {
  var_0 _id_0AE2::_id_8397(var_0._id_AE7B, "primary");
  var_0 _id_0AE2::_id_8397(var_0._id_AE7D, "secondary");
}
