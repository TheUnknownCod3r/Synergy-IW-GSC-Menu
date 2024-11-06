/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2846.gsc
***************************************/

_id_11620(var_0, var_1, var_2, var_3) {
  if (!isdefined(var_3))
  var_3 = 0;

  var_4 = [level._id_5A23[var_0]._id_5A25, level._id_5A23[var_0]._id_5A2A];

  foreach (var_6 in var_4)
  var_6 _meth_83BA(var_1, var_2);

  if (var_3)
  _func_217();

  level._id_5A23[var_0]._id_5A24 = level._id_5A23[var_0]._id_5A25.angles;
}

_id_59CB() {
  _id_1206();
  _id_11FB();
  _id_120C();
  level._id_5A23 = [];
  _id_0B91::_id_D6D9(::_id_59CC);
  scripts\engine\utility::_id_6E39("show_peek_hint");
  scripts\engine\utility::_id_6E39("stopping_doorpeek_gesture");
  scripts\engine\utility::_id_6E39("doorpeek_hand_on_door");
  _id_0B91::_id_16EB("peek_hint", &"SCRIPT_DOORPEEK_HINT", ::_id_C9F7);
  _id_0B91::_id_16EB("peek_hint_pc", &"SCRIPT_DOORPEEK_HINT_PC", ::_id_C9F7);
  _id_0B91::_id_16EB("peek_hint_shove", &"SCRIPT_DOORPEEK_HINT_SHOVE", ::_id_C9F7);
  _id_0B91::_id_16EB("peek_hint_shove_pc", &"SCRIPT_DOORPEEK_HINT_SHOVE_PC", ::_id_C9F7);
  _id_0B91::_id_16EB("peek_only_hint", &"SCRIPT_DOORPEEK_HINT_PEEK_ONLY", ::_id_C9F7);
  _id_0B91::_id_16EB("peek_only_hint_pc", &"SCRIPT_DOORPEEK_HINT_PEEK_ONLY_PC", ::_id_C9F7);
}

_id_C9F7() {
  return !scripts\engine\utility::_id_6E25("show_peek_hint");
}

_id_59CC() {
  _id_118F();
  _id_118E();
  level.player notifyonplayercommand("kick_pressed", "+stance");
  level.player notifyonplayercommand("kick_pressed_pc", "+activate");
}

_id_794D(var_0) {
  var_1 = getentarray(var_0, "targetname");
  var_2 = _id_12A6(var_1, "door_peek_door");
  return var_2;
}

_id_118F() {
  var_0 = scripts\engine\utility::_id_8180("door_peek_struct", "script_noteworthy");

  foreach (var_2 in var_0) {
  if (isdefined(var_2._id_02AF) && var_2._id_02AF & 1) {
  var_3 = getentarray(var_2._id_0336, "targetname");
  var_4 = scripts\engine\utility::_id_8180(var_2._id_0336, "targetname");
  var_3 = scripts\engine\utility::_id_227F(var_3, var_4);

  if (var_2._id_02AF & 2)
  thread _id_59BE(var_2._id_0336);

  if (var_2._id_02AF & 4)
  thread _id_59BE(var_2._id_0336, 1);

  continue;
  }

  _id_59D5(var_2._id_0336, 0);
  var_5 = getentarray(var_2._id_0336, "targetname");
  var_5 = scripts\engine\utility::_id_227F(var_5, scripts\engine\utility::_id_8180(var_2._id_0336, "targetname"));
  var_6 = _id_12A6(var_5, "door_peek_door");
  var_7 = var_6._id_EE52;

  if (var_7 == "airlock" || var_7 == "airlockcombat")
  var_6 _id_0B1F::_id_1AB5(0);
  }
}

_id_118E() {
  var_0 = scripts\engine\utility::_id_8180("door_peek_struct", "script_noteworthy");

  foreach (var_2 in var_0) {
  if (isdefined(var_2._id_0336) && var_2._id_0336 == "door_peek_armory")
  thread _id_59BE(var_2._id_0336);
  }
}

_id_11FA() {
  self _meth_82EF(self.origin);
  _id_0B91::_id_F3E0(1);
  _id_0B91::_id_F415(1);
}

_id_13B2(var_0, var_1) {
  level.player endon("death");

  if (!var_1) {
  level endon(var_0 + "door_peek_main_side_used");
  level waittill(var_0 + "door_peek_reverse_side_used");
  } else {
  level endon(var_0 + "door_peek_reverse_side_used");
  level waittill(var_0 + "door_peek_main_side_used");
  }

  _id_0E46::_id_DFE3();
  self.origin = self._id_C3A2;
}

_id_1207(var_0, var_1, var_2, var_3) {
  level endon(var_0 + "door_peek_deleted");
  level endon(var_0 + "door_peek_disabled");

  if (!isdefined(var_3) || var_3 == 0)
  level endon(var_0 + "door_peek_kick");

  level endon(var_0 + "door_peek_back_off");
  level endon(var_0 + "door_peek_sprint");
  level endon(var_0 + "door_peek_pop_open");
  level endon(var_0 + "door_kick_newdoor_think");
  level.player._id_5818 = 1;
  thread _id_1208(var_0, var_1, var_2, var_3);
  level.player waittill("death");
  _id_11D6(var_0, var_1);
}

_id_1208(var_0, var_1, var_2, var_3) {
  level.player endon("death");
  var_4 = [var_0 + "door_peek_deleted", var_0 + "door_peek_disabled", var_0 + "door_peek_back_off", var_0 + "door_peek_sprint", var_0 + "door_peek_pop_open", var_0 + "door_kick_newdoor_think"];

  if (!isdefined(var_3) || var_3 == 0)
  var_4[var_4.size] = var_0 + "door_peek_kick";

  level scripts\engine\utility::_id_13730(var_4);
  level.player._id_5818 = undefined;
}

_id_1211(var_0, var_1, var_2, var_3) {
  level.player endon("death");
  level endon(var_0 + "door_peek_deleted");
  level endon(var_0 + "door_peek_disabled");

  if (!isdefined(var_3) || var_3 == 0)
  level endon(var_0 + "door_peek_kick");

  level endon(var_0 + "door_peek_back_off");
  level endon(var_0 + "door_peek_sprint");
  level endon(var_0 + "door_peek_pop_open");

  if (!var_1)
  level endon(var_0 + "door_peek_reverse_side_used");
  else
  level endon(var_0 + "door_peek_main_side_used");

  if (!isdefined(level._id_5A23[var_0]))
  level._id_5A23[var_0] = spawnstruct();

  var_4 = getentarray(var_0, "targetname");
  var_4 = scripts\engine\utility::_id_227F(var_4, scripts\engine\utility::_id_8180(var_0, "targetname"));
  level._id_5A23[var_0]._id_5978 = _id_12A6(var_4, "door_peek_door");
  level._id_5A23[var_0]._id_5A57 = level._id_5A23[var_0]._id_5978._id_EE52;
  level._id_5A23[var_0]._id_5978 _id_0B91::_id_23B7("doorpeek_door");
  var_5 = _id_12A6(var_4, "door_peek_struct");

  if (!var_1) {
  var_6 = 1.0;
  var_7 = _id_12A6(var_4, "door_peek_animstruct");
  level._id_5A23[var_0]._id_5A25 = var_5 scripts\engine\utility::_id_107E6();
  level._id_5A23[var_0]._id_59FF = var_7 scripts\engine\utility::_id_107E6();
  level._id_5A23[var_0]._id_59FF.angles = var_7.angles + (0, 180, 0);
  level._id_5A23[var_0]._id_59FF linkto(level._id_5A23[var_0]._id_5978);
  level._id_5A23[var_0]._id_5A58 = distance2d(level._id_5A23[var_0]._id_5A25.origin, level._id_5A23[var_0]._id_59FF.origin);
  var_8 = _id_12A6(var_4, "door_kick_animstruct");
  level._id_5A23[var_0]._id_A5A9 = var_8 scripts\engine\utility::_id_107E6();
  level._id_5A23[var_0]._id_A5A9 linkto(level._id_5A23[var_0]._id_5A25);
  var_9 = -140.0;

  if (isdefined(var_5._id_EE0E))
  var_9 = var_5._id_EE0E * -1.0;

  level._id_5A23[var_0]._id_74C0 = var_9;
  } else {
  var_6 = -1.0;
  var_7 = _id_12A6(var_4, "door_peek_animstruct_b");
  level._id_5A23[var_0]._id_5A26 = var_5 scripts\engine\utility::_id_107E6();
  level._id_5A23[var_0]._id_5A26.angles = level._id_5A23[var_0]._id_5A26.angles + (0, 180, 0);
  level._id_5A23[var_0]._id_5A00 = var_7 scripts\engine\utility::_id_107E6();
  level._id_5A23[var_0]._id_5A00 linkto(level._id_5A23[var_0]._id_5978);
  level._id_5A23[var_0]._id_5A58 = distance2d(level._id_5A23[var_0]._id_5A26.origin, level._id_5A23[var_0]._id_5A00.origin);
  var_10 = _id_12A6(var_4, "door_kick_animstruct_b");
  level._id_5A23[var_0]._id_A5AA = var_10 scripts\engine\utility::_id_107E6();
  level._id_5A23[var_0]._id_A5AA linkto(level._id_5A23[var_0]._id_5A26);
  var_9 = 140.0;

  if (isdefined(var_5._id_EE0D))
  var_9 = var_5._id_EE0D;

  level._id_5A23[var_0]._id_74C1 = var_9;
  }

  level._id_5A23[var_0]._id_5A2A = var_5 scripts\engine\utility::_id_107E6();
  level._id_5A23[var_0]._id_5978 linkto(level._id_5A23[var_0]._id_5A2A);
  level._id_5A23[var_0]._id_5A24 = level._id_5A23[var_0]._id_5A2A.angles;
  level._id_5A23[var_0]._id_5A03 = _id_12A6(var_4, "door_peek_clip");
  level._id_5A23[var_0]._id_5A03 linkto(level._id_5A23[var_0]._id_5978);
  level._id_5A23[var_0]._id_5A56 = _id_12A6(var_4, "door_peek_static_clip");

  if (!var_1) {
  var_11 = _id_12A6(var_4, "door_kick_interact");
  level._id_5A23[var_0]._id_4C26 = spawn("script_origin", var_11.origin);
  level._id_5A23[var_0]._id_4C26.origin = var_11.origin;
  level._id_5A23[var_0]._id_4C26.angles = var_11.angles;
  level._id_5A23[var_0]._id_4C26 linkto(level._id_5A23[var_0]._id_5978);
  } else {
  var_11 = _id_12A6(var_4, "door_kick_interact_b");
  level._id_5A23[var_0]._id_4C27 = spawn("script_origin", var_11.origin);
  level._id_5A23[var_0]._id_4C27.origin = var_11.origin;
  level._id_5A23[var_0]._id_4C27.angles = var_11.angles;
  level._id_5A23[var_0]._id_4C27 linkto(level._id_5A23[var_0]._id_5978);
  }

  level._id_5A23[var_0]._id_C9D4 = 0;
  level._id_5A23[var_0]._id_5A21 = 0;

  if (!var_1)
  level._id_5A23[var_0]._id_C9FE = _id_1298(level._id_5A23[var_0]._id_5A57, var_1);
  else
  level._id_5A23[var_0]._id_C9FF = _id_1298(level._id_5A23[var_0]._id_5A57, var_1);

  level._id_5A23[var_0]._id_1B12 = 0;

  if (isdefined(level._id_5A23[var_0]._id_5978._id_EEE3)) {
  level._id_5A23[var_0]._id_1B12 = level._id_5A23[var_0]._id_5978._id_EEE3;

  if (!var_1)
  level._id_5A23[var_0]._id_5A2A.angles = level._id_5A23[var_0]._id_5A2A.angles - (0, level._id_5A23[var_0]._id_1B12, 0);
  else
  level._id_5A23[var_0]._id_5A2A.angles = level._id_5A23[var_0]._id_5A2A.angles + (0, level._id_5A23[var_0]._id_1B12, 0);
  }

  wait 0.05;

  if (isdefined(level._id_5A23[var_0]._id_4C1C))
  scripts\engine\utility::_id_6E4C(level._id_5A23[var_0]._id_4C1C);

  if (!isdefined(level._id_5A23[var_0]._id_5978))
  level notify(var_0 + "door_peek_deleted");

  _id_11F8(var_0, var_1);
  thread _id_1207(var_0, var_1, var_2, var_3);

  if (var_1) {
  level._id_5A23[var_0]._id_5978 unlink();
  var_12 = level._id_5A23[var_0]._id_C9FF._id_11782;
  level._id_5A23[var_0]._id_5A2A.origin = level._id_5A23[var_0]._id_5A2A.origin + var_12 * anglestoforward(level._id_5A23[var_0]._id_5A26.angles);
  level._id_5A23[var_0]._id_5978 linkto(level._id_5A23[var_0]._id_5A2A);
  }

  thread _id_120D(var_0, level._id_5A23[var_0]._id_5978, level._id_5A23[var_0]._id_5A03);
  childthread _id_120E(var_0);

  if (!isdefined(var_2)) {
  if (level._id_5A23[var_0]._id_5A57 != "airlock") {
  thread _id_1209(var_0, level._id_5A23[var_0]._id_5978, var_1, level._id_5A23[var_0]._id_5A03);

  if (!var_1)
  thread _id_11EA(var_0, level._id_5A23[var_0]._id_5978, var_1, level._id_5A23[var_0]._id_5A03, level._id_5A23[var_0]._id_5A25);
  else
  thread _id_11EA(var_0, level._id_5A23[var_0]._id_5978, var_1, level._id_5A23[var_0]._id_5A03, level._id_5A23[var_0]._id_5A26);
  }
  }

  level.player._id_5966 = 1;
  level notify(var_0 + "door_peek_start");
  level notify("door_peek_start");
  thread scripts\engine\utility::_id_6E3F(var_0 + "door_peek_can_kick", level._id_5A23[var_0]._id_C9FE._id_119D5);

  if (var_1) {
  level notify(var_0 + "door_peek_reverse_side_used");
  level notify("door_peek_reverse_side_used");
  } else {
  level notify(var_0 + "door_peek_main_side_used");
  level notify("door_peek_main_side_used");
  }

  _id_1201();
  _id_1205();
  thread _id_59CF(var_0, var_3);
  _id_1202(var_0, var_1);
  thread _id_1466(var_0);
  _id_1204();
  thread _id_11FE(var_0, var_1);
  thread _id_120A(var_0, var_1);
  _id_11F5(var_0, var_1, var_2);
  _id_1210(var_0, var_1);
  level notify(var_0 + "door_kick_newdoor_think");
}

