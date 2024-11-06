/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2659.gsc
***************************************/

_id_F4CA(var_0) {
  self [[level._id_462C[var_0]._id_F286]]();
}

_id_12C11(var_0) {
  self [[level._id_462C[var_0]._id_12BF4]]();
}

_id_7B8B() {
  return self getrankedplayerdata("cp", "alienSession", "currency");
}

_id_7BA6() {
  return self._id_B48A;
}

_id_11426() {
  _id_F525(0);
}

_id_7CA5() {
  if (isdefined(level._id_10DA7))
  return level._id_10DA7;

  return 500;
}

_id_13683(var_0) {
  self endon("disconnect");
  level endon("game_ended");
  wait 1.0;
  _id_F525(var_0);
}

_id_F525(var_0) {
  self setrankedplayerdata("cp", "alienSession", "currency", int(var_0));
  _id_666A("currency", int(var_0), 1);
}

_id_82F9(var_0, var_1, var_2, var_3, var_4) {
  if (!isplayer(self))
  return;

  if (!scripts\engine\utility::_id_9CEE(var_3)) {
  var_0 = int(var_0 * _id_0CFF::_id_D877());
  var_0 = _id_0A54::_id_E759(var_0, 5);
  }

  if (isdefined(level.currency_scale_func))
  var_0 = [[level.currency_scale_func]](self, var_0);

  var_5 = _id_7B8B();
  var_6 = _id_7BA6();
  var_7 = var_5 + var_0;
  var_7 = min(var_7, var_6);

  if (!isdefined(self._id_11A21))
  self._id_11A21 = var_0;

  if (is_valid_give_type(var_4)) {
  self._id_11A21 = self._id_11A21 + (var_7 - var_5);
  self notify("consumable_charge", var_0 * 0.5);
  }

  level notify("currency_changed");
  _id_666A("currencytotal", int(self._id_11A21), 1);
  _id_F525(var_7);

  if (isdefined(level._id_12DED))
  [[level._id_12DED]](self, var_0);

  var_8 = 30000;
  var_9 = gettime();

  if (var_7 >= var_6) {
  if (!isdefined(self._id_BF4A))
  self._id_BF4A = var_9 + var_8;
  else if (var_9 < self._id_BF4A)
  return;

  if (!level._id_7669) {
  _id_0A77::_id_F78C("maxmoney", &"COOP_GAME_PLAY_MONEY_MAX", 4);
  self._id_BF4A = var_9 + var_8;
  }
  }

  if (is_valid_give_type(var_4))
  thread _id_0A77::add_to_notify_queue("player_earned_money", var_0);

  self notify("currency_earned", var_0);
  _id_0A77::_id_316C("currency_earned_buffered", var_0);
  _id_666A("score", int(self._id_11A21), 1);
}

is_valid_give_type(var_0) {
  if (!isdefined(var_0))
  return 1;

  switch (var_0) {
  case "pillage":
  case "nuke":
  case "magicWheelRefund":
  case "crafted":
  case "carpenter":
  case "bonus":
  case "atm":
  return 0;
  default:
  return 1;
  }

  return 1;
}

_id_11445(var_0, var_1, var_2, var_3) {
  var_4 = _id_7B8B();
  var_5 = max(0, var_4 - var_0);
  var_6 = int(var_4 - var_5);

  if (isdefined(level._id_3CA6))
  [[level._id_3CA6]](self, var_2, var_3);

  if (_id_0A77::_id_9BA0("next_purchase_free") && var_0 >= 1 && var_2 != "atm" && var_2 != "laststand" && var_2 != "bleedoutPenalty")
  _id_0A77::_id_C151("next_purchase_free");
  else
  _id_F525(var_5);

  if (var_6 < 1)
  return;

  if (isdefined(var_2))
  _id_0A4B::_id_12E2E(var_6, var_2);

  _id_666A("currencyspent", var_6);

  if (_id_0A77::_id_9BA0("door_buy_refund") && var_0 > 0) {
  if (var_2 != "atm" && var_2 != "laststand" && var_2 != "bleedoutPenalty") {
  _id_82F9(int(var_6 * 0.3), undefined, undefined, 1, "bonus");
  _id_0A77::_id_C151("door_buy_refund");
  }
  }

  if (_id_0A59::_id_FF5A(var_2))
  self notify("consumable_charge", var_0 * 0.07);

  if (var_2 != "atm" && var_2 != "laststand" && var_2 != "bleedoutPenalty")
  _id_0A77::_id_316C("currency_spent_buffered", var_0);

  if (isdefined(var_1) && var_1)
  return;
}

