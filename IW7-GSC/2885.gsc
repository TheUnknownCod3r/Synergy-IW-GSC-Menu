/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2885.gsc
***************************************/

_id_9631() {
  scripts\engine\utility::_id_6E39("introscreen_complete");
}

main() {
  precacheshader("black");
  precacheshader("chyron_border_left");
  precacheshader("chyron_border_right");
  thread _id_B23E();
}

_id_B23E() {
  scripts\engine\utility::_id_6E4C("start_is_set");
  var_0 = 0;

  if (!isdefined(level._id_9AF3) || !_id_0B91::_id_9BB5() || var_0)
  scripts\engine\utility::delaythread(0.05, scripts\engine\utility::_id_6E3E, "introscreen_complete");
  else
  {
  if (isdefined(level._id_9AF3._id_4C88)) {
  [[level._id_9AF3._id_4C88]]();
  return;
  }

  _id_9AF3();
  }
}

_id_9AF7() {
  if (!isdefined(level._id_9AF3))
  return 0;

  var_0 = level._id_9AF3._id_ACF2;
  var_1 = getarraykeys(var_0);

  for (var_2 = 0; var_2 < var_1.size; var_2++) {
  var_3 = var_1[var_2];
  var_4 = 1;
  var_5 = var_2 * var_4 + 1;
  scripts\engine\utility::delaythread(var_5, ::_id_9AF5, var_0[var_3], var_0.size - var_2 - 1, var_4, var_3);
  }

  return 1;
}

_id_9AF8(var_0, var_1, var_2) {
  _id_9AF9("black", var_0, var_1, var_2);
}

_id_9AF9(var_0, var_1, var_2, var_3) {
  if (!isdefined(var_2))
  var_2 = 1.5;

  if (!isdefined(var_3))
  _id_0B3F::_id_10CCC();
  else
  _id_0B3F::_id_6AA3(var_3);

  wait(var_1);
  _id_0B3F::_id_6A99(var_2);
  wait(var_2);
  _func_1C5("com_cinematicEndInWhite", 0);
}

_id_9AF5(var_0, var_1, var_2, var_3) {
  level notify("new_introscreen_element");

  if (!isdefined(level._id_9ACA))
  level._id_9ACA = 0;
  else
  level._id_9ACA++;

  var_4 = _id_4666();
  var_5 = newhudelem();
  var_5.x = 20;
  var_5.y = var_4;
  var_5._id_002B = "left";
  var_5._id_002C = "bottom";
  var_5._id_017D = "left";
  var_5._id_0382 = "bottom";
  var_5._id_02A4 = 1;
  var_5._id_0142 = 1;
  var_5 _meth_834D(var_0);
  var_5.alpha = 0;
  var_5 fadeovertime(0.2);
  var_5.alpha = 1;
  var_5._id_0177 = 1;
  var_5._id_013B = 2.0;
  var_5._id_00B9 = (0.8, 1, 0.8);
  var_5._id_013A = "default";
  var_5._id_0154 = (0.3, 0.6, 0.3);
  var_5._id_0153 = 1;
  var_6 = int(var_1 * var_2 * 1000 + 4000);
  var_5 _meth_832C(30, var_6, 700);
  thread _id_917C(var_5);
}

_id_4666() {
  return level._id_9ACA * 20 - 82;
}

_id_917C(var_0) {
  wait 16;
  var_0 notify("destroying");
  level._id_9AC9 = undefined;
  var_1 = 0.5;
  var_0 fadeovertime(var_1);
  var_0.alpha = 0;
  wait(var_1);
  var_0 notify("destroy");
  var_0 destroy();
}

_id_C3C4() {
  level.player _meth_80F9(1);
  thread _id_9AF8(level._id_9AF3._id_4480, level._id_9AF3._id_6AAA, level._id_9AF3._id_6A9F);

  if (!_id_9AF7())
  wait 0.05;

  wait(level._id_9AF3._id_4480);
  scripts\engine\utility::_id_6E3E("introscreen_complete");
  level.player _meth_80F9(0);
}

