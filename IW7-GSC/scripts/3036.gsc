/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3036.gsc
***************************************/

_id_A2A8(var_0, var_1, var_2, var_3) {
  _id_490C(var_0, var_1);
  var_4 = scripts\engine\utility::ter_op(isdefined(var_3), "tag_pip_copilot", "tag_pip");
  thread _id_19CF(var_4);
  _id_0B5E::_id_CBB5(self, var_4, 42);
  level._id_CB9C._id_009E = 2500;
  thread _id_A2AA();
  setomnvar("ui_pip_message_text_bottom", "script_empty_string");
  setomnvar("ui_pip_message_text_top", "jackal_pip_top");
  setomnvar("ui_pip_message_type", 1);

  if (isdefined(var_2)) {
  wait 0.65;
  var_0 _id_0B91::_id_10347(var_2);
  }
}

_id_A2AA() {
  level endon("pip_closed");
  self waittill("death");
  setomnvar("ui_pip_static", 1);
  wait 0.5;
  _id_A2A9();
  setomnvar("ui_pip_static", 0);
}

_id_F435(var_0) {
  level._id_A056._id_A7EA = var_0;
}

_id_16FF(var_0) {
  level._id_A056._id_A7E8 = scripts\engine\utility::_id_227F(level._id_A056._id_A7E8, var_0);
}

_id_F434(var_0) {
  level._id_A056._id_A7E9 = var_0;
}

_id_D803(var_0, var_1) {
  if (isdefined(var_0))
  precachemodel(var_0);

  if (!isdefined(var_1))
  var_1 = (0, 0, 0);

  level._id_A056._id_C8F7 = var_0;
  level._id_A056._id_C8F8 = var_1;
}

_id_A321(var_0) {
  level._id_90E2._id_1112E = var_0;
}

_id_A31E(var_0) {
  level._id_7000 = var_0;
}

_id_A2A9(var_0) {
  _id_0B5E::_id_CBA3();

  if (isdefined(self) && isdefined(self._id_CB89) && !isdefined(var_0))
  self._id_CB89 delete();
}

_id_490C(var_0, var_1) {
  if (!isdefined(var_0))
  self._id_CB89 = _id_1063A();
  else
  self._id_CB89 = var_0;

  thread scripts\engine\utility::_id_5179(self._id_CB89);
  self._id_CB89 hide();
  var_2 = "tag_player";
  var_3 = "";
  self._id_CB89.origin = self gettagorigin(var_2);
  self._id_CB89 dontinterpolate();
  self._id_CB89 linkto(self, var_2, (0, 0, 0), (0, 0, 0));
  self._id_CB89 _meth_82A2(var_3);
  self._id_CB89 show();
}

_id_D8FE(var_0) {
  self._id_CB89 endon("death");

  for (;;) {
  iprintln("Pilot dist from linkto tag: " + distance(self._id_CB89.origin, self gettagorigin(var_0)));
  wait 0.05;
  }
}

_id_19CF(var_0) {
  _id_0B91::_id_75C4("cockpit_pip_light", var_0);
  level _id_0B91::_id_178D(_id_0B91::_id_137AA, "pip_closed");
  _id_0B91::_id_178D(_id_0B91::_id_137AA, "death");
  _id_0B91::_id_57D6();
  stopfxontag(level._effect["cockpit_pip_light"], self, var_0);
}

#using_animtree("generic_human");

_id_1063A(var_0, var_1, var_2) {
  var_3 = spawn("script_model", self.origin);
  var_0 = scripts\engine\utility::ter_op(isdefined(var_0), var_0, "body_un_jackal_pilots");
  var_3 setmodel(var_0);

  if (!isdefined(var_1))
  var_1 = scripts\engine\utility::ter_op(randomint(100) < 50, "head_bg_var_head_sc_engineering_mate_head_male_bc_02", "head_bg_var_head_male_bc_07_head_male_bc_01");

  var_2 = scripts\engine\utility::ter_op(isdefined(var_2), var_2, "helmet_un_jackal_pilots_generic");
  var_3 attach(var_1);
  var_3 attach(var_2);
  var_3 _meth_83D0(#animtree);
  var_3._id_8C7E = %head;
  var_3._id_EF82 = %scripted_talking;
  return var_3;
}

_id_B156(var_0, var_1, var_2, var_3) {
  var_4 = "tag_flash";

  if (!isdefined(level._id_1656))
  level._id_1656 = [];

  for (var_5 = 0; var_5 < var_0; var_5++) {
  thread _id_0B91::_id_CE2F("jackal_missile_launch_space_npc");
  var_6 = anglestoforward(self gettagangles(var_4)) * 250;
  var_7 = self gettagorigin(var_4) + (var_6 - (0, 0, 90));
  var_8 = var_7 + anglestoforward(self.angles) * 10000;

  if (!isdefined(var_1)) {
  var_9 = bullettrace(var_7, var_8, 0, self);
  var_8 = var_9["position"];
  var_10 = magicbullet("spaceship_forward_missile", var_7, var_8);
  } else {
  var_10 = magicbullet("spaceship_homing_missile", var_7, var_1.origin);
  var_10 thread _id_B158(var_1, var_2);

  if (isdefined(var_3))
  var_10 thread _id_699A(var_3, var_1);
  }

  if (isdefined(var_10))
  var_10 setcandamage(0);

  if (var_4 == "tag_flash")
  var_4 = "tag_flash_2";
  else
  var_4 = "tag_flash";

  wait 0.3;
  }
}

_id_B158(var_0, var_1) {
  self endon("entitydeleted");
  var_2 = distance(self.origin, var_0.origin);
  var_3 = _id_0B4D::_id_C097(5000, 12000, var_2);
  var_4 = _id_0B4D::_id_6A8E(0, 0.5, var_3);

  if (isdefined(var_1) && var_1) {}
  else
  wait(var_4);

  if (isdefined(var_0) && isvalidmissile(self) && isdefined(self))
  self _meth_8206(var_0);

  self waittill("death");
  var_0 notify("missile_hit");
}

_id_699A(var_0, var_1) {
  self endon("death");
  var_1 endon("death");

  for (;;) {
  if (distance(self.origin, var_1.origin) <= var_0) {
  var_1 notify("detonated");
  self _meth_8099();
  }

  wait 0.05;
  }
}

_id_C3DA(var_0, var_1, var_2) {
  self endon("stop_shooting");
  self endon("death");

  while (isdefined(self)) {
  _id_C3D9(var_0, undefined, var_1, var_2);
  wait(randomfloatrange(0.3, 2));
  }
}

_id_C3DB(var_0, var_1, var_2) {
  if (isdefined(self._id_EF4A))
  return;

  self._id_EF4A = 1;

  if (isdefined(self._id_B6B6))
  var_3 = self._id_B6B6;
  else
  var_3 = "magic_spaceship_30mm_projectile";

  self endon("death");
  var_4 = undefined;
  var_5 = undefined;
  var_6 = "TAG_FLASH_right";

  foreach (var_8 in var_0) {
  if (isai(var_8) && !isalive(var_8)) {
  var_0 = scripts\engine\utility::array_remove(var_0, var_8);
  wait 0.05;
  continue;
  }

  if (_id_0B91::_id_8C32(self._id_01F1, var_6)) {
  var_9 = self gettagorigin(var_6) + anglestoforward(self.angles) * 240;
  var_10 = _id_7D3F(var_8.origin, var_1, var_2);
  magicbullet(var_3, var_9, var_10, undefined, self);
  }

  if (var_6 == "TAG_FLASH_right")
  var_6 = "TAG_FLASH_left";
  else
  var_6 = "TAG_FLASH_right";

  wait 0.05;
  }

  self._id_EF4A = undefined;
}

_id_C3D9(var_0, var_1, var_2, var_3) {
  self endon("death");
  self endon("entitydeleted");
  var_4 = undefined;
  var_5 = undefined;

  if (isdefined(self._id_B6B6))
  var_6 = self._id_B6B6;
  else
  var_6 = "magic_spaceship_30mm_projectile";

  var_7 = "tag_flash_right";

  if (!isdefined(var_1))
  var_1 = randomintrange(5, 15);

  var_8 = 1;

  if (isdefined(var_0))
  var_8 = 0;

  for (var_9 = 0; var_9 < var_1; var_9++) {
  var_10 = self gettagorigin(var_7) + anglestoforward(self.angles) * 20;

  if (var_8 || !isdefined(var_0))
  var_11 = var_10 + anglestoforward(self.angles) * 1000;
  else
  var_11 = _id_7D3F(var_0.origin, var_2, var_3);

  magicbullet(var_6, var_10, var_11, undefined, self);

  if (var_7 == "tag_flash_right")
  var_7 = "tag_flash_left";
  else
  var_7 = "tag_flash_right";

  wait 0.05;
  }
}

_id_7D3F(var_0, var_1, var_2) {
  if (isdefined(var_2)) {
  if (isdefined(var_1))
  return var_0 + scripts\engine\utility::_id_DCC9(var_1, var_2);
  else
  return var_0 + scripts\engine\utility::_id_DCC9(0, var_2);
  }
  else if (isdefined(var_1)) {
  if (isdefined(var_2))
  return var_0 + scripts\engine\utility::_id_DCC9(var_1, var_2);
  else
  return var_0 + scripts\engine\utility::_id_DCC9(0, var_1);
  }

  return var_0;
}

_id_B155(var_0, var_1, var_2, var_3) {
  self notify("stop_MG_magic");
  self endon("death");
  self endon("stop_MG_magic");
  var_4 = "tag_flash";
  var_5 = "magic_spaceship_20mm_bullet";
  var_6 = gettime() + var_0 * 1000;

  if (isdefined(var_3))
  var_7 = var_3;
  else
  var_7 = 0.1;

  while (var_6 >= gettime()) {
  var_8 = anglestoaxis(self gettagangles(var_4));
  var_9 = var_8["forward"] * 250;
  var_10 = var_8["up"] * -90;
  var_11 = self gettagorigin(var_4) + var_9 + var_10;
  var_12 = var_11 + anglestoforward(self.angles) * 10000;

  if (isdefined(var_1)) {
  if (isdefined(var_1._id_01F1) && _id_0B91::_id_8C32(var_1._id_01F1, "tag_eye"))
  var_12 = var_1 gettagorigin("tag_eye");
  else
  var_12 = var_1.origin;
  } else {
  var_13 = bullettrace(var_11, var_12, 0, self);
  var_12 = var_13["position"];
  }

  if (vectordot(var_8["forward"], var_12 - var_11) > 0.0) {
  var_14 = magicbullet(var_5, var_11, var_12);
  playfxontag(level._effect["30mm_flash"], self, var_4);

  if (isdefined(var_2))
  playfx(var_2, var_12);

  _func_02F(self gettagorigin(var_4), var_12, var_5, 1);

  if (var_4 == "tag_flash")
  var_4 = "tag_flash_2";
  else
  var_4 = "tag_flash";
  }

  wait(var_7);
  }
}

_id_9CBA(var_0) {
  switch (var_0) {
  case "sa_cruiser_00":
  case "ship_assault_00":
  case "sa_wounded":
  case "sa_vips":
  case "sa_empambush":
  case "sa_moon":
  case "sa_assassination":
  return 1;
  default:
  return 0;
  }
}

_id_F43D(var_0, var_1) {
  if (!isdefined(var_1))
  var_1 = 0;

  if (isdefined(self._id_ED2D)) {
  switch (self._id_ED2D) {
  case "player":
  thread _id_0BD9::_id_556E();
  break;
  case "fake":
  self._id_ED2D = var_0;
  thread _id_0C1F::_id_552A();
  break;
  case "ai":
  self._id_ED2D = var_0;
  thread _id_0C21::_id_54F8();
  break;
  case "null":
  self._id_ED2D = var_0;
  break;
  default:
  }
  }

  switch (var_0) {
  case "player":
  self._id_ED2D = var_0;
  _id_F387();
  thread _id_0BD9::_id_622B();
  break;
  case "fake":
  self._id_ED2D = var_0;
  _id_F389("j_mainroot_ship");
  thread _id_0C1F::_id_61F8(var_1);
  break;
  case "ai":
  self._id_ED2D = var_0;
  _id_F389("j_mainroot_ship");
  thread _id_0C21::_id_61CA();
  break;
  case "null":
  self._id_ED2D = var_0;
  _id_F389("j_mainroot_ship");
  break;
  default:
  }
}

_id_F389(var_0, var_1) {
  if (!isdefined(var_0))
  var_0 = "tag_origin";

  if (!isdefined(level._id_A056))
  return;

  level._id_A056._id_3818 = scripts\engine\utility::_id_22BC(level._id_A056._id_3818);

  if (!scripts\engine\utility::array_contains(level._id_A056._id_3818, self))
  level._id_A056._id_3818 = scripts\engine\utility::_id_2279(level._id_A056._id_3818, self);

  self._id_615D = spawnstruct();
  self._id_615D._id_7601 = var_0;
  self._id_615D._id_619D = 0;
  self._id_615D._id_C78B = 0;

  if (isdefined(var_1))
  self._id_615D._id_C76E = var_1;
}

_id_F387() {
  if (!isdefined(level._id_A056) || !isdefined(level._id_A056._id_3818))
  return;

  if (!scripts\engine\utility::array_contains(level._id_A056._id_3818, self))
  level._id_A056._id_3818 = scripts\engine\utility::array_remove(level._id_A056._id_3818, self);
}

_id_A169() {
  self endon("stop_displaying_speed");
  self endon("death");
  var_0 = (1, 0, 0);

  for (;;)
  wait 0.05;
}

_id_A207(var_0) {
  if (!isdefined(self._id_8E5D))
  self._id_8E5D = [];

  if (!scripts\engine\utility::array_contains(self._id_8E5D, var_0))
  self._id_8E5D = scripts\engine\utility::_id_2279(self._id_8E5D, var_0);

  self _meth_8189(var_0);
}

_id_A335(var_0) {
  if (!isdefined(self._id_8E5D))
  return;

  if (!scripts\engine\utility::array_contains(self._id_8E5D, var_0))
  return;

  self._id_8E5D = scripts\engine\utility::array_remove(self._id_8E5D, var_0);
  self _meth_8383();

  foreach (var_2 in self._id_8E5D)
  self _meth_8189(var_2);
}

_id_A334() {
  self._id_8E5D = [];
  self _meth_8383();
}

_id_A208(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0) {
  _id_A207("j_mainroot");
  _id_A207("tag_cambone");
  } else {
  _id_A335("j_mainroot");
  _id_A335("tag_cambone");
  }
}

_id_1985() {
  if (isdefined(self._id_4074))
  return;

  self._id_4074 = [];
  self waittill("entitydeleted");

  if (issentient(self))
  self _meth_80F7();

  level._id_A056._id_1630 = scripts\engine\utility::array_remove(level._id_A056._id_1630, self);

  if (self._id_EEDE == "allies") {
  if (scripts\engine\utility::array_contains(level._id_A056._id_1914, self))
  level._id_A056._id_1914 = scripts\engine\utility::array_remove(level._id_A056._id_1914, self);
  }
  else if (scripts\engine\utility::array_contains(level._id_A056._id_191E, self))
  level._id_A056._id_191E = scripts\engine\utility::array_remove(level._id_A056._id_191E, self);

  foreach (var_1 in self._id_4074) {
  if (isdefined(var_1))
  var_1 delete();
  }
}

_id_1980(var_0, var_1) {
  if (isdefined(var_0)) {}

  if (isdefined(var_1)) {}

  self._id_154D = var_0;
  self._id_734A = var_1;
}

_id_6B4C(var_0, var_1) {
  if (!isdefined(var_1))
  var_1 = 0;

  thread _id_0C1A::_id_A3B6(var_0, 1.0);
  thread _id_0C20::_id_A3B7(var_0);

  if (!var_1)
  thread _id_0C18::_id_A3B5(var_0);

  self._id_6B4E = var_0;
}

_id_6B4D() {
  self._id_2578._id_10E19 = undefined;
  self._id_2578._id_552E = undefined;
  self._id_7542._id_10E19 = undefined;

  if (isdefined(self._id_7542._id_552E))
  self thread [[self._id_7542._id_552E]]();

  self._id_7542._id_552E = undefined;
  self._id_0047._id_10E19 = undefined;
  self._id_6B4E = undefined;
}

_id_A19D(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  setdvar("scr_jackalDemigod", 1);
  else
  setdvar("scr_jackalDemigod", 0);
}

_id_A324(var_0) {
  _id_A144();
  self setmodel(var_0);
  _id_A0AF();
}

_id_A0AF() {
  if (isdefined(self._id_C899) && self._id_C899 == 1)
  return;

  if (self._id_01F1 != "veh_mil_air_un_jackal_02")
  return;

  self attach("veh_mil_air_un_jackal_02_panels", "j_panel_hide", 1);
  self._id_C899 = 1;
}

_id_A144() {
  if (!isdefined(self._id_C899) || self._id_C899 == 0)
  return;

  if (self._id_01F1 != "veh_mil_air_un_jackal_02")
  return;

  self _meth_8096("veh_mil_air_un_jackal_02_panels", "j_panel_hide");
  self._id_C899 = 0;
}

_id_A1BC() {
  if (isdefined(self._id_E5DE))
  return;

  _id_0C20::_id_AA92();
  _id_0C20::_id_AA91();
  _id_A144();
  var_0 = _id_107BA("j_rocket_booster_rear_left1");
  var_1 = _id_107BA("j_rocket_booster_rear_left2");
  var_2 = _id_107BA("j_rocket_booster_rear_right1");
  var_3 = _id_107BA("j_rocket_booster_rear_right2");
  self._id_E5DE = [var_0, var_1, var_2, var_3];
  self._id_4074 = scripts\engine\utility::_id_227F(self._id_4074, self._id_E5DE);
}

_id_107BA(var_0) {
  var_1 = self gettagorigin(var_0);
  var_2 = spawn("script_model", var_1);
  var_2 setmodel("veh_mil_air_un_jackal_01_rocket");
  var_2 linkto(self, var_0, (0, 0, 0), (0, 0, 0));
  return var_2;
}

_id_ACF8() {
  for (;;) {
  if (!isdefined(level._id_D127))
  var_0 = level.player;
  else
  var_0 = level._id_D127;

  wait 0.05;
  }
}

_id_A2DC() {
  if (!isdefined(self._id_E5DE))
  return;

  foreach (var_1 in self._id_E5DE) {
  self._id_4074 = scripts\engine\utility::array_remove(self._id_4074, var_1);
  var_1 delete();
  }

  self._id_E5DE = undefined;
}