_id_D0BB(var_0, var_1) {
  if (!isdefined(var_1) || isdefined(var_1) && var_1 != "atm" && var_1 != "laststand" && var_1 != "bleedoutPenalty") {
  if (_id_0A77::_id_9BA0("next_purchase_free"))
  var_0 = 0;
  }

  var_2 = _id_7B8B();
  return var_2 >= var_0;
}

_id_12873(var_0) {
  if (_id_D0BB(var_0)) {
  _id_11445(var_0);
  return 1;
  }
  else
  return 0;
}

_id_9CF1(var_0) {
  var_1 = undefined;
  var_1 = strtok(var_0, "_")[0];
  var_2 = level._id_43E9[var_0]._id_12BD1;
  var_3 = _id_7BAA();
  return var_3 >= var_2;
}

_id_D225() {
  level._id_13F56 = 1;
  _id_F54A(0);
  _id_F548(0);
  self setrank(_id_7BAA(), _id_7BA9());
}

_id_F6A0(var_0, var_1, var_2, var_3, var_4) {
  foreach (var_7, var_6 in level.players) {
  if (var_7 == 4)
  continue;

  if (isdefined(var_0) && isdefined(var_1) && isdefined(var_2) && isdefined(var_3) && isdefined(var_4)) {
  var_6 setrankedplayerdata("cp", var_0, var_1, var_2, var_3, var_4);
  continue;
  }

  if (isdefined(var_0) && isdefined(var_1) && isdefined(var_2) && isdefined(var_3) && !isdefined(var_4)) {
  var_6 setrankedplayerdata("cp", var_0, var_1, var_2, var_3);
  continue;
  }

  if (isdefined(var_0) && isdefined(var_1) && isdefined(var_2) && !isdefined(var_3) && !isdefined(var_4)) {
  var_6 setrankedplayerdata("cp", var_0, var_1, var_2);
  continue;
  }

  if (isdefined(var_0) && isdefined(var_1) && !isdefined(var_2) && !isdefined(var_3) && !isdefined(var_4)) {
  var_6 setrankedplayerdata("cp", var_0, var_1);
  continue;
  }
  }
}

_id_F282() {
  thread _id_6669();
}

