/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2678.gsc
***************************************/

_id_9670() {
  _id_DD64();
  _id_96F6();
  _id_96F7();
  _id_96F5();
  level thread _id_E1E6();
  level thread _id_3DD5();
  level thread _id_D7A1();
}

_id_D7A1() {
  var_0 = getarraykeys(level._id_163F);

  for (;;) {
  level waittill("connected", var_1);

  foreach (var_3 in var_0) {
  if (scripts\engine\utility::_id_9CEE(level._id_163F[var_3])) {
  if (isdefined(level._id_D762[var_3]))
  thread [[level._id_D762[var_3]]](var_1);
  }
  }
  }
}

_id_96F6() {
  level._effect["pickup"] = loadfx("vfx/iw7/core/zombie/powerups/vfx_zom_powerup_pickup.vfx");
  level._effect["pickup_fnfmod"] = loadfx("vfx/iw7/core/zombie/powerups/vfx_zd_powerup_pickup.vfx");
  level._effect["big_explo"] = loadfx("vfx/iw7/_requests/coop/vfx_nuke_explosion_01.vfx");
}

_id_96F5() {
  if (!isdefined(level._id_163F))
  level._id_163F = [];

  level._id_163F["instakill"] = 0;
  level._id_163F["double_money"] = 0;
  level._id_163F["fire_sale"] = 0;
  level._id_163F["infinite_ammo"] = 0;
  level._id_163F["infinite_grenades"] = 0;
  level._id_D762["instakill"] = ::_id_20AC;
  level._id_D762["double_money"] = ::_id_20A3;
  level._id_D762["infinite_ammo"] = ::_id_20AA;
  level._id_D762["infinite_grenades"] = ::_id_20AB;
  level._id_D762["fire_sale"] = ::_id_20A5;

  if (!isdefined(level._id_D761))
  level._id_D761 = 500;

  if (!isdefined(level._id_D79E))
  level._id_D79E = randomintrange(2000, 3000);

  if (!isdefined(level._id_D79F))
  level._id_D79F = 5;

  if (!isdefined(level._id_D79D))
  level._id_D79D = 0;

  if (!isdefined(level._id_EC22))
  level._id_EC22 = level._id_D79E;
}

_id_3DD5() {
  level waittill("regular_wave_starting");

  for (;;) {
  foreach (var_1 in level.players) {
  if (!scripts\engine\utility::_id_9CEE(var_1._id_3E06)) {
  var_1._id_3E06 = 1;
  level._id_EC22 = level._id_EC22 + level._id_D761;

  if (var_1 _id_0A77::_id_9BA0("more_power_up_drops"))
  level._id_D79E = level._id_D79E - 5;
  }
  }

  level waittill("player_spawned");
  }
}

_id_96F7() {
  scripts\engine\utility::_id_6E39("zombie_drop_powerups");
  scripts\engine\utility::_id_6E39("fire_sale");
  scripts\engine\utility::_id_6E39("canFiresale");
  scripts\engine\utility::_id_6E39("explosive_armor");
  scripts\engine\utility::_id_6E39("force_drop_max_ammo");
}

_id_E1E6() {
  level endon("game_ended");

  for (;;) {
  level waittill("spawn_wave_done");
  level._id_D79D = 0;
  }
}

_id_DD64() {
  level._id_B07F = [];
  level._id_B07B = [];
  level._id_B07D = [];
  level._id_B07E = [];

  if (isdefined(level._id_D763))
  var_0 = level._id_D763;
  else
  var_0 = "cp/zombies/zombie_loot.csv";

  for (var_1 = 1; var_1 <= 100; var_1++) {
  var_2 = _id_113C5(var_0, var_1, 2);

  if (_id_0A77::_id_9BCC(var_2))
  break;

  var_3 = [];
  var_3["weights"] = _id_45F6(_id_113C5(var_0, var_1, 3));
  var_3["weight_sum"] = _id_7D76(var_3["weights"]);
  var_4 = strtok(_id_113C5(var_0, var_1, 4), " ");
  var_3["contents"] = [];

  foreach (var_8, var_6 in var_4) {
  var_7 = [];
  var_7["value"] = var_6;
  var_7["last_time"] = 0;
  var_3["contents"][var_8] = var_7;
  }

  level._id_B07F[var_2] = var_3;
  }

  for (var_1 = 101; var_1 <= 150; var_1++) {
  var_9 = _id_113C5(var_0, var_1, 2);

  if (_id_0A77::_id_9BCC(var_9))
  break;

  var_10 = _id_113C5(var_0, var_1, 3);

  if (!isdefined(level._effect[var_10]))
  level._effect[var_10] = loadfx(var_10);

  level._id_B07B[var_9] = var_10;
  var_11 = _id_113C5(var_0, var_1, 1);
  level._id_B07E[var_9] = var_11;
  }

  for (var_1 = 101; var_1 <= 150; var_1++) {
  var_9 = _id_113C5(var_0, var_1, 2);

  if (_id_0A77::_id_9BCC(var_9))
  break;

  var_12 = _id_113C5(var_0, var_1, 4);

  if (_id_0A77::_id_9BCC(var_12))
  continue;

  level._id_B07D[var_9] = var_12;
  }
}

_id_45F6(var_0) {
  var_0 = strtok(var_0, " ");
  var_1 = [];

  for (var_2 = 0; var_2 < var_0.size; var_2++)
  var_1[var_2] = float(var_0[var_2]);

  return var_1;
}

_id_7D76(var_0) {
  var_1 = 0;

  foreach (var_3 in var_0)
  var_1 = var_1 + var_3;

  return var_1;
}