_id_A19F() {
  if (isdefined(self._id_7542._id_13D7E) && self._id_7542._id_13D7E)
  return;

  self endon("entitydeleted");
  self endon("dont_start_winglights");
  self notify("dont_stop_winglights");
  var_0 = self._id_EEDE + "_winglight";
  var_1 = self._id_EEDE + "_taillight";
  var_2 = self._id_EEDE + "_bellylight";
  _id_0B91::_id_75C4(var_0, "tag_wing_front_left", 0, "dont_start_winglights");
  _id_0B91::_id_75C4(var_0, "tag_wing_front_right", 0, "dont_start_winglights");
  _id_0B91::_id_75C4(var_1, "tag_wing_rear_left", 0, "dont_start_winglights");
  _id_0B91::_id_75C4(var_1, "tag_wing_rear_right", 0, "dont_start_winglights");
  _id_0B91::_id_75C4(var_2, "tag_bottom_light", 0, "dont_start_winglights");
  self._id_7542._id_13D7E = 1;
}

_id_A167() {
  if (!isdefined(self._id_7542._id_13D7E) || isdefined(self._id_7542._id_13D7E) && !self._id_7542._id_13D7E)
  return;

  self endon("entitydeleted");
  self endon("dont_stop_winglights");
  self notify("dont_start_winglights");
  var_0 = self._id_EEDE + "_winglight";
  var_1 = self._id_EEDE + "_taillight";
  var_2 = self._id_EEDE + "_bellylight";
  _id_0B91::_id_75F8(var_0, "tag_wing_front_left", 0, "dont_stop_winglights");
  _id_0B91::_id_75F8(var_0, "tag_wing_front_right", 0, "dont_stop_winglights");
  _id_0B91::_id_75F8(var_1, "tag_wing_rear_left", 0, "dont_stop_winglights");
  _id_0B91::_id_75F8(var_1, "tag_wing_rear_right", 0, "dont_stop_winglights");
  _id_0B91::_id_75F8(var_2, "tag_bottom_light", 0, "dont_stop_winglights");
  self._id_7542._id_13D7E = 0;
}

_id_77E0() {
  var_0 = level._id_A056._id_1630;
  var_0 = scripts\engine\utility::_id_22BC(var_0);
  return var_0;
}

_id_77D8() {
  var_0 = level._id_A056._id_191E;
  var_0 = scripts\engine\utility::_id_22BC(var_0);
  return var_0;
}

_id_19A4(var_0) {
  self._id_1198._id_90F3 = var_0;
}

_id_19B8(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  self._id_3D4F = 1;
  else
  self._id_3D4F = undefined;
}

_id_19AA(var_0) {
  self _meth_8365(var_0);
  self.weapon = var_0;
  self._id_13C87 = weaponfiretime(self.weapon);
  self._id_13C87 = max(self._id_13C87, 0.05);
}

_id_19A8(var_0) {
  self._id_1198._id_D9BA = var_0;
}

_id_19A6(var_0) {
  if (isdefined(var_0) && var_0) {
  _id_19B0("fly");
  self._id_1198._id_AAB2 = var_0;
  } else {
  self._id_1198._id_AAB2 = 0;
  _id_19B0("none");
  }
}

_id_198F(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  self _meth_8555(var_0);
}

_id_1983() {
  if (!isdefined(self._id_1198))
  return;

  if (isdefined(self._id_1198._id_A421)) {
  self._id_1198._id_A421 _id_1983();
  return;
  }

  if (isdefined(self._id_A420)) {
  foreach (var_1 in self._id_A420) {
  if (isalive(var_1)) {
  var_1._id_1198._id_A421 = undefined;
  var_1 _id_19B7();
  }
  }

  self._id_A420 = undefined;
  }
}

_id_199F() {
  if (isdefined(self._id_1198._id_A421))
  self._id_1198._id_A421._id_A420 = scripts\engine\utility::array_remove(self._id_1198._id_A421._id_A420, self);

  self._id_1198._id_A421 = undefined;
  _id_19B7();
}

_id_A253(var_0) {
  if (!isdefined(self._id_A420))
  self._id_A420 = [];

  self._id_A420[self._id_A420.size] = var_0;
}

_id_1991(var_0) {
  self endon("death");
  self notify("new_evade_anim");

  if (isdefined(self._id_67C7) && self._id_67C7)
  return;

  if (isdefined(var_0)) {
  var_1 = var_0;
  var_2 = 1;
  } else {
  var_2 = 0;
  var_1 = level._id_A065["evasion"][level._id_A056._id_67D8];
  }

  self _meth_82AB(var_1, 1, 0.0);
  self _meth_82A2(level._id_A065["evasion_overlay"], 1.0);

  if (!var_2) {
  level._id_A056._id_67D8++;

  if (level._id_A056._id_67D8 == level._id_A065["evasion"].size) {
  level._id_A056._id_67D8 = 0;
  level._id_A065["evasion"] = scripts\engine\utility::_id_22A7(level._id_A065["evasion"]);
  }
  }

  self._id_67C7 = 1;
  var_3 = 0.7;
  wait(getanimlength(var_1) * var_3);
  self._id_67C7 = 0;
  self endon("new_evade_anim");
  wait(getanimlength(var_1) * (1 - var_3));
}

_id_199E(var_0, var_1) {
  self._id_1198._id_A421 = var_0;
  var_0 _id_A253(self);

  if (!isdefined(var_1)) {
  var_1 = self.origin - var_0.origin;
  var_1 = rotatevectorinverted(var_1, var_0.angles);
  }

  _id_1994(var_0, var_1);
}

_id_19B3(var_0, var_1) {
  self._id_1198._id_10A4D[var_0] = var_1;
}

_id_19B4(var_0) {
  self._id_1198._id_10A4B = var_0;
}

_id_A202(var_0) {
  var_1 = self gettagorigin("tag_flash_right");
  var_2 = var_0.origin + (0, 0, 30);
  var_3 = scripts\engine\trace::_id_48BC(1, 1, 0, 1, 1, 1);
  var_4 = scripts\engine\trace::_id_DCED(var_1, var_2, undefined, var_3, 1);

  if (isdefined(var_4["entity"]) && var_4["entity"] == var_0)
  return 1;

  return 0;
}

_id_A288(var_0) {
  if (var_0)
  _id_1980(1, 1);
  else
  _id_1980();
}

_id_A0B3(var_0) {
  self._id_1198._id_2520 = var_0;
}

_id_A342(var_0, var_1, var_2) {
  if (isdefined(self._id_1198))
  _id_1981();

  if (!isdefined(var_0)) {}

  if (isdefined(var_2) && var_2)
  var_3 = self.origin;
  else
  var_3 = undefined;

  _id_0C24::_id_10A46(var_0, var_1, var_3);
}

_id_F5BD(var_0) {
  switch (var_0) {
  case "runway":
  self._id_11474 = _id_0BDB::_id_1147D;
  break;
  case "retribution":
  self._id_11474 = _id_0BDB::_id_1147C;
  break;
  case "shipcrib":
  self._id_11474 = _id_0BDB::_id_11486;
  break;
  case "instant":
  self._id_11474 = _id_0BDB::_id_11478;
  break;
  case "vtol":
  self._id_11474 = _id_0BDB::_id_1148A;
  break;
  case "hovering":
  self._id_11474 = _id_0BDB::_id_11477;
  break;
  case "ship_assault_gunner":
  self._id_11474 = _id_0BDB::_id_11484;
  break;
  case "phspace_launch":
  self._id_11474 = _id_0BDB::_id_11479;
  break;
  default:
  }

  self._id_11488 = var_0;
}

_id_7BBA() {
  var_0 = level.player _meth_8473();

  if (isdefined(var_0))
  return var_0.origin;
  else
  return level.player.origin;
}

_id_7BB9() {
  var_0 = level.player _meth_8473();

  if (isdefined(var_0))
  return var_0.angles;
  else
  return level.player.angles;
}

_id_F448(var_0) {
  switch (var_0) {
  case "instant":
  self._id_A7B9 = _id_0BDB::_id_A7BB;
  break;
  default:
  }

  self._id_A7C1 = var_0;
}

_id_F48D(var_0) {
  switch (var_0) {
  case "default_landed":
  self._id_BBD4 = _id_0BDB::_id_BBD0;
  _id_F420(500, 135, -30, 1, 1);
  break;
  case "runway":
  self._id_BBD4 = _id_0BDB::_id_BBE4;
  _id_F420(500, 135, 0, 1, 1);
  break;
  case "runway_moon":
  self._id_BBD4 = _id_0BDB::_id_BBE5;
  _id_F420(500, 135, 0, 1, 1);
  break;
  case "titan_breifing":
  self._id_BBD4 = _id_0BDB::_id_BBE9;
  _id_F420(500, 135, 30, 1, 1);
  break;
  case "instant_fly":
  self._id_BBD4 = _id_0BDB::_id_BBDB;
  _id_F420(500, 135, -30, 0, 0);
  break;
  case "instant_hover":
  self._id_BBD4 = _id_0BDB::_id_BBD8;
  _id_F420(500, 135, -30, 0, 0);
  break;
  case "instant_land":
  self._id_BBD4 = _id_0BDB::_id_BBD9;
  _id_F420(500, 135, -30, 0, 0);
  break;
  case "jump_in":
  _id_F420(500, 135, 30, 1, 1);
  self._id_BBD4 = _id_0BDB::_id_BBDD;
  break;
  case "zero_g":
  _id_F420(500, 135, 30, 1, 1);
  self._id_BBD4 = _id_0BDB::_id_BBEF;
  break;
  case "zero_g_enemy":
  _id_F420(500, 135, 30, 1, 1);
  self._id_BBD4 = _id_0BDB::_id_BBF0;
  break;
  case "crib_launch":
  _id_F420(500, 135, -30, 1, 1);
  self._id_BBD4 = _id_0BDB::_id_BBCF;
  break;
  case "shipcrib_europa_launch":
  _id_F420(500, 135, -30, 0, 1);
  self._id_BBD4 = _id_0BDB::_id_BBE6;
  break;
  case "retribution":
  _id_F420(500, 135, -30, 1, 1);
  self._id_BBD4 = _id_0BDB::_id_BBD9;
  break;
  case "visor_pulldown_landed":
  _id_F420(500, 135, -30, 1, 1);
  self._id_BBD4 = _id_0BDB::_id_BBDE;
  break;
  default:
  }

  self._id_BBEB = var_0;
}

_id_F48C(var_0, var_1, var_2, var_3) {
  if (isdefined(var_0))
  self._id_1EE1 = var_0;

  if (isdefined(var_1))
  self._id_1EE2 = var_1;

  if (isdefined(var_2))
  self._id_1F20 = var_2;

  if (isdefined(var_2))
  self._id_1F21 = var_3;
}

_id_F358(var_0) {
  switch (var_0) {
  case "default_landed":
  self._id_5688 = _id_0BDB::_id_5685;
  break;
  case "zero_g":
  self._id_5688 = _id_0BDB::_id_56A6;
  break;
  case "crib_craneride":
  self._id_5688 = _id_0BDB::_id_5684;
  break;
  case "dismount_shipcrib_moon":
  self._id_5688 = _id_0BDB::_id_56A0;
  break;
  case "dismount_shipcrib_gravity":
  self._id_5688 = _id_0BDB::_id_569F;
  break;
  case "instant":
  self._id_5688 = _id_0BDB::_id_568E;
  break;
  case "moon_dismount":
  self._id_5688 = _id_0BDB::_id_5695;
  break;
  case "heist_mons_breach":
  self._id_5688 = _id_0BDB::_id_568B;
  break;
  default:
  }

  self._id_56A4 = var_0;
}

_id_F420(var_0, var_1, var_2, var_3, var_4) {
  if (!isdefined(self._id_99F5)) {
  self._id_99F5 = spawnstruct();
  self._id_99F5._id_BBF1 = 0;
  self._id_99F5._id_AB4B = 1;
  self._id_99F5._id_E526 = 1;
  self._id_99F5._id_5B3A = 500;
  self._id_99F5._id_12FC3 = 130;
  self._id_99F5.height = -30;
  self._id_99F5._id_56B6 = 35;
  }

  if (isdefined(var_3))
  self._id_99F5._id_AB4B = var_3;

  if (isdefined(var_4))
  self._id_99F5._id_E526 = var_4;

  if (isdefined(var_0))
  self._id_99F5._id_5B3A = var_0;

  if (isdefined(var_1))
  self._id_99F5._id_12FC3 = var_1;

  if (isdefined(var_2))
  self._id_99F5.height = var_2;

  _id_DE6D();
}

#using_animtree("jackal");

_id_A2DE(var_0, var_1, var_2, var_3) {
  var_1 = 0;

  if (!isdefined(var_0))
  var_0 = 1;

  if (!isdefined(var_2))
  var_2 = 0;

  if (!isdefined(var_3))
  var_3 = 0;

  if (!isdefined(var_1))
  var_1 = 0.2;

  self _meth_848F(var_0);

  if (var_0 && !var_2) {
  self _meth_806F(%jackal_thrust_p, var_1);
  self _meth_806F(%jackal_motion_idle_p, var_1);
  self _meth_806F(%root, var_1);
  self _meth_806F(%jackal_assault_lhand_fb_range_p, var_1);
  self _meth_806F(%jackal_assault_lhand_lr_range_p, var_1);
  self _meth_806F(%jackal_assault_rhand_fb_range_p, var_1);
  self _meth_806F(%jackal_assault_rhand_lr_range_p, var_1);
  self _meth_806F(%jackal_strike_lhand_fb_range_p, var_1);
  self _meth_806F(%jackal_strike_lhand_lr_range_p, var_1);
  self _meth_806F(%jackal_strike_rhand_fb_range_p, var_1);
  self _meth_806F(%jackal_strike_rhand_lr_range_p, var_1);
  }

  if (var_0 && !var_3) {
  self _meth_806F(%jackal_weapon_switch_p, var_1);
  self _meth_806F(%jackal_weapon_drop_p, var_1);
  self _meth_806F(%jackal_vehicle_weap_primary_fire_l_p, var_1);
  self _meth_806F(%jackal_vehicle_weap_primary_fire_r_p, var_1);
  self _meth_806F(%jackal_vehicle_weap_secondary_fire_l_p, var_1);
  self _meth_806F(%jackal_vehicle_weap_secondary_fire_r_p, var_1);
  }
}

_id_A16F() {
  while (level._id_A056._id_56F9.size == 0)
  wait 0.05;

  for (;;) {
  while (!isdefined(level._id_D127))
  wait 0.05;

  level._id_A056._id_56F9 = scripts\engine\utility::_id_22BC(level._id_A056._id_56F9);

  if (level._id_A056._id_56F9.size == 0)
  break;

  var_0 = 1;
  var_1 = 1;
  var_2 = anglestoforward(level._id_D127.angles);
  var_3 = level._id_D127.origin;

  foreach (var_5 in level._id_A056._id_56F9) {
  if (!isdefined(var_5))
  continue;

  if (isdefined(var_5._id_A496)) {
  var_6 = level._id_D127.origin - var_5.origin;
  var_7 = rotatevectorinverted(var_6, var_5.angles);
  var_8 = _id_394B(var_7[0], var_5._id_A496);
  var_9 = _id_394B(var_7[1], var_5._id_A497);
  var_10 = _id_394B(var_7[2], var_5._id_A498);
  var_7 = (var_8, var_9, var_10);
  var_6 = rotatevector(var_7, var_5.angles);
  var_5._id_A493 = var_5.origin + var_6;
  }
  else
  var_5._id_A493 = var_5.origin;

  var_11 = distance(var_5._id_A493, level._id_D127.origin);
  var_12 = _id_0B4D::_id_C097(var_5._id_A492, var_5._id_A490, var_11);
  var_13 = _id_0B4D::_id_6A8E(var_5._id_A494, 1, var_12);

  if (isdefined(var_5._id_A491)) {
  var_14 = vectordot(vectornormalize(var_5._id_A493 - var_3), var_2);
  var_12 = _id_0B4D::_id_C097(-0.5, 0.2, var_14);
  var_13 = _id_0B4D::_id_6A8E(1, var_13, var_12);
  }

  if (isdefined(var_5._id_A494))
  var_15 = _id_0B4D::_id_6A8E(var_5._id_A48F, 1, var_12);

  if (var_13 < var_0)
  var_0 = var_13;

  if (var_13 < var_0)
  var_0 = var_13;
  }

  _id_A301(var_0, 0.05, "radius_dist");
  _id_A2FC(var_1, 0.05, "radius_dist");
  wait 0.05;
  }

  level._id_A056._id_56F9 = undefined;
}

_id_394B(var_0, var_1) {
  var_1 = var_1 * 0.5;

  if (var_0 > var_1)
  var_0 = var_1;
  else if (var_0 < var_1 * -1)
  var_0 = var_1 * -1;

  return var_0;
}

_id_A2DF() {
  thread _id_A2E0();
}

_id_A2E0() {
  if (!_id_0B91::_id_B324())
  return;

  level._id_A056._id_E1A6 = scripts\engine\utility::_id_22BC(level._id_A056._id_E1A6);
  level._id_A056._id_E1A6 = scripts\engine\utility::_id_2279(level._id_A056._id_E1A6, self);
  var_0 = "repulser_force" + level._id_A056._id_E1A5;
  level._id_A056._id_E1A5++;

  for (;;) {
  if (!isdefined(level._id_D127)) {
  wait 0.05;
  continue;
  }

  if (!isdefined(self))
  break;

  scripts\engine\utility::waittill_any("slowdown_point_factored", "death", "repulser_removed");

  if (!isdefined(self) || !scripts\engine\utility::array_contains(level._id_A056._id_E1A6, self))
  break;

  if (level._id_D127._id_C2CB) {
  var_1 = level._id_D127._id_02AC;
  var_2 = self._id_A493 - level._id_D127.origin;
  var_3 = length(var_2);
  var_4 = _id_0B4D::_id_C097(-200, 750, var_3);
  var_5 = _id_0B4D::_id_6A8E(self.origin, self._id_A493, var_4);
  var_6 = var_5 - level._id_D127.origin;
  var_7 = vectornormalize(var_6);
  var_8 = vectordot(var_1, var_7);
  var_8 = max(0, var_8);
  var_3 = length(var_2);
  var_4 = _id_0B4D::_id_C097(2000, 8000, var_3);
  var_9 = _id_0B4D::_id_6A8E(-0.5 * var_8, 0, var_4);
  var_10 = _id_0B4D::_id_6A8E(var_8, 0, var_4);
  var_11 = var_9 * var_7;
  var_12 = 1 - _id_0B4D::_id_C097(20, 100, var_10);
  _id_A301(var_12, 0, var_0);
  _id_A2FC(var_12, 0, var_0);
  _id_A078(var_11, 0, var_0);
  continue;
  }

  _id_A078((0, 0, 0), 0, var_0);
  _id_A301(1, 0, var_0);
  _id_A2FC(1, 0, var_0);
  }

  _id_A34D();
  _id_A078((0, 0, 0), 0, var_0);
}

