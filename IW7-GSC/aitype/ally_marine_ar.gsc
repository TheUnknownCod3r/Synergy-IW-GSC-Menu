/*********************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\aitype\ally_marine_ar.gsc
*********************************************/

main() {
  self._id_17DB = "";
  self.team = "allies";
  self.type = "human";
  self._id_12BA4 = "soldier";
  self._id_111A4 = "regular";
  self._id_0010 = 0.2;
  self.health = 150;
  self._id_0166 = _id_0A2F::_id_7BEB();
  self._id_0162 = 1;
  self._id_F0C4 = "";
  self._id_101B4 = _id_0A2F::_id_7BEC("pistol");
  self._id_2A80 = "enemy_combatant";
  self._id_1FA9 = "soldier";

  if (isai(self)) {
  self _meth_82DC(256.0, 0.0);
  self _meth_82DB(768.0, 1024.0);
  }

  self.weapon = _id_0A2F::_id_7BEC("rifle");
  var_0 = undefined;
  var_1 = ["character_un_marines", "character_un_marines_female"];

  switch (scripts\code\character::_id_7BE5(2, var_0, var_1)) {
  case 0:
    _id_08A3::main();
    break;
  case 1:
    _id_08B0::main();
    break;
  }
}

_id_02AE() {
  self _meth_833A("allies");
}

_id_0247() {
  _id_08A3::_id_0247();
  _id_08B0::_id_0247();
  scripts\aitypes\bt_util::init();
  _id_09FD::_id_103F2();
  _id_03AE::_id_DEE8();
  _id_0C69::_id_2371();
}