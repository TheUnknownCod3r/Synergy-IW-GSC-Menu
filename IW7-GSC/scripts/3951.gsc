/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3951.gsc
***************************************/

_id_DF0C() {
  scripts\aitypes\bt_util::init();
  _id_03A9::_id_DEE8();
  _id_0F37::_id_2371();
  thread _id_FAB0();
}

_id_FAB0() {
  level endon("game_ended");

  if (!isdefined(level._id_18EE))
  level waittill("scripted_agents_initialized");

  if (!isdefined(level._id_10970))
  level._id_10970 = [];

  level._id_10970["the_hoff"] = [];
  level._id_18EE["the_hoff"]["setup_func"] = ::_id_FA8A;
  level._id_18EE["the_hoff"]["setup_model_func"] = ::_id_FACE;
}

_id_FA8A() {
  self._id_0010 = 0.5;
  self._id_0202 = 0;
  self._id_0293 = 48;
  self._id_A8BA = 0;
  self._id_5277 = 500;
  self._id_5278 = 400;
  self._id_B4CD = 3000;
  self._id_110D7 = self._id_5277 + 100;
  self._id_01D3 = 67108864;
  self._id_272A = self._id_5278 - 100;
  self._id_B632 = 9216;
  self._id_B5F1 = 45;
  self._id_B5F4 = 45;
  self._id_B5F2 = 1.2;
  self._id_B4D9 = 50;
  self._id_B5D9 = 32;
  self._id_B628 = 300;
  self._id_B626 = 450;
  self._id_013C = 1000;
  self._id_013E = 1000;
  self._id_013D = 1000;
  self._id_1A44 = 50;
  _id_FAFE();
  thread _id_EF7F();
  thread _id_899D();
}

_id_FAFE() {
  self._id_3402 = ::_id_11562;
  self._id_3404 = [::_id_11562, ::_id_11559, ::_id_1156F, ::_id_1157B, ::_id_11570];
  self._id_3403 = [0, 47, 21, 21, 11];
}

_id_899D() {
  self endon("death");

  for (;;) {
  self waittill("enemy");

  for (;;) {
  if (isdefined(self._id_010C))
  self._id_6571 = gettime() + 1000;
  else if (isdefined(self._id_6571)) {
  if (gettime() > self._id_6571) {
  self._id_6571 = undefined;
  break;
  }
  }

  wait 0.25;
  }
  }
}

_id_11570() {
  var_0 = 70;
  var_1 = 15;

  if (isdefined(self._id_010C._id_18F4)) {
  var_0 = self._id_010C._id_18F4;
  var_1 = self._id_010C._id_18F9;
  }

  var_2 = var_0 * randomfloatrange(0.25, 0.35);
  var_3 = var_1 * 0.5;
  var_4 = var_3 * -1;
  var_5 = randomfloatrange(var_4, var_3);
  var_6 = anglestoright(self.angles);
  var_7 = (var_6[0] * var_5, var_6[1] * var_5, var_2);
  var_8 = self._id_010C.origin + var_7;
  return var_8;
}

_id_1157B() {
  var_0 = 70;
  var_1 = 15;

  if (isdefined(self._id_010C._id_18F4)) {
  var_0 = self._id_010C._id_18F4;
  var_1 = self._id_010C._id_18F9;
  }

  var_2 = var_0 * randomfloatrange(0.65, 0.75);
  var_3 = var_1 * 0.75;
  var_4 = anglestoright(self.angles);
  var_5 = (var_4[0] * var_3, var_4[1] * var_3, var_2);
  var_6 = self._id_010C.origin + var_5;
  return var_6;
}

_id_1156F() {
  var_0 = 70;
  var_1 = 15;

  if (isdefined(self._id_010C._id_18F4)) {
  var_0 = self._id_010C._id_18F4;
  var_1 = self._id_010C._id_18F9;
  }

  var_2 = var_0 * randomfloatrange(0.65, 0.75);
  var_3 = var_1 * -0.75;
  var_4 = anglestoright(self.angles);
  var_5 = (var_4[0] * var_3, var_4[1] * var_3, var_2);
  var_6 = self._id_010C.origin + var_5;
  return var_6;
}

_id_11559() {
  var_0 = 70;
  var_1 = 15;

  if (isdefined(self._id_010C._id_18F4)) {
  var_0 = self._id_010C._id_18F4;
  var_1 = self._id_010C._id_18F9;
  }

  var_2 = var_0 * randomfloatrange(0.65, 0.75);
  var_3 = var_1 * 0.5;
  var_4 = var_3 * -1;
  var_5 = randomfloatrange(var_4, var_3);
  var_6 = anglestoright(self.angles);
  var_7 = (var_6[0] * var_5, var_6[1] * var_5, var_2);
  var_8 = self._id_010C.origin + var_7;
  return var_8;
}

_id_11562() {
  var_0 = self._id_010C gettagorigin("j_head");
  return var_0;
}

_id_EF7F() {
  self endon("death");

  for (;;) {
  self waittill("goal_reached");

  if (isdefined(self._id_EF7D))
  var_0 = self._id_EF7D;
  else if (isdefined(self._id_EF7A))
  var_0 = self._id_EF7A.origin;
  else if (isdefined(self._id_EF7C))
  var_0 = self._id_EF7C.origin;
  else
  continue;

  var_1 = 16;

  if (isdefined(self._id_EF7E))
  var_1 = self._id_EF7E * self._id_EF7E;

  if (distance2dsquared(self.origin, var_0) <= var_1) {
  self._id_EF7D = undefined;
  self._id_EF7C = undefined;

  if (!isdefined(self._id_EF7B))
  self._id_EF7A = undefined;

  self notify("scriptedGoal_reached");
  }
  }
}

_id_F834(var_0, var_1) {
  if (!isdefined(var_1))
  var_1 = 0;

  self._id_EF79 = var_1;
  self._id_EF73 = var_0;
}

_id_F835(var_0, var_1) {
  self._id_EF7A = undefined;
  self._id_EF7B = undefined;
  self._id_EF7C = undefined;
  self._id_EF7D = var_0;
  self._id_EF7E = var_1;
}

_id_F833(var_0, var_1) {
  self._id_EF7D = undefined;
  self._id_EF7A = undefined;
  self._id_EF7B = undefined;
  self._id_EF7C = var_0;
  self._id_EF7E = var_1;
}

_id_F832(var_0, var_1, var_2) {
  self._id_EF7D = undefined;
  self._id_EF7C = undefined;
  self._id_EF7A = var_0;
  self._id_EF7E = var_1;

  if (isdefined(var_2) && var_2)
  self._id_EF7B = var_2;
  else
  self._id_EF7B = undefined;
}

_id_41D9() {
  if (isdefined(self._id_EF7D) || isdefined(self._id_EF7A) || isdefined(self._id_EF7C)) {
  self._id_EF7D = undefined;
  self._id_EF7A = undefined;
  self._id_EF7B = undefined;
  self._id_EF7C = undefined;
  self _meth_841F();
  }
}

_id_FACE(var_0) {
  self setmodel("body_zmb_hero_dj_agent");
}
