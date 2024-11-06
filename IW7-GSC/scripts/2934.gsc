/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2934.gsc
***************************************/

_id_1945(var_0, var_1, var_2) {
  self endon("death");

  if (isdefined(level._id_D127) && var_0 == level._id_D127)
  var_3 = 1;
  else
  var_3 = 0;

  if (var_3) {
  thread _id_B840();
  _id_A278();
  wait 0.5;
  }

  self._id_B8A4 = [];
  var_4 = 0;

  while (var_2 > 0) {
  if (!isdefined(self) || !isdefined(var_0))
  break;

  if (var_4 == var_1.size)
  var_4 = 0;

  var_5 = var_1[var_4];
  var_4++;
  var_6 = _id_1992(var_5, var_0);
  var_6.team = self._id_EEDE;

  if (var_3) {
  var_6._id_438D = self;

  if (isdefined(self._id_594B))
  var_7 = 0;
  else
  var_7 = 1;

  var_6 _id_A279(var_7);
  self._id_B8A4 = scripts\engine\utility::_id_2279(self._id_B8A4, var_6);
  }

  var_2--;
  wait 0.3;
  }
}

_id_B840() {
  level notify("missile_volley_global_cooldown");
  level endon("missile_volley_global_cooldown");
  level.player endon("death");
  level.player _id_0B91::_id_65DD("jackal_enemy_homing_missile_allowed");
  level.player _id_0B91::_id_65DD("jackal_enemy_homing_missile_allowed_hyperaggressive");

  while (isdefined(self._id_93D2) && self._id_93D2.size > 0)
  wait 0.1;

  childthread _id_B841();
  var_0 = 12.0;
  var_1 = 24.0;
  wait(randomfloatrange(var_0, var_1));
  level.player _id_0B91::_id_65E1("jackal_enemy_homing_missile_allowed");
}

_id_B841() {
  var_0 = 3.5;
  var_1 = 5.5;
  wait(randomfloatrange(var_0, var_1));
  level.player _id_0B91::_id_65E1("jackal_enemy_homing_missile_allowed_hyperaggressive");
}

_id_7B95() {
  if (!isdefined(level._id_D127) || !isdefined(level._id_D127._id_93D2))
  return 0;

  return level._id_D127._id_93D2.size;
}

_id_A279(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  thread _id_B807();

  thread _id_B805();
  self _meth_8557("OFFSCREEN_HAZARD_INDICATOR");
  thread _id_B806();
}

_id_B806() {
  for (;;) {
  if (!isdefined(self))
  return;

  var_0 = length(self.origin - level._id_D127.origin);
  var_1 = _id_0B4D::_id_C097(200, 10000, var_0);
  var_2 = _id_0B4D::_id_6A8E(0.6, 1.3, var_1);
  self _meth_8277(var_2, 0.05);
  wait 0.05;
  }
}

_id_686D(var_0, var_1) {
  self._id_010C endon("death");
  var_2 = 0;
  self._id_010C._id_EF5E = (0, 0, 0);
  self._id_010C._id_EF63 = 1700;

  while (var_1 > 0) {
  if (var_2 == var_0.size)
  var_2 = 0;

  var_3 = var_0[var_2];
  var_2++;

  if (isdefined(self)) {
  var_4 = self._id_010C thread _id_1992(var_3, level._id_D127, undefined, undefined, 400, 0);
  var_4._id_438D = self._id_010C;
  }

  var_1--;
  wait 0.3;
  }

  self._id_010C._id_EF5E = undefined;
  self._id_6DA7 = 0;
}

_id_B804() {
  self endon("death");
  self playsound("enemy_lockon_missile_launch");
  self _meth_8277(0.5, 0.05);
  self _meth_8278(1.3, 0.05);
  wait 0.05;
  var_0 = 2;
  self _meth_8277(1.2, var_0);
  self _meth_8278(2, var_0);
}

_id_B805() {
  self endon("death");
  wait 0.5;
  self setmodel("veh_mil_air_un_jackal_missile_coll");
  self show();
  self.team = "axis";
  self.health = 99999999;
  self._id_EEDE = "axis";
  self setcandamage(1);
  self _meth_84BE("missile");
  self _meth_8339(0);

  for (;;) {
  self waittill("damage", var_0, var_1, var_2, var_3, var_4);

  if (isdefined(var_1) && var_1 == level._id_D127)
  break;
  }

  _id_12869(self.origin);
  self playsound("jackal_missile_explosion_plr", "sounddone");
  playfx(scripts\engine\utility::_id_7ECB("jet_missile_imp_airburst"), self.origin, anglestoforward(self.angles), anglestoup(self.angles));
  self waittill("sounddone");
  self delete();
}

