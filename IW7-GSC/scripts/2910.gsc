/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2910.gsc
***************************************/

_id_CBAA() {
  return;
}

_id_CBB5(var_0, var_1, var_2, var_3, var_4, var_5) {
  if (getdvarint("e3"))
  return;

  if (gettime() < 500)
  wait 0.5;

  if (!isdefined(var_1))
  return;

  if (!isdefined(level._id_CB9C))
  level._id_CB9C = level.player _meth_8216();

  if (_id_CBAC())
  return;

  level._id_CB9C._id_0108 = 1;
  level._id_CB9C._id_0262 = 1;
  level._id_CB9C._id_009E = 5000;
  level._id_CB9C._id_01FA = 2;
  level._id_CB9C._id_004C = 1;
  level._id_CB9C._id_C719 = (0, 0, 0);
  level._id_CB9C._id_0042 = (0, 0, 0);
  level._id_CB9C._id_02DD = var_1;
  level._id_CB9C._id_0144 = scripts\engine\utility::ter_op(isdefined(var_2), var_2, 30);

  if (isdefined(var_3))
  level._id_CB9C._id_C719 = var_3;

  if (isdefined(var_4))
  level._id_CB9C._id_0042 = var_4;

  level._id_CB9C._id_0114 = var_0;
  level._id_CB9C._id_0106 = 1;
  level._id_CB9C._id_014B = 1;
  setomnvar("ui_pip_static", 0);
  setomnvar("ui_pip_message_text_top", "script_pip_default_top");
  setomnvar("ui_pip_message_text_bottom", "script_pip_default_bottom");
  setomnvar("ui_pip_message_type", 1);

  if (!isdefined(var_5)) {
  setomnvar("ui_show_pip", 1);

  if (isdefined(level.player _meth_8473()))
  setomnvar("ui_jackal_hide_follow_pip", 1);
  else
  setomnvar("ui_jackal_hide_follow_pip", 0);
  }
}

_id_2ADF(var_0) {
  level.player playsound("ui_pip_on_hud_right");
  setomnvar("ui_pip_message_text_top", "script_pip_default_top");
  setomnvar("ui_pip_message_text_bottom", "script_pip_default_bottom");
  _func_1F1();
  _func_1C5("bg_cinematicFullScreen", "0");
  _func_1C5("bg_cinematicCanPause", "1");
  setomnvar("ui_show_pip", 1);
  wait 0.05;
  setomnvar("ui_show_pip", 0);
  wait 0.05;
  setomnvar("ui_show_pip", 1);
  _func_03D(var_0);

  while (!iscinematicplaying())
  wait 0.05;

  while (iscinematicplaying())
  wait 0.05;

  _func_1F1();
  setomnvar("ui_show_pip", 0);
  level.player playsound("ui_pip_off_hud_right");
  _func_1C5("bg_cinematicFullScreen", "1");
  _func_1C5("bg_cinematicCanPause", "1");
}

_id_CBC3(var_0) {
  level._id_CB9C._id_001A = "naked";
  level._id_CB9C._id_001B = 0.5;
  level._id_CB9C._id_0386 = var_0;
}

_id_CBA3() {
  if (getdvarint("e3"))
  return;

  if (!isdefined(level._id_CB9C))
  return;

  setomnvar("ui_show_pip", 0);
  setomnvar("ui_jackal_hide_follow_pip", 1);
  level._id_CB9C._id_0106 = 0;
  level notify("pip_closed");
}

_id_CBAC() {
  return isdefined(level._id_CB9C) && isdefined(level._id_CB9C._id_0106) && level._id_CB9C._id_0106;
}

_id_CBA5(var_0) {
  _id_6A67();
  _id_0B91::_id_10347(var_0);
  _id_CBA3();
}

_id_6A67(var_0) {
  switch (tolower(self._id_12BA4)) {
  case "c6i":
  _id_CBB5(self, "tag_eye", 29, (18, 7, 1), (0, 200, 3), var_0);
  break;
  case "jackal":
  _id_CBB5(self, "tag_barrel", 13, (150, 0, 20), (8.5, 180, 0), var_0);
  break;
  default:
  _id_CBB5(self, "tag_eye", 29, (18, 7, -1), (0, 200, 3), var_0);
  level._id_CB9C._id_01FA = 17;
  break;
  }
}

_id_CBC4() {
  _id_6A67();
  self waittill("close_pip");
  _id_CBA3();
}
