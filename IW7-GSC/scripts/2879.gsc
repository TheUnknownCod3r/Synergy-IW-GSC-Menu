/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2879.gsc
***************************************/

_id_F7D6(var_0) {
  if (isdefined(self._id_C8F2) && self._id_C8F2 == var_0)
  return;

  if (isdefined(self._id_C8F2))
  self._id_C8F2 _id_E0DD(self);

  self._id_C8F2 = var_0;
  self._id_C8F2 _id_17BC(self);

  if (isdefined(self._id_0244))
  _id_F801(self._id_0244, self._id_DF31, self._id_13E19, self._id_13E5A);
  else
  _id_F801("TOPLEFT");
}

_id_8045() {
  return self._id_C8F2;
}

_id_E0EB() {
  if (isdefined(self._id_3E66) && self._id_3E66 == gettime())
  return;

  self._id_3E66 = gettime();
  var_0 = [];

  foreach (var_3, var_2 in self._id_3E67) {
  if (!isdefined(var_2))
  continue;

  var_2.index = var_0.size;
  var_0[var_0.size] = var_2;
  }

  self._id_3E67 = var_0;
}

_id_17BC(var_0) {
  var_0.index = self._id_3E67.size;
  self._id_3E67[self._id_3E67.size] = var_0;
  _id_E0EB();
}

_id_E0DD(var_0) {
  var_0._id_C8F2 = undefined;

  if (self._id_3E67[self._id_3E67.size - 1] != var_0) {
  self._id_3E67[var_0.index] = self._id_3E67[self._id_3E67.size - 1];
  self._id_3E67[var_0.index].index = var_0.index;
  }

  self._id_3E67[self._id_3E67.size - 1] = undefined;
  var_0.index = undefined;
}

_id_F801(var_0, var_1, var_2, var_3, var_4) {
  if (!isdefined(var_4))
  var_4 = 0;

  var_5 = _id_8045();

  if (var_4)
  self _meth_820C(var_4);

  if (!isdefined(var_2))
  var_2 = 0;

  self._id_13E19 = var_2;

  if (!isdefined(var_3))
  var_3 = 0;

  self._id_13E5A = var_3;
  self._id_0244 = var_0;
  self._id_002B = "center";
  self._id_002C = "middle";

  if (issubstr(var_0, "TOP"))
  self._id_002C = "top";

  if (issubstr(var_0, "BOTTOM"))
  self._id_002C = "bottom";

  if (issubstr(var_0, "LEFT"))
  self._id_002B = "left";

  if (issubstr(var_0, "RIGHT"))
  self._id_002B = "right";

  if (!isdefined(var_1))
  var_1 = var_0;

  self._id_DF31 = var_1;
  var_6 = "center";
  var_7 = "middle";

  if (issubstr(var_1, "TOP"))
  var_7 = "top";

  if (issubstr(var_1, "BOTTOM"))
  var_7 = "bottom";

  if (issubstr(var_1, "LEFT"))
  var_6 = "left";

  if (issubstr(var_1, "RIGHT"))
  var_6 = "right";

  if (var_5 == level._id_12B29) {
  self._id_017D = var_6;
  self._id_0382 = var_7;
  } else {
  self._id_017D = var_5._id_017D;
  self._id_0382 = var_5._id_0382;
  }

  if (var_6 == var_5._id_002B) {
  var_8 = 0;
  var_9 = 0;
  }
  else if (var_6 == "center" || var_5._id_002B == "center") {
  var_8 = int(var_5._id_039F / 2);

  if (var_6 == "left" || var_5._id_002B == "right")
  var_9 = -1;
  else
  var_9 = 1;
  } else {
  var_8 = var_5._id_039F;

  if (var_6 == "left")
  var_9 = -1;
  else
  var_9 = 1;
  }

  self.x = var_5.x + var_8 * var_9;

  if (var_7 == var_5._id_002C) {
  var_10 = 0;
  var_11 = 0;
  }
  else if (var_7 == "middle" || var_5._id_002C == "middle") {
  var_10 = int(var_5.height / 2);

  if (var_7 == "top" || var_5._id_002C == "bottom")
  var_11 = -1;
  else
  var_11 = 1;
  } else {
  var_10 = var_5.height;

  if (var_7 == "top")
  var_11 = -1;
  else
  var_11 = 1;
  }

  self.y = var_5.y + var_10 * var_11;
  self.x = self.x + self._id_13E19;
  self.y = self.y + self._id_13E5A;

  switch (self._id_601F) {
  case "bar":
  _id_F802(var_0, var_1, var_2, var_3);
  break;
  }

  _id_12E74(var_4);
}

