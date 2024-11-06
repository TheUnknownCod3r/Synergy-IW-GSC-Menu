/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2830.gsc
***************************************/

main() {
  if (!scripts\engine\utility::_id_16F3("autosave", ::main))
  return;

  level._id_2668 = spawnstruct();
  level._id_2668._id_A943 = 0;
  scripts\engine\utility::_id_6E39("game_saving");
  scripts\engine\utility::_id_6E39("can_save");
  scripts\engine\utility::_id_6E3E("can_save");
  scripts\engine\utility::_id_6E39("disable_autosaves");
  scripts\engine\utility::_id_6E39("ImmediateLevelStartSave");

  if (!isdefined(level._id_2668._id_6A42))
  level._id_2668._id_6A42 = [];

  level._id_2668._id_DAC8 = ::_id_2674;
  _id_2A6D();
}

_id_3D54() {
  wait 2;
  level.player endon("death");
  setdvarifuninitialized("scr_savetest", "0");

  for (;;) {
  if (getdvarint("scr_savetest") > 0) {
  setdvar("scr_savetest", "0");
  _id_0B91::_id_2669("cheat_save");
  wait 1;
  }

  wait 0.05;
  }
}

_id_7E6B() {
  return &"AUTOSAVE_AUTOSAVE";
}

_id_7FD9(var_0) {
  if (var_0 == 0)
  var_1 = &"AUTOSAVE_GAME";
  else
  var_1 = &"AUTOSAVE_NOGAME";

  return var_1;
}

_id_2A6D() {
  thread immediatelevelstartsave();
  thread _id_2A6E();
}

immediatelevelstartsave() {
  var_0 = _id_0B91::_id_7F6E(level.script);

  if (!isdefined(var_0))
  var_0 = 0;

  var_0 = var_0 * 0.05;
  var_1 = _id_0B91::_id_7E2C(level.script);

  if (!isdefined(var_1))
  var_1 = 0;

  var_1 = var_1 * 0.001;
  wait(var_1 + var_0 + 0.15);
  var_2 = 0;

  if (isdefined(level._id_4A3A))
  var_2 = 1;
  else if (level._id_B8D0)
  var_2 = 1;
  else if (scripts\engine\utility::_id_6E25("game_saving"))
  var_2 = 1;

  if (var_2) {
  scripts\engine\utility::_id_6E3E("ImmediateLevelStartSave");
  return;
  }

  scripts\engine\utility::_id_6E3E("game_saving");

  if (!isalive(level.player))
  return;

  var_3 = "levelshots / autosave / autosave_" + level.script + "immediate_start";
  _func_1A0("immediatelevelstart", &"AUTOSAVE_LEVELSTART", var_3, 1);
  setdvar("ui_grenade_death", "0");
  level.player _meth_8591(0);
  scripts\engine\utility::_id_6E2A("game_saving");
  scripts\engine\utility::_id_6E3E("ImmediateLevelStartSave");
}

_id_2A6E() {
  if (isdefined(level._id_2A6F))
  wait(level._id_2A6F);
  else
  wait 2;

  if (isdefined(level._id_4A3A))
  return;

  if (level._id_B8D0)
  return;

  if (scripts\engine\utility::_id_6E25("game_saving"))
  return;

  if (!scripts\engine\utility::_id_6E25("ImmediateLevelStartSave")) {
  scripts\engine\utility::_id_6E4C("ImmediateLevelStartSave");
  wait 1;
  }

  scripts\engine\utility::_id_6E3E("game_saving");
  var_0 = "levelshots / autosave / autosave_" + level.script + "start";
  var_1 = waitfortransientloading("beginningOfLevelSave_thread()");

  if (!isdefined(var_1)) {
  scripts\engine\utility::_id_6E2A("game_saving");
  return;
  }

  if (!isalive(level.player))
  return;

  _func_1A0("levelstart", &"AUTOSAVE_LEVELSTART", var_0, 1);
  setdvar("ui_grenade_death", "0");
  level.player _meth_8591(0);
  scripts\engine\utility::_id_6E2A("game_saving");
}

_id_12726(var_0) {
  var_0 waittill("trigger");
  _id_0B91::_id_2677();
}

_id_12727(var_0) {
  var_0 waittill("trigger");
  _id_0B91::_id_2679();
}

_id_12724(var_0) {
  if (!isdefined(var_0._id_ED0D))
  var_0._id_ED0D = 0;

  _id_268E(var_0);
}

_id_268E(var_0) {
  var_1 = _id_7FD9(var_0._id_ED0D);

  if (!isdefined(var_1))
  return;

  wait 1;
  var_0 waittill("trigger");
  var_2 = var_0._id_ED0D;
  var_3 = "levelshots / autosave / autosave_" + level.script + var_2;
  _id_12891(var_2, var_1, var_3);

  if (isdefined(var_0))
  var_0 delete();
}

