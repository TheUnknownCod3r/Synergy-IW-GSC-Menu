/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2787.gsc
***************************************/

_id_C56E() {
  for (;;) {
  level waittill("connected", var_0);
  var_0._id_C210 = 0;
  }
}

_id_D387(var_0) {
  self._id_C210++;

  if (self._id_C210 == 1)
  _id_DBE8();
}

_id_D3CE(var_0) {
  self._id_C210--;

  if (self._id_C210 != 0)
  return;

  self._id_D64C = 0;
  self notify("leftTrigger");

  if (isdefined(self._id_DBE9))
  self._id_DBE9 _id_6AB9(0.1, 0);
}

_id_10481(var_0) {
  scripts\engine\utility::waittill_any("death", "leftTrigger");
  self stoploopsound();
}

_id_DBE8() {
  self endon("disconnect");
  self endon("game_ended");
  self endon("death");
  self endon("leftTrigger");
  self._id_D64C = 0;
  thread _id_10481(self);

  for (;;) {
  self._id_D64C++;

  switch (self._id_D64C) {
  case 1:
  self._id_DBEA = "item_geigercouner_level2";
  self playloopsound(self._id_DBEA);
  self viewkick(1, self.origin);
  break;
  case 3:
  self shellshock("mp_radiation_low", 4);
  self._id_DBEA = "item_geigercouner_level3";
  self stoploopsound();
  self playloopsound(self._id_DBEA);
  self viewkick(3, self.origin);
  _id_5A64(15);
  break;
  case 4:
  self shellshock("mp_radiation_med", 5);
  self._id_DBEA = "item_geigercouner_level3";
  self stoploopsound();
  self playloopsound(self._id_DBEA);
  self viewkick(15, self.origin);
  thread _id_2B48();
  _id_5A64(25);
  break;
  case 6:
  self shellshock("mp_radiation_high", 5);
  self._id_DBEA = "item_geigercouner_level4";
  self stoploopsound();
  self playloopsound(self._id_DBEA);
  self viewkick(75, self.origin);
  _id_5A64(45);
  break;
  case 8:
  self shellshock("mp_radiation_high", 5);
  self._id_DBEA = "item_geigercouner_level4";
  self stoploopsound();
  self playloopsound(self._id_DBEA);
  self viewkick(127, self.origin);
  _id_5A64(175);
  break;
  }

  wait 1;
  }

  wait 5;
}

_id_2B48() {
  self endon("disconnect");
  self endon("game_ended");
  self endon("death");
  self endon("leftTrigger");

  if (!isdefined(self._id_DBE9)) {
  self._id_DBE9 = newclienthudelem(self);
  self._id_DBE9.x = 0;
  self._id_DBE9.y = 0;
  self._id_DBE9 setshader("black", 640, 480);
  self._id_DBE9._id_002B = "left";
  self._id_DBE9._id_002C = "top";
  self._id_DBE9._id_017D = "fullscreen";
  self._id_DBE9._id_0382 = "fullscreen";
  self._id_DBE9.alpha = 0;
  }

  var_0 = 1;
  var_1 = 2;
  var_2 = 0.25;
  var_3 = 1;
  var_4 = 5;
  var_5 = 100;
  var_6 = 0;

  for (;;) {
  while (self._id_D64C > 1) {
  var_7 = var_5 - var_4;
  var_6 = (self._id_D64C - var_4) / var_7;

  if (var_6 < 0)
  var_6 = 0;
  else if (var_6 > 1)
  var_6 = 1;

  var_8 = var_1 - var_0;
  var_9 = var_0 + var_8 * (1 - var_6);
  var_10 = var_3 - var_2;
  var_11 = var_2 + var_10 * var_6;
  var_12 = var_6 * 0.5;

  if (var_6 == 1)
  break;

  var_13 = var_9 / 2;
  self._id_DBE9 _id_6AB7(var_13, var_11);
  self._id_DBE9 _id_6AB9(var_13, var_12);
  wait(var_6 * 0.5);
  }

  if (var_6 == 1)
  break;

  if (self._id_DBE9.alpha != 0)
  self._id_DBE9 _id_6AB9(1, 0);

  wait 0.05;
  }

  self._id_DBE9 _id_6AB7(2, 0);
}

_id_5A64(var_0) {
  self thread [[level.callbackplayerdamage]](self, self, var_0, 0, "MOD_SUICIDE", "claymore_mp", self.origin, (0, 0, 0) - self.origin, "none", 0);
}

_id_6AB7(var_0, var_1) {
  self fadeovertime(var_0);
  self.alpha = var_1;
  wait(var_0);
}

_id_6AB9(var_0, var_1) {
  self fadeovertime(var_0);
  self.alpha = var_1;
  wait(var_0);
}