_id_F802(var_0, var_1, var_2, var_3) {
  self._id_2812._id_017D = self._id_017D;
  self._id_2812._id_0382 = self._id_0382;
  self._id_2812._id_002B = "left";
  self._id_2812._id_002C = self._id_002C;
  self._id_2812.y = self.y;

  if (self._id_002B == "left")
  self._id_2812.x = self.x + self._id_13E1E;
  else if (self._id_002B == "right")
  self._id_2812.x = self.x - (self._id_039F - self._id_13E1E);
  else
  self._id_2812.x = self.x - int((self._id_039F - self._id_13E1E * 2) / 2);

  _id_12E63(self._id_2812._id_7349);
}

_id_12E63(var_0) {
  var_1 = int((self._id_039F - self._id_13E1E * 2) * var_0);

  if (!var_1)
  var_1 = 1;

  self._id_2812._id_7349 = var_0;
  self._id_2812 setshader(self._id_2812._id_FC44, var_1, self.height - self._id_13E5D * 2);
}

_id_8EB9(var_0) {
  var_0 = scripts\engine\utility::ter_op(isdefined(var_0), var_0, 1);

  if (var_0 || !isdefined(self._id_C708) || !isdefined(self._id_2812._id_C708)) {
  self._id_C708 = self.alpha;
  self._id_2812._id_C708 = self._id_2812.alpha;
  }

  self.alpha = scripts\engine\utility::ter_op(var_0, 0, self._id_C708);
  self._id_2812.alpha = scripts\engine\utility::ter_op(var_0, 0, self._id_2812._id_C708);
}

_id_49B2(var_0, var_1) {
  var_2 = newhudelem();
  var_2._id_601F = "font";
  var_2._id_013A = var_0;
  var_2._id_013B = var_1;
  var_2.x = 0;
  var_2.y = 0;
  var_2._id_039F = 0;
  var_2.height = int(level._id_724F * var_1);
  var_2._id_13E19 = 0;
  var_2._id_13E5A = 0;
  var_2._id_3E67 = [];
  var_2 _id_F7D6(level._id_12B29);
  return var_2;
}

_id_4999(var_0, var_1) {
  var_2 = newclienthudelem(self);
  var_2._id_601F = "font";
  var_2._id_013A = var_0;
  var_2._id_013B = var_1;
  var_2.x = 0;
  var_2.y = 0;
  var_2._id_039F = 0;
  var_2.height = int(level._id_724F * var_1);
  var_2._id_13E19 = 0;
  var_2._id_13E5A = 0;
  var_2._id_3E67 = [];
  var_2 _id_F7D6(level._id_12B29);
  return var_2;
}

_id_499D(var_0, var_1) {
  var_2 = newclienthudelem(self);
  var_2._id_601F = "timer";
  var_2._id_013A = var_0;
  var_2._id_013B = var_1;
  var_2.x = 0;
  var_2.y = 0;
  var_2._id_039F = 0;
  var_2.height = int(level._id_724F * var_1);
  var_2._id_13E19 = 0;
  var_2._id_13E5A = 0;
  var_2._id_3E67 = [];
  var_2 _id_F7D6(level._id_12B29);
  return var_2;
}