_id_6669() {
  self endon("disconnect");
  wait 0.5;
  var_0 = self getentitynumber();

  if (var_0 == 4)
  var_0 = 0;

  var_1 = "unknownPlayer";

  if (isdefined(self.name))
  var_1 = self.name;

  if (!level._id_4542)
  var_1 = getsubstr(var_1, 0, 19);
  else if (_id_8C44(var_1))
  var_1 = _id_DFD7(var_1);

  for (var_2 = 0; var_2 < 4; var_2++)
  self setrankedplayerdata("cp", "EoGPlayer", var_2, "connected", 0);

  foreach (var_4 in level.players) {
  var_4 _id_E1EA(var_0);
  var_4 setrankedplayerdata("cp", "EoGPlayer", var_0, "connected", 1);
  var_4 setrankedplayerdata("cp", "EoGPlayer", var_0, "name", var_1);
  var_4 setrankedplayerdata("common", "round", "totalXp", 0);
  var_4 setrankedplayerdata("common", "aarUnlockCount", 0);
  }

  var_6 = [0, 0, 0, 0];

  foreach (var_8 in level.players) {
  var_9 = var_8 getentitynumber();

  if (var_9 == 4)
  var_9 = 0;

  var_6[int(var_9)] = 1;

  if (var_8 == self)
  continue;

  var_0 = var_8 getentitynumber();

  if (var_0 == 4)
  var_0 = 0;

  var_10 = var_8 getrankedplayerdata("cp", "EoGPlayer", var_0, "name");
  var_11 = var_8 getrankedplayerdata("cp", "EoGPlayer", var_0, "kills");
  var_12 = var_8 getrankedplayerdata("cp", "EoGPlayer", var_0, "score");
  var_13 = var_8 getrankedplayerdata("cp", "EoGPlayer", var_0, "assists");
  var_14 = var_8 getrankedplayerdata("cp", "EoGPlayer", var_0, "revives");
  var_15 = var_8 getrankedplayerdata("cp", "EoGPlayer", var_0, "drillrestarts");
  var_16 = var_8 getrankedplayerdata("cp", "EoGPlayer", var_0, "drillplants");
  var_17 = var_8 getrankedplayerdata("cp", "EoGPlayer", var_0, "downs");
  var_18 = var_8 getrankedplayerdata("cp", "EoGPlayer", var_0, "deaths");
  var_19 = var_8 getrankedplayerdata("cp", "EoGPlayer", var_0, "hivesdestroyed");
  var_20 = var_8 getrankedplayerdata("cp", "EoGPlayer", var_0, "currency");
  var_21 = var_8 getrankedplayerdata("cp", "EoGPlayer", var_0, "currencyspent");
  var_22 = var_8 getrankedplayerdata("cp", "EoGPlayer", var_0, "currencytotal");
  var_23 = var_8 getrankedplayerdata("cp", "EoGPlayer", var_0, "currency");
  var_24 = var_8 getrankedplayerdata("cp", "EoGPlayer", var_0, "currencyspent");
  var_25 = var_8 getrankedplayerdata("cp", "EoGPlayer", var_0, "currencytotal");
  var_26 = var_8 getrankedplayerdata("cp", "EoGPlayer", var_0, "traps");
  var_27 = var_8 getrankedplayerdata("cp", "EoGPlayer", var_0, "deployables");
  var_28 = var_8 getrankedplayerdata("cp", "EoGPlayer", var_0, "deployablesused");
  var_29 = var_8 getrankedplayerdata("cp", "EoGPlayer", var_0, "consumablesearned");
  var_30 = var_8 getrankedplayerdata("cp", "EoGPlayer", var_0, "headShots");
  var_31 = var_8 getrankedplayerdata("cp", "EoGPlayer", var_0, "connected");
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "name", var_10);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "kills", var_11);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "score", var_12);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "assists", var_13);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "revives", var_14);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "drillrestarts", var_15);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "drillplants", var_16);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "downs", var_17);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "deaths", var_18);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "hivesdestroyed", var_19);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "currency", var_20);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "currencyspent", var_21);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "currencytotal", var_22);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "tickets", var_23);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "ticketsspent", var_24);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "tickettotal", var_25);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "traps", var_26);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "deployables", var_27);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "deployablesused", var_28);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "consumablesearned", var_29);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "headShots", var_30);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "connected", var_31);
  }

  foreach (var_35, var_34 in var_6) {
  if (!var_34)
  _id_E1EA(var_35);
  }
}

_id_E1EA(var_0) {
  if (var_0 == 4)
  var_0 = 0;

  self setrankedplayerdata("cp", "EoGPlayer", var_0, "name", "");
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "kills", 0);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "score", 0);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "assists", 0);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "revives", 0);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "drillrestarts", 0);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "drillplants", 0);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "downs", 0);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "deaths", 0);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "hivesdestroyed", 0);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "currency", 0);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "currencyspent", 0);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "currencytotal", 0);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "tickets", 0);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "ticketsspent", 0);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "tickettotal", 0);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "traps", 0);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "deployables", 0);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "deployablesused", 0);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "consumablesearned", 0);
  self setrankedplayerdata("cp", "EoGPlayer", var_0, "headShots", 0);
}

_id_666D(var_0) {
  if (_id_0A51::_id_7668())
  return;

  var_1 = var_0 getentitynumber();
  _id_F6A0("EoGPlayer", var_1, "connected", 0);
}

_id_666A(var_0, var_1, var_2) {
  var_3 = self getentitynumber();
  var_4 = var_1;

  if (!isdefined(var_2) || !var_2) {
  var_5 = self getrankedplayerdata("cp", "EoGPlayer", var_3, var_0);
  var_4 = int(var_5) + int(var_1);
  }

  _id_12887(var_0, var_4, 1);

  if (var_3 == 4)
  var_3 = 0;

  _id_F6A0("EoGPlayer", var_3, var_0, var_4);
}