_id_11F8(var_0, var_1) {
  level.player endon("death");
  level endon(var_0 + "door_peek_disabled");

  if (!var_1)
  var_2 = level._id_5A23[var_0]._id_4C26;
  else
  var_2 = level._id_5A23[var_0]._id_4C27;

  var_2._id_C3A2 = var_2.origin;
  var_2 _id_0E46::_id_48C4(undefined, (0, 0, 0), &"SCRIPT_DOORPEEK_OPEN", undefined, 512);
  var_2 thread _id_13B2(var_0, var_1);
  var_2 thread _id_11F6(var_0);
  var_3 = 0;

  if (level._id_5A23[var_0]._id_5A57 == "armory" || level._id_5A23[var_0]._id_5A57 == "armoryajar")
  var_3 = 1;

  var_2 thread _id_11F7(level._id_5A23[var_0]._id_5978, var_1, level._id_5A23[var_0]._id_1B12, var_3);
  var_2 waittill("trigger", var_4);
  var_2.origin = var_2._id_C3A2;
  level._id_5A23[var_0]._id_5A56 hide();
}

_id_11F6(var_0) {
  level.player endon("death");
  self endon("trigger");
  level waittill(var_0 + "door_peek_disabled");
  _id_0E46::_id_DFE3();
  self.origin = self._id_C3A2;
}

_id_1202(var_0, var_1) {
  if (!var_1) {
  var_2 = level._id_5A23[var_0]._id_C9FE;
  var_3 = "ges_doorpeek_" + _id_1297(level._id_5A23[var_0]._id_5A57);
  var_4 = level._id_5A23[var_0]._id_59FF;
  var_5 = "doorpeek_" + _id_1297(level._id_5A23[var_0]._id_5A57) + "_in";
  } else {
  var_2 = level._id_5A23[var_0]._id_C9FF;
  var_3 = "ges_doorpeek_" + _id_1297(level._id_5A23[var_0]._id_5A57) + "_r";
  var_4 = level._id_5A23[var_0]._id_5A00;
  var_5 = "doorpeek_" + _id_1297(level._id_5A23[var_0]._id_5A57) + "_r_in";
  }

  var_6 = _id_12AC(var_0, var_1);

  if (isdefined(var_6))
  var_3 = var_6;

  if (!scripts\engine\utility::_id_6E25(var_0 + "door_peek_handle_down")) {
  var_7 = 0.4;
  level._id_5A23[var_0]._id_C9FD = _id_0B91::_id_10639("player_rig");
  var_8 = level.player _meth_84C6("currentViewModel");

  if (isdefined(var_8))
  level._id_5A23[var_0]._id_C9FD setmodel(var_8);

  level._id_5A23[var_0]._id_C9FD hide();
  childthread _id_11CE(0.2, level._id_5A23[var_0]._id_C9FD);
  var_4 thread _id_0B06::_id_1EC3(level._id_5A23[var_0]._id_C9FD, var_5);
  var_9 = level._id_5A23[var_0]._id_C9FD gettagorigin("tag_player");
  var_10 = level.player getplayerangles(1);
  var_11 = var_4.origin - var_9;
  var_12 = level.player.origin - var_9;
  var_13 = var_10 - var_4.angles + (0, 180, 0);
  var_14 = var_4.origin;
  var_15 = var_4.angles;
  var_4 unlink();
  var_4.origin = var_4.origin + var_12;
  var_16 = vectornormalize(var_4.origin - level.player.origin);
  var_17 = distance(var_4.origin, level.player.origin);
  var_16 = rotatevector(var_16, var_13);
  var_4.origin = level.player.origin + var_16 * var_17;
  var_4.angles = var_4.angles + var_13;
  var_18 = 0.6 - var_7;
  var_19 = distance(level.player.origin, var_9);
  var_20 = 20;
  var_21 = 40;
  var_22 = 0.0;

  if (var_19 > var_20)
  var_22 = min((var_19 - var_20) / (var_21 - var_20), 1.0) * var_18;

  var_23 = abs(var_13[1]);
  var_24 = 30;
  var_25 = 75;
  var_26 = 0.0;

  if (var_23 > var_24)
  var_26 = min((var_23 - var_24) / (var_25 - var_24), 1.0) * var_18;

  var_27 = max(var_22, var_26);
  var_28 = var_7 + var_27;
  scripts\engine\utility::_id_6E3E("doorpeek_hand_on_door");

  if (var_27 > 0.0) {
  level.player scripts\engine\utility::_id_50E1(var_27, ::_meth_846F, var_3);
  var_4 thread _id_0B06::_id_1EC3(level._id_5A23[var_0]._id_C9FD, var_5);
  var_4 scripts\engine\utility::delaythread(var_27, _id_0B06::_id_1F35, level._id_5A23[var_0]._id_C9FD, var_5);

  if (level._id_5A23[var_0]._id_5A57 != "civlever" && level._id_5A23[var_0]._id_5A57 != "armoryajar")
  level._id_5A23[var_0]._id_5978 scripts\engine\utility::delaythread(var_27, _id_0B06::_id_1F35, level._id_5A23[var_0]._id_5978, "doorpeek_" + _id_1297(level._id_5A23[var_0]._id_5A57) + "_in");
  } else {
  level.player _meth_846F(var_3);
  var_4 thread _id_0B06::_id_1F35(level._id_5A23[var_0]._id_C9FD, var_5);

  if (level._id_5A23[var_0]._id_5A57 != "civlever" && level._id_5A23[var_0]._id_5A57 != "armoryajar")
  level._id_5A23[var_0]._id_5978 thread _id_0B06::_id_1F35(level._id_5A23[var_0]._id_5978, "doorpeek_" + _id_1297(level._id_5A23[var_0]._id_5A57) + "_in");
  }

  level.player _meth_823C(level._id_5A23[var_0]._id_C9FD, "tag_player", 0.2, 0.0, 0.0);
  wait 0.05;
  level._id_5A23[var_0]._id_C9FD linkto(var_4);
  var_4 moveto(var_14, var_28);
  var_4 rotateto(var_15, var_28);
  level thread _id_0B91::_id_C12D(var_0 + "door_peek_blend_complete", var_28 + 0.1);
  level thread _id_0B91::_id_C12D("door_peek_blend_complete", var_28 + 0.1);
  var_4 scripts\engine\utility::_id_50E1(var_28 + 0.05, ::linkto, level._id_5A23[var_0]._id_5978);

  if (var_27 > 0.0)
  wait(var_27);

  wait(var_2._id_119AB);
  scripts\engine\utility::_id_6E3E(var_0 + "door_peek_handle_down");
  level notify(var_0 + "door_handle_down");
  level notify("door_handle_down");
  }

  if (!var_1)
  level.player _meth_823D(level._id_5A23[var_0]._id_C9FD, "tag_player", 1, var_2._id_0269, var_2._id_B7C1, 80, 20, 0);
  else
  level.player _meth_823D(level._id_5A23[var_0]._id_C9FD, "tag_player", 1, var_2._id_B7C9, var_2._id_01B8, 80, 20, 0);

  if ((!isdefined(level._id_5A23[var_0]._id_A5AB) || level._id_5A23[var_0]._id_A5AB == 0) && level._id_5A23[var_0]._id_1B12 == 0.0)
  thread _id_1203(var_0, var_1);

  wait(var_2._id_47A4);
  level notify(var_0 + "door_intro_done");
  level notify("door_intro_done");
}

_id_11CE(var_0, var_1) {
  level.player endon("death");
  wait(var_0);
  var_1 show();
}

_id_1203(var_0, var_1) {
  if (!var_1)
  var_2 = level._id_5A23[var_0]._id_C9FE;
  else
  var_2 = level._id_5A23[var_0]._id_C9FF;

  level._id_5A23[var_0]._id_5A2A rotateby((0, 0 - var_2._id_47A3, 0), var_2._id_47A4, 0, var_2._id_47A4 / 2);
  level._id_5A23[var_0]._id_5978 playsound("doorpeek_" + _id_1299(level._id_5A23[var_0]._id_5A57) + "_crack_open");
}