_id_4A15(var_0, var_1) {
  var_2 = newhudelem();
  var_2._id_601F = "font";
  var_2._id_013A = var_0;
  var_2._id_013B = var_1;
  var_2.x = 0;
  var_2.y = 0;
  var_2._id_039F = 0;
  var_2.height = int(level._id_724F * var_1);
  var_2._id_13E19 = 0;
  var_2._id_13E5A = 0;
  var_2._id_3E67 = [];
  var_2 _id_F7D6(level._id_12B29);
  return var_2;
}

_id_4A17(var_0, var_1) {
  var_2 = newhudelem();
  var_2._id_601F = "timer";
  var_2._id_013A = var_0;
  var_2._id_013B = var_1;
  var_2.x = 0;
  var_2.y = 0;
  var_2._id_039F = 0;
  var_2.height = int(level._id_724F * var_1);
  var_2._id_13E19 = 0;
  var_2._id_13E5A = 0;
  var_2._id_3E67 = [];
  var_2 _id_F7D6(level._id_12B29);
  return var_2;
}

_id_49D9(var_0, var_1, var_2) {
  var_3 = newhudelem();
  return _id_49DA(var_3, var_0, var_1, var_2);
}

_id_499B(var_0, var_1, var_2) {
  var_3 = newclienthudelem(self);
  return _id_49DA(var_3, var_0, var_1, var_2);
}

_id_49DA(var_0, var_1, var_2, var_3) {
  var_0._id_601F = "icon";
  var_0.x = 0;
  var_0.y = 0;
  var_0._id_039F = var_2;
  var_0.height = var_3;
  var_0._id_13E19 = 0;
  var_0._id_13E5A = 0;
  var_0._id_3E67 = [];
  var_0 _id_F7D6(level._id_12B29);

  if (isdefined(var_1))
  var_0 setshader(var_1, var_2, var_3);

  return var_0;
}

_id_4987(var_0, var_1, var_2, var_3, var_4) {
  if (!isdefined(var_0))
  var_0 = "white";

  if (!isdefined(var_1))
  var_1 = "black";

  if (!isdefined(var_2))
  var_2 = 100;

  if (!isdefined(var_3))
  var_3 = 9;

  var_5 = newhudelem();
  var_5.x = 2;
  var_5.y = 2;
  var_5._id_7349 = 0.25;
  var_5._id_FC44 = var_0;
  var_5._id_02A4 = -1;
  var_5 setshader(var_0, var_2 - 2, var_3 - 2);

  if (isdefined(var_4)) {
  var_5._id_6ECC = var_4;
  var_5 thread _id_6EDE();
  }

  var_6 = newhudelem();
  var_6._id_601F = "bar";
  var_6.x = 0;
  var_6.y = 0;
  var_6._id_039F = var_2;
  var_6.height = var_3;
  var_6._id_13E19 = 0;
  var_6._id_13E5A = 0;
  var_6._id_2812 = var_5;
  var_6._id_3E67 = [];
  var_6._id_C85E = 2;
  var_6._id_02A4 = -2;
  var_6.alpha = 0.5;
  var_6 _id_F7D6(level._id_12B29);
  var_6 setshader(var_1, var_2, var_3);
  return var_6;
}

_id_499C(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7) {
  var_0 = scripts\engine\utility::ter_op(isdefined(var_0), var_0, level.player);
  var_1 = scripts\engine\utility::ter_op(isdefined(var_1), var_1, 90);
  var_2 = scripts\engine\utility::ter_op(isdefined(var_2), var_2, "white");
  var_3 = scripts\engine\utility::ter_op(isdefined(var_3), var_3, "black");
  var_4 = scripts\engine\utility::ter_op(isdefined(var_4), var_4, 100);
  var_5 = scripts\engine\utility::ter_op(isdefined(var_5), var_5, 9);
  var_6 = scripts\engine\utility::ter_op(isdefined(var_6), var_6, 2);
  var_7 = scripts\engine\utility::ter_op(isdefined(var_7), var_7, 2);
  var_8 = var_0 _id_4997(var_2, var_3, var_4, var_5, undefined, var_6, var_7);
  var_8 _id_F801("CENTER", undefined, 0, var_1);
  return var_8;
}

