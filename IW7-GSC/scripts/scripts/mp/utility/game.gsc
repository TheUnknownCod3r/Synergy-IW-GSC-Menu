/***********************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\scripts\mp\utility\game.gsc
***********************************************/

_id_12C6(var_0, var_1, var_2, var_3) {
  if (!isdefined(var_1))
  var_1 = -1;

  if (!isdefined(var_3))
  var_3 = 0;

  if (issubstr(var_0, "+akimbo") || issubstr(var_0, "+g18pap2") || isdefined(var_2) && var_2 == 1)
  self giveweapon(var_0, var_1, 1, -1, var_3);
  else
  self giveweapon(var_0, var_1, 0, -1, var_3);

  thread _id_12EBE(var_0);
  return var_0;
}

_id_12EBE(var_0) {
  if (isdefined(var_0)) {
  if (isdefined(level._id_A915)) {
    var_1 = getweaponbasename(var_0);

    if (scripts\engine\utility::array_contains(level._id_A915, var_1)) {
    self._id_A913 = var_0;
    return;
    }
  }
  }

  var_2 = self _meth_8173();
  var_3 = getweaponbasename(self._id_A913);
  var_4 = 0;

  foreach (var_6 in var_2) {
  var_7 = getweaponbasename(var_6);

  if (var_7 == var_3) {
    var_4 = 1;
    return;
  }
  }

  if (!var_4) {
  if (isdefined(level._id_A915)) {
    foreach (var_6 in var_2) {
    var_7 = getweaponbasename(var_6);

    for (var_10 = level._id_A915.size - 1; var_10 > -1; var_10--) {
      if (var_7 == level._id_A915[var_10]) {
      var_4 = 1;
      self._id_A913 = var_6;
      return;
      }
    }
    }
  }

  var_12 = _id_80D8(self._id_501C);

  if (isdefined(self._id_13C00[var_12]))
    self._id_A913 = self._id_13C00[var_12];
  else
    self._id_A913 = self._id_501C;
  }
}

giveperk(var_0) {
  if (issubstr(var_0, "specialty_weapon_")) {
  _id_13D1(var_0);
  return;
  }

  _id_13D1(var_0);
  _id_13CC(var_0);
}

_id_12D6(var_0) {
  var_1 = self._id_CA5B;

  if (!isdefined(var_1))
  return 0;

  if (isdefined(var_1[var_0]))
  return 1;

  return 0;
}

_id_13D1(var_0) {
  self._id_CA5B[var_0] = 1;
  self._id_CA61[var_0] = var_0;
  var_1 = level._id_CA60[var_0];

  if (isdefined(var_1))
  self thread [[var_1]]();

  self _meth_8320(var_0, !isdefined(level._id_EF86[var_0]));
}

_id_1430(var_0) {
  self._id_CA5B[var_0] = undefined;
  self._id_CA61[var_0] = undefined;

  if (isdefined(level._id_CA66[var_0]))
  self thread [[level._id_CA66[var_0]]]();

  self _meth_83CC(var_0, !isdefined(level._id_EF86[var_0]));
}

_id_13CC(var_0) {
  if (var_0 == "specialty_stun_resistance")
  giveperk("specialty_empimmune");

  if (var_0 == "specialty_hardline")
  giveperk("specialty_assists");

  if (var_0 == "specialty_incog") {
  giveperk("specialty_spygame");
  giveperk("specialty_coldblooded");
  giveperk("specialty_noscopeoutline");
  giveperk("specialty_heartbreaker");
  }

  if (var_0 == "specialty_blindeye")
  giveperk("specialty_noplayertarget");

  if (var_0 == "specialty_sharp_focus")
  giveperk("specialty_reducedsway");

  if (var_0 == "specialty_quickswap")
  giveperk("specialty_fastoffhand");
}

_id_11AA() {
  foreach (var_2, var_1 in self._id_CA5B) {
  if (isdefined(level._id_CA66[var_2]))
    self [[level._id_CA66[var_2]]]();
  }

  self._id_CA5B = [];
  self._id_CA61 = [];
  self _meth_8077();
}

_id_41C5() {
  if (isdefined(self._id_B0E0)) {
  for (var_0 = 0; var_0 < self._id_B0E0.size; var_0++)
    self._id_B0E0[var_0] = undefined;
  }

  if (!isdefined(self._id_B0DE))
  return;

  _id_12EC4();
}

_id_F78C(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9) {
  if (!isdefined(var_3))
  var_3 = 1;

  if (!isdefined(var_2))
  var_2 = 0;

  if (!isdefined(var_4))
  var_4 = 0;

  if (!isdefined(var_5))
  var_5 = 0;

  if (!isdefined(var_6))
  var_6 = 0.85;

  if (!isdefined(var_7))
  var_7 = 3.0;

  if (!isdefined(var_8))
  var_8 = 0;

  if (!isdefined(var_9))
  var_9 = 1;

  _id_17EE(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9);
  _id_12EC4();
}

play_bink_video(var_0, var_1, var_2) {
  level thread play_bink_video_internal(var_0, var_1, var_2);
}

play_bink_video_internal(var_0, var_1, var_2) {
  foreach (var_4 in level.players)
  var_4 _id_7385(1);

  setomnvar("bink_video_active", 1);
  _func_16E(var_0);
  wait(var_1);
  setomnvar("bink_video_active", 0);

  foreach (var_4 in level.players) {
  var_4 _id_7385(0);

  if (!isdefined(var_2) || !var_2)
    var_4 thread _id_CF90(0, 1, 0.5, 1);
  }
}

_id_12EC4() {
  self endon("disconnect");

  if (!isdefined(self))
  return;

  var_0 = _id_7F85();

  if (!isdefined(var_0)) {
  if (isdefined(self._id_B0DE)) {
    self._id_B0DE.alpha = 0;
    self._id_B0DE _meth_834D("");

    if (isdefined(self._id_B0E7))
    self._id_B0E7.alpha = 0;
  }
  } else {
  self._id_B0DE _meth_834D(var_0._id_1175C);
  self._id_B0DE.alpha = 0.85;
  self._id_B0E7.alpha = 1;
  self._id_B0DE._id_0176 = var_0._id_0176;
  self._id_B0DE._id_0177 = var_0._id_0177;

  if (var_0._id_10011) {
    self._id_B0DE fadeovertime(min(var_0._id_6ABD, 60));
    self._id_B0DE.alpha = var_0._id_6ABC;
  }

  if (var_0.time > 0 && var_0._id_10157)
    self._id_B0E7 _meth_834F(max(var_0.time - (gettime() - var_0._id_1842) / 1000, 0.1));
  else
  {
    if (var_0.time > 0 && !var_0._id_10157) {
    self._id_B0E7 _meth_834D("");
    self._id_B0DE fadeovertime(min(var_0.time, 60));
    self._id_B0DE.alpha = 0;
    thread _id_41C8(var_0);
    thread _id_4194(var_0);
    return;
    }

    self._id_B0E7 _meth_834D("");
  }
  }
}

_id_17EE(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9) {
  var_10 = undefined;

  foreach (var_12 in self._id_B0E0) {
  if (var_12.name == var_0) {
    if (var_12._id_1175C == var_1 && var_12._id_D925 == var_3)
    return;

    var_10 = var_12;
    break;
  }
  }

  if (!isdefined(var_10)) {
  var_10 = spawnstruct();
  self._id_B0E0[self._id_B0E0.size] = var_10;
  }

  var_10.name = var_0;
  var_10._id_1175C = var_1;
  var_10.time = var_2;
  var_10._id_1842 = gettime();
  var_10._id_D925 = var_3;
  var_10._id_10157 = var_4;
  var_10._id_10011 = var_5;
  var_10._id_6ABC = var_6;
  var_10._id_6ABD = var_7;
  var_10._id_0176 = var_8;
  var_10._id_0177 = var_9;
  _id_1043D();
}

_id_1043D() {
  for (var_0 = 1; var_0 < self._id_B0E0.size; var_0++) {
  var_1 = self._id_B0E0[var_0];
  var_2 = var_1._id_D925;

  for (var_3 = var_0 - 1; var_3 >= 0 && var_2 > self._id_B0E0[var_3]._id_D925; var_3--)
    self._id_B0E0[var_3 + 1] = self._id_B0E0[var_3];

  self._id_B0E0[var_3 + 1] = var_1;
  }
}

_id_7F85() {
  if (!isdefined(self._id_B0E0))
  return undefined;

  return self._id_B0E0[0];
}

_id_41C8(var_0) {
  self notify("message_cleared");
  self endon("message_cleared");
  self endon("disconnect");
  level endon("game_ended");
  self waittill("death");
  _id_41C4(var_0.name);
}

_id_4194(var_0) {
  wait(var_0.time);
  _id_41C4(var_0.name);
  self notify("message_cleared");
}

_id_41C4(var_0) {
  _id_E13B(var_0);
  _id_12EC4();
}

_id_E13B(var_0) {
  if (isdefined(self._id_B0E0)) {
  for (var_1 = self._id_B0E0.size; var_1 > 0; var_1--) {
    if (self._id_B0E0[var_1 - 1].name != var_0)
    continue;

    var_2 = self._id_B0E0[var_1 - 1];

    for (var_3 = var_1; var_3 < self._id_B0E0.size; var_3++) {
    if (isdefined(self._id_B0E0[var_3]))
      self._id_B0E0[var_3 - 1] = self._id_B0E0[var_3];
    }

    self._id_B0E0[self._id_B0E0.size - 1] = undefined;
  }

  _id_1043D();
  }
}

_id_7385(var_0) {
  if (isdefined(level._id_90A9)) {
  self._id_90A6 = 1;
  self _meth_80F9(1);
  return;
  }

  self _meth_80F9(var_0);
  self._id_45D6 = var_0;
}

_id_F887(var_0) {
  if (var_0)
  self setdepthoffield(0, 110, 512, 4096, 6, 1.8);
  else
  self setdepthoffield(0, 0, 512, 512, 4, 0);
}

_id_FB09(var_0) {
  if (isdefined(self._id_3AF5))
  self._id_3AF5.alpha = 0;

  self._id_13118 = var_0;

  if (scripts\engine\utility::_id_9EC1())
  scripts\engine\utility::_id_1C58(0);

  self notify("using_remote");
}

isusingremote() {
  return isdefined(self._id_13118);
}

updatesessionstate(var_0, var_1) {
  self.sessionstate = var_0;

  if (!isdefined(var_1))
  var_1 = "";

  self._id_02C7 = var_1;
  self setclientomnvar("ui_session_state", var_0);
}

_id_81EC() {
  if (isdefined(self.pers["guid"]))
  return self.pers["guid"];

  var_0 = self _meth_812C();

  if (var_0 == "0000000000000000") {
  if (isdefined(level._id_86BF))
    level._id_86BF++;
  else
    level._id_86BF = 1;

  var_0 = "script" + level._id_86BF;
  }

  self.pers["guid"] = var_0;
  return self.pers["guid"];
}

_id_766F(var_0) {
  game["flags"][var_0] = 1;
  level notify(var_0);
}

_id_766E(var_0, var_1) {
  game["flags"][var_0] = var_1;
}

_id_766C(var_0) {
  return game["flags"][var_0];
}

_id_7670(var_0) {
  while (!_id_766C(var_0))
  level waittill(var_0);
}

matchmakinggame() {
  return level.onlinegame && !getdvarint("xblive_privatematch");
}

_id_9900() {
  return isdefined(game["status"]) && game["status"] == "overtime";
}

_id_9892() {
  if (!isdefined(level._id_ABF3))
  level._id_ABF3 = [];
}

_id_980B() {
  if (!isdefined(game["flags"]))
  game["flags"] = [];
}

_id_F305() {
  if (!scripts\engine\utility::_id_16F3("platform", ::_id_F305))
  return;

  if (!isdefined(level._id_4542))
  level._id_4542 = getdvar("consoleGame") == "true";
  else
  {}

  if (!isdefined(level._id_13E0F))
  level._id_13E0F = getdvar("xenonGame") == "true";
  else
  {}

  if (!isdefined(level._id_DADB))
  level._id_DADB = getdvar("ps3Game") == "true";
  else
  {}

  if (!isdefined(level._id_13E0E))
  level._id_13E0E = getdvar("xb3Game") == "true";
  else
  {}

  if (!isdefined(level._id_DADC))
  level._id_DADC = getdvar("ps4Game") == "true";
  else
  {}
}

isenemy(var_0) {
  if (level.teambased)
  return _id_9EF3(var_0);
  else
  return _id_9EEB(var_0);
}

_id_9EF3(var_0) {
  return var_0.team != self.team;
}

_id_9EEB(var_0) {
  if (isdefined(var_0.owner))
  return var_0.owner != self;
  else
  return var_0 != self;
}

_id_C18A(var_0) {
  self notify("notusablejoiningplayers");
  self endon("death");
  level endon("game_ended");
  var_0 endon("disconnect");
  var_0 endon("death");
  self endon("notusablejoiningplayers");

  for (;;) {
  level waittill("player_spawned", var_1);

  if (isdefined(var_1) && var_1 != var_0)
    self disableplayeruse(var_1);
  }
}

_id_F838(var_0) {
  self makeusable();

  foreach (var_2 in level.players) {
  if (var_2 != var_0) {
    self disableplayeruse(var_2);
    continue;
  }

  self enableplayeruse(var_2);
  }
}

_id_9DE2(var_0) {
  if (!isdefined(var_0))
  return 0;

  if (var_0 == "turret_minigun_mp")
  return 1;

  return 0;
}

_id_9F8D(var_0) {
  if (!isdefined(var_0))
  return 0;

  if (isdefined(level._id_112A9) && isdefined(level._id_112A9[var_0]))
  return 1;

  return 0;
}

_id_11150(var_0, var_1) {
  if (var_0.size <= var_1.size)
  return var_0;

  if (getsubstr(var_0, var_0.size - var_1.size, var_0.size) == var_1)
  return getsubstr(var_0, 0, var_0.size - var_1.size);

  return var_0;
}

_id_D548(var_0, var_1, var_2, var_3, var_4, var_5) {
  var_6 = undefined;

  if (self.team != var_0)
  var_6 = spawnfxforclient(scripts\engine\utility::_id_7ECB(var_3), var_1, self);
  else
  var_6 = spawnfxforclient(scripts\engine\utility::_id_7ECB(var_2), var_1, self);

  if (isdefined(var_6))
  triggerfx(var_6);

  var_6 thread _id_5106(var_4);

  if (isdefined(var_5) && var_5)
  var_6 thread _id_51C7(self);

  return var_6;
}

_id_5106(var_0) {
  self endon("death");
  wait(var_0);

  if (isdefined(self))
  self delete();
}

_id_51C7(var_0) {
  self endon("death");
  var_0 scripts\engine\utility::waittill_any("death", "disconnect");
  self delete();
}

_id_9F7C(var_0, var_1) {
  return getsubstr(var_0, 0, var_1.size) == var_1;
}

isreallyalive(var_0) {
  if (isalive(var_0) && !isdefined(var_0.fauxdeath))
  return 1;

  return 0;
}

_id_7DF7(var_0) {
  var_1 = strtok(var_0, "_");

  if (var_1[0] == "iw5" || var_1[0] == "iw6" || var_1[0] == "iw7")
  var_0 = var_1[0] + "_" + var_1[1];
  else if (var_1[0] == "alt")
  var_0 = var_1[1] + "_" + var_1[2];

  return var_0;
}

_id_824F(var_0, var_1) {
  var_2 = strtok(var_0, "_");

  if (var_2[0] == "iw5" || var_2[0] == "iw6" || var_2[0] == "iw7") {
  if (isdefined(var_1) && var_1 > 1)
    var_0 = var_2[0] + "_z" + var_2[1] + var_1;
  else
    var_0 = var_2[0] + "_z" + var_2[1];
  }
  else if (var_2[0] == "alt") {
  if (isdefined(var_1) && var_1 > 1)
    var_0 = var_2[1] + "_z" + var_2[2] + var_1;
  else
    var_0 = var_2[1] + "_z" + var_2[2];
  }

  return var_0;
}

_id_78B4(var_0) {
  var_1 = sortbydistance(level._id_13D59, var_0);

  foreach (var_3 in var_1) {
  if (var_3._id_6261)
    return var_3;
  }

  return undefined;
}

_id_664F(var_0) {
  if (!isdefined(var_0._id_284D))
  return 1;

  var_1 = _id_0D4D::_id_7B13(var_0);

  if (!isdefined(var_1))
  return 1;

  return 0;
}

_id_9D18() {
  return scripts\engine\utility::_id_9CEE(level._id_13C41);
}

_id_783C(var_0) {
  var_1 = var_0._id_0195._id_01F1;
  var_2 = "arkblue";
  var_3 = "stun_ammo";

  switch (var_1) {
  case "attachment_zmb_arcane_muzzlebrake_wm":
    var_2 = "arcane_base";
    break;
  default:
    break;
  }

  return var_2;
}

_id_212D() {
  foreach (var_2, var_1 in self._id_456B) {
  if (var_1._id_C4A4 == 1)
    return 1;
  }

  return 0;
}

_id_80D8(var_0) {
  var_1 = strtok(var_0, "_");

  if (var_1[0] == "iw5" || var_1[0] == "iw6" || var_1[0] == "iw7")
  var_0 = var_1[1];
  else if (var_1[0] == "alt")
  var_0 = var_1[2];

  return var_0;
}

_id_7F1D(var_0, var_1) {
  var_2 = var_1;
  var_2 = getdvarint(var_0, var_1);
  return var_2;
}

leaderdialogonplayer(var_0, var_1, var_2, var_3) {
  if (!isdefined(game["dialog"][var_0]))
  return;

  var_4 = self.pers["team"];

  if (isdefined(var_4) && (var_4 == "axis" || var_4 == "allies")) {
  var_5 = game["voice"][var_4] + game["dialog"][var_0];
  self _meth_8252(var_5, var_0, 2, var_1, var_2, var_3);
  }
}

_id_13CB(var_0, var_1, var_2) {
  self._id_EB6A[var_0].type = var_1;
  self._id_EB6A[var_0]._id_0195 = var_2;
  self _meth_8299(var_0, var_1, var_2);
}

_id_7F55(var_0) {
  return tablelookup(level._id_83DC["killstreakTable"]._id_C94F, level._id_83DC["killstreakTable"]._id_DE40, var_0, level._id_83DC["killstreakTable"]._id_13C09);
}

_id_135A(var_0) {
  objective_delete(var_0);

  if (!isdefined(level._id_DDDA)) {
  level._id_DDDA = [];
  level._id_DDDA[0] = var_0;
  }
  else
  level._id_DDDA[level._id_DDDA.size] = var_0;
}