_id_268B(var_0) {
  if (_id_0B79::_id_9C4B())
  return;

  wait 1;
  var_0 waittill("trigger");

  if (!isdefined(var_0))
  return;

  var_1 = var_0._id_ED0E;
  var_0 delete();

  if (isdefined(level._id_4C7F)) {
  if (![[level._id_4C7F]]())
  return;
  }

  _id_0B91::_id_2669(var_1);
}

_id_268D(var_0, var_1, var_2) {}

_id_1190(var_0, var_1) {
  if (!specialistsavecheck())
  return 0;

  if (isdefined(level._id_B8D0) && level._id_B8D0)
  return 0;

  if (!isdefined(var_1) || !var_1)
  level notify("trying_new_autosave");

  if (scripts\engine\utility::_id_6E25("game_saving"))
  return 0;

  scripts\engine\utility::_id_6E3E("game_saving");
  var_2 = waitfortransientloading("_autosave_game_now()");

  if (!isdefined(var_2)) {
  scripts\engine\utility::_id_6E2A("game_saving");
  return 0;
  }

  for (var_3 = 0; var_3 < level.players.size; var_3++) {
  var_4 = level.players[var_3];

  if (!isalive(var_4))
  return 0;
  }

  var_5 = "save_now";
  var_6 = _id_7E6B();

  if (getdvarint("reloading") != 0)
  return 0;

  if (isdefined(level._id_BF95))
  return 0;

  if (isdefined(var_0))
  var_7 = _func_1A1(var_5, var_6, "$default", 1);
  else
  var_7 = _func_1A1(var_5, var_6);

  wait 0.05;

  if (_func_110()) {
  level._id_2668._id_A943 = gettime();
  scripts\engine\utility::_id_6E2A("game_saving");
  return 0;
  }

  if (_func_319()) {
  scripts\engine\utility::_id_6E2A("game_saving");
  return 0;
  }

  if (var_7 < 0) {
  scripts\engine\utility::_id_6E2A("game_saving");
  return 0;
  }

  if (!_id_12878(var_7)) {
  scripts\engine\utility::_id_6E2A("game_saving");
  return 0;
  }

  wait 2;
  scripts\engine\utility::_id_6E2A("game_saving");

  if (_func_319()) {
  scripts\engine\utility::_id_6E2A("game_saving");
  return 0;
  }

  if (!_func_04A(var_7))
  return 0;

  if (_id_12878(var_7)) {
  _func_049(var_7);
  level.player _meth_8591(0);
  setdvar("ui_grenade_death", "0");
  }

  return 1;
}

_id_2671(var_0) {
  var_0 waittill("trigger");
  _id_0B91::_id_266F();
}

_id_12878(var_0) {
  if (!_func_111())
  return 0;

  if (!level.player _id_2688(var_0))
  return 0;

  if (scripts\engine\utility::_id_D11B()) {
  if (!level._id_D127 _id_2689(var_0))
  return 0;
  }

  if (!scripts\engine\utility::_id_6E25("can_save"))
  return 0;

  return 1;
}

_id_12891(var_0, var_1, var_2, var_3, var_4, var_5) {
  if (scripts\engine\utility::_id_6E25("disable_autosaves"))
  return 0;

  if (!specialistsavecheck())
  return 0;

  level endon("nextmission");
  level.player endon("death");

  if (scripts\engine\utility::_id_6E25("game_saving"))
  return 0;

  level notify("trying_new_autosave");

  if (isdefined(level._id_BF95))
  return 0;

  var_6 = 1.25;
  var_7 = 1.25;

  if (isdefined(var_3) && var_3 < var_6 + var_7) {}

  if (!isdefined(var_5))
  var_5 = 0;

  if (!isdefined(var_2))
  var_2 = "$default";

  if (!isdefined(var_4))
  var_4 = 0;

  scripts\engine\utility::_id_6E3E("game_saving");
  var_8 = _id_7E6B();
  var_9 = gettime();
  var_10 = 0;

  for (;;) {
  if (_id_2685(undefined, var_4)) {
  waitfortransientloading("tryAutoSave()");

  if (getdvarint("reloading") != 0)
  break;

  if (isdefined(level._id_BF95))
  break;

  var_10++;

  if (_id_0B91::_id_93A6()) {
  if (var_10 == 3)
  break;

  if (!specialistinjackal()) {
  if (!specialistitemcheck())
  break;
  }
  }

  var_11 = _func_1A1(var_0, var_8, var_2, var_5);

  if (var_11 < 0)
  break;

  wait 0.05;

  if (_func_110()) {
  level._id_2668._id_A943 = gettime();
  break;
  }

  if (_func_319())
  continue;

  wait(var_6);

  if (_func_319())
  continue;

  if (_id_6A43(var_11))
  continue;

  if (!_id_2685(undefined, var_4, var_11))
  continue;

  wait(var_7);

  if (_func_319())
  continue;

  if (!_id_2686(var_11))
  continue;

  if (isdefined(var_3)) {
  if (gettime() > var_9 + var_3 * 1000)
  break;
  }

  if (!scripts\engine\utility::_id_6E25("can_save"))
  break;

  if (!_func_04A(var_11)) {
  scripts\engine\utility::_id_6E2A("game_saving");
  return 0;
  }

  _func_049(var_11);
  level.player _meth_8591(0);
  level._id_A9E7 = gettime();
  setdvar("ui_grenade_death", "0");
  break;
  }

  wait 0.25;
  }

  scripts\engine\utility::_id_6E2A("game_saving");
  return 1;
}

