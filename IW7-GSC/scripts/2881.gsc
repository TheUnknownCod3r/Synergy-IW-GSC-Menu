/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2881.gsc
***************************************/

main() {
  precachestring(&"SCRIPT_INTELLIGENCE_OF_EIGHTEEN");
  precachestring(&"SCRIPT_RORKEFILE_PREV_FOUND");
  precachestring(&"SCRIPT_RORKEFILE_PICKUP");
  precachestring(&"SCRIPT_INTELLIGENCE_PERCENT");
  precachestring(&"SCRIPT_INTELLIGENCE_UPLOADING");
  level._id_9953 = _id_48A0();
  setdvar("ui_level_cheatpoints", level._id_9953.size);
  level._id_9950 = 0;
  setdvar("ui_level_player_cheatpoints", level._id_9950);
  level._id_113C7 = _id_48A1();
  _id_9858();
  _id_995C();
}

_id_DFC0() {
  foreach (var_2, var_1 in level._id_9953) {
  if (!isdefined(var_1._id_E0E2))
  var_1 _id_E041();
  }
}

_id_E041() {
  self._id_E0E2 = 1;
  self._id_0195 hide();
  self._id_0195 notsolid();
  scripts\engine\utility::_id_12778();
  level._id_9950++;
  setdvar("ui_level_player_cheatpoints", level._id_9950);
  self notify("end_trigger_thread");
}

_id_9858() {
  foreach (var_3, var_1 in level._id_9953) {
  var_2 = var_1.origin;
  var_1._id_C1D5 = _id_7B42(var_2);
  }
}

_id_995C() {
  foreach (var_2, var_1 in level._id_9953) {
  if (var_1 _id_3DAD()) {
  var_1 _id_E041();
  continue;
  }

  var_1 thread _id_135F5();
  var_1 thread _id_D64F();
  }
}

_id_D64F() {
  self endon("end_loop_thread");

  if (isdefined(self)) {
  if (_id_3DAD())
  _id_E041();
  }
  else
  return;

  while (!_id_3DAD())
  wait 0.05;

  _id_E041();
}

_id_3DAD() {
  foreach (var_1 in level.players) {
  if (!var_1 _meth_8153(self._id_C1D5))
  return 0;
  }

  return 1;
}

_id_48A0() {
  var_0 = getentarray("intelligence_item", "targetname");

  for (var_1 = 0; var_1 < var_0.size; var_1++) {
  var_0[var_1]._id_0195 = getent(var_0[var_1]._id_0334, "targetname");
  var_0[var_1]._id_7339 = 0;
  }

  return var_0;
}

_id_48A1() {
  var_0 = 20;
  var_1 = [];

  for (var_2 = 1; var_2 <= var_0; var_2++) {
  var_3 = tablelookup("sp/intel_items.csv", 0, var_2, 4);

  if (isdefined(var_3) && var_3 != "undefined") {
  var_4 = strtok(var_3, ",");

  for (var_5 = 0; var_5 < var_4.size; var_5++)
  var_4[var_5] = int(var_4[var_5]);

  var_1[var_2] = (var_4[0], var_4[1], var_4[2]);
  continue;
  }

  var_1[var_2] = undefined;
  }

  return var_1;
}

_id_26CA() {
  _id_EB60();
  _func_22A();
  waittillframeend;
  _id_E041();
}

_id_135F5() {
  self endon("end_trigger_thread");

  if (self.classname == "trigger_use") {
  self sethintstring(&"SCRIPT_RORKEFILE_PICKUP");
  self _meth_83D6(1);
  }

  thread _id_12F84();
  self waittill("hold_complete");
  self notify("end_loop_thread");
  _id_9952(level.player);
  _id_26CA();
}

_id_12F84() {
  level.player._id_906B = 0;

  while (level.player._id_906B < 30 && isdefined(self)) {
  level.player._id_906B = 0;
  self stoploopsound("intelligence_pickup_loop");
  self waittill("trigger", var_0);
  self playloopsound("intelligence_pickup_loop");
  setdvar("ui_securing", "intel");
  setdvar("ui_securing_progress", 0.0);
  thread _id_D9DA();
  _id_906C();
  }

  self notify("hold_complete");
  self stoploopsound("intelligence_pickup_loop");
  setdvar("ui_securing_progress", 1.0);
  setdvar("ui_securing", "");
}

_id_906C() {
  self endon("stopped_pressing");

  while (isdefined(self) && isdefined(level.player)) {
  if (level.player usebuttonpressed() && distance(level.player.origin, self.origin) < 128 && isalive(level.player))
  level.player._id_906B++;
  else
  {
  setdvar("ui_securing", "");
  self stoploopsound("intelligence_pickup_loop");
  self notify("stopped_pressing");
  }

  if (level.player._id_906B >= 30) {
  setdvar("ui_securing", "");
  self notify("stopped_pressing");
  self stoploopsound("intelligence_pickup_loop");
  }

  scripts\engine\utility::waitframe();
  }
}