_id_A34D() {
  if (isdefined(self) && scripts\engine\utility::array_contains(level._id_A056._id_E1A6, self)) {
  self notify("repulser_removed");
  level._id_A056._id_E1A6 = scripts\engine\utility::array_remove(level._id_A056._id_E1A6, self);
  }
}

_id_A16E(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7) {
  if (!isdefined(level._id_A056._id_56F9)) {
  level._id_A056._id_56F9 = [];
  level thread _id_A16F();
  }

  self._id_A492 = var_0;
  self._id_A490 = var_1;
  self._id_A494 = var_2;

  if (isdefined(var_3))
  self._id_A48F = var_3;

  if (isdefined(var_4)) {
  self._id_A496 = var_4;
  self._id_A497 = var_5;
  self._id_A498 = var_6;
  }

  if (isdefined(var_7))
  self._id_A491 = var_7;
  else
  self._id_A491 = 0;

  self._id_A495 = 1;
  level._id_A056._id_56F9 = scripts\engine\utility::_id_2279(level._id_A056._id_56F9, self);
}

_id_A16B(var_0) {
  thread _id_A16C(var_0);
}

_id_A16C(var_0) {
  self endon("death");

  if (isdefined(var_0)) {
  for (var_1 = var_0; var_1 > 0; var_1 = var_1 - 0.05) {
  self._id_A495 = _id_0B4D::_id_C097(0, var_0, var_1);
  wait 0.05;
  }
  }

  level._id_A056._id_56F9 = scripts\engine\utility::array_remove(level._id_A056._id_56F9, self);
}

_id_A25B(var_0, var_1, var_2, var_3, var_4, var_5) {
  if (!isdefined(level._id_D127._id_AD1E))
  level._id_D127._id_AD1E = [];

  level._id_D127._id_AD1E = scripts\engine\utility::_id_22BC(level._id_D127._id_AD1E);
  self._id_AD25 = var_2;
  self._id_AD19 = var_3;
  self._id_AD42 = var_1;

  if (!scripts\engine\utility::array_contains(level._id_D127._id_AD1E, self))
  level._id_D127._id_AD1E = scripts\engine\utility::_id_2279(level._id_D127._id_AD1E, self);

  if (isdefined(var_5) && var_5)
  self linkto(level._id_D127, var_1, var_2, var_3);
  else if (!isdefined(var_4)) {
  level.player.spaceship_linked_ent = self;
  level.player _meth_8468(self, var_1, var_0, var_2, var_3);
  } else {
  self._id_10B89 = scripts\engine\utility::_id_107E6(self.origin, self.angles - (0, 180, 0));
  thread _id_2B74(self._id_10B89, level._id_D127, var_0, 0, "tag_origin", "j_canopy");
  }
}

_id_A387() {
  if (isdefined(level._id_D127) && isdefined(level._id_D127._id_AD1E) && scripts\engine\utility::array_contains(level._id_D127._id_AD1E, self)) {
  level._id_D127._id_AD1E = scripts\engine\utility::array_remove(level._id_D127._id_AD1E, self);

  if (!isdefined(level.player.spaceship_linked_ent) || level.player.spaceship_linked_ent == self) {
  level.player _meth_8469();
  level.player.spaceship_linked_ent = undefined;
  }
  }
}

_id_A386(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  level.player _meth_8490("unlimited_boost", var_0);
}

_id_A160(var_0, var_1) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (!isdefined(var_1))
  var_1 = 0.0;

  if (var_0) {
  level.player _id_0B91::_id_65E1("disable_jackal_quickturn");
  var_2 = 0;
  } else {
  level.player _id_0B91::_id_65DD("disable_jackal_quickturn");
  var_2 = 1;
  }

  level._id_D127 thread _id_DBA5(var_2, var_1);
}

_id_DBA5(var_0, var_1) {
  self notify("blend_quickturn_master");
  self endon("blend_quickturn_master");

  if (!isdefined(self._id_DBA2))
  return;

  if (var_1 == 0) {
  self._id_DBA2._id_B3D1 = var_0;
  return;
  }

  self._id_DBA2._id_2B8D = 1;
  var_2 = (var_0 - self._id_DBA2._id_B3D1) / var_1 * 0.05;
  var_3 = self._id_DBA2._id_B3D1;
  var_4 = var_1;

  while (var_4 > 0) {
  var_3 = var_3 + var_2;
  self._id_DBA2._id_B3D1 = clamp(var_3, 0, 1);
  var_4 = var_4 - 0.05;
  self notify("quickturn_master_blend_complete");
  level.player waittill("on_player_update");
  }

  self._id_DBA2._id_B3D1 = var_0;
  self notify("quickturn_master_blend_complete");
  self._id_DBA2._id_2B8D = 0;
}

_id_12DCD(var_0) {
  var_1 = ["weapons", "thrusters", "hull", "none"];

  if (!scripts\engine\utility::array_contains(var_1, var_0)) {}

  level._id_A056._id_D3C1 = var_0;
  _id_12DD0(var_0 == "weapons");
  _id_12DCF(var_0 == "thrusters");
  _id_12DCE(var_0 == "hull");
}

_id_12DD0(var_0) {
  if (isdefined(level._id_D127._id_4C15))
  level._id_D127 _id_0BD9::_id_D17E();

  if (isdefined(level._id_D127._id_B898))
  _id_0BDD::_id_A27B();
}

_id_12DCF(var_0) {
  level._id_D127 _id_0BD9::_id_A31B();

  if (var_0)
  return;

  return;
}

_id_12DCE(var_0) {
  level._id_D127 _id_0BD5::_id_F481();

  if (var_0)
  return;

  return;
}

_id_A07D() {
  if (!_id_0B91::_id_B324())
  return;

  if (isdefined(self._id_4F5E))
  self._id_4F5E delete();

  self._id_FF24 = 1;

  if (_id_A2A7())
  return;

  var_0 = _id_0A2F::_id_D9FB();

  if (self._id_01F1 == "veh_mil_air_un_jackal_landed_03b")
  var_1 = (-3.99147, 0, -15.6889);
  else
  var_1 = (0, 0, 0);

  self._id_4F5E = spawn("script_model", self.origin);
  self._id_4F5E setmodel(var_0);
  self._id_4F5E linkto(self, "tag_body", var_1, (0, 0, 0));
}

_id_A077(var_0) {
  if (isdefined(self._id_4F5E))
  self._id_4F5E delete();

  var_1 = strtok(var_0, "_");
  var_2 = var_1.size - 1;
  var_3 = "livery_" + var_1[var_2 - 1] + "_" + var_1[var_2] + "_tr";

  if (!scripts\engine\utility::_id_6E25(var_3 + "_loaded"))
  _id_0B91::_id_12641(var_3);

  self._id_4F5E = spawn("script_model", self.origin);
  self._id_4F5E setmodel(var_0);
  self._id_4F5E linkto(self, "tag_body", (0, 0, 0), (0, 0, 0));
}

_id_A2DA() {
  if (isdefined(self._id_4F5E))
  self._id_4F5E delete();
}

_id_8B87() {
  if (self._id_93D2.size > 0)
  return 1;
  else
  return 0;
}

_id_1378D(var_0) {
  self endon("death");

  for (;;) {
  if (_id_9C1B(var_0))
  break;

  wait 0.05;
  }
}

_id_137C2(var_0) {
  self endon("death");

  for (;;) {
  if (!_id_9C1B(var_0))
  break;

  wait 0.05;
  }
}

_id_9C1B(var_0) {
  var_1 = _id_0B76::_id_7A60(self.origin);

  if (var_1 > var_0)
  return 1;
  else
  return 0;
}

_id_1378C(var_0) {
  self endon("death");

  for (;;) {
  if (_id_9C1A(var_0))
  break;

  wait 0.05;
  }
}

_id_137C1(var_0) {
  self endon("death");

  for (;;) {
  if (!_id_9C1A(var_0))
  break;

  wait 0.05;
  }
}

_id_9C1A(var_0) {
  var_1 = distance(self.origin, level._id_D127.origin);

  if (var_1 < var_0)
  return 1;
  else
  return 0;
}

_id_A149(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0) {
  var_0 = 0;
  level.player _id_0B91::_id_65E1("disable_jackal_ads");
  level.player _meth_8490("disable_lockon", 1);
  } else {
  var_0 = 1;
  level.player _id_0B91::_id_65DD("disable_jackal_ads");

  if (!level.player _id_0B91::_id_65DB("disable_jackal_lockon"))
  level.player _meth_8490("disable_lockon", 0);
  }

  level.player _meth_8009(var_0);
}

_id_A14D(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  level.player _meth_8490("disable_collision", var_0);

  if (var_0)
  _func_1C5("spaceshipResolvePenetration", 0);
  else
  _func_1C5("spaceshipResolvePenetration", 1);
}

_id_A14A(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  level.player _meth_8490("disable_boost", var_0);
}

_id_A162(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  level.player _id_0B91::_id_65E1("disable_jackal_targetAid");
  else
  level.player _id_0B91::_id_65DD("disable_jackal_targetAid");
}

_id_A35D(var_0, var_1) {
  level notify("new_target_aid_pool");
  level._id_A056._id_EF83 = var_0;

  if (isdefined(var_1) && var_1)
  thread _id_A35E();
}

_id_A35E() {
  level endon("new_target_aid_pool");

  while (isdefined(level._id_A056._id_EF83) && level._id_A056._id_EF83.size > 0) {
  level._id_A056._id_EF83 = scripts\engine\utility::_id_22BC(level._id_A056._id_EF83);
  wait 0.05;
  }

  level._id_A056._id_EF83 = undefined;
}

_id_A163(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  level.player _id_0B91::_id_65E1("disable_jackal_targetAid_update");
  else
  level.player _id_0B91::_id_65DD("disable_jackal_targetAid_update");
}

jackal_disable_damage_vision_distortion(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  level.player _id_0B91::_id_65E1("disable_jackal_damage_vision_distortion");
  else
  level.player _id_0B91::_id_65DD("disable_jackal_damage_vision_distortion");
}

jackal_engine_throttle_sfx_volume(var_0, var_1) {
  if (!isdefined(var_1))
  var_1 = 0;

  var_0 = clamp(var_0, 0, 1);
  level._id_D127 thread jackal_engine_throttle_sfx_volume_internal(var_0, var_1);
}

jackal_engine_throttle_sfx_volume_internal(var_0, var_1) {
  self notify("new_engine_throttle_volume");
  self endon("new_engine_throttle_volume");
  self endon("player_exit_jackal");
  self endon("death");

  if (!isdefined(self.engine_master_volume))
  self.engine_master_volume = 0;

  var_2 = self.engine_master_volume;

  for (var_3 = var_1; var_3 > 0; var_3 = var_3 - 0.05) {
  var_4 = _id_0B4D::_id_C097(0, var_1, var_3);
  self.engine_master_volume = _id_0B4D::_id_6A8E(var_0, var_2, var_4);
  wait 0.05;
  }

  self.engine_master_volume = var_0;
}

_id_A14C(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  level._id_D127._id_5509 = var_0;
}

_id_A15C(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  level.player _id_0B91::_id_65E1("disable_jackal_mode_switch");
  else
  level.player _id_0B91::_id_65DD("disable_jackal_mode_switch");
}

_id_A154(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  level.player _id_0B91::_id_65E1("disable_jackal_cockpit_VO");
  else
  level.player _id_0B91::_id_65DD("disable_jackal_cockpit_VO");
}

_id_A15B(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  level.player _id_0B91::_id_65E1("disable_jackal_missiles");
  else
  level.player _id_0B91::_id_65DD("disable_jackal_missiles");
}

_id_A14F(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  level.player _id_0B91::_id_65E1("disable_jackal_emp");
  else
  level.player _id_0B91::_id_65DD("disable_jackal_emp");
}

_id_A158(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  level.player _id_0B91::_id_65E1("disable_jackal_map_boundary_autoturn");
  else
  level.player _id_0B91::_id_65DD("disable_jackal_map_boundary_autoturn");
}

_id_A159(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  level.player _id_0B91::_id_65E1("disable_jackal_map_boundary_push");
  else
  level.player _id_0B91::_id_65DD("disable_jackal_map_boundary_push");
}

_id_A15A(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  level.player _id_0B91::_id_65E1("disable_jackal_map_boundary_warning");
  else
  level.player _id_0B91::_id_65DD("disable_jackal_map_boundary_warning");
}

_id_A155(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  level.player _id_0B91::_id_65E1("disable_jackal_juke");
  else
  level.player _id_0B91::_id_65DD("disable_jackal_juke");

  level.player _meth_8490("disable_juke", var_0);
}

_id_A161(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  level.player _id_0B91::_id_65E1("disable_jackal_roll");
  else
  level.player _id_0B91::_id_65DD("disable_jackal_roll");

  if (_id_0B91::_id_D123())
  _id_0BD9::_id_F380();
}

_id_A15E(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  level.player _id_0B91::_id_65E1("disable_jackal_overheat");
  else
  level.player _id_0B91::_id_65DD("disable_jackal_overheat");
}

_id_A14E(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  level.player _id_0B91::_id_65E1("disable_jackal_dogfight");
  else
  level.player _id_0B91::_id_65DD("disable_jackal_dogfight");
}

_id_A151(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  level.player _id_0B91::_id_65E1("disable_jackal_flares");
  else
  level.player _id_0B91::_id_65DD("disable_jackal_flares");
}

_id_A153(var_0, var_1) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (!isdefined(var_1))
  var_1 = 0;

  if (var_0 && !level.player _id_0B91::_id_65DB("disable_jackal_guns")) {
  level.player _id_0B91::_id_65E1("disable_jackal_guns");
  _id_A152(var_1);
  }
  else if (!var_0 && level.player _id_0B91::_id_65DB("disable_jackal_guns")) {
  level.player _id_0B91::_id_65DD("disable_jackal_guns");
  _id_A19E(var_1);
  }
}

_id_A152(var_0) {
  if (var_0)
  level._id_D127 notify("spaceship_weapon_state_change", "silent");

  level._id_D127 _meth_849E("spaceship_disabled_guns");
  thread _id_A157();
  level._id_D127 _meth_849F(0);
  level.player _meth_8009(0);
  setomnvar("ui_jackal_weapon_display_temp", 0);
}

_id_A19E(var_0) {
  if (var_0)
  level._id_D127 notify("spaceship_weapon_state_change", "silent");

  level._id_D127 _id_0BD9::_id_D17E();

  if (!level.player _id_0B91::_id_65DB("disable_jackal_lockon"))
  level.player _meth_8490("disable_lockon", 0);

  level._id_D127 _meth_849F(1);
  level.player _meth_8009(1);

  if (!level.player _id_0B91::_id_65DB("disable_jackal_overheat"))
  setomnvar("ui_jackal_weapon_display_temp", 1);
}

_id_A166(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  level.player _id_0B91::_id_65E1("disable_jackal_weapon_switch");
  else
  level.player _id_0B91::_id_65DD("disable_jackal_weapon_switch");
}

_id_82DD(var_0) {
  self._id_B898._id_00C1 = self._id_B898._id_00C1 + var_0;

  if (self._id_B898._id_00C1 > self._id_B898._id_B446)
  self._id_B898._id_00C1 = self._id_B898._id_B446;

  setomnvar("ui_jackal_missile_count", self._id_B898._id_00C1);
}

_id_10CD8() {
  thread _id_E047();
}

_id_E047() {
  while (!isdefined(level._id_D127))
  wait 0.05;

  while (!isdefined(level._id_D127._id_B898))
  wait 0.05;

  level._id_D127._id_B898._id_00C1 = 0;
  setomnvar("ui_jackal_missile_count", level._id_D127._id_B898._id_00C1);
}

_id_A157() {
  level.player endon("disable_jackal_guns");
  _id_137DB();
  level.player _meth_8490("disable_lockon", 1);
}

_id_13C11(var_0, var_1) {
  level._id_D127 endon("player_exit_jackal");

  if (isdefined(var_1))
  wait(var_1);

  level.player playsound(var_0);
}

_id_A15F(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  level.player _id_0B91::_id_65E1("disable_jackal_pilot_assist");
  else
  level.player _id_0B91::_id_65DD("disable_jackal_pilot_assist");

  level.player _meth_8490("disable_pilot_aim_assist", var_0);
  level.player _meth_8490("disable_pilot_move_assist", var_0);
}

_id_A15D(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  level._id_A056._id_1C54 = 0;
  else
  level._id_A056._id_1C54 = 1;
}

_id_A14B(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  level._id_A056._id_1C3C = 0;
  else
  level._id_A056._id_1C3C = 1;
}

_id_A165(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  level._id_A056._id_1C6D = 0;
  else
  level._id_A056._id_1C6D = 1;
}

_id_A1AA(var_0, var_1, var_2, var_3, var_4) {
  var_5 = spawnstruct();
  var_5._id_10974 = var_1;
  var_5.main = var_2;
  var_5._id_4623 = var_3;
  var_5._id_C6B4 = var_4;
  var_5._id_54F1 = 0;
  var_5._id_4622 = 0;
  var_5.running = 0;
  level._id_A056._id_68B3._id_68B6[var_0] = var_5;
}

_id_A1AD(var_0) {
  level._id_A056._id_68B3._id_68B6 = _id_0B91::_id_22B2(level._id_A056._id_68B3._id_68B6, var_0);
}

_id_A1AB(var_0, var_1) {
  if (!isdefined(var_1))
  var_1 = 1;

  if (!isdefined(level._id_A056._id_68B3._id_68B6[var_0]))
  return;

  level._id_A056._id_68B3._id_68B6[var_0]._id_54F1 = var_1;
}

jackal_eventmanager_event_is_running(var_0) {
  if (!isdefined(level._id_A056._id_68B3._id_68B6[var_0]))
  return 0;

  return level._id_A056._id_68B3._id_68B6[var_0].running;
}

_id_A1AE(var_0) {
  while (!isdefined(level._id_A056._id_68B3._id_68B6[var_0]))
  wait 0.05;
}

_id_A1AC(var_0) {
  return isdefined(level._id_A056._id_68B3._id_68B6[var_0]);
}

_id_A1A9(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  level._id_A056._id_68B3._id_54F1 = var_0;
}