_id_12887(var_0, var_1, var_2) {
  var_3 = _id_7AC0(var_0);

  if (!isdefined(var_3))
  return;

  _id_AAC4(var_3, var_1, var_2);
}

_id_AAC4(var_0, var_1, var_2) {
  if (scripts\engine\utility::_id_9CEE(var_2))
  var_3 = var_1;
  else
  {
  var_4 = self getrankedplayerdata("cp", "alienSession", var_0);
  var_3 = var_4 + var_1;
  }

  self setrankedplayerdata("cp", "alienSession", var_0, var_3);
}

_id_13CC6() {
  self._id_CA6F = [];

  foreach (var_3, var_1 in level._id_4377) {
  if (strtok(var_3, "_")[0] == "weapon") {
  var_2 = _id_7858(var_3);
  self._id_CA6F[var_2] = 1;
  }
  }

  thread _id_D353();
}

_id_7858(var_0) {
  var_1 = "";
  var_2 = strtok(var_0, "_");

  for (var_3 = 0; var_3 < var_2.size; var_3++) {
  var_4 = var_2[var_3];

  if (var_4 == "weapon" && var_3 == 0)
  continue;

  if (var_4 == "zm") {
  var_1 = var_1 + "zm";
  break;
  }

  if (var_3 < var_2.size - 1) {
  var_1 = var_1 + (var_4 + "_");
  continue;
  }

  var_1 = var_1 + var_4;
  break;
  }

  if (var_1 == "")
  return "none";

  return var_1;
}

_id_13CD1(var_0, var_1) {
  self setrankedplayerdata("cp", var_0, var_1, "hits", 0);
  self setrankedplayerdata("cp", var_0, var_1, "shots", 0);
  self setrankedplayerdata("cp", var_0, var_1, "kills", 0);
}

_id_12E4D(var_0, var_1, var_2) {
  if (!_id_9D0B(var_0, var_2))
  return;

  _id_12E4C("weaponStats", var_0, "hits", var_1);
  var_3 = "personal";

  if (isdefined(level._id_CA74))
  var_3 = level._id_CA74;

  _id_0A54::_id_12E04(var_3, "shots_hit", var_1);
}

_id_9D0B(var_0, var_1) {
  if (var_0 == "none")
  return 0;

  if (var_1 == "MOD_MELEE")
  return 0;

  if (_id_C01C(var_0))
  return 0;

  return 1;
}

_id_C01C(var_0) {
  switch (var_0) {
  case "iw7_spiked_bat_zm_pap2":
  case "iw7_spiked_bat_zm_pap1":
  case "iw7_spiked_bat_zm":
  case "iw7_machete_zm_pap2":
  case "iw7_machete_zm_pap1":
  case "iw7_machete_zm":
  case "iw7_golf_club_zm_pap2":
  case "iw7_golf_club_zm_pap1":
  case "iw7_golf_club_zm":
  case "iw7_two_headed_axe_zm_pap2":
  case "iw7_two_headed_axe_zm_pap1":
  case "iw7_two_headed_axe_zm":
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
  default:
  return 0;
  }
}

_id_12E4F(var_0, var_1) {
  if (!self._id_FFA9)
  return;

  _id_12E4C("weaponStats", var_0, "shots", var_1);
  var_2 = "personal";

  if (isdefined(level._id_CA74))
  var_2 = level._id_CA74;

  _id_0A54::_id_12E04(var_2, "shots_fired", var_1);
}

_id_12E4E(var_0, var_1) {
  _id_12E4C("weaponStats", var_0, "kills", var_1);
}

_id_12E4C(var_0, var_1, var_2, var_3) {
  if (!isplayer(self))
  return;

  var_4 = _id_7858(var_1);

  if (!isdefined(var_4) || !isdefined(self._id_CA6F[var_4]))
  return;

  if (isdefined(level._id_13C4C))
  var_4 = [[level._id_13C4C]](var_4);

  if (issubstr(var_4, "dlc")) {
  var_5 = strtok(var_4, "d");
  var_4 = var_5[0] + "DLC";
  var_5 = strtok(var_5[1], "c");
  var_4 = var_4 + var_5[1];
  }

  var_6 = int(self getrankedplayerdata("cp", var_0, var_4, var_2));
  var_7 = var_6 + int(var_3);
  self setrankedplayerdata("cp", var_0, var_4, var_2, var_7);
}

