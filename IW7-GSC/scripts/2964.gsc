/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2964.gsc
***************************************/

_id_8739(var_0, var_1) {
  if (!isdefined(self))
  return;

  if (!isdefined(self._id_0380))
  return;

  var_2 = self.classname;
  var_3 = level.vehicle._id_116CE._id_1A03[var_2];
  self._id_247C[self._id_247C.size] = var_0;
  var_4 = _id_F554(var_0, var_3);

  if (!isdefined(var_4))
  return;

  if (var_4 == 0)
  var_0._id_5BD6 = 1;

  var_5 = _id_1F00(self, var_4);
  self._id_1307E[var_4] = 1;
  var_0._id_1321D = var_4;
  var_0._id_131F5 = 0;

  if (isdefined(var_5._id_50AE)) {
  var_0._id_50AE = var_5._id_50AE;

  if (isdefined(var_5._id_510B))
  self._id_5107 = var_0._id_50AE;
  }

  if (isdefined(var_5._id_510B)) {
  self._id_5107 = self._id_5107 + var_5._id_510B;
  var_0._id_50AE = self._id_5107;
  }

  var_0._id_E500 = self;
  var_0._id_C6F8 = var_0.health;
  var_0._id_131F2 = var_5._id_92CC;
  var_0._id_13240 = var_5._id_10B69;
  var_0._id_4E2A = var_5._id_00E6;
  var_0._id_4E2E = var_5._id_4E5E;
  var_0._id_10B71 = 0;
  var_0._id_0030 = 0;

  if (isdefined(var_0._id_4E2A) && !isdefined(var_0._id_B14F) && _id_131A7()) {
  if (var_0._id_1321D != 0 || _id_131A6()) {
  var_0._id_0030 = !isdefined(var_0._id_ECED) || var_0._id_ECED;

  if (isdefined(var_5._id_4E14))
  var_0._id_C089 = var_5._id_4E14;
  }
  }

  if (var_0.classname == "script_model") {
  if (isdefined(var_5._id_00E6) && var_0._id_0030 && (!isdefined(var_0._id_ECED) || var_0._id_ECED))
  thread _id_8730(var_0, var_5);
  }

  if (!isdefined(var_0._id_131F2))
  var_0._id_0030 = 1;

  self._id_E4FB[self._id_E4FB.size] = var_0;

  if (var_0.classname != "script_model" && _id_0B91::_id_106ED(var_0))
  return;

  var_6 = self gettagorigin(var_5._id_10220);
  var_7 = self gettagangles(var_5._id_10220);
  _id_AD14(var_0, var_5._id_10220, var_5._id_10221, var_5._id_AD46);

  if (isai(var_0)) {
  var_0 _meth_83B9(var_6, var_7);
  var_0._id_1491._id_55FC = 1;

  if (isdefined(var_5._id_2AB6) && !var_5._id_2AB6)
  var_0 _id_0B91::_id_86E4();

  if (_id_8755(var_5))
  thread _id_874C(var_0, var_4, var_1);
  } else {
  if (isdefined(var_5._id_2AB6) && !var_5._id_2AB6)
  _id_538C(var_0, "weapon_");

  var_0.origin = var_6;
  var_0.angles = var_7;
  }

  if (var_4 == 0 && isdefined(var_3[0]._id_00E6))
  thread _id_5BCE(var_0);

  self notify("guy_entered", var_0, var_4);
  thread _id_8743(var_0, var_4);

  if (isdefined(var_5._id_E4FA))
  var_0 [[var_5._id_E4FA]]();
  else
  {
  if (isdefined(var_5._id_7F14)) {
  thread [[var_5._id_7F14]](var_0, var_4);
  return;
  }

  thread _id_8744(var_0, var_4);
  }
}

_id_131A6() {
  if (!isdefined(self._id_ECEB))
  return 0;

  return self._id_ECEB;
}

_id_131A7() {
  if (!isdefined(self._id_ECEC))
  return 1;

  return self._id_ECEC;
}

_id_8755(var_0) {
  if (!isdefined(var_0._id_B6BD))
  return 0;

  if (!isdefined(self._id_EE5E))
  return 1;

  return !self._id_EE5E;
}

_id_88AE() {
  var_0 = self.classname;
  self._id_247C = [];

  if (!(isdefined(level.vehicle._id_116CE._id_1A03) && isdefined(level.vehicle._id_116CE._id_1A03[var_0])))
  return;

  var_1 = level.vehicle._id_116CE._id_1A03[var_0].size;

  if (isdefined(self.script_noteworthy) && self.script_noteworthy == "ai_wait_go")
  thread _id_19F9();

  self._id_E880 = [];
  self._id_1307E = [];
  self._id_7F1A = [];
  self._id_5107 = 0;
  var_2 = level.vehicle._id_116CE._id_1A03[var_0];

  for (var_3 = 0; var_3 < var_1; var_3++) {
  self._id_1307E[var_3] = 0;

  if (isdefined(self._id_EE5E) && self._id_EE5E && isdefined(var_2[var_3]._id_2B10) && var_2[var_3]._id_2B10)
  self._id_1307E[1] = 1;
  }
}

_id_ADA8(var_0) {
  _id_ADA7(var_0, 1);
}

_id_8730(var_0, var_1) {
  waittillframeend;
  var_0 setcandamage(1);
  var_0 endon("death");
  var_0._id_0030 = 0;
  var_0.health = 10150;

  if (isdefined(var_0._id_EEC8))
  var_0.health = var_0.health + var_0._id_EEC8;

  var_0 endon("jumping_out");

  if (isdefined(var_0._id_B14F) && var_0._id_B14F) {
  while (isdefined(var_0._id_B14F) && var_0._id_B14F)
  wait 0.05;
  }

  while (var_0.health > 10000)
  var_0 waittill("damage");

  thread _id_8732(var_0, var_1);
}

_id_8732(var_0, var_1) {
  var_2 = gettime() + getanimlength(var_1._id_00E6) * 1000;
  var_3 = var_0.angles;
  var_4 = var_0.origin;
  var_0 = _id_45EE(var_0);
  [[level._id_83D9]]("MOD_RIFLE_BULLET", "torso_upper", var_4);
  _id_538C(var_0, "weapon_");
  var_0 linkto(self);
  var_0 notsolid();
  var_0 _meth_82A2(var_1._id_00E6);

  if (isai(var_0))
  var_0 scripts\anim\shared::_id_5D1A();
  else
  _id_538C(var_0, "weapon_");

  if (isdefined(var_1._id_4E00)) {
  var_0 unlink();

  if (isdefined(var_0._id_71C8))
  var_0 [[var_0._id_71C8]]();

  var_0 startragdoll();
  wait(var_1._id_4E00);
  var_0 delete();
  return;
  }
}

