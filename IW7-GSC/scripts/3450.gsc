/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3450.gsc
***************************************/

_id_2DF2(var_0, var_1, var_2, var_3) {
  self endon("bot_sentry_exited");
  self endon("death");
  self endon("disconnect");
  level endon("game_ended");
  wait(randomintrange(3, 5));

  while (isdefined(self._id_F250) && gettime() < self._id_F250)
  wait 1;

  if (isdefined(self._id_010C) && self._id_010C.health > 0 && self botcanseeentity(self._id_010C))
  return 1;

  var_4 = self.origin;

  if (var_3 != "hide_nonlethal") {
  var_4 = _id_2E78(var_3);

  if (!isdefined(var_4))
  return 1;
  }

  _id_2E73(var_0, var_4, var_3, var_1);

  while (scripts\mp\bots\bots_strategy::_id_2DC5("sentry_placement"))
  wait 0.5;

  return 1;
}

_id_2E73(var_0, var_1, var_2, var_3) {
  var_4 = _id_2E77(var_0, var_1, var_2, var_3);

  if (isdefined(var_4)) {
  scripts\mp\bots\bots_strategy::_id_2D02("sentry_placement");
  var_5 = spawnstruct();
  var_5._id_C270 = var_4;
  var_5._id_EDCC = var_4._id_13E48;
  var_5._id_EDC9 = 10;
  var_5._id_10D46 = ::_id_2E7B;
  var_5._id_6302 = ::_id_2E74;
  var_5._id_FF0D = ::_id_2E7D;
  var_5._id_157C = ::_id_2E72;
  self._id_CC2D = var_0._id_110EA;
  scripts\mp\bots\bots_strategy::_id_2E27("sentry_placement", var_4._id_0205.origin, 0, var_5);
  }
}

_id_2E7D(var_0) {
  self endon("death");
  self endon("disconnect");
  level endon("game_ended");

  if (isdefined(self._id_010C) && self._id_010C.health > 0 && self botcanseeentity(self._id_010C))
  return 1;

  self._id_F250 = gettime() + 1000;
  return 0;
}

_id_2E75() {
  self endon("death");
  self endon("disconnect");
  self endon("bot_sentry_canceled");
  self endon("bot_sentry_ensure_exit");
  level endon("game_ended");

  for (;;) {
  if (isdefined(self._id_010C) && self._id_010C.health > 0 && self botcanseeentity(self._id_010C))
  thread _id_2E74();

  wait 0.05;
  }
}

_id_2E7B(var_0) {
  thread _id_2E7C(var_0);
}

_id_2E7C(var_0) {
  self endon("stop_tactical_goal");
  self endon("stop_goal_aborted_watch");
  self endon("bot_sentry_canceled");
  self endon("bot_sentry_exited");
  self endon("death");
  self endon("disconnect");
  level endon("game_ended");

  while (isdefined(var_0._id_C270) && isdefined(var_0._id_C270.weapon)) {
  if (distance2d(self.origin, var_0._id_C270._id_0205.origin) < 400) {
  thread scripts\mp\bots\bots_util::_id_2D9C("stand", 5.0);
  thread _id_2E75();
  scripts\mp\bots\bots_killstreaks::_id_2EA5(var_0._id_C270._id_A690, var_0._id_C270._id_A6AC, var_0._id_C270.weapon);
  return;
  }

  wait 0.05;
  }
}

_id_2E78(var_0) {
  var_1 = scripts\mp\bots\bots_util::_id_507A();

  if (isdefined(var_1))
  return var_1;

  if (isdefined(self.node_ambushing_from))
  return self.node_ambushing_from.origin;

  var_2 = getnodesinradius(self.origin, 1000, 0, 512);
  var_3 = 5;

  if (var_0 != "turret") {
  if (self botgetdifficultysetting("strategyLevel") == 1)
  var_3 = 10;
  else if (self botgetdifficultysetting("strategyLevel") == 0)
  var_3 = 15;
  }

  if (var_0 == "turret_air")
  var_4 = self botnodepick(var_2, var_3, "node_traffic", "ignore_no_sky");
  else
  var_4 = self botnodepick(var_2, var_3, "node_traffic");

  if (isdefined(var_4))
  return var_4.origin;
}