_id_9AF3(var_0, var_1) {
  if (!isdefined(var_0)) {
  var_0 = 0;
  var_2 = 1;
  }

  if (isdefined(var_1)) {
  var_0 = 1;
  _id_0B3F::_id_10CCC();
  level.player _meth_80F9(1);
  level.player scripts\engine\utility::_id_50E1(var_1, ::_meth_80F9, 0);
  scripts\engine\utility::delaythread(var_1, _id_0B3F::_id_6A99, 2);
  }

  level._id_3F69 = spawnstruct();
  level._id_3F69._id_91AF = [];
  level._id_3F69._id_11151 = [];
  level._id_3F69._id_A917 = [];
  level._id_3F69._id_22FD = [];
  level._id_3F69._id_11761 = 20;
  level._id_3F69._id_11762 = -82;
  level._id_3F69._id_1175D = 0;
  level._id_3F69._id_11152 = 0;
  level._id_3F69._id_10466 = spawn("script_origin", level.player.origin);
  level._id_3F69._id_10466 linkto(level.player);
  level._id_3F69._id_BFE0 = var_0;

  if (!var_0) {
  level.player _meth_80F9(1);
  _id_0B3F::_id_10CCC();
  thread _id_22FD(0);
  }

  _id_3F6A(0, "ui_chyron_on");
  thread _id_11151(0);
  var_3 = 0.4;
  thread _id_DB9A(0, var_3);
  wait(var_3);
  _id_119A5(level._id_9AF3._id_ACF2[0]);
  _id_3F6A(0, "ui_chyron_firstline");
  _id_111A1(level._id_9AF3._id_ACF2[1], 0);
  wait 2;
  var_4 = _id_111A1(level._id_9AF3._id_ACF2[2], 1, "default", 1, 1);
  var_4._id_00B9 = (0.68, 0.744, 0.736);
  var_5 = undefined;

  if (isdefined(level._id_9AF3._id_ACF2[3])) {
  var_5 = _id_111A1(level._id_9AF3._id_ACF2[3], 2, "default", 1, 1);
  var_5._id_00B9 = (0.68, 0.744, 0.736);
  level._id_3F69._id_91AF = scripts\engine\utility::array_remove(level._id_3F69._id_91AF, var_5);
  }

  wait 1;
  level._id_3F69._id_11152 = 1;
  wait 2;
  level._id_3F69._id_11152 = 0;

  if (isdefined(var_5))
  var_5 thread _id_BE48();

  wait 1;
  _id_6BAF(0, var_0);

  if (!var_0) {
  _id_3F6A(0, "ui_chyron_off");
  thread _id_0B3F::_id_6A99(2);
  level.player _meth_80F9(0);
  }

  scripts\engine\utility::_id_6E3E("introscreen_complete");
  level notify("stop_chyron");
  level._id_3F69._id_10466 delete();
  level._id_3F69 = undefined;
}

_id_BE48() {
  var_0 = self._id_00B9;
  var_1 = self.alpha;
  self notify("stop_quick_pulse");
  var_2 = 2;
  self._id_0153 = 1;
  self._id_0154 = (1, 1, 1);
  thread _id_6A98((0.10625, 0.11625, 0.115), 0.1, var_2);
  self._id_00B9 = (1, 1, 1);
  self.alpha = 1;
  self fadeovertime(var_2);
  self._id_00B9 = var_0;
  self.alpha = 0.8;
  var_2 = 4;
  self _meth_820C(var_2 * 3);
  self _meth_8067(var_2 * 1.5);
  self.x = self.x + randomintrange(5, 10);
  self.y = self.y - randomintrange(3, 12);
  self._id_013B = self._id_013B * randomfloatrange(1.2, 1.3);
  wait(var_2);
  self fadeovertime(2);
  self.alpha = 0;
  wait 2;
  self destroy();
}

_id_6A98(var_0, var_1, var_2) {
  self endon("death");
  var_3 = var_2 * 20;
  var_4 = (var_0 - self._id_0154) / var_3;
  var_5 = (var_1 - self._id_0153) / var_3;

  for (var_6 = 0; var_6 < var_3; var_6++) {
  self._id_0154 = self._id_0154 + var_4;
  self._id_0153 = self._id_0153 + var_5;
  wait 0.05;
  }

  self._id_0154 = var_0;
  self._id_0153 = var_1;
}

_id_3F6A(var_0, var_1) {
  if (var_0 == 0)
  level._id_3F69._id_10466 playsound(var_1);
  else
  level._id_7661._id_10466 playsound(var_1);
}

_id_913E(var_0) {
  self endon("death");
  self fadeovertime(var_0);
  self.alpha = 0;
  wait(var_0);
  self destroy();
}

_id_DB9A(var_0, var_1) {
  wait 0.5;
  var_2 = newhudelem();

  if (var_0 == 0) {
  var_2.x = level._id_3F69._id_11761 - 5;
  var_2.y = level._id_3F69._id_11762;
  var_2._id_0382 = "bottom";
  } else {
  var_2.x = level._id_7661._id_11761 - 5;
  var_2.y = level._id_7661._id_11762;
  var_2._id_0382 = "top";
  }

  var_2._id_013B = 3;
  var_2._id_017D = "left";
  var_2._id_02A4 = 1;
  var_2._id_0142 = 1;
  var_2._id_0177 = 1;
  var_2.alpha = 0.8;
  var_2 setshader("white", 1, 35);
  var_2._id_00B9 = (0.85, 0.93, 0.92);
  var_2 _meth_820C(var_1);
  var_2 fadeovertime(var_1 * 0.5);
  var_2.alpha = 0;
  var_2.x = var_2.x + 300;
  wait 0.4;
  var_2 destroy();
}