_id_B807() {
  var_0 = 3000;
  var_1 = 12000;
  var_2 = 5000;
  var_3 = 25000;
  var_4 = 13 * level._id_A48E._id_A3FB;
  var_5 = 25 * level._id_A48E._id_A3FB;
  var_6 = 2000;
  var_7 = 500 * level._id_A48E._id_A3FB;
  var_8 = 0;

  for (;;) {
  if (!isdefined(self))
  return;

  if (isdefined(self._id_6E8B))
  var_8 = 1;

  if (!var_8) {
  var_9 = level._id_D127._id_02AC;
  var_10 = length(var_9);
  var_10 = scripts\engine\utility::_id_BD6A(var_10);
  var_10 = var_10 * 0.05;
  var_11 = var_10 + var_7;
  var_12 = vectordot(anglestoforward(self.angles), vectornormalize(var_9));
  var_13 = var_11 * var_12;

  if (var_13 < var_7)
  var_13 = var_7;

  var_14 = distance(self.origin, level._id_D127.origin);
  var_15 = _id_0B4D::_id_C097(var_0, var_1, var_14);
  var_16 = _id_0B4D::_id_6A8E(var_13, var_6, var_15);
  var_17 = _id_0B4D::_id_C097(var_2, var_3, var_14);
  var_18 = _id_0B4D::_id_6A8E(var_4, var_5, var_17);
  } else {
  var_16 = 1400;
  var_18 = 20;
  }

  self._id_B464 = var_16;
  self._id_1545 = var_18;
  wait 0.05;
  }
}

_id_1993(var_0, var_1) {
  if (isdefined(self._id_EF5B))
  return;

  self._id_EF5B = 1;

  if (!isdefined(var_1))
  var_1 = "TAG_FLASH_right";

  foreach (var_3 in var_0) {
  if (!isdefined(var_3))
  continue;

  thread _id_1992(var_1, var_3);
  wait(randomfloatrange(1, 1.3));
  }

  wait 0.2;
  self._id_EF5B = undefined;
}

_id_1992(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8) {
  if (!isdefined(var_2) && !isdefined(self._id_EF5D))
  var_2 = 0;
  else if (isdefined(self._id_EF5D))
  var_2 = self._id_EF5D;

  if (isdefined(self._id_EF5C))
  var_9 = self._id_EF5C;
  else
  var_9 = undefined;

  if (isdefined(var_6))
  var_6 = var_6;
  else if (isdefined(self._id_EF61))
  var_6 = self._id_EF61;

  if (isdefined(var_4))
  var_4 = var_4;
  else if (isdefined(self._id_EF62))
  var_4 = self._id_EF62;
  else if (_func_0FD(self)) {
  var_4 = rotatevectorinverted(self._id_02AC, self.angles);
  var_4 = var_4[0];
  }
  else
  var_4 = 0;

  if (isdefined(self._id_EF5E))
  var_10 = self._id_EF5E;
  else
  var_10 = (0, 0, 1500);

  var_11 = scripts\engine\utility::_id_107E6(self gettagorigin(var_0), self gettagangles(var_0));

  if (var_2) {
  var_12 = vectornormalize(var_1.origin - self.origin);
  var_11.angles = vectortoangles(var_12);
  }

  if (isdefined(level._id_D127) && var_1 == level._id_D127) {
  if (isdefined(self._id_EF60))
  var_11._id_AA99 = self._id_EF60;
  else
  var_11._id_AA99 = "jackal_missile_launch_space_for_plr";

  var_11._id_B048 = "jackal_missile_loop_for_ply";
  var_11._id_69E9 = "jackal_missile_explosion_plr";
  }
  else if (isdefined(self._id_EF5F))
  var_11._id_AA99 = self._id_EF5F;
  else
  var_11._id_AA99 = "jackal_missile_launch_space_npc";

  if (!isdefined(var_1)) {
  var_13 = 1;
  var_14 = scripts\engine\utility::_id_107E6();
  var_14._id_5F27 = 1;
  var_14.origin = var_11.origin + anglestoforward(self gettagangles(var_0)) * 30000;
  }
  else if (isdefined(var_5) && !var_5) {
  var_13 = 1;
  var_14 = scripts\engine\utility::_id_107E6();
  var_14._id_5F27 = 1;
  var_15 = vectornormalize(var_1.origin - var_11.origin);
  var_14.origin = var_11.origin + var_15 * 30000;
  var_1 = var_14;
  }
  else
  var_13 = 0;

  var_11._id_50D5 = var_3;
  var_11._id_01CF = 6;

  if (isdefined(self._id_EF63))
  var_16 = self._id_EF63;
  else if (isdefined(self._id_C841) && isdefined(self._id_C841._id_B825))
  var_16 = self._id_C841._id_B825;
  else
  var_16 = 1300;

  if (isdefined(self._id_EF5A))
  var_11._id_1545 = self._id_EF5A;
  else if (isdefined(self._id_C841) && isdefined(self._id_C841._id_B821))
  var_11._id_1545 = self._id_C841._id_B821;

  if (isdefined(var_8) && var_8 == 1)
  var_11 thread _id_A332(var_1, var_13, self, var_6, var_16, var_10, undefined, var_7, var_4, undefined, var_9, var_8);
  else
  var_11 thread _id_A332(var_1, var_13, self, var_6, var_16, var_10, undefined, var_7, var_4, undefined, var_9);

  return var_11;
}