_id_ADA7(var_0, var_1, var_2) {
  if (!isdefined(var_1))
  var_1 = 0;

  _id_0B91::_id_65DD("unloaded");
  _id_0B91::_id_65DD("loaded");
  scripts\engine\utility::_id_22A1(var_0, ::_id_7A35, var_1, var_2);
}

_id_9CA7(var_0) {
  for (var_1 = 0; var_1 < self._id_E4FB.size; var_1++) {
  if (self._id_E4FB[var_1] == var_0)
  return 1;
  }

  return 0;
}

_id_7A35(var_0, var_1, var_2) {
  if (_id_9CA7(var_0))
  return;

  if (!_id_88D2())
  return;

  _id_8752(var_0, self, var_1, var_2);
}

_id_88D2() {
  if (_id_131EE())
  return 1;
}

_id_131EE() {
  if (level.vehicle._id_116CE._id_1A03[self.classname].size - self._id_E880.size)
  return 1;
  else
  return 0;
}

_id_8754(var_0, var_1) {
  var_1 endon("death");
  var_1 endon("stop_loading");
  var_2 = var_0 scripts\engine\utility::_id_13734("long_death", "death", "enteredvehicle");

  if (var_2 != "enteredvehicle" && isdefined(var_0._id_72AE))
  var_1._id_1307E[var_0._id_72AE] = 0;

  var_1._id_E880 = scripts\engine\utility::array_remove(var_1._id_E880, var_0);
  _id_13211(var_1);
}

_id_13211(var_0) {
  if (isdefined(var_0._id_0380) && isdefined(var_0._id_13212)) {
  if (var_0._id_E4FB.size == var_0._id_13212)
  var_0 _id_0B91::_id_65E1("loaded");
  }
  else if (!var_0._id_E880.size && var_0._id_E4FB.size) {
  if (var_0._id_1307E[0])
  var_0 _id_0B91::_id_65E1("loaded");
  else
  var_0 thread _id_1321F();
  }
}

_id_1321F() {
  var_0 = self._id_E4FB;
  _id_0B93::_id_13253();
  _id_0B91::_id_65E3("unloaded");
  var_0 = _id_0B91::_id_22B9(var_0);
  thread _id_0B93::_id_1320F(var_0);
}

_id_E054(var_0) {
  scripts\engine\utility::waittill_any("unload", "death");
  var_0 _id_0B91::_id_1101B();
}

_id_8752(var_0, var_1, var_2, var_3) {
  var_1 endon("stop_loading");
  var_4 = 1;

  if (!isdefined(var_2))
  var_2 = 0;

  var_5 = level.vehicle._id_116CE._id_1A03[var_1.classname];

  if (isdefined(var_1._id_E8A8)) {
  var_1 thread [[var_1._id_E8A8]](var_0);
  return;
  }

  var_1 endon("death");
  var_0 endon("death");
  var_1._id_E880[var_1._id_E880.size] = var_0;
  thread _id_8754(var_0, var_1);
  var_6 = [];
  var_7 = undefined;
  var_8 = 0;
  var_9 = 0;

  for (var_10 = 0; var_10 < var_5.size; var_10++) {
  if (isdefined(var_5[var_10]._id_7F12))
  var_9 = 1;
  }

  if (!var_9) {
  var_0 notify("enteredvehicle");
  var_1 _id_8739(var_0, var_4);
  return;
  }

  if (!isdefined(var_0._id_7A34)) {
  while (var_1 vehicle_getspeed() > 1)
  wait 0.05;
  }

  var_11 = var_1 _id_7851(var_3);

  if (isdefined(var_0._id_EEC9))
  var_7 = var_1 _id_131E5(var_0._id_EEC9);
  else if (!var_1._id_1307E[0]) {
  var_7 = var_1 _id_131E5(0);

  if (var_2) {
  var_0 thread _id_0B91::_id_B14F();
  thread _id_E054(var_0);
  }
  }
  else if (var_11._id_26A3.size)
  var_7 = scripts\engine\utility::_id_7E2E(var_0.origin, var_11._id_26A3);
  else
  var_7 = undefined;

  if (!var_11._id_26A3.size && var_11._id_C07E.size) {
  var_0 notify("enteredvehicle");
  var_1 _id_8739(var_0, var_4);
  return;
  }
  else if (!isdefined(var_7))
  return;

  var_8 = var_7.origin;
  var_12 = var_7.angles;
  var_0._id_72AE = var_7._id_1321D;
  var_1._id_1307E[var_7._id_1321D] = 1;
  var_0._id_EE2B = 1;
  var_0 notify("stop_going_to_node");
  var_0 _id_0B91::_id_F3BC();
  var_0 _id_0B91::_id_5504();
  var_0._id_015C = 16;
  var_0 _meth_82EF(var_8);
  var_0 waittill("goal");
  var_0 _id_0B91::_id_61DB();
  var_0 _id_0B91::_id_12BFA();
  var_0 notify("boarding_vehicle");
  var_13 = _id_1F00(var_1, var_7._id_1321D);

  if (isdefined(var_13._id_50AE)) {
  var_0._id_50AE = var_13._id_50AE;

  if (isdefined(var_13._id_510B))
  self._id_5107 = var_0._id_50AE;
  }

  if (isdefined(var_13._id_510B)) {
  self._id_5107 = self._id_5107 + var_13._id_510B;
  var_0._id_50AE = self._id_5107;
  }

  var_1 _id_AD14(var_0, var_13._id_10220, var_13._id_10221, var_13._id_AD46);
  var_0._id_0030 = 0;
  var_13 = var_5[var_7._id_1321D];

  if (isdefined(var_7)) {
  if (isdefined(var_13._id_131E1)) {
  if (isdefined(var_13._id_131E6)) {
  var_14 = isdefined(var_0._id_C01A);

  if (!var_14)
  var_1 _meth_806F(var_13._id_131E6, 0);
  }

  var_1 = var_1 _id_7DC5();
  var_1 thread _id_F642(var_13._id_131E1, var_13._id_131E2);
  level thread _id_0B06::_id_10CBF(var_1, "vehicle_anim_flag", undefined, undefined, var_13._id_131E1);
  }

  if (isdefined(var_13._id_131E4))
  var_8 = var_1 gettagorigin(var_13._id_131E4);
  else
  var_8 = var_1.origin;

  if (isdefined(var_13._id_131E3))
  _func_178(var_13._id_131E3, var_8);

  var_15 = undefined;
  var_16 = undefined;

  if (isdefined(var_13._id_7F13)) {
  var_15 = [];
  var_15[0] = var_13._id_7F13;
  var_16 = [];
  var_16[0] = ::_id_6623;
  var_1 _id_AD14(var_0, var_13._id_10220, var_13._id_10221, var_13._id_AD46);
  }

  var_1 _id_1FC2(var_0, var_13._id_10220, var_13._id_7F12, var_15, var_16);
  }

  var_0 notify("enteredvehicle");
  var_1 _id_8739(var_0, var_4);
}