_id_A1DD(var_0) {
  if (!isdefined(var_0))
  var_0 = 0;

  if (!isstring(var_0) && var_0 == 0) {
  level.player _id_0B91::_id_65DD("jackal_force_mode");
  level._id_D127._id_72A8 = undefined;
  } else {
  level.player _id_0B91::_id_65E1("jackal_force_mode");
  level._id_D127._id_72A8 = var_0;
  level._id_D127 _meth_8491(var_0);
  }
}

_id_A1DC(var_0) {
  if (!isdefined(var_0) || var_0 == 0)
  var_0 = 0;

  level._id_A056._id_6F90 = var_0;
}

_id_A164(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  level._id_A056._id_1C6C = 0;
  else
  level._id_A056._id_1C6C = 1;

  level notify("notify_new_jackal_speed_zone");
}

_id_A156(var_0) {
  if (_id_0B91::_id_93A6())
  return;

  if (!isdefined(var_0))
  var_0 = 1;

  level._id_A056._id_1157E = scripts\engine\utility::_id_22BC(level._id_A056._id_1157E);

  if (var_0) {
  level.player _id_0B91::_id_65E1("disable_jackal_lockon");

  foreach (var_2 in level._id_A056._id_1157E)
  var_2 _id_105D9();

  setomnvar("ui_jackal_callouts_enabled", 0);
  } else {
  level.player _id_0B91::_id_65DD("disable_jackal_lockon");

  foreach (var_2 in level._id_A056._id_1157E) {
  if (var_2._id_AEDF._id_AEEA)
  var_2 _id_105D6();
  }

  setomnvar("ui_jackal_callouts_enabled", 1);
  }

  if (scripts\engine\utility::_id_D11B())
  level.player _meth_8490("disable_lockon", var_0);
}

_id_A066(var_0) {
  if (!isdefined(var_0)) {}

  self._id_862D = var_0;
  self notify("death");
}

_id_A0BE(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0) {
  _func_1C5("spaceshipAnalogPhysics", 0);
  level._id_A056._id_2CAD = 400;
  } else {
  _func_1C5("spaceshipAnalogPhysics", 1);
  level._id_A056._id_2CAD = 0;
  }

  level.player _meth_8490("auto_boost_on", var_0);
}

_id_9CC8() {
  if (isdefined(self._id_AEDF))
  return 1;
  else
  return 0;
}

_id_107A2() {
  var_0 = scripts\engine\utility::_id_107E6();
  var_0 _id_D2A5();
}

_id_D2A5() {
  self._id_4074 = [];
  self._id_01BD = scripts\engine\utility::_id_107E6();
  self._id_01BD linkto(self, "tag_origin", (2000, 0, 0), (0, 0, 0));
  self._id_BCDA = scripts\engine\utility::_id_107E6();
  self._id_BCDA linkto(self, "tag_origin", (0, 0, 0), (0, 0, 0));
  self._id_B017 = scripts\engine\utility::_id_107E6();
  self._id_B017 linkto(self._id_01BD, "tag_origin", (0, 0, 0), (0, 0, 0));
  self._id_4074 = scripts\engine\utility::_id_2279(self._id_4074, self._id_BCDA);
  self._id_4074 = scripts\engine\utility::_id_2279(self._id_4074, self._id_01BD);
  self._id_4074 = scripts\engine\utility::_id_2279(self._id_4074, self._id_B017);
  thread _id_D29D();
  self._id_CFD9 = spawnstruct();
  self._id_CFD9._id_BC49 = (0, 0, 0);
  self._id_CFD9._id_AFF8 = (0, 0, 0);
  self._id_CFD9._id_1D11 = (0, 0, 0);
  self._id_CFD9._id_11535 = 0;
  self._id_CFD9._id_11533 = 0;
  self._id_CFD9._id_E67D = 0;
  self._id_CFD9._id_B3D1 = 0;
  level._id_D299 = self;
}

_id_D29B(var_0, var_1) {
  thread _id_D29C(var_0, var_1);
}

_id_D29C(var_0, var_1) {
  var_2 = var_1;
  var_3 = self._id_CFD9._id_B3D1;

  while (var_2 > 0) {
  var_4 = _id_0B4D::_id_C097(0, var_1, var_2);
  self._id_CFD9._id_B3D1 = _id_0B4D::_id_6A8E(var_0, var_3, var_4);
  var_2 = var_2 - 0.05;
  wait 0.05;
  }

  self._id_CFD9._id_B3D1 = var_0;
}

_id_D2A7() {
  self endon("death");
  _id_A38E(35, 3, 0.65, 0.5);
  thread _id_D2A4();

  for (;;) {
  self waittill("position_update");
  var_0 = anglestoforward(self._id_114F8);
  var_1 = anglestoright(self._id_114F8);
  var_2 = anglestoup(self._id_114F8);
  var_3 = anglestoforward(self.angles);
  var_4 = anglestoright(self.angles);
  var_5 = anglestoup(self.angles);
  var_6 = _id_0B4D::_id_AB6F(var_3, var_0, self._id_AB72);
  var_7 = _id_0B4D::_id_AB6F(var_4, var_1, self._id_AB72);
  var_8 = _id_0B4D::_id_AB6F(var_5, var_2, self._id_AB72);
  var_9 = distance(self.origin, self._id_1153B);
  var_10 = _id_0B4D::_id_C097(0, self._id_AB78, var_9);
  var_11 = _id_0B4D::_id_6A8E(self._id_AB82, self._id_AB8D, var_10);
  self.origin = _id_0B4D::_id_AB6F(self.origin, self._id_1153B, var_11);
  self.angles = _func_017(var_6, var_7, var_8);
  self._id_CFD9 _id_D2A2(var_6, var_7, var_8);
  self._id_BCDA unlink();
  self._id_B017 unlink();
  self._id_BCDA.origin = self.origin + self._id_CFD9._id_BC49 * self._id_CFD9._id_B3D1 * self._id_BC68;
  self._id_B017.origin = self._id_01BD.origin + self._id_CFD9._id_AFF8 * self._id_CFD9._id_B3D1 * self._id_AFF9;
  var_12 = vectornormalize(self._id_B017.origin - self._id_BCDA.origin);
  self._id_BCDA.angles = _func_017(var_12, var_7, var_8) + (0, 0, self._id_CFD9._id_E67D) * self._id_CFD9._id_B3D1;
  self._id_BCDA linkto(self);
  self._id_B017 linkto(self);
  }
}

_id_D2A0(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7) {
  if (!isdefined(var_1))
  var_1 = (0, 0, 0);

  if (!isdefined(var_2))
  self._id_AB78 = 1000;
  else
  self._id_AB78 = var_2;

  if (!isdefined(var_3))
  self._id_AB82 = 0.05;
  else
  self._id_AB82 = var_3;

  if (!isdefined(var_4))
  self._id_AB8D = 0.15;
  else
  self._id_AB8D = var_4;

  if (!isdefined(var_5))
  self._id_AB72 = 0.07;
  else
  self._id_AB72 = var_5;

  if (!isdefined(var_6))
  self._id_BC68 = 0.05;

  if (!isdefined(var_7))
  self._id_AFF9 = 1;

  self._id_11512 = var_0;
  self._id_11514 = var_1;
}

_id_D29A(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8) {
  self notify("new_follow_blend");
  self endon("new_follow_blend");
  var_9 = var_1;

  if (var_0 != self._id_11512) {
  var_10 = self._id_11512;
  var_11 = var_10 scripts\engine\utility::_id_107E6();
  var_11.angles = var_10.angles;
  self._id_11512 = var_11;
  self._id_2B8E = 1;
  } else {
  var_11 = undefined;
  var_0 = self._id_11512;
  var_10 = self._id_11512;
  }

  if (!isdefined(var_2))
  var_12 = self._id_11514;
  else
  var_12 = var_2;

  if (!isdefined(var_3))
  var_13 = self._id_AB78;
  else
  var_13 = var_3;

  if (!isdefined(var_4))
  var_14 = self._id_AB82;
  else
  var_14 = var_4;

  if (!isdefined(var_5))
  var_15 = self._id_AB8D;
  else
  var_15 = var_5;

  if (!isdefined(var_6))
  var_16 = self._id_AB72;
  else
  var_16 = var_6;

  if (!isdefined(var_7))
  var_17 = self._id_BC68;
  else
  var_17 = var_7;

  if (!isdefined(var_8))
  var_18 = self._id_AFF9;
  else
  var_18 = var_8;

  var_19 = self._id_11514;
  var_20 = self._id_AB78;
  var_21 = self._id_AB82;
  var_22 = self._id_AB8D;
  var_23 = self._id_AB72;
  var_24 = self._id_BC68;
  var_25 = self._id_AFF9;

  for (;;) {
  var_26 = _id_0B4D::_id_C097(0, var_1, var_9);

  if (isdefined(var_11)) {
  self._id_11512 unlink();
  var_27 = anglestoforward(var_10.angles);
  var_28 = anglestoright(var_10.angles);
  var_29 = anglestoup(var_10.angles);
  var_30 = anglestoforward(var_0.angles);
  var_31 = anglestoright(var_0.angles);
  var_32 = anglestoup(var_0.angles);
  var_33 = _id_0B4D::_id_6A8E(var_30, var_27, var_26);
  var_34 = _id_0B4D::_id_6A8E(var_31, var_28, var_26);
  var_35 = _id_0B4D::_id_6A8E(var_32, var_29, var_26);
  self._id_11512.origin = _id_0B4D::_id_6A8E(var_0.origin, var_10.origin, var_26);
  self._id_11512.angles = _func_017(var_33, var_34, var_35);
  }

  self._id_11514 = _id_0B4D::_id_6A8E(var_12, var_19, var_26);
  self._id_AB78 = _id_0B4D::_id_6A8E(var_13, var_20, var_26);
  self._id_AB82 = _id_0B4D::_id_6A8E(var_14, var_21, var_26);
  self._id_AB8D = _id_0B4D::_id_6A8E(var_15, var_22, var_26);
  self._id_AB72 = _id_0B4D::_id_6A8E(var_16, var_23, var_26);
  self._id_BC68 = _id_0B4D::_id_6A8E(var_17, var_24, var_26);
  self._id_AFF9 = _id_0B4D::_id_6A8E(var_18, var_25, var_26);

  if (isdefined(var_11))
  self._id_11512 linkto(var_0);

  self notify("target_ent_blend_done");
  wait 0.05;
  var_9 = var_9 - 0.05;

  if (var_26 == 0)
  break;
  }

  self._id_2B8E = 0;
  _id_D2A0(var_0, var_12, var_13, var_14, var_15, var_16, var_17, var_18);
  self notify("target_ent_blend_done");

  if (isdefined(var_11))
  var_11 delete();
}

_id_D2A4() {
  self endon("death");

  for (;;) {
  if (isdefined(self._id_11512)) {
  var_0 = anglestoforward(self._id_11512.angles);
  var_1 = anglestoright(self._id_11512.angles);
  var_2 = anglestoup(self._id_11512.angles);
  var_3 = var_0 * self._id_11514[0];
  var_4 = var_1 * self._id_11514[1];
  var_5 = var_2 * self._id_11514[2];
  self._id_1153B = self._id_11512.origin + var_3 + var_4 + var_5;
  self._id_114F8 = _func_017(var_0, var_1, var_2);
  } else {
  self._id_1153B = self.origin;
  self._id_114F8 = self.angles;
  }

  self notify("position_update");

  if (isdefined(self._id_2B8E) && self._id_2B8E) {
  self waittill("target_ent_blend_done");
  continue;
  }

  wait 0.05;
  }
}

_id_D2A2(var_0, var_1, var_2) {
  var_3 = 160;
  var_4 = 160;
  var_5 = 0.03;
  var_6 = 0.1;
  var_7 = 0.13;
  var_8 = 0.13;
  var_9 = 0.7;
  var_10 = 0.95;
  var_11 = 5500;
  var_12 = -5500;
  var_13 = -5500;
  var_14 = 5500;
  var_15 = level.player _meth_814B();
  var_15 = var_15 * self._id_B3D1;
  var_16 = level.player _meth_814C();
  var_16 = var_16 * self._id_B3D1;
  self._id_11535 = self._id_11535 + var_15[0] * var_3;
  self._id_11533 = self._id_11533 + var_15[1] * var_4;

  if (self._id_11535 > var_11)
  self._id_11535 = var_11;
  else if (self._id_11535 < var_12)
  self._id_11535 = var_12;

  if (self._id_11533 < var_13)
  self._id_11533 = var_13;
  else if (self._id_11533 > var_14)
  self._id_11533 = var_14;

  self._id_11535 = self._id_11535 * var_9;
  self._id_11533 = self._id_11533 * var_9;
  var_17 = self._id_11535 * var_2 + self._id_11533 * var_1;
  self._id_BC49 = _id_0B4D::_id_AB6F(self._id_BC49, var_17, var_5);
  self._id_AFF8 = _id_0B4D::_id_AB6F(self._id_BC49, var_17, var_6);
  var_18 = (self._id_AFF8[1] - self._id_BC49[1]) * var_8;
  self._id_E67D = _id_0B4D::_id_AB6F(self._id_E67D, var_18, var_7);
  self._id_E67D = self._id_E67D * var_10;
}

_id_D29D() {
  self waittill("death");

  foreach (var_1 in self._id_4074) {
  if (isdefined(var_1))
  var_1 delete();
  }
}

_id_A105() {
  level._id_D127 _id_430E();
}

_id_430E() {
  thread _id_430F();
}

_id_430F() {
  self notify("cockpit_light_change");
  self endon("cockpit_light_change");
  _id_0B91::_id_75F8("cockpit_light_side", "tag_cockpit_light_left");
  wait 0.1;
  _id_0B91::_id_75F8("cockpit_light_side", "tag_cockpit_light_right");
}

_id_A106() {
  level._id_D127 _id_4310();
}

_id_4310() {
  thread _id_4311();
}

_id_4311() {
  self notify("cockpit_light_change");
  self endon("cockpit_light_change");
  wait 0.1;
}

_id_A110(var_0) {
  if (!isdefined(var_0))
  level.player playsound("jackal_screens_on");

  level._id_D127 _id_4323(var_0);
}

_id_4323(var_0) {
  if (!isdefined(var_0))
  var_0 = 0;

  setomnvar("ui_jackal_entity", self);
  setomnvar("ui_jackal_cockpit_screens_noboot", var_0);
  setomnvar("ui_jackal_cockpit_screens", 1);

  if (var_0)
  var_1 = "cockpit_light_monitor";
  else
  var_1 = "cockpit_light_monitor_boot";

  _id_A108(var_1);
}

_id_A108(var_0) {
  if (isdefined(self._id_430D) && self._id_430D == var_0)
  return;

  _id_A109();
  self._id_430D = var_0;
  _id_0B91::_id_75C4(self._id_430D + "_l", "tag_cockpit_light_monitor1", undefined, "player_exit_jackal");
  _id_0B91::_id_75C4(self._id_430D + "_mid", "tag_cockpit_light_monitor2", undefined, "player_exit_jackal");
  _id_0B91::_id_75C4(self._id_430D + "_r", "tag_cockpit_light_monitor3", undefined, "player_exit_jackal");
}

_id_A109() {
  if (isdefined(self._id_430D)) {
  _id_0B91::_id_75A0(self._id_430D + "_l", "tag_cockpit_light_monitor1", undefined, "player_exit_jackal");
  _id_0B91::_id_75A0(self._id_430D + "_mid", "tag_cockpit_light_monitor2", undefined, "player_exit_jackal");
  _id_0B91::_id_75A0(self._id_430D + "_r", "tag_cockpit_light_monitor3", undefined, "player_exit_jackal");
  }

  self._id_430D = undefined;
}

_id_A10F() {
  level._id_D127 _id_4322();
}

_id_4322() {
  setomnvar("ui_jackal_cockpit_screens", 0);
  setomnvar("ui_jackal_entity", undefined);
  level._id_D127 _id_A109();
}

_id_A10C(var_0) {
  level._id_D127._id_4324 = var_0;
  level._id_D127 _id_4320(var_0);
}

_id_A10A() {
  level._id_D127._id_4324 = undefined;

  if (!isdefined(level._id_D127._id_431C))
  level._id_D127._id_431C = "default";

  level._id_D127 _id_4320(level._id_D127._id_431C);
}

_id_A10D(var_0, var_1, var_2) {
  level._id_D127 thread _id_4321(var_0, var_1, var_2);
}

_id_4321(var_0, var_1, var_2) {
  if (isdefined(var_2))
  self notify("cancel_request_for" + var_2);

  self endon("cancel_request_for" + var_0);

  if (isdefined(var_1) && isdefined(self._id_431D)) {
  while (self._id_431D == var_1)
  wait 0.05;
  }

  _id_4320(var_0);
}

_id_A10B(var_0) {
  level._id_D127._id_431C = var_0;

  if (!isdefined(level._id_D127._id_4324))
  level._id_D127 _id_4320(var_0);
}

_id_4320(var_0) {
  if (!isdefined(var_0))
  setomnvar("ui_jackal_cockpit_display", 0);

  if (isdefined(self._id_431D) && self._id_431D == var_0)
  return;

  switch (var_0) {
  case "hand_scanner":
  setomnvar("ui_jackal_cockpit_display", 1);
  _id_A108("cockpit_light_monitor");
  break;
  case "damage_alarm":
  setomnvar("ui_jackal_cockpit_display", 2);
  _id_A108("cockpit_light_monitor_alarm");
  break;
  case "incoming_missile":
  setomnvar("ui_jackal_cockpit_display", 3);
  _id_A108("cockpit_light_monitor_incoming");
  break;
  default:
  setomnvar("ui_jackal_cockpit_display", 0);
  _id_A108("cockpit_light_monitor");
  }

  self._id_431D = var_0;
}

_id_A10E() {}

_id_A261(var_0) {
  if (!isdefined(level._id_D127._id_4B23)) {
  if (isdefined(level._id_D127._id_4B22))
  level._id_D127 stoploopsound(level._id_D127._id_4B22);

  level._id_D127._id_4B22 = var_0;
  level._id_D127 playloopsound(level._id_D127._id_4B22);
  }
  else
  level._id_D127._id_4B22 = var_0;
}

_id_1100D(var_0) {
  if (isdefined(var_0)) {
  if (isdefined(level._id_D127._id_4B22) && level._id_D127._id_4B22 == var_0) {
  if (!isdefined(level._id_D127._id_4B23))
  level._id_D127 stoploopsound(level._id_D127._id_4B22);

  level._id_D127._id_4B22 = undefined;
  }
  } else {
  if (!isdefined(level._id_D127._id_4B23))
  level._id_D127 stoploopsound(level._id_D127._id_4B22);

  level._id_D127._id_4B22 = undefined;
  }
}