waitfortransientloading(var_0) {
  level endon("trying_new_autosave");
  var_1 = 0;

  if (_func_2B5()) {
  while (!_func_282()) {
  if (gettime() > var_1)
  var_1 = gettime() + 2000;

  wait 0.05;
  }
  }

  while (_func_319()) {
  if (gettime() > var_1)
  var_1 = gettime() + 2000;

  wait 0.05;
  }

  return 1;
}

_id_6A43(var_0) {
  foreach (var_2 in level._id_2668._id_6A42) {
  if (![[var_2["func"]]]())
  return 1;
  }

  return 0;
}

_id_2686(var_0) {
  return _id_2685(0, 0, var_0);
}

_id_2685(var_0, var_1, var_2) {
  if (isdefined(level._id_266C))
  return [[level._id_266C]]();

  if (isdefined(level._id_1093A) && ![[level._id_1093A]]())
  return 0;

  if (level._id_B8D0)
  return 0;

  if (!isdefined(var_0))
  var_0 = level._id_5A5E;

  if (!isdefined(var_1))
  var_1 = 0;

  if (var_1) {
  if (![[level._id_83D2["_autosave_stealthcheck"]]]())
  return 0;
  }

  if (scripts\engine\utility::_id_D11B()) {
  if (!level._id_D127 _id_2689(var_2))
  return 0;
  } else {
  if (!level.player _id_2688(var_2))
  return 0;

  if (var_0 && !level.player _id_2684(var_2))
  return 0;
  }

  if (level._id_2681) {
  if (!_id_268F(var_0, var_2))
  return 0;
  }

  if (!level.player _id_268C(var_0, var_2))
  return 0;

  if (isdefined(level._id_EB75) && !level._id_EB75)
  return 0;

  if (isdefined(level._id_3901) && !level._id_3901)
  return 0;

  if (!_func_111())
  return 0;

  return 1;
}

_id_268C(var_0, var_1) {
  if (self _meth_81AE() && var_0)
  return 0;

  if (self _meth_81C6() && var_0)
  return 0;

  if (self _meth_819F() && var_0)
  return 0;

  if (isdefined(self._id_FC69) && self._id_FC69)
  return 0;

  if (!self _meth_81AB() && !scripts\engine\utility::_id_D11B() && !_id_0B91::_id_93AC() && !self isonground()) {
  if (bullettracepassed(level.player.origin + (0, 0, 5), level.player.origin + (0, 0, -200), 0, self))
  return 0;
  }

  if (self iswallrunning())
  return 0;

  if (scripts\engine\utility::_id_9DFB())
  return 0;

  if (isdefined(self._id_883A) && self._id_883A == 1)
  return 0;

  return 1;
}

_id_2684(var_0) {
  var_1 = self getweaponslistprimaries();

  if (var_1.size == 0)
  return 1;

  var_2 = 1;

  for (var_3 = 0; var_3 < var_1.size; var_3++) {
  if (weaponmaxammo(var_1[var_3]) > 0)
  var_2 = 0;

  var_4 = self _meth_8127(var_1[var_3]);

  if (var_4 > 0.1)
  return 1;
  }

  if (var_2)
  return 1;

  return 0;
}

_id_2688(var_0) {
  var_1 = self.health / self.maxhealth;

  if (var_1 < 0.5)
  return 0;

  if (_id_0B91::_id_65DB("player_has_red_flashing_overlay"))
  return 0;

  return 1;
}

