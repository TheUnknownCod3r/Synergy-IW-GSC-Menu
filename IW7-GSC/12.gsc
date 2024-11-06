/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\12.gsc
***************************************/

main() {
  if (isdefined(level.createfx_enabled) && level.createfx_enabled)
  return;

  level._id_274F = ::badplace_cylinder;
  level._id_2750 = ::badplace_delete;
  level thread scripts\mp\agents\agent_common::init();
  level._id_10A2A = 0;
}