_id_4997(var_0, var_1, var_2, var_3, var_4, var_5, var_6) {
  if (!isdefined(var_5))
  var_5 = 2;

  if (!isdefined(var_6))
  var_6 = 2;

  var_7 = newclienthudelem(self);
  var_7.x = 0 - var_5;
  var_7.y = 0 - var_6;
  var_7._id_7349 = 0.25;
  var_7._id_FC44 = var_0;
  var_7._id_02A4 = -1;
  var_7 setshader(var_0, var_2 - var_5 * 2, var_3 - var_6 * 2);

  if (isdefined(var_4)) {
  var_7._id_6ECC = var_4;
  var_7 thread _id_6EDE();
  }

  var_8 = newclienthudelem(self);
  var_8._id_601F = "bar";
  var_8.x = 0;
  var_8.y = 0;
  var_8._id_039F = var_2;
  var_8.height = var_3;
  var_8._id_13E19 = -1 * var_5;
  var_8._id_13E5A = 0;
  var_8._id_2812 = var_7;
  var_8._id_3E67 = [];
  var_8._id_13E1E = var_5;
  var_8._id_13E5D = var_6;
  var_8._id_02A4 = -2;
  var_8.alpha = 0.5;
  var_8 _id_F7D6(level._id_12B29);
  var_8 setshader(var_1, var_2, var_3);
  return var_8;
}

_id_F710(var_0) {
  self._id_2812._id_6ECC = var_0;
}

_id_6AAB(var_0, var_1) {
  if (isdefined(var_1) && var_1 > 0)
  self fadeovertime(var_1);

  self.alpha = var_0;

  if (isdefined(var_1) && var_1 > 0)
  wait(var_1);
}

_id_6EDE() {
  self endon("death");
  self.alpha = 1;

  for (;;) {
  if (self._id_7349 >= self._id_6ECC) {
  self fadeovertime(0.3);
  self.alpha = 0.2;
  wait 0.35;
  self fadeovertime(0.3);
  self.alpha = 1;
  wait 0.7;
  continue;
  }

  self.alpha = 1;
  wait 0.05;
  }
}

_id_52DC() {
  if (isdefined(self._id_3E67) && self._id_3E67.size) {
  var_0 = [];

  for (var_1 = 0; var_1 < self._id_3E67.size; var_1++)
  var_0[var_1] = self._id_3E67[var_1];

  for (var_1 = 0; var_1 < var_0.size; var_1++)
  var_0[var_1] _id_F7D6(_id_8045());
  }

  if (isdefined(self._id_601F) && self._id_601F == "bar")
  self._id_2812 destroy();

  self destroy();
}

_id_F74C(var_0) {
  self setshader(var_0, self._id_039F, self.height);
}

_id_FB1F(var_0) {
  self._id_039F = var_0;
}

_id_F743(var_0) {
  self.height = var_0;
}

_id_F847(var_0, var_1) {
  self._id_039F = var_0;
  self.height = var_1;
}

_id_12E74(var_0) {
  for (var_1 = 0; var_1 < self._id_3E67.size; var_1++) {
  var_2 = self._id_3E67[var_1];
  var_2 _id_F801(var_2._id_0244, var_2._id_DF31, var_2._id_13E19, var_2._id_13E5A, var_0);
  }
}

