/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2647.gsc
***************************************/

init() {
  level thread _id_C56E();
}

_id_C56E() {
  for (;;) {
  level waittill("connected", var_0);
  var_0 thread _id_901D();
  var_0 thread _id_B0E1();
  var_0 thread _id_10A40();
  }
}

_id_10134(var_0, var_1, var_2) {
  if (!isplayer(self))
  return;

  var_3 = spawnstruct();

  if (isdefined(var_2))
  var_0 = var_0 + ("_" + var_2);

  showsplash(var_0, var_1);
}

_id_10117(var_0, var_1) {
  var_2 = undefined;

  if (isdefined(var_1))
  var_2 = var_1;
  else
  var_2 = _id_0A58::_id_BD6F(var_0) - 1;

  var_3 = level._id_B684[var_0]["displayParam"];

  if (!isdefined(var_3)) {
  var_3 = _id_0A58::_id_BD70(var_0, var_2);

  if (var_3 == 0)
  var_3 = 1;

  var_4 = level._id_B684[var_0]["paramScale"];

  if (isdefined(var_4))
  var_3 = int(var_3 / var_4);
  }

  thread showsplash(var_0, var_3);
}

showsplash(var_0, var_1, var_2) {
  if (isdefined(self._id_DDCD) && self._id_DDCD >= 6) {
  _id_DB99(var_0, var_1, var_2);
  return;
  }

  _id_10152(var_0, var_1, var_2);
}

_id_10152(var_0, var_1, var_2) {
  if (!isplayer(self))
  return;

  var_3 = tablelookuprownum(_id_814B(), 0, var_0);

  if (!isdefined(var_3) || var_3 < 0)
  return;

  if (!isdefined(self._id_BFAE))
  self._id_BFAE = 0;

  if (!isdefined(self._id_10A37))
  self._id_10A37 = 1;

  var_4 = var_3;

  if (self._id_10A37)
  var_4 = var_4 | 1024;

  if (isdefined(var_1))
  self setclientomnvar("ui_player_splash_param_" + self._id_BFAE, var_1);
  else
  self setclientomnvar("ui_player_splash_param_" + self._id_BFAE, -1);

  if (isdefined(var_2))
  self setclientomnvar("ui_player_splash_cardClientId_" + self._id_BFAE, var_2 getentitynumber());
  else
  self setclientomnvar("ui_player_splash_cardClientId_" + self._id_BFAE, -1);

  self setclientomnvar("ui_player_splash_id_" + self._id_BFAE, var_4);

  if (!isdefined(self._id_DDCD))
  self._id_DDCD = 1;
  else
  self._id_DDCD++;

  thread _id_4103();
  self._id_BFAE++;

  if (self._id_BFAE >= 6) {
  self._id_BFAE = 0;
  self._id_10A37 = !self._id_10A37;
  }
}

_id_DB99(var_0, var_1, var_2) {
  var_3 = spawnstruct();
  var_3._id_DE3F = var_0;
  var_3._id_C6BB = var_1;
  var_3._id_D390 = var_2;

  if (!isdefined(self._id_10A3E)) {
  self._id_10A3E = var_3;
  self._id_10A3F = var_3;
  thread _id_89E9();
  } else {
  var_4 = self._id_10A3F;
  var_4._id_BFAD = var_3;
  self._id_10A3F = var_3;
  }
}

_id_89E9() {
  level endon("game_ended");
  self endon("death");
  self endon("disconnect");

  while (isdefined(self._id_10A3E)) {
  self waittill("splash_list_cleared");

  for (var_0 = 0; var_0 < 6; var_0++) {
  var_1 = self._id_10A3E;
  _id_10152(var_1._id_DE3F, var_1._id_C6BB, var_1._id_D390);
  self._id_10A3E = var_1._id_BFAD;

  if (!isdefined(self._id_10A3E))
  break;
  }
  }

  self._id_10A3F = undefined;
}

_id_B0E1() {
  self endon("disconnect");
  self._id_B0E0 = [];
  var_0 = "default";

  if (isdefined(level._id_B0DF))
  var_0 = level._id_B0DF;

  var_1 = level._id_B0E5;
  var_2 = level._id_B0E4;
  var_3 = 1.25;

  if (level._id_10A56 || self issplitscreenplayer() && !isai(self)) {
  var_1 = var_1 - 40;
  var_2 = level._id_B0E4 * 1.3;
  var_3 = var_3 * 1.5;
  }

  self._id_B0DE = _id_0A77::_id_49B2(var_0, var_2);
  self._id_B0DE _meth_834D("");
  self._id_B0DE._id_0049 = 0;
  self._id_B0DE._id_02A4 = 10;
  self._id_B0DE._id_0295 = 0;
  self._id_B0DE _id_0A77::_id_F801("CENTER", level._id_B0E6, 0, var_1);
  self._id_B0E7 = _id_0A77::_id_49B2("default", var_3);
  self._id_B0E7 _id_0A77::_id_F7D6(self._id_B0DE);
  self._id_B0E7 _id_0A77::_id_F801("TOP", "BOTTOM", 0, 0);
  self._id_B0E7 _meth_834D("");
  self._id_B0E7._id_0049 = 0;
  self._id_B0E7._id_02A4 = 10;
  self._id_B0E7._id_0295 = 0;
}

_id_9DC6() {
  return 0;
}

