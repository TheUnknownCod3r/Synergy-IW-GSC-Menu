/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2645.gsc
***************************************/

init() {
  scripts\engine\utility::_id_1115B();
  _id_F6BD();
  _id_F6BA();
  _id_0A77::_id_F305();
  setupcallbacks();
  _id_0A77::_id_980B();
  _id_0A77::_id_9892();
  _id_FAAB();
  _id_F6BB();
  _id_F6BF();
  _id_F6BC();
  _id_AE18();
  _id_10958();
  _id_97F7();
  _id_FAAA();
  _id_9817();
  _id_988B();
  scripts\common\fx::_id_980A();
  scripts\mp\callbacksetup::setupdamageflags();
  _id_0A60::init();
  _id_0A53::main();
  _id_0A5E::_id_3214();
  _id_0A51::init();
  _id_0A5B::_id_9654();

  if (_id_100BC())
  level thread _id_132A3();

  level.spawnmins = (0, 0, 0);
  level.spawnmaxs = (0, 0, 0);
  level.mapcenter = findboxcenter(level.spawnmins, level.spawnmaxs);
  setmapcenter(level.mapcenter);
}

findboxcenter(var_0, var_1) {
  var_2 = (0, 0, 0);
  var_2 = var_1 - var_0;
  var_2 = (var_2[0] / 2, var_2[1] / 2, var_2[2] / 2) + var_0;
  return var_2;
}

_id_F6BD() {
  level._id_1307 = 1;
  level._id_10A56 = _func_114();
  level.onlinegame = getdvarint("onlinegame");
  level.rankedmatch = level.onlinegame && !getdvarint("xblive_privatematch") || getdvarint("force_ranking");
  level.script = tolower(getdvar("mapname"));
  level.gametype = tolower(getdvar("ui_gametype"));
  level._id_115DA = ["axis", "allies"];
  level._id_C74B["allies"] = "axis";
  level._id_C74B["axis"] = "allies";
  level._id_BDCC = 0;
  level.teambased = 1;
  level.objectivebased = 0;
  level._id_74C2 = [];
  level.createfx_enabled = getdvar("createfx") != "";
  level.spawnmins = (0, 0, 0);
  level.spawnmaxs = (0, 0, 0);
  level._id_8B38 = 0;
  level._id_C22E = 0;
  level._id_DDDA = [];
}

_id_F6BA() {
  setdvar("ui_inhostmigration", 0);
  setdvar("camera_thirdPerson", getdvarint("scr_thirdPerson"));
  setdvar("sm_sunShadowScale", 1);
  setdvar("r_specularcolorscale", 2.5);
  setdvar("r_diffusecolorscale", 1);
  setdvar("r_lightGridEnableTweaks", 0);
  setdvar("r_lightGridIntensity", 1);
  setdvar("bg_compassShowEnemies", getdvar("scr_game_forceuav"));
  setdvar("isMatchMakingGame", _id_0A77::matchmakinggame());
  setdvar("ui_overtime", 0);
  setdvar("ui_allow_teamchange", 1);
  setdvar("g_deadChat", 1);
  setdvar("min_wait_for_players", 5);
  setdvar("ui_friendlyfire", 0);
  setdvar("cg_drawFriendlyHUDGrenades", 0);
  setdvar("cg_drawCrosshair", scripts\engine\utility::ter_op(level._id_8B38 == 1, 0, 1));
  setdvar("cg_drawCrosshairNames", 1);
  setdvar("cg_drawFriendlyNamesAlways", 0);
}

setupcallbacks() {
  level.callbackstartgametype = ::_id_4631;
  level.callbackplayerconnect = ::_id_5043;
  level.callbackplayerdisconnect = ::_id_5045;
  level.callbackplayerdamage = ::_id_5044;
  level.callbackplayerkilled = ::_id_5046;
  level.callbackplayermigrated = ::_id_5049;
  level.callbackhostmigration = ::_id_503E;
  level.getspawnpoint = ::_id_503B;
  level.onspawnplayer = ::blank;
  level.onprecachegametype = ::blank;
  level.onstartgametype = ::blank;
  level._id_D3D5 = ::_id_5048;
  level._id_97C2 = _id_0A4A::_id_97C2;
  level._id_F635 = _id_0A4A::_id_F290;
  level._id_190A = _id_0A4A::_id_1313C;
  level.agentfunc = _id_0A4A::agentfunc;
  level._id_7EC5 = _id_0A4A::_id_7EC5;
  level._id_184B = _id_0A4A::_id_184B;
  level.callbackplayerlaststand = _id_0A5B::_id_373E;
  level.endgame = _id_0A51::endgame;
  level._id_72BF = _id_0A51::_id_72BF;
}

