/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3411.gsc
***************************************/

_id_20E6(var_0, var_1) {
  var_0 notify("applyZombieScriptableState");
  var_0 endon("applyZombieScriptableState");
  var_0 endon("death");
  var_2 = 1;
  var_3 = 0;
  var_4 = 0;
  var_5 = 0;
  var_6 = 0;
  var_7 = 0;
  var_8 = 0;
  var_9 = 0;

  while (var_2) {
  var_10 = scripts\engine\utility::_id_9CEE(var_0._id_9B51);
  var_11 = scripts\engine\utility::_id_9CEE(var_0._id_9B81);
  var_12 = scripts\engine\utility::_id_9CEE(var_0._id_11196);
  var_13 = scripts\engine\utility::_id_9CEE(var_0._id_9E0C);
  var_14 = scripts\engine\utility::_id_9CEE(var_0._id_9B8A);
  var_15 = scripts\engine\utility::_id_9CEE(var_0._id_9BC9);
  var_16 = isdefined(var_0._id_7455);

  if (var_13) {
  if (!var_5) {
  var_5 = 1;
  var_3 = 0;
  var_4 = 0;
  var_6 = 0;
  var_7 = 0;
  var_8 = 0;
  var_9 = 0;
  var_0._id_EF42 = 1;
  _id_5554(var_0, "frozen");
  }
  }
  else if (var_16) {
  if (!var_9) {
  var_9 = 1;
  var_5 = 0;
  var_3 = 0;
  var_4 = 0;
  var_6 = 0;
  var_7 = 0;
  var_8 = 0;
  var_0._id_EF42 = 1;

  if (isalive(var_0)) {
  var_0 setscriptablepartstate("cold", "active", 1);
  _id_5554(var_0, "cold");
  var_0 thread _id_1887(var_0, var_1);
  }
  }
  }
  else if (var_10) {
  if (!var_8) {
  var_8 = 1;
  var_3 = 0;
  var_4 = 0;
  var_5 = 0;
  var_6 = 0;
  var_7 = 0;
  var_9 = 0;
  var_0._id_EF42 = 1;

  if (isalive(var_0)) {
  var_0 setscriptablepartstate("arcane_white", "active", 1);
  _id_5554(var_0, "arcane_white");
  }
  }
  }
  else if (var_14) {
  if (!var_6) {
  var_6 = 1;
  var_3 = 0;
  var_4 = 0;
  var_5 = 0;
  var_7 = 0;
  var_8 = 0;
  var_9 = 0;
  var_0._id_EF42 = 1;

  if (isalive(var_0)) {
  var_0 setscriptablepartstate("chemburn", "active", 1);
  _id_5554(var_0, "chemburn");
  }
  }
  }
  else if (var_11) {
  if (!var_3) {
  var_3 = 1;
  var_4 = 0;
  var_5 = 0;
  var_6 = 0;
  var_7 = 0;
  var_8 = 0;
  var_9 = 0;
  var_0._id_EF42 = 1;

  if (isalive(var_0)) {
  var_0 setscriptablepartstate("burning", "active", 1);
  _id_5554(var_0, "burning");
  }
  }
  }
  else if (var_15) {
  if (!var_7) {
  var_7 = 1;
  var_3 = 0;
  var_4 = 0;
  var_5 = 0;
  var_6 = 0;
  var_8 = 0;
  var_9 = 0;
  var_0._id_EF42 = 1;

  if (isalive(var_0)) {
  var_0 setscriptablepartstate("shocked", "active", 1);
  _id_5554(var_0, "electrified");
  }
  }
  }
  else if (var_12) {
  if (!var_4) {
  var_4 = 1;
  var_3 = 0;
  var_5 = 0;
  var_6 = 0;
  var_7 = 0;
  var_8 = 0;
  var_9 = 0;
  var_0._id_EF42 = 1;

  if (isalive(var_0)) {
  var_0 setscriptablepartstate("shocked", "active", 1);
  _id_5554(var_0, "shocked");
  }
  }
  } else {
  var_0._id_EF42 = undefined;
  var_0 _id_12973(var_0, var_5);
  var_2 = 0;
  }

  wait 0.1;
  }
}

_id_1887(var_0, var_1) {
  var_0 endon("death");

  if (scripts\engine\utility::_id_9CEE(var_0._id_0033)) {
  var_0 _meth_80B0(1, var_0.origin);
  var_0._id_0033 = 0;
  }

  if (scripts\engine\utility::_id_9CEE(var_0._id_1031A))
  var_0._id_1031A = undefined;
  else
  return;

  if (!isdefined(var_0._id_2303._id_4B12))
  var_2 = self._id_01F5;
  else
  var_2 = var_0._id_2303._id_4B12;

  var_2 = var_0._id_2303._id_4B12;

  switch (var_2) {
  case "slow_walk":
  break;
  case "walk":
  var_0 scripts\asm\asm_bb::_id_2968("slow_walk");
  break;
  case "run":
  var_0 scripts\asm\asm_bb::_id_2968("walk");
  break;
  case "sprint":
  var_0 scripts\asm\asm_bb::_id_2968("run");
  break;
  }

  var_0 waittill("defrosted");
  var_0 scripts\asm\asm_bb::_id_2968(var_2);
}

_id_E123(var_0) {
  var_0 notify("frozen_tick_updated");
  var_0 endon("frozen_tick_updated");
  var_0 endon("death");
  wait 1;

  if (isdefined(var_0._id_7455))
  var_0._id_7455 = undefined;

  var_0 notify("defrosted");
  var_0 thread _id_20E6(var_0);
}

