/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2641.gsc
***************************************/

init() {
  _id_DEB3();
}

endgame(var_0, var_1) {
  if (_id_7668())
  return;

  setnojiptime(1);
  level thread kill_all_zombies();
  _id_B37C();
  level notify("game_ended", var_0);
  _id_7384(1.0, "cg_fovScale", 1);

  if (var_1 == 4)
  wait 4.9;

  var_2 = 0;

  foreach (var_4 in level.players) {
  var_4 stopolcalsound("zmb_laststand_music");

  if (var_4 issplitscreenplayer()) {
  if (var_4 isreloading())
  var_4 playlocalsound("mus_zombies_gameover");

  continue;
  }

  var_4 playlocalsound("mus_zombies_gameover");
  }

  level.ingraceperiod = 0;
  setomnvar("allow_server_pause", 0);
  scripts\engine\utility::waitframe();
  level._id_118DB = int((gettime() - level._id_10DFF) / 1000);
  setomnvar("zm_time_survived", level._id_118DB);
  setomnvarforallclients("post_game_state", 1);
  setdvar("g_deadChat", 1);
  setdvar("ui_allow_teamchange", 0);
  setdvar("bg_compassShowEnemies", 0);
  setdvar("scr_gameended", 1);
  setgameendtime(0);
  setomnvar("zm_ui_timer", 0);
  _id_0A4D::_id_4DAE();

  foreach (var_4 in level.players)
  _id_40A5(var_4);

  level._id_2AAD = 1;

  foreach (var_9 in level.agentarray) {
  if (isdefined(var_9._id_9D25) && var_9._id_9D25) {
  var_9._id_0180 = 1;
  var_9 _id_0A77::_id_61CD();
  }
  }

  setomnvarforallclients("post_game_state", 0);
  var_11 = _id_FF5E(var_1);

  if (isdefined(var_11)) {
  if (isdefined(level._id_ADDF))
  [[level._id_ADDF]](var_1);

  _id_ADDE(var_11);
  return;
  } else {}

  _id_0A54::_id_36FD(1);

  if (isdefined(level._id_D7BB))
  [[level._id_D7BB]]();

  if (!_id_0A77::_id_9B97()) {
  foreach (var_4 in level.players)
  var_4 setclientdvar("ui_opensummary", 1);
  }

  setomnvarforallclients("post_game_state", 2);
  _id_56DA(var_0, var_1);
  setomnvarforallclients("post_game_state", 1);
  var_14 = _id_0A55::_id_108DD;

  if (isdefined(level._id_4C58))
  var_14 = level._id_4C58;

  if (!_id_0A77::_id_9B97()) {
  foreach (var_4 in level.players)
  var_4 thread [[var_14]](var_1);
  }

  var_17 = _id_7978(var_1);
  var_18 = _id_7B85();
  _id_0A4B::endgame(var_17, var_18);
  setomnvarforallclients("post_game_state", 4);
  wait 11.0;
  setomnvarforallclients("post_game_state", 1);
  level notify("exitLevel_called");
  exitlevel(0);
}

kill_all_zombies() {
  wait 1;
  var_0 = _id_0A4A::_id_7DB0("axis");

  foreach (var_2 in var_0) {
  var_2._id_0180 = 1;
  var_2._id_EF64 = 1;
  var_2 _meth_8286(getclosestpointonnavmesh(var_2.origin));

  if (!isdefined(var_2.agent_type))
  continue;

  if (var_2.agent_type == "zombie_grey")
  continue;

  if (scripts\engine\utility::_id_9CEE(var_2._id_6622))
  continue;

  switch (var_2.agent_type) {
  case "zombie_clown":
  case "zombie_cop":
  case "zombie_ghost":
  case "zombie_brute":
  break;
  case "generic_zombie":
  playfx(level._effect["head_loss"], var_2 gettagorigin("j_head"));
  var_2 setscriptablepartstate("head", "detached", 1);
  var_2 setscriptablepartstate("eyes", "eye_glow_off", 1);
  break;
  }

  var_2 _meth_80B0(var_2.health + 100, var_2.origin);
  wait 0.25;
  }
}

_id_72BF() {
  level thread endgame("axis", _id_7979("host_end"));
}

_id_B37C() {
  game["state"] = "postgame";
  level._id_7669 = 1;
}

