/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2713.gsc
***************************************/

init() {
  precacheshellshock("frag_grenade_mp");
  _id_DBDE();
  _id_DBE3();
  _id_1338C();
  _id_D0F6();
}

_id_DBDE() {
  _id_BF26("main", "player_view1_start", "player_view1_end");
  var_0 = _id_BF25("main", "Primary Weapon", "radial_weapons_primary", ::_id_157D);
  var_1 = _id_BF25("main", "Secondary Weapon", "radial_weapons_secondary", ::_id_157E);
  var_2 = _id_BF25("main", "Gears", "radial_gears", ::_id_1578);
  var_3 = _id_BF25("main", "Kill Streaks", "radial_killstreaks", ::_id_1579);
  var_4 = _id_BF25("main", "Leaderboards", "radial_leaderboards", ::_id_157A);
  _id_BF26("gears", "player_view2_start", "player_view2_end");
  _id_BF26("weapons_primary", "player_view3_start", "player_view3_end");
  _id_BF26("weapons_secondary", "player_view3_start", "player_view3_end");
  _id_BF26("killstreak", "player_view4_start", "player_view4_end");
  _id_BF26("leaderboards", "player_view5_start", "player_view5_end");
}

_id_DBE3() {
  foreach (var_1 in level._id_DBDF) {
  _id_10417(var_1);

  for (var_2 = 0; var_2 < var_1.size; var_2++) {
  if (isdefined(var_1[var_2 + 1])) {
  var_3 = _id_7FB4(var_1[var_2]._id_D69A, var_1[var_2 + 1]._id_D69A);
  var_1[var_2]._id_62A6 = var_3;
  var_1[var_2 + 1]._id_10BA0 = var_3;
  continue;
  }

  var_3 = _id_7FB4(var_1[var_2]._id_D69A, var_1[0]._id_D69A) + 180;

  if (var_3 > 360)
  var_3 = var_3 - 360;

  var_1[var_2]._id_62A6 = var_3;
  var_1[0]._id_10BA0 = var_3;
  }
  }

  thread _id_12F12();
  thread _id_13B36();
  thread _id_139A7();
  thread _id_4F2A();
}

_id_4F2A() {
  level endon("game_ended");
  level._id_4A6B = 1;

  for (;;) {
  if (!isdefined(level._id_C2C8)) {
  wait 0.05;
  continue;
  }

  var_0 = 1;

  while (!level._id_C2C8 buttonpressed("BUTTON_Y"))
  wait 0.05;

  level._id_C2C8 playsound("mouse_click");

  if (var_0) {
  level._id_4A6B = level._id_4A6B * -1;
  var_0 = 0;
  }

  while (level._id_C2C8 buttonpressed("BUTTON_Y"))
  wait 0.05;
  }
}

_id_D0F6() {
  level thread _id_C56E();
  level thread _id_E459();
}

_id_E459() {
  level waittill("game_ended");
  setdvar("cg_draw2d", 1);
}

_id_C56E() {
  level waittill("connected", var_0);
  var_0 thread _id_DD78();
  var_0 waittill("spawned_player");
  wait 1;
  var_0 takeallweapons();
  setdvar("cg_draw2d", 0);

  if (!isdefined(var_0))
  return;
  else
  level._id_C2C8 = var_0;

  var_0 thread _id_7C17();
  _id_13FC9("main");
}

_id_DD78() {
  self endon("disconnect");
  var_0 = "autoassign";

  while (!isdefined(self.pers["team"]))
  wait 0.05;

  self notify("menuresponse", game["menu_team"], var_0);
  wait 0.5;
  var_1 = getarraykeys(level._id_400C);
  var_2 = [];

  for (var_3 = 0; var_3 < var_1.size; var_3++) {
  if (!issubstr(var_1[var_3], "custom"))
  var_2[var_2.size] = var_1[var_3];
  }

  for (;;) {
  var_4 = var_2[0];
  self notify("menuresponse", "changeclass", var_4);
  self waittill("spawned_player");
  wait 0.1;
  }
}

