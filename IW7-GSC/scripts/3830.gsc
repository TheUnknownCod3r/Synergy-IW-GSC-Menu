/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3830.gsc
***************************************/

_id_E3F4() {}

_id_F0E1(var_0, var_1, var_2) {
  return;

  if (isdefined(level._id_F0DE))
  level._id_F0DE delete();

  if (!isdefined(var_1))
  var_1 = 65;

  if (!isdefined(var_2))
  var_2 = 1;

  var_0 = _id_0EFB::_id_7CBC("security_camera", "targetname", var_0);
  level._id_F0DE = var_0 scripts\engine\utility::_id_107E6();
  _id_0B5E::_id_CBB5(level._id_F0DE, "tag_origin", var_1);

  if (var_2)
  setomnvar("ui_show_pip", 1);
}

_id_F0DF() {
  if (isdefined(level._id_F0DE)) {
  level._id_F0DE delete();
  setomnvar("ui_show_pip", 0);
  }
}
