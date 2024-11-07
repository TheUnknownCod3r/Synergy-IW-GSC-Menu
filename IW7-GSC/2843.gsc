/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2843.gsc
***************************************/

init() {
  precacheshader("damage_feedback_thin");
  setdvar("scr_damagefeedback", "1");

  if (getdvar("scr_damagefeedback") == "")
  setdvar("scr_damagefeedback", "0");

  if (!getdvarint("scr_damagefeedback", 0))
  return;

  level._id_9040 = [];
  level._id_9040["low_damage"] = 35;
  level._id_9040["standard"] = 50;
  level._id_9040["standard_cp"] = 50;
  level._id_9040["high_damage"] = 85;
}

monitordamage() {
  if (!getdvarint("scr_damagefeedback", 0))
  return;

  if (isdefined(level._id_4D4D))
  return;

  if (_id_0B91::_id_93A6())
  return;

  _id_0B91::_id_16B7(::_id_4D4C);
}

_id_4D4C(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9) {
  if (!getdvarint("scr_damagefeedback", 0))
  return;

  if (!isdefined(var_1) || !isplayer(var_1) && !var_1 _id_9EF8() || var_1 == self || var_0 <= 0)
  return;

  var_10 = "standard";
  var_11 = "standard";

  if (isdefined(var_9)) {
  if (var_0 <= _func_294(var_9))
  var_11 = "low_damage";
  else if (var_0 >= _func_293(var_9))
  var_11 = "high_damage";
  }

  var_12 = 0;
  var_13 = 0;

  if (isai(self)) {
  var_12 = !isalive(self);
  var_13 = isheadshot(var_7);
  }

  level.player thread updatedamagefeedback(var_10, var_12, var_13, var_11, self);
}

_id_9EF8() {
  if (isdefined(self._id_12BA4) && self._id_12BA4 == "seeker") {
  if (isdefined(self.owner) && self.owner == level.player)
  return 1;
  }

  return 0;
}

_id_4D4B(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9) {
  if (!isdefined(level._id_D127) || !isdefined(var_1) || var_1 != level._id_D127)
  return;

  _id_4D4C(var_0, level.player, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9);
}

updatedamagefeedback(var_0, var_1, var_2, var_3, var_4) {
  if (!isplayer(self))
  return;

  if (!isdefined(var_3))
  var_3 = "standard";

  switch (var_0) {
  case "hithealthshield":
  case "hitlifelink":
  case "hitbulletstorm":
  case "hitcritical":
  case "hitmotionsensor":
  case "hitmorehealth":
  case "hitjuggernaut":
  case "hitlightarmor":
  case "hitblastshield":
  case "thermobaric_debuff":
  setomnvar("damage_feedback_icon", var_0);
  self setclientomnvar("damage_feedback_icon_notify", gettime());
  _id_12EA8(var_3, var_1, var_2);
  break;
  case "none":
  break;
  default:
  _id_12EA8(var_3, var_1, var_2, var_4);
  break;
  }
}

_id_12EA8(var_0, var_1, var_2, var_3) {
  if (!isdefined(var_0))
  return;

  if (!isdefined(var_1))
  var_1 = 0;

  if (!isdefined(var_2))
  var_2 = 0;

  if (isdefined(var_3) && var_3.team == "allies")
  return;

  var_4 = _id_7F03(var_0);

  if (isdefined(self._id_A99E) && self._id_A99E == gettime() && var_4 <= self._id_A99D && !var_1)
  return;

  self._id_A99E = gettime();
  self._id_A99D = var_4;
  setomnvar("damage_feedback", var_0);
  self setclientomnvar("damage_feedback_notify", gettime());

  if (var_1)
  setomnvar("damage_feedback_kill", 1);
  else
  setomnvar("damage_feedback_kill", 0);

  if (var_2)
  setomnvar("damage_feedback_headshot", 1);
  else
  setomnvar("damage_feedback_headshot", 0);
}

_id_7F03(var_0) {
  if (!isdefined(level._id_9040[var_0]))
  return 0;

  return level._id_9040[var_0];
}

isheadshot(var_0) {
  switch (var_0) {
  case "j_head_pv_horizontal":
  case "j_head_pv_z":
  case "j_head":
  case "j_neck":
  return 1;
  default:
  return 0;
  }

  return 0;
}