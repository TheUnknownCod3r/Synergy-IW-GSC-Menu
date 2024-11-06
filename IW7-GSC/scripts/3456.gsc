/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3456.gsc
***************************************/

init() {
  precacheitem("aamissile_projectile_mp");
  precacheshader("ac130_overlay_grain");
  level._id_1502 = 14000;
  level._id_1500 = 30000;
  level._id_1501 = 1500;
  level._id_E5DE = [];
  scripts\mp\killstreaks\killstreaks::registerkillstreak("aamissile", ::_id_128D0);
}

_id_128D0(var_0, var_1) {
  scripts\mp\utility\game::_id_FB09("aamissile");
  var_2 = scripts\mp\killstreaks\killstreaks::_id_98C2();

  if (var_2 != "success") {
  if (var_2 != "disconnect")
  scripts\mp\utility\game::_id_41E9();

  return 0;
  }

  level thread _id_14EE(var_0, self);
  return 1;
}

_id_819E() {
  var_0 = [];
  var_1 = [];

  if (isdefined(level._id_AD8B) && level._id_AD8B.size) {
  foreach (var_3 in level._id_AD8B) {
  if (var_3.team != self.team)
  var_0[var_0.size] = var_3;
  }
  }

  if (isdefined(level._id_8DD3) && level._id_8DD3.size) {
  foreach (var_6 in level._id_8DD3) {
  if (var_6.team != self.team)
  var_1[var_1.size] = var_6;
  }
  }

  if (isdefined(var_1) && var_1.size)
  return var_1[0];
  else if (isdefined(var_0) && var_0.size)
  return var_0[0];
}

_id_14EE(var_0, var_1) {
  var_2 = undefined;
  var_3 = (0, 0, level._id_1502);
  var_4 = level._id_1500;
  var_5 = level._id_1503;
  var_6 = var_1 _id_819E();

  if (!isdefined(var_6))
  var_7 = (0, 0, 0);
  else
  {
  var_7 = var_6.origin;
  var_3 = (0, 0, 1) * var_7 + (0, 0, 1000);
  }

  var_8 = anglestoforward(var_1.angles);
  var_9 = var_1.origin + var_3 + var_8 * var_4 * -1;
  var_10 = scripts\mp\utility\game::_id_1309("aamissile_projectile_mp", var_9, var_7, var_1);

  if (!isdefined(var_10)) {
  var_1 scripts\mp\utility\game::_id_41E9();
  return;
  }

  var_10._id_AC68 = var_0;
  var_10.type = "remote";
  _id_B889(var_1, var_10);
}

_id_B889(var_0, var_1) {
  var_0 endon("joined_team");
  var_0 endon("joined_spectators");
  var_1 thread _id_E5C5();
  var_0 thread _id_CFC7(var_1);
  var_0 thread _id_CFC8(var_1);
  var_0 _meth_83F9("black_bw", 0);
  var_0 endon("disconnect");

  if (isdefined(var_1)) {
  var_0 _meth_83F9(game["thermal_vision"], 1.0);
  var_0 thread _id_50FF();
  var_0 cameralinkto(var_1, "tag_origin");
  var_0 _meth_808D(var_1);

  if (getdvarint("camera_thirdPerson"))
  var_0 scripts\mp\utility\game::_id_F887(0);

  var_1 waittill("death");

  if (isdefined(var_1))
  var_0 scripts\mp\matchdata::_id_AFC9("predator_missile", var_1.origin);

  var_0 _meth_808E();
  var_0 scripts\mp\utility\game::_id_7385(1);

  if (!level._id_7669)
  var_0 thread _id_10E48(0.5);

  wait 0.5;
  var_0 thermalvisionfofoverlayoff();
  var_0 cameraunlink();

  if (getdvarint("camera_thirdPerson"))
  var_0 scripts\mp\utility\game::_id_F887(1);
  }

  var_0 scripts\mp\utility\game::_id_41E9();
}

_id_50FF() {
  self endon("death");
  self endon("disconnect");
  level endon("game_ended");
  wait 0.15;
  self _meth_83BE();
}

_id_10E48(var_0) {
  self endon("disconnect");
  var_1 = newclienthudelem(self);
  var_1._id_017D = "fullscreen";
  var_1._id_0382 = "fullscreen";
  var_1 setshader("white", 640, 480);
  var_1._id_2129 = 1;
  var_1._id_02A4 = 10;
  var_2 = newclienthudelem(self);
  var_2._id_017D = "fullscreen";
  var_2._id_0382 = "fullscreen";
  var_2 setshader("ac130_overlay_grain", 640, 480);
  var_2._id_2129 = 1;
  var_2._id_02A4 = 20;
  wait(var_0);
  var_2 destroy();
  var_1 destroy();
}

_id_CFC8(var_0) {
  var_0 endon("death");
  self endon("disconnect");
  scripts\engine\utility::waittill_any("joined_team", "joined_spectators");

  if (self.team != "spectator") {
  self thermalvisionfofoverlayoff();
  self _meth_808E();
  self cameraunlink();

  if (getdvarint("camera_thirdPerson"))
  scripts\mp\utility\game::_id_F887(1);
  }

  scripts\mp\utility\game::_id_41E9();
  level._id_DF80 = undefined;
}

_id_E5C5() {
  var_0 = self getentitynumber();
  level._id_E5DE[var_0] = self;
  self waittill("death");
  level._id_E5DE[var_0] = undefined;
}

_id_CFC7(var_0) {
  var_0 endon("death");
  self endon("death");
  level waittill("game_ended");
  self thermalvisionfofoverlayoff();
  self _meth_808E();
  self cameraunlink();

  if (getdvarint("camera_thirdPerson"))
  scripts\mp\utility\game::_id_F887(1);
}