_id_A278() {
  if (!isdefined(self))
  return;

  if (_func_0FD(self))
  var_0 = "j_mainroot_ship";
  else
  var_0 = "tag_origin";

  self playsound("jackal_enemy_locking_warning");
  playfxontag(scripts\engine\utility::_id_7ECB("jackal_enemy_locking"), self, var_0);
}

_id_6D2A(var_0, var_1) {
  if (!isdefined(var_1)) {
  var_2 = 1;
  var_3 = scripts\engine\utility::_id_107E6();
  var_3._id_5F27 = 1;
  var_3.origin = self gettagorigin(var_0) + anglestoforward(self gettagangles(var_0)) * 30000;
  }
  else
  var_2 = 0;

  var_4 = scripts\engine\utility::_id_107E6(self gettagorigin(var_0), self gettagangles(var_0));
  var_4 thread _id_A332(var_1, var_2, self);
}

_id_A332(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14) {
  if (!isdefined(var_0))
  return;

  var_0 notify("homing_missile_incoming", self, var_2);
  self._id_6E9B = 0;
  _id_B80F();
  thread _id_B7F5();
  var_15 = 0;

  if (isdefined(level._id_D127) && isdefined(var_2) && var_2 == level._id_D127)
  var_15 = 1;

  if (!isdefined(var_3))
  var_3 = "missile_flare_generic";

  if (isstring(var_3))
  playfxontag(scripts\engine\utility::_id_7ECB(var_3), self, "tag_origin");
  else
  playfxontag(var_3, self, "tag_origin");

  if (isdefined(self._id_AA99)) {
  if (self._id_AA99 != "null")
  self playsound(self._id_AA99);
  }
  else
  self playsound("jackal_missile_launch_space_npc");

  if (!isdefined(self._id_B048))
  var_16 = "jackal_missile_lp_space";
  else
  var_16 = self._id_B048;

  if (!isdefined(var_9))
  var_9 = 0;

  if (!var_9)
  self playloopsound(var_16);

  while (isdefined(self._id_50D5))
  wait 0.05;

  if (!isdefined(self))
  return;

  if (!isdefined(var_10))
  var_10 = 1.0;

  if (isdefined(var_0._id_5F27))
  self._id_5F27 = var_0;

  var_17 = var_10 * 0.25;
  var_18 = 0;
  var_19 = 0.3;
  var_20 = 8;

  if (isdefined(self._id_01CF))
  var_20 = self._id_01CF;
  else if (isdefined(level._id_B81B))
  var_20 = level._id_B81B;

  var_21 = 0;
  var_22 = 0;

  if (var_1)
  var_23 = (0, 0, 0);
  else
  var_23 = (0, 0, 25);

  if (isdefined(var_12))
  var_23 = var_12;

  if (!isdefined(var_14))
  var_14 = 0;

  var_24 = var_0.origin + var_23;
  var_25 = var_24;
  var_26 = (0, 0, 0);

  if (!isdefined(self._id_1545))
  self._id_1545 = 5;

  var_27 = 0;

  if (isdefined(level._id_D127) && var_0 == level._id_D127)
  var_27 = 1;

  if (isdefined(var_8))
  var_28 = var_8;
  else
  var_28 = 0;

  if (!isdefined(var_5))
  var_5 = (0, 0, 0);

  if (!isdefined(var_4))
  var_4 = 1000;

  if (isdefined(var_2) && isdefined(var_2._id_B8AE) && isdefined(var_2._id_B8AE._id_B4C9))
  var_4 = var_2._id_B8AE._id_B4C9;

  if (!isdefined(var_6))
  var_6 = 0;

  if (!isdefined(var_11))
  var_11 = 0;

  var_29 = 0;

  if (isdefined(self._id_BFEC))
  var_29 = self._id_BFEC;

  if (isdefined(self._id_69E9))
  var_30 = self._id_69E9;
  else
  var_30 = undefined;

  var_31 = self.origin;
  var_32 = self.angles;
  var_33 = 0;
  var_34 = undefined;

  if (isdefined(var_0._id_B83D))
  var_35 = var_0._id_B83D;
  else
  var_35 = 100;

  var_36 = _id_A26F();

  if (isdefined(var_13)) {
  var_36._id_12AFD._id_CA26 = var_13._id_12B00;
  var_36._id_12AFD._id_CA25 = var_13._id_12AFF;
  var_36._id_12AFD._id_B144 = var_13._id_12AFE;
  var_36._id_B0EF._id_CA26 = var_13._id_B0F3;
  var_36._id_B0EF._id_CA25 = var_13._id_B0F2;
  var_36._id_B0EF._id_B144 = var_13._id_B0F1;
  } else {
  var_36._id_12AFD._id_CA26 = 0.3;
  var_36._id_12AFD._id_CA25 = 0.4;
  var_36._id_12AFD._id_B144 = 400;
  var_36._id_B0EF._id_CA26 = 0.3;
  var_36._id_B0EF._id_CA25 = 0.4;
  var_36._id_B0EF._id_B144 = 400;
  }

  scripts\engine\utility::waitframe();
  var_37 = (0, 0, 0);
  var_38 = var_31 + var_37;
  var_39 = var_38;
  var_40 = 1;
  var_31 = var_38;

  if (isdefined(self)) {
  self.origin = var_38;
  self._id_C727 = var_0;
  }

  if (isdefined(self.weapon))
  var_41 = self.weapon;
  else
  var_41 = "spaceship_homing_missile";

  if (isdefined(self)) {
  self._id_217A = 0;
  thread _id_216F(var_2);
  }

  for (;;) {
  if (!isdefined(self)) {
  var_22 = 1;
  var_42 = undefined;
  break;
  }

  if (var_18 < var_10 + var_17) {
  if (var_18 < var_17)
  var_43 = 0;
  else
  var_43 = _id_0B4D::_id_C097(0, var_10, var_18 - var_17);
  }
  else
  var_43 = 1;

  if (var_1)
  var_44 = 1;
  else
  var_44 = var_43;

  if (isdefined(self._id_6E8B)) {
  var_0 = self._id_6E8B;
  self._id_6E9B = 1;
  }
  else if (isdefined(self._id_C727) && isdefined(self._id_C727._id_6E9C) && self._id_C727._id_6E9C._id_12B86.size > 0) {
  self._id_6E8B = scripts\engine\utility::_id_DC6B(self._id_C727._id_6E9C._id_12B86);
  self._id_C727._id_6E9C._id_12B86 = scripts\engine\utility::array_remove(self._id_C727._id_6E9C._id_12B86, self._id_6E8B);
  var_0 = self._id_6E8B;
  self._id_6E9B = 1;
  }
  else
  self._id_6E9B = 0;

  if (isdefined(self._id_114F9) && var_0 != self._id_114F9)
  var_0 = self._id_114F9;

  if (!isdefined(var_0)) {
  var_0 = scripts\engine\utility::_id_107E6();
  var_0.origin = self.origin + anglestoforward(self.angles) * 10000;
  var_0._id_5F27 = 1;
  self._id_5F27 = var_0;
  var_1 = 1;
  var_23 = (0, 0, 0);
  }

  var_24 = var_0.origin + var_23;
  var_26 = var_24 - var_25;
  var_25 = var_24;
  var_45 = var_24 + var_26;
  var_46 = var_45 - var_31;
  var_47 = length(var_46);
  var_48 = vectornormalize(var_46);
  var_49 = anglestoforward(var_32);
  var_50 = vectordot(var_48, var_49);
  var_51 = 1 - _id_0B4D::_id_C097(0.3, 1, var_50);
  var_52 = _id_0B4D::_id_6A8E(1, var_19, var_44 * var_51);

  if (var_50 == 1)
  var_53 = 0;
  else
  var_53 = 1 - _id_0B4D::_id_C097(var_50, 1, var_52);

  var_54 = vectornormalize(var_48 * var_53 + var_49 * (1 - var_53));
  var_55 = _id_0B4D::_id_C097(0, 17000, var_47);
  var_55 = _id_0B4D::_id_C09B(var_55);

  if (var_55 < var_40)
  var_40 = var_55;

  var_56 = var_28 + var_14 * (1 - var_40);
  var_31 = var_31 + var_54 * var_56;
  var_32 = vectortoangles(var_54);
  var_37 = (0, 0, var_35 * var_43 * var_40);
  var_57 = var_5 * var_43 * var_40;
  var_36 _id_B7E6();
  var_58 = var_36._id_B0EF._id_4D94["val"] * (var_43 * var_40);
  var_59 = var_36._id_12AFD._id_4D94["val"] * (var_43 * var_40);
  var_60 = anglestoright(var_32) * var_58 + anglestoup(var_32) * var_59;
  var_38 = var_31 + var_60 + var_37 + var_57;

  if (isdefined(var_2)) {
  if (isdefined(self._id_438D))
  var_61 = [self, self._id_438D, var_2];
  else
  var_61 = [self, var_2];
  }
  else if (isdefined(self._id_438D))
  var_61 = [self, self._id_438D];
  else
  var_61 = [self];

  if (isdefined(level._id_B8AD))
  var_61 = scripts\engine\utility::_id_227F(level._id_B8AD, var_61);

  var_62 = 0;

  if (isdefined(self._id_6E9B) && var_47 < 1000) {
  var_21 = 1;
  var_62 = 1;
  var_33 = 1;
  var_38 = var_24;
  }
  else if (isdefined(level._id_D127) && var_0 == level._id_D127 && var_47 < 700) {
  var_21 = 1;
  var_62 = 1;
  var_33 = 1;
  }
  else if (var_56 > var_47) {
  var_21 = 1;
  var_62 = 1;
  var_33 = 1;
  }

  if (!isdefined(self._id_C180))
  var_42 = scripts\engine\trace::_id_DCED(self.origin, var_38, var_61, undefined, 1);
  else
  {
  var_42["fraction"] = 1;
  var_42["entity"] = var_0;
  var_42["position"] = var_24;
  var_42["surfacetype"] = "default";
  var_42["normal"] = -1 * anglestoforward(self.angles);
  }

  if (var_42["fraction"] < 1 && var_42["surfacetype"] != "surftype_none" && self._id_217A) {
  var_33 = 0;
  var_38 = var_42["position"];

  if (distance(var_42["position"], var_24) < 100)
  var_21 = 1;

  var_62 = 1;
  }
  else if (var_47 < var_6) {
  var_62 = 1;
  var_34 = self.angles;

  if (!isdefined(var_7))
  var_7 = ["jet_missile_imp_airburst", "capitalship_missile_airburst", 5];
  }

  self.origin = var_38;
  self.angles = vectortoangles(vectornormalize(var_38 - var_39));
  var_39 = var_38;

  if (var_62 || isdefined(self._id_72CA))
  break;

  if (var_18 > var_20) {
  var_22 = 1;
  break;
  }

  var_28 = var_28 + self._id_1545;

  if (isdefined(self._id_B464)) {
  if (var_28 > self._id_B464)
  var_28 = self._id_B464;
  }
  else if (var_28 > var_4)
  var_28 = var_4;

  var_18 = var_18 + 0.05;

  if (isdefined(self._id_6E8B) && self._id_6E8B._id_0019) {
  self._id_6E8B waittill("pos_updated");
  continue;
  }

  scripts\engine\utility::waitframe();
  }

  if (!var_22) {
  if (isdefined(self._id_5F27) && var_21)
  var_34 = self.angles;

  if (self._id_6E9B) {
  var_34 = self.angles;
  var_11 = 1;
  }

  if (isdefined(var_0._id_1A89) && !isdefined(var_7) && var_33) {
  var_7 = ["jet_missile_imp_airburst", "capitalship_missile_airburst", 5];
  var_34 = self.angles;
  }
  }

  scripts\engine\utility::waitframe();

  if (var_22 || !isdefined(self))
  self notify("missile_dud");
  else
  {
  self notify("missile_explode");

  if (isdefined(var_2)) {
  var_2 notify("missile_explode");

  if (_id_0B91::_id_D123() && var_2 == level._id_D127)
  player_jackal_scripted_missile_self_damage(var_42["position"]);
  }
  else
  var_2 = undefined;

  if (!var_11) {
  if (isdefined(var_2) && isdefined(var_2._id_B8AE))
  radiusdamage(var_42["position"], var_2._id_B8AE._id_DCCA, var_2._id_B8AE._id_B48B, var_2._id_B8AE._id_B758, var_2, "MOD_EXPLOSIVE", var_41);
  else
  radiusdamage(var_42["position"], 512, 2500, 1000, var_2, "MOD_EXPLOSIVE", var_41);
  }

  if (var_21 && isdefined(var_0))
  var_42["entity"] = var_0;

  thread _id_4C7B(var_42, "missile", var_7, var_30, var_34);

  if (isdefined(var_42["entity"])) {
  var_42["entity"] notify("missile_hit");

  if (!var_11)
  var_42["entity"] _id_54DE(5000, var_42["position"], var_2, var_41);

  if (var_27 && var_42["entity"] != level._id_D127)
  _id_12869(var_42["position"]);
  else if (!var_29)
  earthquake(0.2, 0.7, var_42["position"], 15000);
  } else {
  if (var_27) {
  _id_12869(var_42["position"]);
  return;
  }

  if (!var_29)
  earthquake(0.2, 0.7, var_42["position"], 15000);
  }
  }
}