_id_11F5(var_0, var_1, var_2) {
  level endon(var_0 + "door_script_disabled");

  if (!var_1) {
  var_3 = 1.0;
  var_4 = level._id_5A23[var_0]._id_C9FE;
  var_5 = level._id_5A23[var_0]._id_5A25;
  } else {
  var_3 = -1.0;
  var_4 = level._id_5A23[var_0]._id_C9FF;
  var_5 = level._id_5A23[var_0]._id_5A26;
  }

  level notify(var_0 + "door_peek_start_peek_control");
  level notify("door_peek_start_peek_control");
  var_6 = _id_12AE(var_0);
  var_7 = 0;
  var_8 = 0;
  var_9 = 1;
  var_10 = level._id_5A23[var_0]._id_5A2A.angles;
  var_11 = 0;
  var_12 = 0;
  var_13 = 0;
  var_14 = 80;

  if (level._id_5A23[var_0]._id_5A57 == "airlock")
  var_14 = 90;

  for (;;) {
  if (!var_1 && level._id_5A23[var_0]._id_5A21 >= var_14 && !level._id_5A23[var_0]._id_C9D4)
  break;
  else if (var_1 && level._id_5A23[var_0]._id_5A21 <= 0 - var_14 && !level._id_5A23[var_0]._id_C9D4)
  break;

  var_12 = 0;
  var_15 = _id_1296(var_0, var_1);

  if (isdefined(level._id_5A23[var_0]._id_72C6) && level._id_5A23[var_0]._id_72C6 == 1)
  var_15 = 1.0;

  var_16 = var_15 * 1.2 * var_3;

  if (var_8 == 1.0 && var_15 == 1.0) {
  var_16 = var_16 * 1.01 * _id_0B91::_id_E753(var_9, 0, 1);
  var_9 = var_9 + 0.5;
  }
  else
  var_9 = 1;

  var_16 = clamp(var_16, 0 - var_4._id_B4B9, var_4._id_B4B9);

  if (!level._id_5A23[var_0]._id_C9D4) {
  var_17 = 0;

  if (isdefined(level._id_5A23[var_0]._id_B7C6))
  var_17 = level._id_5A23[var_0]._id_B7C6 - var_6;

  if (!var_1)
  level._id_5A23[var_0]._id_5A21 = max(level._id_5A23[var_0]._id_5A21 + var_16, var_17);
  else
  level._id_5A23[var_0]._id_5A21 = min(level._id_5A23[var_0]._id_5A21 + var_16, 0.0 - var_17);

  level._id_5A23[var_0]._id_5A21 = _id_0B91::_id_E753(level._id_5A23[var_0]._id_5A21, 1);

  if (isdefined(var_2))
  level._id_5A23[var_0]._id_5A21 = min(level._id_5A23[var_0]._id_5A21 + var_16, var_2);
  }

  if (level._id_5A23[var_0]._id_5A21 != var_7) {
  var_12 = 1;

  if (var_11 == 0) {
  level._id_5A23[var_0]._id_5978 playsound("doorpeek_" + _id_1299(level._id_5A23[var_0]._id_5A57) + "_move_start");
  level._id_5A23[var_0]._id_5978 playloopsound("doorpeek_" + _id_1299(level._id_5A23[var_0]._id_5A57) + "_move_loop");
  }

  level._id_5A23[var_0]._id_5A2A rotateto(var_10 + (0, 0.0 - level._id_5A23[var_0]._id_5A21, 0), 0.1, 0.0, 0.0);

  if (!var_1) {
  var_18 = clamp(level._id_5A23[var_0]._id_5A21 / var_4._id_B481, 0.0, 1.0) * (var_4._id_B4AA - var_4._id_B7C1) + var_4._id_B7C1;
  level.player _meth_823D(level._id_5A23[var_0]._id_C9FD, "tag_player", 1, var_4._id_0269, var_18, 80, 20, 0);
  } else {
  var_19 = clamp(-1.0 * level._id_5A23[var_0]._id_5A21 / var_4._id_B481, 0.0, 1.0) * (var_4._id_B4C1 - var_4._id_B7C9) + var_4._id_B7C9;
  level.player _meth_823D(level._id_5A23[var_0]._id_C9FD, "tag_player", 1, var_19, var_4._id_01B8, 80, 20, 0);
  }

  if (isdefined(var_2) && level._id_5A23[var_0]._id_5A21 == var_2) {
  wait 0.1;
  level._id_5A23[var_0]._id_5978 playsound("doorpeek_" + _id_1299(level._id_5A23[var_0]._id_5A57) + "_blocked");
  level notify(var_0 + "door_peek_blocked");
  level notify("door_peek_blocked");
  }

  if (level._id_5A23[var_0]._id_5A57 == "airlock" && var_13 == 0 && level._id_5A23[var_0]._id_5A21 >= 64.0) {
  var_13 = 1;
  level notify(var_0 + "door_peek_airlock_ally_move");
  level notify("door_peek_airlock_ally_move");
  }
  }
  else if (var_11) {
  level._id_5A23[var_0]._id_5978 stoploopsound("doorpeek_" + _id_1299(level._id_5A23[var_0]._id_5A57) + "_move_loop");
  level._id_5A23[var_0]._id_5978 playsound("doorpeek_" + _id_1299(level._id_5A23[var_0]._id_5A57) + "_move_stop");
  }

  var_7 = level._id_5A23[var_0]._id_5A21;
  var_8 = var_15;
  var_11 = var_12;
  wait 0.05;
  }
}

_id_1210(var_0, var_1) {
  _id_13C9("open");

  if (!var_1)
  var_2 = level._id_5A23[var_0]._id_74C0;
  else
  var_2 = level._id_5A23[var_0]._id_74C1;

  var_3 = 0.15;
  level._id_5A23[var_0]._id_5A2A rotateto(level._id_5A23[var_0]._id_5A24 + (0, var_2, 0), var_3, 0.0, 0.0);
  level._id_5A23[var_0]._id_5A2A scripts\engine\utility::_id_50E1(var_3 + 0.05, ::delete);
  level._id_5A23[var_0]._id_5A03 connectpaths();
  level._id_5A23[var_0]._id_5A03 scripts\engine\utility::_id_50E1(var_3 + 0.05, ::disconnectpaths);
  level._id_5A23[var_0]._id_5978 playsound("doorpeek_" + _id_1299(level._id_5A23[var_0]._id_5A57) + "_swing_open");
  level._id_5A23[var_0]._id_5978 scripts\engine\utility::_id_50E1(var_3, ::playsound, "doorpeek_" + _id_1299(level._id_5A23[var_0]._id_5A57) + "_hit_wall");
  level thread _id_0B91::_id_C12D(var_0 + "door_peek_finished", var_3 + 0.05);
  level thread _id_0B91::_id_C12D("door_peek_finished", var_3 + 0.05);
  level notify(var_0 + "door_peek_opened_fully");

  if (isdefined(level._id_5A1C)) {
  level._id_5A23[var_0]._id_C9FD delete();
  level._id_5A23[var_0]._id_59FF delete();
  level._id_5A23[var_0]._id_5A2A delete();
  return;
  }

  thread _id_11F9(var_0, level._id_5A23[var_0]._id_5978, var_1, 0, 1);
}

_id_11F7(var_0, var_1, var_2, var_3) {
  level.player endon("death");
  level endon(var_0._id_0336 + "door_peek_start");

  if (!isdefined(var_3))
  var_3 = 0;

  if (!var_1)
  var_4 = level._id_5A23[var_0._id_0336]._id_5A25;
  else
  var_4 = level._id_5A23[var_0._id_0336]._id_5A26;

  var_5 = var_4.angles;

  if (!var_1)
  var_5 = var_5 - (0, var_2, 0);
  else
  var_5 = var_5 + (0, var_2, 0);

  var_6 = anglestoforward(var_5);
  var_7 = anglestoright(var_5);
  var_8 = anglestoup(var_5);
  var_9 = self._id_C3A2 + var_7 * level._id_5A23[var_0._id_0336]._id_5A58 * 0.5;
  self unlink();

  for (;;) {
  wait 0.05;
  var_10 = distance2d(level.player.origin, var_9);
  var_11 = abs(clamp(var_10 / 100.0, 0.0, 1.0) - 1.0);

  if (var_11 > 0.0) {
  var_12 = level.player geteye();
  var_13 = level.player getplayerangles();
  var_14 = anglestoforward(var_13);

  if (vectordot(var_14, var_6) < 0)
  continue;

  var_15 = _id_0B4D::_id_ACE9(var_12, var_12 + var_14 * 64, self._id_C3A2, var_6);
  var_16 = vectornormalize(var_15 - self._id_C3A2);
  var_15 = self._id_C3A2 + var_16 * distance(var_15, self._id_C3A2) * 0.75 * var_11;

  if (distance(var_15, self._id_C3A2) > 32.0)
  var_15 = self._id_C3A2 + var_16 * 32.0;

  var_17 = vectorcross(var_6, var_16);
  var_18 = 0;

  if (!var_1 && vectordot(var_17, var_8) > 0 && !var_3)
  var_18 = 1;
  else if (var_1 && vectordot(var_17, var_8) < 0 && !var_3)
  var_18 = 1;

  if (var_18) {
  var_19 = vectordot(var_16, var_8);
  var_20 = distance(var_15, self._id_C3A2) * var_19;
  var_15 = self._id_C3A2 + var_8 * var_20;
  }

  self.origin = var_15;
  continue;
  }

  if (self.origin != self._id_C3A2)
  self.origin = self._id_C3A2;
  }
}

_id_11FE(var_0, var_1) {
  level.player endon("death");
  level endon(var_0 + "door_peek_kick");
  level endon(var_0 + "door_peek_detach");

  for (;;) {
  level.player waittill("grenade_pullback");
  _id_13C9("grenade");
  _id_116C(var_0, var_1, 0);
  level.player waittill("grenade_fire");
  wait 0.3;
  _id_116C(var_0, var_1, 1);
  wait 0.05;
  }
}

_id_120A(var_0, var_1) {
  level.player endon("death");
  level endon(var_0 + "door_peek_kick");
  level endon(var_0 + "door_peek_detach");
  var_2 = 0;

  for (;;) {
  if (level.player _meth_81B8() && !var_2 && !level.player _meth_819C()) {
  _id_116C(var_0, var_1, 0);
  var_2 = 1;
  }
  else if (!level.player _meth_81B8() && var_2) {
  _id_116C(var_0, var_1, 1);
  var_2 = 0;
  }

  wait 0.05;
  }
}

_id_116C(var_0, var_1, var_2) {
  if (!isdefined(level._id_5A23[var_0]._id_C9FD))
  return;

  if (var_2) {
  if (!isdefined(level._id_5A23[var_0]._id_5A22))
  level._id_5A23[var_0]._id_5A22 = 0;

  level._id_5A23[var_0]._id_5A22--;

  if (!level._id_5A23[var_0]._id_5A22)
  thread _id_C9E8(var_0, var_1, var_2);
  } else {
  if (!isdefined(level._id_5A23[var_0]._id_5A22))
  level._id_5A23[var_0]._id_5A22 = 0;

  level._id_5A23[var_0]._id_5A22++;

  if (level._id_5A23[var_0]._id_5A22 == 1)
  thread _id_C9E7(var_0, var_1, var_2);
  }
}

_id_C9E8(var_0, var_1, var_2) {
  level endon(var_0 + "door_peek_kick");
  level endon(var_0 + "door_peek_detach");
  level notify("peek_arm_on");
  level endon("peek_arm_on");
  scripts\engine\utility::_id_6E5A("stopping_doorpeek_gesture");
  level.player _meth_846F("ges_drophand");

  if (!var_1) {
  var_3 = level._id_5A23[var_0]._id_59FF;
  var_4 = "doorpeek_" + _id_1297(level._id_5A23[var_0]._id_5A57) + "_backon";
  } else {
  var_3 = level._id_5A23[var_0]._id_5A00;
  var_4 = "doorpeek_" + _id_1297(level._id_5A23[var_0]._id_5A57) + "_r_backon";
  }

  childthread _id_136C(var_3, var_0, var_4);
}

_id_C9E7(var_0, var_1, var_2) {
  level endon(var_0 + "door_peek_kick");
  level endon(var_0 + "door_peek_detach");
  level notify("peek_arm_off");
  level endon("peek_arm_off");
  level.player notify("door_peek_hand_off");
  scripts\engine\utility::_id_6E2A("doorpeek_hand_on_door");
  level._id_5A23[var_0]._id_C9FD hide();
  childthread _id_1415();
}

_id_136C(var_0, var_1, var_2) {
  level.player endon("door_peek_hand_off");
  wait 0.3;
  scripts\engine\utility::_id_6E3E("doorpeek_hand_on_door");
  level._id_5A23[var_1]._id_C9FD show();
  var_0 _id_0B06::_id_1F35(level._id_5A23[var_1]._id_C9FD, var_2);
}

_id_1415() {
  scripts\engine\utility::_id_6E3E("stopping_doorpeek_gesture");
  var_0 = 0.1;
  level.player _meth_8442("ges_doorpeek_bulkhead", var_0);
  level.player _meth_8442("ges_doorpeek_airlock", var_0);
  level.player _meth_8442("ges_doorpeek_civlever", var_0);
  level.player _meth_8442("ges_doorpeek_civlever_r", var_0);
  level.player _meth_8442("ges_drophand", var_0);
  wait(var_0 + 0.25);
  scripts\engine\utility::_id_6E2A("stopping_doorpeek_gesture");
}