_id_5CF6(var_0, var_1, var_2, var_3, var_4, var_5) {
  if (var_2 == "none")
  return 0;

  var_0 = getclosestpointonnavmesh(var_0);
  var_6 = scripts\engine\utility::_id_9CEE(var_3);
  var_7 = _id_4918(var_0);

  if (!isdefined(var_7))
  return 0;

  var_7.fnf_consumable_active = 0;

  foreach (var_9 in level.players) {
  if (var_9 _id_0A77::_id_9BA0("temporal_increase")) {
  var_7.fnf_consumable_active = 1;
  break;
  }
  }

  var_7._id_457C = var_2;
  var_11 = _id_7AB9(var_7);
  var_7._id_763D = var_11;
  var_12 = (0, 0, 0);

  if (isdefined(var_1) && var_1 _id_0A77::_id_9BA0("more_power_up_drops"))
  var_1 _id_0A77::_id_C151("more_power_up_drops");

  if (isdefined(var_4)) {
  level._id_D79E = level._id_D79E * 1.14;
  level._id_EC22 = var_4 + level._id_D79E;
  level._id_D79D++;
  level._id_A8B4 = gettime();
  }

  if (!_id_9C0E(var_0) && loot_fly_to_player_enabled()) {
  var_0 = _id_BCB7(var_7);
  var_7 thread _id_B07C();
  var_6 = 1;
  } else {
  var_0 = var_0 + (0, 0, 50);

  if (scripts\engine\utility::_id_9CEE(var_7.fnf_consumable_active))
  var_7.fnffx = spawnfx(level._effect["powerup_additive_fx"], var_0 + (0, 0, -10));

  var_7._id_7542 = spawnfx(scripts\engine\utility::_id_7ECB(var_11), var_0);

  if (isdefined(var_12))
  var_7._id_7542.angles = var_12;
  }

  if (isdefined(var_1))
  var_7.owner = var_1;
  else
  var_7.owner = level.players[0];

  var_7 notify("activate");

  if (!var_6) {
  if (scripts\engine\utility::_id_9CEE(var_7.fnf_consumable_active)) {
  triggerfx(var_7.fnffx);
  var_7.fnffx _meth_82EC();
  }

  triggerfx(var_7._id_7542);
  var_7._id_7542 _meth_82EC();
  var_7 thread _id_B07C();
  }

  var_7 thread _id_B086(var_7);
  var_7 thread _id_B096(var_7);
  var_13 = _id_7A38(var_2);

  if (isdefined(var_13) && scripts\engine\utility::_id_9CEE(var_5))
  _id_12E16(var_13);

  level thread _id_410D(var_7);
  return 1;
}

loot_fly_to_player_enabled() {
  if (scripts\engine\utility::_id_9CEE(level.disable_loot_fly_to_player))
  return 0;

  return 1;
}

_id_BCB7(var_0) {
  level endon("game_ended");
  var_0._id_7542 = spawn("script_model", var_0.origin + (0, 0, 50));
  var_0._id_7542 setmodel("tag_origin");
  wait 0.1;

  if (scripts\engine\utility::_id_9CEE(var_0.fnf_consumable_active))
  playfxontag(level._effect["powerup_additive_fx"], var_0._id_7542, "tag_origin");

  playfxontag(scripts\engine\utility::_id_7ECB(var_0._id_763D), var_0._id_7542, "tag_origin");
  var_1 = scripts\engine\utility::_id_7E2E(var_0.origin, level.players);
  var_2 = distance(var_0.origin, var_1.origin);
  var_3 = 300;
  var_4 = var_2 / var_3;

  if (var_4 < 0.05)
  var_4 = 0.05;

  var_5 = getclosestpointonnavmesh(scripts\engine\utility::_id_5D14(var_1.origin, 32, -100)) + (0, 0, 50);
  var_0._id_7542 moveto(var_5, var_4);
  var_0._id_7542 waittill("movedone");
  var_0 dontinterpolate();
  var_0.origin = var_0._id_7542.origin;
  return var_0.origin;
}

_id_410D(var_0) {
  var_0 scripts\engine\utility::_id_13736(get_loot_time_out(), "picked_up");

  if (scripts\engine\utility::_id_9CEE(var_0.fnf_consumable_active))
  playfx(level._effect["pickup_fnfmod"], var_0.origin + (0, 0, 50));
  else
  playfx(level._effect["pickup"], var_0.origin + (0, 0, 50));

  if (isdefined(var_0._id_7542))
  var_0._id_7542 delete();

  if (isdefined(var_0.fnffx))
  var_0.fnffx delete();

  wait 0.5;
  var_0.fnf_consumable_active = 0;

  if (isdefined(var_0))
  var_0 delete();

  var_0 notify("loot_deleted");
}

_id_B07C() {
  self endon("death");
  self endon("picked_up");
  self endon("loot_deleted");
  var_0 = get_loot_time_out() - 5;
  wait(var_0);

  for (var_1 = 0; var_1 < 5; var_1++) {
  wait 0.5;
  self._id_7542 delete();
  wait 0.5;
  var_2 = _id_7AB9(self);
  self._id_7542 = spawnfx(scripts\engine\utility::_id_7ECB(var_2), self.origin + (0, 0, 50));
  self._id_7542.angles = (0, 0, 0);
  wait 0.1;
  triggerfx(self._id_7542);
  self._id_7542 _meth_82EC();
  }

  if (isdefined(self) && isdefined(self._id_7542))
  self._id_7542 delete();

  if (isdefined(self) && isdefined(self.fnffx))
  self.fnffx delete();
}

get_loot_time_out() {
  if (isdefined(level.loot_time_out))
  return level.loot_time_out;

  return 30;
}

_id_7A38(var_0, var_1) {
  if (!isdefined(var_1))
  var_1 = "kill_generic_zombie";

  var_2 = 0;
  var_3 = level._id_B07F[var_1]["contents"].size;

  for (var_2 = 0; var_2 < var_3; var_2++) {
  if (level._id_B07F[var_1]["contents"][var_2]["value"] == var_0)
  return var_2;
  }

  return 0;
}

_id_B978(var_0) {
  self endon("loot_deleted");
  level endon("game_ended");

  while (isdefined(var_0) && isdefined(var_0.health) && var_0.health >= 1) {
  level waittill("attack_hit", var_1, var_2);

  if (var_0 != var_2)
  continue;

  var_0.health = var_0.health - 50;
  }

  self notify("picked_up");
}