_id_22FD(var_0) {
  if (var_0 == 0)
  level endon("chyron_faze_out_text_intro");
  else
  level endon("chyron_faze_out_text_gamenotify");

  var_1 = [".", "-", "_", "|", "+"];
  var_2 = 0.7;

  for (var_3 = 0; var_3 < var_1.size; var_3++) {
  var_4 = _id_48B3("");
  var_4._id_013B = var_2;
  var_4.alpha = 0;
  var_4._id_02A4 = 2;
  var_4._id_00B9 = (0.75, 0.83, 0.89);
  var_4._id_DAE6 = 0;
  level._id_3F69._id_22FD[level._id_3F69._id_22FD.size] = var_4;
  }

  level._id_3F69._id_22FE = 0;
  thread _id_22FC(var_0);
  var_5 = 0;
  var_6 = level._id_3F69._id_11762 - 10;

  for (;;) {
  var_7 = 0;
  var_1 = scripts\engine\utility::_id_22A7(var_1);

  foreach (var_4 in level._id_3F69._id_22FD) {
  _id_3F6A(var_0, "ui_chyron_plusminus");
  var_4._id_013B = var_2;

  if (var_1[var_7] == "+")
  var_4._id_013B = 0.55;

  var_4 _meth_834D(var_1[var_7]);
  var_4.x = var_5 + randomint(200);
  var_4.y = var_6 + randomint(60);
  var_4._id_DAE6 = 1;
  var_7++;
  wait(randomfloatrange(0.05, 0.1));
  }

  wait(randomfloatrange(4, 7));
  level._id_3F69._id_22FE = 1;
  level waittill("chyron_artifact_faded");
  }
}

_id_22FC(var_0) {
  if (var_0 == 0)
  level endon("chyron_faze_out_text_intro");
  else
  level endon("chyron_faze_out_text_gamenotify");

  var_1 = 0.6;
  var_2 = 1;

  for (;;) {
  if (level._id_3F69._id_22FE)
  var_1 = var_1 - 0.07;
  else
  {
  if (var_1 < 0.15 || var_1 > 0.6)
  var_2 = var_2 * -1;

  var_1 = var_1 + (0.02 + randomfloat(0.04)) * var_2;
  }

  var_1 = max(var_1, 0);

  foreach (var_4 in level._id_3F69._id_22FD) {
  if (var_4._id_DAE6) {
  if (var_1 == 0) {
  var_4.alpha = 0;
  continue;
  }

  var_4.alpha = randomfloatrange(var_1 * 0.6, var_1);
  }
  }

  if (var_1 == 0) {
  level notify("chyron_artifact_faded");
  var_1 = 0.8;
  level._id_3F69._id_22FE = 0;

  foreach (var_4 in level._id_3F69._id_22FD)
  var_4._id_DAE6 = 0;
  }

  wait 0.05;
  }
}

_id_11151(var_0) {
  if (var_0 == 0)
  level endon("chyron_faze_out_text_intro");
  else
  level endon("chyron_faze_out_text_gamenotify");

  var_1 = 5;
  var_2 = 0;
  var_3 = 1;

  for (;;) {
  if (var_0 == 0 && level._id_3F69._id_11152 || var_0 == 1 && level._id_7661._id_11152) {
  wait 0.05;
  continue;
  }

  var_2++;
  var_4 = int(min(var_2, var_1));

  for (var_5 = 0; var_5 < var_4; var_5++) {
  thread _id_495C(var_0);
  wait(randomfloatrange(0, 0.1));
  }

  if (var_0 == 0 && level._id_3F69._id_1175D || var_0 == 1 && level._id_7661._id_1175D) {
  wait 0.05;
  continue;
  }

  wait(randomfloatrange(var_3 * 0.5, var_3));
  var_3 = var_3 - 0.05;
  var_3 = max(var_3, 0.2);
  }
}

_id_119A5(var_0, var_1) {
  var_2 = _id_48B3(var_0);
  level._id_3F69._id_1175E = var_2.x;
  level._id_3F69._id_1175F = var_2.y;
  level._id_3F69._id_1175D = 1;
  wait 0.5;
  level._id_3F69._id_1175D = 0;
  var_3 = _id_5F31(var_2, 1);
  var_4 = 4;
  var_3[0] thread _id_AEC8(var_4);
  var_2.y = var_2.y - 10;
  var_2._id_0153 = 0.05;
  var_2._id_0154 = (0.425, 0.465, 0.46) * _id_83E5();
  var_5 = 0.3;
  var_2 _meth_820C(var_5);
  var_2 fadeovertime(var_5 * 3);
  var_2.y = var_2.y + 10;
  var_6 = 0.5;
  var_6 = var_6 - var_5;
  wait(var_5);
  var_2 thread _id_DB9D(0);
  wait(var_6);

  if (randomint(100) > 10)
  var_2 thread _id_C369(-30, 30, 20, -8, 8, 4);
}

_id_C369(var_0, var_1, var_2, var_3, var_4, var_5) {
  var_6 = randomintrange(1, 2);

  for (var_7 = 0; var_7 < var_6; var_7++) {
  var_8 = _id_DCB1(var_0, var_1, var_2);
  var_9 = _id_DCB1(var_3, var_4, var_5);
  var_10[0] = [var_8, var_9];
  var_10[1] = [var_8 - 10, var_9];
  thread _id_915B(var_10);
  wait(randomfloatrange(0.5, 1));
  }
}

