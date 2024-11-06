/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2878.gsc
***************************************/

init() {
  level._id_12B29 = spawnstruct();
  level._id_12B29._id_017D = "left";
  level._id_12B29._id_0382 = "top";
  level._id_12B29._id_002B = "left";
  level._id_12B29._id_002C = "top";
  level._id_12B29.x = 0;
  level._id_12B29.y = 0;
  level._id_12B29._id_039F = 0;
  level._id_12B29.height = 0;
  level._id_12B29._id_3E67 = [];

  if (level._id_4542)
  level._id_724F = 12;
  else
  level._id_724F = 12;

  setdvar("ui_remotemissile_playernum", 0);
  setdvar("ui_pmc_won", 0);
  setdvar("ui_actionSlot_1_forceActive", "off");
  setdvar("ui_actionSlot_2_forceActive", "off");
  setdvar("ui_actionSlot_3_forceActive", "off");
  setdvar("ui_actionSlot_4_forceActive", "off");
  setdvar("hideHudFast", 0);
  setdvar("ui_securing", "");
  setdvar("ui_securing_progress", 0.0);
  setdvar("hud_showObjectives", 1);
  setdvar("hud_showIntel", 1);
  setdvar("minimap_sp", 0);
  setdvar("minimap_full_sp", 0);
  _func_12D("inGame.sp.KleenexPopup");
  _id_8DF5();
}

_id_8DF5() {
  if (isdefined(level._id_8DF1))
  return;

  var_0 = [];
  var_0["oxygen"] = 0.0;
  var_0["temperature"] = 0;
  var_0["pressure"] = 0.0;
  level._id_8DF1 = var_0;
}

_id_8DF9(var_0, var_1) {
  if (var_0 == "suit") {
  var_2 = randomfloatrange(93.83, 93.87);
  var_3 = randomintrange(18, 22);
  var_4 = randomfloatrange(8.2, 8.4);
  } else {
  var_2 = randomfloatrange(20.93, 20.97);
  var_3 = randomintrange(18, 22);
  var_4 = randomfloatrange(14.5, 14.9);
  }

  if (isdefined(var_1) && var_1) {
  level._id_8DF1["oxygen"] = var_2;
  level._id_8DF1["temperature"] = var_3;
  level._id_8DF1["pressure"] = var_4;
  return;
  }

  level._id_8DF1["oxygen"] = 0.0;
  level._id_8DF1["temperature"] = 0;
  level._id_8DF1["pressure"] = 0.0;
  var_5 = randomfloatrange(3, 4);
  thread _id_8DFB("oxygen", var_5, var_2);
  thread _id_8DFB("temperature", var_5, var_3);
  thread _id_8DFB("pressure", var_5, var_4);
}

_id_8DF8(var_0) {
  thread _id_8DFA("oxygen", randomfloatrange(3, 4), 0.0);
  thread _id_8DFA("temperature", randomfloatrange(3, 4), 0);
  thread _id_8DFA("pressure", randomfloatrange(3, 4), 0.0);
}

_id_8DF7(var_0, var_1) {
  var_2 = randomfloatrange(93.83, 93.87);
  var_3 = randomintrange(18, 22);
  var_4 = randomfloatrange(8.2, 8.4);
  level._id_8DF1["oxygen"] = var_2;
  level._id_8DF1["temperature"] = var_3;
  level._id_8DF1["pressure"] = var_4;

  if (isdefined(var_1) && var_1)
  return;

  if (!isdefined(var_0)) {
  setomnvar("ui_helmet_meter_oxygen", _id_8DFC("oxygen", var_2));
  setomnvar("ui_helmet_meter_temperature", _id_8DFC("temperature", var_3));
  setomnvar("ui_helmet_meter_pressure", _id_8DFC("pressure", var_4));
  return;
  }

  thread _id_8DFB("oxygen", var_0, var_2);
  thread _id_8DFB("temperature", var_0, var_3);
  thread _id_8DFB("pressure", var_0, var_4);
}

_id_8DF6(var_0, var_1) {
  var_2 = randomfloatrange(20.93, 20.97);
  var_3 = randomintrange(18, 22);
  var_4 = randomfloatrange(14.5, 14.9);
  level._id_8DF1["oxygen"] = var_2;
  level._id_8DF1["temperature"] = var_3;
  level._id_8DF1["pressure"] = var_4;

  if (isdefined(var_1) && var_1)
  return;

  if (!isdefined(var_0)) {
  setomnvar("ui_helmet_meter_oxygen", _id_8DFC("oxygen", var_2));
  setomnvar("ui_helmet_meter_temperature", _id_8DFC("temperature", var_3));
  setomnvar("ui_helmet_meter_pressure", _id_8DFC("pressure", var_4));
  return;
  }

  thread _id_8DFB("oxygen", var_0, var_2);
  thread _id_8DFB("temperature", var_0, var_3);
  thread _id_8DFB("pressure", var_0, var_4);
}

_id_8DFD(var_0, var_1, var_2) {
  if (isdefined(var_2) && var_2) {
  level._id_8DF1["oxygen"] = var_0;
  return;
  }

  if (!isdefined(var_1))
  var_1 = randomfloatrange(3, 4);

  _id_8DFA("oxygen", var_1, var_0);
  _id_8E00("oxygen");
}

