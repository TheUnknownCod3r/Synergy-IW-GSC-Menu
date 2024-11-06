/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2649.gsc
***************************************/

_id_4627() {
  _id_96E3();
  level thread _id_23D8();

  if (_id_0A77::_id_462B("guided_interaction"))
  level thread _id_23CB();
}

init() {
  scripts\engine\utility::_id_6E39("init_interaction_done");

  if (!scripts\engine\utility::_id_6E25("init_spawn_volumes_done"))
  scripts\engine\utility::_id_6E4C("init_spawn_volumes_done");

  level._id_9A43 = [];
  level._id_9A12 = [];
  level._id_1BEC = scripts\engine\utility::_id_8180("interaction", "targetname");
  level._id_4B88 = level._id_1BEC;
  level._id_9A46 = 0;
  level._id_13C1B = ::_id_502F;
  level._id_13C63 = ::_id_5030;
  level thread _id_9A3D();

  foreach (var_1 in level._id_4B88) {
  if (!isdefined(var_1.name))
  var_1.name = var_1.script_noteworthy;

  if (!isdefined(var_1._id_EE79))
  var_1._id_EE79 = "default";

  if (var_1._id_EE79 == "requires_power") {
  var_1._id_E1B9 = 1;
  var_1._id_D776 = 0;
  var_1._id_D71C = _id_7829(var_1);
  continue;
  }

  var_1._id_E1B9 = 0;
  var_1._id_D776 = 0;
  }

  level thread _id_5CF3();

  if (isdefined(level._id_768C))
  [[level._id_768C]]();

  if (isdefined(level._id_B326))
  [[level._id_B326]]();

  var_3 = getarraykeys(level._id_9A43);

  for (var_4 = 0; var_4 < var_3.size; var_4++) {
  if (isdefined(level._id_9A43[var_3[var_4]]._id_95F2))
  level thread [[level._id_9A43[var_3[var_4]]._id_95F2]]();

  scripts\engine\utility::waitframe();
  }

  scripts\engine\utility::_id_6E3E("init_interaction_done");

  foreach (var_6 in level.players) {
  var_7 = var_6 getcurrentweapon();

  if (isdefined(level._id_13BD3) && isdefined(var_7))
  self._id_13BE8 = [level._id_13BD3][var_7];
  }

  level thread _id_C00C();
  level thread _id_4616();
}

_id_5CF3() {
  if (!scripts\engine\utility::_id_6E34("wall_buy_setup_done"))
  scripts\engine\utility::_id_6E39("wall_buy_setup_done");

  if (!scripts\engine\utility::_id_6E25("wall_buy_setup_done"))
  scripts\engine\utility::_id_6E4C("wall_buy_setup_done");

  foreach (var_1 in level._id_1BEC) {
  if (isdefined(var_1._id_86A2) && var_1._id_86A2 == "locOverride")
  continue;

  var_2 = scripts\engine\utility::_id_5D14(var_1.origin, 10, -200);
  var_1.origin = var_2 + (0, 0, 1);
  wait 0.05;
  }
}

_id_7829(var_0) {
  var_1 = getentarray("spawn_volume", "targetname");

  foreach (var_3 in var_1) {
  if (ispointinvolume(var_0.origin, var_3)) {
  if (isdefined(var_3._id_28AB))
  return var_3._id_28AB;
  }
  }

  return undefined;
}

_id_96E3() {
  var_0 = getentarray("player_use_trigger", "targetname");

  foreach (var_2 in var_0) {
  var_2._id_93A8 = 0;
  var_2 scripts\engine\utility::_id_12778();
  }
}

_id_23CB() {
  level endon("game_ended");
  wait 5;

  for (;;) {
  var_0 = getentarray("interactionEnt", "targetname");

  foreach (var_2 in level.players) {
  if (!scripts\engine\utility::_id_9CEE(var_2._id_23DE)) {
  var_2._id_23DE = 1;
  var_3 = spawn("script_model", var_2.origin);
  var_2.guidedinteractionent = var_3;
  var_3 thread _id_DF3C(var_2);
  var_3 thread _id_BC88(var_2);
  var_2 setclientomnvar("zm_interaction_cost", -1);
  var_2 setclientomnvar("zm_interaction_ent", var_3);

  if (_id_0A77::_id_9F02() || level._id_C552) {
  var_2 thread _id_0D37::magic_wheel_tutorial();
  var_2 thread _id_0D4C::_id_59FA();
  }
  }
  }

  level waittill("player_spawned", var_2);
  }
}

_id_BC88(var_0) {
  level endon("game_ended");
  var_0 endon("disconnect");
  var_1 = undefined;
  var_2 = undefined;
  var_3 = -1;
  var_4 = 0;
  var_5 = squared(75);

  for (;;) {
  if (scripts\engine\utility::_id_9CEE(var_0._id_98F3) || scripts\engine\utility::_id_9CEE(var_0._id_101BF) || scripts\engine\utility::_id_9CEE(var_0._id_6F73)) {
  var_1 = undefined;
  _id_12E34(var_0, -1, undefined, undefined);
  }
  else if (!var_0 _id_0A77::_id_213E()) {
  var_1 = undefined;
  _id_12E34(var_0, -1, undefined, undefined);
  } else {
  var_6 = [];
  level._id_4B88 = scripts\engine\utility::_id_22BC(level._id_4B88);
  var_7 = scripts\engine\utility::_id_782F(var_0.origin, level._id_4B88, undefined, 10, 750, 1);

  foreach (var_9 in var_0._id_55BB)
  var_7 = scripts\engine\utility::array_remove(var_7, var_9);

  foreach (var_9 in var_7) {
  if (_id_9C64(var_0, var_9, var_1))
  var_6[var_6.size] = var_9;
  }

  if (scripts\engine\utility::_id_9CEE(var_0.resetguidedinteraction)) {
  var_1 = undefined;
  _id_12E34(var_0, -1, undefined, undefined);
  var_0.resetguidedinteraction = undefined;
  wait 0.05;
  continue;
  }

  var_6 = scripts\engine\utility::_id_22BC(var_6);
  var_6 = scripts\engine\utility::_id_22AF(var_6);

  if (var_6.size < 1) {
  var_1 = undefined;
  _id_12E34(var_0, -1, undefined, undefined);
  wait 0.05;
  continue;
  }

  var_6 = sortbydistance(var_6, var_0.origin);

  foreach (var_14 in var_6) {
  var_4 = 0;

  if (var_0 adsbuttonpressed()) {
  _id_12E34(var_0, -1, undefined, undefined);
  var_1 = undefined;

  while (var_0 adsbuttonpressed())
  wait 0.05;
  }

  if (distancesquared(var_0.origin, var_14.origin) <= var_5) {
  _id_12E34(var_0, -1, undefined, undefined);
  var_1 = undefined;
  continue;
  }
  else if (isdefined(var_1) && var_14 == var_1)
  break;
  else
  {
  var_2 = _id_7A4A(var_14, var_0);
  var_3 = _id_7A48(var_14, var_0);
  var_1 = var_14;
  var_4 = 1;
  break;
  }
  }

  if (var_4)
  _id_12E34(var_0, var_3, var_2, var_1);
  }

  wait 0.1;
  }
}