_id_120B(var_0, var_1, var_2) {
  var_3 = var_0._id_EE52;
  var_4 = undefined;
  var_5 = undefined;

  for (;;) {
  var_4 = var_5;
  var_6 = _id_11FC(var_0);
  var_5 = _id_11FD(var_0);
  var_7 = 0;
  var_8 = 0;

  if (!isdefined(var_5) && isdefined(var_4)) {
  if (!var_1 && var_4)
  var_7 = 1;
  }

  if (isdefined(var_5) && isdefined(var_4) && var_5 != var_4) {
  if (!var_1 && var_5 || var_1 && !var_5)
  var_7 = 1;
  }

  if (!var_7 && isdefined(var_6)) {
  var_8 = 1;

  if (!var_1 && var_6 && !isdefined(level._id_5A23[var_0._id_0336]._id_C9FF)) {
  wait 0.05;
  continue;
  }

  var_9 = 50;
  var_10 = level.player _meth_814C();
  var_11 = vectornormalize((var_10[0], 0 - var_10[1], 0));
  var_12 = vectortoangles(var_11);
  var_13 = level.player getplayerangles(1);
  var_14 = _func_048(var_13, var_12);
  var_15 = anglestoforward(var_14);

  if (!var_6) {
  var_16 = anglestoforward(level._id_5A23[var_0._id_0336]._id_5A25.angles);

  if (acos(clamp(vectordot(var_16, var_15), -1, 1)) > var_9)
  var_8 = 0;
  } else {
  var_16 = anglestoforward(level._id_5A23[var_0._id_0336]._id_5A25.angles + (0, 180, 0));

  if (acos(clamp(vectordot(var_16, var_15), -1, 1)) > var_9)
  var_8 = 0;
  }
  }

  if (var_7 || var_8) {
  if (var_7)
  var_6 = 0;

  var_17 = 360;

  if (!var_6)
  var_18 = level._id_5A23[var_0._id_0336]._id_74C0;
  else
  var_18 = level._id_5A23[var_0._id_0336]._id_74C1;

  var_19 = anglestoforward(level._id_5A23[var_0._id_0336]._id_5A2A.angles);
  var_20 = anglestoforward(level._id_5A23[var_0._id_0336]._id_5A24 + (0, var_18, 0));
  var_2 connectpaths();
  var_21 = "ges_doorpeek_bash";
  var_22 = _id_12AB(var_0._id_0336, var_6);

  if (isdefined(var_22))
  var_21 = var_22;

  level.player _meth_8441(var_21);
  var_0 playsound("doorpeek_" + _id_1299(var_3) + "_bash");
  level notify(var_0._id_0336 + "door_peek_bash_open");
  level notify("door_peek_bash_open");

  if (var_1 != var_6) {
  var_23 = anglestoforward(level._id_5A23[var_0._id_0336]._id_5A24);
  var_24 = acos(clamp(vectordot(var_19, var_23), -1, 1));
  var_25 = acos(clamp(vectordot(var_20, var_23), -1, 1));
  var_26 = var_24 / var_17;
  var_27 = var_25 / var_17;
  level._id_5A23[var_0._id_0336]._id_5A2A rotateto(level._id_5A23[var_0._id_0336]._id_5A24, var_26, 0.0, 0.0);
  wait(var_26);
  level._id_5A23[var_0._id_0336]._id_5A2A rotateto(level._id_5A23[var_0._id_0336]._id_5A24 + (0, var_18, 0), var_27, 0.0, 0.0);
  wait(var_27);
  } else {
  var_28 = acos(clamp(vectordot(var_19, var_20), -1, 1));
  var_29 = var_28 / var_17;
  level._id_5A23[var_0._id_0336]._id_5A2A rotateto(level._id_5A23[var_0._id_0336]._id_5A24 + (0, var_18, 0), var_29, 0.0, 0.0);
  wait(var_29);
  }

  wait 0.05;
  var_2 disconnectpaths();
  level._id_5A23[var_0._id_0336]._id_5A2A delete();
  level notify(var_0._id_0336 + "door_peek_finished");
  level notify("door_peek_finished");
  break;
  }

  wait 0.05;
  }
}

_id_11FC(var_0) {
  var_1 = level._id_5A23[var_0._id_0336]._id_5A25;
  var_2 = anglestoforward(level._id_5A23[var_0._id_0336]._id_5A2A.angles);
  var_3 = -1 * anglestoright(level._id_5A23[var_0._id_0336]._id_5A2A.angles);
  var_4 = level.player.origin - var_1.origin;
  var_5 = vectornormalize(var_4);
  var_6 = level._id_5A23[var_0._id_0336]._id_5A58 + 8;
  var_7 = 48;

  if (distance(level.player.origin, var_1.origin) > var_6 + var_7)
  return undefined;

  if (vectordot(var_4, var_2) < 0)
  var_8 = 0;
  else
  var_8 = 1;

  if (!var_8) {
  var_9 = vectordot(var_5, var_3);

  if (var_9 <= 0)
  return undefined;

  var_10 = abs(length(var_4) * var_9);

  if (var_10 > var_6)
  return undefined;

  var_11 = -1 * var_2;
  var_9 = vectordot(var_5, var_11);
  var_10 = abs(length(var_4) * var_9);

  if (var_10 > var_7)
  return undefined;
  } else {
  var_9 = vectordot(var_5, var_3);

  if (var_9 <= 0)
  return undefined;

  var_10 = abs(length(var_4) * var_9);

  if (var_10 > var_6)
  return undefined;

  var_9 = vectordot(var_5, var_2);
  var_10 = abs(length(var_4) * var_9);

  if (var_10 > var_7)
  return undefined;
  }

  return var_8;
}

_id_12F4(var_0) {
  var_1 = scripts\engine\utility::_id_8180("door_peek_struct", "script_noteworthy");
  var_2 = [];

  foreach (var_4 in var_1)
  var_2[var_2.size] = var_4._id_0336;

  var_6 = undefined;
  var_7 = undefined;

  foreach (var_9 in var_2) {
  if (!isdefined(level._id_5A23[var_9]) || !isdefined(level._id_5A23[var_9]._id_5A25))
  continue;

  var_10 = distance(level.player.origin, level._id_5A23[var_9]._id_5A25.origin);

  if (!isdefined(var_6) || var_10 < var_6) {
  var_6 = var_10;
  var_7 = var_9;
  }
  }

  if (var_7 == var_0)
  return 1;
  else
  return 0;
}

_id_11FD(var_0) {
  var_1 = undefined;

  foreach (var_3 in scripts\engine\utility::_id_8180("door_peek_struct", "script_noteworthy")) {
  if (var_3._id_0336 == var_0._id_0336) {
  var_1 = var_3;
  break;
  }
  }

  var_5 = var_0._id_0336;
  var_6 = level._id_5A23[var_5]._id_C9FE;
  var_7 = anglestoforward(level._id_5A23[var_0._id_0336]._id_5A25.angles);
  var_8 = -1 * anglestoright(level._id_5A23[var_0._id_0336]._id_5A25.angles);
  var_9 = level._id_5A23[var_0._id_0336]._id_5A25.origin + var_7 * var_6._id_11782 * -0.5;
  var_10 = level.player.origin - var_9;
  var_11 = vectornormalize(var_10);
  var_12 = level._id_5A23[var_5]._id_5A58 + 8;
  var_13 = 48;

  if (distance(level.player.origin, var_9) > var_12 + var_13)
  return undefined;

  if (vectordot(var_10, var_7) < 0)
  var_14 = 0;
  else
  var_14 = 1;

  if (!var_14) {
  var_15 = vectordot(var_11, var_8);

  if (var_15 <= 0)
  return undefined;

  var_16 = abs(length(var_10) * var_15);

  if (var_16 > var_12)
  return undefined;

  var_17 = -1 * var_7;
  var_15 = vectordot(var_11, var_17);
  var_16 = abs(length(var_10) * var_15);

  if (var_16 > var_13)
  return undefined;
  } else {
  var_15 = vectordot(var_11, var_8);

  if (var_15 <= 0)
  return undefined;

  var_16 = abs(length(var_10) * var_15);

  if (var_16 > var_12)
  return undefined;

  var_15 = vectordot(var_11, var_7);
  var_16 = abs(length(var_10) * var_15);

  if (var_16 > var_13)
  return undefined;
  }

  return var_14;
}

_id_11F9(var_0, var_1, var_2, var_3, var_4, var_5) {
  level.player endon("death");
  var_6 = var_1._id_EE52;

  if (!isdefined(var_3))
  var_3 = 0;

  var_7 = 0.2;

  if (!var_2)
  level.player scripts\engine\utility::_id_50E1(var_7, ::_meth_8442, "ges_doorpeek_" + _id_1297(var_6));
  else
  level.player scripts\engine\utility::_id_50E1(var_7, ::_meth_8442, "ges_doorpeek_" + _id_1297(var_6) + "_r");

  level.player scripts\engine\utility::_id_50E1(var_7, ::_meth_8442, "ges_drophand");
  level.player scripts\engine\utility::_id_50E1(var_7, ::_meth_8442, "ges_doorpeek_civlever_r");
  var_1 stoploopsound("doorpeek_" + _id_1299(var_6) + "_move_loop");
  level notify(var_0 + "door_peek_start_detach");
  level notify("door_peek_start_detach");
  var_8 = undefined;

  if (!var_3) {
  var_8 = level.player scripts\engine\utility::_id_107E6();
  level.player _meth_823D(var_8, "tag_origin", 1, 90, 90, 90, 90, 0);
  }

  _id_1200();
  var_9 = level._id_5A23[var_0]._id_C9FD gettagangles("tag_player");
  var_10 = level.player getplayerangles();
  level._id_5A23[var_0]._id_C9FD delete();
  level notify(var_0 + "door_peek_detach");

  if (!var_3) {
  if (scripts\engine\utility::_id_6E25("doorpeek_hand_on_door")) {
  var_11 = level.player getplayerangles(1);
  var_12 = _id_0B91::_id_10639("player_rig", level.player.origin, var_11);
  var_13 = level.player _meth_84C6("currentViewModel");

  if (isdefined(var_13))
  var_12 setmodel(var_13);

  var_14 = (0, 0, 0);
  var_15 = (var_9[0] - var_10[0], var_9[1] - var_10[1], 0);
  var_12 _meth_81E2(level.player, "tag_origin", (0, 0, 0) + var_14, var_15, 0);

  if (!var_2)
  var_12 thread _id_0B06::_id_1F35(var_12, "doorpeek_" + _id_1297(var_6) + "_out");
  else
  var_12 thread _id_0B06::_id_1F35(var_12, "doorpeek_" + _id_1297(var_6) + "_r_out");

  var_12 scripts\engine\utility::_id_50E1(0.2, ::delete);
  }

  var_16 = _id_12A1(var_0, var_2);
  var_17 = 0.2;
  var_8 moveto(var_16, var_17, var_17 / 2.0, 0.0);

  if (var_1._id_EE52 == "airlock")
  level.player _id_0B91::_id_2B76(0);

  level.player _meth_80D8(0.4, 0.4);
  wait(var_17);
  wait 0.05;
  level.player unlink();

  if (var_1._id_EE52 == "airlock") {
  level.player _id_0B91::_id_2B76(0.25, 0.5);
  level.player scripts\engine\utility::delaythread(0.5, _id_0B91::_id_2B76, 1, 0.7);
  }

  level.player _meth_80D8(0.6, 0.6);
  level.player scripts\engine\utility::_id_50E1(0.5, ::_meth_80A6);
  }

  if (!isdefined(var_4) || var_4 == 0)
  level._id_5A23[var_0]._id_5A2A delete();

  if (!isdefined(var_5) || var_5 == 0) {
  level._id_5A23[var_0]._id_59FF delete();

  if (isdefined(level._id_5A23[var_0]._id_A5A9))
  level._id_5A23[var_0]._id_A5A9 delete();

  if (isdefined(level._id_5A23[var_0]._id_A5AA))
  level._id_5A23[var_0]._id_A5AA delete();
  }

  level.player._id_5966 = undefined;
}

_id_11D6(var_0, var_1, var_2) {
  var_3 = level.player scripts\engine\utility::_id_107E6();
  level.player _meth_823D(var_3, "tag_origin", 1, 90, 90, 90, 90, 0);
  var_4 = level.player getplayerangles();

  if (!isdefined(var_2) || !var_2) {
  if (isdefined(level._id_5A23[var_0]._id_C9FD))
  level._id_5A23[var_0]._id_C9FD delete();
  }
  else if (isdefined(level._id_5A23[var_0]._id_A5AE))
  level._id_5A23[var_0]._id_A5AE delete();

  var_5 = _id_12A1(var_0, var_1);
  var_3.origin = var_5;
  wait 0.05;
  level.player unlink();
  var_3 delete();
}

_id_12A1(var_0, var_1) {
  var_2 = level._id_5A23[var_0]._id_5978;
  var_3 = 12.0;
  var_4 = 17.0;

  if (!var_1) {
  var_5 = anglestoforward(level._id_5A23[var_0]._id_5A25.angles);
  var_6 = anglestoforward(level._id_5A23[var_0]._id_59FF.angles) * -1.0;
  var_7 = _id_794C(var_0);
  var_8 = level._id_5A23[var_0]._id_59FF.origin - level._id_5A23[var_0]._id_5A25.origin;
  var_9 = rotatevector(var_8, (0, var_7, 0));
  var_10 = level._id_5A23[var_0]._id_5A25.origin + var_9;
  var_11 = anglestoright(level._id_5A23[var_0]._id_5A25.angles);
  var_12 = anglestoright(level._id_5A23[var_0]._id_59FF.angles) * -1.0;
  } else {
  var_13 = -1;
  var_5 = anglestoforward(level._id_5A23[var_0]._id_5A26.angles);
  var_6 = anglestoforward(level._id_5A23[var_0]._id_5A00.angles) * -1.0;
  var_7 = _id_794C(var_0) * -1;
  var_8 = level._id_5A23[var_0]._id_5A00.origin - level._id_5A23[var_0]._id_5A26.origin;
  var_9 = rotatevector(var_8, (0, var_7, 0));
  var_10 = level._id_5A23[var_0]._id_5A26.origin + var_9;
  var_11 = anglestoright(level._id_5A23[var_0]._id_5A26.angles) * -1.0;
  var_12 = anglestoright(level._id_5A23[var_0]._id_5A00.angles) * -1.0;
  }

  var_14 = 0.2;
  var_15 = level.player.origin + var_6 * var_3 * -1.0;
  var_16 = var_15 - var_10;
  var_16 = scripts\engine\utility::_id_6EE6(var_16) * length2d(var_16);
  var_17 = vectordot(var_11, var_16);

  if (var_17 < var_4) {
  var_18 = var_4 - var_17;
  var_19 = vectordot(var_11, var_12);
  var_20 = var_18 / var_19;
  var_15 = var_15 + var_12 * var_20;
  }

  var_21 = scripts\engine\trace::_id_DCED(var_15 + (0, 0, 32), var_15 + (0, 0, -100), undefined, scripts\engine\trace::_id_4956(1));
  var_22 = max(level._id_5A23[var_0]._id_5A25.origin[2], var_21["position"][2]);
  var_15 = (var_15[0], var_15[1], var_22);
  return var_15;
}