_id_D353() {
  self endon("disconnect");
  self notify("weaponstats_track_shots");
  self endon("weaponstats_track_shots");

  for (;;) {
  self waittill("weapon_fired", var_0);

  if (!isdefined(var_0))
  continue;

  var_1 = 1;
  _id_12E4F(var_0, var_1);
  }
}

_id_DCD1() {
  if (!isdefined(level._id_13F4F))
  level._id_13F4F = "cp/zombies/rankTable.csv";

  level._id_13F4E = [];
  level._id_13F3E = int(tablelookup(level._id_13F4F, 0, "maxrank", 1));

  for (var_0 = 0; var_0 <= level._id_13F3E; var_0++) {
  var_1 = _id_7C00(var_0);

  if (var_1 == "")
  break;

  if (!isdefined(level._id_13F4E[var_0])) {
  var_2 = spawnstruct();
  var_2._id_92B8 = var_0;
  var_2._id_DE3F = var_1;
  var_2._id_B111 = _id_7A81(var_0);
  var_2._id_928E = _id_7A25(var_0);
  var_2._id_119D4 = _id_7D08(var_0);
  var_2._id_13E1A = [];
  var_2._id_13E1A["min"] = _id_7AE7(var_0);
  var_2._id_13E1A["next"] = _id_7B1D(var_0);
  var_2._id_13E1A["max"] = _id_7AD1(var_0);
  var_2.name = [];
  var_2.name["short"] = _id_7C65(var_0);
  var_2.name["full"] = _id_79DB(var_0);
  var_2.name["ingame"] = _id_7A3E(var_0);
  level._id_13F4E[var_0] = var_2;
  }
  }
}

_id_7C00(var_0) {
  return tablelookup(level._id_13F4F, 0, var_0, 1);
}

_id_7AE7(var_0) {
  return int(tablelookup(level._id_13F4F, 0, var_0, 2));
}

_id_7AD1(var_0) {
  return int(tablelookup(level._id_13F4F, 0, var_0, 7));
}

_id_7B1D(var_0) {
  return int(tablelookup(level._id_13F4F, 0, var_0, 3));
}

_id_7A81(var_0) {
  return int(tablelookup(level._id_13F4F, 0, var_0, 14));
}

_id_7C65(var_0) {
  return tablelookup(level._id_13F4F, 0, var_0, 4);
}

_id_79DB(var_0) {
  return tablelookup(level._id_13F4F, 0, var_0, 5);
}

_id_7A3E(var_0) {
  return tablelookup(level._id_13F4F, 0, var_0, 17);
}

_id_7A25(var_0) {
  return tablelookup(level._id_13F4F, 0, var_0, 6);
}

_id_7D08(var_0) {
  return int(tablelookup(level._id_13F4F, 0, var_0, 19));
}

_id_7C98(var_0) {
  return tablelookup(level._id_13F4F, 0, var_0, 8);
}

_id_7BAA() {
  return self getrankedplayerdata("cp", "progression", "playerLevel", "rank");
}

_id_7BB8() {
  return self getrankedplayerdata("cp", "progression", "playerLevel", "xp");
}

_id_7BA9() {
  return self getrankedplayerdata("cp", "progression", "playerLevel", "prestige");
}

_id_7BB0() {
  return self getrankedplayerdata("cp", "alienSession", "experience");
}

_id_F54A(var_0) {
  self setrankedplayerdata("cp", "alienSession", "experience", var_0);
}

_id_8310(var_0) {
  var_1 = _id_7BB0();
  var_2 = var_0 + var_1;
  _id_F54A(var_2);
}

_id_7BAF() {
  return self getrankedplayerdata("cp", "alienSession", "shots");
}

_id_F549(var_0) {
  self setrankedplayerdata("cp", "alienSession", "shots", var_0);
}