_id_7A4A(var_0, var_1) {
  var_2 = (0, 0, 68);
  var_3 = var_0.origin;

  if (_id_9A28(var_0)) {
  if (isdefined(var_0._id_0334)) {
  var_4 = scripts\engine\utility::_id_817E(var_0._id_0334, "targetname");

  if (isdefined(var_4))
  var_3 = var_4.origin;
  else
  var_3 = var_0.origin;
  }
  }
  else if (!isdefined(var_3))
  var_3 = var_0.origin;

  if (isdefined(level.guided_interaction_offset_func))
  var_2 = [[level.guided_interaction_offset_func]](var_0, var_1);
  else
  {
  var_5 = _id_7829(var_0);

  if (isdefined(var_0.name)) {
  var_6 = var_0.script_noteworthy;

  switch (var_6) {
  case "iw7_ripper_zmr":
  case "iw7_ripper_zm+ripperscope_zm":
  case "shooting_gallery":
  var_2 = (0, 0, 12);
  break;
  case "iw7_ake_zml":
  case "iw7_ake_zm":
  if (var_5 == "swamp_stage")
  var_2 = (0, 0, 12);

  break;
  case "zfreeze_semtex_mp":
  var_2 = (0, 0, 20);
  break;
  case "iw7_sonic_zmr":
  case "iw7_sonic_zm":
  if (var_5 == "moon")
  var_2 = (0, 0, 30);
  else
  var_2 = (0, 0, 56);

  break;
  default:
  var_2 = (0, 0, 56);
  }
  }
  }

  var_7 = scripts\engine\utility::_id_5D14(var_3, 12) + var_2;
  return var_7;
}

_id_7A48(var_0, var_1) {
  var_2 = 1;
  var_3 = int(level._id_9A43[var_0.script_noteworthy]._id_46A2);

  if (_id_9A28(var_0)) {
  if (var_1 _id_0A6B::_id_8BBB(var_0.script_noteworthy)) {
  var_4 = _id_0A77::_id_80D8(var_0.script_noteworthy);
  var_5 = var_1 _id_0A6B::_id_7D62(var_4);

  if (var_5 > 1)
  var_3 = 4500;
  else
  {
  var_2 = 0.5;
  var_3 = int(var_3 * var_2);
  }
  }
  else
  var_3 = int(var_3 * var_2);
  }
  else if (_id_9A29(var_0)) {
  var_6 = var_1 getcurrentweapon();

  if (var_1 _id_0A6B::_id_385F(var_6)) {
  var_5 = var_1 _id_0A6B::_id_7D62(var_6);
  var_3 = scripts\engine\utility::ter_op(var_5 > 1, 10000, 5000);
  }
  else
  var_3 = 0;

  if (scripts\engine\utility::_id_9CEE(level.has_picked_up_fuses) && !isdefined(level.placed_alien_fuses))
  var_3 = 0;
  }
  else if (_id_9CDB(var_0)) {
  if (isdefined(var_0.name) && !var_1 _id_3867(var_0))
  var_3 = 0;
  else if ((_id_0A77::_id_9F02() || level._id_C552) && isdefined(var_0.name) && var_0.name == "perk_machine_revive")
  var_3 = 500;
  else
  var_3 = _id_7B78(var_0);
  }
  else if (_id_9A1A(var_0)) {
  if (var_1._id_3A52 == 1)
  var_3 = level._id_732D;
  else
  var_3 = level._id_732C;
  }

  if (var_1 _id_0A77::_id_9BA0("next_purchase_free"))
  var_3 = 0;

  return var_3;
}

_id_9CDB(var_0) {
  if (!isdefined(var_0.name))
  return 0;

  if (var_0.name == "perk_machine_more" || var_0.name == "perk_machine_rat_a_tat" || var_0.name == "perk_machine_revive" || var_0.name == "perk_machine_run" || var_0.name == "perk_machine_smack" || var_0.name == "perk_machine_tough" || var_0.name == "perk_machine_flash" || var_0.name == "perk_machine_boom" || var_0.name == "perk_machine_fwoosh" || var_0.name == "perk_machine_deadeye" || var_0.name == "perk_machine_change" || var_0.name == "perk_machine_zap")
  return 1;

  return 0;
}

_id_7B78(var_0) {
  switch (var_0._id_CA4C) {
  case "perk_machine_zap":
  case "perk_machine_change":
  case "perk_machine_deadeye":
  case "perk_machine_fwoosh":
  case "perk_machine_boom":
  case "perk_machine_revive":
  return 1500;
  case "perk_machine_flash":
  return 3000;
  case "perk_machine_tough":
  return 2500;
  case "perk_machine_run":
  case "perk_machine_more":
  case "perk_machine_rat_a_tat":
  case "perk_machine_smack":
  return 2000;
  }
}

_id_9C64(var_0, var_1, var_2) {
  level endon("game_ended");
  var_0 endon("disconnect");

  if (!isdefined(var_1))
  return 0;

  var_3 = undefined;

  if (isdefined(var_1.name))
  var_3 = var_1.name;
  else
  return 0;

  if (scripts\engine\utility::_id_9CEE(var_1._id_C74D) || isdefined(var_1._id_4622))
  return 0;

  if (isdefined(var_1._id_CA4C) && var_1._id_CA4C == "perk_machine_revive" && var_0._id_F1E7 >= var_0.max_self_revive_machine_use)
  return 0;

  if (!_id_0A77::_id_462B("wall_buys")) {
  if (_id_9A28(var_1) || _id_9A1B(var_1) || _id_9A24(var_1) || interaction_is_chi_door(var_1) || isdefined(var_1._id_EE79) && var_1._id_EE79 == "tickets")
  return 0;
  }

  if (_id_9A1A(var_1)) {
  if (var_0._id_3A52 == 2)
  return 0;
  }

  if (var_3 == "secure_window" || var_3 == "white_ark" || var_3 == "wor_standee" || var_3 == "generator" || var_3 == "center_speaker_locs" || var_3 == "fourth_speaker" || var_3 == "ark_quest_station" || var_3 == "dj_quest_part_1" || var_3 == "dj_quest_part_2" || var_3 == "dj_quest_part_3" || var_3 == "dj_quest_door" || var_3 == "dj_quest_speaker" || var_3 == "lost_and_found" || var_3 == "fast_travel" || var_3 == "crafting_pickup" || var_3 == "pap_upgrade" || var_3 == "team_door" || var_3 == "neil_head" || var_3 == "neil_battery" || var_3 == "neil_repair" || var_3 == "neil_firmware" || var_3 == "barnstorming_group" || var_3 == "demon_group" || var_3 == "starmaster_group" || var_3 == "group_cosmicarc" || var_3 == "group_pitfall" || var_3 == "group_riverraid" || var_3 == "spider_arcade_group" || var_3 == "robottank_group" || var_3 == "gator_teeth_placement" || var_3 == "atm_withdrawal" && isdefined(level._id_2416) && level._id_2416 < 1000 || var_3 == "crafting_station" && !isdefined(var_0._id_4B5E))
  return 0;

  if (isdefined(level.guidedinteractionexclusion)) {
  if (![[level.guidedinteractionexclusion]](var_1, var_0, var_3))
  return 0;
  }

  if (scripts\engine\utility::_id_9CEE(var_1._id_E1B9) && !scripts\engine\utility::_id_9CEE(var_1._id_D776))
  return 0;

  if (isdefined(level._id_164B)) {
  if (var_3 == "pap_upgrade" || var_3 == "weapon_upgrade")
  return 1;
  else if (!self [[level._id_164B]](var_1.origin))
  return 0;
  }

  var_4 = var_1.origin;

  if (isdefined(level.guidedinteractionendposoverride))
  var_4 = [[level.guidedinteractionendposoverride]](var_0, var_1);

  if (!scripts\engine\utility::within_fov(var_0.origin, var_0.angles, var_4, cos(25)))
  return 0;

  if (_id_9A18(var_1) || interaction_is_chi_door(var_1)) {
  var_5 = _id_7C82(0, undefined, var_0);

  foreach (var_7 in var_5) {
  var_8 = var_7 _id_77D3();

  foreach (var_10 in var_8) {
  if (ispointinvolume(var_1.origin, var_10))
  return 0;
  }
  }
  }

  var_13 = physics_createcontents(["physicscontents_clipshot", "physicscontents_corpseclipshot", "physicscontents_missileclip", "physicscontents_solid"]);

  if (var_1.script_noteworthy == "trap_hydrant")
  var_4 = var_1.origin + (0, 0, 50);

  if (scripts\engine\trace::_id_DCF1(var_0 geteye(), var_4, [var_0], var_13))
  return 1;
  else
  return 0;
}

