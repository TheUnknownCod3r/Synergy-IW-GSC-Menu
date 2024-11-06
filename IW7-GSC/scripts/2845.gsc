/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2845.gsc
***************************************/

init() {
  level._id_7649["c4_light_blink"] = loadfx("vfx/core/equipment/light_c4_blink.vfx");
  level._id_7649["frag_tel_radius"] = loadfx("vfx/iw7/core/equipment/frag/vfx_frag_tel_radius.vfx");
  level.player _id_0B91::_id_65E0("no_grenade_block_gesture");
  scripts\engine\utility::_id_22D2(level.players, ::_id_13A9B);
  scripts\engine\utility::_id_22D2(level.players, ::_id_13B17);
  level._id_0149 = spawnstruct();
  level._id_0149._id_B37A = [];
  level._id_0149._id_A8C6 = undefined;
  scripts\engine\utility::_id_6E39("frag_force_delete");
}

_id_10409() {
  var_0 = [];
  var_0["r_hudoutlineWidth"] = 1;
  var_0["r_hudoutlineFillColor1"] = "0 0 0 1";
  var_0["r_hudoutlineFillColor0"] = "0.8 0.8 0.8 1";
  var_0["r_hudoutlineOccludedOutlineColor"] = "0.8 0.8 0.8 1";
  var_0["r_hudoutlineOccludedInteriorColor"] = "0.5 0.5 0.5 .2";
  var_0["r_hudoutlineOccludedInlineColor"] = "0.5 0.5 0.5 .5";
  var_0["r_hudoutlineFillColor1"] = "0.8 0.8 0.8 .2";
  var_0["r_hudOutlineOccludedColorFromFill"] = 1;
  return var_0;
}

_id_10408() {
  _id_0B91::_id_9196(1, 1, 1, "sonic");
  wait 0.15;
  _id_0B91::_id_9193("sonic");
}

_id_13995() {
  self endon("death");
  _id_0B91::_id_9187("sonic", 190, ::_id_10409);

  for (;;) {
  var_0 = self getcurrentweapon();

  if (!isdefined(var_0) || self playerads() < 0.5) {
  wait 0.05;
  continue;
  }

  if (getweaponbasename(var_0) == "iw7_kbs" && _id_0B91::_id_9FFE(var_0)) {
  var_1 = _func_072("axis");

  foreach (var_3 in var_1) {
  if (!isalive(var_3))
  continue;

  var_4 = distance2dsquared(var_3.origin, self.origin);
  var_5 = 0;
  var_3 scripts\engine\utility::delaythread(var_5, ::_id_10408);
  }
  }

  wait 2.5;
  }
}

_id_13A9B() {
  self endon("death");
  childthread _id_2A69();
  self._id_11817 = 0;

  for (;;) {
  self waittill("grenade_pullback", var_0);
  self._id_11817 = 1;
  scripts\engine\utility::waittill_any("grenade_fire", "weapon_switch_started");
  self._id_11817 = 0;
  }
}

_id_2A69() {
  for (;;) {
  self waittill("grenade_fire", var_0, var_1);

  if (isdefined(var_0) && scripts\engine\utility::_id_9CEE(var_0._id_8589))
  continue;

  if (isdefined(level._id_74C2["player_grenade_thrown"]))
  level thread [[level._id_74C2["player_grenade_thrown"]]](var_0);

  switch (var_1) {
  case "seeker_autohold":
  case "seeker":
  thread _id_0E26::_id_F135(var_0);
  break;
  case "antigrav":
  thread _id_0E21::_id_2013(var_0);
  break;
  case "emp":
  thread _id_0E25::_id_615B(var_0);
  break;
  case "coverwall":
  thread _id_0B16::_id_475F(var_0);
  break;
  case "frag_up1":
  case "frag":
  thread _id_734F(var_0);

  if (self == level.player)
  level.player thread scripts\anim\battlechatter_ai::_id_67CF("frag");

  break;
  case "c8_grenade":
  thread _id_734F(var_0);
  thread _id_3465(var_0);
  break;
  default:
  break;
  }
  }
}