player_jackal_scripted_missile_self_damage(var_0) {
  var_1 = distance(var_0, level._id_D127.origin);
  var_2 = 1900;

  if (var_1 > var_2)
  return;

  var_3 = _id_0B4D::_id_C097(0, var_2, var_1);
  var_4 = _id_0B4D::_id_6A8E(1000, 500, var_3);
  level._id_D127 _meth_80B0(var_4, var_0, level._id_D127, level._id_D127, "MOD_EXPLOSIVE", "spaceship_homing_missile");
}

_id_216F(var_0) {
  self endon("death");
  var_1 = self;

  if (!isdefined(var_0)) {
  var_1._id_217A = 1;
  return;
  }

  if (isdefined(var_0._id_217B))
  wait(var_0._id_217B);

  if (isdefined(var_1))
  var_1._id_217A = 1;
}

_id_12869(var_0) {
  if (isdefined(level._id_A056) && scripts\engine\utility::_id_D11B())
  [[level._id_A056._id_B81C]](var_0);
}

_id_A26F(var_0) {
  var_1 = spawnstruct();
  var_1._id_B0EF = _id_A26E();
  var_1._id_12AFD = _id_A26E();

  if (isdefined(var_0))
  var_1._id_6BB1 = _id_A26E();

  return var_1;
}