_id_814B() {
  return "cp/zombies/zombie_splashtable.csv";
}

_id_4103() {
  self endon("disconnect");
  self notify("cleanupLocalPlayerSplashList()");
  self endon("cleanupLocalPlayerSplashList()");
  scripts\engine\utility::_id_137B7("death", 0.5);
  self._id_DDCD = undefined;
  self notify("splash_list_cleared");
}

_id_10A40() {
  self endon("disconnect");

  for (;;) {
  self waittill("luinotifyserver", var_0, var_1);

  if (var_0 != "splash_shown")
  continue;

  var_2 = tablelookupbyrow(_id_814B(), var_1, 0);
  var_3 = tablelookupbyrow(_id_814B(), var_1, 5);

  switch (var_3) {
  case "killstreak_splash":
  break;
  }
  }
}

_id_C549(var_0) {}

_id_10122(var_0, var_1) {
  var_2 = tablelookuprownum("mp/errorMessages.csv", 0, var_0);

  if (isdefined(var_1))
  self setclientomnvar("ui_mp_error_message_param", var_1);
  else
  self setclientomnvar("ui_mp_error_message_param", -1);

  self setclientomnvar("ui_mp_error_message_id", var_2);

  if (!isdefined(self._id_66BF))
  self._id_66BF = 0;

  self._id_66BF = !self._id_66BF;
  self setclientomnvar("ui_mp_error_trigger", scripts\engine\utility::ter_op(self._id_66BF, 2, 1));
}

_id_10123(var_0, var_1) {
  foreach (var_3 in level.players)
  _id_10122(var_0, var_1);
}

_id_1013D(var_0) {
  var_1 = tablelookuprownum("mp/miscMessages.csv", 0, var_0);
  var_2 = tablelookupbyrow("mp/miscMessages.csv", var_1, 3);

  if (isdefined(var_2) && var_2 != "")
  self playlocalsound(var_2);

  self setclientomnvar("ui_misc_message_id", var_1);

  if (!isdefined(self._id_B7D7))
  self._id_B7D7 = 0;

  self._id_B7D7 = !self._id_B7D7;
  self setclientomnvar("ui_misc_message_trigger", scripts\engine\utility::ter_op(self._id_B7D7, 1, 0));
}

_id_901D() {
  self endon("disconnect");

  for (;;) {
  self waittill("death");

  if (isdefined(self._id_901C))
  self._id_901C _id_0A77::_id_52DC();
  }
}

_id_978F() {
  self setrankedplayerdata("cp", "zombiePlayerLoadout", "tutorialOff", 1);
  self._id_8EB0 = 1;
  thread check_for_more_players();
}

check_for_more_players() {
  level waittill("multiple_players");
  self._id_8EB0 = 0;

  if (!isdefined(level.tutorial_interaction_1) || !isdefined(level.tutorial_interaction_2))
  return;

  _id_0A59::_id_E019(level.tutorial_interaction_1);
  _id_0A59::_id_E019(level.tutorial_interaction_2);
}

tutorial_interaction() {
  level endon("game_ended");
  self endon("disconnect");
  self endon("death");
  self waittill("luinotifyserver", var_0);

  if (var_0 == "tutorial_off") {
  self setrankedplayerdata("cp", "zombiePlayerLoadout", "tutorialOff", 1);
  self._id_8EB0 = 1;
  }

  if (var_0 == "tutorial_on") {
  self setrankedplayerdata("cp", "zombiePlayerLoadout", "tutorialOff", 0);
  self._id_8EB0 = 0;
  }
}

_id_12AAE(var_0) {
  if (!(_id_0A77::_id_9F02() || level._id_C552))
  return;

  var_1 = level.players[0];

  if (var_1._id_8EB0 == 1)
  return;

  if (!isdefined(level._id_12AB0))
  return;

  if (!_id_1007B(var_0))
  return;

  if (var_1 _id_79FC(var_0))
  return;

  if (var_0 != "null" && !scripts\engine\utility::_id_9CEE(level._id_12AA3)) {
  level._id_12AA3 = 1;
  var_2 = int(tablelookup(level._id_12AB0, 1, var_0, 0));
  var_1 setclientomnvar("zm_tutorial_num", var_2);
  var_1 _id_F3F9(var_0, 1);
  level._id_12AA3 = undefined;
  }
}

_id_F3F9(var_0, var_1) {
  self setrankedplayerdata("cp", "tutorial", var_0, "saw_message", var_1);
}

_id_F3F8(var_0, var_1) {
  self setrankedplayerdata("cp", "tutorialPerm", var_0, "saw_message", var_1);
}

_id_79FC(var_0) {
  var_1 = self getrankedplayerdata("cp", "tutorial", var_0, "saw_message");
  return var_1;
}

_id_1363B() {
  level endon("game_ended");
  self endon("disconnect");
  self waittill("luinotifyserver", var_0);

  if (var_0 == "tutorial_unpause")
  setslowmotion(1.0, 1.0, 0);
}

_id_1007B(var_0) {
  if (isdefined(level._id_FF8C))
  return [[level._id_FF8C]](var_0);
  else
  return 1;
}

wait_and_play_tutorial_message(var_0, var_1) {
  level endon("game_ended");
  self endon("disconnect");
  self endon("death");
  self notify("clear_message");
  self endon("clear_message");
  wait(var_1);
  _id_12AAE(var_0);
}