_id_DBDB(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7) {
  var_8 = scripts\engine\utility::ter_op(isdefined(var_3), var_3, 600);

  if (distance2dsquared(level.player.origin, var_0) > var_8 * var_8)
  return;

  if (isdefined(level._id_58DB))
  return;

  level._id_58DB = 1;
  var_9["r_mbenable"] = getdvar("r_mbenable");
  var_9["r_mbRadialOverridePosition"] = getdvar("r_mbRadialOverridePosition");
  var_9["r_mbRadialOverridePositionActive"] = getdvarint("r_mbRadialOverridePositionActive");
  var_9["r_mbradialoverridestrength"] = getdvarfloat("r_mbradialoverridestrength");
  var_9["r_mbradialoverrideradius"] = getdvarfloat("r_mbradialoverrideradius");
  _func_1C5("r_mbenable", 1);
  _func_1C5("r_mbRadialOverridePosition", var_0);
  _func_1C5("r_mbRadialOverridePositionActive", 1);
  var_10 = scripts\engine\utility::ter_op(isdefined(var_2), var_2, 270);
  var_1 = scripts\engine\utility::ter_op(isdefined(var_1), var_1, 0.135848);
  var_11 = var_1 / 4;
  var_4 = scripts\engine\utility::ter_op(isdefined(var_4), var_4, -0.107266);
  var_5 = scripts\engine\utility::ter_op(isdefined(var_5), var_5, 0.05);
  var_6 = scripts\engine\utility::ter_op(isdefined(var_6), var_6, 0.5);
  var_12 = distance2d(level.player.origin, var_0);
  var_13 = _id_0B4D::_id_C097(var_8, var_10, var_12);
  var_14 = _id_0B4D::_id_6A8E(var_1, var_11, var_13);
  var_14 = clamp(var_14, 0, 1);

  if (!isdefined(var_7)) {
  if (!scripts\engine\trace::_id_DCF1(var_0 + (0, 0, 12), level.player geteye())) {
  var_14 = var_14 * 0.5;
  var_14 = clamp(var_14, 0, 1);
  }
  }

  _func_1C5("r_mbradialoverridestrength", var_14);
  _func_1C5("r_mbradialoverrideradius", var_4);
  wait(var_5);
  thread _id_0B91::_id_AB9A("r_mbradialoverridestrength", var_9["r_mbradialoverridestrength"], var_6);
  thread _id_0B91::_id_AB9A("r_mbradialoverrideradius", var_9["r_mbradialoverrideradius"], var_6);
  scripts\engine\utility::_id_6E59("frag_force_delete", var_6);
  _func_1C5("r_mbenable", var_9["r_mbenable"]);
  _func_1C5("r_mbRadialOverridePosition", var_9["r_mbRadialOverridePosition"]);
  _func_1C5("r_mbRadialOverridePositionActive", var_9["r_mbRadialOverridePositionActive"]);
  level._id_58DB = undefined;
}

_id_734F(var_0) {
  var_1 = var_0 scripts\engine\utility::_id_107CE();
  var_1._id_015F = var_0;
  level._id_0149._id_B37A[level._id_0149._id_B37A.size] = var_1;
  var_1 linkto(var_0, "tag_fx", (0, 0, 0), (0, 0, 0));
  var_2 = _id_734E();
  var_0 _id_13771(var_1);
  var_3 = isdefined(var_1._id_0118);
  var_4 = var_1.origin;
  var_1 _id_E011();

  if (!var_3)
  return;

  if (self == level.player) {
  thread _id_734D(var_4, var_2, 256);

  if (isdefined(level.player._id_735A))
  thread _id_7352(var_4, var_1._id_4D40);
  }

  thread _id_DBDB(var_4);
  earthquake(0.7, 0.8, var_4, 600);
  thread _id_0B91::_id_54EF(var_4);

  if (level.player _id_0B91::_id_65DB("no_grenade_block_gesture") || level.player _meth_81C6() || level.player _meth_8448())
  return;

  var_5 = 1;
  var_6 = distance2dsquared(level.player.origin, var_4);

  if (var_5 && var_6 > 102400)
  var_5 = 0;

  if (var_5 && var_6 > 4096) {
  var_7 = vectordot(scripts\engine\utility::_id_6EE6(vectornormalize(var_4 - level.player.origin)), anglestoforward(level.player.angles));

  if (var_7 < 0.0)
  var_5 = 0;
  }

  if (var_5) {
  if (!scripts\engine\trace::_id_DCF1(var_4 + (0, 0, 12), level.player geteye(), undefined, scripts\engine\trace::_id_497D()))
  var_5 = 0;
  }

  if (var_5)
  level.player thread _id_859C(var_4);
}

_id_13771(var_0) {
  thread _id_1376E(var_0);
  thread _id_13582(var_0);

  while (isdefined(self))
  wait 0.05;
}

_id_1376E(var_0) {
  var_0 endon("death");
  self waittill("explode", var_1, var_2);
  var_0._id_0118 = 1;
  var_0._id_4D40 = var_2;
}

_id_13582(var_0) {
  var_0 endon("death");
  self waittill("entitydeleted");
  var_0._id_6643 = 1;
}