_id_7C17() {
  level endon("game_ended");
  self endon("disconnect");

  for (;;) {
  var_0 = self _meth_814C();
  var_1 = vectortoangles(var_0);
  level._id_E77B = int(var_1[1]);
  wait 0.05;
  }
}

_id_BF26(var_0, var_1, var_2) {
  if (isdefined(level._id_DBDF) && level._id_DBDF.size) {}

  var_3 = getent(var_2, "targetname");
  var_4 = vectornormalize(anglestoforward(var_3.angles)) * 40;
  level._id_DBDF[var_0] = [];
  level.radial_button_group[var_0]["view_start"] = var_1;
  level.radial_button_group[var_0]["view_pos"] = var_3.origin + var_4;
  level.radial_button_group[var_0]["player_view_pos"] = var_3.origin;
  level.radial_button_group[var_0]["view_angles"] = var_3.angles;
}

_id_BF25(var_0, var_1, var_2, var_3) {
  var_4 = getent(var_2, "targetname");
  var_5 = _id_80A9(var_0, var_4);
  var_6 = spawnstruct();
  var_6._id_D699 = var_4.origin;
  var_6._id_01AD = var_1;
  var_6._id_724E = 1;
  var_6._id_724D = (0.5, 0.5, 1);
  var_6._id_D69A = var_5;
  var_6._id_1577 = var_3;
  var_6._id_DC07 = 8;
  level._id_DBDF[var_0][level._id_DBDF[var_0].size] = var_6;
  return var_6;
}

_id_12F12() {
  level endon("game_ended");

  for (;;) {
  if (!isdefined(level._id_DBDD)) {
  wait 0.05;
  continue;
  }

  var_0 = level._id_1622;

  foreach (var_2 in level._id_DBDF[level._id_DBDD]) {
  if (_id_9E4E(var_2._id_10BA0, var_2._id_62A6)) {
  level._id_1622 = var_2;
  continue;
  }

  var_2._id_724D = (0.5, 0.5, 1);
  }

  if (isdefined(level._id_1622)) {
  level._id_1622._id_724D = (1, 1, 0.5);

  if (isdefined(var_0) && var_0 != level._id_1622)
  level._id_C2C8 playsound("mouse_over");
  }

  wait 0.05;
  }
}

_id_13B36() {
  level endon("game_ended");

  for (;;) {
  if (!isdefined(level._id_C2C8)) {
  wait 0.05;
  continue;
  }

  var_0 = 1;

  while (!level._id_C2C8 buttonpressed("BUTTON_A"))
  wait 0.05;

  level._id_C2C8 playsound("mouse_click");

  if (isdefined(level._id_1622) && var_0) {
  level._id_1622 notify("select_button_pressed");
  [[level._id_1622._id_1577]]();
  var_0 = 0;
  }

  while (level._id_C2C8 buttonpressed("BUTTON_A"))
  wait 0.05;
  }
}

_id_139A7() {
  level endon("game_ended");

  for (;;) {
  if (!isdefined(level._id_C2C8)) {
  wait 0.05;
  continue;
  }

  var_0 = 1;

  while (!level._id_C2C8 buttonpressed("BUTTON_X"))
  wait 0.05;

  level._id_C2C8 playsound("mouse_click");

  if (var_0) {
  _id_1576();
  var_0 = 0;
  }

  while (level._id_C2C8 buttonpressed("BUTTON_X"))
  wait 0.05;
  }
}

_id_10417(var_0) {
  for (var_1 = 0; var_1 < var_0.size - 1; var_1++) {
  for (var_2 = 0; var_2 < var_0.size - 1 - var_1; var_2++) {
  if (var_0[var_2 + 1]._id_D69A < var_0[var_2]._id_D69A)
  _id_32EA(var_0[var_2], var_0[var_2 + 1]);
  }
  }
}

_id_32EA(var_0, var_1) {
  var_2 = var_0._id_D699;
  var_3 = var_0._id_01AD;
  var_4 = var_0._id_D69A;
  var_5 = var_0._id_1577;
  var_6 = var_0._id_DC07;
  var_0._id_D699 = var_1._id_D699;
  var_0._id_01AD = var_1._id_01AD;
  var_0._id_D69A = var_1._id_D69A;
  var_0._id_1577 = var_1._id_1577;
  var_0._id_DC07 = var_1._id_DC07;
  var_1._id_D699 = var_2;
  var_1._id_01AD = var_3;
  var_1._id_D69A = var_4;
  var_1._id_1577 = var_5;
  var_1._id_DC07 = var_6;
}