_id_7668() {
  return game["state"] == "postgame" || level._id_7669;
}

_id_7384(var_0, var_1, var_2) {
  if (!isdefined(var_0))
  var_0 = 0;

  foreach (var_4 in level.players) {
  var_4 thread _id_7386(var_0);
  var_4 thread _id_E760(4.0);
  var_4 _id_736F();
  var_4 setclientdvars("cg_everyoneHearsEveryone", 1, "cg_drawSpectatorMessages", 0);

  if (isdefined(var_1) && isdefined(var_2))
  var_4 setclientdvars(var_1, var_2);
  }

  foreach (var_7 in level.agentarray)
  var_7 _id_0A77::_id_7385(1);
}

_id_7386(var_0) {
  self endon("disconnect");
  _id_0A77::_id_41C5();

  if (!isdefined(var_0))
  var_0 = 0.05;

  wait(var_0);
  _id_0A77::_id_7385(1);
}

_id_E760(var_0) {
  self setdepthoffield(0, 128, 512, 4000, 6, 1.8);
}

_id_7B85() {
  var_0 = 0;

  if (isdefined(level._id_10DFF))
  var_0 = gettime() - level._id_10DFF;

  return var_0;
}

_id_736F() {
  if (isdefined(self._id_CA52)) {
  if (isdefined(self._id_CA52[0])) {
  self._id_CA52[0] _id_0A77::_id_52DC();
  self._id_CA53[0] _id_0A77::_id_52DC();
  }

  if (isdefined(self._id_CA52[1])) {
  self._id_CA52[1] _id_0A77::_id_52DC();
  self._id_CA53[1] _id_0A77::_id_52DC();
  }

  if (isdefined(self._id_CA52[2])) {
  self._id_CA52[2] _id_0A77::_id_52DC();
  self._id_CA53[2] _id_0A77::_id_52DC();
  }
  }

  self notify("perks_hidden");
  self._id_B0DE _id_0A77::_id_52DC();
  self._id_B0E7 _id_0A77::_id_52DC();

  if (isdefined(self._id_DAAE))
  self._id_DAAE _id_0A77::_id_52DC();

  if (isdefined(self._id_DAAF))
  self._id_DAAF _id_0A77::_id_52DC();
}

_id_40A5(var_0) {
  var_0 notify("select_mode");
  var_0 notify("reset_outcome");
  var_0.pers["stats"] = var_0._id_10E53;
  var_0 _id_0A77::_id_1C5C(1);
  var_0 setclientomnvar("ui_intel_progress_current", -1);
  var_0 setclientomnvar("ui_intel_progress_max", -1);
  var_0 setclientomnvar("ui_intel_percent", -1);
  var_0 setclientomnvar("ui_intel_target_player", -1);
  var_0 setclientomnvar("ui_intel_prechallenge", 0);
  var_0 setclientomnvar("ui_intel_timer", -1);
  var_0 setclientomnvar("ui_intel_challenge_scalar", -1);
  var_0 setclientomnvar("zombie_number_of_ticket", 0);
  var_0 setrankedplayerdata("cp", "zombiePlayerLoadout", "tutorialOff", 1);
  var_0 _id_0A77::_id_41C5();

  if (isdefined(var_0._id_C8A2))
  var_0._id_C8A2 = [];

  if (isdefined(var_0._id_D7A0))
  var_0._id_D7A0 = [];

  if (isdefined(var_0._id_456D))
  var_0._id_456D = [];

  if (isdefined(var_0._id_D782))
  var_0._id_D782 = [];

  var_0 _id_4172();
}

_id_FF5E(var_0) {
  if ((var_0 == 1 || var_0 == 2) && getdvar("ui_mapname") == "cp_jackal_ass")
  return "cp_titan";

  return undefined;
}

_id_ADDE(var_0) {
  _id_A5D7();
  level scripts\engine\utility::_id_13736(15, "intermission_over");
  setdvar("ui_mapname", var_0);
  setdvar("g_gametype", "aliens");
  var_1 = "map " + var_0;
}

_id_E2AE() {
  _id_A5D7();
  setomnvar("allow_server_pause", 1);
  setomnvarforallclients("post_game_state", 0);

  for (var_0 = 3; var_0 > 0; var_0--) {
  iprintlnbold("RESTARTING IN..." + var_0);
  wait 1;
  }

  map_restart(1);
}

