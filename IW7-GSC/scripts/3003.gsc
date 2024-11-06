/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3003.gsc
***************************************/

_id_D623(var_0) {
  precachemodel(var_0 + "_landed");
  precachemodel("veh_mil_air_ca_drop_pod_doors");
  precachemodel("veh_mil_air_ca_drop_pod_large_static_rail_c6");
  _id_75E7();
  _id_1F2B();
}

_id_75E7() {
  level._effect["drop_pod_thruster"] = loadfx("vfx/iw7/core/vehicle/droppod/veh_drop_pod_thruster.vfx");
  level._effect["drop_pod_trail"] = loadfx("vfx/iw7/core/vehicle/droppod/veh_drop_pod_trail.vfx");
  level._effect["drop_pod_impact"] = loadfx("vfx/iw7/core/vehicle/droppod/veh_drop_pod_impact.vfx");
  level._effect["pod_door_close"] = loadfx("vfx/iw7/core/vehicle/droppod/veh_drop_pod_door_close.vfx");
  level._effect["pod_door_move"] = loadfx("vfx/iw7/core/vehicle/droppod/veh_drop_pod_door_move.vfx");
}

_id_1F2B() {
  _id_215E();
}

#using_animtree("script_model");

_id_215E() {
  level._id_EC87["droppod_arm"] = #animtree;
  level._id_EC8C["droppod_arm"] = "veh_mil_air_ca_drop_pod_arm";
  level._id_EC85["droppod_arm_0"]["pod_exit"] = %vh_red_droppod_exit_arm_01;
  level._id_EC85["droppod_arm_0"]["pod_idle"][0] = %vh_red_droppod_exit_idle_arm_01;
  level._id_EC85["droppod_arm_1"]["pod_exit"] = %vh_red_droppod_exit_arm_02;
  level._id_EC85["droppod_arm_1"]["pod_idle"][0] = %vh_red_droppod_exit_idle_arm_02;
  level._id_EC85["droppod_arm_2"]["pod_exit"] = %vh_red_droppod_exit_arm_03;
  level._id_EC85["droppod_arm_2"]["pod_idle"][0] = %vh_red_droppod_exit_idle_arm_03;
  level._id_EC85["droppod_arm_3"]["pod_exit"] = %vh_red_droppod_exit_arm_04;
  level._id_EC85["droppod_arm_3"]["pod_idle"][0] = %vh_red_droppod_exit_idle_arm_04;
}

_id_D629() {
  self endon("death");

  if (isdefined(self.script_noteworthy) && self.script_noteworthy == "no_doors_pop")
  self._id_BFEB = 1;

  self _meth_8209();
  _id_0B93::_id_8441();
  thread _id_5D49();
  self._id_4D94 = spawnstruct();
  waittillframeend;
  _id_FA1E();
  thread _id_D60B();
  thread _id_5FF0();

  if (isdefined(self._id_ECF5))
  _id_1F82();
  else
  {
  _id_BC59();

  if (isdefined(self._id_027B)) {
  self hide();
  _id_0B91::_id_027B();
  self show();
  }

  _id_D60C();
  }

  self notify("landed");
  self _meth_8208();
  thread _id_D614();

  if (isdefined(self._id_ED54)) {
  scripts\engine\utility::waitframe();
  _id_514A();
  }

  if (isdefined(self._id_E4FB) && self._id_E4FB.size)
  thread _id_D62B();

  wait 0.05;
  self._id_4D94 = undefined;
}

_id_5D49() {
  self endon("entitydeleted");
  self endon("droppod_magic_bullet_shield");
  wait 0.05;

  if (!self._id_E4FB.size)
  return;

  var_0 = self._id_E4FB;

  foreach (var_2 in var_0)
  var_2 _id_0B91::_id_B14F();

  self waittill("landed");
  var_0 = _id_0B91::_id_22B9(var_0);

  foreach (var_2 in var_0)
  var_2 _id_0B91::_id_1101B();
}