_id_7383(var_0) {
  var_0 endon("death");
  var_0._id_9E0C = 1;
  var_0._id_0180 = 1;
  var_0._id_C026 = 1;
  var_0._id_74B5 = 1;
  var_0._id_C189 = 1;

  if (isdefined(var_0._id_7387) && issubstr(var_0._id_7387, "window"))
  var_0 setscriptablepartstate("frozen", "frozen_traverse");
  else if (scripts\engine\utility::_id_9CEE(var_0._id_565C))
  var_0 setscriptablepartstate("frozen", "frozen_crawl");
  else
  var_0 setscriptablepartstate("frozen", "frozen");

  wait 10.1;
  var_0._id_9E0C = undefined;
}

_id_12B9A(var_0) {
  var_0 endon("death");
  var_0 setscriptablepartstate("frozen", "unfrozen");

  if (!isalive(var_0))
  return;

  var_0 playsound("forge_freeze_shatter");
  var_0._id_0180 = 0;
  var_0._id_C026 = undefined;
  var_0._id_74B5 = undefined;
  var_0._id_C189 = undefined;
}

_id_5554(var_0, var_1) {
  switch (var_1) {
  case "frozen":
  var_0 setscriptablepartstate("cold", "inactive", 1);
  var_0 setscriptablepartstate("burning", "inactive", 1);
  var_0 setscriptablepartstate("shocked", "inactive", 1);
  var_0 setscriptablepartstate("chemburn", "inactive", 1);
  var_0 setscriptablepartstate("arcane_white", "inactive", 1);
  var_0 setscriptablepartstate("eyes", "eye_glow_off", 1);
  break;
  case "cold":
  var_0 setscriptablepartstate("burning", "inactive", 1);
  var_0 setscriptablepartstate("shocked", "inactive", 1);
  var_0 setscriptablepartstate("chemburn", "inactive", 1);
  var_0 setscriptablepartstate("arcane_white", "inactive", 1);
  var_0 setscriptablepartstate("eyes", "eye_glow_off", 1);
  break;
  case "arcane_white":
  var_0 setscriptablepartstate("cold", "inactive", 1);
  var_0 setscriptablepartstate("burning", "inactive", 1);
  var_0 setscriptablepartstate("shocked", "inactive", 1);
  var_0 setscriptablepartstate("chemburn", "inactive", 1);
  var_0 setscriptablepartstate("eyes", "eye_glow_off", 1);
  break;
  case "chemburn":
  var_0 setscriptablepartstate("cold", "inactive", 1);
  var_0 setscriptablepartstate("burning", "inactive", 1);
  var_0 setscriptablepartstate("shocked", "inactive", 1);
  var_0 setscriptablepartstate("arcane_white", "inactive", 1);
  var_0 setscriptablepartstate("eyes", "eye_glow_off", 1);
  break;
  case "burning":
  var_0 setscriptablepartstate("cold", "inactive", 1);
  var_0 setscriptablepartstate("shocked", "inactive", 1);
  var_0 setscriptablepartstate("chemburn", "inactive", 1);
  var_0 setscriptablepartstate("arcane_white", "inactive", 1);
  var_0 setscriptablepartstate("eyes", "eye_glow_off", 1);
  break;
  case "shocked":
  case "electrified":
  var_0 setscriptablepartstate("cold", "inactive", 1);
  var_0 setscriptablepartstate("burning", "inactive", 1);
  var_0 setscriptablepartstate("chemburn", "inactive", 1);
  var_0 setscriptablepartstate("arcane_white", "inactive", 1);
  var_0 setscriptablepartstate("eyes", "eye_glow_off", 1);
  break;
  default:
  break;
  }
}

_id_12973(var_0, var_1) {
  if (isdefined(var_0.agent_type) && var_0.agent_type == "c6")
  return;

  if (!_id_FFAA(var_0))
  return;

  if (isalive(var_0)) {
  var_0 setscriptablepartstate("burning", "inactive", 1);
  var_0 setscriptablepartstate("shocked", "inactive", 1);
  var_0 setscriptablepartstate("chemburn", "inactive", 1);
  var_0 setscriptablepartstate("arcane_white", "inactive", 1);
  var_0 setscriptablepartstate("cold", "inactive", 1);
  }

  if (scripts\engine\utility::_id_9CEE(var_1))
  var_0._id_9E0C = undefined;
}

_id_1296F(var_0) {
  if (isdefined(var_0.agent_type) && (var_0.agent_type == "c6" || var_0.agent_type == "zombie_brute" || var_0.agent_type == "zombie_grey" || var_0.agent_type == "zombie_ghost"))
  return;

  if (!_id_FFAA(var_0))
  return;

  var_0 setscriptablepartstate("burning", "inactive", 1);
  var_0 setscriptablepartstate("pet", "inactive", 1);
  var_0 setscriptablepartstate("shocked", "inactive", 1);
  var_0 setscriptablepartstate("corrosive", "inactive", 1);
  var_0 setscriptablepartstate("chemburn", "inactive", 1);
  var_0 setscriptablepartstate("arcane_white", "inactive", 1);
  var_0 setscriptablepartstate("cold", "inactive", 1);

  if (isdefined(var_0._id_8B66))
  var_0 setscriptablepartstate("backpack", "hide", 1);

  var_0 _meth_80BB(2, 0);
}

_id_FFAA(var_0) {
  if (!isdefined(var_0._id_1096F))
  return 0;

  if (isdefined(level._id_1176A) && var_0 == level._id_1176A)
  return 0;

  if (isdefined(var_0.electrocuted))
  return 0;

  switch (var_0._id_1096F) {
  case "zombie_grey":
  case "zombie_brute":
  return 0;
  default:
  return 1;
  }
}