_id_120D(var_0, var_1, var_2) {
  level.player endon("death");
  level endon(var_0 + "door_peek_kick");
  level endon(var_0 + "door_peek_detach");

  for (;;) {
  if (level.player _meth_819F())
  break;

  wait 0.05;
  }

  level notify(var_0 + "door_peek_alert_enemies");
  level notify("door_peek_alert_enemies");
  level notify(var_0 + "door_peek_shoot");
}

_id_11EA(var_0, var_1, var_2, var_3, var_4) {
  level.player endon("death");
  level endon(var_0 + "door_peek_kick");
  level endon(var_0 + "door_peek_opened_fully");
  level endon(var_0 + "door_peek_sprint");
  level endon(var_0 + "door_peek_pop_open");

  if (isdefined(level._id_5A23[var_0]._id_55B2) && level._id_5A23[var_0]._id_55B2)
  return;

  level waittill(var_0 + "door_peek_start_peek_control");
  var_5 = 0;
  var_6 = 0;

  for (;;) {
  var_7 = _id_1296(var_0, var_2);

  if (var_5 < -0.5 && var_7 < -0.5)
  var_6++;
  else
  var_6 = 0;

  if (var_6 >= 2)
  break;

  var_5 = var_7;
  wait 0.05;
  }

  level notify(var_0 + "door_peek_back_off");
  level notify("door_peek_back_off");
  var_8 = 70;
  var_9 = level._id_5A23[var_0]._id_5A57;

  if (var_9 == "airlock" || var_9 == "airlocksdf" || var_9 == "airlockcombat" || var_9 == "airlockcombatsdf")
  var_8 = 60;

  if (_id_794C(var_0) < var_8) {
  thread _id_11F9(var_0, var_1, var_2, 0, 1);
  thread _id_120B(var_1, var_2, var_3);
  }
  else
  thread _id_1210(var_0, var_2);
}

_id_1209(var_0, var_1, var_2, var_3) {
  level.player endon("death");
  level endon(var_0 + "door_peek_kick");
  level endon(var_0 + "door_peek_opened_fully");
  level endon(var_0 + "door_peek_back_off");

  if (isdefined(level._id_5A23[var_0]._id_560A) && level._id_5A23[var_0]._id_560A)
  return;

  level waittill(var_0 + "door_peek_start_peek_control");

  for (;;) {
  if (!var_2 && level._id_5A23[var_0]._id_5A21 >= 28.0)
  break;
  else if (var_2 && level._id_5A23[var_0]._id_5A21 <= -28.0)
  break;

  wait 0.05;
  }

  var_4 = 112.0;
  var_5 = 100.0;
  var_6 = 0;

  for (;;) {
  var_7 = 0;
  var_8 = level.player _meth_814C();

  if (var_8[0] <= 0.5 && var_8[1] <= 0.5) {
  wait 0.05;
  continue;
  }

  var_9 = vectornormalize((var_8[0], 0 - var_8[1], 0));
  var_10 = vectortoangles(var_9);
  var_11 = level.player getplayerangles(1);
  var_12 = _func_048(var_11, var_10);
  var_13 = anglestoforward(var_12);
  var_14 = level.player getplayerangles(1);
  var_15 = anglestoforward(var_14);

  if (!var_2)
  var_16 = anglestoforward(level._id_5A23[var_0]._id_59FF.angles + (0, 180, 0));
  else
  var_16 = anglestoforward(level._id_5A23[var_0]._id_5A00.angles + (0, 180, 0));

  var_17 = acos(clamp(vectordot(var_16, var_15), -1, 1));

  if (var_17 >= var_4) {
  var_18 = acos(clamp(vectordot(var_16, var_13), -1, 1));

  if (var_17 >= var_5)
  var_6++;
  }
  else
  var_6 = 0;

  if (var_6 >= 1)
  break;

  wait 0.05;
  }

  if (isdefined(level._id_5A23[var_0]._id_560A) && level._id_5A23[var_0]._id_560A)
  return;

  level notify(var_0 + "door_peek_pop_open");
  thread _id_1210(var_0, var_2);
}

_id_120F(var_0, var_1, var_2, var_3) {
  level endon(var_0 + "door_peek_kick");
  level endon(var_0 + "door_peek_opened_fully");
  level endon(var_0 + "door_peek_back_off");
  level waittill(var_0 + "door_peek_start_peek_control");

  for (;;) {
  if (level.player _meth_81BD())
  break;

  wait 0.05;
  }

  level notify(var_0 + "door_peek_sprint");
  thread _id_1210(var_0, var_2);
}

_id_1296(var_0, var_1) {
  var_2 = level.player _meth_814C();
  var_3 = level._id_5A23[var_0]._id_5978;

  if (!var_1) {
  var_4 = anglestoforward(level._id_5A23[var_0]._id_5A25.angles);
  var_5 = anglestoforward(level._id_5A23[var_0]._id_59FF.angles) * -1.0;
  } else {
  var_4 = anglestoforward(level._id_5A23[var_0]._id_5A26.angles);
  var_5 = anglestoforward(level._id_5A23[var_0]._id_5A00.angles) * -1.0;
  }

  var_6 = 0;
  var_7 = vectornormalize((var_2[0], 0 - var_2[1], 0));
  var_8 = vectortoangles(var_7);
  var_9 = level.player getplayerangles(1);
  var_10 = _func_048(var_9, var_8);
  var_11 = anglestoforward(var_10);
  var_12 = level.player getplayerangles(1);
  var_13 = anglestoforward(var_12);
  var_14 = level.player geteye() + (0, 0, -6) + 16 * anglestoforward(level.player.angles);
  var_15 = min(1.0, sqrt(squared(var_2[0]) + squared(var_2[1])));

  if (var_15 <= 0.1)
  return 0;

  if (var_15 >= 0.95)
  var_15 = 1.0;

  var_16 = acos(clamp(vectordot(var_11, var_4), -1, 1));
  var_17 = acos(clamp(vectordot(var_11, var_13), -1, 1));
  var_18 = acos(clamp(vectordot(var_11, var_5), -1, 1));
  var_19 = _id_54E3(var_11, var_5, var_13);
  var_20 = 0.25;
  var_21 = 20;
  var_22 = 90;

  if (var_16 < 90 || var_19 || var_18 < 90) {
  var_23 = 1.0;

  if (var_19) {} else {
  var_24 = min(var_16, var_17);
  var_24 = min(var_24, var_18);

  if (var_24 > var_21) {
  if (var_24 <= var_22) {
  var_25 = var_24 - var_21;
  var_23 = 1.0 - (1.0 - var_20) * (var_25 / (var_22 - var_21));
  }
  else
  var_23 = 0;
  }
  }

  var_26 = min(var_15, var_23);
  return var_26;
  } else {
  var_23 = 1.0;
  var_26 = min(var_15, var_23) * -1;
  return var_26;
  }
}

_id_54E3(var_0, var_1, var_2) {
  var_3 = acos(clamp(vectordot(var_1, var_2), -1, 1));
  var_4 = acos(clamp(vectordot(var_0, var_1), -1, 1));
  var_5 = acos(clamp(vectordot(var_0, var_2), -1, 1));
  var_6 = 1.0;

  if (abs(var_4 + var_5 - var_3) <= var_6)
  return 1;

  return 0;
}

_id_59BE(var_0, var_1, var_2, var_3) {
  level.player endon("death");

  if (!isdefined(var_1))
  var_1 = 0;

  if (var_1)
  level endon(var_0 + "door_peek_main_side_used");
  else
  level endon(var_0 + "door_peek_reverse_side_used");

  level endon(var_0 + "door_peek_deleted");
  level endon(var_0 + "door_peek_start_detach");
  level endon(var_0 + "door_peek_restarted");

  if (!scripts\engine\utility::_id_6E34(var_0 + "door_peek_can_kick"))
  scripts\engine\utility::_id_6E39(var_0 + "door_peek_can_kick");

  if (!scripts\engine\utility::_id_6E34(var_0 + "door_peek_handle_down"))
  scripts\engine\utility::_id_6E39(var_0 + "door_peek_handle_down");

  if (!scripts\engine\utility::_id_6E34(var_0 + "did_kick_interrupt_input"))
  scripts\engine\utility::_id_6E39(var_0 + "did_kick_interrupt_input");

  var_4 = getentarray(var_0, "targetname");
  var_4 = scripts\engine\utility::_id_227F(var_4, scripts\engine\utility::_id_8180(var_0, "targetname"));
  var_5 = _id_12A6(var_4, "door_peek_door");
  var_6 = var_5._id_EE52;
  var_7 = 0;

  if (var_6 == "airlock")
  var_7 = 1;

  _id_59D5(var_0, 1);

  if (var_6 == "airlock" || var_6 == "airlockcombat")
  var_5 _id_0B1F::_id_1AB6("unlocked");

  thread _id_1211(var_0, var_1, var_2, var_7);
  var_8 = 1;

  if (isdefined(var_3) && var_3 == 1)
  var_8 = 0;

  level waittill(var_0 + "door_peek_start");

  while (level.player usebuttonpressed())
  wait 0.05;

  if (var_6 == "airlock")
  _id_1159(1, var_0);
  else
  _id_1159(0, var_0);

  thread _id_1414(var_0);

  if (var_8) {
  for (;;) {
  scripts\engine\utility::_id_6E2A(var_0 + "did_kick_interrupt_input");
  thread _id_11F1(var_0);
  scripts\engine\utility::_id_6E4C(var_0 + "did_kick_interrupt_input");

  if (isdefined(level._id_5A23[var_0]._id_55F5) && level._id_5A23[var_0]._id_55F5)
  return;

  level notify(var_0 + "remove_hint_text");
  level._id_5A23[var_0]._id_A5AB = 1;
  scripts\engine\utility::_id_6E4C(var_0 + "door_peek_can_kick");
  level notify(var_0 + "door_peek_kick");
  level notify("door_peek_kick");
  thread _id_59A4();
  scripts\engine\utility::waitframe();

  if (var_6 != "airlock")
  thread _id_11F0(var_0, var_1);
  else
  thread _id_11ED(var_0);

  if (var_7) {
  level waittill(var_0 + "door_kick_multi_kick_ready");
  _id_1159(1, var_0);
  thread _id_1414(var_0);
  continue;
  }

  break;
  }
  }
}

_id_59D5(var_0, var_1) {
  var_2 = _id_794D(var_0);
  var_3 = var_2._id_01F1;

  if (var_1) {
  if (_id_0B91::_id_8C32(var_3, "tag_locked"))
  var_2 _meth_8187("tag_locked", var_3);

  if (_id_0B91::_id_8C32(var_3, "tag_unlocked"))
  var_2 _meth_8387("tag_unlocked", var_3);

  if (_id_0B91::_id_8C32(var_3, "door_locked"))
  var_2 _meth_8187("door_locked", var_3);

  if (_id_0B91::_id_8C32(var_3, "door_unlocked"))
  var_2 _meth_8387("door_unlocked", var_3);

  if (_id_0B91::_id_8C32(var_3, "door_inactive"))
  var_2 _meth_8187("door_inactive", var_3);
  } else {
  if (_id_0B91::_id_8C32(var_3, "tag_locked"))
  var_2 _meth_8387("tag_locked", var_3);

  if (_id_0B91::_id_8C32(var_3, "tag_unlocked"))
  var_2 _meth_8187("tag_unlocked", var_3);

  if (_id_0B91::_id_8C32(var_3, "door_locked"))
  var_2 _meth_8387("door_locked", var_3);

  if (_id_0B91::_id_8C32(var_3, "door_unlocked"))
  var_2 _meth_8187("door_unlocked", var_3);

  if (_id_0B91::_id_8C32(var_3, "door_inactive"))
  var_2 _meth_8187("door_inactive", var_3);
  }
}

