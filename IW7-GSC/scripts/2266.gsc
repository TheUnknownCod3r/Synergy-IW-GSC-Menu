/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2266.gsc
***************************************/

#using_animtree("generic_human");

main() {
  self setmodel("body_hero_admiral_dustable");
  self attach("head_hero_admiral_dustable", "", 1);
  self._id_8C98 = "head_hero_admiral_dustable";
  self._id_1FEC = "generic_human";
  self._id_1FA8 = "soldier";
  self._id_13525 = "unitednations";
  self _meth_82C6("vestlight");

  if (issentient(self))
  self sethitlocdamagetable("locdmgtable/ai_lochit_dmgtable");

  self _meth_83D0(#animtree);
}

_id_0247() {
  precachemodel("body_hero_admiral_dustable");
  precachemodel("head_hero_admiral_dustable");
}
