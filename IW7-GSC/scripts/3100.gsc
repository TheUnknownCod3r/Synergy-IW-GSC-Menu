/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3100.gsc
***************************************/

init() {
  if (!isdefined(level._id_A056._id_19FB))
  level._id_A056._id_19FB = ["spaceship_cannon_projectile", "spaceship_cleaver_projectile", "spaceship_anvil_projectile", "spaceship_30mm_projectile", "spaceship_30mm_growler", "spaceship_30mm_slow", "spaceship_cannon_projectile_weapupgrade", "spaceship_cleaver_projectile_weapupgrade", "spaceship_anvil_projectile_weapupgrade", "spaceship_30mm_projectile_weapupgrade", "spaceship_30mm_growler_weapupgrade", "spaceship_30mm_slow_weapupgrade", "spaceship_ai_30mm_projectile", "spaceship_forward_missile", "spaceship_homing_missile", "magic_spaceship_30mm_projectile", "magic_spaceship_20mm_bullet", "iw7_steeldragon"];

  self._id_4CF6 = [];
  self.health = 53800;
  self._id_4D30 = 0;
  thread _id_4D07();
  thread _id_4387();
  thread _id_4E13();
  thread _id_6170();
}

_id_D96C(var_0) {
  if (!isdefined(self._id_3135))
  return;

  self endon("death");
  self notify("pilot_remembers_attack");
  wait(randomfloatrange(0.2, 0.65));
  self._id_3135.attackerdata._id_24D3 = 1;
  self._id_3135.attackerdata.attacker = level._id_D127;
  self._id_3135.attackerdata._id_2535 = gettime();
  thread _id_72F9();
}

_id_72F9() {
  self notify("pilot_remembers_attack");
  self endon("pilot_remembers_attack");
  self endon("death");
  wait 4;
  self._id_3135.attackerdata._id_24D3 = 0;
  self._id_3135.attackerdata.attacker = undefined;
}

_id_FF27() {
  if (self._id_9B4C || self._id_9CB8)
  return 0;

  if (isdefined(self._id_843F) && self._id_843F)
  return 0;

  if (isdefined(self._id_51E6) && self._id_51E6)
  return 0;

  return 1;
}

_id_88C4() {
  self _meth_8555(0);
  wait 5.0;

  for (;;) {
  if (_func_2B4(self.origin, self)) {
  self _meth_8555(1);
  return;
  }

  wait 0.1;
  }
}

_id_4387() {
  self endon("death");
  var_0 = 50;
  var_1 = 300;
  var_2 = 200;
  var_3 = 4000;
  var_4 = 0;
  var_5 = 3;
  var_6 = 0;
  self._id_438E = -1000;
  self._id_438C = (0, 0, 0);

  for (;;) {
  self waittill("spaceship_collision", var_7, var_8, var_9, var_10, var_11, var_12);

  if (self._id_438E < 0 || gettime() > self._id_438E + 1000) {
  self._id_438E = gettime();
  self._id_438C = self.origin;
  continue;
  }
  else if (gettime() < self._id_438E + 500)
  continue;

  var_13 = distance(self._id_438C, self.origin) / (gettime() - self._id_438E) * 1000;
  self._id_438E = gettime();
  self._id_438C = self.origin;

  if (var_13 < 150.0) {
  self notify("jackal_stuck_on_geo");

  if (_id_FF27()) {
  self notify("death");
  return;
  }
  else
  _id_88C4();
  }

  wait 0.5;
  }
}

