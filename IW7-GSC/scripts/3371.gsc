/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3371.gsc
***************************************/

_id_12E11(var_0) {
  if (var_0._id_1189F > 0)
  level thread _id_D2FE(var_0);
}

_id_D2FE(var_0) {
  var_0 notify("ticket_queue");
  var_0 endon("ticket_queue");
  var_0 endon("disconnect");

  if (gettime() > var_0._id_118DE) {
  var_1 = var_0._id_1189F;

  if (var_1 > 10)
  var_1 = 10;

  var_0._id_118DE = gettime() + var_1 / 1.5 * 1000 + 500;
  var_2 = var_0._id_1189F;
  var_0._id_1189F = 0;
  _id_8317(var_0, var_2);
  } else {
  while (gettime() < var_0._id_118DE && var_0._id_1189F > 0)
  wait 0.1;

  if (var_0._id_1189F > 0) {
  var_1 = var_0._id_1189F;

  if (var_1 > 10)
  var_1 = 10;

  var_0._id_118DE = gettime() + var_1 / 1.5 * 1000 + 500;
  var_2 = var_0._id_1189F;
  var_0._id_1189F = 0;
  _id_8317(var_0, var_2);
  }
  }
}

_id_8317(var_0, var_1, var_2, var_3) {
  if (isdefined(level.no_ticket_machine))
  return;

  if (scripts\engine\utility::_id_9CEE(var_0._id_5AD6))
  var_1 = var_1 * 2;

  if (!isdefined(var_0._id_C206))
  var_0._id_C206 = 0;

  if (var_1 < 0)
  var_1 = max(var_0._id_C206 * -1, var_1);

  var_0._id_C206 = var_0._id_C206 + var_1;

  if (var_0._id_C206 < 0)
  var_0._id_C206 = 0;

  var_1 = int(var_1);

  if (var_1 == 0)
  return;

  if (var_1 > 0 && !scripts\engine\utility::_id_9CEE(var_3))
  var_0 playlocalsound("zmb_ui_earn_tickets");

  var_0 setclientomnvar("zombie_number_of_ticket", int(var_0._id_C206));

  if (!scripts\engine\utility::_id_9CEE(var_3))
  var_0 thread _id_10101(var_1);

  var_0 _id_0A63::_id_666A("tickettotal", int(var_0._id_C206), 1);
  _id_0D5A::_id_12E3B(var_0, var_1);
}

_id_2110(var_0, var_1) {
  if (var_0._id_E1B9 && !var_0._id_D776)
  return &"COOP_INTERACTIONS_REQUIRES_POWER";

  if (scripts\engine\utility::_id_9CEE(var_0._id_C74D))
  return &"CP_ZMB_INTERACTIONS_MACHINE_OUT_OF_ORDER";

  return level._id_9A12[var_0.script_noteworthy];
}

_id_10101(var_0) {
  self endon("disconnect");

  if (var_0 < 0)
  return;

  self setclientomnvar("zm_tickets_dispersed", var_0);

  if (var_0 > 10)
  var_0 = 10;

  wait 2.5;
  self setclientomnvar("zm_tickets_dispersed", -1);
}

_id_2111(var_0, var_1, var_2, var_3) {
  var_0 endon("arcade_game_over_for_player");
  var_4 = var_0 scripts\engine\utility::_id_13735("disconnect", "last_stand", "spawned");

  if (var_4 == "disconnect")
  var_1._id_163D = undefined;
  else
  {
  [[var_3]](var_1, var_0);
  var_0 _meth_83B8(var_2);
  var_0 scripts\engine\utility::_id_1C76(1);

  if (!var_0 scripts\engine\utility::_id_9FBE())
  var_0 scripts\engine\utility::_id_1C6E(1);
  }

  _id_0A59::_id_175C(var_1);
  var_0 notify("arcade_game_over_for_player");
}

_id_2112(var_0, var_1, var_2, var_3, var_4, var_5, var_6) {
  var_0 endon("arcade_game_over_for_player");
  var_0 endon("stop_too_far_check");
  var_0 endon("last_stand");
  var_0 endon("disconnect");
  var_0 endon("spawned");
  var_7 = 10000;

  if (isdefined(var_5))
  var_7 = var_5;

  for (;;) {
  wait 0.1;

  if (distancesquared(var_0.origin, var_1.origin) > var_7 || var_0 getstance() == "prone") {
  var_0 playlocalsound("purchase_deny");
  wait 0.5;

  if (distancesquared(self.origin, var_1.origin) > var_7 || var_0 getstance() == "prone") {
  if (isdefined(var_1._id_28BB)) {
  if (isdefined(var_4))
  var_1._id_28BB scripts\engine\utility::_id_50E1(1.0, ::playsound, var_4);

  var_1._id_28BB scripts\engine\utility::_id_50E1(1.0, ::stoploopsound);
  }

  if (isdefined(var_2))
  var_0 _meth_83B8(var_2);

  [[var_3]](var_1, var_0);
  var_1._id_163D = undefined;
  _id_0A59::_id_175C(var_1);
  var_0 scripts\engine\utility::_id_1C76(1);

  if (!var_0 scripts\engine\utility::_id_9FBE())
  var_0 scripts\engine\utility::_id_1C6E(1);

  var_0 _id_82F5(var_0);
  var_0 _id_E2CB();

  if (var_0._id_210E == "tickets") {
  if (isdefined(var_1._id_2994) && var_1._id_2994 >= 1) {
  var_8 = var_1._id_2994 * 15;
  var_0 _id_8317(var_0, var_1._id_2994 * 15);

  if (var_1._id_2994 * 15 > var_1._id_2993) {
  playloopsound(var_1._id_BDDB.origin, "basketball_anc_highscore");
  setomnvar("zombie_bball_game_" + var_6 + "_hiscore", var_1._id_2994 * 15);
  var_1._id_2993 = var_1._id_2994 * 15;
  }
  }

  if (isdefined(var_1._id_10227) && var_1._id_10227 >= 1) {
  var_8 = var_1._id_10227 * 1;
  var_0 _id_8317(var_0, var_8);
  }

  if (isdefined(var_1._id_10227) && var_1._id_10227 >= 1) {
  var_8 = var_1._id_10227 * 1;
  var_0 _id_8317(var_0, var_8);
  }
  }

  var_0 notify("too_far_from_game");
  var_0 notify("arcade_game_over_for_player");
  }
  }
  }
}

