/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2722.gsc
***************************************/

_id_59F5(var_0) {
  var_1 = getentarray(var_0, "targetname");

  foreach (var_3 in var_1) {
  if (isdefined(var_3._id_EE79))
  var_3 _id_32E7(var_3._id_EE79);

  var_3 _id_59E7();
  }

  foreach (var_3 in var_1)
  var_3 thread _id_59F7();
}

_id_59E7() {
  var_0 = self;
  var_0._id_5A2B = [];

  if (isdefined(var_0._id_EDE8))
  var_0._id_5A17 = max(0.1, float(var_0._id_EDE8) / 1000);

  var_1 = getentarray(var_0._id_0334, "targetname");

  foreach (var_3 in var_1) {
  if (issubstr(var_3.classname, "trigger")) {
  if (!isdefined(var_0._id_12720))
  var_0._id_12720 = [];

  if (isdefined(var_3._id_EE79))
  var_3 _id_1277D(var_3._id_EE79);

  if (isdefined(var_3._id_EE01)) {
  var_4 = getent(var_3._id_EE01, "script_linkname");
  var_3 _meth_80D2();
  var_3 linkto(var_4);
  }

  var_0._id_12720[var_0._id_12720.size] = var_3;
  continue;
  }

  if (var_3.classname == "script_brushmodel" || var_3.classname == "script_model") {
  if (isdefined(var_3.script_noteworthy) && issubstr(var_3.script_noteworthy, "light")) {
  if (issubstr(var_3.script_noteworthy, "light_on")) {
  if (!isdefined(var_0._id_ACCE))
  var_0._id_ACCE = [];

  var_3 hide();
  var_0._id_ACCE[var_0._id_ACCE.size] = var_3;
  }
  else if (issubstr(var_3.script_noteworthy, "light_off")) {
  if (!isdefined(var_0._id_ACCC))
  var_0._id_ACCC = [];

  var_3 hide();
  var_0._id_ACCC[var_0._id_ACCC.size] = var_3;
  } else {}
  }
  else if (var_3._id_02AF & 2) {
  if (!isdefined(var_0._id_19E5))
  var_0._id_19E5 = [];

  var_3 notsolid();
  var_3 hide();
  var_3 _meth_829D(0);
  var_0._id_19E5[var_0._id_19E5.size] = var_3;
  }
  else
  var_0._id_5A2B[var_0._id_5A2B.size] = var_3;

  continue;
  }

  if (var_3.classname == "script_origin")
  var_0._id_6666 = var_3;
  }

  if (!isdefined(var_0._id_6666) && var_0._id_5A2B.size)
  var_0._id_6666 = sortbydistance(var_0._id_5A2B, var_0.origin)[0];

  foreach (var_7 in var_0._id_5A2B) {
  var_7._id_D6A4 = var_7.origin;
  var_7._id_D6AE = scripts\engine\utility::_id_817E(var_7._id_0334, "targetname").origin;
  var_7._id_5717 = distance(var_7._id_D6AE, var_7._id_D6A4);
  var_7.origin = var_7._id_D6AE;
  var_7._id_C001 = 0;

  if (isdefined(var_7._id_EE79))
  var_7 _id_59BD(var_7._id_EE79);
  }
}

_id_59F7() {
  var_0 = self;
  var_0 _id_59EC(2, 1);

  for (;;) {
  var_0._id_10E27 = undefined;
  var_0._id_10E29 = undefined;
  var_0 scripts\engine\utility::waittill_any("door_state_done", "door_state_interrupted");

  if (isdefined(var_0._id_10E27) && var_0._id_10E27) {
  var_1 = var_0 _id_59EE(var_0._id_10E26);
  var_0 _id_59EC(var_1, 0);
  continue;
  }

  if (isdefined(var_0._id_10E29) && var_0._id_10E29) {
  var_0 _id_59EC(4, 0);
  continue;
  }
  }
}

_id_59EE(var_0) {
  var_1 = self;
  var_2 = undefined;

  if (var_0 == 0)
  var_2 = 3;
  else if (var_0 == 2)
  var_2 = 1;
  else if (var_0 == 1)
  var_2 = 0;
  else if (var_0 == 3)
  var_2 = 2;
  else if (var_0 == 4)
  var_2 = var_1._id_10E2E;
  else
  {}

  return var_2;
}