_id_59A4() {
  wait 0.75;
  level.player playrumbleonentity("grenade_rumble");
  earthquake(0.35, 0.75, level.player.origin, 200);
  _id_0F18::_id_10E8A("broadcast", "attack", level.player geteye(), 800);
}

_id_1159(var_0, var_1) {
  if (isdefined(level._id_5A23[var_1]._id_C067))
  return;

  scripts\engine\utility::_id_6E3E("show_peek_hint");

  if (isdefined(level._id_5A23[var_1]._id_C9F9)) {
  if (level._id_4542 || level.player _meth_83D8())
  _id_0B91::_id_56BA("peek_only_hint");
  else
  _id_0B91::_id_56BA("peek_only_hint_pc");
  }
  else if (!isdefined(var_0) || var_0 == 0) {
  if (level._id_4542 || level.player _meth_83D8())
  _id_0B91::_id_56BA("peek_hint");
  else
  _id_0B91::_id_56BA("peek_hint_pc");
  }
  else if (level._id_4542 || level.player _meth_83D8())
  _id_0B91::_id_56BA("peek_hint_shove");
  else
  _id_0B91::_id_56BA("peek_hint_shove_pc");
}

_id_1414(var_0) {
  level scripts\engine\utility::waittill_any(var_0 + "door_peek_start_detach", var_0 + "remove_hint_text");
  scripts\engine\utility::_id_6E2A("show_peek_hint");
}

_id_794C(var_0) {
  if (!isdefined(level._id_5A23[var_0]))
  return 0.0;
  else if (!isdefined(level._id_5A23[var_0]._id_5A2A))
  return 180.0;

  var_1 = _id_12AE(var_0);
  return var_1;
}

_id_59C9(var_0) {
  level._id_5A23[var_0]._id_72C6 = 1;
}

_id_F366(var_0, var_1) {
  level._id_5A23[var_0]._id_B7C6 = var_1;
}

_id_551D(var_0) {
  level notify(var_0 + "door_peek_disabled");
}

_id_12AE(var_0) {
  var_1 = abs(level._id_5A23[var_0]._id_5A2A.angles[1] - level._id_5A23[var_0]._id_5A24[1]);

  if (var_1 > 180.0)
  var_1 = 360.0 - var_1;

  return var_1;
}

_id_11F1(var_0) {
  level endon(var_0 + "door_peek_start_detach");
  level endon(var_0 + "door_peek_restarted");

  if (level._id_4542 || level.player _meth_83D8())
  level.player waittill("kick_pressed");
  else
  level.player waittill("kick_pressed_pc");

  scripts\engine\utility::_id_6E3E(var_0 + "did_kick_interrupt_input");
}

_id_1201() {
  level.player _id_0B91::_id_1C49(0);
  level.player scripts\engine\utility::_id_1C40(0);
  level.player scripts\engine\utility::_id_1C60(0);
  level.player scripts\engine\utility::_id_1C53(0);
  level.player scripts\engine\utility::_id_1C4E(0);
  level.player scripts\engine\utility::_id_1C6E(0);
  level.player _meth_80A9();
  level.player _id_0B91::_id_1C72(0);
  level.player scripts\engine\utility::_id_1C56(0);
}

_id_1200() {
  level.player _id_0B91::_id_1C49(1);
  level.player scripts\engine\utility::_id_1C40(1);
  level.player scripts\engine\utility::_id_1C60(1);
  level.player scripts\engine\utility::_id_1C53(1);
  level.player scripts\engine\utility::_id_1C4E(1);
  level.player scripts\engine\utility::_id_1C6E(1);
  level.player _meth_80DB();
  level.player _id_0B91::_id_1C72(1);
  level.player scripts\engine\utility::_id_1C56(1);
}

_id_1205() {
  level.player scripts\engine\utility::_id_1C46(0);
  level.player scripts\engine\utility::_id_1C62(0);
  level.player scripts\engine\utility::_id_1C35(0);
  level.player scripts\engine\utility::_id_1C58(0);
  level.player scripts\engine\utility::_id_1C76(0);
}

_id_1204() {
  level.player scripts\engine\utility::_id_1C46(1);
  level.player scripts\engine\utility::_id_1C62(1);
  level.player scripts\engine\utility::_id_1C35(1);
  level.player scripts\engine\utility::_id_1C58(1);
  level.player scripts\engine\utility::_id_1C76(1);
}

_id_11EF() {
  level.player scripts\engine\utility::_id_1C46(0);
  level.player scripts\engine\utility::_id_1C62(0);
  level.player scripts\engine\utility::_id_1C35(0);
  level.player scripts\engine\utility::_id_1C58(0);
}

_id_11EE() {
  level.player scripts\engine\utility::_id_1C46(1);
  level.player scripts\engine\utility::_id_1C62(1);
  level.player scripts\engine\utility::_id_1C35(1);
  level.player scripts\engine\utility::_id_1C58(1);
}

_id_11EC(var_0) {
  level endon(var_0 + "door_kick_newdoor_think");
  level endon(var_0 + "door_peek_opened_fully");
  var_1 = getentarray(var_0, "targetname");
  var_1 = scripts\engine\utility::_id_227F(var_1, scripts\engine\utility::_id_8180(var_0, "targetname"));
  var_2 = _id_12A6(var_1, "door_peek_door");
  var_3 = _id_12A6(var_1, "door_peek_clip");
  var_4 = var_2._id_EE52;
  var_3 linkto(var_2);
  var_5 = _id_12A6(var_1, "door_kick_animstruct");
  var_6 = _id_12A6(var_1, "door_kick_animstruct2");
  var_7 = var_5 scripts\engine\utility::_id_107E6();
  var_8 = var_6 scripts\engine\utility::_id_107E6();
  var_9 = var_2 scripts\engine\utility::_id_107E6();
  var_9.angles = var_7.angles;
  var_10 = 90.0;
  var_11 = level._id_5A23[var_0]._id_C9FE;
  var_12 = 120.0;
  var_13 = level._id_5A23[var_0]._id_5A24 + (0, 0 - var_11._id_47A3, 0);
  level notify(var_0 + "door_kick_start");
  _id_11EF();
  level._id_5A23[var_0]._id_59FF thread _id_0B06::_id_1F35(level._id_5A23[var_0]._id_C9FD, "doorpeek_airlock_bash");
  var_14 = 0.2;
  var_15 = 2.4;
  var_16 = 1.1;
  var_17 = 140.0;
  var_18 = 140.0;
  var_19 = 0.8;
  wait(var_14);
  level._id_5A23[var_0]._id_C9D4 = 1;
  var_20 = level._id_5A23[var_0]._id_5A21;
  var_21 = var_20 + var_17;
  var_21 = clamp(var_21, 0.0, var_18);
  var_22 = var_13 + (0, 0 - var_21, 0);
  level._id_5A23[var_0]._id_5A2A rotateto(var_22, var_15, 0.0, 0.2);
  var_2 thread scripts\engine\utility::_id_CE2B("doorpeek_" + _id_1299(var_4) + "_kick", var_2.origin);
  thread _id_1351(var_0);
  wait(var_16);
  level thread _id_0B91::_id_C12D(var_0 + "door_kick_multi_kick_ready", 0.5);
  _id_11F9(var_0, var_2, 0, 1, 1);
  _id_1201();
  level notify(var_0 + "door_kick_open");
  level notify("door_kick_open");
  var_23 = var_7 _id_12A0(0, 30, 0);
  var_24 = level.player scripts\engine\utility::_id_107E6();
  level.player _meth_823D(var_24, "tag_origin", 1, 10, 10, 10, 10, 0);
  var_24 moveto(var_23, var_19, 0.0, 0.2);
  var_24 rotateto((var_24.angles[0], var_5.angles[1], var_24.angles[2]), 0.5, 0.0, 0.2);
  wait(var_19);
  _id_11EE();
  level notify(var_0 + "stop_fake_origin_link");
  level notify(var_0 + "door_kick_finished");
  var_24.origin = getgroundposition(var_24.origin, 10, 30, 30);
  wait 0.05;
  var_24 delete();
  level.player unlink();
  _id_1200();
}

_id_11ED(var_0) {
  level endon(var_0 + "door_kick_newdoor_think");
  level endon(var_0 + "door_peek_opened_fully");
  var_1 = getentarray(var_0, "targetname");
  var_1 = scripts\engine\utility::_id_227F(var_1, scripts\engine\utility::_id_8180(var_0, "targetname"));
  var_2 = _id_12A6(var_1, "door_peek_door");
  var_3 = _id_12A6(var_1, "door_peek_clip");
  var_4 = var_2._id_EE52;
  var_3 linkto(var_2);
  var_5 = _id_12A6(var_1, "door_kick_animstruct");
  var_6 = _id_12A6(var_1, "door_kick_animstruct2");
  var_7 = var_5 scripts\engine\utility::_id_107E6();
  var_8 = var_6 scripts\engine\utility::_id_107E6();
  var_9 = var_2 scripts\engine\utility::_id_107E6();
  var_9.angles = var_7.angles;
  var_10 = 90.0;
  var_11 = level._id_5A23[var_0]._id_C9FE;
  var_12 = 120.0;
  var_13 = level._id_5A23[var_0]._id_5A24 + (0, 0 - var_11._id_47A3, 0);
  level notify(var_0 + "door_kick_start");
  _id_11EF();
  level._id_5A23[var_0]._id_59FF thread _id_0B06::_id_1F35(level._id_5A23[var_0]._id_C9FD, "doorpeek_airlock_bash");
  level.player _meth_8441("ges_doorpeek_airlock_bash", undefined, 1);
  var_14 = 0.2;
  var_15 = 1.75;
  var_16 = 0.75;
  var_17 = 90.0;
  var_18 = 90.0;
  var_19 = 0.5;
  var_20 = 0.5;
  wait(var_14);
  level._id_5A23[var_0]._id_C9D4 = 1;
  var_21 = level._id_5A23[var_0]._id_5A21;
  var_22 = var_21 + var_17;
  var_22 = clamp(var_22, 0.0, var_18);
  var_23 = (var_21 - var_22) * -1 / var_22;
  var_24 = clamp(var_23 * var_15, var_16, var_15);
  var_25 = clamp(var_24 - var_19, var_20, var_24);
  var_26 = var_13 + (0, 0 - var_22, 0);
  level._id_5A23[var_0]._id_5A2A rotateto(var_26, var_24, var_24 * 0.4, 0);
  var_2 playsound("doorpeek_" + _id_1299(var_4) + "_shove");
  thread _id_1351(var_0);
  scripts\engine\utility::delaythread(var_25, ::_id_11EE);
  level.player scripts\engine\utility::_id_50E1(var_25, ::_meth_8442, "ges_doorpeek_airlock_bash", 0.2);
  wait(var_24);
  level._id_5A23[var_0]._id_5A21 = var_22;
  level._id_5A23[var_0]._id_C9D4 = 0;
  level notify(var_0 + "door_kick_finished");
  level notify("door_kick_finished");
  level thread _id_0B91::_id_C12D(var_0 + "door_kick_multi_kick_ready", 0.5);
}

_id_1351(var_0) {
  level.player endon("death");
  level endon(var_0 + "door_kick_finished");
  var_1 = level._id_5A23[var_0]._id_C9FE;
  var_2 = level._id_5A23[var_0]._id_5A24 + (0, 0 - var_1._id_47A3, 0);
  var_3 = 40;

  for (;;) {
  var_4 = _id_12AE(var_0) - var_1._id_47A3;
  var_5 = clamp(var_4 / var_1._id_B481, 0.0, 1.0) * (var_1._id_B4AA - var_1._id_B7C1) + var_1._id_B7C1;
  level.player _meth_81DF(0.0, 0.0, 0.0, var_1._id_0269, var_5, 20, 20);

  if (var_4 >= var_3) {
  var_6 = 1;
  level notify(var_0 + "door_peek_airlock_ally_move");
  level notify("door_peek_airlock_ally_move");
  }

  wait 0.05;
  }
}

_id_11F2(var_0, var_1, var_2) {
  level endon(var_0 + "door_kick_newdoor_think");
  level.player._id_5818 = 1;
  thread _id_11F3(var_0, var_1);
  level.player waittill("death");

  if (!isdefined(level.player._id_5A12) || !level.player._id_5A12)
  _id_11D6(var_0, var_1, 1);
  else
  {
  level.player unlink();

  if (isdefined(level._id_5A23[var_0]._id_A5AE))
  level._id_5A23[var_0]._id_A5AE delete();
  }
}

_id_11F3(var_0, var_1) {
  level.player endon("death");
  var_2 = [var_0 + "door_kick_newdoor_think"];
  level scripts\engine\utility::_id_13730(var_2);
  level.player._id_5818 = undefined;
}