_id_6623() {
  self notify("enteredvehicle");
}

_id_5BCE(var_0) {
  if (_id_0B93::_id_9E2C())
  return;

  self._id_5BC8 = var_0;
  self endon("death");
  var_0 endon("jumping_out");
  var_0 waittill("death");

  if (isdefined(self._id_131F9))
  return;

  self notify("driver dead");
  self._id_4DEF = 1;

  if (isdefined(self._id_8C2D) && self._id_8C2D) {
  self _meth_836E(0);
  self vehicle_setspeed(0, 10);
  self waittill("reached_wait_speed");
  }

  _id_0B93::_id_13253();
}

_id_872C(var_0, var_1) {
  if (isai(var_0))
  return var_0;

  if (var_0._id_5BF2 == 1)
  var_0 delete();
  else
  {
  var_0 = _id_0B77::_id_10869(var_0);
  var_2 = self.classname;
  var_3 = level.vehicle._id_116CE._id_1A03[var_2].size;
  var_4 = _id_1F00(self, var_1);
  _id_AD14(var_0, var_4._id_10220, var_4._id_10221, var_4._id_AD46);
  var_0._id_131F2 = var_4._id_92CC;
  thread _id_8744(var_0, var_1);
  }
}

_id_AD14(var_0, var_1, var_2, var_3) {
  if (!isdefined(var_2))
  var_2 = (0, 0, 0);

  if (!isdefined(var_3))
  var_3 = 0;

  if (var_3 && !isdefined(var_0._id_ED6E))
  var_0 _meth_81E1(self, var_1, 0);
  else
  var_0 linkto(self, var_1, var_2, (0, 0, 0));
}

_id_1F00(var_0, var_1) {
  return level.vehicle._id_116CE._id_1A03[var_0.classname][var_1];
}

_id_8731(var_0, var_1) {
  var_0 waittill("death");

  if (!isdefined(self))
  return;

  self._id_E4FB = scripts\engine\utility::array_remove(self._id_E4FB, var_0);
  self._id_1307E[var_1] = 0;
}

_id_F8AE() {
  if (!isdefined(level.vehicle._id_1A04))
  level.vehicle._id_1A04 = [];

  if (!isdefined(level.vehicle._id_1A02))
  level.vehicle._id_1A02 = [];

  level.vehicle._id_1A04["idle"] = ::_id_8744;
  level.vehicle._id_1A04["unload"] = ::_id_8766;
}

_id_8743(var_0, var_1) {
  var_0._id_131F5 = 1;
  thread _id_8731(var_0, var_1);
}

_id_5BC9(var_0, var_1) {
  var_0 endon("newanim");
  self endon("death");
  var_0 endon("death");
  var_2 = _id_1F00(self, var_1);

  for (;;) {
  if (self vehicle_getspeed() == 0)
  var_0._id_131F2 = var_2._id_92D5;
  else
  var_0._id_131F2 = var_2._id_92D0;

  wait 0.25;
  }
}

_id_8744(var_0, var_1, var_2) {
  var_0 endon("newanim");

  if (!isdefined(var_2))
  self endon("death");

  var_0 endon("death");
  var_0._id_131F5 = 1;
  var_0 notify("gotime");

  if (!isdefined(var_0._id_131F2))
  return;

  var_3 = _id_1F00(self, var_1);

  if (isdefined(var_3._id_B6BD))
  return;

  if (isdefined(var_3._id_92D5) && isdefined(var_3._id_92D0))
  thread _id_5BC9(var_0, var_1);

  for (;;) {
  var_0 notify("idle");
  _id_CDAA(var_0, var_3);
  }
}

_id_CDAA(var_0, var_1) {
  if (isdefined(var_0._id_131F3)) {
  _id_1FC2(var_0, var_1._id_10220, var_0._id_131F3);
  return;
  }

  if (isdefined(var_1._id_92F6)) {
  var_2 = _id_DCBF(var_0, var_1._id_92F6);
  _id_1FC2(var_0, var_1._id_10220, var_0._id_131F2[var_2]);
  return;
  }

  if (isdefined(var_0._id_D3E2) && isdefined(var_1._id_D0E8)) {
  _id_1FC2(var_0, var_1._id_10220, var_1._id_D0E8);
  return;
  }

  if (isdefined(var_1._id_131F2))
  thread _id_F642(var_1._id_131F2);

  _id_1FC2(var_0, var_1._id_10220, var_0._id_131F2);
}

_id_DCBF(var_0, var_1) {
  var_2 = [];
  var_3 = 0;

  for (var_4 = 0; var_4 < var_1.size; var_4++) {
  var_3 = var_3 + var_1[var_4];
  var_2[var_4] = var_3;
  }

  var_5 = randomint(var_3);

  for (var_4 = 0; var_4 < var_1.size; var_4++) {
  if (var_5 < var_2[var_4])
  return var_4;
  }
}

_id_876A(var_0) {
  self endon("death");
  self._id_12BD0 = scripts\engine\utility::_id_2279(self._id_12BD0, var_0);
  var_0 scripts\engine\utility::waittill_any("death", "jumpedout");
  self._id_12BD0 = scripts\engine\utility::array_remove(self._id_12BD0, var_0);

  if (!self._id_12BD0.size) {
  _id_0B91::_id_65E1("unloaded");
  self._id_12BBC = "default";
  }
}

_id_E4FC(var_0) {
  if (!self._id_E4FB.size)
  return 0;

  for (var_1 = 0; var_1 < self._id_E4FB.size; var_1++) {
  if (!isalive(self._id_E4FB[var_1]) && !isdefined(self._id_E4FB[var_1]._id_9FEF))
  continue;

  if (_id_3DD9(self._id_E4FB[var_1]._id_1321D, var_0))
  return 1;
  }

  return 0;
}

_id_7D2F() {
  var_0 = [];
  var_1 = [];
  var_2 = "default";

  if (isdefined(self._id_12BBC))
  var_2 = self._id_12BBC;

  var_1 = level.vehicle._id_116CE._id_12BCF[self.classname][var_2];

  if (!isdefined(var_1))
  var_1 = level.vehicle._id_116CE._id_12BCF[self.classname]["default"];

  foreach (var_4 in var_1)
  var_0[var_4] = var_4;

  return var_0;
}