_id_4918(var_0) {
  var_1 = scripts\engine\utility::_id_5D14(var_0, 32, -64);
  var_2 = spawn("trigger_radius", var_1, 0, 32, 76);
  return var_2;
}

_id_7AB9(var_0) {
  if (!isdefined(level._id_B07B[var_0._id_457C]))
  return "vfx_loot_ace_hearts";

  return level._id_B07B[var_0._id_457C];
}

_id_B096(var_0) {
  var_0 endon("loot_deleted");
  var_1 = var_0 scripts\engine\utility::_id_13736(get_loot_time_out(), "picked_up");

  if (var_1 == "picked_up")
  thread _id_D980(var_0.owner, var_0._id_457C, var_0, 1);
}

_id_B086(var_0) {
  var_0 endon("loot_deleted");
  wait 0.2;

  for (;;) {
  var_0 waittill("trigger", var_1);

  if (!isplayer(var_1)) {
  wait 0.25;
  continue;
  }

  var_0 notify("picked_up");
  var_1 playlocalsound("zmb_powerup_activate");
  break;
  }
}

_id_D980(var_0, var_1, var_2, var_3) {
  var_4 = var_1;
  var_1 = strtok(var_1, "_");
  var_5 = var_1[0];
  var_6 = var_1[1];
  var_7 = gettime();
  var_8 = int(level._id_B07E[var_4]);
  var_9 = 1;
  _id_56C3(0);

  switch (var_5) {
  case "power":
  level thread [[level._id_D743]](var_4, var_7);
  break;
  case "fire":
  if (isdefined(level._id_6D28)) {
  if (isdefined(var_0.temporal_increase))
  var_6 = int(var_6) * var_0.temporal_increase;

  level thread _id_0A6A::_id_12885("powerup_firesale", "zmb_powerup_vo");
  var_2 playsound("zmb_powerup_fire_sale");
  level thread [[level._id_6D28]](var_4, int(var_6), var_7);
  }

  break;
  case "grenade":
  if (isdefined(var_0.temporal_increase))
  var_6 = int(var_6) * var_0.temporal_increase;

  level thread _id_0A6A::_id_12885("powerup_infinitegrenades", "zmb_powerup_vo");
  var_2 playsound("zmb_powerup_infinite_grenades");
  level thread _id_82DA(var_4, int(var_6), var_7);
  break;
  case "infinite":
  if (isdefined(var_0.temporal_increase))
  var_6 = int(var_6) * var_0.temporal_increase;

  level thread _id_0A6A::_id_12885("powerup_infiniteammo", "zmb_powerup_vo");
  var_2 playsound("zmb_powerup_infinite_ammo");
  level thread _id_82D9(var_4, int(var_6), var_7);
  break;
  case "upgrade":
  if (isdefined(level._id_12F74)) {
  var_2 playsound("zmb_powerup_wpn_upgrade");
  level thread [[level._id_12F74]]();
  }

  break;
  case "kill":
  if (scripts\engine\utility::_id_9CEE(level._id_72AA)) {
  var_9 = 0;
  level thread _id_A5C6(var_2, int(var_6));
  } else {
  level thread _id_0A6A::_id_12885("powerup_nuke", "zmb_powerup_vo");
  var_2 playsound("zmb_powerup_nuke");
  level thread _id_A5C6(var_2, int(var_6));
  }

  break;
  case "cash":
  level thread _id_0A6A::_id_12885("powerup_doublemoney", "zmb_powerup_vo");
  var_2 playsound("zmb_powerup_dbl_cash");
  level thread _id_EBA5(var_0, var_4, int(var_6), var_7);
  break;
  case "instakill":
  if (isdefined(var_0.temporal_increase))
  var_6 = int(var_6) * var_0.temporal_increase;

  level thread _id_0A6A::_id_12885("powerup_instakill", "zmb_powerup_vo");
  var_2 playsound("zmb_powerup_instakill");
  level thread _id_15BB(var_0, var_4, int(var_6), var_7);
  break;
  case "ammo":
  level thread _id_0A6A::_id_12885("powerup_maxammo", "zmb_powerup_vo");
  var_2 playsound("zmb_powerup_max_ammo");
  level notify("pick_up_max_ammo");
  level thread _id_829A();
  break;
  case "board":
  if (isdefined(level._id_DDB5)) {
  level thread _id_0A6A::_id_12885("powerup_carpenter", "zmb_powerup_vo");
  var_2 playsound("zmb_powerup_reboard_windows");
  level thread [[level._id_DDB5]](var_0);
  }

  break;
  default:
  }

  if (scripts\engine\utility::_id_9CEE(var_3))
  var_0 _id_0A5E::_id_D9AD("mt_powerup_grabs");

  var_0 thread _id_0A57::_id_12AAE("powerups");
  scripts\engine\utility::waitframe();

  if (var_9)
  _id_56C3(var_8);
}

_id_7AB8(var_0, var_1, var_2) {
  if (!isdefined(level._id_B07F[var_0]))
  return undefined;

  var_3 = gettime();
  var_4 = _id_3E8B(var_0, var_3, var_1);
  return var_4;
}