_id_8DFF(var_0, var_1, var_2) {
  if (isdefined(var_2) && var_2) {
  level._id_8DF1["temperature"] = var_0;
  return;
  }

  if (!isdefined(var_1))
  var_1 = randomfloatrange(3, 4);

  _id_8DFA("temperature", var_1, var_0);
  _id_8E00("temperature");
}

_id_8DFE(var_0, var_1, var_2) {
  if (isdefined(var_2) && var_2) {
  level._id_8DF1["pressure"] = var_0;
  return;
  }

  if (!isdefined(var_1))
  var_1 = randomfloatrange(3, 4);

  _id_8DFA("pressure", var_1, var_0);
  _id_8E00("pressure");
}

_id_8DF2(var_0) {
  var_1 = randomfloatrange(20.93, 20.97);
  var_2 = randomintrange(18, 22);
  var_3 = randomfloatrange(14.5, 14.9);

  if (!isdefined(var_0))
  var_0 = randomfloatrange(3, 4);

  thread _id_8DFB("oxygen", var_0, var_1);

  if (!isdefined(var_0))
  var_0 = randomfloatrange(3, 4);

  thread _id_8DFB("temperature", var_0, var_2);

  if (!isdefined(var_0))
  var_0 = randomfloatrange(3, 4);

  thread _id_8DFB("pressure", var_0, var_3);
}

_id_8DF3(var_0) {
  var_1 = randomfloatrange(93.83, 93.87);
  var_2 = randomintrange(18, 22);
  var_3 = randomfloatrange(8.2, 8.4);

  if (!isdefined(var_0))
  var_0 = randomfloatrange(3, 4);

  thread _id_8DFB("oxygen", var_0, var_1);

  if (!isdefined(var_0))
  var_0 = randomfloatrange(3, 4);

  thread _id_8DFB("temperature", var_0, var_2);

  if (!isdefined(var_0))
  var_0 = randomfloatrange(3, 4);

  thread _id_8DFB("pressure", var_0, var_3);
}

_id_8DF4(var_0, var_1) {
  if (var_0 == "interior") {
  var_2 = randomfloatrange(20.93, 20.97);
  var_3 = randomintrange(18, 22);
  var_4 = randomfloatrange(14.5, 14.9);
  } else {
  var_2 = randomfloatrange(6, 8);
  var_3 = randomintrange(-60, -50);
  var_4 = randomfloatrange(4, 6);
  }

  if (!isdefined(var_1))
  var_1 = randomfloatrange(2, 3);

  thread _id_8DFB("oxygen", var_1, var_2);

  if (!isdefined(var_1))
  var_1 = randomfloatrange(2, 3);

  thread _id_8DFB("temperature", var_1, var_3);

  if (!isdefined(var_1))
  var_1 = randomfloatrange(2, 3);

  thread _id_8DFB("pressure", var_1, var_4);
}

_id_8DFA(var_0, var_1, var_2) {
  var_3 = 0;
  var_4 = 0;
  var_5 = 0;
  var_6 = abs((var_2 - level._id_8DF1[var_0]) / var_1 * 0.05);
  var_7 = "ui_helmet_meter_" + var_0;

  if (var_0 == "oxygen") {
  var_3 = 1;
  var_4 = 1;
  }
  else if (var_0 == "temperature") {
  var_3 = 2;
  var_4 = 3;
  }
  else if (var_0 == "pressure") {
  var_3 = 1;
  var_4 = 1;
  }

  var_8 = var_3 * 0.05;
  var_9 = var_4 * 0.05;
  var_10 = 1;

  if (var_2 == level._id_8DF1[var_0])
  return;
  else if (var_2 < level._id_8DF1[var_0])
  var_10 = 0;

  for (var_11 = 0; var_11 < var_1; var_11 = var_11 + 0.05) {
  if (var_10)
  level._id_8DF1[var_0] = level._id_8DF1[var_0] + var_6;
  else
  level._id_8DF1[var_0] = level._id_8DF1[var_0] - var_6;

  var_12 = _id_8DFC(var_0, level._id_8DF1[var_0]);
  setomnvar(var_7, var_12);
  wait 0.05;
  }

  var_12 = _id_8DFC(var_0, level._id_8DF1[var_0]);
  setomnvar(var_7, var_12);
}

_id_8E00(var_0) {
  var_1 = 0;

  if (var_0 == "oxygen")
  var_1 = randomfloatrange(-0.5, 0.5) + level._id_8DF1[var_0];
  else if (var_0 == "temperature")
  var_1 = randomintrange(-1, 1) + level._id_8DF1[var_0];
  else if (var_0 == "pressure")
  var_1 = randomfloatrange(-0.5, 0.5) + level._id_8DF1[var_0];

  var_2 = level._id_8DF1[var_0];
  var_3 = randomfloatrange(1, 3);
  _id_8DFA(var_0, var_3, var_1);
  var_3 = randomfloatrange(1, 2);
  _id_8DFA(var_0, var_3, var_2);
}

_id_8DFB(var_0, var_1, var_2) {
  _id_8DFA(var_0, var_1, var_2);
  _id_8E00(var_0);
}

_id_8DFC(var_0, var_1) {
  var_2 = int(var_1);
  return var_2;
}
