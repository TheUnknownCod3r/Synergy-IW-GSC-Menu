/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3503.gsc
***************************************/

init() {
  scripts\mp\killstreaks\killstreaks::registerkillstreak("mrsiartillery", ::_id_12906);
  var_0 = spawnstruct();
  var_0.weaponname = "airdrop_marker_mp";
  var_0._id_DA62 = "mrsiartillery_projectile_mp";
  var_0._id_C244 = 6;
  var_0._id_9831 = 1.0;
  var_0._id_B782 = 0.375;
  var_0._id_B49A = 0.5;
  var_0._id_11141 = 150;

  if (!isdefined(level._id_A692))
  level._id_A692 = [];

  level._id_A692["mrsiartillery"] = var_0;
}

_id_12906(var_0, var_1) {
  var_2 = level._id_A692["mrsiartillery"];
  var_3 = scripts\mp\killstreaks\designator_grenade::_id_526C("mrsiartillery", var_2.weaponname, ::_id_C5AF);

  if (!isdefined(var_3) || !var_3)
  return 0;
  else
  return 1;
}

_id_C5AF(var_0, var_1) {
  var_2 = level._id_A692[var_0];
  var_3 = var_1.owner;
  var_4 = var_1.origin;
  var_1 _meth_8099();
  _id_5AB7(var_3, var_0, var_3.origin, var_4);
}

_id_5AB7(var_0, var_1, var_2, var_3) {
  var_4 = level._id_A692[var_1];
  var_5 = var_3 - var_2;
  var_6 = (var_5[0], var_5[1], 0);
  var_5 = vectornormalize(var_5);
  var_7 = var_3;
  var_8 = scripts\mp\killstreaks\killstreaks::_id_6CC9(var_0, var_3 + (0, 0, 10), 10000);

  if (isdefined(var_8)) {
  iprintln("Firing Motar!");
  wait(var_4._id_9831);
  wait(randomfloatrange(var_4._id_B782, var_4._id_B49A));
  var_9 = scripts\mp\utility\game::_id_1309(var_4._id_DA62, var_8, var_7, var_0);

  for (var_10 = 1; var_10 < var_4._id_C244; var_10++) {
  wait(randomfloatrange(var_4._id_B782, var_4._id_B49A));
  var_11 = _id_CB2F(var_7, var_4._id_11141);
  var_9 = scripts\mp\utility\game::_id_1309(var_4._id_DA62, var_8, var_11, var_0);
  }
  }
  else
  iprintln("Mortar LOS blocked!");
}

_id_CB2F(var_0, var_1) {
  var_2 = randomfloatrange(-1 * var_1, var_1);
  var_3 = randomfloatrange(-1 * var_1, var_1);
  return var_0 + (var_2, var_3, 0);
}