_id_830F(var_0) {
  var_1 = _id_7BAF();
  var_2 = var_0 + var_1;
  _id_F549(var_2);
}

_id_F548(var_0) {
  self setrankedplayerdata("cp", "alienSession", "ranked_up", int(var_0));
}

_id_7BAE() {
  return self getrankedplayerdata("cp", "alienSession", "ranked_up");
}

_id_12E0F(var_0) {
  if (!isdefined(var_0))
  var_0 = 1;

  var_1 = _id_7BAE();
  var_2 = var_0 + var_1;
  _id_F548(var_2);
}

_id_F545(var_0) {
  self setrankedplayerdata("cp", "progression", "playerLevel", "rank", var_0);
}

_id_F552(var_0) {
  self setrankedplayerdata("cp", "progression", "playerLevel", "xp", var_0);

  if (isdefined(self._id_11A3D))
  self setrankedplayerdata("common", "round", "totalXp", self._id_11A3D);
}

_id_F543(var_0) {
  self setrankedplayerdata("cp", "progression", "playerLevel", "prestige", var_0);
  self setrankedplayerdata("cp", "progression", "playerLevel", "xp", 0);
  self setrankedplayerdata("cp", "progression", "playerLevel", "rank", 0);
}

_id_7BF7(var_0) {
  var_1 = 0;

  if (var_0 >= level._id_13F4E[level._id_13F3E]._id_13E1A["max"])
  return level._id_13F3E;

  if (isdefined(level._id_13F4E)) {
  for (var_2 = 0; var_2 < level._id_13F4E.size; var_2++) {
  if (var_0 >= level._id_13F4E[var_2]._id_13E1A["min"]) {
  if (var_0 < level._id_13F4E[var_2]._id_13E1A["max"]) {
  var_1 = level._id_13F4E[var_2]._id_92B8;
  break;
  }
  }
  }
  }

  return var_1;
}

_id_7C2B(var_0, var_1) {
  return int(var_1 * _id_7A84(var_0) * _id_7D6B(var_0));
}

_id_7A84(var_0) {
  if (isdefined(var_0._id_13E26))
  return var_0._id_13E26;
  else
  return 1;
}

_id_1358C(var_0, var_1) {
  self endon("disconnect");
  level endon("game_ended");
  wait(var_1);
  _id_831D(var_0);
}

_id_7D6B(var_0) {
  if (isdefined(var_0._id_13C37) && scripts\engine\utility::_id_9CEE(var_0.kill_with_extra_xp_passive)) {
  var_0.kill_with_extra_xp_passive = 0;
  return var_0._id_13C37;
  }
  else
  return 1;
}

_id_831D(var_0, var_1) {
  if (!level.onlinegame)
  return;

  var_0 = _id_7C2B(self, var_0);

  if (isdefined(self._id_11A3D)) {
  self._id_11A3D = self._id_11A3D + var_0;
  _id_0D45::_id_AF87(var_0, self._id_11A3D, self, level._id_13BD3);
  }

  thread _id_8310(var_0);
  var_2 = 0;
  var_3 = _id_7BAA();
  var_4 = _id_7BB8();
  var_5 = var_4 + var_0;
  _id_F552(var_5);

  if (scripts\engine\utility::_id_9CEE(var_1) && var_0 > 0) {
  self setclientomnvar("zom_xp_reward", var_0);
  self setclientomnvar("zom_xp_notify", gettime());
  }

  var_6 = _id_7BF7(var_5);

  if (var_6 > var_3) {
  if (var_6 == level._id_13F3E + 1)
  var_2 = 1;

  _id_F545(var_6);

  if (var_2 == 0) {
  var_7 = var_6 + 1;
  var_8 = _id_7C98(var_6);
  thread _id_0A57::showsplash(var_8, var_7);
  self notify("ranked_up", var_6);
  _id_12E0F();
  }

  self setrank(_id_7BAA(), _id_7BA9());
  process_rank_merits(var_6);
  }
}