_id_A262(var_0) {
  if (isdefined(level._id_D127._id_4B22))
  level._id_D127 stoploopsound(level._id_D127._id_4B22);

  level._id_D127._id_4B23 = var_0;
  level._id_D127 playloopsound(level._id_D127._id_4B23);
}

_id_1100E() {
  if (isdefined(level._id_D127._id_4B23)) {
  level._id_D127 stoploopsound(level._id_D127._id_4B23);
  level._id_D127._id_4B23 = undefined;

  if (isdefined(level._id_D127._id_4B22))
  level._id_D127 playloopsound(level._id_D127._id_4B22);
  }
}

_id_A250(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0) {
  setomnvar("ui_jackal_atmo_launch", 1);
  setomnvar("ui_jackal_show_horizon", 0);
  } else {
  setomnvar("ui_jackal_atmo_launch", 0);
  setomnvar("ui_jackal_show_horizon", 1);
  }
}

_id_A228() {
  level.player notify("jackal_note_hud_on");
  thread _id_A229();
}

_id_A229() {
  level.player endon("jackal_note_hud_on");
  level.player endon("jackal_note_hud_off");
  level.player _id_0B91::_id_65E1("jackal_hud_on");
  setomnvar("ui_hide_hud", 0);
  setomnvar("ui_jackal_bootup", 1);
  setomnvar("ui_jackal_hud_shutdown", 0);
  setomnvar("ui_active_hud", "jackal");

  if (!level.player _id_0B91::_id_65DB("disable_jackal_lockon"))
  setomnvar("ui_jackal_callouts_enabled", 1);

  level._id_A056._id_1157E = scripts\engine\utility::_id_22BC(level._id_A056._id_1157E);
  var_0 = 9;
  var_1 = 0;
}

_id_A226(var_0) {
  level.player notify("jackal_note_hud_off");
  thread _id_A227(var_0);
}

_id_A22A(var_0) {
  thread _id_A22B(var_0);
}

_id_A22B(var_0) {
  level.player endon("jackal_note_hud_on");
  level.player endon("jackal_note_hud_off");
  setomnvar("ui_jackal_hud_shutdown", 1);
  setomnvar("ui_hide_hud", 1);
  wait 0.5;
  thread _id_A226(var_0);
}

_id_A227(var_0) {
  level.player _id_0B91::_id_65DD("jackal_hud_on");
  setomnvar("ui_jackal_bootup", 0);
  setomnvar("ui_jackal_callouts_enabled", 0);

  if (!isdefined(var_0) || !var_0) {
  setomnvar("ui_hide_hud", 1);
  level._id_A056 waittill("player_left_jackal");
  setomnvar("ui_hide_hud", 0);
  setomnvar("ui_active_hud", "infantry");
  }
  else
  setomnvar("ui_hide_hud", 1);
}

_id_105DB(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7) {
  thread _id_11544(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7);
}

_id_D920(var_0) {
  self endon("death");

  if (!isdefined(var_0))
  var_0 = "null";

  for (;;)
  wait 0.05;
}

_id_11544(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7) {
  self notify("new_target_set");
  self endon("new_target_set");
  self._id_AEDF = spawnstruct();
  self._id_AEDF._id_11566 = 0;
  self._id_AEDF._id_AF21 = 0;
  self._id_AEDF._id_AEED = 0;
  self._id_AEDF._id_11567 = 0;
  self._id_AEDF._id_2A93 = 0;
  self._id_AEDF.type = var_0;
  self._id_AEDF._id_D925 = 0;
  self._id_AEDF._id_933E = 0;
  self._id_AEDF._id_C35F = 0;
  self._id_AEDF._id_AEEA = 1;
  self._id_AEDF._id_38A4 = 0;
  self._id_AEDF._id_C940 = 0;
  self._id_AEDF._id_72A3 = 0;
  self._id_AEDF._id_3774 = 0;
  self._id_AEDF._id_3A5B = 0;

  if (isdefined(var_2))
  self._id_AEDF._id_3A5C = var_2;
  else
  self._id_AEDF._id_3A5C = "none";

  self._id_AEDF._id_C72C = self._id_AEDF._id_3A5C;

  if (!isdefined(var_3))
  self._id_AEDF._id_3782 = "none";
  else
  self._id_AEDF._id_3782 = var_3;

  if (!isdefined(var_4))
  var_4 = 0;

  if (isdefined(var_6) && var_6)
  var_8 = 0;
  else
  var_8 = 1;

  self _meth_8339(0);
  var_9 = 0;

  if (isdefined(self._id_EEDE)) {
  if (self._id_EEDE == "allies" && isdefined(var_3)) {
  if (!isdefined(var_1)) {
  if (isdefined(self._id_EDB8))
  self.name = self._id_EDB8;
  else
  _id_0B55::_id_7B07("unitednations");

  var_1 = self.name;
  var_9 = 1;
  }

  _id_A32F();
  } else {
  if (!isdefined(var_1))
  var_1 = "JACKAL_ENEMY";

  if (var_0 == "jackal" || var_0 == "ace") {
  self._id_AEDF._id_38A4 = 1;
  self._id_AEDF._id_9405 = 0;
  self._id_AEDF._id_D826 = 0;
  }
  }

  if (isstring(var_1))
  self _meth_8307(var_1, &"");
  else
  self _meth_8307("", var_1);

  if (var_9)
  self._id_AEDF._id_3782 = self._id_AEDF._id_3782 + "_unloc";
  }

  if (isdefined(var_5) && var_5)
  _id_A366();

  level._id_A056._id_1157E = scripts\engine\utility::_id_22BC(level._id_A056._id_1157E);
  level._id_A056._id_1157E = scripts\engine\utility::_id_2279(level._id_A056._id_1157E, self);
  self _meth_84BE(self._id_AEDF.type);
  _id_620B();

  if (var_8)
  thread _id_105D7(var_7);
}

_id_105D2() {
  thread _id_105D4();
}

_id_105D4() {
  self endon("death");

  for (;;) {
  while (!isdefined(level._id_D127) || !isdefined(level._id_D127._id_4BC7) || level._id_D127._id_4BC7 != self)
  wait 0.05;

  _id_0B91::_id_F40A("enemy", 0, 1);

  while (isdefined(level._id_D127) && isdefined(level._id_D127._id_4BC7) && level._id_D127._id_4BC7 == self)
  wait 0.05;

  self _meth_818B();
  }
}

_id_105D3() {
  self endon("stop_highlight_flashes");
  self endon("death");
  var_0 = 3;

  if (isdefined(self._id_A8CB) && gettime() - self._id_A8CB < 10000) {
  if (isdefined(self._id_8EF0)) {
  foreach (var_2 in self._id_8EF0) {
  if (isdefined(var_2))
  self._id_A8CB = gettime();
  }
  }
  else
  self._id_A8CB = gettime();

  return;
  }

  while (var_0 > 0) {
  if (isdefined(self._id_8EF0)) {
  foreach (var_2 in self._id_8EF0) {
  if (isdefined(var_2)) {
  var_2 _id_0B91::_id_F40A("enemy", 0, 1);
  var_2._id_A8CB = gettime();
  }
  }
  }
  else
  _id_0B91::_id_F40A("enemy", 0, 1);

  wait 0.3;

  if (isdefined(self._id_8EF0)) {
  foreach (var_2 in self._id_8EF0) {
  if (isdefined(var_2))
  var_2 _meth_818B();
  }
  }
  else
  self _meth_818B();

  wait 0.1;
  var_0--;
  }
}

_id_A32F() {
  if (self._id_AEDF._id_C940)
  return;

  self._id_AEDF._id_C941 = 0;
  level._id_A056._id_C93E = scripts\engine\utility::_id_22BC(level._id_A056._id_C93E);
  level._id_A056._id_C93E = scripts\engine\utility::_id_2279(level._id_A056._id_C93E, self);
  self._id_AEDF._id_C940 = 1;
}

_id_A2DD() {
  if (!self._id_AEDF._id_C940)
  return;

  level._id_A056._id_C93E = scripts\engine\utility::array_remove(level._id_A056._id_C93E, self);
  self._id_AEDF._id_C940 = 0;
}

_id_A36D() {
  if (self._id_AEDF._id_D925)
  return;

  level._id_A056._id_D92C = scripts\engine\utility::_id_2279(level._id_A056._id_D92C, self);
  self._id_AEDF._id_D925 = 1;
  _id_0B76::_id_F42C(self._id_AEDF._id_3A5C);

  if (self._id_AEDF._id_72A3)
  thread _id_3777();
}

_id_3777() {
  self endon("death");
  self endon("stop_target_priority");

  for (;;) {
  self _meth_84A0(0);
  wait 0.05;
  }
}

_id_A36B() {
  if (self._id_AEDF._id_933E)
  return;

  level.player playsound("jackal_ui_attacker_warning");
  level._id_A056._id_933B = scripts\engine\utility::_id_2279(level._id_A056._id_933B, self);
  self._id_AEDF._id_933E = 1;
  self._id_AEDF._id_3A5C = "immediate_threat";
  _id_0B76::_id_F42C(self._id_AEDF._id_3A5C);
}

_id_A36A() {
  if (!self._id_AEDF._id_D925)
  return;

  self notify("stop_target_priority");
  level._id_A056._id_D92C = scripts\engine\utility::array_remove(level._id_A056._id_D92C, self);
  self._id_AEDF._id_D925 = 0;
  self._id_AEDF._id_3A5C = self._id_AEDF._id_C72C;
  _id_0B76::_id_F42C(self._id_AEDF._id_3A5C);

  if (self._id_AEDF._id_72A3)
  _id_620A();
}

_id_A368() {
  if (!self._id_AEDF._id_933E)
  return;

  level._id_A056._id_933B = scripts\engine\utility::array_remove(level._id_A056._id_933B, self);
  self._id_AEDF._id_933E = 0;
  self._id_AEDF._id_3A5C = self._id_AEDF._id_C72C;
  _id_0B76::_id_F42C(self._id_AEDF._id_3A5C);
}

_id_A366() {
  if (self._id_AEDF._id_72A3)
  return;

  self._id_AEDF._id_72A3 = 1;

  if (!self._id_AEDF._id_D925)
  _id_620A();
}

_id_A364() {
  if (!self._id_AEDF._id_72A3)
  return;

  self._id_AEDF._id_72A3 = 0;

  if (!self._id_AEDF._id_11567)
  _id_5543();
}

_id_620B() {
  _id_0B76::_id_F42C(self._id_AEDF._id_3A5C);
  self._id_AEDF._id_3A5B = 1;
}

_id_E046() {
  self _meth_8558();
  self._id_AEDF._id_3A5B = 0;
}

_id_620A() {
  _id_0B76::_id_F42B(self._id_AEDF._id_3782);
  self._id_AEDF._id_3774 = 1;
}

_id_5543() {
  if (!self._id_AEDF._id_72A3) {
  self _meth_84A0(0);
  self._id_AEDF._id_3774 = 0;
  }
}

_id_105D7(var_0) {
  self notify("juicy_feedback_thread");
  self endon("Death");
  self endon("spaceship_target_remove");
  self endon("juicy_feedback_thread");

  if (isdefined(var_0))
  var_1 = var_0;
  else
  var_1 = "jackal_impact_target";

  if (self._id_EEDE != "axis")
  return;

  for (;;) {
  self waittill("damage", var_2, var_3, var_4, var_5, var_6);

  if (!isdefined(self))
  return;

  if (isdefined(level._id_D127) && var_3 != level._id_D127)
  continue;

  if (var_6 == "MOD_PROJECTILE") {
  if (isdefined(level._id_D127) && isdefined(level._id_D127._id_4C15))
  _func_178(level._id_D127._id_4C15._id_1151E, var_5);

  var_7 = vectornormalize(var_5 - self.origin);
  playfx(scripts\engine\utility::_id_7ECB(var_1), var_5, var_7, (0, 0, 1));
  }
  }
}

_id_105DA() {
  _id_105D8();
  self._id_AEDF = undefined;
  level._id_A056._id_1157E = scripts\engine\utility::array_remove(level._id_A056._id_1157E, self);
  self _meth_8558();
  self notify("spaceship_target_remove");
}

_id_105D8() {
  if (!isdefined(self._id_AEDF)) {}

  self._id_AEDF._id_AEEA = 0;
  _id_105D9();
}

_id_105D9() {
  if (!isdefined(self._id_AEDF)) {}

  if (self._id_AEDF._id_C940)
  level._id_A056._id_C93E = scripts\engine\utility::array_remove(level._id_A056._id_C93E, self);

  self _meth_84A0(0);
  self _meth_8558();
  self _meth_84C1();
}

_id_105D5() {
  if (!isdefined(self._id_AEDF)) {}

  self._id_AEDF._id_AEEA = 1;
  _id_105D6();
}

_id_105D6() {
  if (level.player _id_0B91::_id_65DF("disable_jackal_lockon") && level.player _id_0B91::_id_65DB("disable_jackal_lockon"))
  return;

  if (self._id_AEDF._id_3774)
  _id_0B76::_id_F42B(self._id_AEDF._id_3782);

  if (self._id_AEDF._id_C940)
  level._id_A056._id_C93E = scripts\engine\utility::_id_2279(level._id_A056._id_C93E, self);
  else if (self._id_AEDF._id_3A5B)
  _id_0B76::_id_F42C(self._id_AEDF._id_3A5C);

  self _meth_84BE(self._id_AEDF.type);
}

_id_7B9B() {
  if (scripts\engine\utility::_id_D11B())
  return level._id_D127 gettagorigin("tag_camera");
  else
  return level.player geteye();
}

_id_7B9F() {
  if (scripts\engine\utility::_id_D11B())
  return level._id_D127 gettagangles("tag_camera");
  else
  return level.player geteye();
}

_id_7BC2() {
  return level.player._id_D409;
}

_id_10CD1(var_0, var_1, var_2, var_3) {
  if (!isdefined(var_2))
  var_2 = "fly";

  thread _id_10CD4(var_0, var_1, var_2, var_3);
  var_0 _id_A287(0.1);
  var_0 scripts\engine\utility::delaythread(0.1, ::_id_A2DE, 0);
  var_0 scripts\engine\utility::delaythread(1, ::_id_A388, 1);
  _id_137D6();

  if (_id_0B91::_id_93A6())
  _id_0BD9::_id_FA4F();
}

_id_10CD2(var_0, var_1) {
  thread _id_10CD3(var_0, var_1);
}

_id_10CD3(var_0, var_1) {
  if (isdefined(var_1)) {
  if (isstring(var_1)) {
  if (_func_2A4(scripts\engine\utility::_id_817E(var_1, "targetname")))
  var_1 = scripts\engine\utility::_id_817E(var_1, "targetname");
  else if (_func_2A6(getent(var_1, "targetname")))
  var_1 = getent(var_1, "targetname");
  }

  var_2 = var_1.origin;

  if (isdefined(var_1.angles))
  var_3 = var_1.angles;
  else
  var_3 = (0, 0, 0);

  var_0 _meth_83E7(var_2, var_3);
  }

  var_0 _id_0BDB::_id_A0F7();
  var_0 _id_F448("instant");
  level._id_D127 = var_0;
  var_0 _id_0BDB::_id_BBE0();
  wait 0.1;
  var_0 _meth_8383();
  var_0 _id_0BDB::_id_E073(1);
}

_id_10CD4(var_0, var_1, var_2, var_3) {
  var_0 thread _id_10CD5();

  while (!isdefined(var_0._id_D161))
  wait 0.05;

  var_0 notify("player_jackal_scripting_inited");

  if (var_2 == "runway")
  var_0 _id_F48D("runway");
  else if (var_2 == "retribution")
  var_0 _id_F48D("retribution");
  else if (var_2 == "shipcrib_europa_launch")
  var_0 _id_F48D("shipcrib_europa_launch");
  else
  var_0 _id_F48D("instant_" + var_2);

  if (isdefined(var_3))
  var_0 _id_F5BD(var_3);
  else if (var_2 == "land")
  var_0 _id_F5BD("vtol");
  else if (var_2 == "runway")
  var_0 _id_F5BD("runway");
  else if (var_2 == "retribution")
  var_0 _id_F5BD("retribution");
  else if (var_2 == "shipcrib")
  var_0 _id_F5BD("shipcrib");
  else
  var_0 _id_F5BD("instant");

  if (isdefined(var_1)) {
  if (isstring(var_1)) {
  if (_func_2A4(scripts\engine\utility::_id_817E(var_1, "targetname")))
  var_1 = scripts\engine\utility::_id_817E(var_1, "targetname");
  else if (_func_2A6(getent(var_1, "targetname")))
  var_1 = getent(var_1, "targetname");
  }

  var_4 = var_1.origin;

  if (isdefined(var_1.angles))
  var_5 = var_1.angles;
  else
  var_5 = (0, 0, 0);

  var_0 _meth_83E7(var_4, var_5);
  }

  level._id_D127 = var_0;
  wait 0.05;
  var_0 _id_0BDB::_id_F51F();
  var_0 _id_F48D("default_landed");
  var_0 _id_F5BD("vtol");
}

_id_10CD5() {
  self endon("player_jackal_scripting_inited");
  wait 2;
}

_id_A38E(var_0, var_1, var_2, var_3) {
  if (!isdefined(var_0))
  var_0 = level._id_A056._id_4FEB["spaceshipSpringCameraMaxAngle"];

  if (!isdefined(var_1))
  var_1 = level._id_A056._id_4FEB["spaceshipSpringCameraSpringStrength"];

  if (!isdefined(var_2))
  var_2 = level._id_A056._id_4FEB["spaceshipSpringCameraSpringStrengthOut"];

  if (!isdefined(var_3))
  var_3 = 0;

  thread _id_0B91::_id_AB9A("spaceshipSpringCameraMaxAngle", var_0, var_3);
  thread _id_0B91::_id_AB9A("spaceshipSpringCameraSpringStrength", var_1, var_3);
  thread _id_0B91::_id_AB9A("spaceshipSpringCameraSpringStrengthOut", var_2, var_3);
}

_id_A2FC(var_0, var_1, var_2) {
  if (!isdefined(var_2))
  var_2 = "default";

  if (!isdefined(var_1))
  var_1 = 0;

  level._id_A056 thread _id_A0CF("boost", var_2, var_0, var_1);
}

_id_A303(var_0, var_1) {
  if (!isdefined(var_1))
  var_1 = 0;

  level._id_A056 thread _id_A0CF("weapKick", "weapKick", var_0, var_1);
}