_id_77D3() {
  if (isdefined(level._id_186E[self._id_28AB])) {
  var_0 = [];

  foreach (var_2 in level._id_186E[self._id_28AB])
  var_0[var_0.size] = level._id_10817[var_2];

  return var_0;
  }

  return [];
}

_id_9C0F(var_0) {
  if (!isdefined(var_0))
  return 0;

  if (!isdefined(var_0._id_186E))
  return 0;

  foreach (var_2 in var_0._id_186E) {
  if (!var_2._id_0019)
  continue;

  if (self istouching(var_2))
  return 1;
  }

  return 0;
}

_id_7C82(var_0, var_1, var_2) {
  if (isdefined(level._id_7C80))
  return [[level._id_7C80]]();

  var_3 = [];
  var_4 = level._id_10816;

  foreach (var_6 in var_4) {
  if (!var_6._id_0019)
  continue;

  var_7 = 0;

  if (isdefined(var_1) && !var_2 _id_0A77::_id_9D05())
  continue;

  if (var_2 istouching(var_6))
  var_7 = 1;
  else if (scripts\engine\utility::_id_9CEE(var_0) && var_2 _id_9C0F(var_6))
  var_7 = 1;

  if (var_7)
  var_3[var_3.size] = var_6;
  }

  return var_3;
}

_id_12E34(var_0, var_1, var_2, var_3) {
  if (!isdefined(var_1))
  var_1 = -1;

  if (isdefined(var_2) && var_2 != self.origin) {
  var_0 setclientomnvar("zm_interaction_cost", -1);
  wait 0.1;
  self dontinterpolate();
  self.origin = var_2;
  wait 0.1;
  }

  if (isdefined(var_3) && var_3._id_EE79 == "tickets")
  var_1 = 2;

  var_0 setclientomnvar("zm_interaction_cost", var_1);
}

_id_79D0(var_0) {
  foreach (var_2 in var_0) {
  if (!scripts\engine\utility::_id_9CEE(var_2._id_93A8)) {
  var_2._id_93A8 = 1;
  var_2 setmodel("tag_origin");
  return var_2;
  }
  }
}

_id_DF3C(var_0) {
  var_0 waittill("disconnect");
  self._id_93A8 = 0;
  self notify("interaction_ent_released");
}

_id_23D8() {
  level endon("game_ended");

  for (;;) {
  level waittill("player_spawned", var_0);
  var_0._id_9A3F = _id_7B99();

  if (!isdefined(var_0._id_9A3F))
  break;

  _id_E1F8();

  if (!isdefined(var_0._id_9A3F))
  iprintlnbold("NO TRIGGER FOUND!");

  var_0._id_A8D3 = undefined;
  var_0._id_9A3F makeunusable();
  var_0 thread _id_DF3F();
  var_0 thread _id_D103();
  var_0 thread _id_D104();
  }
}

_id_D104() {
  self endon("disconnect");
  self endon("death");

  for (;;) {
  scripts\engine\utility::waittill_any("weapon_switch_started", "weapon_change", "weaponchange");
  self._id_A8D3 = undefined;
  self.resetguidedinteraction = 1;
  self notify("stop_interaction_logic");
  }
}

_id_7B99() {
  var_0 = getentarray("player_use_trigger", "targetname");
  var_1 = undefined;

  foreach (var_3 in var_0) {
  if (!var_3._id_93A8) {
  var_3._id_93A8 = 1;
  var_3 scripts\engine\utility::_id_1277A();
  return var_3;
  }
  }

  return undefined;
}

_id_DF3F() {
  var_0 = self._id_9A3F;
  scripts\engine\utility::waittill_any("death", "disconnect");
  var_0._id_93A8 = 0;
}

_id_DEBB(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8) {
  var_9 = spawnstruct();
  var_9.name = var_0;
  var_9._id_8FFA = var_3;
  var_9._id_109DA = var_1;
  var_9._id_12AA2 = var_2;
  var_9._id_161A = var_4;
  var_9._id_6261 = 1;

  if (!isdefined(var_5))
  var_5 = 0;

  var_9._id_46A2 = var_5;

  if (isdefined(var_6))
  var_9._id_E1B9 = var_6;
  else
  var_9._id_E1B9 = 0;

  var_9._id_95F2 = var_7;
  var_9._id_3865 = var_8;
  level._id_9A43[var_0] = var_9;
}

_id_15BC(var_0, var_1) {
  level thread [[level._id_9A43[var_0]._id_161A]](var_1);
}

_id_E1F8() {
  foreach (var_1 in level.players) {
  if (isdefined(var_1._id_9A3F))
  _id_8E90(var_1);
  }
}

_id_8E90(var_0) {
  foreach (var_2 in level.players) {
  if (var_2 == var_0) {
  var_0._id_9A3F enableplayeruse(var_0);
  continue;
  }

  var_0._id_9A3F disableplayeruse(var_2);
  }
}

_id_13D07(var_0, var_1) {
  for (;;) {
  thread scripts\engine\utility::_id_5B44(var_1, 0.1, (1, 0, 0), 1, 0.1);
  wait 0.1;
  }
}

_id_D103() {
  self notify("player_interaction_monitor");
  self endon("player_interaction_monitor");
  self endon("disconnect");
  self endon("death");

  while (!isdefined(level._id_4B88))
  wait 1;

  if (isdefined(level._id_D103)) {
  self thread [[level._id_D103]]();
  return;
  }
}

_id_6EB9() {
  self endon("window_trap_placed");
  self endon("death");

  if (!isdefined(self._id_BF46))
  self._id_BF46 = gettime() + 2500;
  else if (gettime() < self._id_BF46)
  return;

  self._id_BF46 = gettime() + 2500;
  self setclientomnvar("zom_crafted_weapon", 0);
  wait 0.5;
  self setclientomnvar("zom_crafted_weapon", 8);
  wait 1.5;
}

_id_3863(var_0) {
  if (!isdefined(var_0))
  return 0;

  if (scripts\engine\utility::_id_9CEE(self._id_9D81))
  return 0;

  if (scripts\engine\utility::_id_9CEE(var_0._id_55BA) || !_id_0A77::_id_213E() || self _meth_84D9())
  return 0;

  if (self secondaryoffhandbuttonpressed() || self _meth_81C6() || self fragbuttonpressed())
  return 0;

  if (!self isonground())
  return 0;

  if (var_0.script_noteworthy == "game_race" && distancesquared(self.origin, var_0.origin) > 576)
  return 0;

  if (var_0.script_noteworthy == "ritual_stone" && scripts\engine\utility::_id_9CEE(self._id_DCEB))
  return 0;

  return 1;
}

_id_E1F6() {
  if (isdefined(self._id_9A3F.name))
  _id_0D45::_id_AF74(self._id_9A3F.name, 0);

  wait 0.2;
  self notify("stop_interaction_logic");
  self._id_9A3F makeunusable();
  self._id_A8D3 = undefined;
  self setclientomnvar("zm_tutorial_num", 0);
}