_id_12962(var_0, var_1) {
  if (!isdefined(var_0))
  var_0 = 4;

  if (!isdefined(var_1))
  var_1 = 7;

  for (;;) {
  var_2 = 1;
  self._id_C74D = 0;
  var_3 = 0;
  var_4 = randomintrange(var_0, var_1 + 1);

  while (var_2) {
  self waittill("machine_used");
  var_3++;

  if (var_3 >= var_4) {
  self._id_C74D = 1;
  var_2 = 0;
  level scripts\engine\utility::waittill_any("regular_wave_starting", "event_wave_starting");
  }

  foreach (var_6 in level.players) {
  if (isdefined(var_6._id_A8D3) && var_6._id_A8D3 == self)
  var_6 thread _id_0A59::_id_DE6E();
  }
  }
  }
}

_id_EB76(var_0) {
  if (scripts\engine\utility::_id_9CEE(var_0._id_9387))
  return;

  var_1 = var_0 getcurrentweapon();
  var_2 = 0;

  if (var_1 == "none")
  var_2 = 1;
  else if (scripts\engine\utility::array_contains(level._id_17D7, var_1))
  var_2 = 1;
  else if (scripts\engine\utility::array_contains(level._id_17D7, getweaponbasename(var_1)))
  var_2 = 1;
  else if (_id_0A77::_id_9C42(var_1, 1))
  var_2 = 1;

  if (var_2) {
  var_0._id_4643 = var_0 _meth_8173();
  var_1 = var_0 _id_0A5B::_id_3E88(level._id_17D7, 1, 1);
  }

  var_0._id_4643 = undefined;

  if (isdefined(var_1))
  return var_1;
  else
  return var_0 getcurrentweapon();
}

_id_82F5(var_0) {
  if (_id_0A5B::_id_D0EF(var_0))
  return;

  if (isdefined(var_0._id_D7AB)) {
  if (var_0 hasweapon(var_0._id_D7AB))
  var_0 _meth_83B5(var_0._id_D7AB);
  } else {
  var_1 = var_0 getweaponslistprimaries();

  if (isdefined(var_1[1]))
  var_0 _meth_83B5(var_1[1]);
  }

  var_0._id_D7AC = undefined;
  var_0._id_D7AD = undefined;
  var_0._id_D7AB = undefined;
}

_id_11447() {
  if (_id_0A5B::_id_D0EF(self))
  return;

  var_0 = _id_0D15::_id_13CFC("primary");
  var_1 = _id_0D15::_id_13CFC("secondary");
  self._id_D7AE = var_0;
  self._id_D7B0 = var_1;

  if (isdefined(var_0)) {
  self._id_D7AF = self._id_D782[self._id_D7AE]._id_3D23;
  _id_0D15::_id_E15E(var_0);
  }

  if (isdefined(var_1)) {
  self._id_D7B1 = self._id_D782[self._id_D7B0]._id_3D23;
  _id_0D15::_id_E15E(var_1);
  }
}

take_player_super_pre_game() {
  if (_id_0A5B::_id_D0EF(self))
  return;

  self _meth_84C3();
  self _meth_83B8("super_default_zm");
}

_id_E2CB() {
  _id_0A77::_id_E2D4();

  if (_id_0A5B::_id_D0EF(self))
  return;

  if (isdefined(self._id_D7AE)) {
  var_0 = level._id_D782[self._id_D7AE]._id_504B;
  _id_0D15::_id_4171(var_0);
  _id_0D15::_id_8397(self._id_D7AE, var_0, undefined, undefined, undefined, undefined, 1);
  _id_0D15::_id_D71A(self._id_D7AF, var_0, 1);
  }

  if (isdefined(self._id_D7B0)) {
  var_0 = level._id_D782[self._id_D7B0]._id_504B;
  _id_0D15::_id_4171(var_0);
  _id_0D15::_id_8397(self._id_D7B0, var_0, undefined, undefined, undefined, undefined, 0);
  _id_0D15::_id_D71A(self._id_D7B1, var_0, 1);
  }

  self._id_D7AE = undefined;
  self._id_D7AF = undefined;
  self._id_D7B0 = undefined;
  self._id_D7B1 = undefined;
}

_id_F2C7(var_0) {
  if (scripts\engine\utility::_id_9CEE(var_0._id_9387))
  var_0._id_210E = "soul_power";
  else
  var_0._id_210E = "tickets";
}

update_song_playing(var_0, var_1) {
  var_0.song_playing = 1;
  var_2 = lookupsoundlength(var_1);
  wait(var_2 / 1000);
  var_0.song_playing = 0;
}
