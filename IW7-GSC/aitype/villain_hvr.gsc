/******************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\aitype\villain_hvr.gsc
******************************************/

main() {
  self._id_17DB = "";
  self.team = "axis";
  self.type = "human";
  self._id_12BA4 = "soldier";
  self._id_111A4 = "noboost";
  self._id_0010 = 0.2;
  self.health = 150;
  self._id_0166 = "";
  self._id_0162 = 0;
  self._id_F0C4 = "";
  self._id_101B4 = "";
  self._id_2A80 = "enemy_combatant";
  self._id_1FA9 = "soldier";

  if (isai(self)) {
  self _meth_82DC(256.0, 0.0);
  self _meth_82DB(768.0, 1024.0);
  }

  self.weapon = "none";
  _id_0921::main();
}

_id_02AE() {
  self _meth_833A("axis");
}

_id_0247() {
  _id_0921::_id_0247();
  scripts\aitypes\bt_util::init();
  _id_09FD::_id_103F2();
  _id_03AE::_id_DEE8();
  _id_0C69::_id_2371();
}