process_rank_merits(var_0) {
  _id_0A5E::_id_D9AD("mt_prestige_1");

  if (var_0 >= 40)
  _id_0A5E::_id_D9AD("mt_prestige_2");

  if (var_0 >= 60)
  _id_0A5E::_id_D9AD("mt_prestige_3");

  if (var_0 >= 80)
  _id_0A5E::_id_D9AD("mt_prestige_4");

  if (var_0 >= 100)
  _id_0A5E::_id_D9AD("mt_prestige_5");

  if (var_0 >= 120)
  _id_0A5E::_id_D9AD("mt_prestige_6");

  if (var_0 >= 140)
  _id_0A5E::_id_D9AD("mt_prestige_7");

  if (var_0 >= 160)
  _id_0A5E::_id_D9AD("mt_prestige_8");

  if (var_0 >= 180)
  _id_0A5E::_id_D9AD("mt_prestige_9");

  if (var_0 >= 200)
  _id_0A5E::_id_D9AD("mt_prestige_10");
}

_id_93CB(var_0, var_1, var_2) {
  var_3 = self getrankedplayerdata("cp", var_0, var_1);
  var_4 = var_3 + var_2;
  self setrankedplayerdata("cp", var_0, var_1, var_4);
}

_id_93C9(var_0, var_1) {
  _id_93CB("alienSession", var_0, var_1);
}

_id_7A0E() {
  return _id_77FB("hivesDestroyed");
}

_id_77FB(var_0) {
  return self getrankedplayerdata("cp", "alienSession", var_0);
}

_id_F2A3(var_0, var_1) {
  self setrankedplayerdata("cp", "alienSession", var_0, var_1);
}

_id_12DAF(var_0) {
  if (isdefined(level._id_12DB0))
  var_0 [[level._id_12DB0]]();
  else
  var_0 _id_0A54::_id_12E04(_id_0A54::_id_7CE6(), "team_support_deploy");
}

_id_12DDB(var_0) {
  foreach (var_2 in level.players) {
  var_2 _id_AAC4("challengesAttempted", 1);

  if (var_0)
  var_2 _id_AAC4("challengesCompleted", 1);
  }
}

_id_12DDE(var_0) {
  foreach (var_2 in level.players)
  var_2 _id_AAC4("waveNum", var_0, 1);
}

_id_12DDC(var_0, var_1) {
  var_2 = _id_7A76(var_1);

  foreach (var_4 in var_0) {
  var_4 _id_AAC4("escapedRank" + var_2, 1, 1);
  var_4 _id_AAC4("hits", 1, 1);
  }
}

_id_12D8D(var_0, var_1) {
  if (!isdefined(var_1) || !isplayer(var_1))
  return;

  if (_id_0A77::_id_9CEB(var_0))
  var_1 _id_AAC4("trapKills", 1);
}

_id_DEC0(var_0) {
  level._id_6712 = var_0;
}

_id_7A76(var_0) {
  for (var_1 = 0; var_1 < level._id_6712.size - 1; var_1++) {
  if (var_0 >= level._id_6712[var_1] && var_0 < level._id_6712[var_1 + 1])
  return var_1;
  }
}

_id_8C44(var_0) {
  return issubstr(var_0, "[") && issubstr(var_0, "]");
}

_id_DFD7(var_0) {
  var_1 = strtok(var_0, "]");
  return var_1[1];
}

_id_DEB5() {
  var_0 = [];
  var_1["kills"] = "kills";
  var_1["deployables"] = "deployables";
  var_1["drillplants"] = "drillPlants";
  var_1["revives"] = "revives";
  var_1["downs"] = "downed";
  var_1["drillrestarts"] = "repairs";
  var_1["score"] = "score";
  var_1["currencyspent"] = "currencySpent";
  var_1["currencytotal"] = "currencyTotal";
  var_1["hivesdestroyed"] = "hivesDestroyed";
  var_1["waveNum"] = "waveNum";
  level._id_666C = var_1;
}

_id_7AC0(var_0) {
  return level._id_666C[var_0];
}

_id_CE64() {
  self endon("disconnect");

  for (;;) {
  wait 1;
  _id_AAC4("time", 1);
  }
}

_id_DDE9(var_0, var_1, var_2, var_3) {
  if (_id_0A77::isheadshot(var_0, var_1, var_2, var_3))
  increment_player_career_headshot_kills(var_3);

  var_3 increment_player_career_kills(var_3);
  var_3 _id_666A("kills", 1);
}

