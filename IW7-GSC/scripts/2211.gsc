/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2211.gsc
***************************************/

#using_animtree("generic_human");

main() {
  scripts\code\character::_id_F7A1(_id_093F::main());
  scripts\code\character::_id_2483("heads_un_marines_male", _id_09F6::main());
  self._id_8C43 = "helmet_un_marines";
  self attach(self._id_8C43);
  self._id_A489 = "pack_un_jackal_pilots";
  self attach(self._id_A489);
  self._id_1FEC = "generic_human";
  self._id_1FA8 = "marine";
  self._id_13525 = "unitednations";
  self _meth_82C6("vestlight");

  if (issentient(self))
  self sethitlocdamagetable("locdmgtable/ai_lochit_dmgtable");

  self._id_8E1A = level._id_7649["iw7/core/human/helmet_un_marines_broken"];
  self _meth_83D0(#animtree);
}

_id_0247() {
  scripts\code\character::_id_D811(_id_093F::main());
  scripts\code\character::_id_D811(_id_09F6::main());
  precachemodel("helmet_un_marines");
  precachemodel("pack_un_jackal_pilots");
  level._id_7649["iw7/core/human/helmet_un_marines_broken"] = loadfx("vfx/iw7/core/human/helmet_un_marines_broken.vfx");
}