_id_A26E() {
  var_0 = spawnstruct();
  var_0._id_4D94 = [];
  var_0._id_4D94["old"] = 0;
  var_0._id_4D94["period"] = 0;
  var_0._id_4D94["target"] = 0;
  var_0._id_4D94["val"] = 0;
  var_0._id_4D94["time"] = 0;
  return var_0;
}

_id_A26D(var_0, var_1, var_2, var_3, var_4, var_5) {
  var_6 = spawnstruct();
  var_6._id_12B00 = var_0;
  var_6._id_12AFF = var_1;
  var_6._id_12AFE = var_2;
  var_6._id_B0F3 = var_3;
  var_6._id_B0F2 = var_4;
  var_6._id_B0F1 = var_5;
  return var_6;
}

_id_B80F() {
  if (!isdefined(level._id_1678))
  level._id_1678 = [];

  level._id_1678[level._id_1678.size] = self;
  thread _id_B810();
}

_id_B810() {
  self waittill("entitydeleted");
  level._id_1678 = scripts\engine\utility::array_remove(level._id_1678, self);
}

_id_FBC1() {
  self delete();
}

_id_B7F5() {
  _id_135EE();
  _id_4096();
}

_id_135EE() {
  level endon("end_shoot_missiles");
  scripts\engine\utility::waittill_any("missile_destroyed", "missile_dud", "missile_explode");
}

