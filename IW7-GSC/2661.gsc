/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2661.gsc
***************************************/

_id_82A2(var_0, var_1) {
  if (self.team == "allies")
  return;

  if (scripts\engine\utility::_id_9CEE(self._id_54CB))
  return;

  if (_id_0A4A::_id_77D7(self) == "elite" || _id_0A4A::_id_77D7(self) == "mammoth") {
  var_2 = _id_7C13();

  foreach (var_4 in level.players)
  _id_8373(var_4, var_2, "large");

  return;
  }

  if (isdefined(self._id_24DA) || isdefined(self._id_B36A)) {
  if (isdefined(self._id_B36A)) {
  foreach (var_4 in level.players) {
  if (isdefined(self._id_D354) && self._id_D354 == var_4 && var_4 != var_0) {
  var_7 = _id_7DDB();

  if (isdefined(level._id_3B0F))
  var_7 = var_7 * level._id_3B0F;

  _id_8373(var_4, var_7 * 2);
  var_4 _id_0A63::_id_666A("assists", 1);
  self._id_926B = 1;
  }
  }
  }

  if (!isdefined(self._id_926B)) {
  var_9 = 0.1;
  var_10 = self.maxhealth * var_9;
  var_7 = _id_7DDB();

  if (isdefined(level._id_3B0F))
  var_7 = var_7 * level._id_3B0F;

  foreach (var_12 in self._id_24DA) {
  if (var_12.player == var_0 || isdefined(var_0.owner) && var_12.player == var_0.owner)
  continue;

  if (var_12.damage >= var_10) {
  if (isdefined(var_12.player) && var_12.player != var_0) {
  var_12.player _id_0A63::_id_666A("assists", 1);
  _id_8373(var_12.player, var_7);
  }
  }
  }
  }
  }

  if (!isdefined(var_0))
  return;

  if (!isplayer(var_0) && (!isdefined(var_0.owner) || !isplayer(var_0.owner)))
  return;

  var_14 = 0;

  if (isdefined(var_0.owner)) {
  var_0 = var_0.owner;
  var_14 = 1;
  }

  var_2 = _id_7C13();

  if (isdefined(var_1) && var_1 == "soft" && !var_14)
  var_2 = int(var_2 * 1.5);

  _id_8373(var_0, var_2, "large", var_1);
}

_id_7DDB() {
  return level._id_18EE[_id_0A4A::_id_77D7(self)]["reward"] * 0.5;
}

_id_7C13() {
  return level._id_18EE[_id_0A4A::_id_77D7(self)]["reward"];
}

_id_8373(var_0, var_1, var_2, var_3) {
  var_4 = var_1 * level._id_4CC4;

  if (isdefined(level._id_3B0F))
  var_4 = var_4 * level._id_3B0F;

  var_0 _id_0A63::_id_82F9(var_4, var_2, var_3);

  if (isdefined(level._id_13F56))
  var_0 _id_0A63::_id_831D(int(var_4));

  if (scripts\engine\utility::_id_6E34("cortex_started") && scripts\engine\utility::_id_6E25("cortex_started")) {
  if (isdefined(level._id_16B4))
  [[level._id_16B4]](var_1);
  }
}