_id_6BAF(var_0, var_1) {
  var_2 = undefined;

  if (!var_1) {
  var_2 = newhudelem();

  if (var_0 == 0) {
  var_2.x = level._id_3F69._id_11761 + 60;
  var_2.y = level._id_3F69._id_11762 + 30;
  var_2._id_0382 = "bottom";
  } else {
  var_2.x = level._id_7661._id_11761 + 60;
  var_2.y = level._id_7661._id_11762 + 10;
  var_2._id_0382 = "top";
  }

  var_2._id_002B = "center";
  var_2._id_002C = "middle";
  var_2._id_017D = "left";
  var_2._id_02A4 = 1;
  var_2._id_0142 = 1;
  var_2._id_0177 = 1;
  var_2.alpha = 0;
  var_2 setshader("white", 1, 60);
  var_2._id_00B9 = (0.85, 0.93, 0.92);
  var_2 fadeovertime(0.25);
  var_2.alpha = 0.1;
  var_2 _meth_8276(0.1, 2000, 60);
  wait 0.1;
  }

  var_3 = 0.15;
  _id_6AA9(var_0, var_3 * 0.4);

  if (!var_1) {
  var_2 fadeovertime(0.25);
  var_2.alpha = 0.2;
  var_2._id_00B9 = (1, 1, 1);
  var_2 _meth_8276(var_3, 2000, 2);
  wait(var_3);
  var_3 = 0.15;
  var_2 _meth_8276(var_3, 2, 2);
  var_2 thread _id_6BB0(var_3);
  }
}

_id_6BB0(var_0) {
  self fadeovertime(var_0);
  self.alpha = 0;
  wait(var_0);
  self destroy();
}

_id_6AA9(var_0, var_1) {
  if (var_0 == 0) {
  level notify("chyron_faze_out_text_intro");

  foreach (var_3 in level._id_3F69._id_91AF) {
  if (!isdefined(var_3))
  continue;

  var_3 thread _id_913E(var_1);
  }

  foreach (var_3 in level._id_3F69._id_11151)
  var_3 thread _id_913E(var_1);
  } else {
  level notify("chyron_faze_out_text_gamenotify");

  foreach (var_3 in level._id_7661._id_91AF) {
  if (!isdefined(var_3))
  continue;

  var_3 thread _id_913E(var_1);
  }

  foreach (var_3 in level._id_7661._id_11151)
  var_3 thread _id_913E(var_1);
  }
}

_id_111A1(var_0, var_1, var_2, var_3, var_4) {
  var_5 = _id_48B3(var_0);
  var_5.y = var_5.y + (20 + var_1 * 15);

  if (isdefined(var_2))
  var_5._id_013A = var_2;

  var_5._id_013B = 1;

  if (isdefined(var_3))
  var_5._id_013B = var_3;

  level._id_3F69._id_1175E = var_5.x;
  level._id_3F69._id_1175F = var_5.y;
  level._id_3F69._id_1175D = 1;
  wait 0.5;
  var_5._id_0153 = 0.05;
  var_5._id_0154 = (0.425, 0.465, 0.46) * _id_83E5();
  var_5 thread _id_DB9D(0, var_4);
  var_5.alpha = 1;

  if (isdefined(var_4))
  var_5.alpha = var_4;

  var_5 _meth_832C(30, 50000, 700);

  if (randomint(100) > 70)
  var_5 scripts\engine\utility::delaythread(2, ::_id_C369, -7, 7, 3, -5, 5, 3);

  level._id_3F69._id_1175D = 0;
  return var_5;
}

_id_83E5() {
  var_0 = 1;

  if (isdefined(level._id_3F69) && level._id_3F69._id_BFE0)
  var_0 = 0.3;

  return var_0;
}

_id_915B(var_0) {
  var_1 = self.x;
  var_2 = self.y;

  foreach (var_4 in var_0) {
  self.x = var_1 + var_4[0];
  self.y = var_2 + var_4[1];
  wait(randomfloatrange(0.05, 0.2));
  }

  self.x = var_1;
  self.y = var_2;
}

_id_DB9D(var_0, var_1) {
  self endon("death");
  self endon("stop_quick_pulse");

  if (var_0 == 0)
  level endon("chyron_faze_out_text_intro");
  else
  level endon("chyron_faze_out_text_gamenotify");

  if (!isdefined(var_1))
  var_1 = 1;

  for (;;) {
  wait 0.05;
  self.alpha = randomfloatrange(var_1 * 0.7, var_1);
  }
}

_id_AEC8(var_0, var_1) {
  if (!isdefined(var_1))
  var_1 = 0;

  self endon("death");
  var_2 = self.x;
  var_3 = self.y;
  var_4 = 0.15;

  if (!var_1) {
  self.x = self.x + randomintrange(-30, -10);
  self.y = self.y + randomintrange(10, 20);
  self _meth_820C(var_4);
  self.x = var_2;
  self.y = var_3;
  self fadeovertime(var_4);
  self.alpha = 0.1;
  wait(var_4);
  }

  self _meth_820C(var_0);
  self.x = self.x + randomintrange(15, 20);
  self.y = self.y + randomintrange(-4, 4);
  wait(var_0);
  var_4 = 0.05;
  self _meth_820C(var_4);
  self.x = var_2;
  self.y = var_3;
  wait(var_4);
  self fadeovertime(var_4);
  self.alpha = 0;
}