_id_4096() {
  if (isdefined(self) && isdefined(self._id_5F27))
  self._id_5F27 delete();

  if (isdefined(self))
  self delete();
}

_id_B7E6() {
  self._id_B0EF _id_B7E7();
  self._id_12AFD _id_B7E7();

  if (isdefined(self._id_6BB1))
  self._id_6BB1 _id_B7E7();
}

_id_B7E7() {
  if (self._id_4D94["time"] >= self._id_4D94["period"]) {
  self._id_4D94["period"] = randomfloatrange(self._id_CA26, self._id_CA25);
  self._id_4D94["old"] = self._id_4D94["target"];
  self._id_4D94["time"] = 0;
  self._id_4D94["target"] = randomfloatrange(self._id_B144 * -1, self._id_B144);
  }

  var_0 = _id_0B4D::_id_C097(0, self._id_4D94["period"], self._id_4D94["time"]);
  var_0 = _id_0B4D::_id_C09C(var_0);
  self._id_4D94["val"] = self._id_4D94["old"] * (1 - var_0) + self._id_4D94["target"] * var_0;
  self._id_4D94["time"] = self._id_4D94["time"] + 0.05;
}

_id_54DE(var_0, var_1, var_2, var_3) {
  if (isdefined(self._id_8CBE))
  var_4 = self._id_8CBE;
  else
  var_4 = self;

  if (!_func_2A6(var_4))
  return;

  var_4 _meth_80B0(var_0, var_1, var_2, var_2, "MOD_EXPLOSIVE", var_3);
}