_id_11F0(var_0, var_1, var_2) {
  level.player endon("death");
  level endon(var_0 + "door_kick_newdoor_think");
  thread _id_11F2(var_0, var_1, var_2);
  var_3 = getentarray(var_0, "targetname");
  var_3 = scripts\engine\utility::_id_227F(var_3, scripts\engine\utility::_id_8180(var_0, "targetname"));
  var_4 = _id_12A6(var_3, "door_peek_door");
  var_5 = _id_12A6(var_3, "door_peek_clip");
  var_6 = var_4._id_EE52;
  var_5 linkto(var_4);

  if (!var_1)
  var_7 = level._id_5A23[var_0]._id_A5A9;
  else
  var_7 = level._id_5A23[var_0]._id_A5AA;

  var_7.origin = var_7.origin + anglestoforward(var_7.angles) * -30;
  level notify(var_0 + "door_kick_start");
  level notify("door_kick_start");
  _id_11F9(var_0, var_4, var_1, 1, 1, 1);
  _id_1201();
  level.player._id_5966 = 1;

  if (!var_1)
  var_8 = level._id_5A23[var_4._id_0336]._id_74C0;
  else
  var_8 = level._id_5A23[var_4._id_0336]._id_74C1;

  var_9 = 0.65;
  var_10 = 0.3;
  var_11 = 0.0;
  var_12 = 0.05;
  var_13 = 0.2;
  var_14 = 1.0;

  if (_id_1297(level._id_5A23[var_0]._id_5A57) == "airlock") {
  var_9 = 0.65;
  var_10 = 0.7;
  var_11 = 0.05;
  var_12 = var_10 - 0.05;
  var_13 = 0.5;
  }

  var_15 = level._id_5A23[var_0]._id_5A21;
  var_16 = (var_15 - abs(var_8)) * -1 / var_8;
  var_17 = clamp(var_16 * var_10, var_13, var_10);
  var_18 = var_17 / var_10;
  var_19 = var_11 * var_18;
  var_20 = var_12 * var_18;
  level._id_5A23[var_0]._id_5A2A scripts\engine\utility::_id_50E1(var_9, ::rotateto, level._id_5A23[var_0]._id_5A24 + (0, var_8, 0), var_17, var_19, var_20);
  level._id_5A23[var_0]._id_5A2A scripts\engine\utility::_id_50E1(var_9 + var_17 + 0.05, ::delete);
  thread _id_59A5(var_9 - 0.05);
  var_5 scripts\engine\utility::_id_50E1(var_9, ::connectpaths);
  var_5 scripts\engine\utility::_id_50E1(var_9 + var_10 + 0.05, ::disconnectpaths);
  var_4 scripts\engine\utility::delaythread(var_9, scripts\engine\utility::_id_CE2B, "doorpeek_" + _id_1299(var_6) + "_kick", var_4.origin);
  level thread _id_0B91::_id_C12D(var_0 + "door_kick_open", var_9);
  level thread _id_0B91::_id_C12D("door_kick_open", var_9);
  var_21 = "doorpeek_kick";
  var_22 = "ges_doorpeek_kick";
  var_23 = _id_12AD(var_0, var_1);

  if (isdefined(var_23))
  var_22 = var_23;

  _id_11EF();
  scripts\engine\utility::delaythread(var_14, ::_id_11EE);
  var_24 = level.player getplayerangles(1);
  level._id_5A23[var_4._id_0336]._id_A5AE = _id_0B91::_id_10639("player_rig", level.player.origin, var_24);
  var_25 = level.player _meth_84C6("currentViewModel");

  if (isdefined(var_25))
  level._id_5A23[var_4._id_0336]._id_A5AE setmodel(var_25);

  var_7 thread _id_0B06::_id_1EC3(level._id_5A23[var_4._id_0336]._id_A5AE, var_21);
  var_26 = level._id_5A23[var_4._id_0336]._id_A5AE gettagorigin("tag_player");
  var_27 = var_7.origin - var_26;
  var_28 = level.player.origin - var_26;
  var_29 = var_24 - var_7.angles;
  var_30 = var_7.origin;
  var_31 = var_7.angles;
  var_7 unlink();
  var_7.origin = var_7.origin + var_28;
  var_32 = vectornormalize(var_7.origin - level.player.origin);
  var_33 = distance(var_7.origin, level.player.origin);
  var_32 = rotatevector(var_32, var_29);
  var_7.origin = level.player.origin + var_32 * var_33;
  var_7.angles = var_7.angles + var_29;
  level.player _meth_8441(var_22, undefined, 1, 0.2);
  var_7 thread _id_0B06::_id_1F35(level._id_5A23[var_4._id_0336]._id_A5AE, var_21);
  var_34 = getanimlength(level._id_5A23[var_4._id_0336]._id_A5AE _id_0B91::_id_7DC1(var_21));
  var_35 = 0.4;
  var_36 = 1.1;
  var_37 = 0.3;
  var_38 = 0.35;
  var_39 = 0.3;
  var_40 = 0.3;

  if (_id_1297(level._id_5A23[var_0]._id_5A57) == "airlock") {}

  level.player _meth_823C(level._id_5A23[var_4._id_0336]._id_A5AE, "tag_player", var_37, 0.0, 0.0);
  level.player scripts\engine\utility::_id_50E1(var_37, ::_meth_823D, level._id_5A23[var_4._id_0336]._id_A5AE, "tag_player", 1, 0, 0, 0, 0, 0);
  level.player scripts\engine\utility::_id_50E1(var_38, ::_meth_81DF, var_39, 0, 0, 40, 40, 60, 10);
  wait 0.05;
  level._id_5A23[var_4._id_0336]._id_A5AE linkto(var_7);
  var_7 moveto(var_30, var_35);
  var_7 rotateto(var_31, var_35);
  wait(var_35);
  level.player _id_0B91::_id_2B76(0.2, 0.05);

  if (isdefined(var_2)) {
  var_41 = 0.7;
  wait(var_36 - var_35 - var_41);
  var_42 = var_7 _id_12A0(-60, 0, 0);
  var_7 moveto(var_42, var_41, 0.2, 0.1);
  wait(var_41);
  }
  else if (isdefined(level._id_5A1C)) {
  if (level._id_5A1C > 0)
  wait(var_36 * level._id_5A1C);

  var_7 _id_0B91::_id_1F53();
  }
  else
  wait(var_36 - var_35);

  level notify(var_0 + "door_kick_finished");
  level notify("door_kick_finished");
  level notify(var_0 + "door_peek_finished");
  level notify("door_peek_finished");
  _id_13C9("kick");
  level.player unlink();
  var_7 delete();
  level._id_5A23[var_4._id_0336]._id_A5AE delete();
  level._id_5A23[var_4._id_0336]._id_59FF delete();
  level.player _id_0B91::_id_2B76(1.0, var_40);
  _id_1200();
  level.player._id_5966 = undefined;
  level notify(var_0 + "door_kick_newdoor_think");
  level.player._id_5A12 = undefined;
}

_id_59A5(var_0) {
  level.player endon("death");
  wait(var_0);
  level.player._id_5A12 = 1;
}

_id_59A2(var_0, var_1, var_2) {}

_id_120E(var_0) {
  level endon(var_0 + "door_kick_newdoor_think");
  level waittill("doorpeek_handle");

  if (soundexists("doorpeek_" + _id_1299(level._id_5A23[var_0]._id_5A57) + "_handle"))
  level._id_5A23[var_0]._id_5978 playsound("doorpeek_" + _id_1299(level._id_5A23[var_0]._id_5A57) + "_handle");
  else
  var_1 = "doorpeek_" + _id_1299(level._id_5A23[var_0]._id_5A57) + "_handle";
}

_id_12A6(var_0, var_1) {
  foreach (var_3 in var_0) {
  if (isdefined(var_3.script_noteworthy)) {
  if (var_3.script_noteworthy == var_1)
  return var_3;
  }
  }
}

_id_12A0(var_0, var_1, var_2) {
  var_3 = self.origin + anglestoforward(self.angles) * var_0 + anglestoright(self.angles) * var_1 + anglestoup(self.angles) * var_2;
  return var_3;
}

_id_59CF(var_0, var_1) {
  level.player endon("death");
  level endon(var_0 + "door_intro_done");

  if (!isdefined(var_1) || var_1 == 0)
  level scripts\engine\utility::waittill_any(var_0 + "door_peek_kick", var_0 + "door_peek_back_off", var_0 + "door_peek_sprint");
  else
  level scripts\engine\utility::waittill_any(var_0 + "door_peek_back_off", var_0 + "door_peek_sprint");

  _id_1204();
}

_id_13C9(var_0) {
  if (!isdefined(level._id_D9E5))
  return;

  if (!isdefined(level._id_D9E5["achievementDoorPeek"]))
  return;

  if (var_0 == "open")
  level._id_D9E5["achievementDoorPeek"]["achievementDoorPeekOpen"] = 1;
  else if (var_0 == "kick")
  level._id_D9E5["achievementDoorPeek"]["achievementDoorPeekKick"] = 1;
  else if (var_0 == "grenade")
  level._id_D9E5["achievementDoorPeek"]["achievementDoorPeekGrenade"] = 1;

  _id_0A2F::_id_3D6A(1);
}

_id_12AC(var_0, var_1) {
  var_2 = level.player getcurrentweapon();

  if (!isdefined(var_2))
  return undefined;

  var_3 = strtok(var_2, "+");
  var_2 = var_3[0];

  if (!isdefined(var_2))
  return undefined;

  if (var_2 == "alt_iw7_erad") {
  var_4 = _id_1297(level._id_5A23[var_0]._id_5A57);

  if (var_4 == "bulkhead" || var_4 == "airlock" || var_4 == "civlever" && !var_1) {
  return "ges_doorpeek_civlever_r";
  return;
  }
  }
  else if (var_2 == "iw7_mauler") {
  var_4 = _id_1297(level._id_5A23[var_0]._id_5A57);

  if (var_4 == "bulkhead" || var_4 == "airlock") {
  return "ges_doorpeek_civlever_r";
  return;
  }
  }
  else if (var_2 == "iw7_steeldragon") {
  var_4 = _id_1297(level._id_5A23[var_0]._id_5A57);

  if (var_4 == "bulkhead" || var_4 == "airlock")
  return "ges_doorpeek_civlever_r";
  }
}

_id_12AD(var_0, var_1) {
  var_2 = level.player getcurrentweapon();

  if (!isdefined(var_2))
  return undefined;

  var_3 = strtok(var_2, "+");
  var_2 = var_3[0];

  if (!isdefined(var_2))
  return undefined;

  if (var_2 == "alt_iw7_erad")
  return "ges_doorpeek_kick_eradshotty";
}

_id_12AB(var_0, var_1) {
  var_2 = level.player getcurrentweapon();

  if (!isdefined(var_2))
  return undefined;

  var_3 = strtok(var_2, "+");
  var_2 = var_3[0];

  if (!isdefined(var_2))
  return undefined;

  if (var_2 == "alt_iw7_erad")
  return "ges_doorpeek_bash_eradshotty";
}

_id_1466(var_0) {
  level.player endon("death");
  level endon(var_0 + "door_peek_kick");
  level endon(var_0 + "door_peek_detach");
  thread _id_1465(var_0);
  level._id_5A23[var_0]._id_13C81 = 0;
  var_1 = ["iw7_fmg", "alt_iw7_fmg"];
  var_2 = level.player getcurrentweapon();

  if (isdefined(var_2)) {
  var_3 = strtok(var_2, "+");
  var_2 = var_3[0];

  foreach (var_5 in var_1) {
  if (var_2 == var_5) {
  level._id_5A23[var_0]._id_13C81 = 1;
  break;
  }
  }
  }

  if (level._id_5A23[var_0]._id_13C81)
  level.player scripts\engine\utility::_id_1C76(0);

  for (;;) {
  level.player waittill("weapon_change");
  var_7 = level._id_5A23[var_0]._id_13C81;
  var_2 = level.player getcurrentweapon();

  if (isdefined(var_2)) {
  var_3 = strtok(var_2, "+");
  var_2 = var_3[0];

  foreach (var_5 in var_1) {
  if (var_2 == var_5) {
  level._id_5A23[var_0]._id_13C81 = 1;
  break;
  }
  }
  }

  if (!var_7 && level._id_5A23[var_0]._id_13C81) {
  level.player scripts\engine\utility::_id_1C76(0);
  continue;
  }

  if (var_7 && !level._id_5A23[var_0]._id_13C81)
  level.player scripts\engine\utility::_id_1C76(1);
  }
}