_id_DCB1(var_0, var_1, var_2) {
  var_3 = randomintrange(var_0, var_1);
  var_4 = 1;

  if (var_3 < 0)
  var_4 = -1;

  var_3 = max(abs(var_3), var_2);
  return var_3 * var_4;
}

_id_48B3(var_0, var_1, var_2) {
  if (!isdefined(var_1))
  var_1 = level._id_3F69._id_11761;

  if (!isdefined(var_2))
  var_2 = level._id_3F69._id_11762;

  var_3 = newhudelem();
  var_3.x = var_1;
  var_3.y = var_2;
  var_3._id_017D = "left";
  var_3._id_0382 = "bottom";
  var_3._id_002C = "bottom";
  var_3._id_02A4 = 3;
  var_3._id_0142 = 1;
  var_3 _meth_834D(var_0);
  var_3._id_1175C = var_0;
  var_3.alpha = 0;
  var_3._id_0177 = 1;
  var_3._id_013B = 1.4;

  if (level._id_4542)
  var_3._id_013B = 1.2;

  var_3._id_00B9 = (0.85, 0.93, 0.92);
  var_3._id_013A = "default";

  if (isdefined(level._id_3F69))
  level._id_3F69._id_91AF[level._id_3F69._id_91AF.size] = var_3;

  return var_3;
}

_id_7CBA(var_0) {
  var_1 = spawnstruct();
  var_2 = 0;
  var_3 = 0;
  var_4 = 0;

  if (var_0 == 0) {
  var_5 = -85;
  var_2 = level._id_3F69._id_1175D;
  var_3 = level._id_3F69._id_1175E;
  var_4 = level._id_3F69._id_1175F;
  } else {
  var_5 = 0;
  var_2 = level._id_7661._id_1175D;
  var_3 = level._id_7661._id_1175E;
  var_4 = level._id_7661._id_1175F;
  }

  var_6 = 200;
  var_7 = 60;
  var_1._id_039F = randomintrange(20, var_6);
  var_8 = [5, 10, 15];
  var_1.height = var_8[randomint(var_8.size)];
  var_1.x = randomintrange(0, var_6 - var_1._id_039F);
  var_1.y = var_5 + randomint(var_7 - var_1.height);
  var_1.alpha = randomfloatrange(0.3, 0.7);
  var_1._id_00B9 = _id_7CB9();
  var_1.time = randomfloatrange(0.05, 0.1);

  if (var_2) {
  var_1.x = int(var_3 + randomintrange(-1, 1));
  var_1.y = int(var_4 + randomintrange(0, 7));
  var_1._id_039F = randomintrange(100, var_6);
  var_1.height = randomintrange(10, 15);
  var_1._id_00B9 = (0.85, 0.93, 0.92) * randomfloatrange(0.2, 0.4);
  }

  return var_1;
}

_id_7CB9() {
  var_0 = [];
  var_0[var_0.size] = (0.15, 0.14, 0.22);
  var_0[var_0.size] = (0.09, 0.11, 0.13);
  var_0[var_0.size] = (0.34, 0.22, 0.22);
  var_0[var_0.size] = (0.29, 0.34, 0.22);
  return var_0[randomint(var_0.size)];
}

