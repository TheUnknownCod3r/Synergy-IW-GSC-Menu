/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2646.gsc
***************************************/

_id_90AC() {
  level endon("game_ended");
  level.ingraceperiod = 25;
  thread _id_B412("waiting_for_players", 20.0);
  _id_90AD();
  level.ingraceperiod = 10;
  thread _id_B412("match_resuming_in", 5.0);
  wait 5;
  level.ingraceperiod = 0;
}

_id_90AD() {
  level endon("hostmigration_enoughplayers");
  wait 15;
}

_id_90A7(var_0) {
  if (!isdefined(var_0))
  return "<removed_ent>";

  var_1 = -1;
  var_2 = "?";

  if (isdefined(var_0.entity_number))
  var_1 = var_0.entity_number;

  if (isplayer(var_0) && isdefined(var_0.name))
  var_2 = var_0.name;

  if (isplayer(var_0))
  return "player <" + var_2 + ">";

  if (isagent(var_0) && _id_0A77::_id_9E0E(var_0))
  return "participant agent <" + var_1 + ">";

  if (isagent(var_0))
  return "non-participant agent <" + var_1 + ">";

  return "unknown entity <" + var_1 + ">";
}

_id_90AB() {
  level endon("host_migration_begin");
  level endon("host_migration_end");

  while (!_id_0A77::isreallyalive(self))
  self waittill("spawned");

  self._id_90A6 = 1;
  _id_0A77::_id_7385(1);
  level waittill("host_migration_end");
}

_id_90AA() {
  self endon("disconnect");
  _id_90AB();

  if (self._id_90A6) {
  if (_id_0A77::_id_766C("prematch_done"))
  _id_0A77::_id_7385(0);

  self._id_90A6 = undefined;
  }
}

waittillhostmigrationdone() {
  if (!isdefined(level._id_90A9))
  return 0;

  var_0 = gettime();
  level waittill("host_migration_end");
  return gettime() - var_0;
}

_id_13835(var_0) {
  if (isdefined(level._id_90A9))
  return;

  level endon("host_migration_begin");
  wait(var_0);
}

waitlongdurationwithhostmigrationpause(var_0) {
  if (var_0 == 0)
  return;

  var_1 = gettime();
  var_2 = gettime() + var_0 * 1000;

  while (gettime() < var_2) {
  _id_13835((var_2 - gettime()) / 1000);

  if (isdefined(level._id_90A9)) {
  var_3 = waittillhostmigrationdone();
  var_2 = var_2 + var_3;
  }
  }

  waittillhostmigrationdone();
  return gettime() - var_1;
}

_id_137B8(var_0, var_1) {
  self endon(var_0);

  if (var_1 == 0)
  return;

  var_2 = gettime();
  var_3 = gettime() + var_1 * 1000;

  while (gettime() < var_3) {
  _id_13835((var_3 - gettime()) / 1000);

  if (isdefined(level._id_90A9)) {
  var_4 = waittillhostmigrationdone();
  var_3 = var_3 + var_4;
  }
  }

  waittillhostmigrationdone();
  return gettime() - var_2;
}

_id_13707(var_0) {
  if (var_0 == 0)
  return;

  var_1 = gettime();
  var_2 = gettime() + var_0 * 1000;

  while (gettime() < var_2) {
  _id_13835((var_2 - gettime()) / 1000);

  while (isdefined(level._id_90A9)) {
  var_2 = var_2 + 1000;
  setgameendtime(int(var_2));
  wait 1;
  }
  }

  while (isdefined(level._id_90A9)) {
  var_2 = var_2 + 1000;
  setgameendtime(int(var_2));
  wait 1;
  }

  return gettime() - var_1;
}

_id_B412(var_0, var_1) {
  self notify("matchStartTimer");
  self endon("matchStartTimer");
  level notify("match_start_timer_beginning");
  var_2 = int(var_1);

  if (var_2 >= 2) {
  setomnvar("ui_match_start_text", var_0);
  _id_B413(var_2);
  visionsetnaked("", 3.0);
  } else {
  _id_9B01();
  visionsetnaked("", 1.0);
  }
}

_id_B413(var_0) {
  waittillframeend;
  _id_9B01();
  level endon("match_start_timer_beginning");

  while (var_0 > 0 && !level._id_7669) {
  setomnvar("ui_match_start_countdown", var_0);

  if (var_0 == 0)
  visionsetnaked("", 0);

  var_0--;
  wait 1.0;
  }

  setomnvar("ui_match_start_countdown", 0);
}

_id_9B01() {
  if (!isdefined(level._id_9B01))
  level._id_9B01 = "mpIntro";

  visionsetnaked(level._id_9B01, 0);
}
