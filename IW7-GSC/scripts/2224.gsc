/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2224.gsc
***************************************/

#using_animtree("generic_human");

main() {
  scripts\code\character::_id_F7A1(_id_093D::main());
  scripts\code\character::_id_2483("heads_un_marines_female", _id_09F4::main());
  self._id_8C43 = "head_un_marines_female_helmet";
  self attach(self._id_8C43);
  self._id_A489 = "pack_female";
  self attach(self._id_A489);
  self._id_1FEC = "generic_human";
  self._id_1FA8 = "hero_salter";
  self._id_13525 = "unitednationsfemale";
  self _meth_82C6("vestlight");

  if (issentient(self))
  self sethitlocdamagetable("locdmgtable/ai_lochit_dmgtable");

  self._id_8E1A = level._id_7649["iw7/core/human/helmet_un_marines_broken"];
  self _meth_83D0(#animtree);
}

_id_0247() {
  scripts\code\character::_id_D811(_id_093D::main());
  scripts\code\character::_id_D811(_id_09F4::main());
  precachemodel("head_un_marines_female_helmet");
  precachemodel("pack_female");
  level._id_7649["iw7/core/human/helmet_un_marines_broken"] = loadfx("vfx/iw7/core/human/helmet_un_marines_broken.vfx");
}