_id_D9DA() {
  self endon("stopped_pressing");
  var_0 = 30;
  var_1 = 8;

  for (var_2 = 0; var_2 < var_0; var_2++) {
  setdvar("ui_securing_progress", getdvarfloat("ui_securing_progress") + 1 / var_0);
  scripts\engine\utility::waitframe();
  }
}

_id_9961(var_0, var_1) {
  self endon("stopped_pressing");
  var_2 = 30;
  var_3 = 10;
  var_4 = 0;

  for (var_5 = 0; var_5 < var_2; var_5++) {
  if (var_4 > var_3)
  var_4 = 0;

  if (var_4 < var_3 / 2)
  var_0 _meth_834D(&"SCRIPT_INTELLIGENCE_UPLOADING");
  else
  var_0 _meth_834D("");

  var_1._id_01AD = int(var_5 / var_2 * 100);
  var_1 _meth_834D(&"SCRIPT_INTELLIGENCE_PERCENT");
  var_4++;
  scripts\engine\utility::waitframe();
  }

  var_0 _meth_834D(&"SCRIPT_INTELLIGENCE_UPLOADING");
  var_1._id_01AD = "100";
  var_1 _meth_834D(&"SCRIPT_INTELLIGENCE_PERCENT");
}

_id_EB60() {
  foreach (var_1 in level.players) {
  if (var_1 _meth_8153(self._id_C1D5))
  continue;

  var_1 _meth_8324(self._id_C1D5);
  }

  logstring("found intel item " + self._id_C1D5);
  _id_0B28::_id_12F24();
}

_id_8322() {
  var_0 = self _meth_8139("cheatPoints");
  self _meth_8302("cheatPoints", var_0 + 1);
}

_id_9952(var_0) {
  self._id_0195 hide();
  self._id_0195 notsolid();
  _func_178("intelligence_pickup", self._id_0195.origin);
  var_1 = 3000;
  var_2 = 700;
  var_3 = var_1 + var_2 / 1000;

  foreach (var_5 in level.players) {
  if (var_0 != var_5 && var_5 _meth_8153(self._id_C1D5))
  continue;

  var_6 = var_5 _id_0B3F::_id_4999("objective", 1.5);
  var_6._id_0154 = (0.7, 0.7, 0.3);
  var_6._id_0153 = 1;
  var_6 _id_F99F();
  var_6.y = -50;
  var_6 _meth_832C(60, var_1, var_2);
  var_7 = 0;

  if (var_0 == var_5 && var_5 _meth_8153(self._id_C1D5))
  var_6._id_01AD = &"SCRIPT_RORKEFILE_PREV_FOUND";
  else
  {
  var_6._id_01AD = &"SCRIPT_INTELLIGENCE_OF_EIGHTEEN";
  var_5 _id_8322();
  var_7 = var_5 _meth_8139("cheatPoints");
  var_6 setvalue(var_7);
  }

  if (var_7 == 18)
  var_5 _id_0B91::_id_D0A1("EXT_1");

  var_6 scripts\engine\utility::_id_50E1(var_3, ::destroy);
  }
}

_id_F99F() {
  self._id_00B9 = (1, 1, 1);
  self.alpha = 1;
  self.x = 0;
  self._id_002B = "center";
  self._id_002C = "middle";
  self._id_017D = "center";
  self._id_0382 = "middle";
  self._id_0142 = 1;
}

_id_23AF() {
  var_0 = [];

  for (var_1 = 1; var_1 < 65; var_1++) {
  var_2 = tablelookup("sp/intel_items.csv", 0, var_1, 4);
  var_3 = strtok(var_2, ",");

  for (var_1 = 0; var_1 < var_3.size; var_1++)
  var_3[var_1] = int(var_3[var_1]);

  var_0[var_1] = (var_3[0], var_3[1], var_3[2]);
  }

  for (var_1 = 0; var_1 < var_0.size; var_1++) {
  if (!isdefined(var_0[var_1]))
  continue;

  if (var_0[var_1] == "undefined")
  continue;

  for (var_4 = 0; var_4 < var_0.size; var_4++) {
  if (!isdefined(var_0[var_4]))
  continue;

  if (var_0[var_4] == "undefined")
  continue;

  if (var_1 == var_4)
  continue;

  if (var_0[var_1] == var_0[var_4]) {}
  }
  }
}

_id_7B42(var_0) {
  for (var_1 = 1; var_1 < level._id_113C7.size + 1; var_1++) {
  if (!isdefined(level._id_113C7[var_1]))
  continue;

  if (distancesquared(var_0, level._id_113C7[var_1]) < squared(75))
  return var_1;
  }
}
