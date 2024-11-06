/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2848.gsc
***************************************/

#using_animtree("player");

_id_8FE0() {
  level._id_EC87["player_rig"] = #animtree;
  level._id_EC85["player_rig"]["right_push"] = %shipcrib_player_door_right_push;
  level._id_EC85["player_rig"]["right_pull"] = %shipcrib_player_door_right_pull;
  level._id_EC85["player_rig"]["left_push"] = %shipcrib_player_door_left_push;
  level._id_EC85["player_rig"]["left_pull"] = %shipcrib_player_door_left_pull;
  level._id_EC85["player_rig"]["left_push_long_open"] = %shipcrib_plr_door_left_push_long;
  level._id_EC85["player_rig"]["left_push_long_hold"][0] = %shipcrib_plr_door_left_push_long_hold;
  level._id_EC85["player_rig"]["left_push_long_close"] = %shipcrib_plr_door_left_push_long_close_bridge;
  level._id_EC85["player_rig"]["right_push_long_open"] = %shipcrib_plr_door_right_push_long;
  level._id_EC85["player_rig"]["right_push_long_hold"][0] = %shipcrib_plr_door_right_push_long_hold;
  level._id_EC85["player_rig"]["right_push_long_close"] = %shipcrib_plr_door_right_push_long_close;
  level._id_EC85["player_rig"]["armory_enter_open"] = %shipcrib_plr_door_right_push_long;
  level._id_EC85["player_rig"]["armory_enter_hold"][0] = %shipcrib_plr_door_right_push_long_hold;
  level._id_EC85["player_rig"]["armory_enter_close"] = %shipcrib_plr_door_right_push_long_close_armory;
}

#using_animtree("script_model");

_id_8FDF() {
  level._id_EC87["door"] = #animtree;
  level._id_EC85["door"]["right_push"] = %shipcrib_door_right_push_open;
  level._id_EC85["door"]["right_pull"] = %shipcrib_door_right_pull_open;
  level._id_EC85["door"]["left_push"] = %shipcrib_door_left_push_open;
  level._id_EC85["door"]["left_pull"] = %shipcrib_door_left_pull_open;
  level._id_EC85["door"]["left_push_long_open"] = %shipcrib_door_left_push_long_open;
  level._id_EC85["door"]["left_push_long_hold"][0] = %shipcrib_door_left_push_long_hold;
  level._id_EC85["door"]["left_push_long_close"] = %shipcrib_door_left_push_long_close;
  level._id_EC85["door"]["right_push_long_open"] = %shipcrib_door_right_push_long_open;
  level._id_EC85["door"]["right_push_long_hold"][0] = %shipcrib_door_right_push_long_hold;
  level._id_EC85["door"]["right_push_long_close"] = %shipcrib_door_right_push_long_close;
  level._id_EC85["door"]["armory_enter_open"] = %shipcrib_door_right_push_long_open;
  level._id_EC85["door"]["armory_enter_hold"][0] = %shipcrib_door_right_push_long_hold;
  level._id_EC85["door"]["armory_enter_close"] = %shipcrib_door_right_push_long_close;
}