_id_AE18() {
  level._effect["slide_dust"] = loadfx("vfx/core/screen/vfx_scrnfx_tocam_slidedust_m");
}

_id_5044(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11) {}

_id_5046(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8) {}

_id_FAAB() {
  var_0 = ["trigger_multiple", "trigger_once", "trigger_use", "trigger_radius", "trigger_lookat", "trigger_damage"];

  foreach (var_2 in var_0) {
  var_3 = getentarray(var_2, "classname");

  for (var_4 = 0; var_4 < var_3.size; var_4++) {
  if (isdefined(var_3[var_4]._id_EE89))
  var_3[var_4].targetname = var_3[var_4]._id_EE89;

  if (isdefined(var_3[var_4].targetname))
  level thread _id_69AA(var_3[var_4]);
  }
  }
}

_id_10958() {
  level thread _id_11ADC();
  level thread _id_11B00();
  level thread _id_11ACB();
}

_id_11ADC() {
  for (;;) {
  level._id_85D5 = getentarray("grenade", "classname");
  scripts\engine\utility::waitframe();
  }
}

_id_11B00() {
  for (;;) {
  level._id_B898 = getentarray("rocket", "classname");
  scripts\engine\utility::waitframe();
  }
}

_id_11ACB() {
  for (;;) {
  level._id_3A59 = getentarray("care_package", "targetname");
  scripts\engine\utility::waitframe();
  }
}

_id_5048() {
  if (scripts\engine\utility::_id_9CEE(self.keep_perks)) {
  if (_id_0A77::_id_8BBE("perk_machine_tough"))
  return 200;
  else
  return 100;
  }
  else
  return 100;
}

_id_F6BB() {
  game["thermal_vision"] = "thermal_mp";
  game["attackers"] = "allies";
  game["defenders"] = "axis";
  game["allies_outfit"] = "urban";
  game["axis_outfit"] = "woodland";
  game["clientid"] = 0;
  game["roundsPlayed"] = 0;
  game["state"] = "playing";
  game["status"] = "normal";
  game["roundsWon"] = [];
}

_id_F6BF() {
  visionsetnaked("", 0);
  visionsetnight("default_night_mp");
  visionsetmissilecam("missilecam");
  visionsetthermal(game["thermal_vision"]);
  visionsetpain("", 0);
}

_id_F6BC() {
  setnojipscore(0);
  setnojiptime(0);
}

_id_503B() {
  return _id_7DDA(scripts\engine\utility::_id_8180("default_player_start", "targetname"));
}

_id_7DDA(var_0) {
  var_1 = self getentitynumber();

  if (var_1 == 4)
  var_1 = 1;

  return var_0[var_1];
}

_id_5038() {
  level._id_7669 = 1;
  setomnvar("allow_server_pause", 0);
  level notify("game_ended", "allies");
  scripts\engine\utility::waitframe();
  exitlevel(0);
}

_id_4631() {
  [[level.onprecachegametype]]();
  _id_E256();
  _id_E255();
  _id_0CFE::_id_98B1();
  _id_0CFF::_id_98C0();
  _id_0A70::init();
  _id_0A6F::init();
  thread _id_0D15::init();
  _id_0A5E::init();
  thread scripts\cp\contracts_coop::init();
  level thread _id_E896();
  level thread _id_8489();
  level thread _id_10D9F();
  game["gamestarted"] = 1;
}