_id_4C7B(var_0, var_1, var_2, var_3, var_4) {
  self endon("death");

  if (isdefined(var_0["entity"]) && isdefined(var_0["entity"]._id_112DC))
  var_5 = var_0["entity"]._id_112DC;
  else if (isdefined(var_0["entity"]) && isdefined(var_0["entity"]._id_02D9))
  var_5 = var_0["entity"]._id_02D9;
  else
  var_5 = var_0["surfacetype"];

  if (!isdefined(var_2))
  var_6 = _id_B7E8(var_5, var_1);
  else
  var_6 = var_2;

  var_7 = spawn("script_model", var_0["position"]);
  var_7 setmodel("tag_origin");

  if (isdefined(var_4))
  var_7.angles = var_4;
  else
  var_7.angles = vectortoangles(var_0["normal"]);

  if (isdefined(var_0["entity"]) && _func_2A6(var_0["entity"]))
  var_7 linkto(var_0["entity"]);

  playfxontag(scripts\engine\utility::_id_7ECB(var_6[0]), var_7, "tag_origin");

  if (!isdefined(var_3)) {
  if (isdefined(var_6[1]))
  thread scripts\engine\utility::_id_CE2B(var_6[1], var_7.origin);
  }
  else
  thread scripts\engine\utility::_id_CE2B(var_3, var_7.origin);

  thread _id_0B91::_id_5187(var_7);
  wait(var_6[2]);

  if (isdefined(var_7))
  var_7 delete();
}

_id_B7E8(var_0, var_1) {
  var_2 = "";
  var_3 = "";
  var_4 = 0;

  switch (var_0) {
  case "metal":
  switch (var_1) {
  case "missile":
  var_2 = "jet_missile_imp_generic";
  var_3 = "jackal_missile_impact";
  var_4 = 5;
  break;
  }

  break;
  case "rock":
  switch (var_1) {
  case "missile":
  var_2 = "jet_missile_imp_generic";
  var_3 = "jackal_missile_impact_rock";
  var_4 = 5;
  break;
  }

  break;
  case "water":
  switch (var_1) {
  case "missile":
  var_2 = "jet_missile_imp_water";
  var_3 = "jackal_missile_impact_water";
  var_4 = 5;
  break;
  }

  break;
  case "jackal":
  switch (var_1) {
  case "missile":
  var_2 = "jet_missile_imp_generic";
  var_3 = "jackal_missile_impact";
  var_4 = 5;
  break;
  }

  break;
  default:
  switch (var_1) {
  case "missile":
  var_2 = "jet_missile_imp_generic";
  var_3 = "jackal_missile_impact";
  var_4 = 5;

  if (isdefined(level._id_241D) && !level._id_241D)
  var_2 = "jet_missile_imp_generic_zg";

  break;
  }

  break;
  }

  return [var_2, var_3, var_4];
}

_id_F42B(var_0) {
  if (level.player _id_0B91::_id_65DB("disable_jackal_lockon"))
  return;

  if (isdefined(self._id_9B4C) && self._id_9B4C)
  var_0 = var_0 + "_ace";

  if (isdefined(self._id_9CB8) && self._id_9CB8)
  var_0 = var_0 + "_ace";

  if (var_0 == "none")
  self _meth_84A0(0);
  else if (var_0 == "ally_jackal")
  self _meth_84A0(1);
  else if (var_0 == "enemy_jackal")
  self _meth_84A0(2);
  else if (var_0 == "enemy_dogfight")
  self _meth_84A0(3);
  else if (var_0 == "ally_capitalship")
  self _meth_84A0(4);
  else if (var_0 == "enemy_capitalship")
  self _meth_84A0(5);
  else if (var_0 == "enemy_jackal_ace")
  self _meth_84A0(6);
  else if (var_0 == "enemy_dogfight_ace")
  self _meth_84A0(7);
  else if (var_0 == "ally_jackal_unloc")
  self _meth_84A0(8);
  else
  {}
}