_id_A2FE(var_0, var_1, var_2) {
  if (!isdefined(var_2))
  var_2 = "default";

  if (!isdefined(var_1))
  var_1 = 0;

  level._id_A056 thread _id_A0CF("boost", var_2, var_0, var_1);
}

_id_A301(var_0, var_1, var_2) {
  if (!isdefined(var_2))
  var_2 = "default";

  if (!isdefined(var_1))
  var_1 = 0;

  level._id_A056 thread _id_A0CF("speed", var_2, var_0, var_1);
}

_id_A302(var_0, var_1, var_2) {
  if (!isdefined(var_2))
  var_2 = "default";

  if (!isdefined(var_1))
  var_1 = 0;

  level._id_A056 thread _id_A0CF("turn", var_2, var_0, var_1);
}

_id_A081(var_0, var_1, var_2, var_3) {
  if (!isdefined(level._id_D127))
  return;

  if (!isdefined(var_3)) {
  var_4 = level._id_A056._id_BBB9["view_rotate"] _id_7CF7();
  var_3 = "view" + var_4;
  }

  thread _id_A082(var_0, var_1, var_2, var_3);
}

_id_A082(var_0, var_1, var_2, var_3) {
  level._id_A056 notify("view_rotate" + var_3 + "_impulse");
  level._id_A056 endon("view_rotate" + var_3 + "_impulse");
  level._id_D127 endon("player_left_jackal");
  _id_A083(var_0, var_1, var_3);
  wait(var_1);
  _id_A083((0, 0, 0), var_2, var_3);
}

_id_A07E(var_0, var_1, var_2, var_3) {
  if (!isdefined(level._id_D127))
  return;

  if (!isdefined(var_3)) {
  var_4 = level._id_A056._id_BBB9["ship_rotate"] _id_7CF7();
  var_3 = "rotate" + var_4;
  }

  thread _id_A07F(var_0, var_1, var_2, var_3);
}

_id_A07F(var_0, var_1, var_2, var_3) {
  level._id_A056 notify("ship_rotate" + var_3 + "_impulse");
  level._id_A056 endon("ship_rotate" + var_3 + "_impulse");
  level._id_D127 endon("player_left_jackal");
  _id_A080(var_0, var_1, var_3);
  wait(var_1);
  _id_A080((0, 0, 0), var_2, var_3);
}

_id_A079(var_0, var_1, var_2, var_3, var_4) {
  if (!isdefined(level._id_D127))
  return;

  var_5 = vectornormalize(level._id_D127.origin - var_0);
  var_6 = var_5 * var_1;

  if (!isdefined(var_4)) {
  var_7 = level._id_A056._id_BBB9["force"] _id_7CF7();
  var_4 = "impulse" + var_7;
  }

  thread _id_A07A(var_6, var_2, var_3, var_4);
}

_id_A07A(var_0, var_1, var_2, var_3) {
  level._id_A056 notify("force" + var_3 + "_impulse");
  level._id_A056 endon("force" + var_3 + "_impulse");
  level._id_D127 endon("player_left_jackal");
  _id_A078(var_0, var_1, var_3);
  wait(var_1);
  _id_A078((0, 0, 0), var_2, var_3);
}

_id_A083(var_0, var_1, var_2) {
  if (!isdefined(var_2))
  var_2 = "default";

  level._id_A056 thread _id_A0D0("view_rotate", var_2, var_0, var_1);
}

_id_A080(var_0, var_1, var_2) {
  if (!isdefined(var_2))
  var_2 = "default";

  level._id_A056 thread _id_A0D0("ship_rotate", var_2, var_0, var_1);
}

_id_A078(var_0, var_1, var_2) {
  if (!isdefined(var_2))
  var_2 = "default";

  var_0 = scripts\engine\utility::_id_BD6A(var_0);
  level._id_A056 thread _id_A0D0("force", var_2, var_0, var_1);
}

_id_A2D7(var_0) {
  if (!isdefined(var_0))
  var_0 = 0.0;

  foreach (var_3, var_2 in level._id_A056._id_BBB9["force"]._id_3C66)
  level._id_A056 thread _id_A0D0("force", var_3, (0, 0, 0), var_0);
}

_id_A0CF(var_0, var_1, var_2, var_3) {
  self notify(var_1);
  self endon(var_1);
  self endon("player_left_jackal");

  if (!isdefined(self._id_BBB9[var_0]._id_3C66[var_1]))
  self._id_BBB9[var_0]._id_3C66[var_1] = 1;

  var_4 = self._id_BBB9[var_0]._id_3C66[var_1] - var_2;

  if (var_3 <= 0.05) {
  self._id_BBB9[var_0]._id_3C66[var_1] = var_2;
  return;
  }

  var_5 = var_4 * (1 / (var_3 + 0.05) * 0.05);

  while (var_3 > 0) {
  var_3 = var_3 - 0.05;
  self._id_BBB9[var_0]._id_3C66[var_1] = self._id_BBB9[var_0]._id_3C66[var_1] - var_5;
  wait 0.05;
  }

  self._id_BBB9[var_0]._id_3C66[var_1] = var_2;

  if (self._id_BBB9[var_0]._id_3C66[var_1] == 1)
  self._id_BBB9[var_0]._id_3C66 = _id_0B91::_id_22B2(self._id_BBB9[var_0]._id_3C66, var_1);
}

_id_7CF7() {
  self._id_1189B++;

  if (self._id_1189B > 100)
  self._id_1189B = 0;

  return self._id_1189B;
}

_id_A0D0(var_0, var_1, var_2, var_3) {
  self notify(var_0 + var_1);
  self endon(var_0 + var_1);
  self endon(var_0 + var_1 + "_impulse");
  self endon("player_left_jackal");

  if (!isdefined(self._id_BBB9[var_0]._id_3C66[var_1]))
  self._id_BBB9[var_0]._id_3C66[var_1] = (0, 0, 0);

  var_4 = self._id_BBB9[var_0]._id_3C66[var_1];

  if (var_3 <= 0.05) {
  _id_A325(var_0, var_1, var_2);
  return;
  }

  var_5 = var_2 - var_4;
  var_6 = var_5 * (1 / (var_3 + 0.05) * 0.05);

  while (var_3 > 0) {
  var_3 = var_3 - 0.05;
  self._id_BBB9[var_0]._id_3C66[var_1] = self._id_BBB9[var_0]._id_3C66[var_1] + var_6;
  wait 0.05;
  }

  _id_A325(var_0, var_1, var_2);
}

_id_A325(var_0, var_1, var_2) {
  if (length(var_2) == 0)
  self._id_BBB9[var_0]._id_3C66 = _id_0B91::_id_22B3(self._id_BBB9[var_0]._id_3C66, [var_1]);
  else
  self._id_BBB9[var_0]._id_3C66[var_1] = var_2;
}

_id_E0A1() {
  level._id_A056._id_12F96 = _id_0B91::_id_22B9(level._id_A056._id_12F96);
  level._id_A056._id_12F96 = scripts\engine\utility::_id_22BC(level._id_A056._id_12F96);
}

_id_137D6() {
  level.player _id_0B91::_id_65E3("flag_player_is_flying");
}

_id_137CF() {
  level.player endon("death");

  if (isalive(level.player) && level.player _id_0B91::_id_65DF("flag_player_has_jackal"))
  level.player _id_0B91::_id_65E3("flag_player_has_jackal");
}

_id_137DA() {
  for (;;) {
  if (_id_0B91::_id_D123())
  break;

  wait 0.05;
  }
}

_id_137D8() {
  for (;;) {
  var_0 = level.player _meth_8473();

  if (!isdefined(var_0))
  break;

  wait 0.05;
  }
}

_id_137DB() {
  for (;;) {
  if (_id_A2A7())
  return;
  else
  wait 0.05;
  }
}

_id_137D9() {
  for (;;) {
  if (!_id_A2A7())
  return;
  else
  wait 0.05;
  }
}

_id_13797() {
  var_0 = 0;

  for (;;) {
  var_1 = level.player _meth_814C();
  var_2 = var_1[0] + var_1[1];

  if (level.player _meth_8439()) {
  if (var_2 > 0.3 && !var_0)
  break;

  var_0 = 1;
  }
  else
  var_0 = 0;

  wait 0.05;
  }
}

_id_137A9() {
  if (self._id_99F5._id_BBF1)
  return;

  for (;;) {
  self waittill("mountable", var_0);

  if (var_0)
  return;
  }
}

_id_137AF() {
  if (!self._id_99F5._id_BBF1)
  return;

  for (;;) {
  self waittill("mountable", var_0);

  if (!var_0)
  return;
  }
}

_id_104A6(var_0) {
  if (var_0 == self._id_99F5._id_BBF1)
  return;

  self._id_99F5._id_BBF1 = var_0;

  if (var_0) {
  thread _id_0BD9::_id_1049C();
  self notify("mountable", var_0);
  } else {
  thread _id_0BD9::_id_1049B();
  self notify("mountable", var_0);
  }
}

_id_DE6D() {
  if (self._id_99F5._id_BBF1)
  thread _id_0BD9::_id_1049C();
}

_id_CF50(var_0) {
  _id_E0A1();

  foreach (var_2 in level._id_A056._id_12F96)
  var_2 _id_104A6(var_0);
}

_id_104A0() {
  return isdefined(self._id_1912) && self._id_1912;
}

_id_7A5B(var_0) {
  if (scripts\engine\utility::_id_D11B())
  return var_0;
  else
  return var_0 + "_grnd";
}

_id_9BDE() {
  if (isdefined(self.classname) && self.classname == "script_vehicle_jackal_fake_enemy")
  return 1;
  else
  return 0;
}

_id_9CF5() {
  if (isdefined(self._id_02AF) && self._id_02AF & 1)
  return 1;
  else
  return 0;
}

_id_A2A7() {
  if (isdefined(self.owner) && self.owner == level.player)
  return 1;
  else
  return 0;
}

_id_13675(var_0) {
  self endon("death");
  self endon("entitydeleted");
  self endon("fakedeath");
  wait(var_0);
}

_id_A06A(var_0) {
  level notify("notify_new_landing_state");
  level endon("notify_new_landing_state");

  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  level.player _id_0B91::_id_65E1("flag_player_landing_enabled");
  else
  level.player _id_0B91::_id_65DD("flag_player_landing_enabled");

  foreach (var_2 in level._id_A056._id_1632) {
  foreach (var_4 in var_2._id_ACC9) {
  if (var_0) {
  if (var_2._id_6261)
  playfxontag(scripts\engine\utility::_id_7ECB("landing_pad_lights"), var_4, "tag_origin");

  continue;
  }

  _func_121(scripts\engine\utility::_id_7ECB("landing_pad_lights"), var_4, "tag_origin");
  }

  if (!var_0)
  var_2 _id_0BDB::_id_4130();
  }
}

_id_A24B(var_0, var_1) {
  if (!isdefined(var_1))
  var_1 = 1;

  var_2 = [];

  foreach (var_4 in level._id_A056._id_A82D) {
  if (isdefined(var_4.script_noteworthy) && var_4.script_noteworthy == var_0)
  var_2 = scripts\engine\utility::_id_2279(var_2, var_4);
  }

  foreach (var_4 in var_2)
  _id_6211(var_4, var_1);
}

_id_A24A(var_0) {
  var_1 = [];

  foreach (var_3 in level._id_A056._id_A82D) {
  if (isdefined(var_3.script_noteworthy) && var_3.script_noteworthy == var_0)
  var_1 = scripts\engine\utility::_id_2279(var_1, var_3);
  }

  foreach (var_3 in var_1) {
  level._id_A056._id_A82D = scripts\engine\utility::array_remove(level._id_A056._id_A82D, var_3);

  if (scripts\engine\utility::array_contains(level._id_A056._id_1632, var_3))
  level._id_A056._id_1632 = scripts\engine\utility::array_remove(level._id_A056._id_1632, var_3);

  var_3 _id_0BDB::_id_4130();
  var_3._id_1270F delete();

  foreach (var_7 in var_3._id_ACC9)
  var_7 delete();
  }
}

_id_6211(var_0, var_1) {
  if (var_0._id_6261 != var_1) {
  var_0._id_6261 = var_1;

  if (var_1) {
  level._id_A056._id_1632 = scripts\engine\utility::_id_2279(level._id_A056._id_1632, var_0);
  _func_14E(_id_0B91::_id_C264("OBJ_VTOL_LAND"), "invisible");
  objective_onentity(_id_0B91::_id_C264("OBJ_VTOL_LAND"), var_0._id_0315);
  objective_state(_id_0B91::_id_C264("OBJ_VTOL_LAND"), "current");
  } else {
  level._id_A056._id_1632 = scripts\engine\utility::array_remove(level._id_A056._id_1632, var_0);
  var_0 _id_0BDB::_id_4130();
  objective_delete(_id_0B91::_id_C264("OBJ_VTOL_LAND"));
  }

  foreach (var_3 in var_0._id_ACC9) {
  if (var_1 && level.player _id_0B91::_id_65DB("flag_player_landing_enabled")) {
  playfxontag(scripts\engine\utility::_id_7ECB("landing_pad_lights"), var_3, "tag_origin");
  continue;
  }

  _func_121(scripts\engine\utility::_id_7ECB("landing_pad_lights"), var_3, "tag_origin");
  }
  }
}

_id_137F6(var_0, var_1, var_2, var_3) {
  self endon("entitydeleted");
  var_0 endon("entitydeleted");

  if (!isdefined(var_3))
  var_3 = 0.1;

  var_4 = "waittill_point_timeout";
  var_5 = "point_success";
  self endon(var_4);
  thread _id_1358E(var_2, var_4, var_5);

  while (!_id_9C87(var_0, var_1))
  wait(var_3);

  self notify(var_5);
}

_id_1358E(var_0, var_1, var_2) {
  self endon(var_2);
  wait(var_0);
  self notify(var_1);
}

_id_9C87(var_0, var_1) {
  var_2 = undefined;

  if (_func_2A6(var_0) || _func_2A4(var_0))
  var_2 = var_0.origin;
  else if (!_func_2A5(var_0)) {}
  else
  var_2 = var_0;

  var_3 = vectordot(vectornormalize(var_2 - self.origin), anglestoforward(self.angles));

  if (var_3 > var_1)
  return 1;
  else
  return 0;
}

_id_9B92(var_0, var_1) {
  var_2 = undefined;

  if (_func_2A6(var_0) || _func_2A4(var_0))
  var_2 = var_0.origin;
  else if (!_func_2A5(var_0)) {}
  else
  var_2 = var_0;

  var_3 = distance(self.origin, var_2);

  if (var_3 < var_1)
  return 1;
  else
  return 0;
}

_id_1079F(var_0, var_1) {
  var_0 = getent(var_0, "targetname");

  if (!isdefined(var_0)) {}

  var_2 = var_0 _id_0B91::_id_10808();

  if (isdefined(var_1))
  var_2 _id_1162F(var_1);

  return var_2;
}

_id_1162F(var_0) {
  var_1 = scripts\engine\utility::_id_817E(var_0, "targetname");

  if (!isdefined(var_1)) {}

  if (!isdefined(var_1.angles))
  var_1.angles = (0, 0, 0);

  self _meth_83E7(var_1.origin + (0, 0, 70), var_1.angles);
  self _meth_8455(var_1.origin + (0, 0, 70), 1, var_1.angles);
}

_id_10749() {
  self._id_BC85 = scripts\engine\utility::_id_107E6();
  self._id_AFEE = scripts\engine\utility::_id_107E6();
  self._id_4074 = scripts\engine\utility::_id_227F(self._id_4074, [self._id_BC85, self._id_AFEE]);
}

_id_E04B() {
  if (isdefined(self._id_BC85))
  self._id_BC85 delete();

  if (isdefined(self._id_AFEE))
  self._id_AFEE delete();
}

_id_7AB7() {
  if (!isdefined(level._id_D127))
  return;

  return level._id_D127._id_AFEE;
}

_id_7AFB() {
  if (!isdefined(level._id_D127))
  return;

  return level._id_D127._id_BC85;
}

_id_7B9E() {
  if (!isdefined(level._id_D127))
  return 0;
  else
  return length(level._id_D127._id_02AC);
}

_id_7B9C() {
  if (!isdefined(level._id_D127))
  return 0;
  else
  {
  var_0 = rotatevectorinverted(level._id_D127._id_02AC, level._id_D127.angles);
  return var_0[0];
  }
}

_id_D16C(var_0, var_1, var_2, var_3, var_4, var_5) {
  var_6 = "moveto";
  var_7 = _id_7AFB();
  var_7 _id_D960(var_0, var_5);
  _id_D155(var_7, var_1, var_2, var_3, var_4, var_6);
}

_id_D165(var_0, var_1, var_2, var_3, var_4, var_5) {
  var_6 = "lookat";
  var_7 = _id_7AB7();
  var_7 _id_D960(var_0, var_5);
  _id_D155(var_7, var_1, var_2, var_3, var_4, var_6);
}

_id_D155(var_0, var_1, var_2, var_3, var_4, var_5) {
  if (isdefined(var_4) && var_4)
  var_6 = "absolute";
  else
  var_6 = "desires";

  level._id_A056._id_11B0D[var_5][var_6] = 1;
  level._id_D127 notify(var_5 + "_started");
  level.player _meth_8462(var_0, var_5, var_6, var_1, var_3);
  level.player _meth_8462(var_0, var_5, var_6 + "_player", var_2, var_3);

  if (var_1 == 0 && var_2 == 1)
  thread _id_D156(var_5, var_6, var_3);
}

_id_D156(var_0, var_1, var_2) {
  level._id_D127 endon(var_0 + "_started");
  wait(var_2);
  level._id_A056._id_11B0D[var_0][var_1] = 0;

  if (level._id_A056._id_11B0D[var_0]["absolute"] == 0 && level._id_A056._id_11B0D[var_0]["desires"] == 0 && level._id_A056._id_11B0D[var_0]["link"] == 0)
  level.player _meth_8463(var_0);
}

_id_D164(var_0, var_1) {
  if (!isdefined(var_1))
  var_1 = 0;

  level._id_A056._id_11B0D["moveto"]["link"] = 1;
  level._id_A056._id_11B0D["lookat"]["link"] = 1;
  level._id_D127 notify("moveto_started");
  level._id_D127 notify("lookat_started");
  level._id_D127 endon("linktoblend_started");
  level.player _meth_8462(var_0, "orient", "time", 1, var_1);
  level.player _meth_8462(var_0, "orient", "time_player", 0, var_1);
  level.player _meth_8462(var_0, "moveto", "time", 1, var_1);
  level.player _meth_8462(var_0, "moveto", "time_player", 0, var_1);
  level._id_A056._id_AD1D = var_0;
}