_id_F421(var_0, var_1) {
  if (scripts\engine\utility::_id_9CEE(self._id_9A3F._id_55F3))
  return;

  self._id_9A3F dontinterpolate();
  self._id_A8D3 = var_0;
  var_2 = self geteye();
  self._id_9A3F.origin = (var_0.origin[0], var_0.origin[1], var_2[2]);

  if (!isdefined(level._id_9A43[var_0.script_noteworthy]._id_109DA))
  level._id_9A43[var_0.script_noteworthy]._id_109DA = "null";

  var_3 = level._id_9A43[var_0.script_noteworthy]._id_109DA;
  var_4 = undefined;

  if (_id_0A77::_id_9F02() || level._id_C552) {
  if (var_3 == "wall_buy")
  var_4 = _id_0A57::_id_79FC("wall_buy");

  if (!scripts\engine\utility::_id_9CEE(var_4)) {
  if (isdefined(level._id_9A43[var_0.script_noteworthy]._id_12AA2))
  thread _id_0A57::_id_12AAE(var_3);
  }
  }

  if (_id_9A28(var_0)) {
  if (!_id_0A6B::_id_8BBB(var_0.script_noteworthy)) {
  var_5 = _id_8228(var_0.script_noteworthy);
  var_6 = _id_8220(var_0.script_noteworthy);
  self._id_9A3F _meth_852E(var_5, var_6);
  }
  }
  else if (_id_9A29(var_0)) {
  var_7 = self getcurrentweapon();
  var_5 = _id_8228(var_7);

  if (_id_0A6B::_id_385F(var_7)) {
  if (isdefined(var_5)) {
  var_8 = _id_0A6B::_id_7D62(var_7);
  var_6 = scripts\engine\utility::ter_op(var_8 > 1, int(10000), int(5000));
  self._id_9A3F _meth_852E(var_5, var_6);
  }
  }
  else if (isdefined(var_5))
  self._id_9A3F _meth_852E(var_5);
  }
  else if (_id_9A16(var_0)) {
  if (!isdefined(self._id_4B5E)) {
  level thread [[level._id_9A43[var_0.script_noteworthy]._id_161A]](var_0, self);
  _id_9A34(var_0);
  self notify("new_power", "souvenir_pickup");

  if (_id_0A77::map_check(0))
  thread _id_0A6A::_id_1769("nag_use_souvenircoin", "zmb_comment_vo", 60, 180, 6, 1);

  return;
  }

  self._id_9A3F.origin = var_0.origin;
  }
  else if (_id_9A26(var_0))
  self._id_9A3F.origin = (var_0.origin[0], var_0.origin[1], var_2[2] - 15);
  else if (_id_9A15(var_0) && var_0.script_noteworthy == "atm_withdrawal")
  self._id_9A3F _meth_852E(level._id_2416);
  else if (_id_9A1A(var_0)) {
  if (self._id_3A52 == 1)
  self._id_9A3F _meth_852E(level._id_732D);
  else
  self._id_9A3F _meth_852E(level._id_732C);
  }
  else if (var_0.script_noteworthy == "spawned_essence")
  self._id_9A3F.origin = var_0.origin;

  _id_F422(self._id_9A3F, var_0);

  if (!isdefined(var_1))
  thread _id_135DF(var_0);

  self._id_9A3F makeusable();
}

_id_8228(var_0) {
  if (!isdefined(var_0))
  return undefined;

  var_1 = _id_0A77::_id_7DF7(var_0);

  if (!isdefined(var_1))
  return undefined;

  switch (var_1) {
  case "iw7_udm45":
  return &"CP_ZMB_WEAPONS_UDM45";
  case "iw7_rvn":
  return &"CP_ZMB_WEAPONS_RVN";
  case "iw7_ake":
  return &"CP_ZMB_WEAPONS_AKE";
  case "iw7_lmg03":
  return &"CP_ZMB_WEAPONS_LMG03";
  case "iw7_ar57":
  return &"CP_ZMB_WEAPONS_AR57";
  case "iw7_arclassic":
  return &"CP_ZMB_WEAPONS_ARCLASSIC";
  case "iw7_axe":
  return &"CP_ZMB_WEAPONS_AXE";
  case "iw7_lockon":
  return &"CP_ZMB_WEAPONS_LOCKON";
  case "iw7_chargeshot":
  return &"CP_ZMB_WEAPONS_CHARGESHOT";
  case "iw7_cheytacc":
  return &"CP_ZMB_WEAPONS_CHEYTACC";
  case "iw7_cheytac":
  return &"CP_ZMB_WEAPONS_CHEYTAC";
  case "iw7_crb":
  return &"CP_ZMB_WEAPONS_CRB";
  case "iw7_devastator":
  return &"CP_ZMB_WEAPONS_DEVASTATOR";
  case "iw7_dischord":
  return &"CP_ZMB_WEAPONS_DISCHORD";
  case "iw7_emc":
  return &"CP_ZMB_WEAPONS_EMC";
  case "iw7_erad":
  return &"CP_ZMB_WEAPONS_ERAD";
  case "iw7_facemelter":
  return &"CP_ZMB_WEAPONS_FACE_MELTER";
  case "iw7_fhr":
  return &"CP_ZMB_WEAPONS_FHR";
  case "iw7_fmg":
  return &"CP_ZMB_WEAPONS_FMG";
  case "iw7_forgefreeze":
  return &"CP_ZMB_WEAPONS_FORGE_FREEZE";
  case "iw7_g18c":
  return &"CP_ZMB_WEAPONS_G18C";
  case "iw7_g18":
  return &"CP_ZMB_WEAPONS_G18";
  case "iw7_glprox":
  return &"CP_ZMB_WEAPONS_GLPROX";
  case "iw7_headcutter":
  return &"CP_ZMB_WEAPONS_HEAD_CUTTER";
  case "iw7_kbs":
  return &"CP_ZMB_WEAPONS_KBS";
  case "iw7_m1":
  return &"CP_ZMB_WEAPONS_M1";
  case "iw7_m1c":
  return &"CP_ZMB_WEAPONS_M1C";
  case "iw7_m4":
  return &"CP_ZMB_WEAPONS_M4";
  case "iw7_m8":
  return &"CP_ZMB_WEAPONS_M8";
  case "iw7_mauler":
  return &"CP_ZMB_WEAPONS_MAULER";
  case "iw7_nrg":
  return &"CP_ZMB_WEAPONS_NRG";
  case "iw7_revolver":
  return &"CP_ZMB_WEAPONS_REVOLVER";
  case "iw7_ripper":
  return &"CP_ZMB_WEAPONS_RIPPER";
  case "iw7_sdfar":
  return &"CP_ZMB_WEAPONS_SDFAR";
  case "iw7_sdflmg":
  return &"CP_ZMB_WEAPONS_SDFLMG";
  case "iw7_sdfshotty":
  return &"CP_ZMB_WEAPONS_SDFSHOTTY";
  case "iw7_shredder":
  return &"CP_ZMB_WEAPONS_SHREDDER";
  case "iw7_sonic":
  return &"CP_ZMB_WEAPONS_SONIC";
  case "iw7_spasc":
  return &"CP_ZMB_WEAPONS_SPASC";
  case "iw7_spas":
  return &"CP_ZMB_WEAPONS_SPAS";
  case "iw7_steeldragon":
  return &"CP_ZMB_WEAPONS_STEEL_DRAGON";
  case "iw7_ump45c":
  return &"CP_ZMB_WEAPONS_UMP45C";
  case "iw7_ump45":
  return &"CP_ZMB_WEAPONS_UMP45";
  case "iw7_vr":
  return &"CP_ZMB_WEAPONS_VR";
  case "iw7_crdb":
  return &"CP_ZMB_WEAPONS_CRDB";
  case "iw7_minilmg":
  return &"CP_ZMB_WEAPONS_MINILMG";
  case "iw7_mp28":
  return &"CP_ZMB_WEAPONS_MP28";
  case "iw7_mod2187":
  return &"CP_ZMB_WEAPONS_MOD2187";
  case "iw7_ba50cal":
  return &"CP_ZMB_WEAPONS_BA50CAL";
  case "iw7_longshot":
  return &"CP_ZMB_WEAPONS_LONGSHOT";
  case "iw7_cutie":
  case "iw7_cutie_zm":
  return &"CP_ZMB_WEAPONS_MAD";
  default:
  if (isdefined(level.custom_weaponnamestring_func)) {
  return [[level.custom_weaponnamestring_func]](var_1, var_0);
  return;
  }

  return &"CP_ZMB_WEAPONS_GENERIC";
  return;
  }
}