_id_FA1E() {
  if (issubstr(self.classname, "cheap"))
  return;

  var_0 = [];

  for (var_1 = 0; var_1 < 4; var_1++) {
  var_0[var_1] = _id_0B91::_id_10639("droppod_arm");
  var_0[var_1]._id_1FBB = "droppod_arm_" + var_1;
  }

  self._id_226D = var_0;
  _id_0B06::_id_1EC1(self._id_226D, "pod_exit");

  foreach (var_3 in self._id_226D)
  var_3 linkto(self);

  self attach("veh_mil_air_ca_drop_pod_large_static_rail_c6", "tag_origin");
}

_id_FA1F() {
  playfxontag(level._effect["pod_door_close"], self, "TAG_ORIGIN");
}

_id_FB98() {
  if (!isdefined(self))
  return;

  if (isdefined(self._id_594A))
  return;

  var_0 = spawn("script_origin", self.origin);
  var_0 linkto(self);

  if (!isdefined(self._id_4D94._id_5EED))
  self._id_4D94._id_5EED = 1.41;

  if (self._id_4D94._id_5EED > 1.4) {
  var_1 = self._id_4D94._id_5EED - 1.35;
  wait(var_1);
  }

  var_2 = "droppod_incoming";

  if (isdefined(self._id_93D4))
  var_2 = self._id_93D4;

  var_0 playsound(var_2);
  scripts\engine\utility::waittill_any("death", "landed");

  if (isdefined(self)) {
  var_3 = "droppod_land_impact";

  if (isdefined(self._id_934A))
  var_3 = self._id_934A;

  _func_178(var_3, self.origin);
  }

  wait 0.06;

  if (isdefined(var_0)) {
  var_0 _meth_83AD();
  var_0 delete();
  }

  if (isdefined(self))
  self notify("stop sounddroppod_descend_lp");
}

_id_5FF0() {
  self endon("entitydeleted");
  self._id_4D94._id_75C6 = ["TAG_THRUSTER_1", "TAG_THRUSTER_2", "TAG_THRUSTER_3", "TAG_THRUSTER_4"];
  self waittill("dropping");
  playfxontag(scripts\engine\utility::_id_7ECB("drop_pod_trail"), self, "tag_fx");
  thread _id_FB98();
  var_0 = "drop_pod_thruster";

  if (isdefined(self._id_1186F))
  var_0 = self._id_1186F;

  foreach (var_2 in self._id_4D94._id_75C6)
  thread _id_0B91::_id_75C4(var_0, var_2);

  scripts\engine\utility::waittill_any("landed", "death");

  foreach (var_2 in self._id_4D94._id_75C6)
  thread _id_0B91::_id_75F8(var_0, var_2);
}

_id_D60C() {
  self endon("death");
  self._id_4D94._id_5EED = _id_36E8();
  self._id_4D94._id_AD34 = scripts\engine\utility::_id_107E6();
  self._id_4D94._id_AD34.origin = self.origin;
  self._id_4D94._id_AD34.angles = self.angles;
  self linkto(self._id_4D94._id_AD34);
  self notify("dropping");
  self._id_4D94._id_AD34 moveto(self._id_4D94._id_A843, self._id_4D94._id_5EED, self._id_4D94._id_5EED * 0.3, 0);
  self._id_4D94._id_AD34 waittill("movedone");
  self._id_4D94._id_AD34 delete();
}

_id_D614() {
  if (isdefined(self._id_BFF7))
  return;

  var_0 = self.origin + (0, 0, 32);

  if (!isdefined(self._id_ED41) || isdefined(self._id_ED41) && self._id_ED41)
  radiusdamage(var_0, 128, 500, 250, self, "MOD_EXPLOSIVE");

  physicsexplosionsphere(var_0, 500, 1, 1);
  stopfxontag(scripts\engine\utility::_id_7ECB("drop_pod_trail"), self, "tag_fx");
  playfx(scripts\engine\utility::_id_7ECB("drop_pod_impact"), self.origin);
  earthquake(0.5, 1, self.origin, 2500);
  playrumbleonentity("droppod_impact", self.origin);
  self setmodel(self._id_01F1 + "_landed");
  self disconnectpaths();
}