_id_3E8B(var_0, var_1, var_2) {
  var_3 = level._id_13BD3;
  var_4 = level._id_B07F[var_0]["contents"].size;
  level._id_1C86 = [];

  for (var_5 = 0; var_5 < var_4; var_5++) {
  var_6 = level._id_B07F[var_0]["contents"][var_5]["value"];
  var_7 = level._id_B07F[var_0]["contents"][var_5]["last_time"];
  var_6 = strtok(var_6, "_");
  var_8 = var_6[0];

  switch (var_8) {
  case "fire":
  if ((scripts\engine\utility::_id_9CEE(level._id_D760) || scripts\engine\utility::_id_6E25("canFiresale") && var_1 - var_7 >= 180000) && var_3 >= 5) {
  level._id_1C86[level._id_1C86.size] = var_5;
  break;
  }
  else
  break;
  case "explosive":
  if ((scripts\engine\utility::_id_9CEE(level._id_D760) || var_1 - var_7 >= 300000) && var_3 >= 8) {
  level._id_1C86[level._id_1C86.size] = var_5;
  break;
  }
  else
  break;
  case "infinite":
  if ((scripts\engine\utility::_id_9CEE(level._id_D760) || var_1 - var_7 >= 180000) && var_3 >= 5) {
  level._id_1C86[level._id_1C86.size] = var_5;
  break;
  }
  else
  break;
  case "ammo":
  if ((scripts\engine\utility::_id_9CEE(level._id_D760) || var_1 - var_7 >= 180000) && var_3 >= 2) {
  level._id_1C86[level._id_1C86.size] = var_5;
  break;
  }
  else
  break;
  case "grenade":
  if ((scripts\engine\utility::_id_9CEE(level._id_D760) || var_1 - var_7 >= 60000) && var_3 >= 1) {
  level._id_1C86[level._id_1C86.size] = var_5;
  break;
  }
  else
  break;
  case "upgrade":
  if ((scripts\engine\utility::_id_9CEE(level._id_D760) || var_1 - var_7 >= 600000) && var_3 >= 15) {
  if (!_id_0A77::_id_9B97())
  level._id_1C86[level._id_1C86.size] = var_5;

  break;
  }
  else
  break;
  case "kill":
  if ((scripts\engine\utility::_id_9CEE(level._id_D760) || var_1 - var_7 >= 180000) && var_3 >= 1) {
  level._id_1C86[level._id_1C86.size] = var_5;
  break;
  }
  else
  break;
  case "cash":
  if ((scripts\engine\utility::_id_9CEE(level._id_D760) || var_1 - var_7 >= 90000) && var_3 >= 1) {
  level._id_1C86[level._id_1C86.size] = var_5;
  break;
  }
  else
  break;
  case "instakill":
  if ((scripts\engine\utility::_id_9CEE(level._id_D760) || var_1 - var_7 >= 90000) && var_3 >= 1) {
  level._id_1C86[level._id_1C86.size] = var_5;
  break;
  }
  else
  break;
  case "board":
  if ((scripts\engine\utility::_id_9CEE(level._id_D760) || var_1 - var_7 >= 45000) && var_3 >= 1) {
  level._id_1C86[level._id_1C86.size] = var_5;
  break;
  }
  else
  break;
  default:
  break;
  }
  }

  if (level._id_1C86.size < 1)
  return undefined;

  var_9 = level._id_1C86[_id_7ABA(var_0)];
  var_10 = level._id_B07F[var_0]["contents"][var_9]["value"];
  level._id_1C86 = undefined;
  level._id_A8E0 = var_9;
  return var_10;
}

_id_7ABA(var_0) {
  var_1 = 0;

  for (var_2 = 0; var_2 < level._id_1C86.size; var_2++) {
  var_3 = int(level._id_1C86[var_2]);
  var_1 = var_1 + level._id_B07F[var_0]["weights"][var_3];
  }

  var_4 = randomfloat(var_1);
  var_5 = 0;

  for (var_2 = 0; var_2 < level._id_1C86.size; var_2++) {
  var_3 = int(level._id_1C86[var_2]);
  var_5 = var_5 + level._id_B07F[var_0]["weights"][var_3];

  if (var_5 >= var_4)
  return var_2;
  }
}

_id_113C5(var_0, var_1, var_2) {
  return tablelookup(var_0, 0, var_1, var_2);
}

_id_12DB8(var_0, var_1, var_2) {
  if (!_id_0A77::_id_462B("loot"))
  return;

  if (!isdefined(level._id_B07A))
  return;

  if (!scripts\engine\utility::_id_6E25("zombie_drop_powerups"))
  return;

  if (!isplayer(var_2))
  return;

  var_4 = scripts\engine\utility::_id_9CEE(level._id_D760);

  if (level._id_D79D >= level._id_D79F && !var_4)
  return;

  if (!_id_9C0E(var_1))
  return;

  if (scripts\engine\utility::_id_9CEE(self._id_9CDD))
  return;

  if (isdefined(level._id_9B0B)) {
  if (!_id_0A6B::_id_9E54(var_1, level._id_9B0B, undefined, undefined, 1))
  return;
  }
  else if (!_id_0A6B::_id_9E54(var_1, undefined, undefined, undefined, 1))
  return;

  var_5 = level.players;
  var_3 = undefined;
  var_6 = 0;

  if (var_2 _id_0A77::_id_9BA0("more_power_up_drops"))
  var_7 = level._id_EC22 * 0.7;
  else
  var_7 = level._id_EC22;

  for (var_8 = 0; var_8 < var_5.size; var_8++) {
  if (isdefined(var_5[var_8]._id_11A21))
  var_6 = var_6 + var_5[var_8]._id_11A21;
  }

  var_9 = 0;

  if (var_6 > var_7 && !var_9)
  var_3 = _id_7AB8("kill_" + var_0, var_1);

  if (isdefined(var_3))
  level thread _id_5CF6(var_1, var_2, var_3, undefined, var_6, 1);
}

_id_12E16(var_0) {
  var_1 = gettime();
  level._id_B07F["kill_generic_zombie"]["contents"][var_0]["last_time"] = var_1;
}

_id_82C4(var_0, var_1, var_2) {
  level endon("game_ended");
  level endon("deactivated" + var_0);
  scripts\engine\utility::_id_6E3E("explosive_armor");
  level thread _id_4DB3(var_0, var_1);
  level thread _id_CFD5(var_0, ::_id_8300);
  level thread _id_D2C6(var_0, ::_id_8300);
  level thread _id_82C6(var_0, ::_id_8300);
  level._id_69FA = 1;

  foreach (var_4 in level.players) {
  if (!isalive(var_4) || scripts\engine\utility::_id_9CEE(var_4._id_98F3))
  continue;

  if (!scripts\engine\utility::_id_9CEE(var_4._id_8B7A))
  thread _id_8300(var_4, var_0);
  }
}

