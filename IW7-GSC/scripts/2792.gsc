/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2792.gsc
***************************************/

_id_BC86() {
  var_0 = getent("weapon_loc_screenshot_1", "targetname");
  var_1 = var_0.origin + (0, 0, 0);
  var_2 = var_0.angles + (0, 0, 0);
  level._id_CB4F.origin = var_1;
  level._id_CB4F.angles = var_2;
  var_3 = getent("camera_weapon_screenshot_1", "targetname");
  var_4 = var_3.origin + (100, 0, 0);
  var_5 = var_3.angles + (0, 0, 0);
  level._id_37A6 dontinterpolate();
  level._id_37A6.origin = var_4;
  level._id_37A6.angles = var_5;
}

move_to_blue_background_side_on() {
  var_0 = getent("weapon_loc_screenshot_1", "targetname");
  var_1 = var_0.origin + (0, 0, 0);
  var_2 = var_0.angles + (0, -25, 0);
  level._id_CB4F.origin = var_1;
  level._id_CB4F.angles = var_2;
  var_3 = getent("camera_weapon_screenshot_1", "targetname");
  var_4 = var_3.origin + (100, 0, 0);
  var_5 = var_3.angles + (0, 0, 0);
  level._id_37A6 dontinterpolate();
  level._id_37A6.origin = var_4;
  level._id_37A6.angles = var_5;
}

_id_BC8C() {
  var_0 = getent("weapon_loc_screenshot_2", "targetname");
  var_1 = var_0.origin + (0, 0, 0);
  var_2 = var_0.angles + (0, 0, 0);
  level._id_CB4F.origin = var_1;
  level._id_CB4F.angles = var_2;
  var_3 = getent("camera_weapon_screenshot_2", "targetname");
  var_4 = var_3.origin + (100, 0, 0);
  var_5 = var_3.angles + (0, 0, 0);
  level._id_37A6 dontinterpolate();
  level._id_37A6.origin = var_4;
  level._id_37A6.angles = var_5;
}

move_to_grey_background_side_on() {
  var_0 = getent("weapon_loc_screenshot_2", "targetname");
  var_1 = var_0.origin + (0, 0, 0);
  var_2 = var_0.angles + (0, -25, 0);
  level._id_CB4F.origin = var_1;
  level._id_CB4F.angles = var_2;
  var_3 = getent("camera_weapon_screenshot_2", "targetname");
  var_4 = var_3.origin + (100, 0, 0);
  var_5 = var_3.angles + (0, 0, 0);
  level._id_37A6 dontinterpolate();
  level._id_37A6.origin = var_4;
  level._id_37A6.angles = var_5;
}

_id_11452(var_0) {
  var_1 = tablelookup("mp/weaponScreenshotList.csv", 0, var_0, 1);
  _id_BC86();
  wait 2;
  wait 2;
  move_to_blue_background_side_on();
  wait 2;
  wait 2;
  _id_BC8C();
  wait 2;
  wait 2;
  move_to_grey_background_side_on();
  wait 2;
  wait 2;
}

_id_ECE1() {
  self endon("disconnect");
  var_0 = getent("weapon_loc_hq1", "targetname");
  var_1 = var_0.origin + (0, 0, 0);
  var_2 = var_0.angles + (0, 0, 0);
  level._id_CB4F = spawn("script_weapon", var_1, 0, 0, 5);
  level._id_CB4F.angles = var_2;
  level._id_37A6.origin = level._id_37AA._id_13C7B.origin;
  level._id_37A6.angles = level._id_37AA._id_13C7B.angles;
  wait 1;
  setomnvar("ui_screenshot_ready", 1);

  for (;;) {
  self waittill("luinotifyserver", var_3, var_4);

  if (var_3 == "take_screenshot") {
  if (var_4 == -1) {
  setomnvar("ui_screenshot_ready", 0);
  wait 0.1;
  setomnvar("ui_screenshot_ready", 1);
  continue;
  }

  setomnvar("ui_screenshot_ready", 0);
  _id_11452(var_4);
  setomnvar("ui_screenshot_ready", 1);
  }
  }
}