_id_A5D7() {
  foreach (var_1 in level._id_3CB5)
  var_1 _meth_80B0(100000, var_1.origin);

  var_3 = _id_0A4A::_id_7D94("alien");

  foreach (var_5 in var_3)
  var_5 suicide();
}

_id_D40D(var_0) {
  if (var_0 == 4) {
  level._id_E40B = 0;
  level._id_E40C = 0;

  foreach (var_2 in level.players)
  var_2 thread _id_56C4();

  var_4 = level.players.size - level._id_E40B;

  while (level._id_E40B < level.players.size) {
  var_5 = var_4;
  var_4 = level.players.size - level._id_E40B;

  if (var_4 != var_5)
  iprintlnbold("Waiting for " + var_4 + " player's to vote");

  wait 0.5;
  }

  if (level._id_E40C == level.players.size)
  return 1;
  }

  return 0;
}

_id_56C4() {
  wait 3.0;
  _id_0A5B::_id_4164(self);
  self setclientomnvar("retry_popup", 1);
  self waittill("luinotifyserver", var_0);
  level._id_E40B = level._id_E40B + 1;

  if (var_0 == "retry_level")
  level._id_E40C = level._id_E40C + 1;
}

_id_4172() {
  if (isdefined(self._id_D782)) {
  foreach (var_1 in getarraykeys(self._id_D782)) {
  var_2 = self._id_D782[var_1]._id_3D23 * -1;
  _id_0D15::_id_D71A(var_2);
  }
  }

  _id_0D15::_id_13F00("secondary");
  _id_0D15::_id_13F00("primary");
}

_id_7978(var_0) {
  switch (var_0) {
  case 1:
  return "all_escape";
  case 2:
  return "some_escape";
  case 3:
  return "fail_escape";
  case 8:
  case 5:
  case 4:
  return "died";
  case 6:
  return "host_quit";
  case 7:
  return "gas_fail";
  default:
  }
}

_id_56C5() {
  level endon("game_ended");
  self endon("disconnect");

  for (;;) {
  self waittill("luinotifyserver", var_0);

  if (var_0 == "close_menu") {
  level._id_AE3F = level._id_AE3F + 1;
  continue;
  } else {
  switch (var_0) {
  case "dpad_team_ammo_ap":
  case "dpad_team_ammo_in":
  case "dpad_team_ammo_stun":
  case "dpad_team_ammo_reg":
  break;
  case "dpad_team_boost":
  case "dpad_team_armor":
  case "dpad_team_adrenaline":
  case "dpad_team_explosives":
  break;
  case "dpad_maaws":
  case "dpad_riotshield":
  case "dpad_death_machine":
  case "dpad_war_machine":
  break;
  case "perk_bullet_damage":
  scripts\engine\utility::waitframe();
  scripts\engine\utility::waitframe();
  break;
  case "perk_health":
  scripts\engine\utility::waitframe();
  scripts\engine\utility::waitframe();
  break;
  case "perk_rigger":
  scripts\engine\utility::waitframe();
  scripts\engine\utility::waitframe();
  break;
  case "perk_medic":
  scripts\engine\utility::waitframe();
  scripts\engine\utility::waitframe();
  break;
  case "perk_robotics":
  scripts\engine\utility::waitframe();
  scripts\engine\utility::waitframe();
  break;
  case "perk_demolition":
  scripts\engine\utility::waitframe();
  scripts\engine\utility::waitframe();
  break;
  case "perk_gunslinger":
  scripts\engine\utility::waitframe();
  scripts\engine\utility::waitframe();
  break;
  case "perk_hybrid":
  scripts\engine\utility::waitframe();
  scripts\engine\utility::waitframe();
  break;
  case "perk_pistol_zemc":
  case "perk_pistol_zg18":
  case "perk_pistol_magnum":
  case "perk_pistol_znrg":
  break;
  case "perk_skill_pet":
  case "perk_skill_electric_arc":
  case "perk_skill_mortar":
  case "perk_skill_drone":
  case "perk_skill_heal_ring":
  case "perk_skill_stasis":
  case "perk_skill_invulnerable":
  case "perk_skill_infinite_ammo":
  break;
  case "iw6_kriss_mp":
  case "iw6_cprgm_mp":
  case "iw6_cppanzerfaust3_mp":
  case "iw6_l115a3_mp+acogsniper":
  case "iw6_vks_mp+vksscope":
  case "iw6_svu_mp":
  case "iw6_g28_mp":
  case "iw6_imbel_mp":
  case "iw6_microtar_mp":
  case "iw6_pdw_mp":
  case "iw6_vepr_mp":
  case "iw6_pp19_mp":
  case "iw6_maul_mp":
  case "iw6_cbjms_mp":
  case "iw6_mts255_mp":
  case "iw6_fp6_mp":
  case "iw6_honeybadger_mp":
  case "iw6_aliendlc11li_mp":
  case "iw6_m27_mp":
  case "iw6_lsat_mp":
  case "iw6_dlcweap02_mp+dlcweap02scope":
  case "iw6_plasmaauto_mp":
  case "iw7_erad_mp":
  case "iw7_crb_mp":
  case "iw7_devastator_mp":
  case "iw7_chargeshot_mp":
  case "iw7_spas_mp":
  case "iw7_forge_mp":
  case "iw7_nrg_mp":
  case "iw7_ake_mp":
  case "iw7_m1_mp":
  case "iw7_ar57_mp":
  case "iw7_m8_mp+m8scope":
  case "iw7_cheytac_mp+cheytacscope":
  case "iw7_kbs_mp+kbsscope":
  case "iw6_arx160_mp":
  case "iw6_kac_mp":
  case "iw7_glprox_mp":
  case "iw6_panzerfaust3_mp":
  case "iw6_mp443_mp":
  case "iw6_m9a1_mp":
  case "iw6_magnum_mp":
  case "iw6_p226_mp":
  break;
  }
  }
  }
}