_id_8300(var_0, var_1) {
  var_0._id_8B7A = 1;
  var_0 thread _id_D73B(undefined, var_1);
  var_0 thread _id_48DE();
  var_0 thread _id_4CEC();
  var_0 thread _id_E00B(var_1);
  var_0 thread _id_E00C(var_0);
}

_id_CFD5(var_0, var_1) {
  level endon("deactivated" + var_0);
  level endon("game_ended");

  while (scripts\engine\utility::_id_6E25("explosive_armor")) {
  level waittill("connected", var_2);
  thread [[var_1]](var_2, var_0);
  }
}

_id_D2C6(var_0, var_1) {
  level endon("deactivated" + var_0);
  level endon("game_ended");

  while (scripts\engine\utility::_id_6E25("explosive_armor")) {
  level waittill("player_spawned", var_2);
  thread [[var_1]](var_2, var_0);
  }
}

_id_82C6(var_0, var_1) {
  level endon("deactivated" + var_0);
  level endon("game_ended");

  while (scripts\engine\utility::_id_6E25("explosive_armor")) {
  level waittill("revive_success", var_2);
  thread [[var_1]](var_2, var_0);
  }
}

_id_E00B(var_0) {
  level endon("game_ended");
  self endon("death");
  self endon("disconnect");
  self endon("last_stand");
  scripts\engine\utility::_id_6E5A("explosive_armor");
  self._id_8B7A = undefined;
  self setscriptablepartstate("exp_touch", "neutral", 0);
  self notify("explosive_armor_removed");
  self notify("remove_power_icon" + var_0);
}

_id_E00C(var_0) {
  level endon("game_ended");
  var_0 endon("disconnect");
  var_0 endon("explosive_armor_removed");
  var_0 scripts\engine\utility::waittill_any("death", "last_stand");
  var_0._id_8B7A = undefined;
  var_0 setscriptablepartstate("exp_touch", "neutral", 0);
  var_0 notify("explosive_armor_removed");
}

_id_4DB3(var_0, var_1) {
  level endon("disconnect");
  level endon("game_ended");
  var_1 = var_1 - 5.5;
  scripts\engine\utility::_id_13736(var_1, "deactivated" + var_0);
  level notify("deactivated" + var_0);
  wait 5.5;
  scripts\engine\utility::_id_6E2A("explosive_armor");
  level._id_69FA = undefined;

  foreach (var_3 in level.players)
  var_3._id_8B7A = undefined;
}

_id_4CEC() {
  level endon("game_ended");
  self endon("death");
  self endon("disconnect");
  self endon("last_stand");
  self endon("explosive_armor_removed");

  for (var_0 = gettime(); scripts\engine\utility::_id_6E25("explosive_armor"); var_0 = gettime()) {
  var_1 = scripts\engine\utility::_id_782F(self.origin, level._id_1084F, undefined, undefined, 128, 1);

  foreach (var_3 in var_1) {
  if (isalive(var_3)) {
  if (!isdefined(var_3._id_69FB) || gettime() > var_3._id_69FB) {
  var_3._id_69FB = var_0 + 1000;
  var_3 _meth_80B0(100, self.origin, self, self, "MOD_UNKNOWN", "power_script_generic_primary_mp");
  }
  }
  }

  wait 0.25;
  }
}

_id_48DE() {
  self endon("disconnect");
  level endon("game_ended");
  self setscriptablepartstate("exp_touch", "on", 0);
}

_id_C771(var_0, var_1, var_2) {
  level endon("deactivated" + var_0);
  level thread _id_4DCA(var_0, var_1);
  level thread _id_C76B(var_0);

  for (;;) {
  foreach (var_4 in level.players) {
  if (!scripts\engine\utility::_id_9CEE(var_4._id_8B97)) {
  var_4._id_8B97 = 1;
  var_5 = var_1 - (gettime() - var_2) / 1000;
  var_4 thread _id_D73B(var_5, var_0);
  }
  }

  wait 0.25;
  }
}

_id_C76B(var_0) {
  level endon("game_ended");
  level endon("host_migration_begin");
  level endon("deactivated" + var_0);

  for (;;) {
  var_1 = _id_0A4A::_id_7DB0("axis");

  foreach (var_4, var_3 in var_1) {
  if (!isalive(var_3)) {
  wait 0.2;
  continue;
  }

  if (isdefined(var_3._id_4D32)) {
  wait 0.2;
  continue;
  }

  if (isdefined(var_3._id_B36D)) {
  wait 0.2;
  continue;
  }

  if (isdefined(var_3._id_B36A)) {
  wait 0.2;
  continue;
  }

  if (isdefined(var_3._id_6BD4)) {
  wait 0.2;
  continue;
  }

  _id_0A62::_id_6221(var_3, level.players, 4, 0, 0, "high");

  if (var_4 % 2 == 0)
  wait 0.05;
  }

  wait 0.2;
  }
}

_id_4DCA(var_0, var_1) {
  level endon("disconnect");
  level endon("game_ended");
  scripts\engine\utility::_id_13736(var_1, "deactivated" + var_0);
  level notify("deactivated" + var_0);

  foreach (var_3 in level.players) {
  var_3._id_8B97 = undefined;
  var_3 _id_0A62::_id_12C01();
  }
}

_id_82DA(var_0, var_1, var_2) {
  level notify("activated" + var_0);
  level endon("activated" + var_0);
  level endon("deactivated" + var_0);
  level notify("infinite_grenade_active");
  level._id_94A8 = 1;
  level thread _id_4DBA(var_0, var_1);
  level._id_163F["infinite_grenades"] = 1;

  foreach (var_4 in level.players)
  thread _id_20AB(var_4);
}

