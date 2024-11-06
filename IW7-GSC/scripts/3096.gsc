/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3096.gsc
***************************************/

_id_1EDC() {
  if (!isdefined(self._id_0047))
  self._id_0047 = spawnstruct();
}

_id_A3B2(var_0) {
  if (!isdefined(var_0))
  var_0 = self._id_02A9;

  self._id_0047._id_10E19 = var_0;
}

#using_animtree("jackal");

_id_A3B5(var_0) {
  self endon("death");

  if (!isdefined(self) || !isalive(self))
  return;

  if (isdefined(self._id_0047._id_10E19)) {
  if (self._id_0047._id_10E19 == var_0)
  return;

  var_1 = self._id_0047._id_10E19;
  }
  else
  var_1 = "none";

  self._id_0047._id_10E19 = var_0;
  self notify("notify_change_anim_state");
  self endon("notify_change_anim_state");
  var_2 = spawnstruct();
  var_2 _id_A1E5(var_0, var_1, self._id_EEDE);

  if (!isdefined(var_2._id_92CC))
  return;

  if (isdefined(var_2._id_11B54)) {
  self _meth_82A4(var_2._id_11B54, 1.0, 0.2);
  var_3 = getanimlength(var_2._id_11B54);
  }
  else
  var_3 = 0;

  self _meth_82A4(var_2._id_BBB5, 1.0, var_3);
  wait(var_3);
  self _meth_82A4(var_2._id_92CC, 1.0, 0.2);
  self _meth_82A2(%jackal_motion_idle_ai, 1, 0);
  wait 4;
}

_id_A1E5(var_0, var_1, var_2) {
  self._id_11B54 = undefined;
  self._id_92CC = undefined;
  self._id_BBB5 = undefined;

  if (var_0 == "fly_glide")
  var_0 = "fly";

  if (var_0 == "hover_glide")
  var_0 = "hover";

  if (level._id_241D)
  var_3 = "";
  else
  var_3 = "_space";

  switch (var_0) {
  case "hover":
  self._id_92CC = level._id_A065[var_2 + "_hover" + var_3];
  self._id_BBB5 = level._id_A065[var_2 + "_hover_motion" + var_3];

  switch (var_1) {
  case "fly":
  self._id_11B54 = level._id_A065[var_2 + "_fly_to_hover" + var_3];
  break;
  case "landed_mode":
  self._id_11B54 = level._id_A065[var_2 + "_landed_to_hover"];
  break;
  }

  break;
  case "reentry":
  self._id_92CC = level._id_A065[var_2 + "_reentry"];
  self._id_BBB5 = level._id_A065[var_2 + "_reentry_motion"];

  switch (var_1) {
  case "fly":
  self._id_11B54 = level._id_A065[var_2 + "_fly_to_reentry"];
  break;
  }

  break;
  case "fly":
  self._id_92CC = level._id_A065[var_2 + "_fly" + var_3];
  self._id_BBB5 = level._id_A065[var_2 + "_fly_motion" + var_3];

  switch (var_1) {
  case "hover":
  self._id_11B54 = level._id_A065[var_2 + "_hover_to_fly" + var_3];
  break;
  case "landed_mode":
  self._id_11B54 = level._id_A065[var_2 + "_landed_to_fly"];
  break;
  }

  break;
  case "landed_mode":
  self._id_92CC = level._id_A065[var_2 + "_landed"];
  self._id_BBB5 = level._id_A065[var_2 + "_landed_motion"];
  case "none":
  break;
  }
}