_id_8220(var_0) {
  return int(level._id_9A43[var_0]._id_46A2);
}

_id_F422(var_0, var_1) {
  var_2 = _id_7A49(var_1, self);

  if (isdefined(var_2))
  self._id_9A3F sethintstring(var_2);

  if (_id_9A28(var_1)) {
  if (isdefined(var_2) && !isstring(var_2) && var_2 == &"COOP_INTERACTIONS_PURCHASE_AMMO") {
  var_3 = _id_0A77::_id_80D8(var_1.script_noteworthy);
  var_4 = _id_0A6B::_id_7D62(var_3);
  var_5 = _id_8228(var_1.script_noteworthy);

  if (var_4 > 1)
  self._id_9A3F _meth_852E(int(4500), var_5);
  else
  self._id_9A3F _meth_852E(int(0.5 * level._id_9A43[var_1.script_noteworthy]._id_46A2), var_5);
  }
  }
  else if (interactionislostandfound(var_1) && scripts\engine\utility::_id_9CEE(self._id_8C46)) {
  if (isdefined(self._id_B0A2) && self._id_B0A2 == var_1)
  _id_F474(self);
  }
  else if (_id_9A2B(var_1) || _id_9A19(var_1) || _id_9A1C(var_1) || _id_9A1E(var_1) || _id_9A29(var_1) || _id_9A16(var_1)) {
  self._id_9A3F _meth_83D6(0);
  self._id_9A3F _meth_84A5(360);
  }
  else if (var_1.script_noteworthy == "coaster") {
  self._id_9A3F _meth_83D6(1);
  self._id_9A3F _meth_84A5(245);
  }
  else if (var_1.script_noteworthy == "dj_quest_speaker_mid" || var_1.script_noteworthy == "dj_quest_speaker") {
  self._id_9A3F _meth_83D6(0);
  self._id_9A3F _meth_84A5(360);
  }
  else if (var_1.script_noteworthy == "spawned_essence") {
  self._id_9A3F _meth_83D6(1);
  self._id_9A3F _meth_84A5(360);
  }
  else if (var_1.script_noteworthy == "dj_quest_part_1" || var_1.script_noteworthy == "dj_quest_part_2" || var_1.script_noteworthy == "dj_quest_part_3") {
  self._id_9A3F _meth_83D6(0);
  self._id_9A3F _meth_84A5(245);
  } else {
  self._id_9A3F _meth_83D6(1);
  self._id_9A3F _meth_84A5(160);
  }

  if (isdefined(level.interaction_trigger_properties_func))
  [[level.interaction_trigger_properties_func]](var_0, var_1, var_2);
}

_id_F474(var_0) {
  if (isdefined(var_0._id_B0A1)) {
  var_1 = [];

  foreach (var_3 in var_0._id_B0A1) {
  if (_id_0A77::_id_9F7C(var_3, "alt_"))
  continue;

  if (!scripts\engine\utility::array_contains(var_1, var_3))
  var_1 = scripts\engine\utility::_id_2279(var_1, var_3);
  }

  if (var_1.size > 2) {
  var_5 = _id_8228(var_1[1]);
  var_6 = _id_8228(var_1[2]);
  var_0._id_9A3F _meth_852E(var_5, var_6);
  } else {
  var_5 = _id_8228(var_1[1]);
  var_0._id_9A3F _meth_852E(var_5);
  }
  }
}

_id_7A49(var_0, var_1) {
  if (isdefined(level._id_9A43[var_0.script_noteworthy]._id_8FFA))
  return [[level._id_9A43[var_0.script_noteworthy]._id_8FFA]](var_0, var_1);

  if (isdefined(var_0._id_4622))
  return &"COOP_INTERACTIONS_COOLDOWN";

  if (var_0._id_E1B9 && !var_0._id_D776)
  return &"COOP_INTERACTIONS_REQUIRES_POWER";

  if (_id_9A28(var_0)) {
  if (!_id_0A77::_id_462B("wall_buys"))
  return undefined;
  }

  if (_id_9A17(var_0)) {
  if (!isdefined(var_1._id_4B5E) && var_0._id_269F > 0)
  return level._id_9A12["crafting_nopiece"];
  }

  if (_id_9A16(var_0))
  return level._id_9A12["crafting_item_swap"];

  return level._id_9A12[var_0.script_noteworthy];
}

_id_C00C() {
  self endon("game_ended");

  for (;;) {
  level waittill("player_accessed_nonpowered_interaction", var_0);
  var_0 thread _id_0A6A::_id_12885("no_power", "zmb_comment_vo", "high", 30, 0, 0, 1, 50);
  }
}

_id_4616() {
  self endon("game_ended");

  for (;;) {
  level waittill("player_accessed_interaction_on_cooldown", var_0);
  var_0 thread _id_0A6A::_id_12885("round_cooldown", "zmb_comment_vo", "high", 30, 0, 0, 1, 50);
  }
}

_id_135DF(var_0) {
  if (isdefined(level.wait_for_interaction_func))
  self thread [[level.wait_for_interaction_func]](var_0);
}