increment_player_career_total_waves(var_0) {
  if (isdefined(var_0.wave_num_when_joined))
  increment_zombiecareerstats(var_0, "Total_Waves", level._id_13BD3 - var_0.wave_num_when_joined);
  else
  increment_zombiecareerstats(var_0, "Total_Waves", level._id_13BD3);
}

increment_player_career_total_score(var_0) {
  increment_zombiecareerstats(var_0, "Total_Score", var_0.score_earned);
}

increment_player_career_shots_fired(var_0) {
  increment_zombiecareerstats(var_0, "Shots_Fired", 1);
}

increment_player_career_shots_on_target(var_0) {
  increment_zombiecareerstats(var_0, "Shots_on_Target", 1);
}

increment_player_career_explosive_kills(var_0) {
  increment_zombiecareerstats(var_0, "Explosive_Kills", 1);
}

increment_player_career_doors_opened(var_0) {
  increment_zombiecareerstats(var_0, "Doors_Opened", 1);
}

increment_player_career_perks_used(var_0) {
  increment_zombiecareerstats(var_0, "Perks_Used", 1);
}

increment_player_career_kills(var_0) {
  increment_zombiecareerstats(var_0, "Kills", 1);
  updateleaderboardstats(var_0, "Kills", 1, level.script, level.players.size, 1);
}

increment_player_career_headshot_kills(var_0) {
  var_0 increment_zombiecareerstats(var_0, "Headshot_Kills", 1);
  updateleaderboardstats(var_0, "Headshots", 1, level.script, level.players.size, 1);
}

increment_player_career_revives(var_0) {
  var_0 increment_zombiecareerstats(var_0, "Revives", 1);
  updateleaderboardstats(var_0, "Revives", 1, level.script, level.players.size, 1);
}

increment_player_career_downs(var_0) {
  var_0 increment_zombiecareerstats(var_0, "Downs", 1);
  updateleaderboardstats(var_0, "Downs", 1, level.script, level.players.size, 1);
}

update_players_career_highest_wave(var_0, var_1) {
  foreach (var_3 in level.players)
  update_player_career_highest_wave(var_3, var_0, var_1, level.players.size);
}

update_player_career_highest_wave(var_0, var_1, var_2, var_3) {
  updateifgreaterthan_zombiecareerstats(var_0, "Highest_Wave", var_1);
  update_highest_wave_lb(var_0, var_1, "Highest_Wave", var_2, var_3);
  updateleaderboardstats(var_0, "Rounds", var_1, var_2, var_3, 1);
}

increment_zombiecareerstats(var_0, var_1, var_2) {
  if (!isdefined(var_2))
  var_2 = 1;

  var_3 = var_0 getrankedplayerdata("cp", "coopCareerStats", var_1);
  var_4 = var_3 + var_2;
  var_0 setrankedplayerdata("cp", "coopCareerStats", var_1, int(var_4));
}

updateifgreaterthan_zombiecareerstats(var_0, var_1, var_2) {
  var_3 = var_0 getrankedplayerdata("cp", "coopCareerStats", var_1);

  if (var_2 > var_3)
  var_0 setrankedplayerdata("cp", "coopCareerStats", var_1, var_2);
}

update_highest_wave_lb(var_0, var_1, var_2, var_3, var_4) {
  var_5 = var_0 getrankedplayerdata("cp", "leaderboarddata", var_3, "leaderboardDataPerMap", var_4, var_2);

  if (var_1 > var_5)
  var_0 setrankedplayerdata("cp", "leaderboarddata", var_3, "leaderboardDataPerMap", var_4, var_2, var_1);
}

updateleaderboardstats(var_0, var_1, var_2, var_3, var_4, var_5) {
  if (!isdefined(var_5))
  var_5 = 1;

  var_6 = var_0 getrankedplayerdata("cp", "leaderboarddata", var_3, "leaderboardDataPerMap", var_4, var_1);
  var_2 = var_6 + var_5;

  if (var_2 > var_6)
  var_0 setrankedplayerdata("cp", "leaderboarddata", var_3, "leaderboardDataPerMap", var_4, var_1, var_2);
}