_id_E256() {
  level._id_115C6["allies"] = 0;
  level._id_115C6["axis"] = 0;
  level._id_115C6["spectator"] = 0;
  level._id_8C2A["allies"] = 0;
  level._id_8C2A["axis"] = 0;
  level._id_6BAA = 0;
  level._id_7669 = 0;
  level._id_72B3 = 0;
  level._id_90A1 = 0;
  level._id_8487 = 10;
  level.ingraceperiod = level._id_8487;
  level._id_C08A = getentarray("noragdoll", "targetname");
  level._id_740A = 0;
  level._id_10DFF = gettime();
}

_id_E255() {
  level.players = [];
  level._id_C928 = [];
  level._id_3CB5 = [];
  level._id_8DD3 = [];
  level._id_12A83 = [];
  level._id_935F = [];
  level._id_12B14 = [];
  level._id_27EF = [];
}

_id_E896() {
  level notify("coop_pre_match");
  level endon("game_ended");
  level endon("coop_pre_match");
  _id_0A77::_id_766E("prematch_done", 0);
  setomnvar("ui_prematch_period", 1);

  if (isdefined(level._id_D84B))
  [[level._id_D84B]]();

  _id_0A77::_id_766F("prematch_done");
  setomnvar("ui_prematch_period", 0);
}

_id_8489() {
  level notify("coop_grace_period");
  level endon("game_ended");
  level endon("coop_grace_period");

  while (getactiveclientcount() == 0)
  scripts\engine\utility::waitframe();

  while (level.ingraceperiod > 0) {
  wait 1.0;
  level.ingraceperiod--;
  }

  level.ingraceperiod = 0;
}

_id_10D9F() {
  [[level.onstartgametype]]();
}

_id_100BC() {
  return !level._id_4542 && (getdvar("dedicated") == "dedicated LAN server" || getdvar("dedicated") == "dedicated internet server");
}

_id_132A3() {
  for (;;) {
  if (level.rankedmatch)
  exitlevel(0);

  if (!getdvarint("xblive_privatematch"))
  exitlevel(0);

  if (getdvar("dedicated") != "dedicated LAN server" && getdvar("dedicated") != "dedicated internet server")
  exitlevel(0);

  wait 5;
  }
}

_id_5043() {
  self endon("disconnect");
  self._id_02C7 = "hud_status_connecting";
  self waittill("begin");
  self._id_02C7 = "";
  var_0 = gettime();
  level notify("connected", self);
  game["clientid"]++;
  _id_98BC();
  _id_F7F0();
  _id_97E9();
  _id_FAE7();
  _id_98B9();
  _id_988E();
  _id_0CFF::_id_98BA();
  _id_0CFC::_id_95C1();
  self._id_C016 = 0;
  self._id_C004 = 0;

  if (_id_0A77::_id_462B("outline"))
  thread _id_0A62::_id_D3DF();

  thread _id_0A6A::_id_97CC();
  thread _id_0A5E::_id_12ED0();

  if (self ishost())
  level.player = self;

  if (!level.teambased)
  game["roundsWon"][self.guid] = 0;

  waittillframeend;
  _id_1810(self);

  if (game["state"] == "postgame") {
  self._id_4530 = 1;
  self setclientdvars("cg_drawSpectatorMessages", 0);
  _id_108DD();
  return;
  }

  if (isai(self) && isdefined(level.bot_funcs) && isdefined(level.bot_funcs["think"]))
  self thread [[level.bot_funcs["think"]]]();

  level endon("game_ended");

  if (isdefined(level._id_90A9))
  thread _id_0A56::_id_90AA();

  if (isdefined(level._id_C56F))
  [[level._id_C56F]]();

  if (!isai(self))
  _id_D3D9();

  _id_108F2();
}

_id_D3D9() {
  thread _id_102EC();
  thread _id_72C1();
}

_id_F7F0() {
  self.guid = _id_0A77::_id_81EC();
  self._id_41F0 = game["clientid"];
  self._id_13114 = self isusingonlinedataoffline();
  self.connected = 1;
  self._id_8C2A = 0;
  self.waitingtospawn = 0;
  self._id_138DD = 0;
  self._id_BCF6 = 1;
  self._id_C2AD = 1;
  self._id_98F3 = 0;
}