_id_1465(var_0) {
  level.player endon("death");
  level scripts\engine\utility::waittill_any(var_0 + "door_peek_kick", var_0 + "door_peek_detach");

  if (level._id_5A23[var_0]._id_13C81)
  level.player scripts\engine\utility::_id_1C76(1);
}

_id_1298(var_0, var_1) {
  var_2 = spawnstruct();

  if (var_0 == "bulkhead" && !var_1) {
  var_2._id_119AB = 0.9;
  var_2._id_47A4 = 0.7;
  var_2._id_47A3 = 12.0;
  var_2._id_119D5 = 0.9;
  var_2._id_B7C1 = 0;
  var_2._id_B4AA = 70;
  var_2._id_0269 = 8;
  var_2._id_B481 = 30.0;
  var_2._id_B4B9 = 4.0;
  var_2._id_11782 = 16.0;
  }
  else if ((var_0 == "airlock" || var_0 == "airlocksdf") && !var_1) {
  var_2._id_119AB = 1.0;
  var_2._id_47A4 = 0.7;
  var_2._id_47A3 = 14.0;
  var_2._id_119D5 = 1.2;
  var_2._id_B7C1 = 2;
  var_2._id_B4AA = 90;
  var_2._id_0269 = 8;
  var_2._id_B481 = 60.0;
  var_2._id_B4B9 = 1.5;
  var_2._id_11782 = 18.0;
  }

  if ((var_0 == "airlockcombat" || var_0 == "airlockcombatsdf") && !var_1) {
  var_2._id_119AB = 1.2;
  var_2._id_47A4 = 0.7;
  var_2._id_47A3 = 22.0;
  var_2._id_119D5 = 1.2;
  var_2._id_B7C1 = 2;
  var_2._id_B4AA = 90;
  var_2._id_0269 = 8;
  var_2._id_B481 = 60.0;
  var_2._id_B4B9 = 2.0;
  var_2._id_11782 = 18.0;
  }
  else if (var_0 == "armory" && !var_1) {
  var_2._id_119AB = 0.9;
  var_2._id_47A4 = 0.7;
  var_2._id_47A3 = 12.0;
  var_2._id_119D5 = 0.9;
  var_2._id_B7C1 = 0;
  var_2._id_B4AA = 140;
  var_2._id_0269 = 13;
  var_2._id_B481 = 80.0;
  var_2._id_B4B9 = 4.0;
  var_2._id_11782 = 10.0;
  }
  else if (var_0 == "armoryajar" && !var_1) {
  var_2._id_119AB = 0.9;
  var_2._id_47A4 = 0.2;
  var_2._id_47A3 = 0.0;
  var_2._id_119D5 = 0.9;
  var_2._id_B7C1 = 0;
  var_2._id_B4AA = 140;
  var_2._id_0269 = 13;
  var_2._id_B481 = 80.0;
  var_2._id_B4B9 = 4.0;
  var_2._id_11782 = 10.0;
  }
  else if (var_0 == "civlever" && !var_1) {
  var_2._id_119AB = 0.6;
  var_2._id_47A4 = 0.5;
  var_2._id_47A3 = 12.0;
  var_2._id_119D5 = 0.9;
  var_2._id_B7C1 = 9.5;
  var_2._id_B4AA = 70;
  var_2._id_0269 = 5;
  var_2._id_B481 = 29.0;
  var_2._id_B4B9 = 4.0;
  var_2._id_11782 = 3.0;
  }
  else if (var_0 == "civlever" && var_1) {
  var_2._id_119AB = 0.6;
  var_2._id_47A4 = 0.5;
  var_2._id_47A3 = -12.0;
  var_2._id_119D5 = 0.9;
  var_2._id_B7C9 = 22;
  var_2._id_B4C1 = 70;
  var_2._id_01B8 = 0;
  var_2._id_B481 = 40.0;
  var_2._id_B4B9 = 4.0;
  var_2._id_11782 = 3.0;
  }
  else if (var_0 == "civchurch1" && !var_1) {
  var_2._id_119AB = 0.6;
  var_2._id_47A4 = 0.5;
  var_2._id_47A3 = 12.0;
  var_2._id_119D5 = 0.9;
  var_2._id_B7C1 = 9.5;
  var_2._id_B4AA = 70;
  var_2._id_0269 = 5;
  var_2._id_B481 = 29.0;
  var_2._id_B4B9 = 4.0;
  var_2._id_11782 = 3.0;
  }
  else if (var_0 == "civchurch1" && var_1) {
  var_2._id_119AB = 0.6;
  var_2._id_47A4 = 0.5;
  var_2._id_47A3 = -12.0;
  var_2._id_119D5 = 0.9;
  var_2._id_B7C9 = 22;
  var_2._id_B4C1 = 70;
  var_2._id_01B8 = 0;
  var_2._id_B481 = 40.0;
  var_2._id_B4B9 = 4.0;
  var_2._id_11782 = 3.0;
  }

  return var_2;
}

_id_1299(var_0) {
  if (var_0 == "bulkhead")
  return "bulkhead";
  else if (var_0 == "airlock" || var_0 == "airlocksdf" || var_0 == "airlockcombat" || var_0 == "airlockcombatsdf")
  return "airlock";
  else if (var_0 == "armory" || var_0 == "armoryajar")
  return "armory";
  else if (var_0 == "civlever")
  return "civleverwood";
  else if (var_0 == "civchurch1")
  return "civhandlewood";
}

_id_1297(var_0) {
  if (var_0 == "bulkhead")
  return "bulkhead";
  else if (var_0 == "airlock" || var_0 == "airlocksdf" || var_0 == "airlockcombat" || var_0 == "airlockcombatsdf")
  return "airlock";
  else if (var_0 == "armory")
  return "armory";
  else if (var_0 == "armoryajar")
  return "armoryajar";
  else if (var_0 == "civlever" || var_0 == "civchurch1")
  return "civlever";
}

#using_animtree("player");

_id_1206() {
  level._id_EC87["player_rig"] = #animtree;
  level._id_EC8C["player_rig"] = "viewmodel_base_viewhands_iw7";
  level._id_EC85["player_rig"]["doorpeek_kick"] = %vm_doorpeek_kick;
  level._id_EC85["player_rig"]["doorpeek_airlock_kick"] = %wm_doorpeek_airlock_kick;
  level._id_EC85["player_rig"]["doorpeek_civlever_in"] = %wm_doorpeek_civlever_in;
  _id_0B06::_id_17F6("player_rig", "doorpeek_handle", ::_id_5A1B, "doorpeek_civlever_in");
  level._id_EC85["player_rig"]["doorpeek_civlever_loop"][0] = %wm_doorpeek_civlever_loop;
  level._id_EC85["player_rig"]["doorpeek_civlever_out"] = %wm_doorpeek_civlever_out;
  level._id_EC85["player_rig"]["doorpeek_civlever_backon"] = %wm_doorpeek_civlever_backon;
  level._id_EC89["player_rig"]["doorpeek_civlever_backon"] = 0.0;
  level._id_EC85["player_rig"]["doorpeek_civlever_r_in"] = %wm_doorpeek_civlever_r_in;
  _id_0B06::_id_17F6("player_rig", "doorpeek_handle", ::_id_5A1B, "doorpeek_civlever_r_in");
  level._id_EC85["player_rig"]["doorpeek_civlever_r_loop"][0] = %wm_doorpeek_civlever_r_loop;
  level._id_EC85["player_rig"]["doorpeek_civlever_r_out"] = %wm_doorpeek_civlever_r_out;
  level._id_EC85["player_rig"]["doorpeek_civlever_r_backon"] = %wm_doorpeek_civlever_r_backon;
  level._id_EC89["player_rig"]["doorpeek_civlever_r_backon"] = 0.0;
  level._id_EC85["player_rig"]["doorpeek_bulkhead_in"] = %wm_doorpeek_bulkhead_in;
  _id_0B06::_id_17F6("player_rig", "doorpeek_handle", ::_id_5A1B, "doorpeek_bulkhead_in");
  level._id_EC85["player_rig"]["doorpeek_bulkhead_loop"][0] = %wm_doorpeek_bulkhead_loop;
  level._id_EC85["player_rig"]["doorpeek_bulkhead_out"] = %wm_doorpeek_bulkhead_out_b;
  level._id_EC85["player_rig"]["doorpeek_bulkhead_backon"] = %wm_doorpeek_bulkhead_backon;
  level._id_EC89["player_rig"]["doorpeek_bulkhead_backon"] = 0.0;
  level._id_EC85["player_rig"]["doorpeek_airlock_in"] = %wm_doorpeek_airlock_in;
  _id_0B06::_id_17F6("player_rig", "doorpeek_handle", ::_id_5A1B, "doorpeek_airlock_in");
  level._id_EC85["player_rig"]["doorpeek_airlock_loop"][0] = %wm_doorpeek_airlock_loop;
  level._id_EC85["player_rig"]["doorpeek_airlock_out"] = %wm_doorpeek_airlock_out;
  level._id_EC85["player_rig"]["doorpeek_airlock_bash"] = %wm_doorpeek_airlock_bash;
  level._id_EC85["player_rig"]["doorpeek_airlock_backon"] = %wm_doorpeek_airlock_backon;
  level._id_EC89["player_rig"]["doorpeek_airlock_backon"] = 0.0;
  level._id_EC85["player_rig"]["doorpeek_armory_in"] = %wm_doorpeek_armory_in;
  _id_0B06::_id_17F6("player_rig", "doorpeek_handle", ::_id_5A1B, "doorpeek_armory_in");
  level._id_EC85["player_rig"]["doorpeek_armory_loop"][0] = %wm_doorpeek_armory_loop;
  level._id_EC85["player_rig"]["doorpeek_armory_out"] = %wm_doorpeek_armory_out;
  level._id_EC85["player_rig"]["doorpeek_armory_backon"] = %wm_doorpeek_armory_backon;
  level._id_EC89["player_rig"]["doorpeek_armory_backon"] = 0.0;
  level._id_EC85["player_rig"]["doorpeek_armoryajar_in"] = %wm_doorpeek_armory_ajar_in;
  level._id_EC85["player_rig"]["doorpeek_armoryajar_loop"][0] = %wm_doorpeek_armory_ajar_loop;
  level._id_EC85["player_rig"]["doorpeek_armoryajar_out"] = %wm_doorpeek_armory_ajar_out;
  level._id_EC85["player_rig"]["doorpeek_armoryajar_backon"] = %wm_doorpeek_armory_ajar_backon;
  level._id_EC89["player_rig"]["doorpeek_armoryajar_backon"] = 0.0;
}

#using_animtree("generic_human");

_id_11FB() {
  level._id_EC85["generic"]["walk_cqb_f"][0] = %walk_cqb_f;
  level._id_EC85["generic"]["cqb_stand_idle"][0] = %cqb_stand_idle;
}

#using_animtree("script_model");

_id_120C() {
  level._id_EC87["doorpeek_door"] = #animtree;
  level._id_EC85["doorpeek_door"]["doorpeek_civlever_in"] = %wm_doorpeek_bulkhead_in_door;
  level._id_EC85["doorpeek_door"]["doorpeek_bulkhead_in"] = %wm_doorpeek_bulkhead_in_door;
  level._id_EC85["doorpeek_door"]["doorpeek_airlock_in"] = %wm_doorpeek_airlock_in_door;
  level._id_EC85["doorpeek_door"]["doorpeek_armory_in"] = %wm_doorpeek_armory_in_door;
  level._id_EC85["doorpeek_door"]["doorpeek_armoryajar_in"] = %wm_doorpeek_armory_ajar_in_door;
}

_id_5A1B(var_0) {
  level notify("doorpeek_handle");
}

_id_59D9(var_0, var_1) {
  level._id_5A23[var_0]._id_5A2A rotateto(level._id_5A23[var_0]._id_5A24 + (0, -140, 0), var_1, 0.0, 0.0);
  level._id_5A23[var_0]._id_5A2A scripts\engine\utility::_id_50E1(var_1 + 0.05, ::delete);
  level._id_5A23[var_0]._id_5A03 connectpaths();
  level._id_5A23[var_0]._id_5A03 scripts\engine\utility::_id_50E1(var_1 + 0.05, ::disconnectpaths);
  level._id_5A23[var_0]._id_5978 playsound("doorpeek_" + _id_1299(level._id_5A23[var_0]._id_5A57) + "_swing_open");
  level._id_5A23[var_0]._id_5978 scripts\engine\utility::_id_50E1(var_1, ::playsound, "doorpeek_" + _id_1299(level._id_5A23[var_0]._id_5A57) + "_hit_wall");
  level._id_5A23[var_0]._id_5A56 hide();
  _id_551D(var_0);
}