_id_F42C(var_0) {
  if (level.player _id_0B91::_id_65DF("disable_jackal_lockon") && level.player _id_0B91::_id_65DB("disable_jackal_lockon"))
  return;

  if (self._id_AEDF._id_D925) {
  if (isdefined(self._id_9B4C) && self._id_9B4C)
  var_0 = "ace_objective";
  else if (isdefined(self._id_9CB8) && self._id_9CB8)
  var_0 = "ace_objective";
  else
  {
  if (!isdefined(self._id_EEDE))
  var_1 = "allies";
  else
  var_1 = self._id_EEDE;

  var_0 = var_1 + "_objective";
  }
  }
  else if (var_0 == "jackal" || var_0 == "last_engaged") {
  if (isdefined(self._id_9B4C) && self._id_9B4C)
  var_0 = var_0 + "_ace";
  else if (isdefined(self._id_9CB8) && self._id_9CB8)
  var_0 = var_0 + "_ace";
  }

  switch (var_0) {
  case "jackal":
  self _meth_8557("FLYING_TARGET");
  break;
  case "jackal_ace":
  self _meth_8557("ACE_TARGET");
  break;
  case "last_engaged":
  self _meth_8557("ENEMY_OBJECTIVE");
  break;
  case "last_engaged_ace":
  self _meth_8557("PRIORITY_FLYING_TARGET");
  break;
  case "ally_jackal":
  self _meth_8557("FLYING_ALLY_TARGET");
  break;
  case "axis_objective":
  self _meth_8557("ENEMY_OBJECTIVE");
  break;
  case "ally_objective":
  self _meth_8557("ALLY_OBJECTIVE");
  break;
  case "ace_objective":
  self _meth_8557("PRIORITY_FLYING_TARGET_ACE");
  break;
  case "dogfight_tracker":
  self _meth_8557("PRIORITY_FLYING_TARGET");
  break;
  case "large_target":
  self _meth_8557("LARGE_TARGET");
  break;
  case "medium_target":
  self _meth_8557("MEDIUM_TARGET");
  break;
  case "small_target":
  self _meth_8557("SMALL_TARGET");
  break;
  case "incoming_missile":
  self _meth_8557("OFFSCREEN_HAZARD_INDICATOR");
  break;
  case "immediate_threat":
  self _meth_8557("OFFSCREEN_ENEMY_INDICATOR");
  break;
  case "hoverheat":
  self _meth_8557("OFFSCREEN_ENEMY_INDICATOR");
  break;
  case "droppod_marker":
  self _meth_8557("LARGE_WEAKSPOT");
  break;
  case "none":
  self _meth_8558();
  break;
  default:
  }
}

_id_39C3(var_0, var_1, var_2) {
  self notify("scan_for_turrets");
  self endon("death");
  self endon("scan_for_turrets");
  var_3 = 0;

  if (!isdefined(var_1))
  var_1 = 0;

  if (self._id_EEDE == "axis")
  var_4 = "enemy";
  else
  var_4 = "friendly";

  if (isdefined(var_2))
  var_4 = var_2;

  while (var_3 < var_0) {
  _id_0B91::_id_F40A(var_4, 0);

  if (!var_1)
  self playsound("jackal_scan_ship");

  wait 0.25;
  self _meth_818B();
  var_3++;
  wait 0.15;
  }
}

_id_D195(var_0, var_1) {
  if (var_0) {
  if (isdefined(level._id_D127._id_2578._id_138F5))
  return;

  var_2 = scripts\engine\utility::ter_op(isdefined(var_1), var_1, "jackal_collision_warning");
  level._id_D127._id_2578._id_138F5 = var_2;
  level.player thread scripts\engine\utility::_id_CD7F(var_2);
  } else {
  if (!isdefined(level._id_D127._id_2578._id_138F5))
  return;

  level.player notify("stop sound" + level._id_D127._id_2578._id_138F5);
  level._id_D127._id_2578._id_138F5 = undefined;
  }
}

_id_9C19(var_0) {
  var_1 = _id_7A60(var_0.origin);
  return var_1 >= cos(50);
}

_id_7A60(var_0) {
  if (scripts\engine\utility::_id_D11B())
  var_1 = level._id_D127 gettagorigin("tag_camera");
  else
  var_1 = level.player geteye();

  var_2 = vectornormalize(var_0 - var_1);
  var_3 = anglestoforward(level.player getplayerangles());
  var_4 = vectordot(var_2, var_3);
  return var_4;
}

_id_16FE(var_0, var_1, var_2) {
  _func_1C1("ui_jackal_objective_bits", var_0, 1);
  setomnvar("ui_jackal_objective_string_" + var_0, var_1);
  setomnvar("ui_jackal_objective_state_" + var_0, 1);

  if (isdefined(var_2)) {
  setomnvar("ui_jackal_objective_maxkills_" + var_0, var_2);
  setomnvar("ui_jackal_objective_kills_" + var_0, 0);
  }
}

_id_4474(var_0) {
  setomnvar("ui_jackal_objective_state_" + var_0, 2);
}

_id_8E93(var_0) {
  _func_1C1("ui_jackal_objective_bits", var_0, 0);
}

_id_100EC(var_0) {
  _func_1C1("ui_jackal_objective_bits", var_0, 1);
}

_id_F433(var_0, var_1) {
  setomnvar("ui_jackal_objective_string_" + var_0, var_1);
}

_id_F432(var_0, var_1) {
  setomnvar("ui_jackal_objective_kills_" + var_0, var_1);
}