_id_E012() {
  if (isdefined(self._id_015F)) {
  self unlink();
  self._id_015F delete();
  }
}

_id_E011() {
  if (!isdefined(self))
  return;

  _id_E012();
  level._id_0149._id_A8C6 = self.origin;
  level._id_0149._id_B37A = scripts\engine\utility::array_remove(level._id_0149._id_B37A, self);
  self delete();
}

_id_DFBF() {
  level notify("removing_all_frags_instantly");
  level endon("removing_all_frags_instantly");
  scripts\engine\utility::_id_6E3E("frag_force_delete");

  foreach (var_1 in level._id_0149._id_B37A)
  var_1 _id_E012();

  scripts\engine\utility::waitframe();

  for (;;) {
  if (level._id_0149._id_B37A.size > 0) {
  scripts\engine\utility::waitframe();
  continue;
  }

  break;
  }

  scripts\engine\utility::_id_6E2A("frag_force_delete");
}

_id_734E() {
  var_0 = [];

  if (self == level.player) {
  foreach (var_2 in _func_072("axis")) {
  var_3 = spawnstruct();
  var_3._id_65D3 = var_2;
  var_3.health = var_2.health;
  var_3.origin = var_2.origin;
  var_0[var_0.size] = var_3;
  }
  }

  return var_0;
}

_id_734D(var_0, var_1, var_2, var_3) {
  level.player endon("death");
  level.player notify("new_frag_info_reticles");
  level.player endon("new_frag_info_reticles");

  if (isdefined(var_3))
  scripts\engine\utility::_id_6E59("frag_force_delete", var_3);

  var_4 = [];
  var_5 = [];
  var_6 = [];

  for (var_7 = 0; var_7 < var_1.size; var_7++) {
  if (distance(var_1[var_7].origin, var_0) > var_2)
  continue;
  else if (!isdefined(var_1[var_7]._id_65D3) || !isalive(var_1[var_7]._id_65D3)) {
  var_4[var_4.size] = var_1[var_7];
  continue;
  }
  else if (var_1[var_7]._id_65D3.health < var_1[var_7].health) {
  var_5[var_5.size] = var_1[var_7];
  continue;
  }
  else
  continue;
  }

  scripts\engine\utility::_id_6E59("frag_force_delete", 0.2);
  var_8 = var_4.size;
  var_9 = var_5.size;
  var_10 = var_6.size;
  var_11 = var_4;
  var_11 = scripts\engine\utility::_id_227F(var_11, var_5);
  var_11 = scripts\engine\utility::_id_227F(var_11, var_6);
  var_12 = 0;
  var_13 = [];
  var_14 = 8;

  for (var_7 = 0; var_7 < var_14; var_7++) {
  if (isdefined(var_11[var_7])) {
  var_15 = scripts\engine\utility::_id_107E6();
  var_15.origin = var_11[var_7].origin;
  var_13[var_13.size] = var_15;
  setomnvar("ui_fragreticles_" + var_7 + "_target_ent", var_15);

  if (var_7 < var_8)
  setomnvar("ui_fragreticles_" + var_7 + "_lock_state", 1);
  else if (var_7 < var_8 + var_9) {
  if (!isalive(var_11[var_7])) {
  setomnvar("ui_fragreticles_" + var_7 + "_lock_state", 2);
  var_15 linkto(var_11[var_7]._id_65D3, _id_129D(var_11[var_7]._id_65D3), (0, 0, 0), (0, 0, 0));
  }
  }
  else
  setomnvar("ui_fragreticles_" + var_7 + "_lock_state", 3);

  continue;
  }

  setomnvar("ui_fragreticles_" + var_7 + "_target_ent", undefined);
  setomnvar("ui_fragreticles_" + var_7 + "_lock_state", 0);
  }

  scripts\engine\utility::_id_6E59("frag_force_delete", 4.0);

  for (var_7 = 0; var_7 < var_14; var_7++) {
  setomnvar("ui_fragreticles_" + var_7 + "_target_ent", undefined);
  setomnvar("ui_fragreticles_" + var_7 + "_lock_state", 0);
  }

  for (var_7 = 0; var_7 < var_13.size; var_7++)
  var_13[var_7] delete();
}

_id_129D(var_0) {
  if (isdefined(var_0.classname) && !issubstr(var_0.classname, "seeker"))
  return "j_SpineUpper";
  else
  return "tag_origin";
}

