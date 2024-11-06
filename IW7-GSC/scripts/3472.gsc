/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3472.gsc
***************************************/

init() {
  var_0 = spawnstruct();
  var_0._id_039B = "deployable_vest_marker_mp";
  var_0._id_B91A = "mil_ammo_case_1_open";
  var_0._id_017B = &"KILLSTREAKS_HINTS_DEPLOYABLE_AMMO_USE";
  var_0._id_3A41 = &"KILLSTREAKS_DEPLOYABLE_AMMO_TAKING";
  var_0._id_67E5 = "deployable_ammo_taken";
  var_0._id_110EA = "deployable_ammo";
  var_0._id_10A38 = "used_deployable_ammo";
  var_0._id_FC47 = "compass_objpoint_deploy_ammo_friendly";
  var_0._id_8C7A = 25;
  var_0._id_AC71 = 90.0;
  var_0._id_130FC = 50;
  var_0._id_EC44 = "destroyed_vest";
  var_0._id_13523 = "ballistic_vest_destroyed";
  var_0._id_5230 = "mp_vest_deployed_ui";
  var_0._id_C5C7 = "ammo_crate_use";
  var_0._id_C5BC = ::_id_C5BE;
  var_0._id_3936 = ::_id_3937;
  var_0._id_130EE = 500;
  var_0.maxhealth = 150;
  var_0._id_4D4A = "deployable_bag";
  var_0._id_4E76 = "deployable_ammo_mp";
  var_0._id_4E74 = loadfx("vfx/iw7/_requests/mp/vfx_debug_warning.vfx");
  var_0._id_4E3C = 256;
  var_0._id_4E3A = 130;
  var_0._id_4E3B = 50;
  var_0._id_1C9D = 1;
  var_0._id_1C96 = 1;
  var_0._id_B4D1 = 4;
  level._id_2F30["deployable_ammo"] = var_0;
  scripts\mp\killstreaks\killstreaks::registerkillstreak("deployable_ammo", ::_id_128DE);
  level._id_5212["deployable_ammo"] = [];
}

_id_128DE(var_0, var_1) {
  var_2 = scripts\mp\killstreaks\deployablebox::_id_2A63(var_0, "deployable_ammo");

  if (!isdefined(var_2) || !var_2)
  return 0;

  scripts\mp\matchdata::_id_AFC9("deployable_ammo", self.origin);
  return 1;
}

_id_C5BE(var_0) {
  _id_17A6();
}

_id_17A6() {
  var_0 = self _meth_8173();

  if (isdefined(var_0)) {
  foreach (var_2 in var_0) {
  if (scripts\mp\weapons::_id_9D75(var_2)) {
  _id_1805(var_2, 2);
  continue;
  }

  if (weaponclass(var_2) == "rocketlauncher")
  _id_1805(var_2, 1);
  }
  }
}

_id_1805(var_0, var_1) {
  var_2 = weaponclipsize(var_0);
  var_3 = self getweaponammostock(var_0);
  self setweaponammostock(var_0, var_3 + var_1 * var_2);
}

_id_1819(var_0) {
  var_1 = self getweaponslistprimaries();

  foreach (var_3 in var_1) {
  if (scripts\mp\weapons::_id_9D75(var_3)) {
  if (var_3 != "iw6_alienminigun_mp") {
  var_4 = self getweaponammostock(var_3);
  var_5 = weaponmaxammo(var_3);
  var_6 = var_4 + var_5 * var_0;
  self setweaponammostock(var_3, int(min(var_6, var_5)));
  }
  }
  }
}

_id_17C6() {
  var_0 = self getweaponslistprimaries();

  foreach (var_2 in var_0) {
  var_3 = weaponclipsize(var_2);
  self setweaponammoclip(var_2, var_3);
  }
}

_id_3937(var_0) {
  return !scripts\mp\utility\game::isjuggernaut();
}