_id_59F0(var_0) {
  var_1 = self;
  var_1 endon("door_state_interrupted");
  var_1._id_10E27 = undefined;

  if (var_1._id_10E26 == 0 || var_1._id_10E26 == 2) {
  if (!var_0) {
  foreach (var_3 in var_1._id_5A2B) {
  if (isdefined(var_3._id_11041)) {
  var_3 stoploopsound();
  var_3 playsoundonmovingent(var_3._id_11041);
  }
  }
  }

  if (isdefined(var_1._id_ACCE)) {
  foreach (var_6 in var_1._id_ACCE)
  var_6 show();
  }

  foreach (var_3 in var_1._id_5A2B) {
  if (var_1._id_10E26 == 0) {
  if (isdefined(var_1._id_19E5)) {
  foreach (var_10 in var_1._id_19E5) {
  var_10 show();
  var_10 _meth_829D(1);
  }
  }

  if (var_3._id_02AF & 1)
  var_3 disconnectpaths();
  } else {
  if (isdefined(var_1._id_19E5)) {
  foreach (var_10 in var_1._id_19E5) {
  var_10 hide();
  var_10 _meth_829D(0);
  }
  }

  if (var_3._id_02AF & 1) {
  if (isdefined(var_3.script_noteworthy) && var_3.script_noteworthy == "always_disconnect")
  var_3 disconnectpaths();
  else
  var_3 connectpaths();
  }
  }

  if (isdefined(var_3.script_noteworthy)) {
  if (var_3.script_noteworthy == "clockwise_wheel" || var_3.script_noteworthy == "counterclockwise_wheel")
  var_3 rotatevelocity((0, 0, 0), 0.1);
  }

  if (var_3._id_C001)
  var_3._id_12BE7 = undefined;
  }

  var_15 = scripts\engine\utility::ter_op(var_1._id_10E26 == 0, &"MP_DOOR_USE_OPEN", &"MP_DOOR_USE_CLOSE");
  var_1 sethintstring(var_15);
  var_1 makeusable();
  var_1 waittill("trigger");

  if (isdefined(var_1._id_32E9))
  var_1 playsound(var_1._id_32E9);
  }
  else if (var_1._id_10E26 == 1 || var_1._id_10E26 == 3) {
  if (isdefined(var_1._id_ACCC)) {
  foreach (var_6 in var_1._id_ACCC)
  var_6 show();
  }

  var_1 makeunusable();

  if (var_1._id_10E26 == 1) {
  var_1 thread _id_59EF();

  foreach (var_3 in var_1._id_5A2B) {
  if (isdefined(var_3.script_noteworthy)) {
  var_19 = scripts\engine\utility::ter_op(isdefined(var_1._id_5A17), var_1._id_5A17, 3.0);
  var_20 = scripts\engine\utility::ter_op(var_1._id_10E26 == 1, var_3._id_D6A4, var_3._id_D6AE);
  var_21 = distance(var_3.origin, var_20);
  var_22 = max(0.1, var_21 / var_3._id_5717 * var_19);
  var_23 = max(var_22 * 0.25, 0.05);
  var_24 = 360 * var_21 / 94.2;

  if (var_3.script_noteworthy == "clockwise_wheel")
  var_3 rotatevelocity((0, 0, -1 * var_24 / var_22), var_22, var_23, var_23);
  else if (var_3.script_noteworthy == "counterclockwise_wheel")
  var_3 rotatevelocity((0, 0, var_24 / var_22), var_22, var_23, var_23);
  }
  }
  }
  else if (var_1._id_10E26 == 3) {
  if (isdefined(var_1._id_C607) && var_1._id_C607)
  var_1 thread _id_59EF();

  foreach (var_3 in var_1._id_5A2B) {
  if (isdefined(var_3.script_noteworthy)) {
  var_19 = scripts\engine\utility::ter_op(isdefined(var_1._id_5A17), var_1._id_5A17, 3.0);
  var_20 = scripts\engine\utility::ter_op(var_1._id_10E26 == 1, var_3._id_D6A4, var_3._id_D6AE);
  var_21 = distance(var_3.origin, var_20);
  var_22 = max(0.1, var_21 / var_3._id_5717 * var_19);
  var_23 = max(var_22 * 0.25, 0.05);
  var_24 = 360 * var_21 / 94.2;

  if (var_3.script_noteworthy == "clockwise_wheel")
  var_3 rotatevelocity((0, 0, var_24 / var_22), var_22, var_23, var_23);
  else if (var_3.script_noteworthy == "counterclockwise_wheel")
  var_3 rotatevelocity((0, 0, -1 * var_24 / var_22), var_22, var_23, var_23);
  }
  }
  }

  wait 0.1;
  var_1 childthread _id_59F1("garage_door_start", "garage_door_loop");
  var_19 = scripts\engine\utility::ter_op(isdefined(var_1._id_5A17), var_1._id_5A17, 3.0);
  var_28 = undefined;

  foreach (var_3 in var_1._id_5A2B) {
  var_20 = scripts\engine\utility::ter_op(var_1._id_10E26 == 1, var_3._id_D6A4, var_3._id_D6AE);

  if (var_3.origin != var_20) {
  var_22 = max(0.1, distance(var_3.origin, var_20) / var_3._id_5717 * var_19);
  var_23 = max(var_22 * 0.25, 0.05);
  var_3 moveto(var_20, var_22, var_23, var_23);
  var_3 scripts\mp\movers::_id_C13B();

  if (var_3._id_C001)
  var_3._id_12BE7 = scripts\mp\movers::_id_12BEE;

  if (!isdefined(var_28) || var_22 > var_28)
  var_28 = var_22;
  }
  }

  if (isdefined(var_28))
  wait(var_28);
  }
  else if (var_1._id_10E26 == 4) {
  foreach (var_3 in var_1._id_5A2B) {
  var_3 moveto(var_3.origin, 0.05, 0.0, 0.0);
  var_3 scripts\mp\movers::_id_C13B();

  if (var_3._id_C001)
  var_3._id_12BE7 = undefined;

  if (isdefined(var_3.script_noteworthy)) {
  if (var_3.script_noteworthy == "clockwise_wheel" || var_3.script_noteworthy == "counterclockwise_wheel")
  var_3 rotatevelocity((0, 0, 0), 0.05);
  }
  }

  if (isdefined(var_1._id_ACCC)) {
  foreach (var_6 in var_1._id_ACCC)
  var_6 show();
  }

  var_1._id_6666 stoploopsound();

  foreach (var_3 in var_1._id_5A2B) {
  if (isdefined(var_3._id_9A88))
  var_3 playsound(var_3._id_9A88);
  }

  wait 1.0;
  } else {}

  var_1._id_10E27 = 1;

  foreach (var_3 in var_1._id_5A2B)
  var_3._id_10E27 = 1;

  var_1 notify("door_state_done");
}