_id_10B56(var_0) {
  if (isdefined(var_0) && var_0 == 0) {
  _id_10B55();
  return;
  }

  if (isdefined(level._id_10B54))
  level._id_10B54 destroy();

  _func_1C5("hud_showStance", "0");
  level._id_10B54 = newhudelem();
  level._id_10B54.x = -75;

  if (level._id_4542)
  level._id_10B54.y = -20;
  else
  level._id_10B54.y = -10;

  level._id_10B54 setshader("stance_carry", 64, 64);
  level._id_10B54._id_002B = "right";
  level._id_10B54._id_002C = "bottom";
  level._id_10B54._id_017D = "right";
  level._id_10B54._id_0382 = "bottom";
  level._id_10B54._id_0142 = 1;
  level._id_10B54.alpha = 0;
  level._id_10B54 fadeovertime(0.5);
  level._id_10B54.alpha = 1;
}

_id_10B55() {
  if (isdefined(level._id_10B54)) {
  level._id_10B54 fadeovertime(0.5);
  level._id_10B54.alpha = 0;
  level._id_10B54 destroy();
  }

  _func_1C5("hud_showStance", "1");
}

_id_491A() {
  if (level._id_4542) {
  var_0 = _id_49B2("default", 1.8);
  var_0 _id_F801("CENTER", undefined, -23, 115);
  var_0 _meth_834D(level._id_1114E["mantle"]);
  var_1 = _id_49D9("hint_mantle", 40, 40);
  var_1 _id_F801("CENTER", undefined, 73, 0);
  var_1 _id_F7D6(var_0);
  } else {
  var_0 = _id_49B2("default", 1.6);
  var_0 _id_F801("CENTER", undefined, 0, 115);
  var_0 _meth_834D(level._id_1114E["mantle"]);
  var_1 = _id_49D9("hint_mantle", 40, 40);
  var_1 _id_F801("CENTER", undefined, 0, 30);
  var_1 _id_F7D6(var_0);
  }

  var_1.alpha = 0;
  var_0.alpha = 0;
  level._id_9153 = [];
  level._id_9153["text"] = var_0;
  level._id_9153["icon"] = var_1;
}

_id_78E6(var_0, var_1, var_2, var_3) {
  if (!isdefined(var_3))
  var_3 = 0;

  var_4 = undefined;

  if (!level._id_4542)
  var_4 = -250;
  else if (!isdefined(var_0))
  var_4 = -225;
  else
  var_4 = var_0;

  if (var_3)
  var_4 = var_0;

  if (!isdefined(var_1))
  var_5 = 100;
  else
  var_5 = var_1;

  if (isdefined(var_2))
  var_6 = newclienthudelem(var_2);
  else
  var_6 = newhudelem();

  var_6._id_002B = "left";
  var_6._id_002C = "middle";
  var_6._id_017D = "right";
  var_6._id_0382 = "top";
  var_6.x = var_4;
  var_6.y = var_5;
  var_6._id_013B = 1.6;
  var_6._id_00B9 = (0.8, 1, 0.8);
  var_6._id_013A = "objective";
  var_6._id_0154 = (0.3, 0.6, 0.3);
  var_6._id_0153 = 1;
  var_6._id_0142 = 1;
  var_6._id_0177 = 1;
  var_6._id_0175 = 1;
  return var_6;
}

_id_7956(var_0, var_1, var_2, var_3) {
  if (!isdefined(var_3))
  var_3 = 0;

  var_4 = undefined;

  if (!level._id_4542)
  var_4 = -250;
  else if (!isdefined(var_0))
  var_4 = -170;
  else
  var_4 = var_0;

  if (var_3)
  var_4 = var_0;

  if (!isdefined(var_1))
  var_5 = 100;
  else
  var_5 = var_1;

  if (isdefined(var_2))
  var_6 = newclienthudelem(var_2);
  else
  var_6 = newhudelem();

  var_6._id_002B = "right";
  var_6._id_002C = "middle";
  var_6._id_017D = "right";
  var_6._id_0382 = "top";
  var_6.x = var_4;
  var_6.y = var_5;
  var_6._id_013B = 1.6;
  var_6._id_00B9 = (0.8, 1, 0.8);
  var_6._id_013A = "objective";
  var_6._id_0154 = (0.3, 0.6, 0.3);
  var_6._id_0153 = 1;
  var_6._id_0142 = 1;
  var_6._id_0177 = 1;
  var_6._id_0175 = 1;
  return var_6;
}