_id_11A42(var_0) {
  var_1 = getentarray("trigger_hurt", "classname");

  foreach (var_3 in var_1) {
  if (self istouching(var_3) && (level._id_B335 != "mp_mine" || var_3._id_00F5 > 0))
    return 1;
  }

  var_5 = getentarray("radiation", "targetname");

  foreach (var_3 in var_5) {
  if (self istouching(var_3))
    return 1;
  }

  if (isdefined(var_0) && var_0 == "gryphon") {
  var_8 = getentarray("gryphonDeath", "targetname");

  foreach (var_3 in var_8) {
    if (self istouching(var_3))
    return 1;
  }
  }

  return 0;
}

_id_D52A(var_0, var_1, var_2) {
  if (isdefined(var_0)) {
  if (isarray(var_0))
    var_0 = scripts\engine\utility::_id_DC6B(var_0);

  var_3 = lookupsoundlength(var_0);
  playloopsound(var_1, var_0);

  if (isdefined(var_2))
    wait(var_3 / 1000);

  return var_3;
  }
}

_id_CDD8(var_0, var_1, var_2) {
  if (isdefined(var_0)) {
  if (!isarray(var_0)) {
    var_3 = [];
    var_3[0] = var_0;
    var_0 = var_3[0];
  }

  var_4 = scripts\engine\utility::_id_DC6B(var_0);
  var_5 = lookupsoundlength(var_4);
  playloopsound(var_1, var_4);

  if (isdefined(var_2))
    wait(var_5);

  return var_5;
  }
}

_id_CD85(var_0) {
  if (soundexists(var_0))
  self playloopsound(var_0);
}

_id_11019(var_0) {
  if (soundexists(var_0))
  self stoploopsound(var_0);
}

_id_CF16() {
  var_0 = randomintrange(1, 8);
  var_1 = "generic";

  if (self _meth_817F())
  var_1 = "female";

  if (self.team == "axis") {
  var_2 = var_1 + "_death_russian_" + var_0;

  if (soundexists(var_2))
    self playsound(var_2);
  } else {
  var_2 = var_1 + "_death_american_" + var_0;

  if (soundexists(var_2))
    self playsound(var_2);
  }
}

_id_9DFF(var_0, var_1, var_2) {
  return isdefined(var_2) && var_2 _id_12D6("specialty_bulletpenetration") && isdefined(var_1) && scripts\engine\utility::_id_9D74(var_1);
}

_id_9D85() {
  return isdefined(self._id_3C64);
}

_id_7DE1(var_0) {
  if (!isdefined(var_0))
  return "none";

  var_1 = tablelookup("mp/attachmentTable.csv", 4, var_0, 2);

  if (!isdefined(var_1) || isdefined(var_1) && var_1 == "") {
  var_2 = getdvar("g_gametype");

  if (var_2 == "zombie")
    var_1 = tablelookup("cp/zombies/zombie_attachmentTable.csv", 4, var_0, 2);
  }

  return var_1;
}

_id_13C90(var_0, var_1) {
  if (!isdefined(var_0) || var_0 == "none" || var_0 == "")
  return 0;

  var_2 = _id_821A(var_0);

  foreach (var_4 in var_2) {
  if (var_4 == var_1)
    return 1;
  }

  return 0;
}

_id_821A(var_0) {
  var_1 = getweaponattachments(var_0);

  foreach (var_4, var_3 in var_1)
  var_1[var_4] = _id_2494(var_3);

  return var_1;
}

_id_2494(var_0) {
  if (isdefined(level._id_2497[var_0]))
  var_0 = level._id_2497[var_0];

  return var_0;
}

bot_is_fireteam_mode() {
  var_0 = botautoconnectenabled() == 2;

  if (var_0) {
  if (!level.teambased || level.gametype != "war" && level.gametype != "dom")
    return 0;

  return 1;
  }

  return 0;
}

isjuggernaut() {
  if (isdefined(self.isjuggernaut) && self.isjuggernaut == 1)
  return 1;

  if (isdefined(self._id_9E5A) && self._id_9E5A == 1)
  return 1;

  if (isdefined(self._id_9E5B) && self._id_9E5B == 1)
  return 1;

  if (isdefined(self._id_9E5E) && self._id_9E5E == 1)
  return 1;

  if (isdefined(self._id_9E5D) && self._id_9E5D == 1)
  return 1;

  if (isdefined(self._id_9E5C) && self._id_9E5C == 1)
  return 1;

  return 0;
}

_id_2496(var_0, var_1) {
  var_2 = _id_8234(var_1);

  if (var_2 != var_1) {
  var_3 = getweaponbasename(var_1);
  var_4 = strtok(var_3, "_");
  var_5 = "mp" + getsubstr(var_4[2], 2, var_4[2].size);
  var_6 = var_4[0];

  for (var_7 = 1; var_7 < var_4.size; var_7++) {
    if (var_7 == 2) {
    var_6 = var_6 + ("_" + var_5);
    continue;
    }

    var_6 = var_6 + ("_" + var_4[var_7]);
  }

  if (isdefined(level._id_2492[var_3]) && isdefined(level._id_2497[var_0]) && isdefined(level._id_2492[var_3][level._id_2497[var_0]])) {
    var_8 = level._id_2497[var_0];
    return level._id_2492[var_3][var_8];
  }
  else if (isdefined(level._id_2492[var_6]) && isdefined(level._id_2497[var_0]) && isdefined(level._id_2492[var_6][level._id_2497[var_0]])) {
    var_8 = level._id_2497[var_0];
    return level._id_2492[var_6][var_8];
  }
  else if (isdefined(level._id_2492[var_3]) && isdefined(level._id_2492[var_3][var_0]))
    return level._id_2492[var_3][var_0];
  else if (isdefined(level._id_2492[var_6]) && isdefined(level._id_2492[var_6][var_0]))
    return level._id_2492[var_6][var_0];
  else if (var_4.size > 3) {
    var_9 = var_4[0] + "_" + var_4[1] + "_" + var_4[2];

    if (isdefined(level._id_2492[var_9]) && isdefined(level._id_2492[var_9][var_0]))
    return level._id_2492[var_9][var_0];
    else
    {
    var_10 = strtok(var_6, "_");
    var_11 = var_10[0] + "_" + var_10[1] + "_" + var_10[2];

    if (isdefined(level._id_2492[var_11]) && isdefined(level._id_2492[var_11][var_0]))
      return level._id_2492[var_11][var_0];
    }
  }
  }

  if (isdefined(level._id_2492[var_2]) && isdefined(level._id_2492[var_2][var_0]))
  return level._id_2492[var_2][var_0];
  else
  {
  var_12 = _id_13C8F(var_2);

  if (isdefined(var_12) && isdefined(level._id_2492[var_12]) && isdefined(level._id_2492[var_12][var_0]))
    return level._id_2492[var_12][var_0];
  }

  return var_0;
}

_id_13C8F(var_0) {
  if (isdefined(level._id_13CA5[var_0]) && isdefined(level._id_13CA5[var_0]._id_8677))
  return level._id_13CA5[var_0]._id_8677;

  return undefined;
}

_id_9E6C(var_0) {
  if (!isdefined(var_0))
  return 0;

  if (var_0 == "none")
  return 0;

  if (scripts\engine\utility::_id_9DC1(var_0))
  return 0;

  if (issubstr(var_0, "killstreak"))
  return 1;

  if (issubstr(var_0, "remote_tank_projectile"))
  return 1;

  if (issubstr(var_0, "minijackal_"))
  return 1;

  if (isdefined(level._id_A6C5) && isdefined(level._id_A6C5[var_0]))
  return 1;

  if (scripts\engine\utility::_id_9D33(var_0))
  return 1;

  var_1 = weaponinventorytype(var_0);

  if (isdefined(var_1) && var_1 == "exclusive")
  return 1;

  return 0;
}

_id_41E9() {
  if (isdefined(self._id_3AF5))
  self._id_3AF5.alpha = 1;

  self._id_13118 = undefined;

  if (!scripts\engine\utility::_id_9EC1())
  scripts\engine\utility::_id_1C58(1);

  var_0 = self getcurrentweapon();

  if (var_0 == "none" || _id_9E6C(var_0)) {
  var_1 = scripts\engine\utility::_id_7F62();

  if (isreallyalive(self)) {
    if (!self hasweapon(var_1))
    var_1 = _id_7EB7();

    self _meth_83B5(var_1);
  }
  }

  _id_7385(0);
  self notify("stopped_using_remote");
}

_id_7EB7() {
  var_0 = self getweaponslistprimaries();
  return var_0[0];
}

_id_F607(var_0, var_1, var_2, var_3, var_4, var_5) {
  var_6 = _id_7BC3(var_4, var_5);

  foreach (var_8 in var_6) {
  var_8 notify("changing_watching_visionset");

  if (isdefined(var_3) && var_3)
    var_8 _meth_83F9(var_0, var_1);
  else
    var_8 visionsetnakedforplayer(var_0, var_1);

  if (var_0 != "" && isdefined(var_2)) {
    var_8 thread _id_E23F(self, var_1 + var_2);
    var_8 thread _id_E23D(self);

    if (var_8 _id_9E4A())
    var_8 thread _id_E23E();
  }
  }
}

_id_7BC3(var_0, var_1) {
  if (!isdefined(var_0))
  var_0 = 0;

  if (!isdefined(var_1))
  var_1 = 0;

  var_2 = self getentitynumber();
  var_3 = [];

  foreach (var_5 in level.players) {
  if (var_5 == self)
    continue;

  var_6 = 0;

  if (!var_1) {
    if (var_5.team == "spectator" || var_5.sessionstate == "spectator") {
    var_7 = var_5 getspectatingplayer();

    if (isdefined(var_7) && var_7 == self)
      var_6 = 1;
    }

    if (var_5._id_0140 == var_2)
    var_6 = 1;
  }

  if (!var_0) {
    if (var_5._id_01A9 == var_2)
    var_6 = 1;
  }

  if (var_6)
    var_3[var_3.size] = var_5;
  }

  return var_3;
}

_id_E23F(var_0, var_1) {
  self endon("changing_watching_visionset");
  var_2 = gettime();
  var_3 = self.team;

  while (gettime() - var_2 < var_1 * 1000) {
  if (self.team != var_3 || !scripts\engine\utility::array_contains(var_0 _id_7BC3(), self)) {
    self visionsetnakedforplayer("", 0.0);
    self notify("changing_visionset");
    break;
  }

  wait 0.05;
  }
}

_id_E23D(var_0) {
  self endon("changing_watching_visionset");
  var_0 waittill("disconnect");

  if (isdefined(level._id_13445))
  self visionsetnakedforplayer(level._id_13445, 0.0);
  else
  self visionsetnakedforplayer("", 0.0);
}

_id_E23E() {
  self endon("disconnect");
  self waittill("spawned");

  if (isdefined(level._id_13445))
  self visionsetnakedforplayer(level._id_13445, 0.0);
  else
  self visionsetnakedforplayer("", 0.0);
}

_id_9E4A() {
  return self._id_02B0;
}

_id_F6DB(var_0, var_1, var_2) {
  if (!isdefined(level._id_4542) || !isdefined(level._id_13E0E) || !isdefined(level._id_DADC))
  _id_F305();

  if (_id_9BEE())
  setdvar(var_0, var_2);
  else
  setdvar(var_0, var_1);
}

_id_9BEE() {
  if (level._id_13E0E || level._id_DADC || !level._id_4542)
  return 1;
  else
  return 0;
}

_id_49B2(var_0, var_1, var_2) {
  if (!isdefined(var_2) || !var_2)
  var_3 = newclienthudelem(self);
  else
  var_3 = newhudelem();

  var_3._id_601F = "font";
  var_3._id_013A = var_0;
  var_3._id_013B = var_1;
  var_3._id_289F = var_1;
  var_3.x = 0;
  var_3.y = 0;
  var_3._id_039F = 0;
  var_3.height = int(level._id_724F * var_1);
  var_3._id_13E19 = 0;
  var_3._id_13E5A = 0;
  var_3._id_3E67 = [];
  var_3 _id_F7D6(level._id_12B29);
  var_3._id_8E5A = 0;
  return var_3;
}

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

_id_E0DD(var_0) {
  var_0._id_C8F2 = undefined;

  if (self._id_3E67[self._id_3E67.size - 1] != var_0) {
  self._id_3E67[var_0.index] = self._id_3E67[self._id_3E67.size - 1];
  self._id_3E67[var_0.index].index = var_0.index;
  }

  self._id_3E67[self._id_3E67.size - 1] = undefined;
  var_0.index = undefined;
}