_id_5A38() {
  _id_0B1F::_id_5A4B();
  var_0 = [];
  var_0 = scripts\engine\utility::_id_227F(var_0, scripts\engine\utility::_id_8180("doors_hinged", "targetname"));

  foreach (var_2 in var_0) {
  var_2 _id_0B91::_id_65E0("push_triggered");
  var_2 _id_0B91::_id_65E0("pull_triggered");
  var_2._id_5A3C = getent(var_2._id_0334, "targetname");
  var_2._id_5A3C _meth_83D0(#animtree);
  var_2._id_5A3C._id_1FBB = "door";
  var_2._id_5A32 = "notbusy";
  var_2._id_5A39 = "normal";

  if (isdefined(var_2._id_EE79)) {
  var_3 = strtok(var_2._id_EE79, " ");
  var_2._id_5A33 = var_3[0];

  if (isdefined(var_3[1])) {
  var_2._id_5A50 = var_3[1];
  level._id_5A2B[var_2._id_5A50] = var_2;
  }
  }
  else
  var_2._id_5A33 = "unlocked";

  switch (var_2.script_noteworthy) {
  case "hinged_left":
  var_2._id_8FDD = "left";
  break;
  case "hinged_right":
  var_2._id_8FDD = "right";
  break;
  default:
  var_2._id_8FDD = "left";
  break;
  }

  var_2 _id_8FE0();
  var_2 _id_8FDF();
  var_2._id_DB15 = var_2.origin + anglestoright(var_2.angles) * 50;
  var_2._id_DB15 = var_2._id_DB15 + anglestoforward(var_2.angles) * -24;
  var_2._id_DB14 = var_2.angles;
  var_2._id_5A40 = scripts\engine\utility::_id_107E6(var_2._id_5A3C gettagorigin("interact_push"), var_2._id_5A3C gettagangles("interact_push"));
  var_2._id_5A40 linkto(var_2._id_5A3C);
  var_2._id_5A3F = scripts\engine\utility::_id_107E6(var_2._id_5A3C gettagorigin("interact_pull"), var_2._id_5A3C gettagangles("interact_pull"));
  var_2._id_5A3F linkto(var_2._id_5A3C);
  var_2 _id_48C7();
  var_2._id_5A4F = squared(80);

  if (isdefined(var_2._id_5A3C._id_0334)) {
  var_4 = getentarray(var_2._id_5A3C._id_0334, "targetname");

  foreach (var_6 in var_4) {
  if (var_6.classname == "script_brushmodel")
  var_2._id_5A30 = var_6;

  var_6 linkto(var_2._id_5A3C, "j_hinge1");
  }
  }

  if (isdefined(var_2._id_5A50))
  var_2._id_ECCE = _id_0EFB::_id_7994("shipcrib_door_screen", "script_noteworthy", var_2._id_5A50);

  var_2._id_ECCA = [];

  foreach (var_6 in var_2._id_ECCE) {
  if (var_6.classname != "script_model") {
  var_2._id_ECCE = scripts\engine\utility::array_remove(var_2._id_ECCE, var_6);
  var_2._id_ECCA = scripts\engine\utility::_id_2279(var_2._id_ECCA, var_6);
  }
  }

  var_2._id_5A40 thread _id_9013(var_2, "push_triggered");
  var_2._id_5A3F thread _id_9013(var_2, "pull_triggered");
  var_2 thread _id_5A4E();
  }
}

_id_5A55(var_0) {
  switch (var_0) {
  case "unlocked":
  self._id_5A3C _meth_8387("door_unlocked");
  self._id_5A3C _meth_8187("door_locked");
  self._id_5A3C _meth_8187("door_inactive");
  _id_48C7();
  _id_5A42(var_0);
  break;
  case "locked":
  self._id_5A3C _meth_8387("door_locked");
  self._id_5A3C _meth_8187("door_unlocked");
  self._id_5A3C _meth_8187("door_inactive");
  _id_DFE5();
  _id_5A42(var_0);
  break;
  case "automatic":
  self._id_5A3C _meth_8187("door_unlocked");
  self._id_5A3C _meth_8187("door_locked");
  self._id_5A3C _meth_8187("door_inactive");
  _id_DFE5();
  _id_5A42(var_0);
  break;
  case "open":
  self._id_5A3C _meth_8387("door_inactive");
  self._id_5A3C _meth_8187("door_unlocked");
  self._id_5A3C _meth_8187("door_locked");
  _id_DFE5();
  _id_5A42(var_0);
  break;
  }
}

_id_5A42(var_0) {
  self endon("death");

  if (!isdefined(self._id_ECCE) || self._id_ECCE.size == 0)
  return;

  scripts\engine\utility::_id_227D(self._id_ECCE, ::_meth_8184);

  switch (var_0) {
  case "unlocked":
  scripts\engine\utility::_id_227D(self._id_ECCE, ::_meth_8387, "tag_unlocked");
  scripts\engine\utility::_id_22D2(self._id_ECCA, _id_0B47::_id_AB83, 0.009, 0.05);
  scripts\engine\utility::_id_22D2(self._id_ECCA, _id_0B47::_id_3C57, (0.26, 0.98, 0.18), 0.05);
  break;
  case "locked":
  scripts\engine\utility::_id_227D(self._id_ECCE, ::_meth_8387, "tag_locked");
  scripts\engine\utility::_id_22D2(self._id_ECCA, _id_0B47::_id_AB83, 0.009, 0.05);
  scripts\engine\utility::_id_22D2(self._id_ECCA, _id_0B47::_id_3C57, (0.98, 0.18, 0.26), 0.05);
  break;
  case "automatic":
  scripts\engine\utility::_id_227D(self._id_ECCE, ::_meth_8387, "tag_unlocked");
  break;
  case "open":
  scripts\engine\utility::_id_227D(self._id_ECCE, ::_meth_8387, "tag_unlocked");
  scripts\engine\utility::_id_22D2(self._id_ECCA, _id_0B47::_id_AB83, 0.009, 0.05);
  scripts\engine\utility::_id_22D2(self._id_ECCA, _id_0B47::_id_3C57, (0.26, 0.98, 0.18), 0.05);
  break;
  }
}

_id_48C7() {
  switch (self._id_5A39) {
  case "aggressive":
  var_0 = 360;
  var_1 = 1;
  var_2 = distance2d(self.origin, level.player.origin) * 1.5;
  break;
  default:
  var_0 = 45;
  var_1 = undefined;
  var_2 = 200;
  break;
  }

  self._id_5A40 _id_0E46::_id_48C4(undefined, undefined, undefined, var_0, var_2, 50, var_1, undefined, undefined, undefined, undefined, undefined, undefined, 1);
  self._id_5A3F _id_0E46::_id_48C4(undefined, undefined, undefined, var_0, var_2, 50, var_1, undefined, undefined, undefined, undefined, undefined, undefined, 1);
  self._id_5A39 = "normal";
}

_id_DFE5() {
  self._id_5A40 _id_0E46::_id_DFE3();
  self._id_5A3F _id_0E46::_id_DFE3();
}

_id_9013(var_0, var_1) {
  var_0 endon("death");
  self endon("death");

  for (;;) {
  var_0 _id_0B91::_id_65DD("push_triggered");
  var_0 _id_0B91::_id_65DD("pull_triggered");
  self waittill("trigger");
  var_0 _id_0B91::_id_65E1(var_1);
  var_0 _id_DFE5();
  }
}

_id_5A4E() {
  self endon("death");
  self endon("other_side_triggered");
  thread _id_5A55(self._id_5A33);

  for (;;) {
  if (self._id_5A33 == "open" && self._id_5A32 != "busy") {
  self._id_5A32 = "busy";
  thread _id_5A55(self._id_5A33);
  _id_5A34("open");
  }
  else if (self._id_5A33 == "unlocked" || self._id_5A33 == "automatic") {
  if ((_id_0B91::_id_65DB("push_triggered") || _id_0B91::_id_65DB("pull_triggered")) && self._id_5A32 != "busy") {
  self._id_5A32 = "busy";

  if (isdefined(self._id_5A52)) {
  self._id_1212 = undefined;

  if (self._id_5A53 == "pushpull")
  self._id_1212 = self._id_5A52;
  else if (self._id_5A53 == "push") {
  if (_id_0B91::_id_65DB("push_triggered"))
  self._id_1212 = self._id_5A52;
  }
  else if (self._id_5A53 == "pull") {
  if (_id_0B91::_id_65DB("pull_triggered"))
  self._id_1212 = self._id_5A52;
  }

  _id_DFE5();

  if (isdefined(self._id_1212)) {
  if (self._id_5A54)
  self._id_5A52 = undefined;

  self [[self._id_1212]]();
  self._id_1212 = undefined;
  }
  } else {
  _id_DFE5();
  _id_5A34();
  }

  thread _id_48C7();
  }
  else if ((!_id_0B91::_id_65DB("push_triggered") || !_id_0B91::_id_65DB("pull_triggered")) && self._id_5A32 != "notbusy") {
  self._id_5A32 = "notbusy";
  thread _id_5A55(self._id_5A33);
  _id_5A34("close");
  }
  }
  else if (self._id_5A33 == "locked" && self._id_5A32 != "notbusy") {
  self._id_5A32 = "notbusy";
  thread _id_5A55(self._id_5A33);
  _id_5A34("close");
  }

  scripts\engine\utility::waitframe();
  }
}

_id_5A34(var_0) {
  if (_id_5A3D(self))
  var_1 = "pull";
  else
  var_1 = "push";

  var_2 = self._id_8FDD + "_" + var_1;

  if (isdefined(var_0)) {
  switch (var_0) {
  case "open":
  self._id_5A3C _meth_82A2(self._id_5A3C _id_0B91::_id_7DC1(var_2));
  return;
  case "close":
  self._id_5A3C _meth_82A4(self._id_5A3C _id_0B91::_id_7DC1(var_2), 1, 0, 0);
  return;
  }
  }

  _id_11EB(var_2);
}

_id_5A3D(var_0) {
  var_1 = _id_0B91::_id_7951(var_0.origin, var_0.angles, level.player.origin);

  if (var_1 > 0)
  return 1;
  else
  return 0;
}

_id_5A2E(var_0, var_1, var_2) {
  if (isstring(var_0))
  var_3 = level._id_5A2B[var_0];
  else
  var_3 = var_0;

  if (isdefined(var_2))
  var_3._id_5A39 = var_2;

  var_3._id_5A33 = var_1;
  var_3._id_5A32 = "notbusy";
  var_3 thread _id_5A55(var_3._id_5A33);
}

_id_5A2C(var_0) {
  if (!isdefined(var_0)) {}

  self._id_5A3A = var_0;
}

_id_5A52(var_0, var_1, var_2, var_3) {
  var_4 = level._id_5A2B[var_0];
  var_4 endon("death");

  if (!isdefined(var_3))
  var_3 = "pushpull";

  var_4._id_5A53 = var_3;
  var_4._id_5A52 = var_1;

  if (!isdefined(var_2))
  var_4._id_5A54 = 1;
  else
  var_4._id_5A54 = var_2;
}

_id_794A(var_0) {
  return level._id_5A2B[var_0];
}

_id_AB71(var_0, var_1, var_2, var_3, var_4, var_5) {
  var_0 endon("death");

  if (!isdefined(var_5))
  var_5 = 2;

  var_6 = door_pcfov_disableweapons();
  var_0._id_5A30 connectpaths();
  var_0 thread _id_0B91::_id_C12D("safe_to_pass", 2.3);
  var_0 _id_11EB(var_1, var_2, var_3, var_4, var_5);
  var_0._id_5A30 disconnectpaths();

  if (var_6)
  level.player enableweapons();
}

door_pcfov_disableweapons() {
  var_0 = 0;

  if (!level._id_4542) {
  var_1 = getdvarfloat("com_fovUserScale");
  var_2 = level.player getcurrentweapon();

  if (var_1 > 1.25 && var_2 != "none" && var_2 != "iw7_gunless") {
  level.player _meth_80AA();
  var_0 = 1;
  }
  }

  return var_0;
}

_id_5A2D(var_0, var_1) {
  var_0 = _id_794A(var_0);
  var_0 endon("death");
  var_0._id_5A39 = var_1;
  var_0 _id_DFE5();
  var_0 thread _id_48C7();
}

_id_5A2F(var_0) {}

_id_5A4D(var_0, var_1, var_2) {
  if (!isdefined(var_2))
  var_2 = "push";

  if (!isdefined(var_1))
  var_1 = 0;

  if (var_1)
  _id_794A(var_0) waittill("safe_to_pass");

  _id_0B6A::_id_EC04();

  switch (var_2) {
  case "push":
  self _meth_80F1(_id_794A(var_0)._id_DB15, _id_794A(var_0)._id_DB14);
  self _meth_82EF(self.origin);
  break;
  case "pull":
  self _meth_80F1(_id_794A(var_0)._id_DB15, _id_794A(var_0)._id_DB14);
  self _meth_82EF(self.origin);
  break;
  }
}

_id_5A36(var_0, var_1) {
  var_2 = _id_794A(var_0);
  var_2 endon("death");
  var_2 _id_DFE5();

  if (isarray(var_1)) {
  foreach (var_4 in var_1)
  scripts\engine\utility::_id_6E4C(var_4);
  }
  else
  scripts\engine\utility::_id_6E4C(var_1);

  var_2 thread _id_48C7();
}

_id_11EB(var_0, var_1, var_2, var_3, var_4) {
  if (!isdefined(var_1))
  var_1 = 0.4;

  var_5 = _id_0B91::_id_10639("player_rig");
  var_6 = level.player _meth_84C6("currentViewModel");

  if (isdefined(var_6))
  var_5 setmodel(var_6);

  var_5 hide();
  var_7 = [];
  var_7["door"] = self._id_5A3C;
  var_7["player_rig"] = var_5;

  if (isdefined(var_3))
  _id_0B06::_id_1EC1(var_7, var_0 + "_open");
  else
  _id_0B06::_id_1EC1(var_7, var_0);

  level.player playsound("shipcrib_door_plr_move_to_door");
  level.player _meth_823C(var_5, "tag_player", var_1, 0.2, 0.2);

  if (isdefined(var_2))
  self thread [[var_2]]();

  wait(var_1);
  var_5 show();

  if (isdefined(var_3)) {
  switch (self._id_8FDD) {
  case "left":
  level.player playsound("shipcrib_door_left_hinge_push_long_handle_down_open");
  break;
  case "right":
  level.player playsound("shipcrib_door_right_hinge_push_long_handle_down_open");
  break;
  }

  _id_0B06::_id_1F2C(var_7, var_0 + "_open");
  thread _id_0B06::_id_1EE7(var_7, var_0 + "_hold", "stop_loop");
  wait(var_4);
  self notify("stop_loop");

  switch (self._id_8FDD) {
  case "left":
  self._id_5A3C thread _id_0B91::_id_CE31("shipcrib_door_left_hinge_push_long_release_and_close", "door_locked");
  level.player playsound("shipcrib_door_left_hinge_push_long_plr_move_finish");
  break;
  case "right":
  self._id_5A3C thread _id_0B91::_id_CE31("shipcrib_door_right_hinge_push_long_release_and_close", "door_locked");
  level.player playsound("shipcrib_door_right_hinge_push_long_plr_move_finish");
  break;
  }

  _id_0B06::_id_1F2C(var_7, var_0 + "_close");
  } else {
  switch (var_0) {
  case "left_push":
  level.player playsound("shipcrib_door_left_hinge_push_handle_down_open");
  self._id_5A3C scripts\engine\utility::delaythread(2.6, _id_0B91::_id_CE31, "shipcrib_door_left_hinge_push_release_and_close", "door_locked");
  break;
  case "left_pull":
  level.player playsound("shipcrib_door_left_hinge_pull_handle_down_open");
  self._id_5A3C scripts\engine\utility::delaythread(2.4, _id_0B91::_id_CE31, "shipcrib_door_left_hinge_pull_release_and_close", "door_locked");
  break;
  case "right_push":
  level.player playsound("shipcrib_door_right_hinge_push_handle_down_open");
  self._id_5A3C scripts\engine\utility::delaythread(2.6, _id_0B91::_id_CE31, "shipcrib_door_right_hinge_push_release_and_close", "door_locked");
  break;
  case "right_pull":
  level.player playsound("shipcrib_door_right_hinge_pull_handle_down_open");
  self._id_5A3C scripts\engine\utility::delaythread(2.4, _id_0B91::_id_CE31, "shipcrib_door_right_hinge_pull_release_and_close", "door_locked");
  break;
  }

  _id_0B06::_id_1F2C(var_7, var_0);
  }

  level notify("door_lerp_finished");
  var_5 delete();
  level.player unlink();
}