_id_59F1(var_0, var_1) {
  var_2 = self;
  var_3 = 1;
  var_4 = 1;
  var_5 = 0;

  if (var_2._id_10E26 == 3 || var_2._id_10E26 == 1) {
  foreach (var_7 in var_2._id_5A2B) {
  if (isdefined(var_7._id_10D2A)) {
  var_7 playsoundonmovingent(var_7._id_10D2A);
  var_5 = lookupsoundlength(var_7._id_10D2A) / 1000;
  var_3 = 0;
  }
  }

  if (var_3) {
  var_5 = lookupsoundlength(var_0) / 1000;
  playloopsound(var_2._id_6666.origin, var_0);
  }
  }

  wait(var_5 * 0.3);

  if (var_2._id_10E26 == 3 || var_2._id_10E26 == 1) {
  foreach (var_7 in var_2._id_5A2B) {
  if (isdefined(var_7._id_B048)) {
  if (var_7._id_B048 != "none")
  var_7 playloopsound(var_7._id_B048);

  var_4 = 0;
  }
  }

  if (var_4)
  var_2._id_6666 playloopsound(var_1);
  }
}

_id_59EC(var_0, var_1) {
  var_2 = self;

  if (isdefined(var_2._id_10E26)) {
  _id_59ED(var_2._id_10E26);
  var_2._id_10E2E = var_2._id_10E26;
  }

  var_2._id_10E26 = var_0;
  var_2 thread _id_59F0(var_1);
}

_id_59ED(var_0) {
  var_1 = self;

  if (var_0 == 0 || var_0 == 2) {
  if (isdefined(var_1._id_ACCE)) {
  foreach (var_3 in var_1._id_ACCE)
  var_3 hide();
  }
  }
  else if (var_0 == 1 || var_0 == 3) {
  if (isdefined(var_1._id_ACCC)) {
  foreach (var_3 in var_1._id_ACCC)
  var_3 hide();
  }

  var_1._id_6666 stoploopsound();

  foreach (var_8 in var_1._id_5A2B) {
  if (isdefined(var_8._id_B048))
  var_8 stoploopsound();
  }
  } else {
  if (var_0 == 4)
  return;

  return;
  }
}

