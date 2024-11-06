/***********************************************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\scripts\mp\maps\mp_renaissance2\mp_renaissance2.gsc
***********************************************************************/

main() {
  scripts\mp\maps\mp_renaissance2\mp_renaissance2_precache::main();
  scripts\mp\maps\mp_renaissance2\gen\mp_renaissance2_art::main();
  scripts\mp\maps\mp_renaissance2\mp_renaissance2_fx::main();
  scripts\mp\load::main();
  level._id_C7B3 = getentarray("OutOfBounds", "targetname");
  scripts\mp\compass::setupminimap("compass_map_mp_renaissance2");
  setdvar("r_lightGridEnableTweaks", 1);
  setdvar("r_lightGridIntensity", 1.33);
  setdvar("r_umbraMinObjectContribution", 8);
  setdvar("r_umbraAccurateOcclusionThreshold", 1024);
  game["attackers"] = "allies";
  game["defenders"] = "axis";
  game["allies_outfit"] = "urban";
  game["axis_outfit"] = "woodland";
  level._id_C7B3 = getentarray("OutOfBounds", "targetname");
  thread apex_not_outofbounds();
  thread oceaninmotion();
  thread setup_vista_driving_boats();
  thread _id_F9BA();
  thread fix_collision();
}

fix_collision() {
  var_0 = getent("player128x128x256", "targetname");
  var_1 = spawn("script_model", (-560, -2752, 384));
  var_1.angles = (0, 0, 0);
  var_1 clonebrushmodeltoscriptmodel(var_0);
  var_2 = getent("player32x32x256", "targetname");
  var_3 = spawn("script_model", (-512, -1536, 464));
  var_3.angles = (0, 45, 0);
  var_3 clonebrushmodeltoscriptmodel(var_2);
  var_4 = spawn("script_model", (-512, -1536, 720));
  var_4.angles = (0, 45, 0);
  var_4 clonebrushmodeltoscriptmodel(var_2);
  var_5 = spawn("script_model", (-1088, -510, 0));
  var_5.angles = (0, 0, 0);
  var_5 setmodel("mp_geneva_wallrun_clip_brick_01");
  var_6 = getent("player32x32x8", "targetname");
  var_7 = spawn("script_model", (-512, -2416, 284));
  var_7.angles = (75, 0, 0);
  var_7 clonebrushmodeltoscriptmodel(var_6);
  var_8 = spawn("script_model", (-512, -3080, 284));
  var_8.angles = (75, 0, 0);
  var_8 clonebrushmodeltoscriptmodel(var_6);
  var_9 = spawn("script_model", (122, 1740, 0));
  var_9.angles = (0, 0, 0);
  var_9 setmodel("mp_skyway_nosight_v1");
}

apex_not_outofbounds() {
  level.outofboundstriggerpatches = [];
  var_0 = getent("apex_unoutofbounds", "targetname");
  level.outofboundstriggerpatches[level.outofboundstriggerpatches.size] = var_0;
  level waittill("game_ended");

  foreach (var_0 in level.outofboundstriggerpatches) {
  if (isdefined(var_0))
    var_0 delete();
  }
}

oceaninmotion() {
  var_0 = getentarray("bobbing_boat", "targetname");

  foreach (var_2 in var_0)
  thread bobbingboat(var_2);
}

bobbingboat(var_0) {
  var_0._id_02C5 = var_0.origin;
  var_0._id_10D6C = var_0.angles;

  if (isdefined(var_0._id_0334)) {
  var_0._id_BE10 = getentarray(var_0._id_0334, "targetname");

  foreach (var_2 in var_0._id_BE10)
    var_2.deltapos = var_2.origin - var_0.origin;
  }

  thread boatbob(var_0);
}

boatbob(var_0) {
  level endon("game_ended");

  for (;;) {
  var_1 = randomfloatrange(4, 7);
  var_0._id_015B = var_0._id_02C5 + (randomintrange(-2, 2), randomintrange(-2, 2), randomintrange(-3, 3));
  var_0 moveto(var_0._id_015B, var_1, var_1 * 0.25, var_1 * 0.25);

  if (isdefined(var_0._id_0334)) {
    foreach (var_3 in var_0._id_BE10) {
    var_3._id_015B = var_0._id_015B + var_3.deltapos;
    var_3 moveto(var_3._id_015B, var_1, var_1 * 0.25, var_1 * 0.25);
    }
  }

  wait(var_1);
  }
}

setup_vista_driving_boats() {
  var_0 = getentarray("boat_vista", "targetname");
  var_1 = 0.01;
  var_2 = 0.0166667;
  wait 5.0;

  foreach (var_4 in var_0) {
  if (isdefined(var_4._id_EDF9)) {
    thread vista_boat_drive(var_4, var_2);
    playfxontag(scripts\engine\utility::_id_7ECB("vfx_gn_bg_sail_boat_wake"), var_4, "tag_origin");
    continue;
  }

  thread vista_boat_drive(var_4, var_1);
  playfxontag(scripts\engine\utility::_id_7ECB("vfx_gn_bg_boat_wake_rear"), var_4, "tag_origin");
  }
}

vista_boat_drive(var_0, var_1) {
  level endon("game_ended");
  var_2 = scripts\engine\utility::_id_817E(var_0._id_0334, "targetname");

  for (;;) {
  var_3 = abs(distance(var_0.origin, var_2.origin) * var_1);
  var_0 moveto(var_2.origin, var_3, 0, 0);
  var_0 rotateto(var_2.angles, var_3, 0, 0);
  var_2 = scripts\engine\utility::_id_817E(var_2._id_0334, "targetname");
  wait(var_3);
  }
}

_id_F9BA() {
  level._id_A582 = 600;
  level._id_A583 = 1200;
  level._id_BF47 = -1.0;
  var_0 = getentarray("wine_keg", "targetname");

  foreach (var_2 in var_0)
  var_2 thread _id_13957();
}

_id_13957() {
  self setcandamage(1);

  for (;;) {
  self waittill("damage", var_0, var_1, var_2, var_3, var_4);

  if (!issubstr(var_4, "BULLET"))
    continue;

  if (!_id_3827())
    continue;

  var_5 = _id_7A63(var_1, var_2, var_3);

  if (!isdefined(var_5))
    continue;

  _id_B27C();
  var_5 = vectortoangles(var_5);
  playfx(level._effect["vfx_gn_imp_wine_cask"], var_3, anglestoforward(var_5), anglestoup(var_5));
  playfx(level._effect["vfx_gn_wine_barrel_stream"], var_3, anglestoforward(var_5), anglestoup(var_5));
  }
}

_id_7A63(var_0, var_1, var_2) {
  var_3 = var_0.origin;
  var_4 = var_2 - var_3;
  var_5 = bullettrace(var_3, var_3 + 1.5 * var_4, 0, var_0, 0);

  if (isdefined(var_5["normal"]) && isdefined(var_5["entity"]) && var_5["entity"] == self)
  return var_5["normal"];

  return undefined;
}

_id_3827() {
  if (gettime() < level._id_BF47)
  return 0;

  return 1;
}

_id_B27C() {
  level._id_BF47 = gettime() + randomfloatrange(level._id_A582, level._id_A583);
}
