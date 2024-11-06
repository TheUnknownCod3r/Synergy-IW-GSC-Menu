/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2963.gsc
***************************************/

_id_979A() {
  if (isdefined(level._id_5619) && level._id_5619)
  return;

  if (!scripts\engine\utility::_id_16F3("vehicles", ::_id_979A))
  return;

  thread _id_979B();
  _id_0B91::_id_D6D9(::_id_40D9);
}

_id_40D9() {
  level._id_13570 = undefined;
  level._id_13571 = undefined;
  level._id_13575 = undefined;
}

_id_979B() {
  scripts\engine\utility::_id_4914("aircraft_wash_math");
  _id_0B96::_id_F9C7();
  level.vehicle._id_8DAA = scripts\engine\utility::_id_227F(level.vehicle._id_8DAA, _id_0B91::_id_8181("helicopter_crash_location", "targetname"));
  _id_0B96::_id_FA79();
  var_0 = _id_0B96::_id_D808();
  _id_0B96::_id_FA7A(var_0);
  level.vehicle._id_8BBA = getentarray("script_vehicle", "code_classname").size > 0;
  _id_0B91::_id_16EB("invulerable_frags", &"SCRIPT_INVULERABLE_FRAGS", undefined);
  _id_0B91::_id_16EB("invulerable_bullets", &"SCRIPT_INVULERABLE_BULLETS", undefined);
  _id_0B91::_id_16EB("c12_bullets", &"SCRIPT_C12_BULLETS");
}

_id_1321A(var_0, var_1, var_2) {
  return _id_0B98::_id_1442(var_0, var_1, var_2);
}

_id_13237(var_0) {
  return _id_0B96::_id_1444(var_0);
}

_id_A5DF(var_0, var_1) {
  return _id_0B96::_id_12FB(var_0, var_1);
}

_id_8441() {
  self._id_843F = 1;
}

_id_8440() {
  self._id_843F = 0;
}

_id_B6B9() {
  return _id_0B96::_id_134C();
}

_id_B6BA() {
  return _id_0B96::_id_134D();
}

_id_9FEF() {
  return isdefined(self._id_0380);
}

_id_131F7() {
  return _id_0B96::_id_143E();
}

_id_9BF2() {
  return _id_0B96::_id_12F0();
}

_id_131FC() {
  self notify("kill_rumble_forever");
}

_id_1080E(var_0) {
  var_1 = [];
  var_1 = _id_0B96::_id_10810(var_0);
  return var_1;
}

_id_1080C(var_0) {
  var_1 = _id_1080E(var_0);
  return var_1[0];
}

_id_1080D(var_0) {
  var_1 = _id_1080E(var_0);
  thread _id_0B98::_id_845A(var_1[0]);
  return var_1[0];
}

_id_1080F(var_0) {
  var_1 = _id_1080E(var_0);

  foreach (var_3 in var_1)
  thread _id_0B98::_id_845A(var_3);

  return var_1;
}

_id_1A92(var_0) {
  thread _id_0B96::_id_1A93(var_0);
}

_id_13259() {
  _id_0B96::_id_13D03(1);
}

_id_13258() {
  _id_0B96::_id_13D03(0);
}

_id_9BC7() {
  return self._id_B91F;
}

_id_1320F(var_0, var_1, var_2) {
  if (!isarray(var_0))
  var_0 = [var_0];

  _id_0B94::_id_ADA7(var_0, undefined, var_2);
}

_id_1080B() {
  var_0 = _id_0B91::_id_10808();

  if (isdefined(self._id_EEBE)) {
  if (!_id_9E2C())
  var_0 _meth_83F4(self._id_EEBE);
  }

  thread _id_0B98::_id_845A(var_0);
  return var_0;
}

_id_2470(var_0) {
  self _meth_83E7(var_0.origin, var_0.angles);

  if (!_id_9E2C()) {
  scripts\engine\utility::waitframe();
  self attachpath(var_0);
  }

  thread _id_1321A(var_0, 1);
}

_id_2471(var_0) {
  self _meth_83E7(var_0.origin, var_0.angles);
  scripts\engine\utility::waitframe();

  if (!_id_9E2C())
  self attachpath(var_0);

  thread _id_1321A(var_0);
  _id_0B98::_id_845A(self);
}

_id_131DF(var_0) {
  var_1 = [];
  var_2 = self.classname;

  if (!isdefined(level.vehicle._id_116CE._id_12BCF[var_2]))
  return var_1;

  var_3 = level.vehicle._id_116CE._id_12BCF[var_2];

  if (!isdefined(var_0))
  return var_1;

  foreach (var_5 in self._id_E4FB) {
  foreach (var_7 in var_3[var_0]) {
  if (var_5._id_1321D == var_7)
  var_1[var_1.size] = var_5;
  }
  }

  return var_1;
}

_id_13253(var_0) {
  return _id_0B96::_id_1446(var_0);
}

_id_13250() {
  self notify("stop_scanning_turret");
}

_id_131DD() {
  self endon("death");
  var_0 = [];
  var_1 = self._id_247E;

  if (!isdefined(self._id_247E))
  return var_0;

  var_2 = var_1;
  var_2._id_46B3 = 0;

  while (isdefined(var_2)) {
  if (isdefined(var_2._id_46B3) && var_2._id_46B3 == 1)
  break;

  var_0 = scripts\engine\utility::_id_2279(var_0, var_2);
  var_2._id_46B3 = 1;

  if (!isdefined(var_2._id_0334))
  break;

  if (!_id_9E2C()) {
  var_2 = getvehiclenode(var_2._id_0334, "targetname");
  continue;
  }

  var_2 = _id_0B91::_id_7E96(var_2._id_0334, "targetname");
  }

  return var_0;
}

_id_1320C(var_0, var_1) {
  if (!isdefined(var_0))
  var_0 = "all";

  _id_0B97::_id_ACCE(var_0, var_1);
}

_id_1320B(var_0, var_1) {
  _id_0B97::_id_ACCC(var_0, var_1);
}

_id_13245(var_0, var_1) {
  self _meth_8344(var_0, var_1);
  self._id_247E = var_1;
  thread _id_1321A();
}

_id_13244(var_0, var_1, var_2) {
  return _id_0B98::_id_1445(var_0, var_1, var_2);
}

_id_13220(var_0) {
  return _id_0B98::_id_1443(var_0);
}

_id_9E2C() {
  return _id_0B96::_id_12F8();
}

_id_9D34() {
  return _id_0B96::_id_12F6();
}

_id_3182(var_0) {
  if (!isdefined(level.vehicle._id_116CE._id_4E12))
  level.vehicle._id_116CE._id_4E12 = [];

  var_1 = spawnstruct();
  var_1._id_50AE = var_0;
  level.vehicle._id_116CE._id_4E12[level._id_13570] = var_1;
}

_id_61FB() {
  _id_0B96::_id_F9C7();
  level.vehicle._id_10709 = 1;
}
