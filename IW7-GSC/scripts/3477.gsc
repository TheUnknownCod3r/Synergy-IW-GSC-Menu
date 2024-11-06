/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3477.gsc
***************************************/

_id_526C(var_0, var_1, var_2) {
  self endon("death");
  self._id_B377 = undefined;

  if (self getcurrentweapon() == var_1) {
  thread _id_5268(var_1);
  thread _id_526D(var_0, var_1, var_2);
  _id_526E(var_1);
  return !(self getammocount(var_1) && self hasweapon(var_1));
  }

  return 0;
}

_id_5268(var_0) {
  self endon("death");
  self endon("disconnect");
  var_1 = "";

  while (var_1 != var_0)
  self waittill("grenade_pullback", var_1);

  scripts\engine\utility::_id_1C6E(0);
  _id_5269();
}

_id_5269() {
  self endon("death");
  self endon("disconnect");
  scripts\engine\utility::waittill_any("grenade_fire", "weapon_change");
  scripts\engine\utility::_id_1C6E(1);
}

_id_526D(var_0, var_1, var_2) {
  self endon("designator_finished");
  self endon("spawned_player");
  self endon("disconnect");
  var_3 = undefined;
  var_4 = "";

  while (var_4 != var_1)
  self waittill("grenade_fire", var_3, var_4);

  if (isalive(self)) {
  var_3.owner = self;
  var_3.weaponname = var_1;
  self._id_B377 = var_3;
  thread _id_526A(var_0, var_3, var_2);
  }
  else
  var_3 delete();

  self notify("designator_finished");
}

_id_526E(var_0) {
  self endon("spawned_player");
  self endon("disconnect");
  var_1 = self getcurrentweapon();

  while (var_1 == var_0)
  self waittill("weapon_change", var_1);

  if (self getammocount(var_0) == 0)
  _id_526B(var_0);

  self notify("designator_finished");
}

_id_526B(var_0) {
  if (self hasweapon(var_0))
  scripts\mp\utility\game::_id_141E(var_0);
}

_id_526A(var_0, var_1, var_2) {
  var_1 waittill("missile_stuck", var_3);

  if (isdefined(var_1.owner))
  self thread [[var_2]](var_0, var_1);

  if (isdefined(var_1))
  var_1 delete();
}