_id_97E9() {
  _id_97EA();
  self setclientdvars("cg_drawSpectatorMessages", 1, "cg_deadChatWithDead", 0, "cg_deadChatWithTeam", 1, "cg_deadHearTeamLiving", 1, "cg_deadHearAllLiving", 0, "ui_altscene", 0);

  if (level.teambased)
  self setclientdvar("cg_everyonehearseveryone", 0);
}

_id_97EA() {
  if (level._id_10A56 || self issplitscreenplayer()) {
  self setclientdvars("cg_fovscale", "0.75");
  setdvar("r_materialBloomHQScriptMasterEnable", 0);
  }
  else
  self setclientdvars("cg_fovscale", "1");
}

_id_FAE7() {
  self._id_EB6A = [];

  for (var_0 = 1; var_0 <= 4; var_0++) {
  self._id_EB6A[var_0] = spawnstruct();
  self._id_EB6A[var_0].type = "";
  self._id_EB6A[var_0]._id_0195 = undefined;
  }

  if (!level._id_4542) {
  for (var_0 = 5; var_0 <= 8; var_0++) {
  self._id_EB6A[var_0] = spawnstruct();
  self._id_EB6A[var_0].type = "";
  self._id_EB6A[var_0]._id_0195 = undefined;
  }
  }
}

_id_98B9() {
  self._id_CA5B = [];
  self._id_CA61 = [];
}

_id_102EC() {
  self endon("disconnect");

  for (;;) {
  self waittill("sprint_slide_begin");
  self _meth_8241(level._effect["slide_dust"], self geteye());
  }
}

_id_72C1() {
  self endon("disconnect");
  level endon("game_ended");

  for (;;) {
  self waittill("luinotifyserver", var_0, var_1);

  if (var_0 == "arcade_off")
  self notify("adjustedStance");

  if (var_0 == "end_game") {
  level thread [[level._id_72BF]]();
  self notify("disconnect");
  }
  }
}

_id_108DD(var_0) {
  _id_F726();
  var_1 = self._id_72E0;
  _id_108F2();
  self setclientdvar("cg_everyoneHearsEveryone", 1);
  self setdepthoffield(0, 128, 512, 4000, 6, 1.8);

  if (level._id_4542)
  self setclientdvar("cg_fov", "90");

  _id_0A77::updatesessionstate("intermission");
}

_id_F726() {
  var_0 = _id_7ED8();
  _id_F717(var_0.origin, var_0.angles);
}

_id_F717(var_0, var_1) {
  self._id_72E2 = var_0;
  self._id_72E0 = var_1;
}

_id_7ED8() {
  var_0 = getentarray("mp_global_intermission", "classname");
  return var_0[0];
}

_id_108F2(var_0) {
  thread _id_108F4(var_0);
}

_id_108F4(var_0) {
  self endon("disconnect");
  self endon("joined_spectators");
  level endon("game_ended");

  if (self.waitingtospawn)
  return;

  _id_136E9();
  _id_108F3(var_0);
}

_id_136E9() {
  self.waitingtospawn = 1;

  if (_id_0A77::isusingremote())
  self waittill("stopped_using_remote");

  self.waitingtospawn = 0;
}

_id_108F3(var_0) {
  self notify("spawned");
  self notify("started_spawnPlayer");

  if (level._id_7669)
  self spawn(_id_8135(self, 1), _id_8132(self));
  else
  self spawn(_id_8135(self), _id_8132(self));

  _id_E262();
  _id_E261();
  _id_E263();
  resetplayerdamagemodifiers();
  var_0 = scripts\engine\utility::ter_op(isdefined(var_0), var_0, 0);

  if (!var_0)
  _id_C07F();

  if (isai(self))
  _id_10828(var_0);

  [[level.onspawnplayer]]();

  if (!scripts\engine\utility::_id_6E25("introscreen_over"))
  _id_0A77::_id_7385(1);

  self [[level._id_4C55]](var_0);

  if (getdvarint("camera_thirdPerson"))
  _id_0A77::_id_F887(1);

  if (_id_1001B())
  _id_0A77::_id_7385(1);

  waittillframeend;
  self notify("spawned_player");
  level notify("player_spawned", self);
}

_id_E262() {
  self setclientomnvar("ui_options_menu", 0);
  self setclientomnvar("ui_hud_shake", 0);
}