_id_495C(var_0) {
  if (var_0 == 0) {
  level endon("chyron_faze_out_text_intro");

  if (level._id_3F69._id_11151.size < 8) {
  var_1 = newhudelem();
  var_1._id_13438 = 0;
  level._id_3F69._id_11151[level._id_3F69._id_11151.size] = var_1;
  }

  var_2 = undefined;

  foreach (var_4 in level._id_3F69._id_11151) {
  if (var_4._id_13438)
  continue;

  var_2 = var_4;
  }

  if (!isdefined(var_2))
  return;

  var_6 = _id_7CBA(var_0);

  if (!level._id_3F69._id_1175D) {
  if (level._id_3F69._id_A917.size > 0 && level._id_3F69._id_A917.size < 3 && randomint(100) > 10) {
  var_7 = level._id_3F69._id_A917[level._id_3F69._id_A917.size - 1];
  var_6.x = var_7.x;
  var_6.y = var_7.y + var_7.height;

  if (scripts\engine\utility::_id_4347())
  var_6.y = var_7.y - var_6.height;
  }
  else
  level._id_3F69._id_A917 = [];

  level._id_3F69._id_A917[level._id_3F69._id_A917.size] = var_2;
  }
  } else {
  level endon("chyron_faze_out_text_gamenotify");

  if (level._id_7661._id_11151.size < 8) {
  var_1 = newhudelem();
  var_1._id_13438 = 0;
  level._id_7661._id_11151[level._id_7661._id_11151.size] = var_1;
  }

  var_2 = undefined;

  foreach (var_4 in level._id_7661._id_11151) {
  if (var_4._id_13438)
  continue;

  var_2 = var_4;
  }

  if (!isdefined(var_2))
  return;

  var_6 = _id_7CBA(var_0);

  if (!level._id_7661._id_1175D) {
  if (level._id_7661._id_A917.size > 0 && level._id_7661._id_A917.size < 3 && randomint(100) > 10) {
  var_7 = level._id_7661._id_A917[level._id_7661._id_A917.size - 1];
  var_6.x = var_7.x;
  var_6.y = var_7.y + var_7.height;

  if (scripts\engine\utility::_id_4347())
  var_6.y = var_7.y - var_6.height;
  }
  else
  level._id_7661._id_A917 = [];

  level._id_7661._id_A917[level._id_7661._id_A917.size] = var_2;
  }
  }

  var_2.x = var_6.x;
  var_2.y = var_6.y;
  var_2._id_039F = var_6._id_039F;
  var_2.height = var_6.height;
  var_2 setshader("white", var_6._id_039F, var_6.height);
  var_2.alpha = var_6.alpha;
  var_2._id_00B9 = var_6._id_00B9;

  if (var_2.alpha > 0.6)
  _id_3F6A(var_0, "ui_chyron_line_static");

  var_2._id_017D = "left";
  var_2._id_0382 = "bottom";

  if (var_0 == 1)
  var_2._id_0382 = "top";

  var_2._id_02A4 = 1;
  var_2._id_0142 = 1;
  var_2._id_0177 = 1;
  var_2._id_13438 = 1;
  wait(var_6.time);
  var_2.alpha = 0;
  var_2._id_13438 = 0;
}

_id_5F31(var_0, var_1) {
  var_2 = [];

  for (var_3 = 0; var_3 < var_1; var_3++)
  var_2[var_2.size] = _id_48B3(var_0._id_1175C);

  return var_2;
}

_id_7661() {
  level._id_7661 = spawnstruct();
  level._id_7661._id_0019 = 0;
  level._id_7661._id_11760 = [];
  level thread _id_7660("chyron_message1");
  level thread _id_7660("chyron_message2");
  level thread _id_7660("chyron_message3");
}

_id_7660(var_0) {
  for (;;) {
  _func_284(9010);
  _func_284(var_0);
  level waittill(var_0, var_1, var_2);
  _func_284(9009);
  _id_765E(var_1);
  }
}

_id_765E(var_0) {
  level._id_7661._id_11760[level._id_7661._id_11760.size] = var_0;

  if (!level._id_7661._id_0019)
  level thread _id_7662();
}

_id_7664() {
  level._id_7661._id_0019 = 1;
  level._id_7661._id_1175D = 0;
  level._id_7661._id_11152 = 0;
  level._id_7661._id_11761 = 6;
  level._id_7661._id_11762 = 10;
  level._id_7661._id_91AF = [];
  level._id_7661._id_11151 = [];
  level._id_7661._id_A917 = [];
  level._id_7661._id_22FD = [];
  level._id_7661._id_10466 = spawn("script_origin", level.player.origin);
  level._id_7661._id_10466 linkto(level.player);
}

_id_7663() {
  level._id_7661._id_10466 delete();
  level._id_7661 = spawnstruct();
  level._id_7661._id_0019 = 0;
  level._id_7661._id_11760 = [];
}

_id_7662() {
  _id_7664();
  _id_3F6A(1, "ui_chyron_on");
  thread _id_11151(1);
  var_0 = 0.4;
  thread _id_DB9A(1, var_0);
  wait(var_0);

  for (var_1 = 0; level._id_7661._id_11760.size; level._id_7661._id_11760 = _id_0B91::_id_22B0(level._id_7661._id_11760, 0)) {
  level thread _id_765F(level._id_7661._id_11760[0], var_1);
  var_1++;
  wait 0.5;
  }

  level._id_7661._id_1175D = 0;
  wait 1;
  level._id_7661._id_11152 = 1;
  wait 2;
  level._id_7661._id_11152 = 0;
  wait 1;
  _id_3F6A(1, "ui_chyron_off");
  _id_6BAF(1, 0);

  if (level._id_7661._id_11760.size) {
  level._id_7661._id_10466 delete();
  thread _id_7662();
  return;
  }

  _id_7663();
}

_id_765F(var_0, var_1) {
  var_2 = _id_48F3(var_0, var_1);
  level._id_7661._id_1175E = var_2.x;
  level._id_7661._id_1175F = var_2.y;
  level._id_7661._id_1175D = 1;
  var_2 thread _id_DB9D(1);
  var_2.alpha = 1;
  var_2 _meth_832C(30, 50000, 700);

  if (randomint(100) < 10)
  var_2 scripts\engine\utility::delaythread(2, ::_id_C369, -7, 7, 3, -5, 5, 3);
}

