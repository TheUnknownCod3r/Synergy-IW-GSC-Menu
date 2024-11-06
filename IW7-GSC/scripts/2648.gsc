/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2648.gsc
***************************************/

_id_BD6E(var_0) {
  return self getrankedplayerdata("cp", "meritProgress", var_0);
}

_id_BD6F(var_0) {
  return self getrankedplayerdata("cp", "meritState", var_0);
}

_id_BD75(var_0, var_1) {
  if (var_0 == "mt_highest_round") {
  var_2 = _id_BD6F("mt_highest_round");
  var_3 = _id_BD70("mt_highest_round", var_2);

  if (level._id_13BD3 >= var_3)
  return self setrankedplayerdata("cp", "meritProgress", var_0, var_3);
  }
  else
  return self setrankedplayerdata("cp", "meritProgress", var_0, var_1);
}

_id_BD76(var_0, var_1) {
  return self setrankedplayerdata("cp", "meritState", var_0, var_1);
}

_id_BD70(var_0, var_1) {
  return int(tablelookup("cp/allMeritsTable.csv", 0, var_0, 10 + var_1 * 3));
}

_id_D4F6(var_0, var_1, var_2) {
  if (_id_0A77::isusingremote() && scripts\engine\utility::_id_9CEE(self._id_13170))
  return;

  var_3 = _id_7919(var_2);

  if (_id_9CD1(var_1))
  _id_CE3E(var_3);
  else if (_id_9CD0(var_1))
  _id_CE3E("center");
  else if (_id_9BCA(var_0))
  playfxontagforclients(level._effect["vfx_melee_blood_spray"], self, "tag_eye", self);
  else
  _id_CCA5(var_3);
}

_id_7919(var_0) {
  var_1 = 0.965;
  var_2 = ["left", "center", "right"];

  if (!isdefined(var_0))
  return var_2[randomint(var_2.size)];

  var_0 = var_0 * -1;
  var_3 = anglestoforward(self.angles);
  var_4 = vectordot(var_0, var_3);

  if (var_4 > var_1)
  return "center";

  var_5 = anglestoright(self.angles);
  var_6 = vectordot(var_0, var_5);

  if (var_6 > 0)
  return "right";
  else
  return "left";
}

_id_9CD1(var_0) {
  if (!isdefined(var_0))
  return 0;

  return var_0 == "alienspit_mp";
}

_id_9CD0(var_0) {
  if (!isdefined(var_0))
  return 0;

  return var_0 == "alienspit_gas_mp";
}

_id_9BCA(var_0) {
  if (!isdefined(var_0) || !var_0 _id_0A4A::_id_9B5A())
  return 0;

  return _id_0A4A::_id_77D7(var_0) == "elite";
}

_id_CE3E(var_0) {
  if (!_id_0A77::_id_8BB1(self._id_01F1, "tag_eye"))
  return;

  if (var_0 == "left")
  playfxontagforclients(level._effect["vfx_alien_spitter_hit_left"], self, "tag_eye", self);
  else if (var_0 == "center")
  playfxontagforclients(level._effect["vfx_alien_spitter_hit_center"], self, "tag_eye", self);
  else if (var_0 == "right")
  playfxontagforclients(level._effect["vfx_alien_spitter_hit_right"], self, "tag_eye", self);
  else
  {}
}

_id_CCA5(var_0) {
  var_1 = self;

  if (!isdefined(self._id_01F1) || self._id_01F1 == "")
  return;

  if (!_id_0A77::_id_8BB1(self._id_01F1, "tag_eye"))
  return;

  if (var_0 == "left")
  playfxontagforclients(level._effect["vfx_blood_hit_left"], var_1, "tag_eye", self);
  else if (var_0 == "center")
  playfxontagforclients(level._effect["vfx_melee_blood_spray"], var_1, "tag_eye", self);
  else if (var_0 == "right")
  playfxontagforclients(level._effect["vfx_blood_hit_right"], var_1, "tag_eye", self);
  else
  {}
}

_id_13F0C() {
  self endon("disconnect");
  level endon("game_ended");
  self endon("death");
  self _meth_82BE("player_damaged", 1, 1);
  wait 0.05;
  self _meth_82BE("player_damaged", 1, 0);
}

_id_13F0D() {
  self endon("disconnect");
  level endon("game_ended");
  self endon("death");
  self _meth_82BE("player_damaged", 2, 0);
  var_0 = 0;
  var_1 = 1;

  for (;;) {
  if (self.health <= 45 && var_0 == 0) {
  if (!self issplitscreenplayer())
  self _meth_82C3("painvision_cp", 0.02, "mix", "reverb", "filter");

  var_0 = 1;
  }

  if (var_0 && var_1) {
  if (!_id_0A5B::_id_D0EF(self))
  self _meth_82BE("player_damaged", 2, 1);

  var_1 = 0;
  }

  if (var_0 && self.health > 45) {
  self _meth_8070(0.3);
  var_0 = 0;
  self _meth_82BE("player_damaged", 2, 0);
  var_1 = 1;
  }

  wait 0.05;
  }
}

_id_9AF5(var_0, var_1) {
  if (!isdefined(level._id_9ACA))
  level._id_9ACA = 0;
  else
  level._id_9ACA++;

  var_2 = _id_4666();
  var_3 = 1.6;

  if (level._id_10A56)
  var_3 = 2;

  var_4 = newhudelem();
  var_4.x = 20;
  var_4.y = var_2;
  var_4._id_002B = "left";
  var_4._id_002C = "bottom";
  var_4._id_017D = "left";
  var_4._id_0382 = "bottom";
  var_4._id_02A4 = 3;
  var_4._id_0142 = 1;
  var_4 _meth_834D(var_0);
  var_4.alpha = 1;
  var_4._id_0177 = 1;
  var_4._id_013B = var_3;
  var_4._id_00B9 = (0.8, 1, 0.8);
  var_4._id_013A = "default";
  var_4._id_0154 = (0.3, 0.6, 0.3);
  var_4._id_0153 = 1;
  return var_4;
}

_id_4666() {
  var_0 = -92;

  if (level._id_10A56)
  var_0 = -110;

  return level._id_9ACA * 20 - 92;
}