_id_5B5C(var_0) {
  foreach (var_2 in level._id_DBDF[var_0])
  var_2 thread _id_5B5B(var_0);
}

_id_5B5B(var_0) {
  level endon("game_ended");
  self endon("remove_button");
  var_1 = level.radial_button_group[var_0]["view_pos"];
  var_2 = var_1 + _id_DBDA(self._id_D69A, 4);

  for (;;) {
  var_3 = (1, 0, 0);

  if (_id_9E4E(self._id_10BA0, self._id_62A6))
  var_3 = (1, 1, 0);

  if (isdefined(level._id_4A6B) && level._id_4A6B > 0)
  var_4 = var_1 + _id_DBDA(level._id_E77B, 2);

  wait 0.05;
  }
}

_id_13FC9(var_0, var_1) {
  level._id_1622 = undefined;

  if (isdefined(level._id_DBDD) && level._id_DBDD != "")
  level._id_DBE1 = level._id_DBDD;
  else
  {
  level._id_DBE1 = "main";
  level._id_DBDD = "main";
  }

  foreach (var_3 in level._id_DBDF[level._id_DBE1])
  var_3 notify("remove_button");

  if (isdefined(var_1) && var_1)
  level._id_C2C8 _id_83FD(level.radial_button_group[level._id_DBE1]["view_start"], var_0);
  else
  level._id_C2C8 _id_83FC(level.radial_button_group[var_0]["view_start"]);

  level thread _id_5B5C(var_0);
  level._id_DBDD = var_0;
}

_id_80A9(var_0, var_1) {
  var_2 = level.radial_button_group[var_0]["view_angles"];
  var_3 = level.radial_button_group[var_0]["view_pos"];
  var_3 = var_3 + vectornormalize(anglestoforward(var_2)) * 40;
  var_4 = anglestoforward(var_2);
  var_5 = vectornormalize(anglestoup(var_2));
  var_6 = var_1.angles;
  var_7 = var_1.origin;
  var_8 = vectornormalize(vectorfromlinetopoint(var_3, var_3 + var_4, var_7));
  var_9 = acos(vectordot(var_8, var_5));

  if (vectordot(anglestoright(var_2), var_8) < 0)
  var_9 = 360 - var_9;

  return var_9;
}

_id_DBDA(var_0, var_1) {
  var_2 = (270 - var_0, 0, 0);
  var_3 = anglestoforward(var_2);
  var_4 = vectornormalize(var_3);
  var_5 = var_4 * var_1;
  return var_5;
}

_id_7FB4(var_0, var_1) {
  var_2 = (var_0 + var_1 + 720) / 2 - 360;
  return var_2;
}

_id_9E4E(var_0, var_1) {
  var_2 = level._id_E77B > var_0 && level._id_E77B < 360;
  var_3 = level._id_E77B > 0 && level._id_E77B < var_1;

  if (var_0 > var_1)
  var_4 = var_2 || var_3;
  else
  var_4 = level._id_E77B > var_0 && level._id_E77B < var_1;

  return var_4;
}

_id_1576() {
  if (isdefined(level._id_DBDD) && level._id_DBDD != "main")
  _id_13FC9("main", 1);
  else
  return;
}

_id_157D() {
  iprintlnbold("action_weapons_primary");
  _id_13FC9("weapons_primary");
}

_id_157E() {
  iprintlnbold("action_weapons_secondary");
  _id_13FC9("weapons_secondary");
}

_id_1578() {
  iprintlnbold("action_gears");
  _id_13FC9("gears");
}

_id_1579() {
  iprintlnbold("action_killstreak");
  _id_13FC9("killstreak");
}

_id_157A() {
  iprintlnbold("action_leaderboards");
  _id_13FC9("leaderboards");
}