_id_2E77(var_0, var_1, var_2, var_3) {
  var_4 = undefined;
  var_5 = getnodesinradius(var_1, 1000, 0, 512);
  var_6 = 5;

  if (var_2 != "turret") {
  if (self botgetdifficultysetting("strategyLevel") == 1)
  var_6 = 10;
  else if (self botgetdifficultysetting("strategyLevel") == 0)
  var_6 = 15;
  }

  if (var_2 == "turret_air")
  var_7 = self botnodepick(var_5, var_6, "node_sentry", var_1, "ignore_no_sky");
  else if (var_2 == "trap")
  var_7 = self botnodepick(var_5, var_6, "node_traffic");
  else if (var_2 == "hide_nonlethal")
  var_7 = self botnodepick(var_5, var_6, "node_hide");
  else
  var_7 = self botnodepick(var_5, var_6, "node_sentry", var_1);

  if (isdefined(var_7)) {
  var_4 = spawnstruct();
  var_4._id_0205 = var_7;

  if (var_1 != var_7.origin && var_2 != "hide_nonlethal")
  var_4._id_13E48 = vectortoyaw(var_1 - var_7.origin);
  else
  var_4._id_13E48 = undefined;

  var_4.weapon = var_0.weapon;
  var_4._id_A690 = var_0;
  var_4._id_A6AC = var_3;
  }

  return var_4;
}

_id_2E76() {
  if (isdefined(self._id_3AA5))
  return self._id_3AA5;

  if (isdefined(self._id_3A9F))
  return self._id_3A9F;

  if (isdefined(self._id_3AA0))
  return self._id_3AA0;
}

_id_2E72(var_0) {
  var_1 = 0;
  var_2 = _id_2E76();

  if (isdefined(var_2)) {
  var_3 = 0;

  if (!var_2._id_3872) {
  var_4 = 0.75;
  var_5 = gettime();
  var_6 = self.angles[1];

  if (isdefined(var_0._id_C270._id_13E48))
  var_6 = var_0._id_C270._id_13E48;

  var_7 = [];
  var_7[0] = var_6 + 180;
  var_7[1] = var_6 + 135;
  var_7[2] = var_6 - 135;
  var_8 = 1000;

  foreach (var_10 in var_7) {
  var_11 = playerphysicstrace(var_0._id_C270._id_0205.origin, var_0._id_C270._id_0205.origin + anglestoforward((0, var_10 + 180, 0)) * 100);
  var_12 = distance2d(var_11, var_0._id_C270._id_0205.origin);

  if (var_12 < var_8) {
  var_8 = var_12;
  self botsetscriptmove(var_10, var_4);
  self botlookatpoint(var_0._id_C270._id_0205.origin, var_4, "script_forced");
  }
  }

  while (!var_3 && isdefined(var_2) && !var_2._id_3872) {
  var_14 = float(gettime() - var_5) / 1000.0;

  if (!var_2._id_3872 && var_14 > var_4) {
  var_3 = 1;
  self._id_F250 = gettime() + 30000;
  }

  wait 0.05;
  }
  }

  if (isdefined(var_2) && var_2._id_3872) {
  _id_2E71();
  var_1 = 1;
  }
  }

  wait 0.25;
  _id_2E79();
  return var_1;
}

_id_2E71() {
  self notify("place_sentry");
  self notify("place_ims");
  self notify("placePlaceable");
}

_id_2E70() {
  self _meth_83B5("none");
  self enableweapons();
  self enableweaponswitch();
  self notify("cancel_sentry");
  self notify("cancel_ims");
  self notify("cancelPlaceable");
}

_id_2E74(var_0) {
  self notify("bot_sentry_canceled");
  _id_2E70();
  _id_2E79();
}

_id_2E79() {
  self notify("bot_sentry_abort_goal_think");
  self notify("bot_sentry_ensure_exit");
  self endon("bot_sentry_ensure_exit");
  self endon("death");
  self endon("disconnect");
  level endon("game_ended");
  self _meth_83B5("none");
  self botclearscriptgoal();
  self botsetstance("none");
  self enableweapons();
  self enableweaponswitch();
  wait 0.25;
  var_0 = 0;

  while (isdefined(_id_2E76())) {
  var_0++;
  _id_2E70();
  wait 0.25;

  if (var_0 > 2)
  _id_2E7A();
  }

  self notify("bot_sentry_exited");
}

_id_2E7A() {
  if (isdefined(self._id_3AA5))
  self._id_3AA5 scripts\mp\killstreaks\autosentry::_id_F253();

  if (isdefined(self._id_3A9F))
  self._id_3A9F scripts\mp\killstreaks\ims::_id_9376();

  if (isdefined(self._id_3AA0))
  self._id_3AA0 scripts\mp\killstreaks\placeable::_id_C4D2(self._id_CC2D, 0);

  self._id_3AA5 = undefined;
  self._id_3A9F = undefined;
  self._id_3AA0 = undefined;
  self _meth_83B5("none");
  self enableweapons();
  self enableweaponswitch();
}
