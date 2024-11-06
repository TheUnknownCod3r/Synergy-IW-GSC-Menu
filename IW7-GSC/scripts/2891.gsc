/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2891.gsc
***************************************/

_id_EB77(var_0, var_1) {
  if (!isdefined(var_1))
  var_1 = 0;

  level.player endon("death");

  if (level.player.health == 0)
  return;

  var_2 = level.player getcurrentprimaryweapon();

  if (!isdefined(var_2) || var_2 == "none") {}

  game["weaponstates"][var_0]["current"] = var_2;
  var_3 = level.player _meth_8115();
  game["weaponstates"][var_0]["offhand"] = var_3;
  game["weaponstates"][var_0]["list"] = [];
  var_4 = scripts\engine\utility::_id_227F(level.player getweaponslistprimaries(), level.player getweaponslistall());

  for (var_5 = 0; var_5 < var_4.size; var_5++) {
  game["weaponstates"][var_0]["list"][var_5]["name"] = var_4[var_5];

  if (var_1) {
  game["weaponstates"][var_0]["list"][var_5]["clip"] = level.player getweaponammoclip(var_4[var_5]);
  game["weaponstates"][var_0]["list"][var_5]["stock"] = level.player getweaponammostock(var_4[var_5]);
  }
  }
}

_id_E2E3(var_0, var_1, var_2) {
  var_3 = scripts\engine\utility::ter_op(isdefined(var_2) && var_2, ::_meth_83B6, ::_meth_83B5);

  if (!isdefined(var_1))
  var_1 = 0;

  if (!isdefined(game["weaponstates"]))
  return 0;

  if (!isdefined(game["weaponstates"][var_0]))
  return 0;

  level.player takeallweapons();

  for (var_4 = 0; var_4 < game["weaponstates"][var_0]["list"].size; var_4++) {
  var_5 = game["weaponstates"][var_0]["list"][var_4]["name"];

  if (var_5 == "c4")
  continue;

  if (var_5 == "claymore")
  continue;

  level.player giveweapon(var_5);
  level.player givemaxammo(var_5);

  if (var_1) {
  level.player setweaponammoclip(var_5, game["weaponstates"][var_0]["list"][var_4]["clip"]);
  level.player setweaponammostock(var_5, game["weaponstates"][var_0]["list"][var_4]["stock"]);
  }
  }

  level.player _meth_83B4(game["weaponstates"][var_0]["offhand"]);
  level.player call [[var_3]](game["weaponstates"][var_0]["current"]);
  return 1;
}

_id_F6B5() {
  self _meth_8299(1, "");
  self _meth_8299(2, "altMode");
  self _meth_8299(3, "");
  self _meth_8299(4, "");
}

_id_96D7() {
  _id_F6B5();
  self takeallweapons();
}

_id_7AA6() {
  if (isdefined(level._id_AE21))
  return level._id_AE21;

  return level.script;
}

_id_37E7(var_0) {
  level._id_1303 = var_0;
}

_id_CA6E(var_0, var_1, var_2) {
  var_3 = _id_7AA6();

  if (var_0 != var_3)
  return;

  if (!isdefined(game["previous_map"]))
  return;

  level._id_1304 = 1;

  if (isdefined(var_2))
  level.player _meth_831D(var_2);

  _id_E2E3(_id_7AA6(), 1);
  level._id_8B8E = 1;
}

_id_AE21(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7) {
  if (isdefined(var_0)) {
  var_8 = _id_7AA6();

  if (var_0 != var_8 || isdefined(level._id_1304))
  return;
  }

  if (isdefined(var_1)) {
  if (var_1 == "iw7_ar57")
  var_1 = "iw7_ar57+ar57scope";

  level._id_502E = var_1;
  level.player giveweapon(var_1);
  }

  if (isdefined(var_6)) {
  if (var_6 == "iw7_erad")
  var_6 = "iw7_erad+eradscope";

  level.player _meth_831D(var_6);
  }

  if (isdefined(var_2))
  level.player giveweapon(var_2);

  if (isdefined(var_3))
  level.player giveweapon(var_3);

  if (isdefined(var_4))
  level.player giveweapon(var_4);

  level.player _meth_83B5(var_1);

  if (isdefined(var_5))
  level.player setviewmodel(var_5);

  level._id_37E7 = level._id_1303;
  level._id_1303 = undefined;
  level._id_8B8E = 1;

  if (isdefined(var_7))
  _id_F551(var_7);
}

_id_F551(var_0) {
  level._id_D32B = var_0;
  precachemodel(level._id_D32B);
}

_id_AE27() {
  level._id_AE64 = 1;
  level notify("loadout complete");
}

_id_4FFD() {
  if (level._id_8B8E)
  return;

  _id_AE21(undefined, "iw7_ar57_reflex", undefined, "flash_grenade", "fraggrenade", "viewmodel_base_viewhands", "flash");
  level._id_B32C = 1;
}