_id_56DA(var_0, var_1) {
  foreach (var_3 in level.players) {
  if (isdefined(var_3._id_4530) || var_3.pers["team"] == "spectator")
  continue;

  var_3 thread _id_C752(var_0, var_1);
  var_3 thread _id_0A77::_id_7385(1);
  }

  level notify("game_win", var_0);
}

_id_C752(var_0, var_1) {
  self endon("disconnect");
  self notify("reset_outcome");
  wait 0.5;
  var_2 = self.pers["team"];

  if (!isdefined(var_2) || var_2 != "allies" && var_2 != "axis")
  var_2 = "allies";

  while (_id_0A57::_id_9DC6())
  wait 0.05;

  self endon("reset_outcome");

  if (isdefined(self.pers["team"]) && var_0 == var_2)
  var_3 = _id_7979("win");
  else
  var_3 = _id_7979("fail");

  self setclientomnvar("ui_round_end_title", var_3);

  if (isdefined(var_1))
  self setclientomnvar("ui_round_end_reason", var_1);

  self setclientomnvar("zm_ui_show_eog_score", 1);
}

_id_DEB3() {
  if (isdefined(level._id_62D2))
  [[level._id_62D2]]();
  else
  _id_DEAC();
}

_id_DEAC() {
  level._id_62D1 = [];
  level._id_62D1["win"] = 1;
  level._id_62D1["fail"] = 2;
  level._id_62D1["all_escape"] = 1;
  level._id_62D1["some_escape"] = 2;
  level._id_62D1["fail_escape"] = 3;
  level._id_62D1["kia"] = 4;
  level._id_62D1["host_end"] = 5;
}

_id_7979(var_0) {
  return level._id_62D1[var_0];
}

_id_E761(var_0, var_1) {
  var_2 = 0;

  while (!var_2) {
  var_3 = level.players;
  var_2 = 1;

  foreach (var_5 in var_3) {
  if (!isdefined(var_5._id_58DD))
  continue;

  if (!var_5 _id_0A57::_id_9DC6())
  continue;

  var_2 = 0;
  }

  wait 0.5;
  }

  if (!var_1) {
  wait(var_0);
  level notify("round_end_finished");
  return;
  }

  wait(var_0 / 2);
  level notify("give_match_bonus");
  wait(var_0 / 2);
  var_2 = 0;

  while (!var_2) {
  var_3 = level.players;
  var_2 = 1;

  foreach (var_5 in var_3) {
  if (!isdefined(var_5._id_58DD))
  continue;

  if (!var_5 _id_0A57::_id_9DC6())
  continue;

  var_2 = 0;
  }

  wait 0.5;
  }

  level notify("round_end_finished");
}
