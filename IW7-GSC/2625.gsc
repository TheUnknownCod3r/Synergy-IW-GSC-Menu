/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2625.gsc
***************************************/

_id_EF33(var_0) {
  level._id_EF2E = var_0;
}

_id_028A() {
  if (isdefined(level._id_EF2E))
  [[level._id_EF2E]]();

  if (scripts\engine\utility::_id_9F64()) {
  if (!scripts\engine\utility::_id_6E34("scriptables_ready"))
  scripts\engine\utility::_id_6E39("scriptables_ready");

  scripts\engine\utility::_id_6E3E("scriptables_ready");
  }
}