_id_E261() {
  self _meth_83AA();
  self _meth_83A9("damage_heavy");
  self setdepthoffield(0, 0, 512, 512, 4, 0);

  if (level._id_4542)
  self setclientdvar("cg_fov", "65");
}

resetplayerdamagemodifiers() {
  if (isdefined(self._id_17DF)) {
  var_0 = getarraykeys(self._id_17DF);

  foreach (var_2 in var_0)
  _id_0A77::_id_E0E6(var_2, 1);
  }

  if (isdefined(self._id_BDC8)) {
  var_0 = getarraykeys(self._id_BDC8);

  foreach (var_2 in var_0)
  _id_0A77::_id_E0E6(var_2, 0);
  }
}

_id_E263() {
  var_0 = _id_8144();
  self.team = var_0;
  self._id_0291 = var_0;
  self.pers["team"] = var_0;
  self.fauxdeath = undefined;
  self._id_BCF6 = 1;
  self._id_55E6 = 0;
  self._id_55D9 = 0;
  self.hasriotshieldequipped = 0;
  self.hasriotshield = 0;
}

_id_8144() {
  if (isdefined(level._id_D425))
  return [[level._id_D425]](self);

  return "allies";
}

_id_C07F() {
  _id_E25B();
  _id_0A77::updatesessionstate("playing");
}

_id_E25B() {
  self.maxhealth = self [[level._id_D3D5]]();
  self.health = self.maxhealth;
  self._id_26B9 = 5.0;
  self._id_7408 = undefined;
  self._id_8C2A = 1;
  self._id_10916 = gettime();
  self._id_C2AD = 1;
}

_id_10828(var_0) {
  _id_0A77::_id_7385(1);

  if (!var_0) {
  if (isdefined(level.bot_funcs) && isdefined(level.bot_funcs["player_spawned"]))
  self [[level.bot_funcs["player_spawned"]]]();
  }
}

_id_8135(var_0, var_1) {
  var_2 = undefined;

  if (isdefined(var_0._id_72E2)) {
  var_2 = var_0._id_72E2;
  var_2 = getclosestpointonnavmesh(var_2);

  if (isdefined(var_1))
  var_2 = var_0._id_72E2;

  var_0._id_72E2 = undefined;
  } else {
  var_3 = var_0 [[level.getspawnpoint]]();
  var_2 = getclosestpointonnavmesh(var_3.origin);

  if (isdefined(var_1))
  var_2 = var_3;

  if (level.script == "cp_disco")
  var_2 = var_3.origin;
  }

  return var_2;
}

_id_8132(var_0) {
  var_1 = undefined;

  if (isdefined(var_0._id_72E0)) {
  var_1 = var_0._id_72E0;
  var_0._id_72E0 = undefined;
  } else {
  var_2 = var_0 [[level.getspawnpoint]]();
  var_1 = scripts\engine\utility::ter_op(isdefined(var_2.angles), var_2.angles, (0, 0, 0));
  }

  return var_1;
}

_id_1001B() {
  if (game["state"] == "postgame")
  return 1;

  return 0;
}

_id_662C() {
  var_0 = _id_7ED8();
  self _meth_833E(var_0.origin, var_0.angles);
  _id_F717(var_0.origin, var_0.angles);
  _id_F858();
  _id_0A77::updatesessionstate("spectator");
}

_id_F858() {
  if (isdefined(level._id_10979))
  [[level._id_10979]](self);
  else
  _id_504C(self);
}

_id_504C(var_0) {
  var_0 allowspectateteam("allies", 1);
  var_0 allowspectateteam("axis", 1);
  var_0 allowspectateteam("freelook", 0);
  var_0 allowspectateteam("none", 1);
}

_id_5045(var_0) {
  if (!isdefined(self.connected))
  return;

  _id_0A4B::on_player_disconnect(var_0);
  _id_E15A(self);

  if (_id_563B())
  level thread [[level._id_72BF]]();

  if (isdefined(level._id_C574))
  level thread [[level._id_C574]](self, var_0);
}