_id_20A5(var_0) {
  if (isdefined(var_0.temporal_increase))
  var_0 thread _id_D73B(30 * var_0.temporal_increase, "fire_30");
  else
  var_0 thread _id_D73B(30, "fire_30");
}

_id_20AB(var_0) {
  var_0._id_D721 = 1;
  var_0._id_8B89 = 1;
  var_0 _id_0D15::_id_D71A(1, "primary", 1);

  if (isdefined(var_0.temporal_increase))
  var_0 thread _id_D73B(30 * var_0.temporal_increase, "grenade_30");
  else
  var_0 thread _id_D73B(30, "grenade_30");
}

_id_4DBA(var_0, var_1) {
  level endon("disconnect");
  level endon("game_ended");
  var_2 = scripts\engine\utility::_id_13736(var_1, "deactivated" + var_0, "activated" + var_0);

  if (var_2 != "activated" + var_0) {
  level._id_163F["infinite_grenades"] = 0;
  level notify("deactivated" + var_0);

  foreach (var_4 in level.players) {
  var_4 _id_0D15::_id_D71A(undefined, "primary", 1);
  var_4._id_8B89 = undefined;
  var_4._id_D721 = 0;
  }

  level._id_94A8 = undefined;
  }
}

_id_82D9(var_0, var_1, var_2) {
  level notify("activated" + var_0);
  level endon("activated" + var_0);
  level endon("deactivated" + var_0);
  level notify("infinite_ammo_active");
  level._id_94A4 = 1;
  level._id_163F["infinite_ammo"] = 1;
  level thread _id_4DB9(var_0, var_1);

  foreach (var_4 in level.players)
  thread _id_20AA(var_4);
}

_id_20AA(var_0) {
  var_0 thread _id_0A6A::_id_12885("powerup_ammo", "zmb_comment_vo");
  var_0._id_8B88 = 1;
  var_1 = var_0 _id_1E39();
  var_0 thread _id_12BA6(var_1, "infinite_20");

  if (isdefined(var_0.temporal_increase))
  var_0 thread _id_D73B(20 * var_0.temporal_increase, "infinite_20");
  else
  var_0 thread _id_D73B(20, "infinite_20");
}

_id_4DB9(var_0, var_1) {
  level endon("disconnect");
  level endon("game_ended");
  var_2 = scripts\engine\utility::_id_13736(var_1, "deactivated" + var_0, "activated" + var_0);

  if (var_2 != "activated" + var_0) {
  level._id_163F["infinite_ammo"] = 0;
  level._id_94A4 = undefined;
  level notify("deactivated" + var_0);

  foreach (var_4 in level.players)
  var_4._id_8B88 = undefined;
  }

  foreach (var_4 in level.players) {
  if (var_4 _id_0A77::isinfiniteammoenabled())
  var_4 _id_0A77::enable_infinite_ammo(0);
  }
}

_id_82E2(var_0, var_1, var_2) {
  level endon("deactivated" + var_0);
  level endon("disconnect");
  level endon("game_ended");
  var_3 = undefined;
  level._id_F0B8 = 1;
  var_4 = scripts\engine\utility::_id_DC6B(["power_speedBoost", "power_siegeMode", "power_barrier", "power_mortarMount", "power_transponder"]);

  for (;;) {
  foreach (var_6 in level.players) {
  if (!scripts\engine\utility::_id_9CEE(var_6._id_8B8C)) {
  var_6._id_8B8C = 1;
  var_7 = var_1 - (gettime() - var_2) / 1000;
  var_3 = var_6 _id_0D15::_id_13CFC("secondary");
  var_6 thread _id_0D15::_id_8397(var_4, "secondary", undefined, undefined, undefined, undefined, 1);
  var_6 _id_0D15::_id_D740(10, "secondary");
  var_6 thread _id_17D4(var_0, var_7);
  var_6 thread _id_D73B(var_7, var_0);
  var_6 thread _id_4DC4(var_7, var_3, var_4, var_0);
  }
  }

  wait 0.25;
  }
}

_id_17D4(var_0, var_1) {
  level endon("deactivated" + var_0);
  level endon("disconnect");
  level endon("game_ended");
  self endon("disconnect");
  self endon("lb_power_used");
  self._id_17D5 = 0;
  var_2 = var_1 / 3;
  self notifyonplayercommand("lb_power_used", "+speed_throw");

  while (self._id_17D5 > 3) {
  if (!isalive(self)) {
  wait 0.5;
  continue;
  }

  _id_0A77::_id_F78C("msg_axe_hint", &"CP_ZOMBIE_ADD_ABILITY__HINT", 5);
  self._id_17D5++;
  wait(var_2);
  }
}

_id_4DC4(var_0, var_1, var_2, var_3) {
  level endon("disconnect");
  level endon("game_ended");
  scripts\engine\utility::_id_13736(var_0, "deactivated" + var_3);
  self._id_8B8C = undefined;
  self._id_17D5 = undefined;
  level._id_F0B8 = undefined;
  level notify("deactivated" + var_3);
  _id_0D15::_id_E15E(var_2);

  if (isdefined(var_1))
  thread _id_0D15::_id_8397(var_1, "secondary", undefined, undefined, undefined, undefined, 0);
}

_id_829A() {
  level endon("game_ended");

  foreach (var_1 in level.players) {
  if (_id_0A5B::_id_D0EF(var_1))
  continue;

  give_max_ammo_to_player(var_1);
  }
}

give_max_ammo_to_player(var_0) {
  var_1 = var_0 getweaponslistprimaries();

  foreach (var_3 in var_1) {
  var_0 givemaxammo(var_3);

  if (weaponmaxammo(var_3) == weaponclipsize(var_3))
  var_0 setweaponammoclip(var_3, weaponclipsize(var_3));
  }

  var_5 = getarraykeys(var_0._id_D782);

  foreach (var_7 in var_5) {
  if (var_0._id_D782[var_7]._id_10307 == "secondary")
  continue;

  var_0 thread _id_DDD1(var_7);
  }
}