_id_3DD9(var_0, var_1) {
  if (!isdefined(var_1))
  var_1 = self._id_12BBC;

  var_2 = self.classname;

  if (!isdefined(level.vehicle._id_116CE._id_12BCF[var_2]))
  return 1;

  if (!isdefined(level.vehicle._id_116CE._id_12BCF[var_2][var_1]))
  return 1;

  var_3 = level.vehicle._id_116CE._id_12BCF[var_2][var_1];

  for (var_4 = 0; var_4 < var_3.size; var_4++) {
  if (var_0 == var_3[var_4])
  return 1;
  }

  return 0;
}

_id_8038(var_0, var_1, var_2) {
  self endon("unloading");

  for (;;)
  _id_1FC2(var_0, var_1, var_2);
}

_id_8037(var_0, var_1, var_2, var_3, var_4) {
  var_5 = self.classname;

  if (var_4) {
  thread _id_8038(var_1, var_2, level.vehicle._id_116CE._id_247D[var_5][var_0._id_6B9D]._id_92F3);
  self waittill("unloading");
  }

  self._id_12BD0 = scripts\engine\utility::_id_2279(self._id_12BD0, var_1);
  thread _id_8034(var_1, var_2, var_3);

  if (!isdefined(self._id_4828))
  _id_1FC2(var_1, var_2, var_3);

  var_1 unlink();

  if (!isdefined(self)) {
  var_1 delete();
  return;
  }

  self._id_12BD0 = scripts\engine\utility::array_remove(self._id_12BD0, var_1);

  if (!self._id_12BD0.size)
  self notify("unloaded");

  self._id_6B9D[var_0._id_6B9D] = undefined;
  wait 10;
  var_1 delete();
}

_id_8036() {
  wait 0.05;

  while (isalive(self) && self._id_12BD0.size > 2)
  wait 0.05;

  if (!isalive(self) || isdefined(self._id_4828) && self._id_4828)
  return;

  self notify("getoutrig_disable_abort");
}

_id_8035() {
  self endon("end_getoutrig_abort_while_deploying");

  while (!isdefined(self._id_4828))
  wait 0.05;

  var_0 = [];

  foreach (var_2 in self._id_E4FB) {
  if (isalive(var_2))
  scripts\engine\utility::_id_1756(var_0, var_2);
  }

  _id_0B91::_id_228A(var_0);
  self notify("crashed_while_deploying");
  var_0 = undefined;
}

_id_8034(var_0, var_1, var_2) {
  var_3 = getanimlength(var_2);
  var_4 = var_3 - 1.0;

  if (self._id_0380 == "mi17")
  var_4 = var_3 - 0.5;

  var_5 = 2.5;
  self endon("getoutrig_disable_abort");
  thread _id_8036();
  thread _id_8035();
  scripts\engine\utility::_id_137B7("crashed_while_deploying", var_5);
  self notify("end_getoutrig_abort_while_deploying");

  while (!isdefined(self._id_4828))
  wait 0.05;

  thread _id_1FC2(var_0, var_1, var_2);
  waittillframeend;
  var_0 _meth_82B0(var_2, var_4 / var_3);
  var_6 = self;

  if (isdefined(self._id_C720))
  var_6 = self._id_C720;

  for (var_7 = 0; var_7 < self._id_E4FB.size; var_7++) {
  if (!isdefined(self._id_E4FB[var_7]))
  continue;

  if (!isdefined(self._id_E4FB[var_7]._id_DC19))
  continue;

  if (self._id_E4FB[var_7]._id_DC19 != 1)
  continue;

  if (!isdefined(self._id_E4FB[var_7]._id_E500))
  continue;

  self._id_E4FB[var_7]._id_72C4 = 1;

  if (isalive(self._id_E4FB[var_7]))
  thread _id_1FC4(self._id_E4FB[var_7], self, var_6);
  }
}

_id_F642(var_0, var_1) {
  self endon("death");
  self endon("dont_clear_anim");

  if (!isdefined(var_1))
  var_1 = 1;

  var_2 = getanimlength(var_0);
  self endon("death");
  self _meth_82EA("vehicle_anim_flag", var_0);
  wait(var_2);

  if (var_1)
  self _meth_806F(var_0, 0);
}

#using_animtree("generic_human");