_id_48F3(var_0, var_1) {
  var_2 = newhudelem();
  var_2.x = level._id_7661._id_11761;
  var_2.y = level._id_7661._id_11762 + var_1 * 20;
  var_2._id_017D = "left";
  var_2._id_0382 = "top";
  var_2._id_02A4 = 3;
  var_2._id_0142 = 1;
  var_2 _meth_834D(var_0);
  var_2._id_1175C = var_0;
  var_2.alpha = 0;
  var_2._id_0177 = 1;
  var_2._id_013A = "default";
  var_2._id_013B = 1.25;

  if (level._id_4542)
  var_2._id_013B = 1;

  var_2._id_00B9 = (0.85, 0.93, 0.92);
  var_2._id_0153 = 0;
  level._id_7661._id_91AF[level._id_7661._id_91AF.size] = var_2;
  return var_2;
}

_id_111A0(var_0, var_1, var_2, var_3, var_4, var_5, var_6) {
  var_7 = _id_48B3(var_0, var_2, var_3);
  var_7._id_013B = 2;
  var_7._id_017D = "subleft";
  var_7._id_0382 = "subtop";
  var_7._id_002C = "middle";
  var_7._id_002B = "center";
  var_7.alpha = 1;
  var_7._id_02A4 = 3;

  if (isdefined(var_5))
  var_7._id_0154 = var_5;

  if (!isdefined(var_6))
  var_6 = 20;

  var_7 _meth_832C(var_6, 50000, 700);
  var_8 = [var_7];
  var_9 = _id_5F33(var_7, 2);

  foreach (var_11 in var_9) {
  var_11.alpha = 0;
  var_11 thread _id_9130(randomfloatrange(0.5, 1.5), randomfloatrange(0.05, 0.2), var_1 - 0.5);
  }

  var_7 thread _id_DB9D(0);
  var_8 = scripts\engine\utility::_id_227F(var_9, var_8);
  return var_8;
}

_id_9130(var_0, var_1, var_2) {
  wait(var_0);
  self.alpha = var_1;
  thread _id_AEC8(var_2 - 0.5, 1);
}

_id_5F33(var_0, var_1) {
  var_2 = [];

  for (var_3 = 0; var_3 < var_1; var_3++) {
  var_4 = newhudelem();
  var_4.x = var_0.x;
  var_4.y = var_0.y;
  var_4.alpha = var_0.alpha;
  var_4._id_002C = var_0._id_002C;
  var_4._id_002B = var_0._id_002B;
  var_4._id_017D = var_0._id_017D;
  var_4._id_0382 = var_0._id_0382;
  var_4._id_0142 = var_0._id_0142;
  var_4._id_0177 = var_0._id_0177;
  var_4._id_013B = var_0._id_013B;
  var_4._id_02A4 = var_0._id_02A4;
  var_4._id_00B9 = var_0._id_00B9;
  var_4 _meth_834D(var_0._id_1175C);
  var_2[var_2.size] = var_4;
  }

  return var_2;
}

_id_1119F(var_0, var_1, var_2, var_3) {
  var_4 = newhudelem();
  var_4.x = var_1;
  var_4.y = var_2 + (var_3 - 1) * 10;
  var_4._id_002B = "center";
  var_4._id_002C = "middle";
  var_4._id_017D = "subleft";
  var_4._id_0382 = "subtop";
  var_4._id_02A4 = 1;
  var_4._id_0142 = 1;
  var_4._id_0177 = 1;
  var_4.alpha = 0;
  var_5 = var_3 * 40 + 20;
  var_4 setshader("white", 1, var_5);
  var_4._id_00B9 = (0.85, 0.93, 0.92);
  var_4 fadeovertime(0.25);
  var_4.alpha = 0.1;
  var_4 _meth_8276(0.1, 2000, var_5);
  wait 0.1;
  scripts\engine\utility::_id_22D2(var_0, ::_id_913E, 0.1);
  var_6 = 0.15;
  var_4 fadeovertime(0.25);
  var_4.alpha = 0.2;
  var_4._id_00B9 = (1, 1, 1);
  var_4 _meth_8276(var_6, 2000, 2);
  wait(var_6);
  var_4 _meth_8276(var_6, 2, 2);
  var_4 fadeovertime(var_6);
  var_4.alpha = 0;
  wait(var_6);
  var_4 destroy();
}