_id_7352(var_0, var_1) {
  self endon("death");
  var_2 = [];

  foreach (var_4 in _func_072("axis")) {
  if (distance(var_4.origin, var_0) <= 256) {
  if (scripts\engine\trace::_id_DCF1(var_4 gettagorigin("j_SpineUpper"), var_0, var_4, scripts\engine\trace::_id_4956(1))) {
  var_2[var_2.size] = var_4;
  var_4 thread _id_7353();
  }
  }
  }

  if (var_2.size > 0)
  playfx(level._id_7649["frag_tel_radius"], var_0);

  scripts\engine\utility::_id_6E59("frag_force_delete", var_1);
  scripts\engine\utility::_id_6E59("frag_force_delete", 2.0);

  foreach (var_4 in var_2)
  var_4 notify("frag_outline_display_done");
}

_id_7353() {
  _id_0B91::_id_9196(0, 0, 0);
  scripts\engine\utility::waittill_any("frag_outline_display_done", "death");
  _id_0B91::_id_9193();
}

_id_3465(var_0) {
  var_0 waittill("missile_stuck");
  playfxontag(level._id_7649["grenade_flash_red"], var_0, "tag_origin");
  var_0 waittill("death");
}

_id_859C(var_0) {
  self endon("death");
  var_1 = scripts\engine\utility::_id_107E6(var_0, (0, 0, 0));
  thread scripts\engine\utility::_id_5179(var_1);
  var_2 = "ges_frag_block";
  var_3 = self _meth_8441(var_2, var_1, 1, 0.1);
  thread _id_859D(var_2);

  if (var_3) {
  childthread _id_0E49::_id_D092(var_2, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1.4);

  for (;;) {
  self waittill("gesture_stopped", var_2);

  if (var_2 == "ges_frag_block")
  break;
  }
  }

  self notify("grenade_reaction_gesture_done");
  var_1 delete();
}

_id_859D(var_0) {
  self endon("grenade_reaction_gesture_done");
  self waittill("weapon_switch_started");
  self _meth_8442(var_0, 0.2);
}

_id_1339D(var_0) {
  var_1 = distance(level.player.origin, var_0);
  var_2 = 600;

  if (var_1 > var_2 || var_1 < 256)
  return;

  var_3 = vectortoangles(level.player.origin - var_0);
  var_4 = 40;
  var_5 = 5;
  var_6 = _id_0B4D::_id_C097(0, var_2, var_1);
  var_7 = _id_0B4D::_id_6A8E(var_5, var_4, var_6);
  level.player viewkick(int(var_7), var_0);
}

_id_385C(var_0, var_1) {
  if (_func_2A6(self) || isai(self))
  var_2 = [self, var_1, level.player];
  else
  var_2 = [var_1, level.player];

  if (scripts\engine\trace::_id_DCF1(var_0, var_1.origin, var_2))
  return 1;

  if (scripts\engine\trace::_id_DCF1(var_0, var_1 gettagorigin("j_spine4"), var_2))
  return 1;

  if (scripts\engine\trace::_id_DCF1(var_0, var_1 geteye(), var_2))
  return 1;

  if (scripts\engine\trace::_id_DCF1(var_0, var_1 gettagorigin("j_helmet"), var_2))
  return 1;

  return 0;
}

_id_385D(var_0) {
  if (scripts\engine\trace::_id_DCF1(var_0, level.player.origin, level.player))
  return 1;

  if (scripts\engine\trace::_id_DCF1(var_0, level.player.origin + (0, 0, 30), level.player))
  return 1;

  if (scripts\engine\trace::_id_DCF1(var_0, level.player geteye(), level.player))
  return 1;

  return 0;
}

_id_7E58(var_0, var_1, var_2, var_3) {
  var_4 = [];

  if (!isdefined(var_2))
  var_2 = 0;

  if (!isdefined(var_3))
  var_3 = 0;

  for (var_5 = 0; var_5 < level.players.size; var_5++) {
  if (!isalive(level.players[var_5]) || level.players[var_5].sessionstate != "playing")
  continue;

  var_6 = level.players[var_5].origin + (0, 0, 32);
  var_7 = distance(var_0, var_6);

  if (var_7 < var_1 && (!var_2 || _id_13C7E(var_0, var_6, var_3, undefined))) {
  var_8 = spawnstruct();
  var_8._id_9EE7 = 1;
  var_8._id_9D26 = 0;
  var_8._id_0114 = level.players[var_5];
  var_8._id_4D2F = var_6;
  var_4[var_4.size] = var_8;
  }
  }

  var_9 = getentarray("grenade", "classname");

  for (var_5 = 0; var_5 < var_9.size; var_5++) {
  var_10 = var_9[var_5].origin;
  var_7 = distance(var_0, var_10);

  if (var_7 < var_1 && (!var_2 || _id_13C7E(var_0, var_10, var_3, var_9[var_5]))) {
  var_8 = spawnstruct();
  var_8._id_9EE7 = 0;
  var_8._id_9D26 = 0;
  var_8._id_0114 = var_9[var_5];
  var_8._id_4D2F = var_10;
  var_4[var_4.size] = var_8;
  }
  }

  var_11 = getentarray("destructable", "targetname");

  for (var_5 = 0; var_5 < var_11.size; var_5++) {
  var_10 = var_11[var_5].origin;
  var_7 = distance(var_0, var_10);

  if (var_7 < var_1 && (!var_2 || _id_13C7E(var_0, var_10, var_3, var_11[var_5]))) {
  var_8 = spawnstruct();
  var_8._id_9EE7 = 0;
  var_8._id_9D26 = 1;
  var_8._id_0114 = var_11[var_5];
  var_8._id_4D2F = var_10;
  var_4[var_4.size] = var_8;
  }
  }

  return var_4;
}