_id_D190(var_0) {
  if (!isdefined(level._id_A056._id_AD1D))
  return;

  if (!isdefined(var_0))
  var_0 = 0;

  thread _id_D191(var_0, "moveto", "moveto");
  thread _id_D191(var_0, "lookat", "orient");
  wait(var_0);
  level._id_A056._id_AD1D = undefined;
}

_id_D191(var_0, var_1, var_2) {
  level._id_D127 endon(var_1 + "_started");
  level._id_D127 endon("linktoblend_started");
  level.player _meth_8462(level._id_A056._id_AD1D, var_2, "time", 0, var_0);
  level.player _meth_8462(level._id_A056._id_AD1D, var_2, "time_player", 1, var_0);
  wait(var_0);
  level._id_A056._id_11B0D["moveto"]["link"] = 0;
  level._id_A056._id_11B0D["lookat"]["link"] = 0;

  if (level._id_A056._id_11B0D[var_1]["absolute"] == 0 && level._id_A056._id_11B0D[var_1]["desires"] == 0 && level._id_A056._id_11B0D[var_1]["link"] == 0)
  level.player _meth_8463(var_1);
}

_id_D960(var_0, var_1) {
  if (_func_2A5(var_0)) {
  if (self _meth_81AB())
  self unlink();

  self dontinterpolate();
  self.origin = var_0;
  }
  else if (_func_2A4(var_0)) {
  if (self _meth_81AB())
  self unlink();

  self dontinterpolate();
  self.origin = var_0.origin;
  }
  else if (_func_2A6(var_0)) {
  if (!isdefined(var_1))
  var_1 = _func_0BF(var_0._id_01F1, 0);

  self linkto(var_0, var_1, (0, 0, 0), (0, 0, 0));
  } else {}
}

_id_A2B0(var_0, var_1, var_2, var_3) {
  if (!isdefined(var_2))
  var_2 = 0.2;

  if (!isdefined(var_3))
  var_3 = 0.2;

  level.player _meth_8489("body", var_0, var_2, var_1);
  wait(getanimlength(var_0) - var_3);
  level.player _meth_8489("blendout", var_0, var_3, var_1);
}

_id_2B74(var_0, var_1, var_2, var_3, var_4, var_5) {
  self notify("stop_blended_links");
  self endon("stop_blended_links");

  if (!isdefined(var_3))
  var_3 = 0;

  var_6 = var_2 * var_3;

  if (!isdefined(var_4))
  var_4 = _func_0BF(var_0._id_01F1, 0);

  if (!isdefined(var_5))
  var_5 = _func_0BF(var_1._id_01F1, 0);

  while (var_6 < var_2) {
  var_7 = var_6 / var_2;
  var_8 = var_0 gettagangles(var_4);
  var_9 = var_1 gettagangles(var_5);
  var_10 = anglestoaxis(var_8);
  var_11 = anglestoaxis(var_9);
  var_12 = var_11["forward"] * var_7 + var_10["forward"] * (1 - var_7);
  var_13 = var_11["right"] * var_7 + var_10["right"] * (1 - var_7);
  var_14 = var_11["up"] * var_7 + var_10["up"] * (1 - var_7);
  var_15 = _func_017(var_12, var_13, var_14);
  var_16 = var_0 gettagorigin(var_4);
  var_17 = var_1 gettagorigin(var_5);
  var_18 = var_17 * var_7 + var_16 * (1 - var_7);

  if (var_7 < 0.5)
  self linkto(var_0, var_4, rotatevectorinverted(var_18 - var_16, var_8), var_15 - var_8);
  else
  self linkto(var_1, var_5, rotatevectorinverted(var_18 - var_17, var_9), var_15 - var_9);

  wait 0.05;
  var_6 = var_6 + 0.05;
  }

  scripts\engine\utility::waitframe();

  if (isdefined(self._id_10B89))
  self._id_10B89 delete();
}

_id_13DE7(var_0, var_1) {
  if (var_0[var_1] > 180)
  var_2 = var_0[var_1] - 360;
  else if (var_0[var_1] < -180)
  var_2 = var_0[var_1] + 360;
  else
  var_2 = var_0[var_1];

  return var_2;
}

_id_12D71(var_0, var_1, var_2) {
  var_3 = var_0[var_2];
  var_4 = var_1[var_2];

  for (;;) {
  if (var_3 - var_4 > 180) {
  var_3 = var_3 - 360;
  continue;
  }

  if (var_3 - var_4 < -180) {
  var_3 = var_3 + 360;
  continue;
  }

  return var_3;
  }
}

_id_C6FC(var_0, var_1, var_2) {
  self.angles = _id_1E83(var_0.angles, var_1.angles, var_2);
}

_id_1E83(var_0, var_1, var_2) {
  var_3 = anglestoforward(var_1);
  var_4 = anglestoforward(var_0);
  var_5 = anglestoup(var_1);
  var_6 = anglestoup(var_0);
  var_7 = anglestoright(var_1);
  var_8 = anglestoright(var_0);
  var_9 = var_4 * (1 - var_2) + var_3 * var_2;
  var_10 = var_8 * (1 - var_2) + var_7 * var_2;
  var_11 = var_6 * (1 - var_2) + var_5 * var_2;
  return _func_017(var_9, var_10, var_11);
}

_id_1994(var_0, var_1, var_2, var_3, var_4, var_5) {
  self._id_1198._id_7235._id_0334 = var_0;
  self._id_1198._id_7235._id_C364 = var_1;
  self._id_1198._id_7235._id_7237 = 0;
  self notify("bt_state_changed");

  if (isdefined(var_2)) {
  self._id_1198._id_7235._id_98F9 = var_2;
  self._id_1198._id_7235._id_98FE = var_3;
  self._id_1198._id_7235._id_C760 = var_4;
  self._id_1198._id_7235._id_C765 = var_5;
  } else {
  self._id_1198._id_7235._id_98F9 = undefined;
  self._id_1198._id_7235._id_98FE = undefined;
  self._id_1198._id_7235._id_C760 = undefined;
  self._id_1198._id_7235._id_C765 = undefined;
  }
}

_id_19B7() {
  self._id_1198._id_7235._id_0334 = undefined;
  self._id_1198._id_7235._id_C364 = undefined;
}

_id_199D(var_0, var_1, var_2, var_3, var_4, var_5) {
  self notify("new_follow_offset");
  thread _id_A254(var_0, var_1, var_2, var_3, var_4, var_5);
}

_id_A254(var_0, var_1, var_2, var_3, var_4, var_5) {
  self endon("death");
  self endon("entitydeleted");
  self endon("new_follow_offset");
  var_6 = self._id_1198._id_7235._id_C364;
  var_7 = self._id_1198._id_7235._id_98F9;
  var_8 = self._id_1198._id_7235._id_98FE;
  var_9 = self._id_1198._id_7235._id_C760;
  var_10 = self._id_1198._id_7235._id_C765;

  for (var_11 = var_0; var_11 > 0; var_11 = var_11 - 0.05) {
  var_12 = var_11 / var_0;
  var_13 = _id_0B4D::_id_6A8E(var_1, var_6, var_12);
  var_14 = _id_0B4D::_id_6A8E(var_2, var_7, var_12);
  var_15 = _id_0B4D::_id_6A8E(var_3, var_8, var_12);
  var_16 = _id_0B4D::_id_6A8E(var_4, var_9, var_12);
  var_17 = _id_0B4D::_id_6A8E(var_5, var_10, var_12);
  _id_A255(var_13, var_14, var_15, var_16, var_17);
  wait 0.05;
  }

  _id_A255(var_1, var_2, var_3, var_4, var_5);
}

_id_A255(var_0, var_1, var_2, var_3, var_4) {
  self._id_1198._id_7235._id_C364 = var_0;
  self._id_1198._id_7235._id_7237 = 0;
  self._id_1198._id_7235._id_98F9 = var_1;
  self._id_1198._id_7235._id_98FE = var_2;
  self._id_1198._id_7235._id_C760 = var_3;
  self._id_1198._id_7235._id_C765 = var_4;
}

_id_A372(var_0) {
  var_1 = _func_2AE(var_0);
  var_2 = getcsplinepointposition(var_1, 0);
  self _meth_83E7(var_2, self.angles);
  return var_1;
}

_id_A373(var_0, var_1) {
  var_2 = _id_A372(var_0);
  thread _id_A1EF(var_2, var_1);
}

_id_A1EF(var_0, var_1, var_2, var_3, var_4) {
  if (!isdefined(var_1)) {
  var_5 = _id_1996();
  var_1 = var_5._id_02B3;
  }

  if (!isdefined(var_4))
  var_4 = 1.0;

  if (!isdefined(var_2))
  var_2 = var_4 * scripts\engine\utility::_id_BD6A(var_1);

  _id_A1ED(var_0, var_1, var_2, var_3);
  _id_A342(var_0, var_4, var_3);
}

_id_A1F3(var_0, var_1, var_2, var_3, var_4) {
  if (!isdefined(var_4))
  var_4 = 1.0;

  if (!isdefined(var_3))
  var_3 = 2048;

  _id_A1F2(var_0, var_1, var_2, var_3);
  _id_A342(var_0, var_4, 1);
}

_id_A1F0(var_0, var_1, var_2, var_3, var_4) {
  _id_1981();

  if (!isdefined(var_3))
  var_3 = 0.2;

  var_5 = _func_2AE(var_0);
  var_6 = (var_4, 0, 0);
  var_6 = rotatevector(var_6, self.angles);
  var_7 = self.origin + var_6;
  var_8 = _func_2B7(var_5, var_7);
  self _meth_8455(var_8);

  if (!isdefined(var_2))
  var_2 = 384.0;

  self setneargoalnotifydist(var_2);

  if (isdefined(var_1))
  self _meth_845F(var_1);

  self waittill("near_goal");
  _id_1981();
  self _meth_8479(var_5);
  self _meth_847B(var_3, var_7);
  self._id_10A43 = var_5;
  self waittill("near_goal");
  _id_0C24::_id_10A44(var_5);
}

_id_A1ED(var_0, var_1, var_2, var_3) {
  if (isdefined(self._id_1198))
  _id_1981();

  if (isdefined(var_3) && var_3)
  var_4 = _func_2B7(var_0, self.origin);
  else
  var_4 = getcsplinepointposition(var_0, 0);

  self _meth_8455(var_4);

  if (!isdefined(var_2))
  var_2 = 384.0;

  self setneargoalnotifydist(var_2);

  if (isdefined(var_1))
  self _meth_845F(var_1);

  self waittill("near_goal");
}

_id_A1F2(var_0, var_1, var_2, var_3) {
  if (isdefined(self._id_1198))
  _id_1981();

  var_4 = getcsplinepointposition(var_0, var_1);
  self _meth_8455(var_4);

  if (!isdefined(var_3))
  var_3 = 384.0;

  self setneargoalnotifydist(var_3);

  if (isdefined(var_2))
  self _meth_845F(var_2);

  self waittill("near_goal");
}

_id_A112(var_0, var_1, var_2, var_3) {
  thread _id_A113(var_0, var_1, var_2, var_3);
}

_id_A113(var_0, var_1, var_2, var_3) {
  if (isdefined(level._id_D127._id_5F6F))
  return;

  if (!isdefined(var_1))
  var_1 = 3;

  if (!isdefined(var_2))
  var_2 = 0;

  if (!isdefined(var_3))
  var_3 = 0.5;

  var_4 = [var_2, var_0, var_1, gettime(), var_3];
  _id_A104(var_4);

  if (!isdefined(level._id_D127._id_432D))
  thread _id_A115();
}

_id_A115() {
  level._id_D127._id_432D = scripts\engine\utility::_id_107CE();
  level._id_D127._id_432D linkto(level._id_D127, "tag_origin", (0, 0, 0), (0, 0, 0));

  while (level._id_A056._id_432C.size > 0) {
  var_0 = level._id_A056._id_432C[0];
  level._id_A056._id_432C = _id_0B91::_id_22B0(level._id_A056._id_432C, 0);
  level.player _id_0B91::_id_65E8("disable_jackal_cockpit_VO");

  if (gettime() - var_0[3] > var_0[2] * 1000)
  continue;

  level.player _id_0B91::_id_65E1("jackal_cockpit_VO");
  level._id_A056._id_4B57 = var_0[0];
  level._id_D127._id_432D _id_A114(var_0[1]);
  level.player _id_0B91::_id_65DD("jackal_cockpit_VO");
  level._id_A056._id_4B57 = -999999;

  if (level._id_A056._id_432C.size > 0)
  wait(level._id_A056._id_432C[0][4]);
  }

  level._id_D127._id_432D delete();
}

_id_A114(var_0) {
  self endon("jackal_cockpit_VO_interupt");
  self playsound(var_0, "sounddone");
  self waittill("sounddone");
}

_id_A104(var_0) {
  var_1 = 0;

  for (;;) {
  if (level._id_A056._id_432C.size == var_1) {
  level._id_A056._id_432C[var_1] = var_0;
  break;
  }

  if (var_0[0] > level._id_A056._id_432C[var_1][0]) {
  level._id_A056._id_432C = scripts\engine\utility::_id_229C(level._id_A056._id_432C, var_0, var_1);
  break;
  }

  var_1++;
  }
}

_id_199B() {
  thread _id_199C();
}

_id_199C() {
  self endon("dont_kill_when_stuck");
  self waittill("jackal_stuck_on_geo");
  self notify("death");
}

_id_198D() {
  self notify("dont_kill_when_stuck");
}

_id_A1F4(var_0, var_1, var_2, var_3) {
  var_4 = scripts\engine\utility::_id_817E(var_0, "targetname");

  if (isdefined(var_3) && var_3)
  var_5 = var_4.angles;
  else
  var_5 = undefined;

  _id_A1EC(var_4.origin, var_1, var_2, var_5);
}

_id_A1EC(var_0, var_1, var_2, var_3) {
  self endon("death");
  self endon("delete");

  if (!isdefined(var_2))
  var_2 = 384.0;

  _id_1981();

  if (isdefined(var_3))
  self _meth_8455(var_0, var_1, var_3);
  else
  self _meth_8455(var_0, var_1);

  self setneargoalnotifydist(var_2);

  if (var_1)
  self waittill("goal");
  else
  self waittill("near_goal");
}

_id_1981() {
  if (!isdefined(self._id_1198))
  return;

  if (self._id_1198._id_EF72 && !isdefined(self._id_1FCE))
  return;

  if (!self._id_1198._id_EF72)
  self._id_1FCE = 1;

  self._id_1198._id_3F28 = undefined;
  self notify("jackal_animscripteduntilgoal");
  _id_19A9();
  thread _id_1982();
}

_id_1982() {
  self endon("jackal_animscripteduntilgoal");
  self waittill("near_goal");
  _id_1988();
  self._id_1FCE = undefined;
}

_id_19A9() {
  self._id_1198._id_EF72 = 1;
  self._id_3135._id_3F28 = undefined;
}

_id_1988() {
  self._id_1198._id_EF72 = 0;
}

_id_19A2() {
  scripts\asm\asm_bb::_id_2973();
  _id_19A9();
}

_id_1986() {
  scripts\asm\asm_bb::_id_2911();
  _id_1988();
}

_id_19B1(var_0) {
  self._id_1198._id_90EA = var_0;
}

_id_19B0(var_0) {
  self._id_1198._id_E1AC = var_0;

  if (var_0 == "hover" || var_0 == "fly") {
  self _meth_8491(var_0);
  _id_0C21::_id_20DD();
  }
}

_id_1984(var_0) {
  _id_19B5(var_0);
  _id_1980(0.5);
  wait 0.05;
  _id_19AE("shoot_single_burst");
  self waittill("firemode changed");
  _id_198A();
  _id_1980();
}

_id_6E8C(var_0) {
  if (isdefined(level._id_D127) && var_0 == level._id_D127)
  thread _id_6E92();

  scripts\engine\utility::_id_13762("missile_hit", "burnt_out");
  self._id_0019 = 0;
  self notify("pos_updated");
  stopfxontag(self._id_7542, self, "tag_origin");

  if (isdefined(var_0) && scripts\engine\utility::array_contains(var_0._id_6E9C._id_12B86, self))
  var_0._id_6E9C._id_12B86 = scripts\engine\utility::array_remove(var_0._id_6E9C._id_12B86, self);

  wait 0.05;
  self delete();
}

_id_6E92() {
  self endon("burnt_out");
  self waittill("missile_hit");
  self playsound("jackal_flare_hit_missile");
}

_id_19AF(var_0, var_1, var_2) {
  if (!isdefined(self._id_6E9C))
  return;

  if (isdefined(var_0)) {
  var_0 = clamp(var_0, 0, 100);
  self._id_6E9C._id_3C37 = var_0;
  }

  if (isdefined(var_1)) {
  var_1 = clamp(var_1, 0, 100);
  self._id_6E9C._id_3C38 = var_1;
  }

  if (isdefined(var_2)) {
  var_2 = clamp(var_2, 0, 100);
  self._id_6E9C._id_3C36 = var_2;
  }
}

_id_19AE(var_0) {
  if (self._id_1198._id_6D77 == var_0)
  return;

  self._id_1198._id_6D77 = var_0;
  self notify("stop sound" + self._id_1198._id_6D83);
  self notify("firemode changed");

  if (_id_0B91::_id_65DF("jackal_firing"))
  _id_0B91::_id_65DD("jackal_firing");
}

_id_1989() {
  self._id_1198._id_C705 = undefined;
  self._id_1198._id_C702 = undefined;
}

_id_19B2(var_0, var_1) {
  self._id_1198._id_C705 = var_0;

  if (var_0 == "face angle") {
  self._id_1198._id_C702 = var_1;
  self _meth_8457(var_0, var_1);
  return;
  }

  self._id_1198._id_C702 = undefined;
  self _meth_8457(var_0);
}

_id_19B5(var_0) {
  self._id_1198._id_11577 = var_0;
  _id_0C1B::_id_12E3A();
}

_id_198A() {
  self._id_1198._id_11577 = undefined;
}

_id_19A0(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (var_0)
  _id_19A2();
  else
  _id_1986();
}

_id_19AB(var_0, var_1, var_2, var_3) {
  if (isdefined(self._id_1198)) {
  _id_19AD(var_0, var_1, var_2, var_3);
  _id_19AC(var_0, var_1, var_2, var_3);
  }
  else
  self _meth_845F(var_0, var_1, var_2, var_3);
}