_id_59EF() {
  var_0 = self;
  var_0 endon("door_state_done");
  var_1 = [];

  foreach (var_3 in var_0._id_12720) {
  if (var_0._id_10E26 == 1) {
  if (isdefined(var_3._id_C0B1) && var_3._id_C0B1 == 1)
  continue;
  }
  else if (var_0._id_10E26 == 3) {
  if (isdefined(var_3._id_C0B2) && var_3._id_C0B2 == 1)
  continue;
  }

  var_1[var_1.size] = var_3;
  }

  if (var_1.size > 0) {
  var_5 = var_0 _id_13739(var_1);

  if (!isdefined(var_5.fauxdeath) || var_5.fauxdeath == 0) {
  var_0._id_10E29 = 1;
  var_0 notify("door_state_interrupted");
  }
  }
}

_id_13739(var_0) {
  var_1 = self;

  foreach (var_3 in var_0)
  var_1 thread _id_E467(var_3);

  var_1 waittill("interrupted");
  return var_1._id_9A8E;
}

_id_E467(var_0) {
  var_1 = self;
  var_1 endon("door_state_done");
  var_1 endon("interrupted");

  for (;;) {
  var_0 waittill("trigger", var_2);

  if (isdefined(var_0._id_DA79) && var_0._id_DA79 == 1) {
  if (isplayer(var_2)) {
  var_3 = var_2 getstance();

  if (var_3 != "prone")
  continue;
  else
  {
  var_4 = vectornormalize(anglestoforward(var_2.angles));
  var_5 = vectornormalize(var_0.origin - var_2.origin);
  var_6 = vectordot(var_4, var_5);

  if (var_6 > 0)
  continue;
  }
  }
  }

  break;
  }

  var_1._id_9A8E = var_2;
  var_1 notify("interrupted");
}

_id_32E7(var_0) {
  var_1 = self;
  var_1._id_32E9 = undefined;

  if (!isdefined(var_0))
  var_0 = "";

  var_2 = strtok(var_0, ";");

  foreach (var_4 in var_2) {
  var_5 = strtok(var_4, "=");

  if (var_5.size != 2)
  continue;

  if (var_5[1] == "undefined" || var_5[1] == "default") {
  var_1._id_C8F0[var_5[0]] = undefined;
  continue;
  }

  switch (var_5[0]) {
  case "open_interrupt":
  var_1._id_C607 = _id_11149(var_5[1]);
  break;
  case "button_sound":
  var_1._id_32E9 = var_5[1];
  break;
  default:
  break;
  }
  }
}

_id_59BD(var_0) {
  var_1 = self;
  var_1._id_10D2A = undefined;
  var_1._id_11041 = undefined;
  var_1._id_B048 = undefined;
  var_1._id_9A88 = undefined;

  if (!isdefined(var_0))
  var_0 = "";

  var_2 = strtok(var_0, ";");

  foreach (var_4 in var_2) {
  var_5 = strtok(var_4, "=");

  if (var_5.size != 2)
  continue;

  if (var_5[1] == "undefined" || var_5[1] == "default") {
  var_1._id_C8F0[var_5[0]] = undefined;
  continue;
  }

  switch (var_5[0]) {
  case "stop_sound":
  var_1._id_11041 = var_5[1];
  break;
  case "interrupt_sound":
  var_1._id_9A88 = var_5[1];
  break;
  case "loop_sound":
  var_1._id_B048 = var_5[1];
  break;
  case "open_interrupt":
  var_1._id_C607 = _id_11149(var_5[1]);
  break;
  case "start_sound":
  var_1._id_10D2A = var_5[1];
  break;
  case "unresolved_collision_nodes":
  var_1._id_12BEB = getnodearray(var_5[1], "targetname");
  break;
  case "no_moving_unresolved_collisions":
  var_1._id_C001 = _id_11149(var_5[1]);
  break;
  default:
  break;
  }
  }
}

_id_1277D(var_0) {
  var_1 = self;

  if (!isdefined(var_0))
  var_0 = "";

  var_2 = strtok(var_0, ";");

  foreach (var_4 in var_2) {
  var_5 = strtok(var_4, "=");

  if (var_5.size != 2)
  continue;

  if (var_5[1] == "undefined" || var_5[1] == "default") {
  var_1._id_C8F0[var_5[0]] = undefined;
  continue;
  }

  switch (var_5[0]) {
  case "not_opening":
  var_1._id_C0B2 = _id_11149(var_5[1]);
  break;
  case "not_closing":
  var_1._id_C0B1 = _id_11149(var_5[1]);
  break;
  case "prone_only":
  var_1._id_DA79 = _id_11149(var_5[1]);
  break;
  default:
  break;
  }
  }
}

_id_11149(var_0) {
  var_1 = undefined;

  switch (var_0) {
  case "true":
  case "1":
  var_1 = 1;
  break;
  case "false":
  case "0":
  var_1 = 0;
  break;
  default:
  break;
  }

  return var_1;
}