_id_4D07() {
  self endon("death");
  self endon("terminate_ai_threads");

  for (;;) {
  self waittill("damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9);
  self._id_4B43 = var_1;
  var_10 = _id_24DC(var_1);

  if (!var_10 && isdefined(level._id_D127) && var_1 == level._id_D127)
  thread _id_D96C(var_4);

  var_11 = _id_9D1C(var_9);
  var_12 = 0;

  if (isdefined(self._id_843F) && self._id_843F)
  var_12 = 1;

  var_13 = 0;

  if (isdefined(self._id_51E6) && self._id_51E6)
  var_13 = 1;

  if (!var_10 && var_11 && !var_12) {
  thread _id_4CF9(var_3, var_1);

  if (var_13)
  self.health = 53800;
  }
  else
  self.health = 53800;

  if (self.health < 50000) {
  self notify("death", var_1, var_4, var_9);
  self _meth_81D0();
  }

  thread _id_4D1B();
  }
}

_id_DFE7() {}

_id_4D1B() {
  if (isdefined(self._id_843F) && self._id_843F)
  return;

  if (isdefined(self._id_51E6) && self._id_51E6)
  return;

  self notify("new_regen");
  self endon("new_regen");
  self endon("death");
  wait 3;

  while (self.health < 53800) {
  self.health = self.health + 5;

  if (self.health > 1500 && self._id_4D30) {
  self._id_4D30 = 0;
  self notify("stop_damaged_fx");
  }

  wait 0.1;
  }

  if (self.health > 53800)
  self.health = 53800;
}

_id_24DC(var_0) {
  if (isdefined(var_0) && isdefined(var_0._id_EEDE) && isdefined(self._id_EEDE) && var_0._id_EEDE == self._id_EEDE)
  return 1;

  return 0;
}

_id_9D1C(var_0) {
  if (!isdefined(var_0))
  return 0;

  foreach (var_2 in level._id_A056._id_19FB) {
  if (var_2 == var_0)
  return 1;
  }

  return 0;
}

_id_4CF9(var_0, var_1) {
  var_2 = scripts\engine\utility::_id_107E6();
  var_2.origin = var_0;
  var_2.angles = self.angles;
  var_2 linkto(self, "j_mainroot_ship");
  playfxontag(scripts\engine\utility::_id_7ECB("fighter_spaceship_damage_med_linger"), var_2, "tag_origin");
  _id_0BDC::_id_13675(randomfloatrange(2, 4));

  if (isdefined(var_2))
  var_2 thread _id_10FF8();
}

_id_4D34(var_0, var_1) {
  _id_0B91::_id_75C4("fighter_spaceship_damaged", "j_mainroot_ship");
  scripts\engine\utility::_id_13762("death", "stop_damaged_fx");

  if (isdefined(self))
  _id_0B91::_id_75F8("fighter_spaceship_damaged", "j_mainroot_ship");
}

#using_animtree("jackal");

_id_4E13() {
  self endon("terminate_ai_threads");
  _id_4E11();
  self waittill("death", var_0, var_1, var_2);
  _id_0BDC::_id_1983();

  if (!isdefined(self))
  return;

  var_3 = self._id_02AC;
  var_4 = rotatevectorinverted(var_3, self.angles);
  var_5 = var_4[0];

  if (isdefined(self._id_862D))
  var_6 = self._id_862D;
  else
  var_6 = undefined;

  if (isdefined(self._id_90D1))
  var_7 = 1;
  else
  var_7 = 0;

  if (isdefined(self._id_3D4F))
  var_8 = 1;
  else
  var_8 = 0;

  if (isdefined(self._id_4B43) && isdefined(level._id_D127) && self._id_4B43 == level._id_D127) {
  var_8 = 0;
  level._id_A056._id_63A3++;
  var_9 = 1;
  }
  else
  var_9 = 0;

  _id_0B91::_id_65E1("is_dying");
  thread _id_646F();

  if (!isdefined(self))
  return;

  if (isdefined(self._id_700B)) {
  _id_A1DA();

  if (isdefined(self))
  self delete();

  return;
  }

  var_10 = spawn("script_model", self.origin);
  var_10.angles = self.angles;
  var_10 _meth_83D0(#animtree);
  var_10 linkto(self, "tag_origin", (0, 0, 0), (0, 0, 0));
  var_10 setmodel(self._id_01F1);
  var_11 = self._id_EEDE;

  if (var_9) {
  _id_56FF(var_10.origin, 5000, 39000, 0.24, 0.7);
  _func_178("jackal_deathspin_by_plr_init", var_10.origin);
  level.player playrumbleonentity("damage_light");
  }

  if (_id_FF6C(var_6, var_2, var_5)) {
  var_12 = [%jackal_death_01, %jackal_death_02, %jackal_death_03, %jackal_death_04];
  level._id_A8D7++;

  if (level._id_A8D7 >= var_12.size)
  level._id_A8D7 = 0;

  var_13 = var_12[level._id_A8D7];

  if (isdefined(self._id_72B1))
  var_13 = self._id_72B1;

  var_14 = _id_7819();
  var_10 _meth_82A2(%jackal_state_anims_ai);
  var_10 _meth_82A2(%jackal_ca_vehicle_strike_state_idle);
  var_10 thread _id_4E6C();
  var_10 _meth_82A2(%jackal_death_overlay);
  var_10 _meth_82A2(var_13);

  if (isdefined(self._id_93D2)) {
  foreach (var_16 in self._id_93D2) {
  if (isdefined(var_16))
  var_16._id_114F9 = var_10;
  }
  }

  var_10._id_C0A4 = 1;
  var_18 = _id_7B23(var_10);
  _id_5164();
  var_6 = _id_4E16(var_10, randomfloatrange(1.0, 2.0), var_18, self);
  stopfxontag(scripts\engine\utility::_id_7ECB("fighter_spaceship_dying"), var_10, "j_mainroot_ship");
  }
  else
  _id_5164();

  var_19 = var_10 gettagangles("j_mainroot_ship");
  var_20 = var_10 gettagorigin("j_mainroot_ship");

  if (isdefined(var_6) && isdefined(var_6["normal"])) {
  var_21 = vectortoangles(var_6["normal"]);
  playfx(scripts\engine\utility::_id_7ECB("fighter_spaceship_explosion_ground"), var_20, anglestoforward(var_21), anglestoup(var_21));
  } else {
  var_22 = _id_3E80(var_11, var_8, var_7, var_5);
  playfx(scripts\engine\utility::_id_7ECB(var_22), var_20, anglestoforward(var_19), anglestoup(var_19));
  }

  if (var_9) {
  _id_56FF(var_10.origin, 16000, 39000, 0.45, 1.1);

  if (!isdefined(self._id_C045))
  _func_178("jackal_death_by_plr", var_20);

  level.player playrumbleonentity("damage_heavy");
  }

  if (!isdefined(self._id_C045))
  thread scripts\engine\utility::_id_CE2B(_id_0BDC::_id_7A5B("jackal_explode"), var_20);

  if (scripts\engine\utility::_id_D11B())
  thread _id_107D8(var_20);

  var_10 delete();

  if (isdefined(self))
  self delete();
}

_id_7819() {
  if (self._id_02A9 == "fly")
  var_0 = "_fly";
  else
  var_0 = "_hover";

  if (level._id_241D)
  var_1 = "";
  else
  var_1 = "_space";

  return level._id_A065[self._id_EEDE + var_0 + var_1];
}

_id_5164() {
  level._id_A056._id_1630 = scripts\engine\utility::array_remove(level._id_A056._id_1630, self);

  if (isdefined(self))
  self delete();
}

_id_FF6C(var_0, var_1, var_2) {
  if (isdefined(var_0))
  return 0;

  if (isdefined(self._id_9930) && self._id_9930)
  return 0;

  if (isdefined(self._id_90D1) && self._id_90D1)
  return 0;

  if (isdefined(self._id_72B1))
  return 1;

  if (isdefined(var_1) && var_1 == "spaceship_cannon_projectile")
  return 0;

  if (_id_119DE(var_2))
  return 0;

  return 1;
}

_id_3E80(var_0, var_1, var_2, var_3) {
  if (var_1)
  return var_0 + "_spaceship_explosion_cheap";

  if (level._id_241D)
  var_4 = "";
  else
  var_4 = "_space";

  var_5 = var_0 + "_spaceship_explosion" + var_4;
  var_6 = var_0 + "_spaceship_explosion_hov" + var_4;

  if (_id_119DE(var_3))
  return var_6;

  if (var_2)
  return var_6;

  return var_5;
}

_id_119DE(var_0) {
  if (var_0 < 150)
  return 1;

  return 0;
}

_id_7B23(var_0) {
  var_1 = var_0.origin;
  wait 0.05;
  var_2 = distance(var_1, var_0.origin);
  return var_2;
}

_id_4E11() {
  if (!_id_0B91::_id_65DF("is_dying"))
  _id_0B91::_id_65E0("is_dying");

  if (!isdefined(level._id_A8D7))
  level._id_A8D7 = 0;
}

_id_646F() {
  self endon("entitydeleted");

  for (var_0 = 0; var_0 < 5; var_0++) {
  self notify("death");
  wait 0.05;
  }
}

_id_4E6C() {
  playfx(scripts\engine\utility::_id_7ECB("fighter_spaceship_dying_init"), self.origin, anglestoforward(self.angles), anglestoup(self.angles));
  playfxontag(scripts\engine\utility::_id_7ECB("fighter_spaceship_dying"), self, "J_mainroot_ship");
  var_0 = _id_0BDC::_id_7A5B("jackal_dying_loop");
  self playloopsound(var_0);
}

_id_4E16(var_0, var_1, var_2, var_3) {
  var_0 endon("entitydeleted");
  var_0 unlink();
  var_4 = undefined;

  while (var_1 > 0) {
  var_0.origin = var_0.origin + anglestoforward(var_0.angles) * var_2;
  var_4 = var_0 _id_C0A2(var_2, var_3);

  if (isdefined(var_4))
  var_1 = 0;

  var_1 = var_1 - 0.05;
  wait 0.05;
  }

  return var_4;
}

_id_C0A2(var_0, var_1) {
  var_2 = self gettagorigin("j_mainroot_ship");
  var_3 = self gettagangles("j_mainroot_ship");
  var_4 = var_2;
  var_5 = var_2 + anglestoforward(var_3) * (var_0 * 0.1);
  var_6 = scripts\engine\trace::_id_3A09(var_4, var_5, 150, 300, var_3, [self, var_1], undefined, 1);

  if (var_6["fraction"] < 1)
  return var_6;
}

_id_C0A3(var_0) {}

_id_6170() {
  self endon("terminate_ai_threads");
  self endon("death");
  self endon("entitydeleted");
  var_0 = 5;
  var_1 = 11;
  var_2 = 700;

  for (;;) {
  self waittill("emp", var_3, var_4, var_5);
  self._id_4B43 = var_5;
  var_6 = var_2 * var_3;
  var_7 = _id_0B4D::_id_6A8E(var_0, var_1, var_3);
  _id_0BDC::_id_19A0(1);
  var_8 = self._id_02A9;

  if (isdefined(self._id_7542._id_13D7E) && self._id_7542._id_13D7E) {
  var_9 = 1;
  _id_0BDC::_id_A167();
  }
  else
  var_9 = 0;

  _id_0BDC::_id_6B4C("none", 1);
  _id_0BDC::_id_105D9();
  self._id_615D._id_619D = 1;

  if (isdefined(self._id_EEDE) && isdefined(var_5._id_EEDE) && self._id_EEDE == var_5._id_EEDE) {} else {
  thread _id_6174(var_6, var_4, var_3);
  thread _id_614C(var_3);
  }

  wait(var_7);
  self._id_615D._id_619D = 0;

  if (self._id_AEDF._id_AEEA)
  _id_0BDC::_id_105D6();

  self notify("emp_complete");
  _id_0BDC::_id_19A0(0);
  _id_0BDC::_id_6B4C(var_8, 1);
  self unlink();

  if (var_9)
  _id_0BDC::_id_A19F();
  }
}

_id_614C(var_0) {
  var_1 = 2;
  var_2 = 0.5;
  var_3 = _id_0B4D::_id_6A8E(var_2, var_1, var_0);
  thread _id_0BDC::_id_D527("jackal_enemy_emp", self.origin, var_3);
}

_id_6174(var_0, var_1, var_2) {
  self endon("emp_complete");
  self endon("death");
  self endon("entitydeleted");
  var_3 = self.origin;
  wait 0.05;
  var_4 = self.origin - var_3;
  var_5 = 0.8;
  var_6 = _id_7D20(var_2);
  var_7 = 0;
  var_8 = 400;
  var_9 = 3;
  var_10 = scripts\engine\utility::_id_107E6(self.origin, self.angles);
  self._id_4074 = scripts\engine\utility::_id_2279(self._id_4074, var_10);
  self linkto(var_10);

  for (;;) {
  wait 0.05;
  var_7 = var_7 - var_9;

  if (var_7 > var_8)
  var_7 = var_8;

  var_11 = var_1 * var_0;
  var_12 = var_4 + var_11 + (0, 0, var_7);
  var_10 _id_6175(var_6);
  var_10.origin = var_10.origin + var_12;
  var_13 = _id_C0A2(length(var_12));

  if (isdefined(var_13))
  break;

  var_0 = var_0 * var_5;

  if (var_0 < 0)
  var_0 = 0;
  }

  var_10 delete();
  self._id_4074 = scripts\engine\utility::array_remove(self._id_4074, var_10);
  _id_0BDC::_id_A066(var_13);
}

_id_7D20(var_0) {
  var_1 = _id_0B4D::_id_6A8E(4, 13, var_0);
  var_2 = (randomfloatrange(0.1, 1), randomfloatrange(0.1, 1), randomfloatrange(0.1, 1));
  return vectornormalize(var_2) * var_1;
}

_id_6175(var_0) {
  self.angles = _func_048(self.angles, var_0);
}

_id_10FF8() {
  stopfxontag(scripts\engine\utility::_id_7ECB("fighter_spaceship_damage_med_linger"), self, "tag_origin");
  wait 6;

  if (isdefined(self))
  self delete();
}

_id_56FF(var_0, var_1, var_2, var_3, var_4) {
  var_5 = distance(var_0, level._id_D127.origin);
  var_6 = _id_0B4D::_id_C097(var_1, var_2, var_5);
  var_7 = _id_0B4D::_id_6A8E(var_3, 0.02, var_6);
  var_8 = _id_0B4D::_id_6A8E(var_4, 0.3, var_6);
  earthquake(var_7, 0.9, level._id_D127.origin, 8000);
}

_id_107D8(var_0) {
  var_1 = 5;
  var_2 = 15000;
  var_3 = 3400;

  while (var_1 > 0) {
  if (isdefined(level._id_D127))
  var_4 = distance(level._id_D127.origin, var_0);
  else
  break;

  if (var_4 < var_3) {
  _id_D0DB(var_0);
  break;
  }
  else if (var_4 > var_2)
  break;

  var_1 = var_1 - 0.05;
  wait 0.05;
  }
}

_id_D0DB(var_0) {
  var_1 = "jackal_debris_impact";
  var_2 = 2;

  if (scripts\engine\utility::_id_D11B())
  playfxontag(scripts\engine\utility::_id_7ECB("jackal_debris_impact"), level.player _meth_8473(), "j_mainroot_ship");

  level.player playrumbleonentity("steady_rumble");
  earthquake(0.33, var_2, level.player.origin, 5000);
  _func_178(var_1, var_0);
  wait(var_2);
  level.player _meth_83A9("steady_rumble");
}

_id_A1DA() {
  self notify("crashing");
  var_0 = scripts\engine\utility::_id_8180("jackal_death_node", "targetname");
  _id_0BDC::_id_19AE("dont_shoot");
  self._id_4E15 = scripts\engine\utility::_id_107E6(self.origin, self.angles);
  self linkto(self._id_4E15);
  thread _id_700C();
  thread _id_A340(180);
  _id_BC89(var_0);
  playfxontag(level._effect["fighter_spaceship_explosion_ground"], self, "tag_origin");
  self._id_4E15 delete();
}

_id_A340(var_0) {
  self endon("reached_flyoff_position");
  var_1 = randomfloatrange(0.5, 1.5);

  for (;;) {
  self._id_4E15 _meth_8271(90, 1);
  wait(var_1);

  if (var_1 - 0.1 > 0.5)
  var_1 = var_1 - 0.1;
  }
}

_id_BC89(var_0) {
  var_1 = _id_7A56(var_0);
  var_2 = randomfloatrange(1.5, 3);
  self._id_4E15 moveto(var_1.origin, var_2, var_2 * 0.9);
  wait(var_2);
  self notify("reached_flyoff_position");
  var_1._id_9B04 = undefined;
  playfx(level._effect["fighter_spaceship_explosion_ground"], var_1.origin);
}

_id_7A56(var_0) {
  var_0 = sortbydistance(var_0, self.origin);

  foreach (var_2 in var_0) {
  if (!isdefined(var_2._id_9B04)) {
  var_2._id_9B04 = 1;
  return var_2;
  }
  }

  return var_0[0];
}

_id_700C() {
  playfxontag(level._effect["fighter_spaceship_dying"], self, "tag_origin");
  playfxontag(level._effect["fighter_spaceship_explosion_hov"], self, "tag_origin");
  playfxontag(level._effect["fighter_spaceship_damage_med_hov_trail"], self, "tag_origin");
}

_id_7A58() {
  return (self.health - 50000) / (self.maxhealth - 50000);
}