_id_DDD1(var_0) {
  var_1 = 0;
  var_2 = self._id_D782[var_0]._id_10307;
  var_3 = level._id_D782[var_0]._id_B486 - self._id_D782[var_0]._id_3D23;
  _id_0D15::_id_D71A(var_3, var_2);
  self setweaponammostock(level._id_D782[var_0]._id_13CE0, level._id_D782[var_0]._id_B486);
}

_id_15BB(var_0, var_1, var_2, var_3) {
  level endon("game_ended");
  level notify("activated" + var_1);
  level endon("deactivated" + var_1);
  level._id_9925 = 1;
  level thread _id_4DBB(var_1, var_2);
  level._id_163F["instakill"] = 1;

  foreach (var_5 in level.players)
  thread _id_20AC(var_5);
}

_id_20AC(var_0) {
  var_0._id_9926 = 1;

  if (isdefined(var_0.temporal_increase))
  var_0 thread _id_D73B(30 * var_0.temporal_increase, "instakill_30");
  else
  var_0 thread _id_D73B(30, "instakill_30");
}

_id_4DBB(var_0, var_1) {
  level endon("game_ended");
  level endon("activated" + var_0);
  scripts\engine\utility::_id_13736(var_1, "deactivated" + var_0);
  level notify("deactivated" + var_0);

  foreach (var_3 in level.players)
  var_3._id_9926 = undefined;

  level._id_9925 = undefined;
  level._id_163F["instakill"] = 0;
}

_id_EBA5(var_0, var_1, var_2, var_3) {
  level endon("game_ended");
  level endon("deactivated" + var_1);
  level notify("scale_earned_cash");
  level endon("scale_earned_cash");
  level._id_163F["double_money"] = 1;
  level._id_3B0F = 2;

  if (isdefined(var_0.temporal_increase))
  level thread _id_4DCD(var_1, 30 * var_0.temporal_increase, var_2);
  else
  level thread _id_4DCD(var_1, 30, var_2);

  foreach (var_5 in level.players)
  thread _id_20A3(var_5);
}

_id_20A3(var_0) {
  var_0._id_5AD6 = 1;

  if (isdefined(var_0.temporal_increase))
  var_0 thread _id_D73B(30 * var_0.temporal_increase, "cash_2");
  else
  var_0 thread _id_D73B(30, "cash_2");
}

_id_4DCD(var_0, var_1, var_2) {
  level endon("disconnect");
  level endon("game_ended");
  var_3 = scripts\engine\utility::_id_13736(var_1, "deactivated" + var_0, "activated" + var_0);

  if (var_3 != "activated" + var_0) {
  level notify("deactivated" + var_0);
  level._id_3B0F = 1;
  level._id_163F["double_money"] = 0;

  foreach (var_5 in level.players)
  var_5._id_5AD6 = undefined;
  }
}

_id_D73B(var_0, var_1) {
  level notify("power_icon_active_" + var_1);
  level endon("power_icon_active_" + var_1);
  var_2 = level._id_B07D[var_1];
  self._id_D7A0[var_1] = var_2;
  var_3 = _id_F5DD(var_1);
  thread _id_8EA0(var_0, var_1, var_3);
}

_id_F5DD(var_0) {
  var_1 = int(tablelookup(level._id_D763, 2, var_0, 1));
  var_2 = int(var_1);
  self _meth_82BE("zm_active_powerups", var_2 - 1, 1);
  return var_2;
}

_id_56C3(var_0) {
  foreach (var_2 in level.players) {
  var_2 setclientomnvar("zm_powerup_activated", var_0);
  wait 0.05;
  }
}

_id_79E0(var_0, var_1, var_2, var_3, var_4) {
  var_5 = [];
  var_6 = scripts\engine\utility::_id_8180(var_1, var_2);
  var_6[var_6.size] = var_0;

  foreach (var_8 in var_6) {
  var_9 = scripts\engine\utility::_id_782F(var_8.origin, level.players, undefined, 1, var_4, 1);

  if (var_9.size >= 1) {
  if (!isdefined(var_8.angles))
  var_8.angles = (0, 0, 0);

  var_10 = scripts\engine\utility::_id_107E6(var_8.origin, var_8.angles);
  var_10 show();
  var_10.origin = var_8.origin;
  var_10.angles = var_8.angles;
  var_5[var_5.size] = var_10;

  if (isdefined(var_3)) {
  if (var_5.size >= var_3)
  break;
  }
  }
  }

  var_5 = sortbydistance(var_5, var_0.origin);
  return var_5;
}

_id_A5C6(var_0, var_1) {
  level endon("game_ended");
  var_2 = var_0.origin;
  var_3 = _id_79E0(var_0, "effect_loc", "targetname", undefined, 1500);
  wait 1.0;
  playloopsound(var_2, "zmb_powerup_nuke_explo");
  level thread _id_C1AC(var_0, var_3);
  scripts\engine\utility::waitframe();
  playrumbleonentity("heavy_3s", var_2);
  earthquake(0.25, 4, var_2, 2500);
  scripts\engine\utility::waitframe();
  var_4 = _id_0A4A::_id_7DB0("axis");

  foreach (var_6 in level.players)
  var_6 _id_0A77::_id_17C0("nuke", 0.0, 0);

  var_8 = sortbydistance(var_4, var_2);
  var_9 = 400;

  if (isdefined(level._id_3B0F))
  var_9 = 400 * level._id_3B0F;

  foreach (var_11 in var_8) {
  if (_id_9C0C(var_11))
  continue;

  if (scripts\engine\utility::_id_9CEE(var_11._id_9E0C))
  var_11 _meth_80B0(var_11.health + 100, var_11.origin);
  else
  {
  var_11._id_0180 = 1;
  var_11._id_9B81 = 1;
  var_11._id_C026 = undefined;
  var_11 thread _id_A614(1);
  }

  wait 0.1;
  }

  level.nuke_zombies_paused = 1;
  wait 5;
  level.nuke_zombies_paused = 0;

  foreach (var_6 in level.players) {
  var_6 _id_0A77::_id_E0E6("nuke", 0);

  if (!scripts\engine\utility::_id_9CEE(level._id_72AA)) {
  if (!_id_0A5B::_id_D0EF(var_6))
  var_6 _id_0A63::_id_82F9(var_9, undefined, undefined, 1, "nuke");
  }
  }

  level._id_72AA = undefined;
}