_id_19AC(var_0, var_1, var_2, var_3) {
  if (!isdefined(var_0))
  self._id_1198._id_23A4 = _id_0C21::_id_9536();
  else
  {
  self._id_1198._id_23A4._id_02B3 = var_0;

  if (isdefined(var_1))
  self._id_1198._id_23A4._id_1545 = var_1;

  if (isdefined(var_2))
  self._id_1198._id_23A4._id_1E91 = var_2;

  if (isdefined(var_3))
  self._id_1198._id_23A4._id_1E71 = var_3;
  }

  _id_0C21::_id_20DD();
}

_id_19AD(var_0, var_1, var_2, var_3) {
  if (!isdefined(var_0))
  self._id_1198._id_1113B = _id_0C21::_id_976D();
  else
  {
  self._id_1198._id_1113B._id_02B3 = var_0;

  if (isdefined(var_1))
  self._id_1198._id_1113B._id_1545 = var_1;

  if (isdefined(var_2))
  self._id_1198._id_1113B._id_1E91 = var_2;

  if (isdefined(var_3))
  self._id_1198._id_1113B._id_1E71 = var_3;
  }

  _id_0C21::_id_20DD();
}

_id_1996() {
  return _id_0C21::_id_814A();
}

_id_ACE8(var_0, var_1) {
  while (!isdefined(level._id_D127))
  wait 0.05;

  if (!isdefined(var_0))
  var_0 = (1, 1, 1);

  self endon("stop_line");

  for (;;) {
  if (!isdefined(self))
  break;

  if (isdefined(var_1))
  var_2 = self gettagorigin(var_1);
  else
  var_2 = self.origin;

  wait 0.05;
  }
}

_id_19A7(var_0, var_1, var_2, var_3) {
  if (!isdefined(self._id_B8AE))
  self._id_B8AE = spawnstruct();

  var_0 = max(512, var_0);
  self._id_B8AE._id_DCCA = var_0;
  self._id_B8AE._id_B48B = var_1;
  self._id_B8AE._id_B758 = var_2;

  if (isdefined(var_3))
  self._id_B8AE._id_B4C9 = var_3;
}

_id_1987() {
  self._id_B8AE = undefined;
}

_id_19A3(var_0) {
  self._id_1198._id_E1AB = var_0;
}

_id_1995(var_0) {
  self._id_1198._id_E1AB = var_0;
  self._id_1198._id_38DC = var_0;
  var_1 = undefined;

  if (var_0 == "up")
  var_1 = _func_2EE(self._id_238F, "cannon_state", "up", 0);
  else
  var_1 = _func_2EE(self._id_238F, "cannon_state", "down", 0);

  self _meth_82E2("cannon", var_1._id_0047, 1.0, 0.0, 1.0);
  self _meth_82B0(var_1._id_0047, 1.0);
}

_id_DBDC(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7) {
  var_8 = scripts\engine\utility::ter_op(isdefined(var_3), var_3, 30000);
  var_9 = distance(level._id_D127.origin, var_0);

  if (var_9 > var_8)
  return;

  if (isdefined(level._id_58DB))
  return;

  level._id_58DB = 1;
  var_10["r_mbenable"] = getdvar("r_mbenable");
  var_10["r_mbRadialOverridePosition"] = getdvar("r_mbRadialOverridePosition");
  var_10["r_mbRadialOverridePositionActive"] = getdvarint("r_mbRadialOverridePositionActive");
  var_10["r_mbradialoverridestrength"] = getdvarfloat("r_mbradialoverridestrength");
  var_10["r_mbradialoverrideradius"] = getdvarfloat("r_mbradialoverrideradius");
  _func_1C5("r_mbenable", 1);
  _func_1C5("r_mbRadialOverridePosition", var_0);
  _func_1C5("r_mbRadialOverridePositionActive", 1);
  var_11 = scripts\engine\utility::ter_op(isdefined(var_2), var_2, 2000);
  var_1 = scripts\engine\utility::ter_op(isdefined(var_1), var_1, 0.135848);
  var_12 = var_1 / 4;
  var_4 = scripts\engine\utility::ter_op(isdefined(var_4), var_4, -0.107266);
  var_5 = scripts\engine\utility::ter_op(isdefined(var_5), var_5, 0.05);
  var_6 = scripts\engine\utility::ter_op(isdefined(var_6), var_6, 0.5);
  var_9 = distance(level.player.origin, var_0);
  var_13 = _id_0B4D::_id_C097(var_8, var_11, var_9);
  var_14 = _id_0B4D::_id_6A8E(var_1, var_12, var_13);
  var_14 = clamp(var_14, 0, 1);

  if (!isdefined(var_7)) {
  if (!scripts\engine\trace::_id_DCF1(var_0 + (0, 0, 12), level.player geteye())) {
  var_14 = var_14 * 0.5;
  var_14 = clamp(var_14, 0, 1);
  }
  }

  _func_1C5("r_mbradialoverridestrength", var_14);
  _func_1C5("r_mbradialoverrideradius", var_4);
  wait(var_5);
  thread _id_0B91::_id_AB9A("r_mbradialoverridestrength", var_10["r_mbradialoverridestrength"], var_6);
  thread _id_0B91::_id_AB9A("r_mbradialoverrideradius", var_10["r_mbradialoverrideradius"], var_6);
  scripts\engine\utility::_id_6E59("frag_force_delete", var_6);
  _func_1C5("r_mbenable", var_10["r_mbenable"]);
  _func_1C5("r_mbRadialOverridePosition", var_10["r_mbRadialOverridePosition"]);
  _func_1C5("r_mbRadialOverridePositionActive", var_10["r_mbRadialOverridePositionActive"]);
  level._id_58DB = undefined;
}

_id_D527(var_0, var_1, var_2, var_3, var_4) {
  var_5 = spawn("script_origin", var_1);
  var_5 playsound(var_0, "sounddone");

  if (isdefined(var_2))
  var_5 _meth_8277(var_2, 0);

  if (isdefined(var_3))
  var_5 _meth_8278(var_3, 0);

  if (isdefined(var_4))
  var_5 linkto(var_4);

  var_5 waittill("sounddone");
  var_5 delete();
}

_id_D52C(var_0, var_1, var_2, var_3, var_4, var_5) {
  var_6 = scripts\engine\utility::_id_107E6(self.origin, self.angles);

  if (!isdefined(var_1))
  var_1 = _func_0BF(self._id_01F1, 0);

  var_6 linkto(self, var_1, (0, 0, 0), (0, 0, 0));
  var_6 playsound(var_0, "sounddone");

  if (isdefined(var_2))
  var_6 _meth_8277(var_2, 0);

  if (isdefined(var_3))
  var_6 _meth_8278(var_3, 0);

  if (isdefined(var_4))
  _id_D52D(var_6, "sounddone", var_4);
  else
  var_6 waittill("sounddone");

  if (isdefined(var_5))
  wait(var_5);

  var_6 _meth_8278(0, 0.1);
  var_6 delete();
}

_id_D52D(var_0, var_1, var_2) {
  var_0 endon(var_1);
  self waittill(var_2);
  return;
}

_id_F2FF() {
  self _meth_84BF(1);
  level._id_A056._id_D824 = scripts\engine\utility::_id_2279(level._id_A056._id_D824, self);
  thread _id_413C();
  level.player _meth_84D4(1);
}

_id_413B() {
  if (isdefined(self)) {
  self _meth_84BF(0);
  level._id_A056._id_D824 = scripts\engine\utility::array_remove(level._id_A056._id_D824, self);
  }

  level._id_A056._id_D824 = scripts\engine\utility::_id_22BC(level._id_A056._id_D824);

  if (level._id_A056._id_D824.size == 0)
  level.player _meth_84D4(0);
}

_id_413C() {
  self waittill("entitydeleted ");
  _id_413B();
}

_id_A287(var_0) {
  if (isdefined(var_0)) {
  if (isdefined(level.script) && level.script == "moonjackal")
  level.player scripts\engine\utility::_id_50E1(1, ::_meth_82C0, "jackal_mute_engines", 1);
  else
  level.player _meth_82C0("jackal_mute_engines", var_0);
  }
  else
  level.player _meth_82C0("jackal_mute_engines", 0.5);
}

_id_A388(var_0) {
  if (isdefined(var_0)) {
  if (isdefined(level.script) && level.script == "moonjackal")
  level.player scripts\engine\utility::_id_50E1(2, ::_meth_82C0, "jackal_cockpit", 0.5);
  else
  level.player _meth_82C0("jackal_cockpit", var_0);
  }
  else
  level.player _meth_82C0("jackal_cockpit", 0.5);
}

_id_1990(var_0) {
  self._id_1198._id_C97C = var_0;
}

_id_198E(var_0) {
  self._id_1198._id_0039 = var_0;
}

_id_19A1() {
  self._id_3135._id_EF78 = 1;
}

_id_198B(var_0) {
  self._id_38A2 = 0;
  thread _id_198C(var_0);
}

_id_198C(var_0) {
  self notify("cooldown_events_think");
  self endon("cooldown_events_think");
  self endon("death");
  wait(var_0);
  self._id_38A2 = 1;
}

_id_3819() {
  if (!self._id_38A2)
  return 0;

  if (self._id_0184)
  return 0;

  if (_id_9CB2())
  return 0;

  if (_id_9B67())
  return 0;

  return 1;
}

_id_9BCF() {
  if (isdefined(self._id_1198) && isdefined(self._id_1198._id_A421))
  return 1;

  if (isdefined(self._id_A420) && self._id_A420.size > 0)
  return 1;

  return 0;
}

_id_9CB2() {
  if (isdefined(self._id_1198) && self._id_1198._id_EF72)
  return 1;
  else
  return 0;
}

_id_9B67() {
  if (isdefined(self._id_1198) && self._id_1198._id_1FCD)
  return 1;
  else
  return 0;
}

_id_9C06() {
  if (isdefined(self._id_1198) && isdefined(self._id_1198._id_90EE))
  return 1;
  else
  return 0;
}

_id_16EE(var_0, var_1) {
  var_2 = level._id_90E2._id_5084.size;
  level._id_90E2._id_5084[var_2] = var_0;
  level._id_90E2._id_508A[var_2] = var_1;
}

_id_A224(var_0, var_1) {
  if (!isdefined(var_0))
  var_0 = 1;

  if (!isdefined(var_1))
  var_1 = 0;

  if (var_0) {
  setomnvar("ui_jackal_autopilot", 1);

  if (var_1)
  _id_A112("jackal_hud_autopilot");
  }
  else
  setomnvar("ui_jackal_autopilot", 0);
}

_id_9641() {
  level._id_A056._id_12749 = spawnstruct();
  level._id_A056._id_12749._id_A0E5 = ::_id_A0E5;
  level._id_A056._id_12749._id_A0E2 = ::_id_A0E2;
  level._id_A056._id_12749._id_A0E3 = ::_id_A0E3;
  level._id_A056._id_12749._id_A0E1 = ::_id_A0E1;
}

_id_A0E1(var_0, var_1, var_2, var_3) {
  scripts\engine\utility::_id_6E3E(var_3);
  level._id_D127 endon("death");
  level notify("jackal_autoturn");
  level endon("jackal_autoturn");
  _id_A1DD("fly");
  _id_A1DC(400);
  _id_A14A();
  _id_A155();
  var_4 = -1;
  _id_D165(self.origin, 0, 1, 0);
  _id_D16C(self.origin, 0, 1, 0, 1);
  _func_1C5("spaceshipautolevel", 2);
  _id_A224();
  var_5 = 0;
  wait 0.05;
  var_6 = 150;
  var_7 = 450;
  var_8 = 150;
  var_9 = 0.9;
  _id_D165(self.origin, 1, 0, 0.5);
  _id_D16C(self.origin, 0.05, 1, 1, 1);
  _id_A302(5.5, 0.5, "boundary_autoturn");

  while (scripts\engine\utility::_id_6E25(var_2) || var_4 < 0.6) {
  if (!isdefined(level._id_D127))
  break;

  var_10 = anglestoforward(level._id_D127.angles);
  var_11 = vectornormalize(self.origin - level._id_D127.origin);
  var_4 = vectordot(var_10, var_11);
  var_12 = length(level._id_D127._id_02AC);
  var_13 = _id_0B4D::_id_C097(-1, 1, var_4);
  var_14 = _id_0B4D::_id_6A8E(var_6, var_7, var_13);
  var_15 = var_14 - var_12;
  var_16 = _id_0B4D::_id_C097(-1 * var_8, var_8, var_15);
  var_17 = _id_0B4D::_id_6A8E(1 - var_9, 1 + var_9, var_16);
  _id_A301(var_17, 0.05, "boundary_autoturn");

  if (var_4 > 0.4 && !var_5) {
  _func_1C5("spaceshipautolevel", 0);
  var_5 = 1;
  _id_A302(1, 1, "boundary_autoturn");
  }

  wait 0.05;
  }

  _func_1C5("spaceshipautolevel", 0);
  _id_A224(0);
  _id_A1DD(0);
  _id_A1DC(0);
  _id_A14A(0);
  _id_A155(0);
  _id_D165(self.origin, 0, 1, 0.3);
  _id_D16C(self.origin, 0, 1, 0.3, 1);
  _id_A302(1, 0.2, "boundary_autoturn");
  scripts\engine\utility::_id_6E2A(var_3);
}

_id_A0E5(var_0) {
  if (var_0 && !self._id_138F0) {
  setomnvar("ui_jackal_boundary_warning", 1);
  self._id_EEDE = "allies";
  _id_105DB("capitalship", undefined, "none", "none", 0);
  thread _id_A0E6();
  thread _id_A0E9();
  self._id_138F0 = 1;
  }
  else if (!var_0 && self._id_138F0) {
  setomnvar("ui_jackal_boundary_warning", 0);
  level notify("stop_boundary_warning_alarm");
  _id_0B76::_id_F42C("none");
  _id_105DA();
  self._id_138F0 = 0;
  }
}

_id_A0E2() {
  self endon("stop_trigger_push");

  for (;;) {
  _id_A14E(1);

  if (!scripts\engine\utility::_id_D11B() || level.player _id_0B91::_id_65DB("disable_jackal_map_boundary_push")) {
  _id_A078((0, 0, 0), 0.05, "boundary_push" + self._id_12751);
  wait 0.05;
  continue;
  }

  var_0 = vectornormalize(self._id_98F5.origin - self._id_C75B.origin);
  var_1 = vectornormalize(self._id_C75B.origin - self._id_98F5.origin);
  var_2 = vectornormalize(level._id_D127.origin - self._id_98F5.origin);
  var_3 = vectornormalize(level._id_D127.origin - self._id_C75B.origin);
  var_4 = vectordot(var_2, var_1);
  var_5 = vectordot(var_3, var_0);
  var_4 = clamp(var_4, 0, 1);
  var_5 = clamp(var_5, 0, 1);
  var_6 = 1 - _id_0B4D::_id_C097(0, var_4 + var_5, var_5);
  var_7 = _id_0B4D::_id_6A8E(0, self._id_EEBF, var_6);
  var_7 = var_7 * var_0;
  _id_A078(var_7, 0.05, "boundary_push" + self._id_12751);
  wait 0.05;
  }
}

_id_A0E3() {
  _id_A14E(0);

  if (!scripts\engine\utility::_id_D11B())
  return;

  _id_A078((0, 0, 0), 0.05, "boundary_push" + self._id_12751);
  self notify("stop_trigger_push");
}

_id_A0E6() {
  level endon("stop_boundary_warning_alarm");

  for (;;) {
  thread _id_A0E7();
  wait 2.5;
  }
}

_id_A0E9() {
  level endon("stop_boundary_warning_alarm");

  for (;;) {
  self _meth_8557("OFFSCREEN_ENEMY_INDICATOR");
  wait 0.5;
  self _meth_8558();
  wait 0.25;
  }
}

_id_A0E7() {
  var_0 = spawn("script_origin", level._id_D127.origin);
  var_0 playsound("jackal_boundary_warning", "sounddone");
  var_0 _id_A0E8();
  var_0 _meth_83AD();
  wait 0.05;
  var_0 delete();
}

_id_A0E8() {
  level endon("stop_boundary_warning_alarm");
  self waittill("sounddone");
}

_id_1997() {
  _id_19B1(0);
  _id_19AF(100, 100, 100);
  self._id_6E9C._id_50D1 = 0.1;
  self._id_6E9C._id_50D0 = 0.2;
  self._id_0184 = 1;
  self.maxhealth = int(self.maxhealth * 1.5);
  self.health = self.maxhealth;
}

_id_1999() {
  _id_19B1(0);
  _id_19AF(100, 100, 100);
  self._id_6E9C._id_50D1 = 0.4;
  self._id_6E9C._id_50D0 = 0.5;
  self._id_0184 = 1;
  self.maxhealth = int(self.maxhealth * 1.5);
  self.health = self.maxhealth;
}

_id_A064(var_0) {
  var_1 = 0;

  for (;;) {
  var_2 = tablelookupbyrow("sp/mostwanted.csv", var_1, 10);

  if (!isdefined(var_2) || var_2 == "")
  break;

  if (var_2 == var_0) {
  var_3 = tablelookupbyrow("sp/mostwanted.csv", var_1, 2);
  return var_3;
  }

  var_1++;
  }

  return undefined;
}

_id_A063() {
  self waittill("death");
  _id_0A2F::_id_DA45(self._id_92BD);
}

_id_1998() {
  _id_19AF(100, 100, 100);
  self._id_6E9C._id_50D1 = 0.4;
  self._id_6E9C._id_50D0 = 0.5;
  self._id_51E6 = 1;
}

_id_136A6(var_0) {
  self endon("death");

  for (;;) {
  self waittill("trigger", var_1);

  if (!isdefined(var_0) || var_1 != var_0)
  continue;

  break;
  }
}

_id_116A8(var_0, var_1, var_2) {
  if (!isdefined(var_2))
  var_2 = 0;

  var_3 = _id_0B3F::_id_48B7("black", 0, level.player);
  var_4 = _id_0B3F::_id_49B2("default", 1.5);
  var_4._id_AEC4 = 0;
  var_4._id_002B = "left";
  var_4._id_002C = "top";
  var_4._id_0142 = 1;
  var_4._id_02A4 = 20;
  var_4.alpha = 0;
  var_5 = 0.3;
  var_4 fadeovertime(var_5);
  var_3 fadeovertime(var_5);
  var_3.alpha = 0.7;
  var_4.alpha = 1;
  var_4.x = 40;
  var_4.y = 200 + var_2;
  var_4._id_01AD = " " + var_0;
  var_4._id_00B9 = (1, 1, 1);
  wait(var_1);
  var_5 = 0.5;
  var_4 fadeovertime(var_5);
  var_3 fadeovertime(var_5);
  var_3.alpha = 0.0;
  var_4.alpha = 0;
  wait(var_5);
  var_4 destroy();
  var_3 destroy();
}
