/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2855.gsc
***************************************/

_id_5F84(var_0) {
  self notify("disable_dynamic_move");
  self endon("disable_dynamic_move");

  if (isdefined(self._id_5F76))
  var_1 = squared(self._id_5F76);
  else if (isdefined(var_0))
  var_1 = squared(var_0);
  else
  var_1 = squared(300);

  self._id_51E4 = undefined;
  _id_0B91::_id_4145();
  _id_F491("sprint_loop", "sprint_super");

  for (;;) {
  var_2 = vectornormalize(level.player.origin - self.origin);
  var_3 = anglestoforward(self.angles);
  var_4 = vectordot(var_3, var_2);
  var_5 = distance2dsquared(level.player.origin, self.origin);

  if (var_4 < 0) {
  if (var_5 > var_1) {
  if (!isdefined(self._id_51E3) || isdefined(self._id_51E3) && self._id_51E3 == "sprint") {
  _id_0B91::_id_4145();

  if (isdefined(self._id_51E4))
  _id_0B91::_id_51E1(self._id_51E4);
  }
  }
  else if (!isdefined(self._id_51E3) || isdefined(self._id_51E3) && self._id_51E3 != "sprint") {
  self._id_51E4 = self._id_51E3;
  _id_0B91::_id_51E1("sprint");
  }
  }
  else if (!isdefined(self._id_51E3) || isdefined(self._id_51E3) && self._id_51E3 != "sprint") {
  self._id_51E4 = self._id_51E3;
  _id_0B91::_id_51E1("sprint");
  }

  wait 0.05;
  }
}

_id_5557() {
  self notify("disable_dynamic_move");

  if (isdefined(self._id_51E4))
  _id_0B91::_id_51E1(self._id_51E4);
  else
  _id_0B91::_id_4145();

  self._id_51E4 = undefined;
  _id_0B91::_id_4169("sprint");
}

_id_F491(var_0, var_1) {
  if (!scripts\asm\asm::_id_2346(var_0, var_1))
  return;

  var_2 = scripts\asm\asm::_id_2358(var_0, var_1);
  scripts\asm\asm::_id_237A("sprint", "move", var_2);
}