_id_9C0C(var_0) {
  return scripts\engine\utility::_id_9CEE(var_0._id_9341);
}

_id_C1AC(var_0, var_1) {
  var_2 = 0;

  foreach (var_4 in var_1) {
  foreach (var_6 in level.players) {
  if (!var_6 _id_0A77::_id_9D05())
  continue;

  if (scripts\engine\utility::_id_9CEE(var_6._id_9387))
  continue;

  if (scripts\engine\utility::_id_9CEE(var_6._id_9C54))
  continue;

  playfxontagforclients(level._effect["big_explo"], var_4, "tag_origin", var_6);
  }

  scripts\engine\utility::waitframe();
  }

  wait 5;

  foreach (var_4 in var_1) {
  foreach (var_6 in level.players)
  _func_297(level._effect["big_explo"], var_4, "tag_origin", var_6);

  var_4 delete();
  scripts\engine\utility::waitframe();
  }
}

_id_A614(var_0) {
  self endon("death");
  thread _id_0D53::_id_20E6(self);
  self._id_B36E = 1;
  var_1 = scripts\engine\utility::_id_9CEE(self._id_9CDD);

  if (isdefined(var_0)) {
  if (isalive(self) && !var_1) {
  playfx(level._effect["head_loss"], self gettagorigin("j_neck"));
  self setscriptablepartstate("head", "detached", 1);
  self setscriptablepartstate("eyes", "eye_glow_off", 1);
  }
  }
  else
  wait 1;

  self _meth_80B0(self.health, self.origin);
}

_id_82EB(var_0, var_1) {
  var_0 iprintlnbold("Got Loot: $" + var_1);
  var_0 _id_0A63::_id_82F9(var_1);
}

_id_6EBE(var_0, var_1, var_2) {
  var_2 endon("remove " + var_1 + " icon");
  var_2 endon("death");
  var_2 endon("disconnect");
  level endon("game_ended");
  var_3 = 10;
  var_4 = 0.2;
  wait(var_0 - 5);
  var_0 = 5;

  for (;;) {
  wait(var_0 / var_3);
  self.alpha = 0.1;
  wait(var_4);
  self.alpha = 0.75;

  if (float(var_3 * 1.5) > var_4) {
  var_3 = float(var_3 * 1.5);
  continue;
  }

  var_3 = var_4;
  }
}

_id_8EA0(var_0, var_1, var_2, var_3) {
  level endon("activated" + var_1);
  self endon("remove_carryIcon" + var_1);
  self endon("disconnect");
  level endon("game_ended");

  if (!isdefined(var_0))
  var_0 = 60;

  var_4 = 5.5;
  var_0 = var_0 - var_4;
  self _meth_82BE("zm_active_powerup_animation", var_2 - 1, 0);

  if (var_0 > 0) {
  level scripts\engine\utility::_id_13736(var_0, "deactivated" + var_1);
  self _meth_82BE("zm_active_powerup_animation", var_2 - 1, 1);
  }

  level scripts\engine\utility::_id_13736(var_4, "deactivated" + var_1);
  level notify("power_up_deactivated");

  if (isdefined(self._id_D7A0[var_1]))
  self._id_D7A0[var_1] = undefined;

  self notify("remove " + var_1 + " icon");
  self _meth_82BE("zm_active_powerups", var_2 - 1, 0);
  self _meth_82BE("zm_active_powerup_animation", var_2 - 1, 0);
}

_id_8EBA() {
  self endon("remove_carryIcon");
  level waittill("game_ended");

  if (isdefined(self._id_3AF5))
  self._id_3AF5.alpha = 0;
}

_id_9C0E(var_0) {
  if (!isdefined(level._id_1646))
  return 1;

  var_1 = sortbydistance(level._id_1646, var_0);

  foreach (var_3 in var_1) {
  if (ispointinvolume(var_0, var_3))
  return 1;
  }

  return 0;
}

_id_1E39() {
  self endon("death");
  self endon("disconnect");
  var_0 = [];

  foreach (var_2 in self._id_13CA0)
  var_0[var_2] = self getammocount(var_2);

  return var_0;
}

_id_12BA6(var_0, var_1) {
  self endon("death");
  self endon("disconnect");
  level endon("deactivated" + var_1);

  if (!isdefined(self._id_13CA0))
  self._id_13CA0 = self getweaponslistprimaries();

  _id_0A77::enable_infinite_ammo(1);

  for (;;) {
  var_2 = 0;

  foreach (var_4 in self._id_13CA0) {
  if (var_4 == self getcurrentweapon() && _id_13C30(var_4)) {
  var_2 = 1;
  self setweaponammoclip(var_4, weaponclipsize(var_4), "left");
  }

  if (var_4 == self getcurrentweapon() && _id_13C30(var_4)) {
  var_2 = 1;
  self setweaponammoclip(var_4, weaponclipsize(var_4), "right");
  }

  if (var_2 == 0)
  _id_1E39();
  }

  wait 0.05;
  }
}

_id_13C30(var_0) {
  var_1 = 1;

  foreach (var_3 in level._id_C6C1) {
  if (var_0 == var_3)
  var_1 = 0;
  }

  return var_1;
}

_id_57B9() {
  scripts\engine\utility::waitframe();

  if (isdefined(self) && _id_0A77::_id_8BB1(self._id_01F1, "tag_eye"))
  playfxontagforclients(level._effect["vfx_screen_flash"], self, "tag_eye", self);
}