_id_17BC(var_0) {
  var_0.index = self._id_3E67.size;
  self._id_3E67[self._id_3E67.size] = var_0;
  _id_E0EB();
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
  var_6 = "center_adjustable";
  var_7 = "middle";

  if (issubstr(var_1, "TOP"))
  var_7 = "top_adjustable";

  if (issubstr(var_1, "BOTTOM"))
  var_7 = "bottom_adjustable";

  if (issubstr(var_1, "LEFT"))
  var_6 = "left_adjustable";

  if (issubstr(var_1, "RIGHT"))
  var_6 = "right_adjustable";

  if (var_5 == level._id_12B29) {
  self._id_017D = var_6;
  self._id_0382 = var_7;
  } else {
  self._id_017D = var_5._id_017D;
  self._id_0382 = var_5._id_0382;
  }

  if (_id_11150(var_6, "_adjustable") == var_5._id_002B) {
  var_8 = 0;
  var_9 = 0;
  }
  else if (var_6 == "center" || var_5._id_002B == "center") {
  var_8 = int(var_5._id_039F / 2);

  if (var_6 == "left_adjustable" || var_5._id_002B == "right")
    var_9 = -1;
  else
    var_9 = 1;
  } else {
  var_8 = var_5._id_039F;

  if (var_6 == "left_adjustable")
    var_9 = -1;
  else
    var_9 = 1;
  }

  self.x = var_5.x + var_8 * var_9;

  if (_id_11150(var_7, "_adjustable") == var_5._id_002C) {
  var_10 = 0;
  var_11 = 0;
  }
  else if (var_7 == "middle" || var_5._id_002C == "middle") {
  var_10 = int(var_5.height / 2);

  if (var_7 == "top_adjustable" || var_5._id_002C == "bottom")
    var_11 = -1;
  else
    var_11 = 1;
  } else {
  var_10 = var_5.height;

  if (var_7 == "top_adjustable")
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

  _id_12E74();
}

_id_8045() {
  return self._id_C8F2;
}

_id_F802(var_0, var_1, var_2, var_3) {
  self._id_2812._id_017D = self._id_017D;
  self._id_2812._id_0382 = self._id_0382;
  self._id_2812._id_002B = "left";
  self._id_2812._id_002C = self._id_002C;
  self._id_2812.y = self.y;

  if (self._id_002B == "left")
  self._id_2812.x = self.x;
  else if (self._id_002B == "right")
  self._id_2812.x = self.x - self._id_039F;
  else
  self._id_2812.x = self.x - int(self._id_039F / 2);

  if (self._id_002C == "top")
  self._id_2812.y = self.y;
  else if (self._id_002C == "bottom")
  self._id_2812.y = self.y;

  _id_12E63(self._id_2812._id_7349);
}

_id_12E63(var_0, var_1) {
  if (self._id_601F == "bar")
  _id_12E64(var_0, var_1);
}

_id_12E64(var_0, var_1) {
  var_2 = int(self._id_039F * var_0 + 0.5);

  if (!var_2)
  var_2 = 1;

  self._id_2812._id_7349 = var_0;
  self._id_2812 setshader(self._id_2812._id_FC44, var_2, self.height);

  if (isdefined(var_1) && var_2 < self._id_039F) {
  if (var_1 > 0)
    self._id_2812 _meth_8276((1 - var_0) / var_1, self._id_039F, self.height);
  else if (var_1 < 0)
    self._id_2812 _meth_8276(var_0 / (-1 * var_1), 1, self.height);
  }

  self._id_2812._id_DCE7 = var_1;
  self._id_2812._id_AA36 = gettime();
}

_id_12E74() {
  for (var_0 = 0; var_0 < self._id_3E67.size; var_0++) {
  var_1 = self._id_3E67[var_0];
  var_1 _id_F801(var_1._id_0244, var_1._id_DF31, var_1._id_13E19, var_1._id_13E5A);
  }
}

_id_49D9(var_0, var_1, var_2, var_3) {
  if (!isdefined(var_3))
  var_4 = newclienthudelem(self);
  else
  var_4 = newhudelem();

  var_4._id_601F = "icon";
  var_4.x = 0;
  var_4.y = 0;
  var_4._id_039F = var_1;
  var_4.height = var_2;
  var_4._id_28B0 = var_4._id_039F;
  var_4._id_28A2 = var_4.height;
  var_4._id_13E19 = 0;
  var_4._id_13E5A = 0;
  var_4._id_3E67 = [];
  var_4 _id_F7D6(level._id_12B29);
  var_4._id_8E5A = 0;

  if (isdefined(var_0)) {
  var_4 setshader(var_0, var_1, var_2);
  var_4._id_FC44 = var_0;
  }

  return var_4;
}

_id_52DC() {
  var_0 = [];

  for (var_1 = 0; var_1 < self._id_3E67.size; var_1++) {
  if (isdefined(self._id_3E67[var_1]))
    var_0[var_0.size] = self._id_3E67[var_1];
  }

  for (var_1 = 0; var_1 < var_0.size; var_1++)
  var_0[var_1] _id_F7D6(_id_8045());

  if (self._id_601F == "bar" || self._id_601F == "bar_shader")
  self._id_2812 destroy();

  self destroy();
}

_id_1011F() {
  if (!self._id_8E5A)
  return;

  self._id_8E5A = 0;

  if (self._id_601F == "bar" || self._id_601F == "bar_shader") {
  if (self.alpha != 0.5)
    self.alpha = 0.5;

  self._id_2812._id_8E5A = 0;

  if (self._id_2812.alpha != 1)
    self._id_2812.alpha = 1;
  }
  else if (self.alpha != 1)
  self.alpha = 1;
}

_id_8EBD() {
  if (self._id_8E5A)
  return;

  self._id_8E5A = 1;

  if (self.alpha != 0)
  self.alpha = 0;

  if (self._id_601F == "bar" || self._id_601F == "bar_shader") {
  self._id_2812._id_8E5A = 1;

  if (self._id_2812.alpha != 0)
    self._id_2812.alpha = 0;
  }
}

_id_4A03(var_0, var_1, var_2, var_3) {
  if (isagent(self))
  return undefined;

  if (!isdefined(var_0))
  var_0 = 0;

  if (!isdefined(var_1))
  var_1 = -25;

  if (self issplitscreenplayer())
  var_1 = var_1 + 20;

  var_4 = level._id_D8D8;
  var_5 = "default";

  if (isdefined(var_2))
  var_4 = var_2;

  if (isdefined(var_3))
  var_5 = var_3;

  var_6 = _id_49B2(var_5, var_4);
  var_6 _id_F801("CENTER", undefined, level._id_D8DA + var_0, level._id_D8DB + var_1);
  var_6._id_02A4 = -1;
  return var_6;
}

_id_4A02(var_0, var_1, var_2, var_3) {
  if (isagent(self))
  return undefined;

  if (!isdefined(var_0))
  var_0 = 0;

  if (!isdefined(var_1))
  var_1 = -25;

  if (self issplitscreenplayer())
  var_1 = var_1 + 20;

  if (!isdefined(var_2))
  var_2 = level._id_D8DC;

  if (!isdefined(var_3))
  var_3 = level._id_D8D9;

  var_4 = _id_4987((1, 1, 1), var_2, var_3);
  var_4 _id_F801("CENTER", undefined, level._id_D8DD + var_0, level._id_D8DE + var_1);
  return var_4;
}

_id_4987(var_0, var_1, var_2, var_3) {
  var_4 = newclienthudelem(self);
  var_4.x = 0;
  var_4.y = 0;
  var_4._id_7349 = 0;
  var_4._id_00B9 = var_0;
  var_4._id_02A4 = -2;
  var_4._id_FC44 = "progress_bar_fill";
  var_4 setshader("progress_bar_fill", var_1, var_2);
  var_4._id_8E5A = 0;

  if (isdefined(var_3))
  var_4._id_6ECC = var_3;

  var_5 = newclienthudelem(self);
  var_5._id_601F = "bar";
  var_5._id_039F = var_1;
  var_5.height = var_2;
  var_5._id_13E19 = 0;
  var_5._id_13E5A = 0;
  var_5._id_2812 = var_4;
  var_5._id_3E67 = [];
  var_5._id_02A4 = -3;
  var_5._id_00B9 = (0, 0, 0);
  var_5.alpha = 0.5;
  var_5 _id_F7D6(level._id_12B29);
  var_5 setshader("progress_bar_bg", var_1 + 4, var_2 + 4);
  var_5._id_8E5A = 0;
  return var_5;
}

_id_9E0E(var_0) {
  if (isaigameparticipant(var_0))
  return 1;

  if (isplayer(var_0))
  return 1;

  return 0;
}

isaigameparticipant(var_0) {
  if (isagent(var_0) && isdefined(var_0._id_18F2) && var_0._id_18F2 == 1)
  return 1;

  if (isbot(var_0))
  return 1;

  return 0;
}

_id_F877(var_0, var_1) {
  if (!level.teambased)
  return;

  if (!isdefined(self._id_6648)) {
  self._id_6648 = "none";
  self._id_6644 = undefined;
  }

  var_2 = game["entity_headicon_" + var_0];
  self._id_6648 = var_0;

  if (isdefined(var_1))
  self._id_6645 = var_1;
  else
  self._id_6645 = (0, 0, 0);

  self notify("kill_entity_headicon_thread");

  if (var_0 == "none") {
  if (isdefined(self._id_6644))
    self._id_6644 destroy();

  return;
  }

  var_3 = newteamhudelem(var_0);
  var_3._id_0049 = 1;
  var_3.x = self.origin[0] + self._id_6645[0];
  var_3.y = self.origin[1] + self._id_6645[1];
  var_3.z = self.origin[2] + self._id_6645[2];
  var_3.alpha = 0.8;
  var_3 setshader(var_2, 10, 10);
  var_3 setwaypoint(0, 0, 0, 1);
  self._id_6644 = var_3;
  thread _id_A578();
  thread _id_531E();
}

_id_F7F2(var_0, var_1) {
  if (level.teambased)
  return;

  if (!isdefined(self._id_6648)) {
  self._id_6648 = "none";
  self._id_6644 = undefined;
  }

  self notify("kill_entity_headicon_thread");

  if (!isdefined(var_0)) {
  if (isdefined(self._id_6644))
    self._id_6644 destroy();

  return;
  }

  var_2 = var_0.team;
  self._id_6648 = var_2;

  if (isdefined(var_1))
  self._id_6645 = var_1;
  else
  self._id_6645 = (0, 0, 0);

  var_3 = game["entity_headicon_" + var_2];
  var_4 = newclienthudelem(var_0);
  var_4._id_0049 = 1;
  var_4.x = self.origin[0] + self._id_6645[0];
  var_4.y = self.origin[1] + self._id_6645[1];
  var_4.z = self.origin[2] + self._id_6645[2];
  var_4.alpha = 0.8;
  var_4 setshader(var_3, 10, 10);
  var_4 setwaypoint(0, 0, 0, 1);
  self._id_6644 = var_4;
  thread _id_A578();
  thread _id_531E();
}

_id_A578() {
  self._id_6644 _meth_81E5(self, self._id_6645);
}

_id_531E() {
  self endon("kill_entity_headicon_thread");
  self waittill("death");

  if (!isdefined(self._id_6644))
  return;

  self._id_6644 destroy();
}

_id_F73D(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10) {
  if (_id_9E0E(var_0) && !isplayer(var_0))
  return;

  if (!isdefined(self._id_6647))
  self._id_6647 = [];

  if (!isdefined(var_5))
  var_5 = 1;

  if (!isdefined(var_6))
  var_6 = 0.05;

  if (!isdefined(var_7))
  var_7 = 1;

  if (!isdefined(var_8))
  var_8 = 1;

  if (!isdefined(var_9))
  var_9 = 0;

  if (!isdefined(var_10))
  var_10 = 1;

  if (!isplayer(var_0) && var_0 == "none") {
  foreach (var_13, var_12 in self._id_6647) {
    if (isdefined(var_12))
    var_12 destroy();

    self._id_6647[var_13] = undefined;
  }
  } else {
  if (isplayer(var_0)) {
    if (isdefined(self._id_6647[var_0.guid])) {
    self._id_6647[var_0.guid] destroy();
    self._id_6647[var_0.guid] = undefined;
    }

    if (var_1 == "")
    return;

    if (isdefined(var_0.team)) {
    if (isdefined(self._id_6647[var_0.team])) {
      self._id_6647[var_0.team] destroy();
      self._id_6647[var_0.team] = undefined;
    }
    }

    var_12 = newclienthudelem(var_0);
    self._id_6647[var_0.guid] = var_12;
  } else {
    if (isdefined(self._id_6647[var_0])) {
    self._id_6647[var_0] destroy();
    self._id_6647[var_0] = undefined;
    }

    if (var_1 == "")
    return;

    foreach (var_13, var_15 in self._id_6647) {
    if (var_13 == "axis" || var_13 == "allies")
      continue;

    var_16 = _id_8071(var_13);

    if (var_16.team == var_0) {
      self._id_6647[var_13] destroy();
      self._id_6647[var_13] = undefined;
    }
    }

    var_12 = newteamhudelem(var_0);
    self._id_6647[var_0] = var_12;
  }

  if (!isdefined(var_3) || !isdefined(var_4)) {
    var_3 = 10;
    var_4 = 10;
  }

  var_12._id_0049 = var_5;
  var_12.x = self.origin[0] + var_2[0];
  var_12.y = self.origin[1] + var_2[1];
  var_12.z = self.origin[2] + var_2[2];
  var_12.alpha = 0.85;
  var_12 setshader(var_1, var_3, var_4);
  var_12 setwaypoint(var_7, var_8, var_9, var_10);
  var_12 thread _id_A57C(self, var_2, var_6);
  thread _id_531F();

  if (isplayer(var_0))
    var_12 thread _id_5320(var_0);

  if (isplayer(self))
    var_12 thread _id_5320(self);
  }
}

_id_1012C(var_0) {
  foreach (var_2 in var_0) {
  if (isdefined(var_2))
    var_2.alpha = 0.85;
  }
}

_id_8EC2(var_0) {
  foreach (var_2 in var_0) {
  if (isdefined(var_2))
    var_2.alpha = 0;
  }
}

_id_8071(var_0) {
  foreach (var_2 in level.players) {
  if (var_2.guid == var_0)
    return var_2;
  }

  return undefined;
}

_id_A57C(var_0, var_1, var_2) {
  self endon("death");
  var_0 endon("death");
  var_0 endon("disconnect");
  var_3 = isdefined(var_0.classname) && !_id_9ED0(var_0);

  if (var_3)
  self _meth_81E5(var_0, var_1);

  for (;;) {
  if (!isdefined(var_0))
    return;

  if (!var_3) {
    var_4 = var_0.origin;
    self.x = var_4[0] + var_1[0];
    self.y = var_4[1] + var_1[1];
    self.z = var_4[2] + var_1[2];
  }

  if (var_2 > 0.05) {
    self.alpha = 0.85;
    self fadeovertime(var_2);
    self.alpha = 0;
  }

  wait(var_2);
  }
}

_id_9ED0(var_0) {
  return isdefined(var_0._id_0336) && var_0._id_0336 == "care_package";
}

_id_531F() {
  self notify("destroyIconsOnDeath");
  self endon("destroyIconsOnDeath");
  self waittill("death");

  if (!isdefined(self._id_6647))
  return;

  foreach (var_2, var_1 in self._id_6647) {
  if (!isdefined(var_1))
    continue;

  var_1 destroy();
  }
}

_id_5320(var_0) {
  self endon("death");
  var_0 waittill("disconnect");
  self destroy();
}

_id_1417() {
  if (!isusingremote() && !isdefined(self.fauxdeath))
  self suicide();
}

_id_D1EB(var_0, var_1, var_2, var_3, var_4, var_5) {
  var_6 = _id_B0F9(var_0, var_1, var_2, var_3, var_4, var_5);
  return var_6;
}

_id_B0F9(var_0, var_1, var_2, var_3, var_4, var_5) {
  self._id_4B30 = 0;
  self._id_9B04 = 1;
  self._id_130C7 = 1;
  self._id_130EE = var_1;
  var_0 thread _id_4919(self, var_3);
  var_0._id_8C18 = 1;
  var_6 = _id_B0FA(var_0, self, var_2, var_4, var_5);

  if (isalive(var_0))
  var_0._id_8C18 = 0;

  if (!isdefined(self))
  return 0;

  self._id_9B04 = 0;
  self._id_4B30 = 0;
  return var_6;
}

_id_4919(var_0, var_1) {
  self endon("disconnect");
  self setclientomnvar("ui_securing", var_1);
  var_2 = -1;

  while (isreallyalive(self) && isdefined(var_0) && var_0._id_9B04 && !level._id_7669) {
  if (var_2 != var_0._id_130C7) {
    if (var_0._id_4B30 > var_0._id_130EE)
    var_0._id_4B30 = var_0._id_130EE;
  }

  var_2 = var_0._id_130C7;
  self setclientomnvar("ui_securing_progress", var_0._id_4B30 / var_0._id_130EE);
  wait 0.05;
  }

  wait 0.5;
  self setclientomnvar("ui_securing_progress", 0);
  self setclientomnvar("ui_securing", 0);
}

_id_B0FA(var_0, var_1, var_2, var_3, var_4) {
  while (!level._id_7669 && isdefined(self) && isreallyalive(var_0) && (var_0 usebuttonpressed() || isdefined(var_3) || var_0 attackbuttonpressed() && isdefined(var_4)) && _id_FF22(var_0)) {
  wait 0.05;

  if (isdefined(var_1) && isdefined(var_2)) {
    if (distancesquared(var_0.origin, var_1.origin) > var_2)
    return 0;
  }

  self._id_4B30 = self._id_4B30 + 50 * self._id_130C7;
  self._id_130C7 = 1;

  if (self._id_4B30 >= self._id_130EE) {
    var_0 setclientomnvar("ui_securing_progress", 1);
    return isreallyalive(var_0);
  }
  }

  return 0;
}

_id_FF22(var_0) {
  if (isdefined(level._id_FF22))
  return [[level._id_FF22]](var_0);
  else if (scripts\engine\utility::_id_9CEE(var_0._id_9387))
  return 1;
  else
  return !_id_0A5B::_id_D0EF(var_0);
}

_id_9F02() {
  if (getmaxclients() == 1)
  return 1;

  return 0;
}

_id_E113() {
  var_0 = 0;

  for (var_1 = 0; var_1 < level._id_C928.size; var_1++) {
  if (level._id_C928[var_1] == self) {
    for (var_0 = 1; var_1 < level._id_C928.size - 1; var_1++)
    level._id_C928[var_1] = level._id_C928[var_1 + 1];

    level._id_C928[var_1] = undefined;
    break;
  }
  }
}

_id_E106() {
  var_0 = 0;

  for (var_1 = 0; var_1 < level._id_3CB5.size; var_1++) {
  if (level._id_3CB5[var_1] == self) {
    for (var_0 = 1; var_1 < level._id_3CB5.size - 1; var_1++)
    level._id_3CB5[var_1] = level._id_3CB5[var_1 + 1];

    level._id_3CB5[var_1] = undefined;
    break;
  }
  }
}

_id_E119() {
  if (isdefined(self._id_8696)) {
  if (isdefined(level._id_10851) && isdefined(level._id_10851[self._id_8696]))
    level._id_10851[self._id_8696] = scripts\engine\utility::array_remove(level._id_10851[self._id_8696], self);
  }
}

_id_4A27(var_0, var_1) {
  var_2 = newclienthudelem(self);
  var_2._id_601F = "timer";
  var_2._id_013A = var_0;
  var_2._id_013B = var_1;
  var_2._id_289F = var_1;
  var_2.x = 0;
  var_2.y = 0;
  var_2._id_039F = 0;
  var_2.height = int(level._id_724F * var_1);
  var_2._id_13E19 = 0;
  var_2._id_13E5A = 0;
  var_2._id_3E67 = [];
  var_2 _id_F7D6(level._id_12B29);
  var_2._id_8E5A = 0;
  return var_2;
}

_id_11D7() {
  self detachall();
}

_id_9D04(var_0) {
  var_1 = getarraykeys(level._id_1B8E["perk_0"]);

  if (scripts\engine\utility::array_contains(var_1, var_0))
  return 1;

  var_2 = getarraykeys(level._id_1B8E["perk_1"]);

  if (scripts\engine\utility::array_contains(var_2, var_0))
  return 1;

  var_3 = getarraykeys(level._id_1B8E["perk_2"]);
  return scripts\engine\utility::array_contains(var_3, var_0);
}

_id_9BA0(var_0) {
  if (isdefined(self._id_456B) && isdefined(self._id_456B[var_0]) && isdefined(self._id_456B[var_0]._id_C4A4) && self._id_456B[var_0]._id_C4A4 == 1)
  return 1;
  else
  return 0;
}

_id_C151(var_0) {
  self notify(self._id_456B[var_0]._id_1307B);
}

_id_C150(var_0) {
  self notify(level._id_456B[var_0]._id_1193C);
}

_id_5B7A(var_0, var_1, var_2, var_3) {
  var_4 = int(var_2 * 20);

  for (var_5 = 0; var_5 < var_4; var_5++)
  wait 0.05;
}

_id_9CF3(var_0) {
  if (!_id_9CF9())
  return 0;

  if (self getrankedplayerdata("cp", "upgrades_enabled_flags", var_0))
  return 1;
  else
  return 0;
}

_id_1C5E(var_0, var_1) {
  if (var_0) {
  if (!isdefined(self._id_11658) && isdefined(var_1)) {
    foreach (var_3 in self._id_11658) {
    if (var_3 == var_1)
      self._id_11658 = scripts\engine\utility::array_remove(self._id_11658, var_1);
    }
  }

  self._id_55E3--;

  if (!self._id_55E3) {
    self._id_11658 = [];
    self._id_3859 = 1;
    self notify("can_teleport");
  }
  } else {
  if (!isdefined(self._id_11658))
    self._id_11658 = [];

  if (isdefined(var_1))
    self._id_11658[self._id_11658.size] = var_1;

  self._id_55E3++;
  self._id_3859 = 0;
  }
}

ismeleeenabled() {
  return !isdefined(self._id_55D5) || !self._id_55D5;
}

_id_9FA2() {
  return !isdefined(self._id_55E3) || !self._id_55E3;
}

_id_1C5D(var_0) {
  if (var_0) {
  self._id_55CD--;

  if (!self._id_55CD)
    self._id_9A45 = undefined;
  } else {
  self._id_55CD++;
  self._id_9A45 = 1;
  }
}

_id_213E() {
  return self._id_55CD < 1;
}

_linkto(var_0, var_1, var_2, var_3, var_4) {
  if (!isdefined(var_2))
  var_2 = "tag_origin";

  if (!isdefined(var_3))
  var_3 = (0, 0, 0);

  if (!isdefined(var_4))
  var_4 = (0, 0, 0);

  if (!isdefined(self.playerlinkedcounter))
  self.playerlinkedcounter = 0;

  self.playerlinkedcounter++;

  if (self.playerlinkedcounter == 1)
  self linkto(var_1, var_2, var_3, var_4);
}

_unlink() {
  if (isplayerlinked()) {
  self.playerlinkedcounter--;

  if (self.playerlinkedcounter <= 0) {
    self.playerlinkedcounter = 0;
    self unlink();
  }
  }
}

isplayerlinked() {
  return isdefined(self.playerlinkedcounter) && self.playerlinkedcounter > 0;
}

enable_infinite_ammo(var_0) {
  if (var_0) {
  self.infiniteammocounter++;
  self setclientomnvar("zm_ui_unlimited_ammo", 1);
  } else {
  if (self.infiniteammocounter > 0)
    self.infiniteammocounter--;

  if (!self.infiniteammocounter)
    self setclientomnvar("zm_ui_unlimited_ammo", 0);
  }
}

isinfiniteammoenabled() {
  return self.infiniteammocounter >= 1;
}

_id_1C5C(var_0) {
  if (var_0) {
  self._id_6266++;
  self._id_0184 = 1;
  } else {
  self._id_6266--;

  if (!self._id_6266)
    self._id_0184 = 0;
  }
}

_id_9E3A() {
  return self._id_6266 >= 1;
}

_id_7298() {
  self._id_55E4 = 0;
  self _meth_80DA();
}

_id_9CF9() {
  return 0;

  if (getdvarint("extinction_tokens_enabled") > 0)
  return 1;

  return 0;
}

_id_4626(var_0) {
  if (!isdefined(var_0) || isdefined(var_0) && var_0 == "none")
  return "none";

  var_1 = _id_7DF7(var_0);
  var_2 = tablelookup(level._id_10E5A, 4, var_1, 1);

  if (var_2 == "" && isdefined(level._id_7666)) {
  if (isdefined(var_0)) {
    var_1 = _id_7DF7(var_0);
    var_2 = tablelookup(level._id_7666, 4, var_1, 2);
  }
  }

  if (_id_9DE2(var_0))
  var_2 = "weapon_mg";
  else if (var_0 == "none")
  var_2 = "other";
  else if (var_2 == "")
  var_2 = "other";

  return var_2;
}

_id_9C03() {
  return self._id_9C03;
}

_id_8BAE() {
  return self._id_8BAE;
}

_id_6C12(var_0, var_1) {
  var_2 = self getweaponslistall();
  var_3 = 0;
  var_4 = undefined;
  var_5 = 0;

  foreach (var_7 in var_2) {
  if (var_7 != var_0) {
    if (var_7 != "none" && var_7 != "alienthrowingknife_mp" && var_7 != "alientrophy_mp" && var_7 != "iw6_aliendlc21_mp")
    self _meth_83B8(var_7);

    continue;
  }

  if (isdefined(var_7) && var_7 != "none") {
    var_5 = self getammocount(var_7);
    self setweaponammostock(var_7, var_5 + var_1);
    var_3 = 1;
    break;
  }
  }

  if (var_3 == 0) {
  _id_12C6(var_0);
  self setweaponammostock(var_0, var_1);
  }
}

_id_7E9D(var_0) {
  switch (var_0) {
  case "arc_grenade_mp":
  case "zom_repulsor_mp":
  case "splash_grenade_zm":
  case "splash_grenade_mp":
  case "impalement_spike_mp":
  case "mortar_shelljugg_mp":
  case "proximity_explosive_mp":
  case "bouncingbetty_mp":
  case "throwingknifesmokewall_mp":
  case "throwingknifec4_mp":
  case "throwingknife_mp":
  case "claymore_mp":
  case "cluster_grenade_zm":
  case "semtex_zm":
  case "semtex_mp":
  case "c4_zm":
  case "frag_grenade_mp":
  case "frag_grenade_zm":
    var_1 = "lethal";
    break;
  case "ztransponder_mp":
  case "transponder_mp":
  case "blackout_grenade_mp":
  case "player_trophy_system_mp":
  case "proto_ricochet_device_mp":
  case "emp_grenade_mp":
  case "trophy_mp":
  case "mobile_radar_mp":
  case "gravity_grenade_mp":
  case "alienflare_mp":
  case "concussion_grenade_mp":
  case "smoke_grenadejugg_mp":
  case "smoke_grenade_mp":
  case "thermobaric_grenade_mp":
  case "portal_generator_zm":
  case "portal_generator_mp":
  case "flash_grenade_mp":
    var_1 = "tactical";
    break;
  default:
    var_1 = undefined;
    break;
  }

  return var_1;
}

_id_8389(var_0) {
  if (var_0 == "none" || var_0 == "specialty_null")
  self _meth_831D("none");
  else
  {
  self._id_F0BB = var_0;

  if (issubstr(var_0, "_mp")) {
    switch (var_0) {
    case "splash_grenade_zm":
    case "splash_grenade_mp":
    case "mortar_shelljugg_mp":
    case "cluster_grenade_zm":
    case "semtex_zm":
    case "semtex_mp":
    case "frag_grenade_mp":
    case "frag_grenade_zm":
      self _meth_831D("frag");
      break;
    case "throwingknifejugg_mp":
    case "throwingknifesmokewall_mp":
    case "throwingknifec4_mp":
    case "throwingknife_mp":
    case "c4_zm":
      self _meth_831D("throwingknife");
      break;
    case "player_trophy_system_mp":
    case "proto_ricochet_device_mp":
    case "emp_grenade_mp":
    case "trophy_mp":
    case "mobile_radar_mp":
    case "alienflare_mp":
    case "thermobaric_grenade_mp":
    case "flash_grenade_mp":
      self _meth_831D("flash");
      break;
    case "concussion_grenade_mp":
    case "smoke_grenadejugg_mp":
    case "smoke_grenade_mp":
      self _meth_831D("smoke");
      break;
    case "ztransponder_mp":
    case "transponder_mp":
    case "zom_repulsor_mp":
    default:
      self _meth_831D("other");
      break;
    }

    _id_12C6(var_0, 0);

    switch (var_0) {
    case "ztransponder_mp":
    case "transponder_mp":
    case "player_trophy_system_mp":
    case "proto_ricochet_device_mp":
    case "emp_grenade_mp":
    case "trophy_mp":
    case "mobile_radar_mp":
    case "gravity_grenade_mp":
    case "alienflare_mp":
    case "concussion_grenade_mp":
    case "smoke_grenade_mp":
    case "thermobaric_grenade_mp":
    case "flash_grenade_mp":
      self setweaponammoclip(var_0, 1);
      break;
    default:
      self _meth_817C(var_0);
      break;
    }

    _id_13D1(var_0);
    return;
  }

  _id_13D1(var_0);
  }
}

_id_1302(var_0, var_1, var_2, var_3, var_4, var_5) {
  var_6 = self _meth_8449(var_0, var_1, var_2, var_3, var_5);

  if (!isdefined(var_4))
  var_6._id_C187 = 1;
  else
  var_6._id_C187 = var_4;

  var_6 _meth_831F(self);
  return var_6;
}

_id_2BBB(var_0) {
  if (!isdefined(self._id_CA5D[var_0]))
  self._id_CA5D[var_0] = 1;
  else
  self._id_CA5D[var_0]++;

  if (self._id_CA5D[var_0] == 1 && _id_12D6(var_0)) {
  foreach (var_6, var_2 in level._id_6A50) {
    if (var_0 == var_6) {
    foreach (var_4 in var_2) {
      if (!isdefined(self._id_CA5D[var_4]))
      self._id_CA5D[var_4] = 1;
      else
      self._id_CA5D[var_4]++;

      if (self._id_CA5D[var_4] == 1) {

      }
    }

    break;
    }
  }
  }
}

_id_12B83(var_0) {
  self._id_CA5D[var_0]--;

  if (self._id_CA5D[var_0] == 0) {
  self._id_CA5D[var_0] = undefined;

  if (_id_12D6(var_0)) {
    foreach (var_6, var_2 in level._id_6A50) {
    if (var_0 == var_6) {
      foreach (var_4 in var_2) {
      self._id_CA5D[var_4]--;

      if (self._id_CA5D[var_4] == 0)
        self._id_CA5D[var_4] = undefined;
      }

      break;
    }
    }
  }
  }
}

_id_821F(var_0) {
  var_1 = _id_7DF7(var_0);
  var_2 = level._id_10E5A;
  var_3 = tablelookup(var_2, 4, var_1, 1);

  if (var_3 == "") {
  var_4 = _id_11150(var_0, "_zm");
  var_3 = tablelookup(var_2, 4, var_4, 1);
  }

  if (var_3 == "" && isdefined(level._id_7666)) {
  var_4 = _id_11150(var_0, "_zm");
  var_3 = tablelookup(level._id_7666, 4, var_4, 1);
  }

  if (_id_9DE2(var_0))
  var_3 = "weapon_mg";
  else if (_id_9E6C(var_0))
  var_3 = "killstreak";
  else if (_id_9F8D(var_0))
  var_3 = "super";
  else if (var_0 == "none")
  var_3 = "other";
  else if (var_3 == "")
  var_3 = "other";

  return var_3;
}

_id_E0E6(var_0, var_1) {
  if (!isdefined(var_1))
  var_1 = 1;

  if (var_1) {
  if (!isdefined(self._id_17DF))
    return;

  self._id_17DF[var_0] = undefined;
  } else {
  if (!isdefined(self._id_BDC8))
    return;

  self._id_BDC8[var_0] = undefined;
  }
}

_id_17C0(var_0, var_1, var_2) {
  if (!isdefined(var_2))
  var_2 = 1;

  if (var_2) {
  if (!isdefined(self._id_17DF))
    self._id_17DF = [];

  self._id_17DF[var_0] = var_1;
  } else {
  if (!isdefined(self._id_BDC8))
    self._id_BDC8 = [];

  self._id_BDC8[var_0] = var_1;
  }
}

_id_7E5C() {
  var_0 = 1.0;

  if (isdefined(self._id_17DF)) {
  foreach (var_2 in self._id_17DF)
    var_0 = var_0 + (var_2 - 1.0);
  }

  var_4 = 1.0;

  if (isdefined(self._id_BDC8)) {
  foreach (var_2 in self._id_BDC8)
    var_4 = var_4 * var_2;
  }

  return var_0 * var_4;
}

_id_9E55(var_0) {
  switch (weaponinventorytype(var_0)) {
  case "altmode":
  case "primary":
    return 1;
  default:
    return 0;
  }
}

_id_1253(var_0) {
  if (!isdefined(self._id_6262))
  self._id_6262 = 0;

  if (var_0) {
  if (self._id_6262 == 0)
    self _meth_84CC(1);

  self._id_6262++;
  } else {
  if (self._id_6262 == 1)
    self _meth_84CC(0);

  self._id_6262--;
  }
}

_id_8BB1(var_0, var_1) {
  if (!isdefined(var_0))
  return 0;

  var_2 = _func_0BC(var_0);

  for (var_3 = 0; var_3 < var_2; var_3++) {
  if (tolower(_func_0BF(var_0, var_3)) == tolower(var_1))
    return 1;
  }

  return 0;
}

_id_9CEB(var_0, var_1) {
  if (isdefined(var_1) && (var_1 == "iw7_beamtrap_zm" || var_1 == "iw7_escapevelocity_zm" || var_1 == "iw7_rockettrap_zm" || var_1 == "iw7_discotrap_zm" || var_1 == "iw7_chromosphere_zm" || var_1 == "iw7_buffertrap_zm" || var_1 == "iw7_electrictrap_zm" || var_1 == "iw7_fantrap_zm" || var_1 == "iw7_hydranttrap_zm" || var_1 == "iw7_moshtrap_zm"))
  return 1;

  if (!isdefined(var_0))
  return 0;

  if (isdefined(var_0._id_11713))
  return 1;

  if (!isdefined(var_0.script_noteworthy) && !isdefined(var_0._id_0336))
  return 0;

  if (isdefined(var_0._id_0336) && (var_0._id_0336 == "fence_generator" || var_0._id_0336 == "puddle_generator"))
  return 1;

  if (isdefined(var_0.script_noteworthy) && var_0.script_noteworthy == "fire_trap")
  return 1;

  return 0;
}

_id_E55C() {
  var_0 = self _meth_8172("primary");

  if (!self.hasriotshield)
  return;

  foreach (var_2 in var_0) {
  if (weapontype(var_2) == "riotshield")
    return var_2;
  }
}

_id_D0C6(var_0, var_1) {
  return isdefined(var_0._id_10932) && var_0._id_10932 == var_1;
}

_id_8BB0(var_0) {
  if (isdefined(self._id_10932))
  return _id_D0C6(self, "stun_ammo");

  if (!isdefined(var_0))
  var_1 = self getcurrentweapon();
  else
  var_1 = var_0;

  if (var_1 == "none")
  var_1 = self getweaponslistprimaries()[0];

  var_2 = _id_80D8(var_1);

  if (isdefined(self._id_10935) && isdefined(self._id_10935[var_2]) && self._id_10935[var_2] > 0)
  return 1;

  if (isdefined(self._id_10937) && isdefined(self._id_10937[var_2]) && self._id_10937[var_2] > 0)
  return 1;

  return 0;
}

_id_9CA6() {
  return level._id_E4DD;
}

_id_9BFB() {
  return level._id_8B38;
}

_id_9B85() {
  return level._id_3B1D == 1;
}

_id_9F2D(var_0) {
  if (var_0 == "none")
  return 0;

  return weapontype(var_0) == "riotshield";
}

_id_9D3E(var_0) {
  if (!isdefined(var_0) || var_0 == "none")
  return 0;

  return weaponinventorytype(var_0) == "altmode";
}

hasriotshield() {
  var_0 = 0;
  var_1 = self getweaponslistprimaries();

  foreach (var_3 in var_1) {
  if (_id_9F2D(var_3)) {
    var_0 = 1;
    break;
  }
  }

  return var_0;
}

_id_9BCC(var_0) {
  return var_0 == "";
}

_id_F225(var_0, var_1) {
  if (isdefined(var_1))
  self notify(var_0, var_1);
  else
  self notify(var_0);
}

_id_C15A(var_0, var_1) {
  self waittill(var_0);
  waittillframeend;
  self notify(var_1);
}

_id_D1BE() {
  level endon("game_ended");
  self endon("death");
  self endon("disconnect");
  self._id_A8A5 = self.origin;

  for (;;) {
  self waittill("damage");
  self._id_A8A5 = self.origin;
  }
}

isheadshot(var_0, var_1, var_2, var_3) {
  if (isdefined(var_3)) {
  if (isdefined(var_3.owner)) {
    if (var_3.code_classname == "script_vehicle")
    return 0;

    if (var_3.code_classname == "misc_turret")
    return 0;

    if (var_3.code_classname == "script_model")
    return 0;
  }

  if (isdefined(var_3.agent_type)) {
    if (var_3.agent_type == "dog" || var_3.agent_type == "alien")
    return 0;
  }
  }

  return (var_1 == "head" || var_1 == "helmet" || var_1 == "neck") && var_2 != "MOD_MELEE" && var_2 != "MOD_IMPACT" && var_2 != "MOD_SCARAB" && var_2 != "MOD_CRUSH" && !_id_9DE2(var_0);
}

_id_81A0(var_0, var_1) {
  var_2 = [];

  if (!isdefined(var_1) || var_1) {
  foreach (var_4 in level._id_3CB5) {
    if (var_4.team == var_0)
    var_2[var_2.size] = var_4;
  }
  } else {
  foreach (var_4 in level.players) {
    if (var_4.team == var_0)
    var_2[var_2.size] = var_4;
  }
  }

  return var_2;
}

_id_8027(var_0) {
  if (level._id_BDCC) {}

  if (var_0 == "allies")
  return "axis";
  else if (var_0 == "axis")
  return "allies";
  else
  return "none";
}

_id_1372D(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13) {
  self endon("death");
  var_14 = spawnstruct();
  var_0 childthread scripts\engine\utility::_id_13806(var_1, var_14);

  if (isdefined(var_2) && isdefined(var_3))
  var_2 childthread scripts\engine\utility::_id_13806(var_3, var_14);

  if (isdefined(var_4) && isdefined(var_5))
  var_4 childthread scripts\engine\utility::_id_13806(var_5, var_14);

  if (isdefined(var_6) && isdefined(var_7))
  var_6 childthread scripts\engine\utility::_id_13806(var_7, var_14);

  if (isdefined(var_8) && isdefined(var_9))
  var_8 childthread scripts\engine\utility::_id_13806(var_9, var_14);

  if (isdefined(var_10) && isdefined(var_11))
  var_10 childthread scripts\engine\utility::_id_13806(var_11, var_14);

  if (isdefined(var_12) && isdefined(var_13))
  var_12 childthread scripts\engine\utility::_id_13806(var_13, var_14);

  var_14 waittill("returned", var_15);
  var_14 notify("die");
  return var_15;
}

_id_1372C(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14) {
  self endon("death");
  var_15 = spawnstruct();
  var_1 childthread scripts\engine\utility::_id_13806(var_2, var_15);

  if (isdefined(var_3) && isdefined(var_4))
  var_3 childthread scripts\engine\utility::_id_13806(var_4, var_15);

  if (isdefined(var_5) && isdefined(var_6))
  var_5 childthread scripts\engine\utility::_id_13806(var_6, var_15);

  if (isdefined(var_7) && isdefined(var_8))
  var_7 childthread scripts\engine\utility::_id_13806(var_8, var_15);

  if (isdefined(var_9) && isdefined(var_10))
  var_9 childthread scripts\engine\utility::_id_13806(var_10, var_15);

  if (isdefined(var_11) && isdefined(var_12))
  var_11 childthread scripts\engine\utility::_id_13806(var_12, var_15);

  if (isdefined(var_13) && isdefined(var_14))
  var_13 childthread scripts\engine\utility::_id_13806(var_14, var_15);

  var_15 childthread scripts\engine\utility::_id_1428(var_0);
  var_15 waittill("returned", var_16);
  var_15 notify("die");
  return var_16;
}

_id_CF90(var_0, var_1, var_2, var_3) {
  self endon("disconnect");
  self endon("intermission");
  self endon("death");
  self._id_CF90 = newclienthudelem(self);
  self._id_CF90.x = 0;
  self._id_CF90.y = 0;
  self._id_CF90 setshader("black", 640, 480);
  self._id_CF90._id_002B = "left";
  self._id_CF90._id_002C = "top";
  self._id_CF90._id_02A4 = 1;
  self._id_CF90._id_017D = "fullscreen";
  self._id_CF90._id_0382 = "fullscreen";
  self._id_CF90.alpha = 0;
  self._id_CF90._id_0142 = 1;

  if (!scripts\engine\utility::_id_9CEE(var_3))
  self._id_CF90 fadeovertime(var_0);

  self._id_CF90.alpha = 1;

  if (!scripts\engine\utility::_id_9CEE(var_3))
  wait(var_0 + 0.05);

  wait(var_1);
  self._id_CF90 fadeovertime(var_2);
  self._id_CF90.alpha = 0;
  wait(var_2 + 0.05);
  self._id_CF90 destroy();
}

_id_E552() {
  var_0 = 0;
  var_1 = self getweaponslistprimaries();

  foreach (var_3 in var_1) {
  if (_id_9F2D(var_3)) {
    var_0 = 1;
    break;
  }
  }

  return var_0;
}

_id_E54D(var_0, var_1) {
  var_2 = undefined;

  if (var_0) {
  self.riotshieldmodel = var_1;
  var_2 = "tag_weapon_right";
  } else {
  self.riotshieldmodelstowed = var_1;
  var_2 = "tag_shield_back";
  }

  self attachshieldmodel(var_1, var_2);
  self.hasriotshield = _id_E552();
}

launchshield(var_0, var_1) {
  if (isdefined(self.hasriotshieldequipped) && self.hasriotshieldequipped) {
  if (isdefined(self.riotshieldmodel))
    _id_E54F(1);
  else if (isdefined(self.riotshieldmodelstowed))
    _id_E54F(0);
  }
}

_id_E54F(var_0) {
  var_1 = undefined;
  var_2 = undefined;

  if (var_0) {
  var_1 = self.riotshieldmodel;
  var_2 = "tag_weapon_right";
  } else {
  var_1 = self.riotshieldmodelstowed;
  var_2 = "tag_shield_back";
  }

  self _meth_8098(var_1, var_2);

  if (var_0)
  self.riotshieldmodel = undefined;
  else
  self.riotshieldmodelstowed = undefined;

  self.hasriotshield = _id_E552();
}

_id_E554(var_0) {
  var_1 = undefined;
  var_2 = undefined;
  var_3 = undefined;

  if (var_0) {
  var_3 = self.riotshieldmodel;
  var_1 = "tag_weapon_right";
  var_2 = "tag_shield_back";
  } else {
  var_3 = self.riotshieldmodelstowed;
  var_1 = "tag_shield_back";
  var_2 = "tag_weapon_right";
  }

  self _meth_820D(var_3, var_1, var_2);

  if (var_0) {
  self.riotshieldmodelstowed = var_3;
  self.riotshieldmodel = undefined;
  } else {
  self.riotshieldmodel = var_3;
  self.riotshieldmodelstowed = undefined;
  }
}

riotshield_clear() {
  self.hasriotshieldequipped = 0;
  self.hasriotshield = 0;
  self.riotshieldmodelstowed = undefined;
  self.riotshieldmodel = undefined;
}

_id_DFE1() {
  self setclientomnvar("zombie_souvenir_piece_index", 0);

  if (isdefined(level.crafting_remove_func))
  self [[level.crafting_remove_func]]();

  self._id_4B5E = undefined;
}

_id_110AA(var_0, var_1) {
  self._id_4643 = self _meth_8173();
  self._id_464B = _id_7910(self, var_1);
  self._id_464C = [];
  var_2 = [];

  foreach (var_4 in self._id_4643) {
  if (!_id_9F7C(var_4, "alt_"))
    var_2[var_2.size] = var_4;
  }

  self._id_4643 = var_2;

  foreach (var_4 in self._id_4643) {
  self._id_4648[var_4] = self getweaponammoclip(var_4);
  self._id_464A[var_4] = self getweaponammostock(var_4);

  if (issubstr(var_4, "akimbo"))
    self._id_4649[var_4] = self getweaponammoclip(var_4, "left");

  if (isdefined(self._id_C8A2[_id_80D8(var_4)]))
    self._id_464C[var_4] = self._id_C8A2[_id_80D8(var_4)]._id_B111;
  }

  if (isdefined(var_0)) {
  var_8 = [];

  foreach (var_4 in self._id_4643) {
    var_10 = 0;

    foreach (var_12 in var_0) {
    if (var_4 == var_12) {
      var_10 = 1;
      break;
    }
    else if (getweaponbasename(var_4) == var_12) {
      var_10 = 1;
      break;
    }
    }

    if (var_10)
    continue;

    var_8[var_8.size] = var_4;
  }

  self._id_4643 = var_8;

  foreach (var_12 in var_0) {
    if (self._id_464B == var_12) {
    self._id_464B = "none";
    break;
    }
  }
  }
}

_id_7910(var_0, var_1) {
  var_2 = var_0 getcurrentweapon();

  if (scripts\engine\utility::_id_9CEE(var_1) && _id_9C42(var_2))
  var_2 = var_0 _meth_8173()[1];

  return var_2;
}

_id_9C42(var_0, var_1) {
  switch (var_0) {
  case "iw7_knife_zm_disco":
  case "iw7_knife_zm_cleaver":
  case "iw7_knife_zm_crowbar":
  case "iw7_knife_zm_elvira":
  case "iw7_knife_zm_rebel":
  case "iw7_knife_zm_soldier":
  case "iw7_knife_zm_scientist":
  case "iw7_knife_zm_schoolgirl":
  case "alt_iw7_knife_zm_survivor":
  case "alt_iw7_knife_zm_grunge":
  case "alt_iw7_knife_zm_hiphop":
  case "alt_iw7_knife_zm_raver":
  case "alt_iw7_knife_zm_chola":
  case "iw7_knife_zm_survivor":
  case "iw7_knife_zm_grunge":
  case "iw7_knife_zm_hiphop":
  case "iw7_knife_zm_raver":
  case "iw7_knife_zm_chola":
  case "alt_iw7_knife_zm_vgirl":
  case "alt_iw7_knife_zm_rapper":
  case "alt_iw7_knife_zm_nerd":
  case "alt_iw7_knife_zm_jock":
  case "alt_iw7_knife_zm":
  case "iw7_knife_zm_vgirl":
  case "iw7_knife_zm_rapper":
  case "iw7_knife_zm_nerd":
  case "iw7_knife_zm_jock":
  case "alt_iw7_knife_zm_hoff":
  case "iw7_knife_zm_hoff":
  case "iw7_knife_zm":
    return 1;
  case "iw7_katana_zm_pap2":
  case "iw7_katana_zm_pap1":
  case "iw7_nunchucks_zm_pap2":
  case "iw7_nunchucks_zm_pap1":
  case "iw7_katana_zm":
  case "iw7_nunchucks_zm":
  case "iw7_axe_zm_pap2":
  case "iw7_axe_zm_pap1":
  case "iw7_axe_zm":
  case "iw7_fists_zm_kevinsmith":
  case "iw7_fists_zm_raver":
  case "iw7_fists_zm_hiphop":
  case "iw7_fists_zm_grunge":
  case "iw7_fists_zm_chola":
  case "iw7_fists_zm":
    if (scripts\engine\utility::_id_9CEE(var_1))
    return 0;
    else
    return 1;
  default:
    return 0;
  }
}

_id_9C8F(var_0) {
  switch (var_0) {
  case "iw7_katana_zm_pap2":
  case "iw7_katana_zm_pap1":
  case "iw7_nunchucks_zm_pap2":
  case "iw7_nunchucks_zm_pap1":
  case "iw7_katana_zm":
  case "iw7_nunchucks_zm":
  case "iw7_axe_zm_pap2":
  case "iw7_axe_zm_pap1":
  case "iw7_axe_zm":
    return 1;
  }

  return 0;
}

_id_E2D5(var_0) {
  if (!isdefined(self._id_4643) || !isdefined(self._id_464B) || !isdefined(self._id_4648) || !isdefined(self._id_464A)) {}

  var_1 = self _meth_8173();

  foreach (var_3 in var_1) {
  if (!scripts\engine\utility::array_contains(self._id_4643, var_3) && !_id_939A(var_0, var_3))
    self _meth_83B8(var_3);
  }

  foreach (var_3 in self._id_4643) {
  if (!self hasweapon(var_3))
    self giveweapon(var_3, -1, 0, -1, 1);

  if (isdefined(self._id_D781) && self._id_D781 == var_3)
    self _meth_844B(var_3);

  if (isdefined(self._id_D785) && self._id_D785 == var_3)
    self _meth_844C(var_3);

  if (isdefined(self._id_10967) && self._id_10967 == var_3)
    self _meth_84C2(var_3);

  if (isdefined(self._id_4648[var_3]))
    self setweaponammoclip(var_3, self._id_4648[var_3]);

  if (isdefined(self._id_4649)) {
    if (isdefined(self._id_4649[var_3]))
    self setweaponammoclip(var_3, self._id_4649[var_3], "left");
  }

  if (isdefined(self._id_464A[var_3]))
    self setweaponammostock(var_3, self._id_464A[var_3]);

  if (isdefined(self._id_464C[var_3])) {
    var_6 = spawnstruct();
    var_6._id_B111 = self._id_464C[var_3];
    self._id_C8A2[_id_80D8(var_3)] = var_6;
  }
  }

  var_8 = self._id_464B;

  if (!isdefined(var_8) || var_8 == "none") {
  foreach (var_10 in self._id_4643) {
    if (_id_0A6B::_id_9D75(var_10)) {
    var_8 = var_10;
    break;
    }
  }
  }

  if (scripts\engine\utility::_id_A009())
  self _meth_83B6(var_8);

  self._id_4643 = undefined;
  self._id_464B = undefined;
  self._id_4648 = undefined;
  self._id_464A = undefined;
  self._id_4649 = undefined;

  if (isdefined(level._id_2117))
  self [[level._id_2117]]();
}

_id_E2D2(var_0) {
  if (!isdefined(self._id_4643) || !isdefined(self._id_464B) || !isdefined(self._id_4648) || !isdefined(self._id_464A)) {}

  self._id_D8D5 = [];
  var_1 = 0;

  foreach (var_3 in self._id_4643) {
  if (_id_9E55(var_3)) {
    self._id_D8D5[var_1] = var_3;
    var_1 = var_1 + 1;
  }
  }

  var_5 = 0;

  foreach (var_3 in self._id_D8D5) {
  if (var_5 < 3) {
    if (_id_9F7C(var_3, "alt_"))
    continue;

    if (!self hasweapon(var_3))
    self giveweapon(var_3, -1, 0, -1, 1);

    self setweaponammoclip(var_3, self._id_4648[var_3]);
    self setweaponammostock(var_3, self._id_464A[var_3]);

    if (isdefined(self._id_464C[var_3])) {
    var_7 = spawnstruct();
    var_7._id_B111 = self._id_464C[var_3];
    self._id_C8A2[_id_80D8(var_3)] = var_7;
    }

    var_5++;
  }
  }

  var_9 = self._id_464B;

  if (!isdefined(var_9) || !self hasweapon(var_9) || var_9 == "none")
  var_9 = getweapontoswitchbackto();

  self _meth_83B6(var_9);
  self._id_4643 = undefined;
  self._id_464B = undefined;
  self._id_4648 = undefined;
  self._id_464A = undefined;
}

_id_4191() {
  self._id_4643 = [];
  self._id_464B = "none";
  self._id_4648 = [];
  self._id_4649 = [];
  self._id_464A = [];
  self._id_464C = [];
}

_id_1785(var_0, var_1, var_2, var_3) {
  foreach (var_5 in var_0) {
  self._id_4643[self._id_4643.size] = var_5;
  self._id_4648[var_5] = var_1[var_5];
  self._id_464A[var_5] = var_2[var_5];
  }

  self._id_464B = var_3;
}

_id_939A(var_0, var_1) {
  if (!isdefined(var_0))
  return 0;

  return scripts\engine\utility::array_contains(var_0, var_1);
}

_id_13192(var_0, var_1) {
  return (var_0[0] * var_1, var_0[1] * var_1, var_0[2] * var_1);
}

_id_E2D4() {
  self giveweapon("super_default_zm");
  self _meth_84C2("super_default_zm");
  self._id_10967 = "super_default_zm";

  if (scripts\engine\utility::_id_9CEE(self._id_4561))
  self setweaponammoclip("super_default_zm", 1);
}

_id_9D20() {
  return isagent(self) && isdefined(self._id_1096F) && (self._id_1096F == "humanoid" || self._id_1096F == "zombie");
}

_id_9D22() {
  return level.gametype == "zombie";
}

_id_462B(var_0) {
  if (!isdefined(level._id_462A))
  return 0;

  return isdefined(level._id_462A[var_0]);
}

_id_4629(var_0) {
  if (!isdefined(level._id_462A))
  level._id_462A = [];

  foreach (var_2 in var_0)
  level._id_462A[var_2] = 1;
}

_id_B268(var_0, var_1) {
  if (!isdefined(var_1))
  var_1 = 1;

  if (var_1)
  return self makeentitysentient(var_0, 1);
  else
  return self makeentitysentient(var_0);
}

_id_7844(var_0) {
  if (isdefined(var_0)) {
  if (isplayer(var_0))
    return var_0;

  if (isdefined(var_0.owner) && isplayer(var_0.owner))
    return var_0.owner;
  }

  return undefined;
}

_id_E0F6(var_0) {
  if (isdefined(level._id_68C9)) {
  foreach (var_2 in level._id_68C9) {
    foreach (var_4 in var_0) {
    if (_id_2494(var_4) == var_2)
      var_0 = scripts\engine\utility::array_remove(var_0, var_4);
    }
  }
  }

  return var_0;
}

_id_80C6(var_0, var_1, var_2) {
  var_3 = [];

  if (_id_13C96(var_0, var_1, "passive_random_attachments")) {
  if (0) {
    var_4 = _id_7DE6(var_0, var_2, 0);
    var_3[var_3.size] = var_4[randomint(var_4.size)];
  } else {
    var_5 = int(max(0, 5 - var_2.size));

    if (var_5 > 0) {
    var_6 = randomintrange(1, var_5 + 1);
    var_3 = _id_3217(var_0, var_6, var_2);
    }
  }
  }

  return var_3;
}

_id_13C96(var_0, var_1, var_2) {
  var_3 = _id_8229(var_0, var_1);

  if (!isdefined(var_3) || var_3.size <= 0)
  return 0;

  foreach (var_5 in var_3) {
  if (var_2 == var_5)
    return 1;
  }

  return 0;
}

_id_3217(var_0, var_1, var_2) {
  var_3 = [];
  var_4 = _id_0A6B::_id_7DE2(var_0, var_2);

  if (var_4.size > 0) {
  var_3 = [];
  var_5 = scripts\engine\utility::_id_22A8(var_4);

  foreach (var_10, var_7 in var_5) {
    if (var_1 <= 0)
    break;

    var_8 = 1;

    switch (var_10) {
    case "undermount":
    case "barrel":
      var_8 = 1;
      break;
    case "rail":
    case "pap":
    case "perk":
      var_8 = 0;
      break;
    default:
      var_8 = randomintrange(1, var_1 + 1);
      break;
    }

    if (var_8 > 0) {
    if (var_8 > var_7.size)
      var_8 = var_7.size;

    var_1 = var_1 - var_8;

    for (var_7 = scripts\engine\utility::_id_22A8(var_7); var_8 > 0; var_8--) {
      var_9 = var_7[var_7.size - var_8];

      if (!issubstr(var_9, "ark") && !issubstr(var_9, "arcane"))
      var_3[var_3.size] = var_9;
    }
    }
  }
  }

  return var_3;
}

_id_7DE6(var_0, var_1, var_2) {
  if (!isdefined(var_2))
  var_2 = 1;

  var_3 = _id_8217(var_0);
  var_4 = [];

  foreach (var_6 in var_3) {
  var_7 = _id_7DE1(var_6);

  if (!var_2 && var_7 == "rail")
    continue;

  if (isdefined(var_1) && _id_AD7F(var_1, var_6))
    continue;

  var_4[var_4.size] = var_6;
  }

  return var_4;
}

_id_AD7F(var_0, var_1) {
  foreach (var_3 in var_0) {
  if (var_3 == var_1)
    return 1;
  }

  return 0;
}

_id_8217(var_0) {
  var_0 = _id_8234(var_0);

  if (!isdefined(level._id_13C79))
  level._id_13C79 = [];

  if (!isdefined(level._id_13C79[var_0])) {
  var_1 = [];

  for (var_2 = 0; var_2 <= 19; var_2++) {
    var_3 = tablelookup("mp/statsTable.csv", 4, var_0, 10 + var_2);

    if (var_3 == "")
    break;

    var_1[var_1.size] = var_3;
  }

  level._id_13C79[var_0] = var_1;
  }

  return level._id_13C79[var_0];
}

getweaponpaintjobid(var_0) {
  return -1;
}

getweaponcamo(var_0) {
  var_1 = self getrankedplayerdata("cp", "zombiePlayerLoadout", "zombiePlayerWeaponModels", var_0, "camo");

  if (isdefined(var_1) && var_1 != "none")
  return var_1;
  else
  return "none";
}

getweaponcosmeticattachment(var_0) {
  var_1 = self getrankedplayerdata("cp", "zombiePlayerLoadout", "zombiePlayerWeaponModels", var_0, "cosmeticAttachment");

  if (isdefined(var_1) && var_1 != "none")
  return var_1;
  else
  return "none";
}

getweaponreticle(var_0) {
  var_1 = self getrankedplayerdata("cp", "zombiePlayerLoadout", "zombiePlayerWeaponModels", var_0, "reticle");

  if (isdefined(var_1) && var_1 != "none")
  return var_1;
  else
  return "none";
}

_id_BD68(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8) {
  var_9 = _id_13C76(var_0);
  var_10 = _id_3220(var_0, var_4);

  if (isdefined(var_4) && var_4 >= 0) {
  var_11 = _id_80C6(var_10, var_4, var_1);

  if (var_11.size > 0)
    var_1 = scripts\engine\utility::_id_2284(var_1, var_11);
  }

  var_12 = _id_4626(var_10);

  if (isdefined(var_9))
  var_1 = scripts\engine\utility::_id_2284(var_1, var_9);

  var_1 = _id_13C7A(var_1);
  var_1 = _id_E0F6(var_1);

  for (var_13 = 0; var_13 < var_1.size; var_13++)
  var_1[var_13] = _id_2496(var_1[var_13], var_10);

  if (isdefined(var_9)) {
  for (var_13 = 0; var_13 < var_9.size; var_13++)
    var_9[var_13] = _id_2496(var_9[var_13], var_10);
  }

  if (isdefined(var_9))
  var_1 = scripts\engine\utility::_id_2284(var_1, var_9);

  if (isdefined(var_4) && var_4 >= 0) {
  var_14 = _id_823A(var_10, var_4);

  if (var_14.size > 0)
    var_1 = scripts\engine\utility::_id_2284(var_1, var_14);
  }

  var_1 = scripts\engine\utility::array_remove(var_1, "none");

  if (isdefined(var_8) && var_8 != "none")
  var_1[var_1.size] = var_8;

  if (var_1.size > 0)
  var_1 = _id_6C18(var_1);

  var_15 = [];

  foreach (var_17 in var_1) {
  var_18 = _id_2495(var_17);

  if (isdefined(var_18))
    var_15[var_15.size] = _id_2496(var_18, var_10);
  }

  if (var_15.size > 0)
  var_1 = scripts\engine\utility::_id_2284(var_1, var_15);

  if (var_1.size > 0)
  var_1 = scripts\engine\utility::_id_1D3A(var_1);

  var_10 = reassign_weapon_name(var_10, var_1);

  foreach (var_21 in var_1)
  var_10 = var_10 + ("+" + var_21);

  if (issubstr(var_10, "iw7")) {
  var_10 = _id_3225(var_10, var_2, var_4);
  var_23 = 0;

  if (isholidayweapon(var_10, var_4) || issummerholidayweapon(var_10, var_4))
    var_23 = isholidayweaponusingdefaultscope(var_10, var_1);

  if (var_23)
    var_10 = var_10 + "+scope1";
  else
    var_10 = _id_3227(var_10, var_3);

  var_10 = _id_3228(var_10, var_4);
  }

  return var_10;
}

reassign_weapon_name(var_0, var_1) {
  if (isdefined(level.weapon_upgrade_path) && isdefined(level.weapon_upgrade_path[getweaponbasename(var_0)]))
  return var_0;
  else
  {
  switch (var_0) {
    case "iw7_machete_mp":
    if (scripts\engine\utility::_id_9CEE(self.base_weapon))
      var_0 = "iw7_machete_mp";
    else if (isdefined(self._id_C8A2[_id_80D8(var_0)]) && self._id_C8A2[_id_80D8(var_0)]._id_B111 == 1 || scripts\engine\utility::_id_9CEE(self.ephemeral_downgrade)) {
      if (scripts\engine\utility::_id_9CEE(self.bang_bangs))
      var_0 = "iw7_machete_mp";
      else
      var_0 = "iw7_machete_mp_pap1";
    }
    else if (isdefined(self._id_C8A2[_id_80D8(var_0)]) && self._id_C8A2[_id_80D8(var_0)]._id_B111 == 2) {
      if (scripts\engine\utility::_id_9CEE(self.bang_bangs))
      var_0 = "iw7_machete_mp_pap1";
      else
      var_0 = "iw7_machete_mp_pap2";
    }
    else if (isdefined(self._id_C8A2[_id_80D8(var_0)]) && self._id_C8A2[_id_80D8(var_0)]._id_B111 == 3)
      var_0 = "iw7_machete_mp_pap2";

    break;
    case "iw7_two_headed_axe_mp":
    if (scripts\engine\utility::_id_9CEE(self.base_weapon))
      var_0 = "iw7_two_headed_axe_mp";
    else if (isdefined(self._id_C8A2[_id_80D8(var_0)]) && self._id_C8A2[_id_80D8(var_0)]._id_B111 == 1 || scripts\engine\utility::_id_9CEE(self.ephemeral_downgrade)) {
      if (scripts\engine\utility::_id_9CEE(self.bang_bangs))
      var_0 = "iw7_two_headed_axe_mp";
      else
      var_0 = "iw7_two_headed_axe_mp_pap1";
    }
    else if (isdefined(self._id_C8A2[_id_80D8(var_0)]) && self._id_C8A2[_id_80D8(var_0)]._id_B111 == 2) {
      if (scripts\engine\utility::_id_9CEE(self.bang_bangs))
      var_0 = "iw7_two_headed_axe_mp_pap1";
      else
      var_0 = "iw7_two_headed_axe_mp_pap2";
    }
    else if (isdefined(self._id_C8A2[_id_80D8(var_0)]) && self._id_C8A2[_id_80D8(var_0)]._id_B111 == 3)
      var_0 = "iw7_two_headed_axe_mp_pap2";

    break;
    case "iw7_spiked_bat_mp":
    if (scripts\engine\utility::_id_9CEE(self.base_weapon))
      var_0 = "iw7_spiked_bat_mp";
    else if (isdefined(self._id_C8A2[_id_80D8(var_0)]) && self._id_C8A2[_id_80D8(var_0)]._id_B111 == 1 || scripts\engine\utility::_id_9CEE(self.ephemeral_downgrade)) {
      if (scripts\engine\utility::_id_9CEE(self.bang_bangs))
      var_0 = "iw7_spiked_bat_mp";
      else
      var_0 = "iw7_spiked_bat_mp_pap1";
    }
    else if (isdefined(self._id_C8A2[_id_80D8(var_0)]) && self._id_C8A2[_id_80D8(var_0)]._id_B111 == 2) {
      if (scripts\engine\utility::_id_9CEE(self.bang_bangs))
      var_0 = "iw7_spiked_bat_mp_pap1";
      else
      var_0 = "iw7_spiked_bat_mp_pap2";
    }
    else if (isdefined(self._id_C8A2[_id_80D8(var_0)]) && self._id_C8A2[_id_80D8(var_0)]._id_B111 == 3)
      var_0 = "iw7_spiked_bat_mp_pap2";

    break;
    case "iw7_golf_club_mp":
    if (scripts\engine\utility::_id_9CEE(self.base_weapon))
      var_0 = "iw7_golf_club_mp";
    else if (isdefined(self._id_C8A2[_id_80D8(var_0)]) && self._id_C8A2[_id_80D8(var_0)]._id_B111 == 1 || scripts\engine\utility::_id_9CEE(self.ephemeral_downgrade)) {
      if (scripts\engine\utility::_id_9CEE(self.bang_bangs))
      var_0 = "iw7_golf_club_mp";
      else
      var_0 = "iw7_golf_club_mp_pap1";
    }
    else if (isdefined(self._id_C8A2[_id_80D8(var_0)]) && self._id_C8A2[_id_80D8(var_0)]._id_B111 == 2) {
      if (scripts\engine\utility::_id_9CEE(self.bang_bangs))
      var_0 = "iw7_golf_club_mp_pap1";
      else
      var_0 = "iw7_golf_club_mp_pap2";
    }
    else if (isdefined(self._id_C8A2[_id_80D8(var_0)]) && self._id_C8A2[_id_80D8(var_0)]._id_B111 == 3)
      var_0 = "iw7_golf_club_mp_pap2";

    break;
    case "iw7_axe_zm":
    if (scripts\engine\utility::array_contains(var_1, "axepap1"))
      var_0 = "iw7_axe_zm_pap1";
    else if (scripts\engine\utility::array_contains(var_1, "axepap2"))
      var_0 = "iw7_axe_zm_pap2";

    break;
    case "iw7_katana_zm":
    if (scripts\engine\utility::array_contains(var_1, "katanapap1"))
      var_0 = "iw7_katana_zm_pap1";
    else if (scripts\engine\utility::array_contains(var_1, "katanapap2"))
      var_0 = "iw7_katana_zm_pap2";

    break;
    case "iw7_nunchucks_zm":
    if (scripts\engine\utility::array_contains(var_1, "nunchuckspap1"))
      var_0 = "iw7_nunchucks_zm_pap1";
    else if (scripts\engine\utility::array_contains(var_1, "nunchuckspap2"))
      var_0 = "iw7_nunchucks_zm_pap2";

    break;
    case "iw7_forgefreeze_zm":
    if (scripts\engine\utility::array_contains(var_1, "freezepap1"))
      var_0 = "iw7_forgefreeze_zm_pap1";
    else if (scripts\engine\utility::array_contains(var_1, "freezepap2"))
      var_0 = "iw7_forgefreeze_zm_pap2";

    break;
    case "iw7_shredder_zm":
    if (scripts\engine\utility::array_contains(var_1, "shredderpap1"))
      var_0 = "iw7_shredder_zm_pap1";

    break;
    case "iw7_dischord_zm":
    if (scripts\engine\utility::array_contains(var_1, "dischordpap1"))
      var_0 = "iw7_dischord_zm_pap1";

    break;
    case "iw7_facemelter_zm":
    if (scripts\engine\utility::array_contains(var_1, "fmpap1"))
      var_0 = "iw7_facemelter_zm_pap1";

    break;
    case "iw7_headcutter_zm":
    if (scripts\engine\utility::array_contains(var_1, "hcpap1"))
      var_0 = "iw7_headcutter_zm_pap1";

    break;
  }
  }

  return var_0;
}

_id_7D72(var_0, var_1) {
  var_2 = _id_7DF7(var_1);

  if (isenumvaluevalid("mp", "LoadoutWeapon", var_2) && _id_13C99(var_2))
  return var_0 getrankedplayerdata("cp", "zombiePlayerLoadout", "zombiePlayerWeaponModels", var_2, "variantID");
  else
  return -1;
}

_id_13C99(var_0) {
  if (!isdefined(var_0))
  return 0;

  switch (var_0) {
  case "iw7_glprox":
  case "iw7_lockon":
  case "iw7_chargeshot":
  case "iw7_axe":
  case "iw7_g18c":
  case "iw7_arclassic":
  case "iw7_spasc":
  case "iw7_cheytacc":
  case "iw7_ump45c":
  case "iw7_m1c":
    return 0;
  default:
    return 1;
  }
}

_id_13C7A(var_0) {
  var_1 = [];

  foreach (var_3 in var_0) {
  if (isdefined(level._id_248B[var_3]))
    continue;

  var_1[var_1.size] = var_3;
  }

  return var_1;
}

_id_13C76(var_0) {
  if (isdefined(level._id_13CA5[var_0]) && isdefined(level._id_13CA5[var_0]._id_2476))
  return level._id_13CA5[var_0]._id_2476;

  return undefined;
}

_id_3220(var_0, var_1) {
  if (!isdefined(var_1) || var_1 < 0) {
  switch (var_0) {
    case "iw7_two_headed_axe":
    case "iw7_spiked_bat":
    case "iw7_machete":
    case "iw7_golf_club":
    return var_0 + "_mp";
    case "iw7_golf_club_mp":
    case "iw7_spiked_bat_mp":
    case "iw7_two_headed_axe_mp":
    case "iw7_machete_mp":
    return var_0;
    case "iw7_ake":
    return var_0 + "_zml";
    case "iw7_crb":
    return var_0 + "_zml";
    case "iw7_sonic":
    return var_0 + "_zmr";
    case "iw7_ump45":
    return var_0 + "_zml";
    case "iw7_ripper":
    return var_0 + "_zmr";
    case "iw7_g18":
    return var_0 + "_zmr";
    case "iw7_spas":
    return var_0 + "_zmr";
    case "iw7_cheytac":
    return var_0 + "_zmr";
    case "iw7_katana_zm_pap2":
    case "iw7_katana_zm_pap1":
    case "iw7_nunchucks_zm_pap2":
    case "iw7_nunchucks_zm_pap1":
    case "iw7_katana_zm":
    case "iw7_nunchucks_zm":
    return var_0;
  }

  return var_0 + "_zm";
  } else {
  var_2 = _id_8215(var_0, var_1);
  return var_2;
  }
}

_id_8215(var_0, var_1) {
  var_2 = "mp/loot/weapon/" + var_0 + ".csv";
  var_3 = tablelookup(var_2, 0, var_1, 20);
  return var_3;
}

_id_823A(var_0, var_1) {
  var_2 = [];
  var_3 = _id_8229(var_0, var_1);

  if (isdefined(var_3)) {
  foreach (var_5 in var_3) {
    var_6 = _id_8048(var_5);

    if (!isdefined(var_6))
    continue;

    var_2[var_2.size] = var_6;
  }
  }

  return var_2;
}

_id_8048(var_0) {
  var_1 = _id_804D(var_0);

  if (!isdefined(var_1) || !isdefined(var_1._id_249B))
  return undefined;

  return var_1._id_249B;
}

_id_8229(var_0, var_1) {
  return _id_804C(var_0, var_1);
}

_id_804C(var_0, var_1) {
  var_2 = _id_7F82(var_0, var_1);

  if (isdefined(var_2))
  return var_2._id_C946;

  return undefined;
}

_id_7F82(var_0, var_1) {
  var_2 = _id_8234(var_0);

  if (!isdefined(level._id_B09C))
  level._id_B09C = [];

  if (isdefined(level._id_B09C[var_2]) && isdefined(level._id_B09C[var_2][var_1])) {
  var_3 = level._id_B09C[var_2][var_1];
  return var_3;
  }

  var_3 = _id_36A4(var_0, var_2, var_1);

  if (isdefined(var_3))
  return var_3;

  return undefined;
}

_id_8234(var_0) {
  var_1 = strtok(var_0, "_");

  if (weapon_is_dlc_melee(var_0)) {
  var_0 = var_1[0];

  for (var_2 = 1; var_2 < var_1.size - 1; var_2++)
    var_0 = var_0 + ("_" + var_1[var_2]);
  }
  else if (weapon_is_dlc2_melee(var_0))
  return var_0;
  else if (var_1[0] == "iw6" || var_1[0] == "iw7")
  var_0 = var_1[0] + "_" + var_1[1];
  else if (var_1[0] == "alt")
  var_0 = var_1[1] + "_" + var_1[2];

  return var_0;
}

weapon_is_dlc2_melee(var_0) {
  return issubstr(var_0, "katana") || issubstr(var_0, "nunchucks");
}

weapon_is_dlc_melee(var_0) {
  return issubstr(var_0, "two_headed") || issubstr(var_0, "spiked_bat") || issubstr(var_0, "machete") || issubstr(var_0, "golf_club");
}

_id_36A4(var_0, var_1, var_2) {
  if (!isdefined(level._id_B09C[var_1]))
  level._id_B09C[var_1] = [];

  var_3 = getweaponloottable(var_0);
  var_4 = _id_DD6A(var_3, var_2);
  level._id_B09C[var_1][var_2] = var_4;
  return var_4;
}

_id_DD6A(var_0, var_1) {
  var_2 = tablelookuprownum(var_0, 0, var_1);
  var_3 = spawnstruct();
  var_3._id_DE3F = tablelookupbyrow(var_0, var_2, 1);
  var_3._id_13C74 = tablelookupbyrow(var_0, var_2, 20);
  var_3._id_C946 = [];

  for (var_4 = 0; var_4 < 3; var_4++) {
  var_5 = tablelookupbyrow(var_0, var_2, 21 + var_4);

  if (isdefined(var_5) && var_5 != "")
    var_3._id_C946[var_3._id_C946.size] = var_5;
  }

  return var_3;
}

_id_6C18(var_0) {
  var_1 = [];

  if (isdefined(var_0)) {
  foreach (var_3 in var_0) {
    var_4 = 1;

    foreach (var_6 in var_1) {
    if (var_3 == var_6) {
      var_4 = 0;
      break;
    }

    if (!_id_249D(var_3, var_6)) {
      var_4 = 0;
      break;
    }
    }

    if (var_4)
    var_1[var_1.size] = var_3;
  }
  }

  return var_1;
}

_id_249D(var_0, var_1) {
  var_0 = _id_2494(var_0);
  var_1 = _id_2494(var_1);
  var_2 = 1;

  if (var_0 == var_1)
  var_2 = 0;
  else if (isdefined(level._id_2493)) {
  var_3 = scripts\engine\utility::_id_1D3A([var_0, var_1]);
  var_2 = !isdefined(level._id_2493[var_3[0] + "_" + var_3[1]]);
  }
  else if (var_0 != "none" && var_1 != "none") {
  var_4 = tablelookuprownum("mp/attachmentcombos.csv", 0, var_1);

  if (tablelookup("mp/attachmentcombos.csv", 0, var_0, var_4) == "no")
    var_2 = 0;
  }

  return var_2;
}

_id_2495(var_0) {
  var_1 = undefined;

  if (isdefined(level._id_2498[var_0]))
  var_1 = level._id_2498[var_0];

  return var_1;
}

_id_804D(var_0) {
  if (!isdefined(level._id_C943[var_0]))
  return undefined;

  var_1 = level._id_C943[var_0];
  return var_1;
}

map_check(var_0) {
  if (!isdefined(var_0))
  return 1;

  switch (var_0) {
  case 0:
    if (level.script == "cp_zmb")
    return 1;
    else
    return 0;
  case 1:
    if (level.script == "cp_rave")
    return 1;
    else
    return 0;
  case 2:
    if (level.script == "cp_disco")
    return 1;
    else
    return 0;
  case 3:
    if (level.script == "cp_town")
    return 1;
    else
    return 0;
  default:
    return 1;
  }
}

_id_3224(var_0, var_1, var_2, var_3, var_4) {
  if (_id_9F7C(var_0, "iw7_"))
  var_2 = 0;

  var_5 = [];

  foreach (var_7 in var_1)
  var_5[var_5.size] = _id_2496(var_7, var_0);

  var_9 = _id_80D8(var_0);
  var_10 = var_0;
  var_11 = var_9 == "kbs" || var_9 == "cheytac" || var_9 == "m8" || var_9 == "ripper" || var_9 == "erad" || var_9 == "ar57";

  if (var_11) {
  var_12 = 0;

  foreach (var_7 in var_5) {
    if (_id_7DE1(var_7) == "rail") {
    var_12 = 1;
    break;
    }
  }

  if (!var_12)
    var_5[var_5.size] = var_9 + "scope";
  }

  if (var_5.size > 0) {
  var_15 = scripts\engine\utility::_id_22AF(var_5);
  var_5 = scripts\engine\utility::_id_1D3A(var_15);
  }

  foreach (var_7 in var_5)
  var_10 = var_10 + ("+" + var_7);

  if (issubstr(var_10, "iw6") || issubstr(var_10, "iw7")) {
  var_10 = _id_3225(var_10, var_2);

  if (var_4 != "weapon_sniper" && isdefined(var_3))
    var_10 = _id_3227(var_10, var_3);
  }
  else if (!_id_0A6B::_id_9FED(var_10 + "_zm"))
  var_10 = var_0 + "_zm";
  else
  {
  var_10 = _id_3225(var_10, var_2);
  var_10 = _id_3227(var_10, var_3);
  var_10 = var_10 + "_zm";
  }

  return var_10;
}

_id_3228(var_0, var_1) {
  if (!isdefined(var_1) || var_1 < 0)
  return var_0;

  var_0 = var_0 + ("+loot" + var_1);
  return var_0;
}

isholidayweapon(var_0, var_1) {
  if (!isdefined(var_1) || var_1 < 0)
  return 0;

  if (var_1 == 6) {
  var_2 = _id_8234(var_0);
  return var_2 == "iw7_ripper" || var_2 == "iw7_lmg03" || var_2 == "iw7_ar57";
  }

  return 0;
}

issummerholidayweapon(var_0, var_1) {
  if (!isdefined(var_1) || var_1 < 0)
  return 0;

  var_2 = _id_8234(var_0);

  if (var_1 == 8)
  return var_2 == "iw7_erad" || var_2 == "iw7_ake" || var_2 == "iw7_sdflmg";

  if (var_1 == 5)
  return var_2 == "iw7_mod2187" || var_2 == "iw7_longshot";

  return 0;
}

ismark2weapon(var_0) {
  if (!isdefined(var_0))
  return 0;

  return var_0 >= 32;
}

isholidayweaponusingdefaultscope(var_0, var_1) {
  var_2 = _id_2496("scope", getweaponbasename(var_0));
  return isdefined(var_2) && scripts\engine\utility::array_contains(var_1, var_2);
}

is_pap_camo(var_0) {
  if (isdefined(level.pap_1_camo) && var_0 == level.pap_1_camo)
  return 1;
  else if (isdefined(level.pap_2_camo) && var_0 == level.pap_2_camo)
  return 1;

  return 0;
}

_id_3225(var_0, var_1, var_2) {
  var_3 = -1;
  var_4 = isdefined(var_1) && is_pap_camo(var_1);

  if (var_0 == "iw7_nunchucks_zm_pap1" || var_0 == "iw7_nunchucks_zm_pap2")
  return var_0 + "+camo" + 222;

  if (!var_4) {
  if (isholidayweapon(var_0, var_2)) {
    var_3 = int(tablelookup("mp/camoTable.csv", 1, "camo89", scripts\engine\utility::getcamotablecolumnindex("weapon_index")));
    return var_0 + "+camo" + var_3;
  }
  else if (issummerholidayweapon(var_0, var_2)) {
    var_3 = int(tablelookup("mp/camoTable.csv", 1, "camo230", scripts\engine\utility::getcamotablecolumnindex("weapon_index")));
    return var_0 + "+camo" + var_3;
  }
  else if ((!isdefined(var_1) || var_1 == "none") && ismark2weapon(var_2)) {
    var_5 = getweaponqualitybyid(var_0, var_2);
    var_6 = undefined;

    switch (var_5) {
    case 1:
      var_6 = "camo99";
      break;
    case 2:
      var_6 = "camo101";
      break;
    case 3:
      var_6 = "camo102";
      break;
    case 4:
      var_6 = "camo103";
      break;
    default:
      break;
    }

    var_3 = int(tablelookup("mp/camoTable.csv", 1, var_6, scripts\engine\utility::getcamotablecolumnindex("weapon_index")));
    return var_0 + "+camo" + var_3;
  }
  }

  if (!isdefined(var_1))
  var_3 = 0;
  else
  var_3 = int(tablelookup("mp/camoTable.csv", 1, var_1, scripts\engine\utility::getcamotablecolumnindex("weapon_index")));

  if (var_3 <= 0) {
  var_5 = getweaponqualitybyid(var_0, var_2);
  var_6 = undefined;

  switch (var_5) {
    case 1:
    var_6 = "camo24";
    break;
    case 2:
    var_6 = "camo19";
    break;
    case 3:
    var_6 = "camo18";
    break;
    default:
    break;
  }

  if (isdefined(var_6))
    var_3 = int(tablelookup("mp/camoTable.csv", 1, var_6, scripts\engine\utility::getcamotablecolumnindex("weapon_index")));
  else
    return var_0;
  }

  return var_0 + "+camo" + var_3;
}

getweaponqualitybyid(var_0, var_1) {
  if (!isdefined(var_1) || var_1 < 0)
  return 0;

  var_2 = getweaponloottable(var_0);
  var_3 = int(tablelookup(var_2, 0, var_1, 4));
  return var_3;
}

_id_3227(var_0, var_1) {
  if (!isdefined(var_1))
  return var_0;

  var_2 = int(tablelookup("mp/reticleTable.csv", 1, var_1, 5));

  if (!isdefined(var_2) || var_2 == 0)
  return var_0;

  var_0 = var_0 + ("+scope" + var_2);
  return var_0;
}

_id_8BBE(var_0) {
  if (!isdefined(self._id_13FA4))
  return 0;

  return scripts\engine\utility::_id_9CEE(self._id_13FA4[var_0]);
}

_id_5B85(var_0, var_1, var_2, var_3) {
  var_4 = int(var_2 * 20);

  for (var_5 = 0; var_5 < var_4; var_5++)
  wait 0.05;
}

_id_F29D(var_0, var_1) {
  var_2 = self._id_B495 - self._id_5037;
  var_3 = var_1 * var_2 + self._id_5037;
  self _meth_80BB(var_0, var_3);
}

_id_77D4(var_0, var_1) {
  if (var_0 + level._id_5221[var_1] > level._id_5220)
  return level._id_5220;

  return var_0 + level._id_5221[var_1];
}

_id_1B88(var_0) {
  var_0 = tolower(var_0);

  if (!isdefined(level._id_1B86))
  return 0;

  if (!isdefined(level._id_1B86[var_0]))
  return 0;

  return level._id_1B86[var_0];
}

_id_61CD() {
  self._id_1B97 = 1;
  self notify("alien_main_loop_restart");
}

_id_22B0(var_0, var_1, var_2) {
  var_3 = [];

  foreach (var_7, var_5 in var_0) {
  if (var_7 == var_1)
    continue;

  if (scripts\engine\utility::_id_9CEE(var_2))
    var_6 = var_7;
  else
    var_6 = var_3.size;

  var_3[var_6] = var_5;
  }

  return var_3;
}

_id_9C52(var_0) {
  var_1 = (0, 0, 1);
  var_2 = 0.85;
  return vectordot(var_0, var_1) > var_2;
}

_id_7CC7(var_0) {
  if (!isdefined(self._id_1138B))
  return [];

  if (!isdefined(self._id_1138B._id_1138C))
  return [];

  if (!self._id_1138B._id_12AE4)
  return self._id_1138B._id_1138C;

  var_1 = _id_0A4A::_id_77D7(var_0);

  if (!isdefined(self._id_1138B._id_1138C[var_1]))
  var_2 = "Synch attack on " + self._id_1138B._id_92BB + " doesn't handle type: " + var_1;

  return self._id_1138B._id_1138C[var_1];
}

_id_80BC(var_0) {
  var_1 = 0;

  foreach (var_3 in var_0)
  var_1 = var_1 + var_3;

  var_5 = randomintrange(0, var_1);
  var_1 = 0;

  foreach (var_7, var_3 in var_0) {
  var_1 = var_1 + var_3;

  if (var_5 <= var_1)
    return var_7;
  }

  return 0;
}

_id_78BC() {
  var_0 = 1073741824;
  var_1 = undefined;

  foreach (var_3 in level.players) {
  var_4 = distancesquared(self.origin, var_3.origin);

  if (isreallyalive(var_3) && var_4 < var_0) {
    var_1 = var_3;
    var_0 = var_4;
  }
  }

  return var_1;
}

_id_7833(var_0, var_1) {
  var_2 = [];

  foreach (var_4 in level.players) {
  if (var_4 _id_9D05())
    var_2[var_2.size] = var_4;
  }

  if (!isdefined(var_0) || !var_0)
  return var_2;

  return scripts\engine\utility::_id_782F(var_1, var_2);
}

_id_9D05(var_0) {
  if (!isplayer(self))
  return 0;

  if (!isdefined(self))
  return 0;

  if (!isdefined(var_0) && _id_0A5B::_id_D0EF(self))
  return 0;

  if (!isalive(self))
  return 0;

  if (self.sessionstate == "spectator")
  return 0;

  return 1;
}

_id_203D(var_0, var_1) {
  foreach (var_3 in level.players) {
  if (distancesquared(var_3.origin, var_0) < var_1)
    return 1;
  }

  return 0;
}

timeoutvofunction_pain(var_0, var_1) {
  wait(var_1);
  level notify(var_0 + "_timed_out");
}

_id_D222(var_0) {
  self endon("disconnect");
  level endon("pain_vo_timed_out");
  level thread timeoutvofunction_pain("pain_vo", 0.5);
  var_1 = 5500;
  var_2 = gettime();

  if (!isdefined(self._id_BF4F))
  self._id_BF4F = var_2 + randomintrange(var_1, var_1 + 2000);
  else if (var_2 < self._id_BF4F)
  return;

  while (_id_0A61::_id_134DF())
  wait 0.1;

  if (isdefined(self._id_134FD)) {
  if (soundexists(self._id_134FD + "plr_pain"))
    self playlocalsound(self._id_134FD + "plr_pain");
  else if (soundexists(self._id_134FD + "pain"))
    self playlocalsound(self._id_134FD + "pain");
  }

  var_3 = "injured_pain_vocal";

  if (isdefined(var_0)) {
  if (isdefined(var_0.agent_type)) {
    switch (var_0.agent_type) {
    case "crab_mini":
      var_3 = "injured_pain_crabgoon";
      break;
    case "crab_brute":
      var_3 = "injured_pain_radactivecrab";
      break;
    case "crab_boss":
      var_3 = "injured_pain_radboss";
      break;
    case "skater":
      var_3 = "injured_pain_skater";
      break;
    case "ratking":
      var_3 = scripts\engine\utility::_id_DC6B(["injured_pain_ratking1", "injured_pain_ratking2", "injured_pain_ratking3"]);
      break;
    default:
      var_3 = "injured_pain_vocal";
      break;
    }
  }
  }

  _id_0A6A::_id_12885(var_3, "zmb_comment_vo");
  self._id_BF4F = var_2 + randomintrange(var_1, var_1 + 1500);
}

_id_D220() {
  level endon("game_ended");
  self endon("disconnect");

  if (_id_9C82(self))
  return;

  if (_id_152E(self))
  return;

  _id_F427(self, 1);
  var_0 = _id_7B64(self);

  if (isdefined(var_0)) {
  if (soundexists(var_0)) {
    while (!_id_152E(self) && !level._id_7669) {
    if (!scripts\engine\utility::_id_9CEE(self._id_13518))
      self playlocalsound(var_0);

    wait 1.5;
    }
  }

  _id_F427(self, 0);
  }
}

_id_9C82(var_0) {
  return scripts\engine\utility::_id_9CEE(var_0._id_9C82);
}

_id_152E(var_0) {
  var_1 = 0.3;
  return var_0.health / var_0.maxhealth > var_1;
}

_id_F427(var_0, var_1) {
  var_0._id_9C82 = var_1;
}

_id_7B64(var_0) {
  if (!level._id_7669) {
  if (var_0._id_134FD == "p1_")
    return "p1_plr_pain";
  else if (var_0._id_134FD == "p2_")
    return "p2_plr_pain";
  else if (var_0._id_134FD == "p3_")
    return "p3_plr_pain";
  else if (var_0._id_134FD == "p4_")
    return "p4_plr_pain";
  else if (var_0._id_134FD == "p5_")
    return "p5_plr_pain";
  else
    return "p3_plr_pain";
  }
}

_id_D64B(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7) {
  var_8 = var_0 - var_1;
  var_9 = vectordot(var_8, var_2);
  var_10 = vectordot(var_8, var_3);

  if (var_9 > var_4)
  return 0;

  if (var_9 < var_5)
  return 0;

  if (isdefined(var_7)) {
  if (abs(var_10) > var_7)
    return 0;
  }

  if (scripts\engine\utility::_id_1E7C(var_2, var_8) > var_6)
  return 0;

  return 1;
}

_id_D5B4(var_0) {
  var_1 = var_0._id_134FD + "good_loot";

  if (_id_0A6A::_id_1B47(var_0, var_1))
  var_0 playlocalsound(_id_0A6A::_id_77ED(var_0, var_1));
  else if (soundexists(var_1))
  var_0 playlocalsound(var_1);
}

_id_5213(var_0) {
  var_1 = "";

  if (isdefined(var_0) && isdefined(var_0.boxtype) && isdefined(level._id_2F30[var_0.boxtype]._id_68B9))
  var_1 = level._id_2F30[var_0.boxtype]._id_68B9;

  thread _id_F78C("deployable_use", var_1, 3);
}

_id_9BF3(var_0) {
  switch (var_0) {
  case "goon4":
  case "goon3":
  case "goon2":
  case "goon":
    return 1;
  default:
    return 0;
  }
}

_id_B35E(var_0, var_1, var_2) {
  _func_139(var_0, var_1, 1);
  wait(var_2);
  _func_139(var_0, var_1, 0);
}

_id_8CC6(var_0) {
  level._id_8CC1 = var_0;
}

_id_1B70() {
  level._id_1B71 = [];
  level._id_1B71[1] = 0.9;
  level._id_1B71[2] = 1.0;
  level._id_1B71[3] = 1.3;
  level._id_1B71[4] = 1.8;
}

_id_D3A5() {
  self endon("death");
  self endon("disconnect");
  self endon("joined_team");
  self endon("joined_spectators");
  self endon("faux_spawn");
  level endon("game_ended");

  for (;;) {
  scripts\engine\utility::waittill_any("damage", "health_perk_upgrade");

  if (!_id_38FF())
    continue;

  var_0 = _id_0A5B::_id_7EF4();
  var_1 = self.health / var_0;

  if (var_1 >= 1) {
    self.health = var_0;
    continue;
  }

  thread _id_8CBF(gettime(), var_1);
  thread _id_2FC6(gettime(), var_1);
  }
}

_id_8CBF(var_0, var_1) {
  self notify("healthRegeneration");
  self endon("healthRegeneration");
  self endon("death");
  self endon("disconnect");
  self endon("joined_team");
  self endon("joined_spectators");
  level endon("game_ended");

  while (isdefined(self._id_F1E8) && self._id_F1E8)
  wait 0.2;

  if (_id_9E2A())
  return;

  var_2 = spawnstruct();
  _id_80E3(var_2);
  scripts\engine\utility::_id_13736(var_2._id_1615, "force_regeneration");

  for (;;) {
  var_3 = _id_0A5B::_id_7EF4();
  var_2 = spawnstruct();
  _id_80E3(var_2);

  if (!_id_0CFD::_id_8B7E()) {
    var_1 = self.health / self.maxhealth;

    if (self.health < int(var_3)) {
    if (var_1 + var_2._id_DE87 > int(1))
      self.health = int(var_3);
    else
      self.health = int(self.maxhealth * (var_1 + var_2._id_DE87));
    }
    else
    break;
  }

  scripts\engine\utility::_id_13736(var_2._id_13846, "force_regeneration");
  }

  self notify("healed");
  _id_0A55::_id_D0FC();
  _id_E247();
}

_id_2FC6(var_0, var_1) {
  self notify("breathingManager");
  self endon("breathingManager");
  self endon("death");
  self endon("disconnect");
  self endon("joined_team");
  self endon("joined_spectators");
  level endon("game_ended");

  if (isusingremote())
  return;

  if (!isplayer(self))
  return;

  self._id_2FC7 = var_0 + 6000 * self._id_DE8E;
  wait(6 * self._id_DE8E);

  if (!level._id_7669) {
  if (self._id_134FD == "p1_") {
    if (!scripts\engine\utility::_id_9CEE(self._id_13518))
    self playlocalsound("p1_breathing_better");
  }
  else if (self._id_134FD == "p2_") {
    if (!scripts\engine\utility::_id_9CEE(self._id_13518))
    self playlocalsound("p2_breathing_better");
  }
  else if (self._id_134FD == "p3_") {
    if (!scripts\engine\utility::_id_9CEE(self._id_13518))
    self playlocalsound("p3_breathing_better");
  }
  else if (self._id_134FD == "p4_") {
    if (!scripts\engine\utility::_id_9CEE(self._id_13518))
    self playlocalsound("p4_breathing_better");
  }
  else if (self._id_134FD == "p5_") {
    if (!scripts\engine\utility::_id_9CEE(self._id_13518))
    self playlocalsound("p5_breathing_better");
  }
  else if (!scripts\engine\utility::_id_9CEE(self._id_13518))
    self playlocalsound("p3_breathing_better");
  }
}

_id_80E3(var_0) {
  level._id_AFE9 = 5000;
  level._id_8CBC = 0.2;
  level._id_9B33 = 0.35;
  level._id_9B31 = 0.5;
  level._id_9B32 = 0.3;
  level._id_D3A4 = 2400;
  level._id_13DCE = 0.1;
  self._id_D884 = _id_0CFF::_id_D87D();

  if (self._id_D884 == 1.0) {
  if (_id_9BA0("faster_health_regen_upgrade") || isdefined(level.purify_active)) {
    var_0._id_1615 = 0.45;
    var_0._id_13846 = 0.045;
    var_0._id_DE87 = 0.1;
  }
  else if (self.health <= 45) {
    var_0._id_1615 = 5;
    var_0._id_13846 = 0.05;
    var_0._id_DE87 = 0.1;
  } else {
    var_0._id_1615 = 2.4;
    var_0._id_13846 = 0.1;
    var_0._id_DE87 = 0.1;
  }
  } else {
  var_0._id_1615 = 2.4 * self._id_D884;
  var_0._id_13846 = 0.1 * self._id_D884;
  var_0._id_DE87 = 0.1;
  }
}

_id_E247(var_0) {
  self endon("disconnect");
  self endon("death");
  level endon("game_ended");
  wait 1.75;
  _id_E248();
}

_id_E248() {
  self.attackers = [];
  self.attackerdata = [];
}

_id_38FF() {
  if (_id_0A5B::_id_D0EF(self))
  return 0;

  return 1;
}

_id_D3E1() {
  level endon("game_ended");
  self endon("death");
  self endon("disconnect");
  self endon("joined_team");
  self endon("joined_spectators");
  wait 2;

  for (;;) {
  wait 0.2;

  if (_id_10050()) {
    if (self._id_134FD == "p1_") {
    if (soundexists("Fem_breathing_hurt"))
      self playlocalsound("Fem_breathing_hurt");
    }
    else
    self playlocalsound("breathing_hurt");

    wait 0.784;
    wait(0.1 + randomfloat(0.8));
  }
  }
}

_id_10050() {
  if (_id_9E2A() || isusingremote() || isdefined(self._id_2FC7) && gettime() < self._id_2FC7 || self.health > self.maxhealth * 0.55 || level._id_7669)
  return 0;
  else
  return 1;
}

_id_9E2A() {
  return isdefined(level._id_8CC1) && level._id_8CC1 || isdefined(self._id_8CC1) && self._id_8CC1;
}

_id_D364() {
  self endon("death");
  self endon("disconnect");
  self endon("joined_team");
  self endon("joined_spectators");
  self endon("faux_spawn");
  self endon("game_ended");

  if (!isdefined(self._id_2C11))
  self._id_2C11 = 0;

  self setrankedplayerdata("cp", "alienSession", "armor", 0);
  var_0 = 0;

  for (;;) {
  scripts\engine\utility::waittill_any("player_damaged", "enable_armor");

  if (!isdefined(self._id_2C11)) {
    if (var_0 > 0) {
    self setrankedplayerdata("cp", "alienSession", "armor", 0);
    var_0 = 0;
    }

    continue;
  }

  if (var_0 != self._id_2C11) {
    var_1 = int(self._id_2C11);
    self setrankedplayerdata("cp", "alienSession", "armor", var_1);
    var_0 = self._id_2C11;
  }
  }
}

_id_1C63(var_0) {
  if (var_0) {
  if (!isdefined(self._id_55DF))
    self._id_55DF = 0;

  self._id_55DF--;

  if (!self._id_55DF)
    self _meth_8438();
  } else {
  if (!isdefined(self._id_55DF))
    self._id_55DF = 0;

  self._id_55DF++;
  self _meth_8437();
  }
}

_id_DED0() {
  self endon("death");
  self endon("stop_phys_sounds");

  for (;;) {
  self waittill("collision", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7);
  level notify("physSnd", self, var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7);
  }
}

_id_83DA() {
  level notify("physics_monitor");
  level endon("physics_monitor");

  for (;;) {
  level waittill("physSnd", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8);

  if (isdefined(var_0) && isdefined(var_0._id_CAF8))
    level thread [[var_0._id_CAF8]](var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8);
  }
}

_id_DECF(var_0, var_1) {
  var_0._id_CAF8 = var_1;
}

_id_1861() {
  if (!scripts\engine\utility::array_contains(level._id_CC0C, self))
  level._id_CC0C = scripts\engine\utility::_id_1756(level._id_CC0C, self);

  level._id_CC0C = scripts\engine\utility::_id_22BC(level._id_CC0C);
}

_id_E11E() {
  if (scripts\engine\utility::array_contains(level._id_CC0C, self))
  level._id_CC0C = scripts\engine\utility::array_remove(level._id_CC0C, self);

  level._id_CC0C = scripts\engine\utility::_id_22BC(level._id_CC0C);
}

_id_65F0(var_0) {
  var_1 = 16384;

  if (level._id_12A83.size) {
  var_2 = sortbydistance(level._id_12A83, var_0.origin);

  if (distance2dsquared(var_2[0].origin, var_0.origin) < var_1)
    return 1;
  }

  if (isdefined(level._id_CC0C) && level._id_CC0C.size) {
  foreach (var_4 in level._id_CC0C) {
    if (!isdefined(var_4))
    continue;

    if (distance2dsquared(var_4.origin, var_0.origin) < var_1)
    return 1;
  }
  }

  if (isdefined(level._id_BE75))
  return [[level._id_BE75]](var_0);

  return 0;
}

_id_F313(var_0, var_1, var_2) {
  if (isdefined(var_2._id_4B5C))
  var_2._id_4B5C = undefined;

  var_2._id_4B5C = spawnstruct();
  var_2._id_4B5C._id_0195 = var_0;
  var_2._id_4B5C._id_E2C3 = var_1;
}

_id_DFE0(var_0) {
  var_0 setclientomnvar("zom_crafted_weapon", 0);
  var_0._id_4B5C = undefined;
}

_id_9BD8() {
  return level.gametype == "escape";
}

_id_A021(var_0) {
  self endon("death");
  level endon("game_ended");
  self notify(var_0);
  self endon(var_0);
  self.owner waittill("disconnect");

  foreach (var_2 in level.players) {
  if (var_2 _id_9D05(1)) {
    self.owner = var_2;

    if (self.classname != "script_model")
    self _meth_8336(self.owner);

    break;
  }
  }

  thread _id_A021(var_0);
}

_id_E2CC() {
  if (isdefined(self._id_E2DF)) {
  giveperk(self._id_E2DF);
  self._id_E2DF = undefined;
  }
}

_id_1365D() {
  self endon("death");
  self endon("disconnect");
  level endon("game_ended");
  wait 0.05;
  _id_E2CC();
}

_id_E077() {
  if (_id_12D6("specialty_explosivebullets")) {
  self._id_E2DF = "specialty_explosivebullets";
  _id_1430("specialty_explosivebullets");
  }
}

_id_A030(var_0, var_1, var_2) {
  self endon("death");
  level endon("game_ended");

  if (!isdefined(self._id_AC71))
  self._id_AC71 = var_1;

  if (isdefined(var_0))
  self._id_AC71 = var_0;

  while (self._id_AC71) {
  wait 1.0;
  _id_0A56::waittillhostmigrationdone();

  if (!isdefined(self._id_3A9D))
    self._id_AC71 = max(0, self._id_AC71 - 1.0);
  }

  while (isdefined(self) && isdefined(self._id_9B05))
  wait 0.05;

  if (isdefined(self._id_13E61))
  self._id_13E61 delete();

  if (isdefined(var_2))
  self notify(var_2);
  else
  self notify("death");
}

_id_A025(var_0) {
  self endon("placed");
  self endon("death");
  var_0 endon("disconnect");
  var_1 = var_0 scripts\engine\utility::_id_13734("death", "last_stand");
  var_0 notify("force_cancel_placement");
}

_id_A026(var_0) {
  self endon("placed");
  self endon("death");
  var_0 endon("last_stand");
  var_0 waittill("disconnect");

  if (isdefined(self._id_3A9E))
  self._id_3A9E delete();
  else if (isdefined(self._id_3AA1))
  self._id_3AA1 delete();
  else if (isdefined(self._id_3A9B))
  self._id_3A9B delete();
  else if (isdefined(self._id_3A9C))
  self._id_3A9C delete();
  else if (isdefined(self._id_3A9A))
  self._id_3A9A delete();
  else if (isdefined(self._id_3AA4))
  self._id_3AA4 delete();

  self delete();
}

_id_A027(var_0) {
  self endon("placed");
  self endon("death");
  var_0 endon("last_stand");
  level waittill("game_ended");
  self delete();
}

_id_FF18(var_0, var_1, var_2) {
  if (!isdefined(var_0))
  return 0;

  if (!isalive(var_0))
  return 0;

  if (!isagent(var_0))
  return 0;

  if (!isdefined(var_0.agent_type))
  return 0;

  if (!isdefined(var_0._id_9D25) || !var_0._id_9D25)
  return 0;

  if (!isdefined(var_1) && isdefined(var_0._id_6622) && !var_0._id_6622)
  return 0;

  if (scripts\engine\utility::_id_9CEE(var_0._id_B36E))
  return 0;

  if (!isdefined(var_0.team))
  return 0;

  if (var_0.agent_type == "zombie_brute" || var_0.agent_type == "zombie_ghost" || var_0.agent_type == "zombie_grey")
  return 0;

  if (!scripts\engine\utility::_id_9CEE(var_2) && scripts\engine\utility::_id_9CEE(var_0._id_9CDD))
  return 0;

  if (scripts\engine\utility::_id_9CEE(var_0._id_9B96))
  return 0;

  return 1;
}

_id_F55F(var_0) {
  _id_93F5();
  _id_F560(var_0);
}

_id_F560(var_0) {
  _func_1C1("zombie_quest_piece", var_0, 1);
  setclientmatchdata("questPieces", "quest_piece_" + var_0, 1);
}

set_completed_quest_mark(var_0) {
  _func_1C1("zm_completed_quest_marks", var_0, 1);
}

_id_93F5() {
  if (!isdefined(level._id_C1F8))
  level._id_C1F8 = 0;

  level._id_C1F8++;

  if (level.script == "cp_zmb") {
  if (level._id_C1F8 == level._id_477B) {
    foreach (var_1 in level.players)
    var_1 _id_0D2A::_id_12D7C("STICKER_COLLECTOR", 24);
  }
  }
}

_id_D4FB(var_0, var_1, var_2) {
  var_0 playlocalsound(var_1);
  var_0 playsoundtoteam(var_2, "allies", var_0);
  var_0 playsoundtoteam(var_2, "axis", var_0);
}

_id_E76A(var_0) {
  if (var_0 - int(var_0) >= 0.5)
  return int(var_0 + 1);
  else
  return int(var_0);
}

_id_4D0D(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8) {
  if (!_id_FF13(var_0))
  return;

  var_0 endon("death");

  if (!isdefined(var_3))
  var_3 = 600;

  if (!isdefined(var_2))
  var_2 = 5;

  if (!isdefined(var_4))
  var_4 = "MOD_UNKNOWN";

  if (!isdefined(var_5))
  var_5 = "iw7_dot_zm";

  if (isdefined(var_7)) {
  var_0 _id_F831(var_0, var_7, 1);

  if (isdefined(level._id_EF43))
    var_0 thread [[level._id_EF43]](var_0);
  }

  var_9 = 0;
  var_10 = 6;
  var_11 = var_2 / var_10;
  var_12 = var_3 / var_10;

  for (var_13 = 0; var_13 < var_10; var_13++) {
  wait(var_11);

  if (isalive(var_0)) {
    var_0._id_6E82 = gettime() + 500;

    if (var_0.health - var_12 <= 0) {
    if (isdefined(var_8))
      level notify(var_8);
    }

    if (isdefined(var_1)) {
    var_0 _meth_80B0(var_12, var_0.origin, var_1, var_1, var_4, var_5);
    continue;
    }

    var_0 _meth_80B0(var_12, var_0.origin, undefined, undefined, var_4, var_5);
  }
  }

  if (isdefined(var_7))
  var_0 _id_F831(var_0, var_7);

  if (scripts\engine\utility::_id_9CEE(var_0._id_B36E))
  var_0._id_B36E = undefined;

  if (scripts\engine\utility::_id_9CEE(var_0._id_6E82))
  var_0._id_6E82 = undefined;
}

_id_F831(var_0, var_1, var_2) {
  switch (var_1) {
  case "combinedArcane":
  case "combinedarcane":
    if (scripts\engine\utility::_id_9CEE(var_2))
    var_0._id_9B51 = 1;
    else
    var_0._id_9B51 = undefined;

    break;
  case "burning":
    if (scripts\engine\utility::_id_9CEE(var_2))
    var_0._id_9B81 = var_2;
    else
    var_0._id_9B81 = undefined;

    break;
  case "electrified":
    if (scripts\engine\utility::_id_9CEE(var_2)) {
    var_0._id_9BC9 = var_2;
    var_0._id_0033 = 1;
    var_0._id_11190 = gettime() + 3000;
    }
    else
    {
    var_0._id_9BC9 = undefined;
    var_0._id_0033 = 0;
    }

    break;
  case "shocked":
    if (scripts\engine\utility::_id_9CEE(var_2))
    var_0._id_11196 = var_2;
    else
    var_0._id_11196 = undefined;

    break;
  case "chemBurn":
  case "chemburn":
    if (scripts\engine\utility::_id_9CEE(var_2))
    var_0._id_9B8A = 1;
    else
    var_0._id_9B8A = undefined;

    break;
  default:
    break;
  }
}

_id_FF13(var_0) {
  if (isdefined(var_0.agent_type) && (var_0.agent_type == "c6" || var_0.agent_type == "zombie_brute" || var_0.agent_type == "zombie_grey" || var_0.agent_type == "zombie_ghost"))
  return 0;

  return 1;
}

_id_12E3F(var_0, var_1, var_2, var_3, var_4) {
  self endon("death");
  self endon("disconnect");
  level endon("game_ended");
  var_5 = var_2._id_3AA7;
  var_6 = var_2._id_3AA6;
  var_7 = var_2._id_CC25;
  var_8 = var_2._id_CC22;
  var_9 = var_2._id_B924;
  var_10 = var_2._id_B925;
  var_11 = var_2._id_CC0A;
  var_12 = var_2._id_CC28;
  var_13 = var_2._id_38E3;
  var_0 endon("placed");
  var_0 endon("death");
  var_0._id_3872 = 1;
  var_14 = -1;

  for (;;) {
  var_15 = self canplayerplacesentry(1, var_7);
  var_0.origin = var_15["origin"];
  var_0.angles = var_15["angles"];
  var_1.origin = var_0.origin + var_5;
  var_1.angles = var_0.angles + var_6;

  if (isdefined(self._id_C598))
    var_0._id_3872 = 0;
  else
    var_0._id_3872 = self isonground() && var_15["result"] && abs(var_0.origin[2] - self.origin[2]) < var_8;

  if (_id_65F0(var_0))
    var_0._id_3872 = 0;

  if (isdefined(var_3) && isdefined(level._id_563D) && isdefined(level._id_4D7C)) {
    if (var_0 istouching(level._id_4D7C))
    var_0._id_3872 = 0;
  }

  if (isdefined(var_15["entity"]))
    var_0._id_BD3B = var_15["entity"];
  else
    var_0._id_BD3B = undefined;

  if (var_0._id_3872 != var_14) {
    if (var_0._id_3872) {
    if (!isdefined(var_4))
      var_1 setmodel(var_9);

    if (isdefined(var_0._id_6DEC))
      self _meth_80F4(var_11);
    else
      self _meth_80F4(var_12);
    }
    else
    {
    if (!isdefined(var_4))
      var_1 setmodel(var_10);

    self _meth_80F4(var_13);
    }
  }

  var_14 = var_0._id_3872;
  wait 0.05;
  }
}

_id_1308C(var_0, var_1) {
  if (var_0 cangiveandfireoffhand(var_0 getvalidtakeweapon()) && !var_0 _meth_8477()) {
  var_0 setweaponammostock(var_1, 1);
  var_0 _meth_84FF(var_1);
  }
}

_id_9B97() {
  return getdvar("scr_codxp", "") != "";
}

too_close_to_other_interactions(var_0) {
  var_1 = sortbydistance(level._id_4B88, var_0);

  if (distancesquared(var_1[0].origin, var_0) < 9216)
  return 1;

  return 0;
}

getweapontoswitchbackto() {
  if (isdefined(self._id_A92C))
  var_0 = self._id_A92C;
  else
  var_0 = self getcurrentweapon();

  var_1 = 0;
  var_2 = level._id_17D7;

  if (var_0 == "none")
  var_1 = 1;
  else if (scripts\engine\utility::array_contains(var_2, var_0))
  var_1 = 1;
  else if (scripts\engine\utility::array_contains(var_2, getweaponbasename(var_0)))
  var_1 = 1;
  else if (_id_9C42(var_0, 1) || isdefined(level.primary_melee_weapons) && scripts\engine\utility::array_contains(level.primary_melee_weapons, var_0))
  var_1 = 1;

  if (var_1) {
  var_3 = self _meth_8173();

  for (var_4 = 0; var_4 < var_3.size; var_4++) {
    if (var_3[var_4] == "none")
    continue;
    else if (scripts\engine\utility::array_contains(var_2, var_3[var_4]))
    continue;
    else if (scripts\engine\utility::array_contains(var_2, getweaponbasename(var_3[var_4])))
    continue;
    else if (_id_9C42(var_3[var_4], 1) || isdefined(level.primary_melee_weapons) && scripts\engine\utility::array_contains(level.primary_melee_weapons, var_3[var_4]))
    continue;
    else if (!_id_0A6B::_id_9F0E(var_3[var_4]))
    continue;
    else
    {
    var_1 = 0;
    var_0 = var_3[var_4];
    break;
    }
  }
  }

  if (var_1) {
  var_0 = "iw7_fists_zm";

  if (!self hasweapon(var_0))
    _id_12C6(var_0, undefined, undefined, 1);
  }

  return var_0;
}

getvalidtakeweapon(var_0) {
  var_1 = self getcurrentweapon();
  var_2 = 0;
  var_3 = level._id_17D7;

  if (isdefined(var_0))
  var_3 = scripts\engine\utility::_id_227F(var_0, var_3);

  if (var_1 == "none")
  var_2 = 1;
  else if (scripts\engine\utility::array_contains(var_3, var_1))
  var_2 = 1;
  else if (scripts\engine\utility::array_contains(var_3, getweaponbasename(var_1)))
  var_2 = 1;
  else if (_id_9C42(var_1, 1))
  var_2 = 1;

  if (isdefined(self.last_valid_weapon) && self hasweapon(self.last_valid_weapon) && var_2) {
  var_1 = self.last_valid_weapon;

  if (var_1 == "none")
    var_2 = 1;
  else if (scripts\engine\utility::array_contains(var_3, var_1))
    var_2 = 1;
  else if (scripts\engine\utility::array_contains(var_3, getweaponbasename(var_1)))
    var_2 = 1;
  else if (_id_9C42(var_1, 1))
    var_2 = 1;
  else
    var_2 = 0;
  }

  if (var_2) {
  var_4 = self _meth_8173();

  for (var_5 = 0; var_5 < var_4.size; var_5++) {
    if (var_4[var_5] == "none")
    continue;
    else if (scripts\engine\utility::array_contains(var_3, var_4[var_5]))
    continue;
    else if (scripts\engine\utility::array_contains(var_3, getweaponbasename(var_4[var_5])))
    continue;
    else if (_id_9C42(var_4[var_5], 1))
    continue;
    else
    {
    var_2 = 0;
    var_1 = var_4[var_5];
    break;
    }
  }
  }

  return var_1;
}

getcurrentcamoname(var_0) {
  var_1 = getweaponcamoname(var_0);

  if (!isdefined(var_1))
  return undefined;

  switch (var_1) {
  case "camo0":
    return "camo00";
  case "camo1":
    return "camo01";
  case "camo2":
    return "camo02";
  case "camo3":
    return "camo03";
  case "camo4":
    return "camo04";
  case "camo5":
    return "camo05";
  case "camo6":
    return "camo06";
  case "camo7":
    return "camo07";
  case "camo8":
    return "camo08";
  case "camo9":
    return "camo09";
  default:
    return var_1;
  }

  return undefined;
}

add_to_notify_queue(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8) {
  if (!isdefined(self.notify_queue))
  self.notify_queue = [];

  if (!isdefined(self.notify_queue[var_0]))
  self.notify_queue[var_0] = 0;
  else
  self.notify_queue[var_0]++;

  if (self.notify_queue[var_0] > 0)
  wait(0.05 * self.notify_queue[var_0]);

  self notify(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8);
  waittillframeend;

  if (isdefined(self.notify_queue[var_0])) {
  self.notify_queue[var_0]--;

  if (self.notify_queue[var_0] < 1)
    self.notify_queue[var_0] = undefined;
  }
}

take_fists_weapon(var_0) {
  foreach (var_2 in var_0 _meth_8173()) {
  if (issubstr(var_2, "iw7_fists"))
    var_0 _meth_83B8(var_2);
  }
}

playlocalsound_safe(var_0) {
  if (soundexists(var_0))
  self playlocalsound(var_0);
}

stoplocalsound_safe(var_0) {
  if (soundexists(var_0))
  self stopolcalsound(var_0);
}

playsoundatpos_safe(var_0, var_1) {
  if (soundexists(var_1))
  playloopsound(var_0, var_1);
}

agentcantbeignored() {
  return isdefined(self.agent_type) && isdefined(level.ignoreimmune) && scripts\engine\utility::array_contains(level.ignoreimmune, self.agent_type);
}

agentisfnfimmune() {
  return isdefined(self.agent_type) && isdefined(level.fnfimmune) && scripts\engine\utility::array_contains(level.fnfimmune, self.agent_type);
}

agentisinstakillimmune() {
  return isdefined(self.agent_type) && isdefined(level.instakillimmune) && scripts\engine\utility::array_contains(level.instakillimmune, self.agent_type);
}

agentisspecialzombie() {
  return isdefined(self.agent_type) && isdefined(level.specialzombie) && scripts\engine\utility::array_contains(level.specialzombie, self.agent_type);
}

firegesturegrenade(var_0, var_1) {
  var_2 = var_0 getcurrentweapon();

  if (cangiveandfireoffhand(var_2)) {
  var_0 setweaponammostock(var_1, 1);
  var_0 _meth_84FF(var_1);
  }
}

cangiveandfireoffhand(var_0) {
  if (!isdefined(var_0))
  return 1;

  if (isdefined(level.invalid_gesture_weapon)) {
  if (isdefined(level.invalid_gesture_weapon[getweaponbasename(var_0)]))
    return 0;
  else
    return 1;
  }
  else
  return 1;
}

play_interaction_gesture(var_0) {
  if (!isdefined(var_0))
  var_0 = "iw7_powerlever_zm";

  if (getweaponbasename(self getcurrentweapon()) != "iw7_penetrationrail_mp")
  thread firegesturegrenade(self, var_0);
}

deactivatebrushmodel(var_0, var_1) {
  var_0 notsolid();

  if (scripts\engine\utility::_id_9CEE(var_1))
  var_0 hide();
}

_id_DCD5() {
  if (!isplayer(self))
  return 0;

  return level.onlinegame && !self._id_13114;
}

_id_316C(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9) {
  thread _id_316D(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9);
}

_id_316D(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9) {
  self endon("disconnect");
  level endon("game_ended");
  var_10 = "bufferedNotify_" + var_0;
  self notify(var_10);
  self endon(var_10);

  if (!isdefined(self._id_316B))
  self._id_316B = [];

  if (!isdefined(self._id_316B[var_0]))
  self._id_316B[var_0] = [];

  var_11 = spawnstruct();
  var_11._id_C8E5 = var_1;
  var_11._id_C8E6 = var_2;
  var_11._id_C8E7 = var_3;
  var_11._id_C8E8 = var_4;
  var_11._id_C8E9 = var_5;
  var_11._id_C8EA = var_6;
  var_11._id_C8EB = var_7;
  var_11._id_C8EC = var_8;
  var_11.param9 = var_9;
  self._id_316B[var_0][self._id_316B[var_0].size] = var_11;
  waittillframeend;

  while (self._id_316B[var_0].size > 0) {
  var_11 = self._id_316B[var_0][0];
  self notify(var_0, var_11._id_C8E5, var_11._id_C8E6, var_11._id_C8E7, var_11._id_C8E8, var_11._id_C8E9, var_11._id_C8EA, var_11._id_C8EB, var_11._id_C8EC, var_11.param9);
  self._id_316B[var_0] = _id_22B0(self._id_316B[var_0], 0);
  wait 0.05;
  }
}

debugprintline(var_0) {}