_id_13C7E(var_0, var_1, var_2, var_3) {
  var_4 = undefined;
  var_5 = var_1 - var_0;

  if (lengthsquared(var_5) < var_2 * var_2)
  var_4 = var_1;

  var_6 = vectornormalize(var_5);
  var_4 = var_0 + (var_6[0] * var_2, var_6[1] * var_2, var_6[2] * var_2);
  var_7 = bullettrace(var_4, var_1, 0, var_3);

  if (getdvarint("scr_damage_debug") != 0) {
  if (var_7["fraction"] == 1)
  thread _id_4F48(var_4, var_1, (1, 1, 1));
  else
  {
  thread _id_4F48(var_4, var_7["position"], (1, 0.9, 0.8));
  thread _id_4F48(var_7["position"], var_1, (1, 0.4, 0.3));
  }
  }

  return var_7["fraction"] == 1;
}

_id_4D47(var_0, var_1, var_2, var_3, var_4, var_5, var_6) {
  if (self._id_9EE7) {
  self._id_4D5B = var_5;
  self._id_0114 thread [[level.callbackplayerdamage]](var_0, var_1, var_2, 0, var_3, var_4, var_5, var_6, "none", 0);
  } else {
  if (self._id_9D26 && (var_4 == "artillery_mp" || var_4 == "claymore_mp"))
  return;

  self._id_0114 notify("damage", var_2, var_1);
  }
}

_id_4F48(var_0, var_1, var_2) {
  for (var_3 = 0; var_3 < 600; var_3++)
  wait 0.05;
}

_id_C5CB(var_0, var_1, var_2, var_3) {
  self endon("death");

  switch (var_1) {
  case "concussion_grenade_mp":
  var_4 = 512;
  var_5 = 1 - distance(self.origin, var_0.origin) / var_4;
  var_6 = 1 + 4 * var_5;
  wait 0.05;
  self shellshock("concussion_grenade_mp", var_6);
  break;
  default:
  break;
  }
}

_id_13B17() {
  self endon("death");

  for (;;) {
  self waittill("missile_fire", var_0, var_1);

  if (getweaponbasename(var_1) == "iw7_chargeshot") {
  var_0.owner = self;
  var_0 thread _id_3D28();
  }
  }
}

_id_3D27() {
  self endon("death");
  var_0 = 50;
  var_1 = self.origin;

  for (;;) {
  var_2 = scripts\engine\utility::_id_7984(self.owner.team);
  var_3 = scripts\engine\trace::_id_109DE(var_1, self.origin, var_0, self.owner, scripts\engine\trace::_id_48B1());

  foreach (var_5 in var_3) {
  if (isdefined(var_5["entity"]) && isai(var_5["entity"]))
  var_5["entity"] thread _id_0E25::_id_5772(self, var_0);
  }

  var_1 = self.origin;
  wait 0.05;
  }
}

_id_3D28() {
  self endon("death");
  var_0 = 32;
  var_1 = scripts\engine\utility::_id_7984(self.owner.team);
  wait 0.15;
  var_2 = self.origin;

  for (;;) {
  var_3 = scripts\engine\trace::_id_109DE(var_2, self.origin, var_0, self.owner, scripts\engine\trace::_id_48B1());

  foreach (var_5 in var_3) {
  if (!isdefined(var_5["entity"]) || !isai(var_5["entity"]))
  continue;

  if (!isdefined(var_5["entity"].team) || var_5["entity"].team != var_1)
  continue;

  self _meth_8099();
  return;
  }

  var_2 = self.origin;
  wait 0.05;
  }
}