_id_2689(var_0) {
  if (isdefined(self._id_5F6F))
  return 0;

  var_1 = _id_0B91::_id_7B9D();

  if (var_1 < 0.5)
  return 0;

  if (isdefined(self._id_93D2) && self._id_93D2.size > 0)
  return 0;

  if (_id_0B91::_id_A1A8("enemy_lockon"))
  return 0;

  if (_id_268A())
  return 0;

  return 1;
}

_id_268A(var_0) {
  var_1 = self._id_02AC;
  var_2 = rotatevectorinverted(var_1, self.angles);
  var_0 = var_2[0];

  if (var_0 < 100)
  return 0;

  var_3 = var_0 * 10;
  var_3 = clamp(var_3, 0, 10000);
  var_4 = self.origin + anglestoforward(self.angles) * var_3;
  var_5 = scripts\engine\trace::_id_3A09(self.origin, var_4, 200, 400, self.angles, self);

  if (var_5["fraction"] < 1)
  return 1;
  else
  return 0;
}

_id_268F(var_0, var_1) {
  var_2 = _func_075("bad_guys", "all");

  foreach (var_4 in var_2) {
  if (!isdefined(var_4._id_010C))
  continue;

  if (!isplayer(var_4._id_010C))
  continue;

  if (isdefined(var_4._id_B55B) && isdefined(var_4._id_B55B._id_0334) && isplayer(var_4._id_B55B._id_0334))
  return 0;

  var_5 = [[level._id_2668._id_DAC8]](var_4);

  if (var_5 == "return_even_if_low_accuracy")
  return 0;

  if (var_4._id_012F < 0.021 && var_4._id_012F > -1)
  continue;

  if (var_5 == "return")
  return 0;

  if (var_5 == "none")
  continue;

  var_6 = undefined;

  if (var_4._id_1491._id_A9ED > gettime() - 500) {
  var_6 = var_4 _id_7E19();

  if (var_0 || var_6)
  return 0;
  }

  if (!isdefined(var_6))
  var_6 = var_4 _id_7E19();

  if (isdefined(var_4._id_2303._id_11AC7) && var_4 scripts\asm\asm::_id_231B(var_4._id_2303._id_11AC7, "aim") && var_6)
  return 0;
  }

  if (_id_0B91::_id_D121())
  return 0;

  if (isdefined(level._id_CAF7)) {
  foreach (var_9 in level._id_CAF7) {
  if (!isdefined(var_9._id_C528))
  continue;

  if (var_9._id_111AD == "antigrav")
  continue;

  if (distancesquared(var_9.origin, level.player.origin) < 122500)
  return 0;
  }
  }

  var_11 = getentarray("scriptable", "code_classname");

  foreach (var_13 in var_11) {
  if (!isdefined(var_13._id_00ED) || var_13._id_00ED != "vehicle")
  continue;

  if (!isdefined(var_13._id_C528))
  continue;

  if (distancesquared(var_13.origin, level.player.origin) < 160000)
  return 0;
  }

  return 1;
}

_id_7E19() {
  return scripts\anim\utility_common::_id_3907(0) && self _meth_8061(0);
}

_id_6489() {
  if (self._id_012F >= 0.021)
  return 1;

  foreach (var_1 in level.players) {
  if (distance(self.origin, var_1.origin) < 500)
  return 1;
  }

  return 0;
}

_id_2674(var_0) {
  foreach (var_2 in level.players) {
  var_3 = distancesquared(var_0.origin, var_2.origin);

  if (var_3 < 40000)
  return "return_even_if_low_accuracy";
  else if (var_3 < 129600)
  return "return";
  else if (var_3 < 1000000)
  return "threat_exists";
  }

  return "none";
}

specialistsavecheck() {
  if (!_id_0B91::_id_93A6())
  return 1;

  if (specialistinjackal())
  return 1;

  if (_id_0A2F::_id_9CBB(level._id_116CC))
  return 1;

  if (isdefined(level.player._id_D430) && level.player._id_D430)
  return 0;

  if (!specialistitemcheck())
  return 0;

  return 1;
}

specialistinjackal() {
  if (_id_0B78::_id_2C97())
  return 1;

  if (scripts\engine\utility::_id_D11B())
  return 1;

  return 0;
}

specialistitemcheck() {
  var_0 = 0;
  var_1 = 0;
  var_0 = level.player getweaponammostock("nanoshot");
  var_1 = level.player getweaponammostock("helmet");

  if (var_0 == 0) {
  if (level.player._id_110BD == "nanoshot")
  var_0 = level.player._id_110BE;
  }

  if (var_0 < 1)
  return 0;

  if (var_1 == 0) {
  if (level.player._id_110BA == "helmet")
  var_1 = level.player._id_110BB;
  }

  if (var_1 < 1)
  return 0;

  return 1;
}