_id_D62B() {
  if (isdefined(self._id_10819))
  self waittill(self._id_10819);

  if (isdefined(self._id_226D))
  thread _id_0B06::_id_1F2C(self._id_226D, "pod_exit");

  thread _id_0B93::_id_13253();
}

_id_D60B(var_0) {
  self attach("veh_mil_air_ca_drop_pod_doors", "tag_origin");

  if (isdefined(self._id_BFEB) && self._id_BFEB)
  return;

  if (isdefined(var_0))
  self waittill("pop_doors");
  else
  {
  self waittill("dropping");
  scripts\engine\utility::_id_13736(self._id_4D94._id_5EED * 0.9, "pop_doors");
  }

  self _meth_8096("veh_mil_air_ca_drop_pod_doors", "tag_origin");
  self playsound("droppod_door_open");
  _func_121(level._effect["pod_door_close"], self, "TAG_ORIGIN");
  playfxontag(level._effect["pod_door_move"], self, "TAG_ORIGIN");
}

_id_514A() {
  if (isdefined(self._id_226D))
  _id_0B91::_id_228A(self._id_226D);

  self delete();
}

_id_36E8() {
  if (isdefined(self._id_02B3))
  var_0 = self._id_02B3;
  else
  var_0 = 1000;

  var_1 = var_0 * 5280 / 3600;
  var_2 = self._id_4D94._id_56F3;
  var_3 = var_2 / var_1;
  return var_3;
}

_id_1F82() {
  self hide();
  var_0 = self._id_ECF5;
  self._id_1FBB = "droppod";
  self._id_4D94._id_5EED = getanimlength(_id_0B91::_id_7DC1(var_0));
  var_1 = self;

  if (isdefined(self._id_1FBE))
  var_1 = self._id_1FBE;

  thread _id_C12A();
  var_1 _id_0B06::_id_1EC3(self, var_0);
  self show();
  self notify("dropping");
  var_1 _id_0B06::_id_1F35(self, var_0);
}

_id_C12A(var_0) {
  wait(self._id_4D94._id_5EED * 0.8);
  self notify("pop_doors");
}

_id_BC59() {
  if (isdefined(self._id_EE79))
  self._id_4D94._id_56F3 = int(self._id_EE79);
  else
  self._id_4D94._id_56F3 = 4000;

  self._id_4D94._id_A843 = self.origin;
  self._id_4D94._id_5EF2 = (0, 0, 1);
  var_0 = self.angles;
  var_1 = _id_0B91::_id_7A96();

  if (isdefined(var_1)) {
  if (isdefined(var_1.script_noteworthy) && var_1.script_noteworthy == "drop_angle") {
  self._id_4D94._id_5EF2 = vectornormalize(var_1.origin - self.origin);
  var_0 = vectortoangles(self._id_4D94._id_5EF2) + (90, 0, 0);
  }
  }

  if (isdefined(self._id_ECF4) && self._id_ECF4) {
  self._id_4D94._id_5EF2 = anglestoup(self.angles);
  var_0 = self.angles;
  }

  var_2 = self.origin + self._id_4D94._id_5EF2 * self._id_4D94._id_56F3;
  self _meth_83E7(var_2, var_0);
}

_id_2477() {
  self._id_4D94._id_5A2B = _id_0B91::_id_10639("droppod_door");
  _id_0B06::_id_1EC3(self._id_4D94._id_5A2B, "door_pop");
  self._id_4D94._id_5A2B linkto(self);
}