_id_CE96(var_0, var_1) {
  var_2 = var_0.script_noteworthy;
  var_3 = getweaponbasename(var_2);

  switch (var_3) {
  case "iw7_cutie_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_wonder", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_nunchucks_zm":
  var_1 thread _id_0A6A::_id_12885("magicwheel_nunchucks", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_katana_zm":
  if (randomint(100) > 50)
  var_1 thread _id_0A6A::_id_12885("player_purchase_wonder", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  else
  var_1 thread _id_0A6A::_id_12885("magicwheel_katana", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);

  break;
  case "iw7_harpoon4_zm":
  case "iw7_harpoon3_zm":
  case "iw7_harpoon2_zm":
  case "iw7_harpoon1_zm":
  case "iw7_harpoon_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_wonder", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_ake_zml":
  case "iw7_ake_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_assault", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_lmg03_zm":
  case "iw7_ameli_zm":
  var_1 thread _id_0A6A::_id_12885("purchase_weapon", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_ar57_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_assault", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_axe_zm_pap2":
  case "iw7_axe_zm_pap1":
  case "iw7_axe_zm":
  var_1 thread _id_0A6A::_id_12885("purchase_weapon", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_chargeshot_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_launcher", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_cheytac_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_sniper", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_crb_zml":
  case "iw7_crb_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_smg", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_devastator_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_shotgun", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_dischord_zm_pap1":
  case "iw7_dischord_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_wonder", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_emc_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_pistol", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_erad_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_smg", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_facemelter_zm_pap1":
  case "iw7_facemelter_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_wonder", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_fhr_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_smg", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_fmg_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_smg", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_forgefreeze_zm_pap2":
  case "iw7_forgefreeze_zm_pap1":
  case "iw7_forgefreeze_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_wonder", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_g18_zmr":
  case "iw7_g18_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_pistol", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_lockon_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_launcher", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_glprox_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_launcher", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_headcutter_zm_pap1":
  case "iw7_headcutter_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_wonder", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_kbs_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_sniper", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_m1c_zm":
  case "iw7_m1_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_sniper", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_m4_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_assault", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_m8_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_assault", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_mauler_zm":
  var_1 thread _id_0A6A::_id_12885("purchase_weapon", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_nrg_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_pistol", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_revolver_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_pistol", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_ripper_zm":
  case "iw7_ripper_zmr":
  var_1 thread _id_0A6A::_id_12885("player_purchase_smg", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_sdfar_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_assault", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_sdflmg_zm":
  var_1 thread _id_0A6A::_id_12885("purchase_weapon", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_sdfshotty_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_shotgun", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_shredder_zm_pap1":
  case "iw7_shredder_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_wonder", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_sonic_zmr":
  case "iw7_sonic_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_shotgun", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_spas_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_shotgun", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_steeldragon_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_wonder", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_ump45_zml":
  var_1 thread _id_0A6A::_id_12885("player_purchase_smg", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  case "iw7_spasc_zm":
  var_1 thread _id_0A6A::_id_12885("player_purchase_shotgun", "zmb_comment_vo", "low", 10, 0, 1, 0, 40);
  break;
  }
}

_id_383D(var_0) {
  var_1 = self _meth_8173();
  var_2 = undefined;
  var_3 = undefined;
  var_4 = _id_0A77::_id_80D8(var_0);

  foreach (var_6 in var_1) {
  var_3 = _id_0A77::_id_80D8(var_6);

  if (var_3 == var_4) {
  var_2 = var_6;
  break;
  }
  }

  if (isdefined(var_2)) {
  var_8 = self getweaponammostock(var_2);
  var_9 = weaponmaxammo(var_2);
  var_10 = _id_0CFF::_id_D876();
  var_11 = int(var_10 * var_9);

  if (var_8 < var_11)
  return 1;
  else if (weaponmaxammo(var_2) == weaponclipsize(var_2) && self getweaponammoclip(var_2) < weaponclipsize(var_2))
  return 1;
  else
  return 0;
  }

  return 1;
}

_id_9A33(var_0) {
  self endon("disconnect");

  if (_id_9A18(var_0))
  return;

  if (_id_9A15(var_0))
  return;

  _id_0A77::_id_1C5D(0);
  wait 1.5;

  if (!_id_0A77::_id_213E())
  _id_0A77::_id_1C5D(1);
}

_id_50FA() {
  wait 0.25;
  self._id_127BA = undefined;
}

_id_E019(var_0) {
  if (scripts\engine\utility::array_contains(level._id_4B88, var_0))
  level._id_4B88 = scripts\engine\utility::array_remove(level._id_4B88, var_0);
}

_id_175C(var_0) {
  if (!scripts\engine\utility::array_contains(level._id_4B88, var_0))
  level._id_4B88 = scripts\engine\utility::_id_2279(level._id_4B88, var_0);
}

_id_E01A(var_0, var_1) {
  var_1._id_55BB = scripts\engine\utility::_id_2279(var_1._id_55BB, var_0);
}

_id_175D(var_0, var_1) {
  var_1._id_55BB = scripts\engine\utility::array_remove(var_1._id_55BB, var_0);
}

_id_383E(var_0, var_1, var_2, var_3) {
  if (isdefined(var_0._id_EE04) && var_0._id_EE04 == "afterlife")
  return 1;

  if (_id_0D12::_id_9DDF(self))
  return 0;

  if (isdefined(var_1))
  var_4 = var_1;
  else
  var_4 = level._id_9A43[var_0.script_noteworthy]._id_46A2;

  if (_id_9A1A(var_0)) {
  switch (self._id_3A52) {
  case 0:
  var_4 = level._id_732C;
  break;
  case 1:
  var_4 = level._id_732D;
  break;
  }
  }
  else if (_id_9A29(var_0) && !_id_0A6B::_id_385F(self getcurrentweapon())) {
  if (scripts\engine\utility::_id_9CEE(level.has_picked_up_fuses) && !isdefined(level.placed_alien_fuses))
  return 1;
  else
  return 0;
  }
  else if (_id_9A1D(var_0)) {
  if ((_id_0A77::_id_9F02() || level._id_C552) && var_0._id_CA4C == "perk_machine_revive" && !_id_0A77::_id_8BBE("perk_machine_revive") && self._id_F1E7 >= self.max_self_revive_machine_use)
  return 0;
  }
  else if (_id_9A22(var_0)) {
  var_5 = 0;

  switch (var_0._id_EEA9) {
  case "moon":
  if (!isdefined(level._id_BB11) || level._id_BB11 < 3)
  var_5 = 1;

  break;
  case "kepler":
  if (!isdefined(level._id_A585) || level._id_A585 < 3)
  var_5 = 1;

  break;
  case "triton":
  if (!isdefined(level._id_127FE) || level._id_127FE < 3)
  var_5 = 1;

  break;
  }

  if (!var_5)
  return 0;
  }
  else if (interaction_is_chi_door(var_0)) {
  switch (var_0.script_noteworthy) {
  case "chi_0":
  if (var_1 != 0)
  break;

  if (!isdefined(level.kungfu_weapons) || !isdefined(scripts\engine\utility::_id_2291(level.kungfu_weapons[0], var_3)))
  break;

  return 1;
  case "chi_1":
  if (var_1 != 1)
  break;

  if (!isdefined(level.kungfu_weapons) || !isdefined(scripts\engine\utility::_id_2291(level.kungfu_weapons[1], var_3)))
  break;

  return 1;
  case "chi_2":
  if (var_1 != 2)
  break;

  if (!isdefined(level.kungfu_weapons) || !isdefined(scripts\engine\utility::_id_2291(level.kungfu_weapons[2], var_3)))
  break;

  return 1;
  }

  return 0;
  }
  else if (_id_9A28(var_0)) {
  var_6 = var_0.script_noteworthy;

  if (var_0._id_EE79 == "tickets") {
  if (self hasweapon(var_6))
  return 0;

  self._id_A035 = var_0.script_noteworthy;
  level._id_12631 = randomint(100);
  _id_0D45::_id_AF75(level._id_13BD3, self._id_A035, level._id_12631);
  }

  var_7 = weaponmaxammo(var_0.script_noteworthy);
  var_8 = _id_0CFF::_id_D876();
  var_9 = int(var_8 * var_7);
  var_10 = self getweaponammostock(var_6);

  if (var_10 >= var_9)
  return 0;
  }

  if (var_0._id_EE79 == "tickets") {
  if (self._id_C206 >= var_4)
  return 1;

  return 0;
  }

  if (_id_0A63::_id_D0BB(var_4, var_2))
  return 1;

  return 0;
}

_id_11449(var_0, var_1) {
  _id_0A63::_id_11445(var_0, 1, var_1);
}

_id_FF5A(var_0) {
  if (!isdefined(var_0)) {}

  switch (var_0) {
  case "wondercard_machine":
  case "bleedoutPenalty":
  case "atm":
  return 0;
  default:
  return 1;
  }
}

_id_5030(var_0, var_1) {}

_id_7DBA(var_0, var_1) {
  var_2 = level._id_9A43[var_0.script_noteworthy]._id_46A2;
  var_3 = _id_0A77::_id_80D8(var_0.script_noteworthy);
  var_4 = var_1 getcurrentweapon();
  var_5 = _id_0A77::_id_7DF7(var_4);
  var_6 = weaponmaxammo(var_4);
  var_7 = var_1 _id_0CFF::_id_D876();
  var_8 = int(var_7 * var_6);
  var_9 = var_1 getweaponammostock(var_4);
  var_10 = self _meth_8173();

  foreach (var_12 in var_10) {
  var_13 = _id_0A77::_id_80D8(var_12);

  if (var_13 == _id_0A77::_id_80D8(var_0.script_noteworthy)) {
  var_14 = var_12;
  var_9 = self getweaponammostock(var_14);
  var_6 = weaponmaxammo(var_14);
  var_8 = int(var_7 * var_6);
  }
  }

  if (var_0._id_EE79 == "tickets")
  return level._id_9A12[var_0.script_noteworthy];

  switch (var_2) {
  case 250:
  return &"CP_ZMB_INTERACTIONS_TICKETS_AMMO";
  case 1500:
  case 1250:
  case 1000:
  case 500:
  return &"COOP_INTERACTIONS_PURCHASE_AMMO";
  default:
  return &"COOP_INTERACTIONS_PURCHASE_AMMO";
  }
}

_id_502F(var_0, var_1) {
  if (var_1 _id_0A6B::_id_8BBB(var_0.script_noteworthy))
  return _id_7DBA(var_0, var_1);

  return undefined;
}

_id_9A3D() {
  level endon("game_ended");

  for (;;) {
  level waittill("interaction", var_0, var_1, var_2);

  switch (var_0) {
  case "wall_buy":
  if (isdefined(var_2._id_DB02)) {
  if (soundexists("purchase_ammo"))
  var_2 playlocalsound("purchase_ammo");
  }
  else if (soundexists("purchase_weapon"))
  var_2 playlocalsound("purchase_weapon");

  break;
  case "purchase":
  var_3 = _id_7A4B(var_1, var_2);

  if (isdefined(var_3) && soundexists(var_3))
  var_2 playlocalsound(var_3);

  break;
  case "purchase_denied":
  if (var_1.name == "jaroslav_machine" && soundexists("ui_consumable_purchase_deny"))
  var_2 playlocalsound("ui_consumable_purchase_deny");
  else if (var_1.name == "lost_and_found" && soundexists("lost_and_found_deny"))
  var_2 playlocalsound("lost_and_found_deny");
  else if (soundexists("trap_control_panel_deny") && var_1.name == "beamtrap" || var_1.name == "interaction_discoballtrap" || var_1.name == "scrambler" || var_1.name == "blackhole_trap" || var_1.name == "rockettrap")
  var_2 playlocalsound("trap_control_panel_deny");
  else if (soundexists("purchase_deny"))
  var_2 playlocalsound("purchase_deny");

  break;
  }
  }
}

_id_7A4B(var_0, var_1) {
  var_2 = [];

  switch (var_0.name) {
  case "secure_window":
  return undefined;
  case "lost_and_found":
  var_2 = ["lost_and_found_purchase"];
  break;
  case "rockettrap":
  case "blackhole_trap":
  case "scrambler":
  case "interaction_discoballtrap":
  case "beamtrap":
  var_2 = ["trap_control_panel_purchase"];
  break;
  case "sliding_door":
  case "debris":
  var_2 = ["purchase_door"];
  break;
  case "team_door_switch":
  var_2 = ["purchase_door"];
  break;
  case "atm_deposit":
  var_2 = ["atm_deposit"];
  break;
  case "atm_withdrawal":
  var_2 = ["atm_withdrawal"];
  break;
  case "repair_kevin":
  case "kevin_battery":
  case "kevin_head":
  case "souvenir_pickup":
  var_2 = ["zmb_item_pickup"];
  break;
  case "medium_ticket_prize":
  case "small_ticket_prize":
  case "iw7_forgefreeze_zm+forgefreezealtfire":
  case "zfreeze_semtex_mp":
  var_2 = ["purchase_ticket"];
  break;
  case "large_ticket_prize":
  var_2 = ["ark_purchase"];
  break;
  case "ark_quest_station":
  var_2 = ["ark_turn_in"];
  break;
  }

  if (!var_2.size)
  return undefined;

  return scripts\engine\utility::_id_DC6B(var_2);
}

_id_9A34(var_0) {
  if (!isdefined(var_0._id_D6B3))
  return;

  if (isdefined(level.interaction_post_activate_update_func)) {
  level thread [[level.interaction_post_activate_update_func]](var_0, self);
  return;
  }

  if (isdefined(var_0._id_10485)) {
  var_0._id_1048E delete();
  var_0._id_1048E = spawn("script_model", var_0._id_1048A);
  var_0._id_1048E setmodel(var_0._id_10489);
  var_0.script_noteworthy = "crafting_station";
  var_0._id_E1B9 = 1;
  var_0._id_D776 = 1;
  var_0._id_EE79 = "requires_power";
  var_0.name = "crafting_station";

  if (isdefined(var_0._id_10486))
  var_0._id_10486 delete();

  if (_id_0A77::_id_9D05())
  self playlocalsound("zmb_item_pickup");

  var_0._id_10485 = undefined;
  var_0._id_D6B3 = undefined;
  var_0._id_D742 = undefined;
  var_0._id_47B2 = undefined;
  }
}

_id_9A26(var_0) {
  return var_0.script_noteworthy == "trap_electric" || var_0.script_noteworthy == "trap_firebarrel";
}

_id_9A2A(var_0) {
  return var_0.script_noteworthy == "white_ark";
}

_id_9A14(var_0) {
  return var_0.script_noteworthy == "ark_quest_station";
}

_id_9A15(var_0) {
  return var_0.script_noteworthy == "atm_withdrawal" || var_0.script_noteworthy == "atm_deposit";
}

_id_9A1C(var_0) {
  return var_0.script_noteworthy == "neil_head";
}

interactionislostandfound(var_0) {
  if (isdefined(var_0.script_noteworthy) && var_0.script_noteworthy == "lost_and_found")
  return 1;

  if (isdefined(var_0.name) && var_0.name == "lost_and_found")
  return 1;

  return 0;
}

_id_9A2B(var_0) {
  return var_0.script_noteworthy == "secure_window";
}

_id_9A1E(var_0) {
  return var_0.script_noteworthy == "pillage_item";
}

_id_9A19(var_0) {
  return var_0.script_noteworthy == "fast_travel";
}

_id_9A17(var_0) {
  return var_0.script_noteworthy == "crafting_station";
}

_id_9A1B(var_0) {
  return var_0.script_noteworthy == "power_bioSpike" || var_0.script_noteworthy == "power_c4";
}

_id_9A16(var_0) {
  return var_0.script_noteworthy == "crafting_pickup";
}

_id_9A1A(var_0) {
  return var_0.script_noteworthy == "jaroslav_machine";
}

_id_9A1D(var_0) {
  return isdefined(var_0._id_CA4C);
}

_id_9A42(var_0) {
  return var_0._id_E1B9 && !var_0._id_D776;
}

_id_9A21(var_0) {
  return isdefined(var_0._id_47B2);
}

_id_D0C5(var_0, var_1) {
  if (isdefined(var_1._id_4B5C))
  return var_1._id_4B5C._id_0195 == var_0.script_noteworthy;

  return 0;
}

_id_9A2C(var_0) {
  return var_0.script_noteworthy == "crafted_windowtrap";
}

interaction_is_challenge_station(var_0) {
  return isdefined(var_0._id_86A2) && var_0._id_86A2 == "challenge";
}

_id_9A27(var_0, var_1) {
  if (var_1 _meth_84D9())
  return 0;

  if (isdefined(var_0._id_127BA))
  return 0;

  if (!scripts\engine\utility::array_contains(level._id_4B88, var_0))
  return 0;

  if (scripts\engine\utility::_id_9CEE(var_0._id_C74D)) {
  level notify("player_accessed_interaction_on_cooldown", var_1);
  return 0;
  }

  if (scripts\engine\utility::_id_9CEE(var_0._id_93A8))
  return 0;

  if (_id_9A42(var_0)) {
  level notify("player_accessed_nonpowered_interaction", var_1);

  if (isdefined(var_0._id_CA4C) && soundexists("perk_machine_deny"))
  var_1 playlocalsound("perk_machine_deny");
  else
  var_1 playlocalsound("purchase_deny");

  return 0;
  }

  if (isdefined(var_0._id_4622)) {
  level notify("player_accessed_interaction_on_cooldown", var_1);
  return 0;
  }

  if (scripts\engine\utility::array_contains(var_1._id_55BB, var_0))
  return 0;

  return 1;
}

_id_9A29(var_0) {
  return var_0.script_noteworthy == "weapon_upgrade";
}

_id_9A28(var_0) {
  if (isdefined(var_0.name))
  return var_0.name == "wall_buy";
  else
  return 0;
}

_id_9A18(var_0) {
  return var_0.script_noteworthy == "debris_350" || var_0.script_noteworthy == "debris_750" || var_0.script_noteworthy == "debris_1000" || var_0.script_noteworthy == "debris_1250" || var_0.script_noteworthy == "debris_1500" || var_0.script_noteworthy == "debris_2000" || var_0.script_noteworthy == "team_door_switch" || var_0.script_noteworthy == "team_door";
}

_id_9A22(var_0) {
  return var_0.script_noteworthy == "power_door_sliding" || var_0.script_noteworthy == "team_door_switch" || var_0.script_noteworthy == "team_door";
}

interaction_is_chi_door(var_0) {
  return var_0.script_noteworthy == "chi_0" || var_0.script_noteworthy == "chi_1" || var_0.script_noteworthy == "chi_2";
}

_id_9A24(var_0) {
  return var_0.script_noteworthy == "small_ticket_prize" || var_0.script_noteworthy == "medium_ticket_prize" || var_0.script_noteworthy == "arcade_counter_grenade" || var_0.script_noteworthy == "arcade_counter_ammo" || var_0.script_noteworthy == "large_ticket_prize" || var_0.script_noteworthy == "zfreeze_semtex_mp" || var_0.script_noteworthy == "iw7_forgefreeze_zm+forgefreezealtfire" || var_0.script_noteworthy == "gold_teeth";
}

_id_9A1F(var_0) {
  return isdefined(var_0._id_D742);
}

_id_D0C3(var_0) {
  return _id_0D15::_id_8C17(var_0._id_D742);
}

_id_3867(var_0) {
  if (_id_0A77::_id_8BBE(var_0._id_CA4C))
  return 0;
  else if (self._id_F1E7 >= self.max_self_revive_machine_use && var_0._id_CA4C == "perk_machine_revive")
  return 0;
  else if (isdefined(self._id_13FA4) && self._id_13FA4.size > 4)
  return 0;

  return 1;
}

_id_9A3C(var_0, var_1, var_2, var_3) {
  thread interaction_fail_internal(var_0, var_1, var_2, var_3);
}

interaction_fail_internal(var_0, var_1, var_2, var_3) {
  self endon("disconnect");
  level notify("interaction", "purchase_denied", level._id_9A43[var_0.script_noteworthy], self);
  self._id_50BC = 1;
  self._id_9A3F sethintstring(var_1);
  wait 1;
  self._id_50BC = undefined;
  _id_F422(self._id_9A3F, var_0);
}

_id_554F(var_0) {
  var_1 = scripts\engine\utility::_id_8180(var_0.script_noteworthy, "script_noteworthy");

  foreach (var_3 in var_1) {
  if (var_3._id_0334 == var_0._id_0334) {
  _id_0D45::_id_AF74(var_3.name, 0);
  _id_E019(var_3);
  }
  }
}

_id_6214(var_0) {
  var_1 = scripts\engine\utility::_id_8180(var_0.script_noteworthy, "script_noteworthy");

  foreach (var_3 in var_1) {
  if (var_3._id_0334 == var_0._id_0334) {
  _id_0D45::_id_AF74(var_3.name, 1);
  _id_175C(var_3);
  }
  }
}

disable_like_interactions(var_0) {
  var_1 = scripts\engine\utility::_id_8180(var_0.script_noteworthy, "script_noteworthy");

  foreach (var_3 in var_1) {
  _id_0D45::_id_AF74(var_3.name, 0);
  _id_E019(var_3);
  }
}

enable_like_interactions(var_0) {
  var_1 = scripts\engine\utility::_id_8180(var_0.script_noteworthy, "script_noteworthy");

  foreach (var_3 in var_1) {
  _id_0D45::_id_AF74(var_3.name, 1);
  _id_175C(var_3);
  }
}

_id_9A0D(var_0, var_1) {
  var_2 = scripts\engine\utility::_id_8180(var_0.script_noteworthy, "script_noteworthy");

  foreach (var_4 in var_2) {
  if (var_4._id_0334 == var_0._id_0334)
  var_4._id_4622 = 1;
  }

  if (scripts\engine\utility::_id_9CEE(level._id_4614))
  wait 1;
  else
  level scripts\engine\utility::_id_13736(var_1, "override_cooldowns");

  foreach (var_4 in var_2) {
  if (var_4._id_0334 == var_0._id_0334)
  var_4._id_4622 = undefined;
  }

  var_8 = 5184;

  foreach (var_10 in level.players) {
  foreach (var_4 in var_2) {
  if (distancesquared(var_10.origin, var_4.origin) >= var_8)
  continue;

  var_10 _id_DE6E();
  }
  }
}

_id_7A90(var_0) {
  var_1 = [];
  var_2 = scripts\engine\utility::_id_8180(var_0.script_noteworthy, "script_noteworthy");

  foreach (var_4 in var_2) {
  if (var_4._id_0334 == var_0._id_0334)
  var_1[var_1.size] = var_4;
  }

  return var_1;
}

_id_DE6E() {
  if (isdefined(self._id_9A3F.name))
  _id_0D45::_id_AF74(self._id_9A3F.name, 0);

  self notify("stop_interaction_logic");
  self._id_A8D3 = undefined;
  self._id_9A3F _meth_852E();
  self setclientomnvar("zm_interaction_cost", -1);
}

_id_9A3A(var_0) {
  return scripts\engine\utility::_id_9CEE(var_0._id_E1B9) && isdefined(var_0._id_D71C);
}

_id_55A2() {
  var_0 = scripts\engine\utility::_id_8180("interaction", "targetname");

  foreach (var_2 in var_0) {
  if (_id_9A28(var_2) || _id_9A1B(var_2) || _id_9A24(var_2) || isdefined(var_2._id_EE79) && var_2._id_EE79 == "tickets") {
  var_2._id_55BA = 1;
  _id_0D45::_id_AF74(var_2.name, 0);
  continue;
  }
  }
}

_id_55A3(var_0) {
  var_1 = scripts\engine\utility::_id_8180("interaction", "targetname");

  foreach (var_3 in var_1) {
  if (_id_9A28(var_3) || _id_9A1B(var_3) || _id_9A24(var_3) || isdefined(var_3._id_EE79) && var_3._id_EE79 == "tickets") {
  _id_0D45::_id_AF74(var_3.name, 0);
  _id_E01A(var_3, var_0);
  continue;
  }
  }
}

_id_6255(var_0) {
  var_1 = scripts\engine\utility::_id_8180("interaction", "targetname");

  foreach (var_3 in var_1) {
  if (_id_9A28(var_3) || _id_9A1B(var_3) || _id_9A24(var_3) || isdefined(var_3._id_EE79) && var_3._id_EE79 == "tickets") {
  _id_0D45::_id_AF74(var_3.name, 1);
  _id_175D(var_3, var_0);
  continue;
  }
  }
}

_id_1048D(var_0, var_1) {
  foreach (var_3 in level.players) {
  var_3 thread _id_0A57::showsplash(var_0, undefined, var_1);
  wait 0.1;
  }
}