_id_563B() {
  if (level._id_10A56)
  return level.players.size <= 1;

  var_0 = 0;

  foreach (var_2 in level.players) {
  if (_id_0A5B::_id_D0EF(var_2))
  var_0 = _id_0A5B::_id_7682(var_2);
  }

  return var_0;
}

_id_1810(var_0) {
  level.players[level.players.size] = var_0;
  level._id_C928[level._id_C928.size] = var_0;
  level._id_3CB5[level._id_3CB5.size] = var_0;
}

_id_E15A(var_0) {
  level.players = scripts\engine\utility::array_remove(level.players, var_0);
  level._id_C928 = scripts\engine\utility::array_remove(level._id_C928, var_0);
  level._id_3CB5 = scripts\engine\utility::array_remove(level._id_3CB5, var_0);
}

_id_5049() {
  if (self ishost())
  _id_97EA();

  if (_id_9E39(self)) {
  var_0 = 0;

  foreach (var_2 in level.players) {
  if (_id_9E39(var_2))
  var_0++;
  }

  level._id_90A8++;

  if (level._id_90A8 >= var_0 * 2 / 3)
  level notify("hostmigration_enoughplayers");
  }
}

_id_9E39(var_0) {
  return !isdefined(var_0.pers["isBot"]) || var_0.pers["isBot"] == 0;
}

_id_503E() {
  if (level._id_7669)
  return;

  if (isdefined(level._id_C53D))
  level thread [[level._id_C53D]]();

  level._id_90A8 = 0;

  foreach (var_1 in level._id_3CB5)
  var_1._id_90A6 = 0;

  level._id_90A9 = 1;
  setdvar("ui_inhostmigration", 1);
  level notify("host_migration_begin");

  foreach (var_1 in level._id_3CB5) {
  if (isdefined(var_1))
  var_1 thread _id_0A56::_id_90AA();

  if (isplayer(var_1))
  var_1 setclientomnvar("ui_session_state", var_1.sessionstate);
  }

  setdvar("ui_game_state", game["state"]);
  level endon("host_migration_begin");
  _id_0A56::_id_90AC();
  level._id_90A9 = undefined;
  setdvar("ui_inhostmigration", 0);

  if (isdefined(level.hostmigrationend))
  level thread [[level.hostmigrationend]]();

  level notify("host_migration_end");
}

_id_97F7() {
  var_0 = getentarray("destructable", "targetname");

  if (getdvar("scr_destructables") == "0") {
  for (var_1 = 0; var_1 < var_0.size; var_1++)
  var_0[var_1] delete();
  } else {
  for (var_1 = 0; var_1 < var_0.size; var_1++)
  var_0[var_1] thread _id_5335();
  }
}

_id_5335() {
  var_0 = 40;
  var_1 = 0;

  if (isdefined(self._id_ECE4))
  var_0 = self._id_ECE4;

  if (isdefined(self._id_EEE3))
  var_1 = self._id_EEE3;

  if (isdefined(self._id_EDBB))
  self._id_7542 = loadfx(self._id_EDBB);

  var_2 = 0;
  self setcandamage(1);

  for (;;) {
  self waittill("damage", var_3, var_4);

  if (var_3 >= var_1) {
  var_2 = var_2 + var_3;

  if (var_2 >= var_0) {
  thread _id_5334();
  return;
  }
  }
  }
}

_id_5334() {
  var_0 = self;

  if (isdefined(var_0._id_7542))
  playfx(var_0._id_7542, var_0.origin + (0, 0, 6));

  var_0 delete();
}