_id_802F(var_0, var_1, var_2) {
  if (!isdefined(var_2))
  var_2 = 1;

  var_3 = self.classname;
  var_4 = _id_1F00(self, var_1);

  if (isdefined(self._id_2465) && isdefined(self._id_2465[var_4._id_6B9D]))
  var_5 = 1;
  else
  var_5 = 0;

  if (!isdefined(var_4._id_6B9D) || isdefined(self._id_6B9D[var_4._id_6B9D]) || var_5)
  return;

  var_6 = var_0 gettagorigin(level.vehicle._id_116CE._id_247D[var_3][var_4._id_6B9D]._id_02DD);
  var_7 = var_0 gettagangles(level.vehicle._id_116CE._id_247D[var_3][var_4._id_6B9D]._id_02DD);
  self._id_6B9E[var_4._id_6B9D] = 1;
  var_8 = spawn("script_model", var_6);
  var_8.angles = var_7;
  var_8.origin = var_6;
  var_8 setmodel(level.vehicle._id_116CE._id_247D[var_3][var_4._id_6B9D]._id_01F1);
  self._id_6B9D[var_4._id_6B9D] = var_8;
  var_8 _meth_83D0(#animtree);
  var_8 linkto(var_0, level.vehicle._id_116CE._id_247D[var_3][var_4._id_6B9D]._id_02DD, (0, 0, 0), (0, 0, 0));
  thread _id_8037(var_4, var_8, level.vehicle._id_116CE._id_247D[var_3][var_4._id_6B9D]._id_02DD, level.vehicle._id_116CE._id_247D[var_3][var_4._id_6B9D]._id_5D1B, var_2);
  return var_8;
}

_id_3DCC(var_0) {
  if (!isdefined(self._id_10471))
  self._id_10471 = [];

  var_1 = 0;

  if (!isdefined(self._id_10471[var_0]))
  self._id_10471[var_0] = 1;
  else
  var_1 = 1;

  thread _id_3DCD(var_0);
  return var_1;
}

_id_3DCD(var_0) {
  wait 0.05;

  if (!isdefined(self))
  return;

  self._id_10471[var_0] = 0;
  var_1 = getarraykeys(self._id_10471);

  for (var_2 = 0; var_2 < var_1.size; var_2++) {
  if (self._id_10471[var_1[var_2]])
  return;
  }

  self._id_10471 = undefined;
}

_id_8766(var_0, var_1) {
  var_2 = 0;

  if (isdefined(var_0._id_9FEF))
  var_2 = 1;

  var_3 = _id_1F00(self, var_1);
  var_4 = self._id_0380;

  if (!_id_3DD9(var_1)) {
  thread _id_8744(var_0, var_1);
  return;
  }

  if (!isdefined(var_3._id_8028)) {
  thread _id_8744(var_0, var_1);
  return;
  }

  thread _id_876A(var_0);
  self endon("death");

  if (isai(var_0) && isalive(var_0))
  var_0 endon("death");

  var_5 = 0;

  if (isdefined(var_0._id_8020)) {
  var_6 = var_0 [[var_0._id_8020]]();

  if (isdefined(var_6) && var_6)
  var_5 = 1;
  }

  if (isdefined(var_0._id_C584)) {
  var_0._id_C584 = undefined;

  if (isdefined(var_0._id_8020))
  var_0 [[var_0._id_8020]]();
  }

  var_7 = _id_7DC5();

  if (isdefined(var_3._id_131E6)) {
  var_7 thread _id_F642(var_3._id_131E6, var_3._id_131E7);
  var_8 = 0;

  if (isdefined(var_3._id_131E9)) {
  var_8 = _id_3DCC(var_3._id_131E9);
  var_9 = var_7 gettagorigin(var_3._id_131E9);
  }
  else
  var_9 = var_7.origin;

  if (isdefined(var_3._id_131E8) && !var_8)
  _func_178(var_3._id_131E8, var_9);

  var_8 = undefined;
  }

  var_10 = 0;

  if (isdefined(var_3._id_8032))
  var_10 = var_10 + getanimlength(var_3._id_8032);

  if (isdefined(var_3._id_50AE))
  var_10 = var_10 + var_3._id_50AE;

  if (isdefined(var_0._id_50AE))
  var_10 = var_10 + var_0._id_50AE;

  if (var_10 > 0) {
  thread _id_8744(var_0, var_1);
  wait(var_10);
  }

  var_0._id_4E2A = undefined;
  var_0._id_4E2E = undefined;
  var_0 notify("newanim");

  if (isdefined(var_3._id_2AB6) && !var_3._id_2AB6) {
  if (!isdefined(var_0._id_5531))
  var_0 _id_0B91::_id_86E2();
  }

  if (isai(var_0))
  var_0 _meth_8250(1);

  if (isdefined(var_3._id_2BE8))
  var_5 = 1;
  else if (!isdefined(var_3._id_8028) || !isdefined(self._id_EEFD) && (isdefined(var_3._id_2B10) && var_3._id_2B10) || isdefined(self._id_EDF4) && var_1 == 0) {
  thread _id_8744(var_0, var_1);
  return;
  }

  if (var_0 _id_FF4D())
  var_0.health = var_0._id_C6F8;

  var_0._id_C6F8 = undefined;

  if (isai(var_0) && isalive(var_0))
  var_0 endon("death");

  var_0._id_0030 = 0;

  if (isdefined(var_3._id_6981))
  var_11 = var_3._id_6981;
  else
  var_11 = var_3._id_10220;

  if (isdefined(var_0._id_7B54))
  var_12 = var_0._id_7B54;
  else if (_id_0B91::_id_65DB("landed") && isdefined(var_3._id_802E))
  var_12 = var_3._id_802E;
  else if (isdefined(var_0._id_D3E2) && isdefined(var_3._id_D098))
  var_12 = var_3._id_D098;
  else
  var_12 = var_3._id_8028;

  if (!var_5) {
  thread _id_8765(var_0);

  if (isdefined(var_3._id_6B9D)) {
  if (!isdefined(self._id_6B9D[var_3._id_6B9D])) {
  thread _id_8744(var_0, var_1);
  var_13 = _id_802F(var_7, var_0._id_1321D, 0);
  }
  }

  if (isdefined(var_3._id_8039))
  var_0 thread _id_0B91::_id_CE31(var_3._id_8039, "J_Wrist_RI", 1);

  if (isdefined(var_0._id_D3E2) && isdefined(var_3._id_D099))
  var_0 thread _id_0B91::_id_CE2F(var_3._id_D099);

  if (isdefined(var_3._id_8033))
  var_0 thread _id_0B91::_id_CD81(var_3._id_8033);

  if (isdefined(var_0._id_D3E2) && isdefined(var_3._id_D09B))
  level.player thread scripts\engine\utility::_id_CD7F(var_3._id_D09B);

  var_0 notify("newanim");
  var_0 notify("jumping_out");
  var_14 = 0;

  if (!isai(var_0) && !var_2)
  var_14 = 1;

  if (!isdefined(var_0._id_EECD) && !var_2)
  var_0 = _id_872C(var_0, var_1);

  if (!isalive(var_0) && !var_2)
  return;

  if (!var_2)
  var_0._id_DC19 = 1;

  if (isdefined(var_3._id_DC19)) {
  var_0._id_DC19 = 1;

  if (isdefined(var_3._id_DC17))
  var_0._id_DC17 = var_3._id_DC17;
  }

  if (var_14) {
  self._id_E4FB = scripts\engine\utility::_id_2279(self._id_E4FB, var_0);
  thread _id_8731(var_0, var_1);
  thread _id_876A(var_0);
  var_0._id_E500 = self;
  }

  if (isai(var_0))
  var_0 endon("death");

  var_0 notify("newanim");
  var_0 notify("jumping_out");

  if (isdefined(var_3._id_AD88) && var_3._id_AD88)
  thread _id_10B38(var_0);

  if (isdefined(var_3._id_8030)) {
  _id_1FC2(var_0, var_11, var_12);
  var_15 = var_11;

  if (isdefined(var_3._id_8031))
  var_15 = var_3._id_8031;

  _id_1FC2(var_0, var_15, var_3._id_8030);
  } else {
  var_16 = 0;

  if (isdefined(var_3._id_802D) && isdefined(var_3._id_802C)) {
  thread _id_8767(var_0, var_11, var_3._id_8028, var_3._id_802D, var_3._id_802C);
  var_16 = 1;
  }
  else if (!var_2)
  var_0._id_1EB4 = 1;

  _id_1FC2(var_0, var_11, var_12);

  if (var_16)
  var_0 waittill("hoverunload_done");
  }

  if (isdefined(var_0._id_D3E2) && isdefined(var_3._id_D09B))
  level.player thread scripts\engine\utility::_id_11018(var_3._id_D09B);

  if (isdefined(var_3._id_8033))
  var_0 thread scripts\engine\utility::_id_11018(var_3._id_8033);

  if (isdefined(var_0._id_D3E2) && isdefined(var_3._id_D09A))
  level.player thread _id_0B91::_id_CE2F(var_3._id_D09A);
  }
  else if (!isai(var_0)) {
  if (var_0._id_5BF2 == 1) {
  var_0 delete();
  return;
  }

  var_0 = _id_0B77::_id_10869(var_0);
  }

  self._id_E4FB = scripts\engine\utility::array_remove(self._id_E4FB, var_0);
  self._id_1307E[var_1] = 0;
  var_0._id_E500 = undefined;
  var_0._id_5BD6 = undefined;

  if (!isalive(self) && !isdefined(var_3._id_12BC8)) {
  var_0 delete();
  return;
  }

  var_0 unlink();

  if (!isdefined(var_0._id_B14F))
  var_0._id_0030 = 1;

  if (isalive(var_0) || var_2) {
  if (isai(var_0))
  var_0._id_1491._id_55FC = !var_0 isbadguy();

  var_0._id_72AE = undefined;
  var_0 notify("jumpedout");

  if (isai(var_0)) {
  if (isdefined(var_3._id_803A)) {
  var_0._id_5270 = var_3._id_803A;
  var_0 _meth_800B("crouch");
  var_0 thread scripts\anim\utility::_id_12E5F();
  var_0 _meth_800B("stand", "crouch", "prone");
  }

  var_0 _meth_8250(0);

  if (_id_8750(var_0)) {
  var_0._id_015C = 600;
  var_0 _meth_82EF(var_0.origin);
  }
  }
  else if (var_2) {
  var_0._id_1356F.origin = var_0.origin;
  var_0._id_1356F.angles = var_0.angles;

  if (isdefined(var_0._id_1356F._id_0334))
  var_0._id_1356F _id_0B93::_id_1080B();
  else
  var_17 = var_0._id_1356F _id_0B91::_id_10808();

  var_0 delete();
  }
  }

  if (isdefined(var_0.script_noteworthy) && var_0.script_noteworthy == "delete_after_unload") {
  var_0 delete();
  return;
  }

  if (isdefined(var_3._id_802A) && var_3._id_802A) {
  var_0 delete();
  return;
  }

  var_0 _id_872E();
}

_id_8767(var_0, var_1, var_2, var_3, var_4) {
  var_5 = self gettagorigin(var_1);
  var_6 = self gettagangles(var_1);
  var_7 = _func_0CE(var_5, var_6, var_2);
  var_8 = _func_0CD(var_5, var_6, var_2);
  var_9 = getmovedelta(var_2, 0, 1);
  var_10 = scripts\engine\utility::_id_107E6();
  var_10.origin = var_7;
  var_10.angles = var_8;
  var_11 = var_10 localtoworldcoords(var_9);
  var_10 thread _id_0B91::_id_5184("movedone");
  var_12 = var_11;
  var_13 = _id_0B91::_id_864C(var_12);
  var_14 = _func_0CE(var_5, var_6, var_4);
  var_9 = getmovedelta(var_4, 0, 1);
  var_15 = var_14 + var_9;
  var_16 = var_14[2] - var_15[2];
  var_17 = var_13 + (0, 0, var_16);
  var_0 _id_0B91::_id_F2A8(0);
  var_0 setcandamage(0);
  var_0 endon("death");
  wait(getanimlength(var_2) - 0.1);
  var_0 unlink();
  var_0 notify("animontag_thread");
  var_0 _meth_83A1();
  var_10.origin = var_0.origin;
  var_10.angles = var_0.angles;
  var_10 dontinterpolate();
  var_0 dontinterpolate();
  var_0 linkto(var_10, "tag_origin", (0, 0, 0), (0, 0, 0));
  var_0 _id_0B91::_id_F2A8(1);
  var_0 setcandamage(1);
  var_0._id_12BC4 = var_3;

  if (isai(var_0))
  var_0 _id_0A1E::_id_2307(::_id_873D, ::_id_873E);
  else
  var_0 thread _id_873D();

  var_18 = length((0, 0, var_17[2]) - (0, 0, var_12[2]));
  var_19 = 350;
  var_20 = var_18 / var_19;
  var_10 moveto(var_17, var_20);
  var_10 waittill("movedone");
  var_0 unlink();
  var_0 _meth_8018("dropship_land", var_0.origin, var_0.angles, var_4);
  wait(getanimlength(var_4));
  var_0 notify("hoverunload_done");
  var_0 notify("anim_on_tag_done");
}

_id_873D() {
  if (isai(self)) {
  if (scripts\engine\utility::_id_167E())
  self _meth_8221("face angle 3d", self.angles);
  else
  self _meth_8221("face angle", self.angles[1]);

  self _meth_806F(_id_0A1E::_id_2339(), 0.2);
  }

  self _meth_82A2(self._id_12BC4, 1);
  self waittill("dropship_land");
}

_id_873E() {}

_id_8750(var_0) {
  if (isdefined(var_0._id_ED53))
  return 0;

  if (var_0 _id_0B91::_id_8B6C())
  return 0;

  if (isdefined(var_0._id_DB41))
  return 0;

  if (!isdefined(var_0._id_0334))
  return 1;

  var_1 = getnodearray(var_0._id_0334, "targetname");
  var_2 = scripts\engine\utility::_id_8180(var_0._id_0334, "targetname");

  if (var_1.size > 0 || var_2.size > 0)
  return 0;

  var_3 = getent(var_0._id_0334, "targetname");

  if (isdefined(var_3) && var_3.classname == "info_volume")
  return 0;

  return 1;
}

_id_1FC2(var_0, var_1, var_2, var_3, var_4, var_5) {
  var_0 notify("animontag_thread");
  var_0 endon("animontag_thread");

  if (!isdefined(var_5))
  var_5 = "animontagdone";

  if (isdefined(self._id_B91E))
  var_6 = self._id_B91E;
  else
  var_6 = self;

  if (!isdefined(var_1)) {
  var_7 = var_0.origin;
  var_8 = var_0.angles;
  } else {
  var_7 = var_6 gettagorigin(var_1);
  var_8 = var_6 gettagangles(var_1);
  }

  if (isdefined(var_0._id_DC19) && !isdefined(var_0._id_C01B))
  level thread _id_1FC3(var_0, self);

  var_0 _meth_8018(var_5, var_7, var_8, var_2);

  if (isai(var_0))
  thread _id_592B(var_0, var_6, var_5);

  if (isdefined(var_0._id_1EB4)) {
  var_0._id_1EB4 = undefined;
  var_9 = getanimlength(var_2) - 0.25;

  if (var_9 > 0)
  wait(var_9);

  if (getdvarint("ai_iw7", 0) == 1)
  var_0 _id_0A1E::_id_2386();

  var_0._id_0190 = 0;
  var_0 thread _id_DDFA();
  } else {
  if (isdefined(var_3)) {
  for (var_10 = 0; var_10 < var_3.size; var_10++) {
  var_0 waittillmatch(var_5, var_3[var_10]);
  var_0 thread [[var_4[var_10]]]();
  }
  }

  var_0 waittillmatch(var_5, "end");
  }

  var_0 notify("anim_on_tag_done");
  var_0._id_DC19 = undefined;
}

_id_DDFA() {
  self endon("death");
  wait 2;

  if (self._id_0190 == 0)
  self._id_0190 = 80;
}

_id_1FC3(var_0, var_1) {
  if (isdefined(var_0._id_B14F) && var_0._id_B14F)
  return;

  if (!isai(var_0))
  var_0 setcandamage(1);

  var_0 endon("anim_on_tag_done");
  var_2 = undefined;
  var_3 = undefined;
  var_4 = var_1.health <= 0;

  for (;;) {
  if (!var_4 && !(isdefined(var_1) && var_1.health > 0))
  break;

  var_0 waittill("damage", var_2, var_3);

  if (isdefined(var_0._id_72C4))
  break;

  if (!isdefined(var_2))
  continue;

  if (var_2 < 1)
  continue;

  if (!isdefined(var_3))
  continue;

  if (isplayer(var_3))
  break;
  }

  if (!isalive(var_0))
  return;

  thread _id_1FC4(var_0, var_1, var_3);
}

_id_1FC4(var_0, var_1, var_2) {
  var_0._id_4E2A = undefined;
  var_0._id_4E46 = undefined;
  var_0._id_1EB2 = 1;

  if (isdefined(var_0._id_DC17)) {
  var_3 = getmovedelta(var_0._id_DC17, 0, 1);
  var_4 = _func_16D(var_0.origin + (0, 0, 16), var_0.origin - (0, 0, 10000));
  var_5 = distance(var_0.origin + (0, 0, 16), var_4);

  if (abs(var_3[2] + 16) <= abs(var_5)) {
  var_0 thread _id_0B91::_id_CE2F("generic_death_falling");
  var_0 _meth_8018("fastrope_fall", var_0.origin, var_0.angles, var_0._id_DC17);
  var_0 waittillmatch("fastrope_fall", "start_ragdoll");
  }
  }

  if (!isdefined(var_0))
  return;

  var_0._id_4E2A = undefined;
  var_0._id_4E46 = undefined;
  var_0._id_1EB2 = 1;
  var_0 notify("rope_death", var_2);
  var_0 _meth_81D0(var_2.origin, var_2);

  if (isdefined(var_0._id_EECD)) {
  var_0 notsolid();
  var_6 = getweaponmodel(var_0.weapon);
  var_7 = var_0.weapon;

  if (isdefined(var_6)) {
  var_0 _meth_8096(var_6, "tag_weapon_right");
  var_8 = var_0 gettagorigin("tag_weapon_right");
  var_9 = var_0 gettagangles("tag_weapon_right");
  level._id_86C1 = spawn("weapon_" + var_7, (0, 0, 0));
  level._id_86C1.angles = var_9;
  level._id_86C1.origin = var_8;
  }
  }
  else
  var_0 scripts\anim\shared::_id_5D1A();

  if (isdefined(var_0._id_71C8))
  var_0 [[var_0._id_71C8]]();

  var_0 startragdoll();
}

_id_592B(var_0, var_1, var_2) {
  var_0 endon("newanim");
  var_1 endon("death");
  var_0 endon("death");
  var_0 scripts\anim\shared::_id_592B(var_2);
}

_id_1F9D(var_0, var_1, var_2, var_3) {
  var_0 _meth_8018("movetospot", var_1, var_2, var_3);
  var_0 waittillmatch("movetospot", "end");
}

_id_876B(var_0, var_1, var_2) {
  if (!isalive(var_0))
  return;

  if (isdefined(self._id_C011))
  return;

  var_3 = _id_1F00(self, var_0._id_1321D);
  var_0._id_131AE = var_1;

  if (isdefined(var_3._id_69DF))
  return _id_872D(var_0);

  if (isdefined(level.vehicle._id_116CE._id_E4F9) && isdefined(level.vehicle._id_116CE._id_E4F9[self.classname])) {
  self [[level.vehicle._id_116CE._id_E4F9[self.classname]]]();
  return;
  }

  if (isdefined(var_3._id_12BC8) && isdefined(self)) {
  if (isdefined(self._id_5970) && self._id_5970)
  return;

  thread _id_8744(var_0, var_0._id_1321D, 1);
  wait(var_3._id_12BC8);

  if (isdefined(var_0) && isdefined(self)) {
  self._id_86A1 = var_0._id_1321D;
  _id_1F74("unload");
  }

  return;
  }

  if (isdefined(var_0)) {
  if (isdefined(var_0._id_DC19) && var_2 != "bm21_troops")
  return;

  [[level._id_83D9]]("MOD_RIFLE_BULLET", "torso_upper", var_0.origin);

  if (var_2 == "bm21_troops") {
  var_0._id_0030 = 1;
  var_0 _meth_81D0();
  return;
  }

  var_0 delete();
  }
}

_id_19F9() {
  self endon("death");
  self waittill("loaded");
  _id_0B98::_id_845A(self);
}

_id_F554(var_0, var_1) {
  var_2 = var_0._id_EEC9;

  if (isdefined(var_0._id_72AE))
  var_2 = var_0._id_72AE;

  if (isdefined(var_2))
  return var_2;

  for (var_3 = 0; var_3 < self._id_1307E.size; var_3++) {
  if (self._id_1307E[var_3])
  continue;

  if (isdefined(var_0._id_9FEF) && !isdefined(var_1[var_3]._id_9FEF))
  continue;

  if (!isdefined(var_0._id_9FEF) && isdefined(var_1[var_3]._id_9FEF))
  continue;

  return var_3;
  }

  if (var_0._id_9FEF)
  return;

  return;
}

_id_874C(var_0, var_1, var_2) {
  var_3 = _id_1F00(self, var_1);
  var_4 = self._id_B6BD[var_3._id_B6BD];

  if (!isalive(var_0))
  return;

  var_4 endon("death");
  var_0 endon("death");

  if (isdefined(var_2) && var_2 && isdefined(var_3._id_C939))
  [[var_3._id_C939]](self, var_0, var_1, var_4);

  _id_0B96::_id_F5D8(var_4);
  var_4 setdefaultdroppitch(0);
  wait 0.1;
  var_0 endon("guy_man_turret_stop");
  level thread _id_0B4F::_id_B6A7(var_4, _id_0B91::_id_7E72());
  var_4 _meth_8359(1);
  var_5 = "stand";

  if (isdefined(var_3._id_12A80))
  var_5 = var_3._id_12A80;

  var_0 _id_0B91::_id_13035(var_4, var_5);
}

_id_8765(var_0) {
  var_0 endon("jumpedout");
  var_0 waittill("death");

  if (isdefined(var_0))
  var_0 unlink();
}

_id_872D(var_0) {
  if (!isdefined(var_0._id_1321D))
  return;

  var_1 = var_0._id_1321D;
  var_2 = _id_1F00(self, var_1);

  if (!isdefined(var_2._id_69DF))
  return;

  [[level._id_83D9]]("MOD_RIFLE_BULLET", "torso_upper", var_0.origin);
  var_0._id_4E2A = var_2._id_69DF;
  var_3 = self.angles;
  var_4 = var_0.origin;

  if (isdefined(var_2._id_69E0)) {
  var_4 = var_4 + anglestoforward(var_3) * var_2._id_69E0[0];
  var_4 = var_4 + anglestoright(var_3) * var_2._id_69E0[1];
  var_4 = var_4 + anglestoup(var_3) * var_2._id_69E0[2];
  }

  var_0 = _id_45EE(var_0);
  _id_538C(var_0, "weapon_");
  var_0 notsolid();
  var_0.origin = var_4;
  var_0.angles = var_3;
  var_0 _meth_8018("deathanim", var_4, var_3, var_2._id_69DF);
  var_5 = 0.3;

  if (isdefined(var_2._id_69E1))
  var_5 = var_2._id_69E1;

  var_6 = getanimlength(var_2._id_69DF);
  var_7 = gettime() + var_6 * 1000;
  wait(var_6 * var_5);
  var_8 = (0, 0, 1);
  var_9 = var_0.origin;

  if (getdvar("ragdoll_enable") == "0") {
  var_0 delete();
  return;
  }

  if (isai(var_0))
  var_0 scripts\anim\shared::_id_5D1A();
  else
  _id_538C(var_0, "weapon_");

  while (!var_0 _meth_81B7() && gettime() < var_7) {
  var_9 = var_0.origin;
  wait 0.05;
  var_8 = var_0.origin - var_9;

  if (isdefined(var_0._id_71C8))
  var_0 [[var_0._id_71C8]]();

  var_0 startragdoll();
  }

  wait 0.05;
  var_8 = var_8 * 20000;

  for (var_10 = 0; var_10 < 3; var_10++) {
  if (isdefined(var_0))
  var_9 = var_0.origin;

  wait 0.05;
  }

  if (!var_0 _meth_81B7())
  var_0 delete();
}

_id_45EE(var_0, var_1) {
  if (!isdefined(var_1))
  var_1 = 0;

  var_2 = spawn("script_model", var_0.origin);
  var_2.angles = var_0.angles;
  var_2 setmodel(var_0._id_01F1);
  var_3 = var_0 getattachsize();

  for (var_4 = 0; var_4 < var_3; var_4++)
  var_2 attach(var_0 getattachmodelname(var_4), var_0 getattachtagname(var_4));

  var_2 _meth_83D0(#animtree);

  if (isdefined(var_0.team))
  var_2.team = var_0.team;

  if (!var_1)
  var_0 delete();

  var_2 _meth_81F2();
  return var_2;
}

_id_131A9(var_0, var_1) {
  self _meth_83D0(var_1);
  self _meth_82A2(var_0);
}

_id_131E5(var_0) {
  var_1 = _id_1F00(self, var_0);
  return _id_131E0(var_1._id_7F12, var_1._id_10220, var_0);
}

_id_131E0(var_0, var_1, var_2) {
  var_3 = spawnstruct();
  var_4 = undefined;
  var_5 = undefined;
  var_6 = self gettagorigin(var_1);
  var_7 = self gettagangles(var_1);
  var_4 = _func_0CE(var_6, var_7, var_0);
  var_5 = _func_0CD(var_6, var_7, var_0);
  var_3.origin = var_4;
  var_3.angles = var_5;
  var_3._id_1321D = var_2;
  return var_3;
}

_id_9C8A(var_0, var_1, var_2) {
  if (!isdefined(var_2))
  return 1;

  var_3 = var_0.classname;
  var_4 = level.vehicle._id_116CE._id_12BCF[var_3][var_2];

  foreach (var_6 in var_4) {
  if (var_6 == var_1)
  return 1;
  }

  return 0;
}

_id_7851(var_0) {
  var_1 = level.vehicle._id_116CE._id_1A03[self.classname];
  var_2 = [];
  var_3 = [];

  for (var_4 = 0; var_4 < self._id_1307E.size; var_4++) {
  if (self._id_1307E[var_4])
  continue;

  if (isdefined(var_1[var_4]._id_7F12) && _id_9C8A(self, var_4, var_0)) {
  var_2[var_2.size] = _id_131E5(var_4);
  continue;
  }

  var_3[var_3.size] = var_4;
  }

  var_5 = spawnstruct();
  var_5._id_26A3 = var_2;
  var_5._id_C07E = var_3;
  return var_5;
}

_id_7DC5() {
  if (isdefined(self._id_B91E))
  return self._id_B91E;
  else
  return self;
}

_id_538C(var_0, var_1) {
  var_2 = var_0 getattachsize();
  var_3 = [];
  var_4 = [];
  var_5 = 0;

  for (var_6 = 0; var_6 < var_2; var_6++) {
  var_7 = var_0 getattachmodelname(var_6);
  var_8 = var_0 getattachtagname(var_6);

  if (issubstr(var_7, var_1)) {
  var_3[var_5] = var_7;
  var_4[var_5] = var_8;
  }
  }

  for (var_6 = 0; var_6 < var_3.size; var_6++)
  var_0 _meth_8096(var_3[var_6], var_4[var_6]);
}

_id_FF4D() {
  if (!isai(self))
  return 0;

  if (!isdefined(self._id_C6F8))
  return 0;

  return !isdefined(self._id_B14F);
}

_id_10B38(var_0) {
  self waittill("stable_for_unlink");

  if (isalive(var_0))
  var_0 unlink();
}

_id_1F74(var_0) {
  var_1 = [];

  foreach (var_3 in self._id_E4FB) {
  if (isai(var_3) && !isalive(var_3))
  continue;

  if (isdefined(level.vehicle._id_1A02[var_0]) && ![[level.vehicle._id_1A02[var_0]]](var_3, var_3._id_1321D))
  continue;

  if (isdefined(level.vehicle._id_1A04[var_0])) {
  var_3 notify("newanim");
  var_3._id_DB8E = [];
  thread [[level.vehicle._id_1A04[var_0]]](var_3, var_3._id_1321D);
  var_1[var_1.size] = var_3;
  continue;
  }
  }

  return var_1;
}

_id_872E() {
  self._id_131F5 = undefined;
  self._id_10B71 = undefined;
  self._id_1321D = undefined;
  self._id_50AE = undefined;
}