_id_48B7(var_0, var_1, var_2) {
  if (isdefined(var_2))
  var_3 = newclienthudelem(var_2);
  else
  var_3 = newhudelem();

  var_3.x = 0;
  var_3.y = 0;
  var_3 setshader(var_0, 640, 480);
  var_3._id_002B = "left";
  var_3._id_002C = "top";
  var_3._id_02A4 = 1;
  var_3._id_017D = "fullscreen";
  var_3._id_0382 = "fullscreen";
  var_3.alpha = var_1;
  var_3._id_0142 = 1;
  return var_3;
}

_id_48B8(var_0, var_1, var_2, var_3, var_4) {
  var_5 = _id_0B91::_id_7B92();
  var_6 = newclienthudelem(var_5);

  if (!isdefined(var_4))
  var_4 = 1;

  if (!isdefined(var_2))
  var_2 = 0;

  if (!isdefined(var_3))
  var_3 = 0;

  var_6.x = var_2;
  var_6.y = var_3;
  var_6 setshader(var_0, int(640 * var_4), int(480 * var_4));
  var_6._id_002B = "center";
  var_6._id_002C = "middle";
  var_6._id_02A4 = 1;
  var_6._id_017D = "center";
  var_6._id_0382 = "middle";
  var_6.alpha = var_1;
  var_6._id_0142 = 1;
  return var_6;
}

_id_48B9(var_0, var_1, var_2, var_3, var_4) {
  var_5 = _id_0B91::_id_7B92();
  var_6 = newclienthudelem(var_5);

  if (!isdefined(var_4))
  var_4 = 1;

  var_6.x = var_2;
  var_6.y = var_3;
  var_6 setshader(var_0, int(640 * var_4), int(480 * var_4));
  var_6._id_002B = "center";
  var_6._id_002C = "middle";
  var_6._id_02A4 = 1;
  var_6._id_017D = "fullscreen";
  var_6._id_0382 = "fullscreen";
  var_6.alpha = var_1;
  var_6._id_0142 = 1;
  return var_6;
}

_id_6A99(var_0, var_1) {
  if (level._id_B8D0)
  return;

  if (!isdefined(var_0))
  var_0 = 0.3;

  var_2 = _id_7B4F(var_1);
  var_2 fadeovertime(var_0);
  var_2.alpha = 0;
  wait(var_0);
}

_id_7B4F(var_0) {
  if (!isdefined(var_0))
  var_0 = "black";

  return _id_7B5D(var_0);
}

_id_6AA3(var_0, var_1) {
  if (!isdefined(var_0))
  var_0 = 0.3;

  var_2 = _id_7B4F(var_1);

  if (var_0 > 0)
  var_2 fadeovertime(var_0);

  var_2.alpha = 1;
  wait(var_0);
}

_id_10CCC(var_0) {
  var_1 = _id_7B4F(var_0);
  var_1.alpha = 1;
}

_id_7B5D(var_0) {
  if (isplayer(self))
  var_1 = self;
  else
  var_1 = level.player;

  if (!isdefined(var_1._id_C7FD))
  var_1._id_C7FD = [];

  if (!isdefined(var_1._id_C7FD[var_0]))
  var_1._id_C7FD[var_0] = _id_48B7(var_0, 0, var_1);

  var_1._id_C7FD[var_0]._id_02A4 = 0;
  var_1._id_C7FD[var_0]._id_0142 = 1;
  return var_1._id_C7FD[var_0];
}