_id_FAAA() {
  var_0 = getentarray("script_brushmodel", "classname");
  var_1 = getentarray("script_model", "classname");

  for (var_2 = 0; var_2 < var_1.size; var_2++)
  var_0[var_0.size] = var_1[var_2];

  for (var_2 = 0; var_2 < var_0.size; var_2++) {
  if (isdefined(var_0[var_2]._id_EE89))
  var_0[var_2].targetname = var_0[var_2]._id_EE89;

  if (isdefined(var_0[var_2].targetname)) {
  if (var_0[var_2]._id_01F1 == "fx" && (!isdefined(var_0[var_2]._id_0336) || var_0[var_2]._id_0336 != "exploderchunk")) {
  var_0[var_2] hide();
  continue;
  }

  if (isdefined(var_0[var_2]._id_0336) && var_0[var_2]._id_0336 == "exploder") {
  var_0[var_2] hide();
  var_0[var_2] notsolid();
  continue;
  }

  if (isdefined(var_0[var_2]._id_0336) && var_0[var_2]._id_0336 == "exploderchunk") {
  var_0[var_2] hide();
  var_0[var_2] notsolid();
  }
  }
  }

  var_3 = [];
  var_4 = getentarray("script_brushmodel", "classname");

  for (var_2 = 0; var_2 < var_4.size; var_2++) {
  if (isdefined(var_4[var_2]._id_EE89))
  var_4[var_2].targetname = var_4[var_2]._id_EE89;

  if (isdefined(var_4[var_2].targetname))
  var_3[var_3.size] = var_4[var_2];
  }

  var_4 = getentarray("script_model", "classname");

  for (var_2 = 0; var_2 < var_4.size; var_2++) {
  if (isdefined(var_4[var_2]._id_EE89))
  var_4[var_2].targetname = var_4[var_2]._id_EE89;

  if (isdefined(var_4[var_2].targetname))
  var_3[var_3.size] = var_4[var_2];
  }

  var_4 = getentarray("item_health", "classname");

  for (var_2 = 0; var_2 < var_4.size; var_2++) {
  if (isdefined(var_4[var_2]._id_EE89))
  var_4[var_2].targetname = var_4[var_2]._id_EE89;

  if (isdefined(var_4[var_2].targetname))
  var_3[var_3.size] = var_4[var_2];
  }

  if (!isdefined(level.createfxent))
  level.createfxent = [];

  var_5 = [];
  var_5["exploderchunk visible"] = 1;
  var_5["exploderchunk"] = 1;
  var_5["exploder"] = 1;

  for (var_2 = 0; var_2 < var_3.size; var_2++) {
  var_6 = var_3[var_2];
  var_7 = scripts\engine\utility::_id_49AE(var_6._id_EDBB);
  var_7.v = [];
  var_7.v["origin"] = var_6.origin;
  var_7.v["angles"] = var_6.angles;
  var_7.v["delay"] = var_6._id_027B;
  var_7.v["firefx"] = var_6._id_ED93;
  var_7.v["firefxdelay"] = var_6._id_ED94;
  var_7.v["firefxsound"] = var_6._id_ED95;
  var_7.v["firefxtimeout"] = var_6._id_ED96;
  var_7.v["earthquake"] = var_6._id_ED76;
  var_7.v["damage"] = var_6._id_ED41;
  var_7.v["damage_radius"] = var_6._id_EE8F;
  var_7.v["soundalias"] = var_6._id_EEB1;
  var_7.v["repeat"] = var_6._id_EE94;
  var_7.v["delay_min"] = var_6._id_ED50;
  var_7.v["delay_max"] = var_6._id_ED4F;
  var_7.v["target"] = var_6._id_0334;
  var_7.v["ender"] = var_6._id_ED78;
  var_7.v["type"] = "exploder";

  if (!isdefined(var_6._id_EDBB))
  var_7.v["fxid"] = "No FX";
  else
  var_7.v["fxid"] = var_6._id_EDBB;

  var_7.v["exploder"] = var_6.targetname;

  if (!isdefined(var_7.v["delay"]))
  var_7.v["delay"] = 0;

  if (isdefined(var_6._id_0334)) {
  var_8 = getent(var_7.v["target"], "targetname").origin;
  var_7.v["angles"] = vectortoangles(var_8 - var_7.v["origin"]);
  }

  if (var_6.classname == "script_brushmodel" || isdefined(var_6._id_01F1)) {
  var_7._id_01F1 = var_6;
  var_7._id_01F1._id_5635 = var_6._id_ED5D;
  }

  if (isdefined(var_6._id_0336) && isdefined(var_5[var_6._id_0336]))
  var_7.v["exploder_type"] = var_6._id_0336;
  else
  var_7.v["exploder_type"] = "normal";

  var_7 scripts\common\createfx::_id_D6CF();
  }
}