_id_1338C() {
  level._id_1338D = [];
  _id_31AD("player_view1_start");
  _id_31AD("player_view2_start");
  _id_31AD("player_view3_start");
  _id_31AD("player_view4_start");
  _id_31AD("player_view5_start");
}

_id_31AD(var_0) {
  level._id_1338D[var_0] = [];
  var_1 = getent(var_0, "targetname");

  for (level._id_1338D[var_0][level._id_1338D[var_0].size] = var_1; isdefined(var_1) && isdefined(var_1._id_0334); var_1 = var_2) {
  var_2 = getent(var_1._id_0334, "targetname");
  level._id_1338D[var_0][level._id_1338D[var_0].size] = var_2;
  }
}

_id_83FC(var_0) {
  if (!isdefined(level._id_5F21)) {
  var_1 = level._id_1338D[var_0][0];
  level._id_5F21 = spawn("script_model", var_1.origin);
  level._id_5F21.angles = var_1.angles;
  self setorigin(level._id_5F21.origin - (0, 0, 65));
  self linkto(level._id_5F21);
  wait 0.05;
  self setplayerangles(level._id_5F21.angles);
  thread _id_7284();
  }

  var_2 = 1;
  var_3 = abs(distance(level._id_5F21.origin, level._id_1338D[var_0][level._id_1338D[var_0].size - 1].origin));
  var_2 = var_2 * (var_3 / 1200);
  var_2 = max(var_2, 0.1);
  var_4 = var_2;

  if (!1)
  var_4 = var_4 * (var_2 * (level._id_1338D[var_0].size + 1));

  thread _id_2BD8(3, var_4);

  foreach (var_7, var_6 in level._id_1338D[var_0]) {
  if (1) {
  if (var_7 != level._id_1338D[var_0].size - 1)
  continue;
  }

  level._id_5F21 moveto(var_6.origin, var_2, var_2 * 0.5, 0);
  level._id_5F21 rotateto(var_6.angles, var_2, var_2 * 0.5, 0);
  wait(var_2);
  }
}

_id_83FD(var_0, var_1) {
  var_2 = 1;
  var_3 = abs(distance(level._id_5F21.origin, level.radial_button_group[var_1]["player_view_pos"]));
  var_2 = var_2 * (var_3 / 1200);
  var_2 = max(var_2, 0.1);
  var_4 = var_2;

  if (!1)
  var_4 = var_4 * (var_2 * (level._id_1338D[var_0].size + 1));

  thread _id_2BD8(3, var_4);

  if (!1) {
  for (var_5 = level._id_1338D[var_0].size - 1; var_5 >= 0; var_5--) {
  var_6 = level._id_1338D[var_0][var_5];
  level._id_5F21 moveto(var_6.origin, var_2);
  level._id_5F21 rotateto(var_6.angles, var_2);
  wait(var_2);
  }
  }

  thread _id_2BD8(3, var_2);
  var_7 = level.radial_button_group[var_1]["player_view_pos"];
  var_8 = level.radial_button_group[var_1]["view_angles"];
  level._id_5F21 moveto(var_7, var_2, var_2 * 0.5, 0);
  level._id_5F21 rotateto(var_8, var_2, var_2 * 0.5, 0);
  wait(var_2);
}

_id_126C0(var_0) {
  self setblurforplayer(20, (var_0 + 0.2) / 2);
  self setblurforplayer(0, (var_0 + 0.2) / 2);
  self shellshock("frag_grenade_mp", var_0 + 0.2);
}

_id_2BD8(var_0, var_1) {
  var_2 = int(var_1 / 0.05);

  for (var_3 = 0; var_3 < var_2; var_3++) {
  var_4 = var_3 / var_2;
  var_5 = sin(180 * var_4);
  var_6 = var_0 * var_5;
  setdvar("r_blur", var_6);
  wait 0.05;
  }

  setdvar("r_blur", 0);
}

_id_7284() {
  level endon("game_ended");
  self endon("disconnect");
  level._id_5F21 endon("remove_dummy");

  for (;;) {
  self setplayerangles(level._id_5F21.angles);
  wait 0.05;
  }
}