_id_A03D(var_0) {
  level.player _meth_80F9(1);
  _id_0B3F::_id_10CCC();
  var_1 = newhudelem();
  level._id_3F2B = spawnstruct();
  wait 1;
  var_2 = _id_48C0("left");
  wait 0.1;
  var_3 = _id_48C0("right");
  var_3._id_C39F = var_3.x;
  var_3 _id_2B9E(2);
  wait 0.2;
  var_4 = _id_490F(var_0);
  var_5 = var_4[var_4.size - 1].x;
  var_3 _meth_820C(0.2);
  var_3.x = var_5 - 4;
  var_6 = spawnstruct();
  var_6._id_00C1 = var_4.size;

  foreach (var_8 in var_4)
  var_6 thread _id_6AB6(var_8);

  var_6 waittill("fadein_letter_done");
  wait 0.3;
  var_2 thread _id_2BA0(3);
  var_3 thread _id_2BA0(3);
  wait 2;
  var_2 thread _id_2BA1(3);
  var_3 thread _id_2BA1(3);
  wait 0.3;
  var_10 = 0.4;
  var_3 _meth_820C(var_10);
  var_3.x = var_3._id_C39F;
  var_10 = var_10 / var_4.size;

  for (var_11 = var_4.size - 1; var_11 >= 0; var_11--) {
  var_8 = var_4[var_11];
  var_8 fadeovertime((var_4.size - var_11) * var_10);
  var_8.alpha = 0;
  }

  wait(var_10 + 0.3);
  var_2 thread _id_2BA0(3);
  var_3 thread _id_2BA0(3);
  wait 1;
  scripts\engine\utility::_id_227D(var_4, ::destroy);
  var_3 destroy();
  var_2 destroy();
}

_id_6AB6(var_0) {
  var_1 = randomfloatrange(0.1, 0.3);
  var_2 = randomfloatrange(0.45, 0.8);
  var_0 _id_2B9E(2, 0.2, 0.5, 0.8);

  if (randomint(100) < 30)
  var_0 _id_2B9E(2, 0.05, 0.1, 0.8);

  self._id_00C1--;

  if (self._id_00C1 == 0)
  self notify("fadein_letter_done");
}

_id_2BA0(var_0, var_1, var_2, var_3) {
  _id_2B9E(var_0, var_1, var_2, var_3);

  if (!isdefined(var_1))
  var_1 = 0.05;

  if (!isdefined(var_2))
  var_2 = 0.1;

  var_4 = randomfloatrange(var_1, var_2);
  self fadeovertime(var_4);
  self.alpha = 0;
}

_id_2BA1(var_0, var_1, var_2, var_3) {
  _id_2B9E(var_0, var_1, var_2, var_3);

  if (!isdefined(var_1))
  var_1 = 0.05;

  if (!isdefined(var_2))
  var_2 = 0.1;

  if (!isdefined(var_3))
  var_3 = 0.8;

  var_4 = randomfloatrange(var_1, var_2);
  self fadeovertime(var_4);
  self.alpha = var_3;
}

_id_2B9E(var_0, var_1, var_2, var_3) {
  if (!isdefined(var_1))
  var_1 = 0.05;

  if (!isdefined(var_2))
  var_2 = 0.1;

  if (!isdefined(var_3))
  var_3 = 0.8;

  for (var_4 = 0; var_4 < var_0; var_4++) {
  var_5 = randomfloatrange(var_1, var_2);
  self fadeovertime(var_5);

  if (var_4 % 2)
  var_6 = var_3;
  else
  var_6 = randomfloatrange(0.05, 0.2);

  self.alpha = var_6;
  wait(var_5);
  }

  var_5 = randomfloatrange(var_1, var_2);
  self fadeovertime(var_5);
  self.alpha = var_3;
}

_id_490F(var_0) {
  var_1 = [];
  var_2 = undefined;

  for (var_3 = 0; var_3 < var_0.size; var_3++) {
  var_4 = var_0[var_3];
  var_5 = _id_490E(var_4);
  var_5.alpha = 0;
  var_6 = 20;

  if (isdefined(var_2)) {
  if (var_2._id_1175C == "'")
  var_6 = 10;
  else if (var_2._id_1175C == "M")
  var_6 = 24;
  else if (var_2._id_1175C == "E")
  var_6 = 18;
  else if (var_2._id_1175C == "T")
  var_6 = 18;
  else if (var_2._id_1175C == " ")
  var_6 = 14;
  }

  if (isdefined(var_2))
  var_5.x = var_2.x + var_6;

  var_1[var_1.size] = var_5;
  var_2 = var_5;
  }

  return var_1;
}

_id_490E(var_0) {
  var_1 = newhudelem();
  var_1.x = 400;
  var_1.y = 400;
  var_1._id_002B = "left";
  var_1._id_002C = "middle";
  var_1._id_02A4 = 1;
  var_1._id_0142 = 1;
  var_1._id_0177 = 1;
  var_1.alpha = 1;
  var_1._id_00B9 = (0.925, 0.933, 0.957);
  var_1._id_013B = 2;
  var_1._id_013A = "objective";
  var_1._id_1175C = var_0;
  var_1 _meth_834D(var_0);
  return var_1;
}

_id_48C0(var_0) {
  var_1 = newhudelem();
  var_1.x = 397;
  var_1.y = 400;
  var_1._id_002B = "left";
  var_1._id_002C = "middle";
  var_1._id_02A4 = 1;
  var_1._id_0142 = 1;
  var_1._id_0177 = 1;
  var_1.alpha = 0.8;
  var_1._id_C377 = var_1.alpha;
  var_1._id_00B9 = (0.925, 0.933, 0.957);
  var_2 = "chyron_border_" + var_0;
  var_1 setshader(var_2, 22, 22);
  return var_1;
}