_id_9817() {
  level._id_12B29 = spawnstruct();
  level._id_12B29._id_017D = "left";
  level._id_12B29._id_0382 = "top";
  level._id_12B29._id_002B = "left";
  level._id_12B29._id_002C = "top";
  level._id_12B29.x = 0;
  level._id_12B29.y = 0;
  level._id_12B29._id_039F = 0;
  level._id_12B29.height = 0;
  level._id_12B29._id_3E67 = [];
  level._id_724F = 12;
  level._id_912F["allies"] = spawnstruct();
  level._id_912F["axis"] = spawnstruct();
  level._id_D8DE = -61;
  level._id_D8DD = 0;
  level._id_D8D9 = 9;
  level._id_D8DC = 120;
  level._id_D8DB = -75;
  level._id_D8DA = 0;
  level._id_D8D8 = 1.2;
  level._id_115E4 = 32;
  level._id_115E1 = 14;
  level._id_115E3 = 192;
  level._id_115E2 = 8;
  level._id_115E0 = 1.65;
  level._id_B0E6 = "BOTTOM";
  level._id_B0E5 = -140;
  level._id_B0E4 = 1.2;
}

_id_69AA(var_0) {
  level endon("killexplodertridgers" + var_0.targetname);
  var_0 waittill("trigger");

  if (isdefined(var_0._id_ED28) && randomfloat(1) > var_0._id_ED28) {
  if (isdefined(var_0._id_027B))
  wait(var_0._id_027B);
  else
  wait 4;

  level thread _id_69AA(var_0);
  return;
  }

  scripts\engine\utility::_id_69A3(var_0.targetname);
  level notify("killexplodertridgers" + var_0.targetname);
}

_id_D0FB() {
  self._id_DE8E = 1;
}

_id_D0FC() {
  self._id_8C4C = 1;
}

_id_D0F9() {
  self._id_4D69 = gettime();
}

blank(var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9) {}

_id_98BC() {
  self setrankedplayerdata("cp", "alienSession", "team_shots", 0);
  self setrankedplayerdata("cp", "alienSession", "team_kills", 0);
  self setrankedplayerdata("cp", "alienSession", "team_hives", 0);
  self setrankedplayerdata("cp", "alienSession", "downed", 0);
  self setrankedplayerdata("cp", "alienSession", "hivesDestroyed", 0);
  self setrankedplayerdata("cp", "alienSession", "prestigenerfs", 0);
  self setrankedplayerdata("cp", "alienSession", "repairs", 0);
  self setrankedplayerdata("cp", "alienSession", "drillPlants", 0);
  self setrankedplayerdata("cp", "alienSession", "deployables", 0);
  self setrankedplayerdata("cp", "alienSession", "challengesCompleted", 0);
  self setrankedplayerdata("cp", "alienSession", "challengesAttempted", 0);
  self setrankedplayerdata("cp", "alienSession", "trapKills", 0);
  self setrankedplayerdata("cp", "alienSession", "currencyTotal", 0);
  self setrankedplayerdata("cp", "alienSession", "currencySpent", 0);
  self setrankedplayerdata("cp", "alienSession", "kills", 0);
  self setrankedplayerdata("cp", "alienSession", "revives", 0);
  self setrankedplayerdata("cp", "alienSession", "time", 0);
  self setrankedplayerdata("cp", "alienSession", "score", 0);
  self setrankedplayerdata("cp", "alienSession", "shots", 0);
  self setrankedplayerdata("cp", "alienSession", "last_stand_count", 0);
  self setrankedplayerdata("cp", "alienSession", "deaths", 0);
  self setrankedplayerdata("cp", "alienSession", "headShots", 0);
  self setrankedplayerdata("cp", "alienSession", "hits", 0);
  self setrankedplayerdata("cp", "alienSession", "resources", 0);
  self setrankedplayerdata("cp", "alienSession", "waveNum", 0);
}

_id_988E() {
  if (isdefined(level._id_D0FE))
  [[level._id_D0FE]]();
  else
  _id_0A5B::_id_500D();
}

_id_988B() {
  level._id_A6CB = scripts\engine\utility::_id_8180("respawn_edge", "targetname");
}

_id_7F56() {
  return scripts\engine\utility::_id_7E2E(self.origin, level._id_A6CB);
}