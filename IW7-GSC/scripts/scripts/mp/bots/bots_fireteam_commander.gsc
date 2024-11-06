/***************************************************************
 * Decompiled by Bog
 * Edited by SyndiShanX
 * Script: scripts\scripts\mp\bots\bots_fireteam_commander.gsc
***************************************************************/

init() {
	if(scripts\mp\_utility::bot_is_fireteam_mode()) {
		level.tactic_notifies = [];
		level.tactic_notifies[0] = "tactics_exit";
		level.tactic_notifies[1] = "tactic_none";
		if(level.gametype == "dom") {
			level.tactic_notifies[2] = "tactic_dom_holdA";
			level.tactic_notifies[3] = "tactic_dom_holdB";
			level.tactic_notifies[4] = "tactic_dom_holdC";
			level.tactic_notifies[5] = "tactic_dom_holdAB";
			level.tactic_notifies[6] = "tactic_dom_holdAC";
			level.tactic_notifies[7] = "tactic_dom_holdBC";
			level.tactic_notifies[8] = "tactic_dom_holdABC";
		}
		else if(level.gametype == "war") {
			level.tactic_notifies[2] = "tactic_war_hyg";
			level.tactic_notifies[3] = "tactic_war_buddy";
			level.tactic_notifies[4] = "tactic_war_hp";
			level.tactic_notifies[5] = "tactic_war_pincer";
			level.tactic_notifies[6] = "tactic_war_ctc";
			level.tactic_notifies[7] = "tactic_war_rg";
		}
		else
		{
			return;
		}

		level.fireteam_commander = [];
		level.fireteam_commander["axis"] = undefined;
		level.fireteam_commander["allies"] = undefined;
		level.fireteam_hunt_leader = [];
		level.fireteam_hunt_leader["axis"] = undefined;
		level.fireteam_hunt_leader["allies"] = undefined;
		level.fireteam_hunt_target_zone = [];
		level.fireteam_hunt_target_zone["axis"] = undefined;
		level.fireteam_hunt_target_zone["allies"] = undefined;
		level thread commander_wait_connect();
		level thread commander_aggregate_score_on_game_end();
	}
}

commander_aggregate_score_on_game_end() {
	level waittill("game_ended");
	if(isdefined(level.fireteam_commander["axis"])) {
		var_00 = 0;
		foreach(var_02 in level.players) {
			if(isbot(var_02) && var_02.team == "axis") {
				var_00 = var_00 + var_02.pers["score"];
			}
		}

		level.fireteam_commander["axis"].pers["score"] = var_00;
		level.fireteam_commander["axis"].destroynavrepulsor = var_00;
		level.fireteam_commander["axis"] scripts\mp\_persistence::statadd("score",var_00);
		level.fireteam_commander["axis"] scripts\mp\_persistence::statsetchild("round","score",var_00);
	}

	if(isdefined(level.fireteam_commander["allies"])) {
		var_00 = 0;
		foreach(var_02 in level.players) {
			if(isbot(var_02) && var_02.team == "allies") {
				var_00 = var_00 + var_02.pers["score"];
			}
		}

		level.fireteam_commander["allies"].pers["score"] = var_00;
		level.fireteam_commander["allies"].destroynavrepulsor = var_00;
		level.fireteam_commander["allies"] scripts\mp\_persistence::statadd("score",var_00);
		level.fireteam_commander["allies"] scripts\mp\_persistence::statsetchild("round","score",var_00);
	}
}

commander_create_dom_obj(param_00) {
	if(!isdefined(self.fireteam_dom_point_obj[param_00])) {
		self.fireteam_dom_point_obj[param_00] = scripts\mp\objidpoolmanager::requestminimapid(1);
		var_01 = (0,0,0);
		foreach(var_03 in level.domflags) {
			if(var_03.label == "_" + param_00) {
				var_01 = var_03.curorigin;
				break;
			}
		}

		scripts\mp\objidpoolmanager::minimap_objective_add(self.fireteam_dom_point_obj[param_00],"invisible",var_01,"compass_obj_fireteam");
		scripts\mp\objidpoolmanager::minimap_objective_playerteam(self.fireteam_dom_point_obj[param_00],self getentitynumber());
	}
}

commander_initialize_gametype() {
	if(isdefined(self.commander_gametype_initialized)) {
		return;
	}

	self.commander_gametype_initialized = 1;
	self.commander_last_tactic_applied = "tactic_none";
	self.commander_last_tactic_selected = "tactic_none";
	switch(level.gametype) {
		case "war":
			break;

		case "dom":
			self.fireteam_dom_point_obj = [];
			commander_create_dom_obj("a");
			commander_create_dom_obj("b");
			commander_create_dom_obj("c");
			break;
	}
}

commander_monitor_tactics() {
	self endon("disconnect");
	level endon("game_ended");
	for(;;) {
		self waittill("luinotifyserver",var_00,var_01);
		if(var_00 != "tactic_select") {
			if(var_00 == "bot_select") {
				if(var_01 > 0) {
					commander_handle_notify_quick("bot_next");
				}
				else if(var_01 < 0) {
					commander_handle_notify_quick("bot_prev");
				}
			}
			else if(var_00 == "tactics_menu") {
				if(var_01 > 0) {
					commander_handle_notify_quick("tactics_menu");
				}
				else if(var_01 <= 0) {
					commander_handle_notify_quick("tactics_close");
				}
			}

			continue;
		}

		if(var_01 >= level.tactic_notifies.size) {
			continue;
		}

		var_02 = level.tactic_notifies[var_01];
		commander_handle_notify_quick(var_02);
	}
}

commander_handle_notify_quick(param_00,param_01) {
	if(!isdefined(param_00)) {
		return;
	}

	switch(param_00) {
		case "bot_prev":
			commander_spectate_next_bot(1);
			break;

		case "bot_next":
			commander_spectate_next_bot(0);
			break;

		case "tactics_menu":
			self notify("commander_mode");
			if(isdefined(self.forcespectatorent)) {
				self.forcespectatorent notify("commander_mode");
			}
			break;

		case "tactics_close":
			self.commander_closed_menu_time = gettime();
			self notify("takeover_bot");
			break;

		case "tactic_none":
			if(level.gametype == "dom") {
				scripts\mp\objidpoolmanager::minimap_objective_state(self.fireteam_dom_point_obj["a"],"invisible");
				scripts\mp\objidpoolmanager::minimap_objective_state(self.fireteam_dom_point_obj["b"],"invisible");
				scripts\mp\objidpoolmanager::minimap_objective_state(self.fireteam_dom_point_obj["c"],"invisible");
			}
			break;

		case "tactic_dom_holdA":
			scripts\mp\objidpoolmanager::minimap_objective_state(self.fireteam_dom_point_obj["a"],"active");
			scripts\mp\objidpoolmanager::minimap_objective_state(self.fireteam_dom_point_obj["b"],"invisible");
			scripts\mp\objidpoolmanager::minimap_objective_state(self.fireteam_dom_point_obj["c"],"invisible");
			break;

		case "tactic_dom_holdB":
			scripts\mp\objidpoolmanager::minimap_objective_state(self.fireteam_dom_point_obj["a"],"invisible");
			scripts\mp\objidpoolmanager::minimap_objective_state(self.fireteam_dom_point_obj["b"],"active");
			scripts\mp\objidpoolmanager::minimap_objective_state(self.fireteam_dom_point_obj["c"],"invisible");
			break;

		case "tactic_dom_holdC":
			scripts\mp\objidpoolmanager::minimap_objective_state(self.fireteam_dom_point_obj["a"],"invisible");
			scripts\mp\objidpoolmanager::minimap_objective_state(self.fireteam_dom_point_obj["b"],"invisible");
			scripts\mp\objidpoolmanager::minimap_objective_state(self.fireteam_dom_point_obj["c"],"active");
			break;

		case "tactic_dom_holdAB":
			scripts\mp\objidpoolmanager::minimap_objective_state(self.fireteam_dom_point_obj["a"],"active");
			scripts\mp\objidpoolmanager::minimap_objective_state(self.fireteam_dom_point_obj["b"],"active");
			scripts\mp\objidpoolmanager::minimap_objective_state(self.fireteam_dom_point_obj["c"],"invisible");
			break;

		case "tactic_dom_holdAC":
			scripts\mp\objidpoolmanager::minimap_objective_state(self.fireteam_dom_point_obj["a"],"active");
			scripts\mp\objidpoolmanager::minimap_objective_state(self.fireteam_dom_point_obj["b"],"invisible");
			scripts\mp\objidpoolmanager::minimap_objective_state(self.fireteam_dom_point_obj["c"],"active");
			break;

		case "tactic_dom_holdBC":
			scripts\mp\objidpoolmanager::minimap_objective_state(self.fireteam_dom_point_obj["a"],"invisible");
			scripts\mp\objidpoolmanager::minimap_objective_state(self.fireteam_dom_point_obj["b"],"active");
			scripts\mp\objidpoolmanager::minimap_objective_state(self.fireteam_dom_point_obj["c"],"active");
			break;

		case "tactic_dom_holdABC":
			scripts\mp\objidpoolmanager::minimap_objective_state(self.fireteam_dom_point_obj["a"],"active");
			scripts\mp\objidpoolmanager::minimap_objective_state(self.fireteam_dom_point_obj["b"],"active");
			scripts\mp\objidpoolmanager::minimap_objective_state(self.fireteam_dom_point_obj["c"],"active");
			break;

		case "tactic_war_rg":
			break;

		case "tactic_war_ctc":
			break;

		case "tactic_war_hp":
			break;

		case "tactic_war_buddy":
			break;

		case "tactic_war_pincer":
			break;

		case "tactic_war_hyg":
			break;
	}

	if(scripts\engine\utility::string_starts_with(param_00,"tactic_")) {
		self playlocalsound("earn_superbonus");
		if(self.commander_last_tactic_applied != param_00) {
			self.commander_last_tactic_applied = param_00;
			thread commander_order_ack();
			if(isdefined(level.bot_funcs["commander_gametype_tactics"])) {
				self [[level.bot_funcs["commander_gametype_tactics"]]](param_00);
				return;
			}
		}
	}
}

commander_order_ack() {
	self notify("commander_order_ack");
	self endon("commander_order_ack");
	self endon("disconnect");
	var_00 = 360000;
	var_01 = var_00;
	var_02 = undefined;
	for(;;) {
		wait(0.5);
		var_01 = var_00;
		var_02 = undefined;
		var_03 = self.origin;
		var_04 = self getspectatingplayer();
		if(isdefined(var_04)) {
			var_03 = var_04.origin;
		}

		foreach(var_06 in level.players) {
			if(isdefined(var_06) && isalive(var_06) && isbot(var_06) && isdefined(var_06.team) && var_06.team == self.team) {
				var_07 = distancesquared(var_03,var_06.origin);
				if(var_07 < var_01) {
					var_02 = var_06;
				}
			}
		}

		if(isdefined(var_02)) {
			var_09 = var_02.pers["voicePrefix"];
			var_0A = var_09 + level.bcsounds["callout_response_generic"];
			var_02 thread scripts\mp\_battlechatter_mp::dosound(var_0A,1,1);
			return;
		}
	}
}

commander_hint_fade(param_00) {
	if(!isdefined(self)) {
		return;
	}

	self notify("commander_hint_fade_out");
	if(isdefined(self.commanderhintelem)) {
		var_01 = self.commanderhintelem;
		if(param_00 > 0) {
			var_01 changefontscaleovertime(param_00);
			var_01.fontscale = var_01.fontscale * 1.5;
			var_01.objective_delete = (0.3,0.6,0.3);
			var_01.objective_current_nomessage = 1;
			var_01 fadeovertime(param_00);
			var_01.color = (0,0,0);
			var_01.alpha = 0;
			wait(param_00);
		}

		var_01 scripts\mp\_hud_util::destroyelem();
	}
}

commander_hint() {
	self endon("disconnect");
	self endon("commander_mode");
	self.commander_gave_hint = 1;
	wait(1);
	if(!isdefined(self)) {
		return;
	}

	self.commanderhintelem = scripts\mp\_hud_util::createfontstring("default",3);
	self.commanderhintelem.color = (1,1,1);
	self.commanderhintelem settext(&"MPUI_COMMANDER_HINT");
	self.commanderhintelem.x = 0;
	self.commanderhintelem.y = 20;
	self.commanderhintelem.alignx = "center";
	self.commanderhintelem.aligny = "middle";
	self.commanderhintelem.horzalign = "center";
	self.commanderhintelem.vertalign = "middle";
	self.commanderhintelem.foreground = 1;
	self.commanderhintelem.alpha = 1;
	self.commanderhintelem.playrumblelooponposition = 1;
	self.commanderhintelem.sort = -1;
	self.commanderhintelem endon("death");
	thread commander_hint_delete_on_commander_menu();
	wait(4);
	thread commander_hint_fade(0.5);
}

commander_hint_delete_on_commander_menu() {
	self endon("disconnect");
	self endon("commander_hint_fade_out");
	self waittill("commander_mode");
	thread commander_hint_fade(0);
}

hud_monitorplayerownership() {
	self endon("disconnect");
	self.ownershipstring = [];
	for(var_00 = 0;var_00 < 16;var_00++) {
		self.ownershipstring[var_00] = scripts\mp\_hud_util::createfontstring("default",1);
		self.ownershipstring[var_00].color = (1,1,1);
		self.ownershipstring[var_00].x = 0;
		self.ownershipstring[var_00].y = 30 + var_00 * 12;
		self.ownershipstring[var_00].alignx = "center";
		self.ownershipstring[var_00].aligny = "top";
		self.ownershipstring[var_00].horzalign = "center";
		self.ownershipstring[var_00].vertalign = "top";
		self.ownershipstring[var_00].foreground = 1;
		self.ownershipstring[var_00].alpha = 1;
		self.ownershipstring[var_00].sort = -1;
		self.ownershipstring[var_00].archived = 0;
	}

	for(;;) {
		var_01 = 0;
		var_02 = [];
		foreach(var_04 in self.ownershipstring) {
		}

		foreach(var_07 in level.players) {
			var_08 = 0;
			if(isdefined(var_07) && var_07.team == self.team) {
				if(isdefined(var_07.triggerportableradarping)) {
					if(scripts\engine\utility::array_contains(var_02,var_07)) {
						self.ownershipstring[var_01].color = (1,0,0);
					}
					else
					{
						var_02 = scripts\engine\utility::array_add(var_02,var_07);
					}

					if(var_07 != var_07.triggerportableradarping && scripts\engine\utility::array_contains(var_02,var_07.triggerportableradarping)) {
						self.ownershipstring[var_01].color = (1,0,0);
					}
					else
					{
						var_02 = scripts\engine\utility::array_add(var_02,var_07.triggerportableradarping);
					}

					if(var_07 == self) {
						self.ownershipstring[var_01].color = (1,0,0);
					}
					else if(var_07.triggerportableradarping == var_07) {
						self.ownershipstring[var_01].color = (1,0,0);
					}
					else if(var_07.triggerportableradarping == self) {
						self.ownershipstring[var_01].color = (0,1,0);
					}
					else
					{
						self.ownershipstring[var_01].color = (1,1,1);
					}
				}
				else if(isdefined(var_07.bot_fireteam_follower)) {
					var_08 = 1;
				}
				else
				{
					self.ownershipstring[var_01].color = (1,1,0);
				}
			}
			else
			{
				var_08 = 1;
			}

			if(!var_08) {
				var_01++;
			}
		}

		wait(0.1);
	}
}

commander_wait_connect() {
	for(;;) {
		foreach(var_01 in level.players) {
			if(!isai(var_01) && !isdefined(var_01.fireteam_connected)) {
				var_01.fireteam_connected = 1;
				var_01 setclientomnvar("ui_options_menu",0);
				var_01.classcallback = ::commander_loadout_class_callback;
				var_02 = "allies";
				if(!isdefined(var_01.team)) {
					if(level.teamcount["axis"] < level.teamcount["allies"]) {
						var_02 = "axis";
					}
					else if(level.teamcount["allies"] < level.teamcount["axis"]) {
						var_02 = "allies";
					}
				}

				var_01 scripts\mp\_menus::addtoteam(var_02);
				level.fireteam_commander[var_01.team] = var_01;
				var_01 scripts\mp\_menus::bypassclasschoice();
				var_01.class_num = 0;
				var_01.waitingtoselectclass = 0;
				var_01 thread onfirstspawnedplayer();
				var_01 thread commander_monitor_tactics();
			}
		}

		wait(0.05);
	}
}

onfirstspawnedplayer() {
	self endon("disconnect");
	for(;;) {
		if(self.team != "spectator" && self.sessionstate == "spectator") {
			thread commander_initialize_gametype();
			thread wait_commander_takeover_bot();
			thread commander_spectate_first_available_bot();
			return;
		}

		wait(0.05);
	}
}

commander_spectate_first_available_bot() {
	self endon("disconnect");
	self endon("joined_team");
	self endon("spectating_cycle");
	for(;;) {
		foreach(var_01 in level.players) {
			if(isbot(var_01) && var_01.team == self.team) {
				thread commander_spectate_bot(var_01);
				var_01 thread commander_hint();
				return;
			}
		}

		wait(0.1);
	}
}

monitor_enter_commander_mode() {
	self endon("disconnect");
	self endon("joined_spectators");
	for(;;) {
		self waittill("commander_mode");
		var_00 = scripts\mp\killstreaks\_deployablebox::isholdingdeployablebox();
		if(!isalive(self) || var_00) {
			continue;
		}

		break;
	}

	if(self.team == "spectator") {
		return;
	}

	thread wait_commander_takeover_bot();
	self playlocalsound("mp_card_slide");
	var_01 = 0;
	foreach(var_03 in level.players) {
		if(isdefined(var_03) && var_03 != self && isbot(var_03) && isdefined(var_03.team) && var_03.team == self.team && isdefined(var_03.sidelinedbycommander) && var_03.sidelinedbycommander == 1) {
			var_03 thread spectator_takeover_other(self);
			var_01 = 1;
			break;
		}
	}

	if(!var_01) {
		thread scripts\mp\_playerlogic::spawnspectator();
	}
}

commander_can_takeover_bot(param_00) {
	if(!isdefined(param_00)) {
		return 0;
	}

	if(!isbot(param_00)) {
		return 0;
	}

	if(!isalive(param_00)) {
		return 0;
	}

	if(!param_00.connected) {
		return 0;
	}

	if(param_00.team != self.team) {
		return 0;
	}

	var_01 = scripts\mp\killstreaks\_deployablebox::isholdingdeployablebox();
	if(var_01) {
		return 0;
	}

	return 1;
}

player_get_player_index() {
	for(var_00 = 0;var_00 < level.players.size;var_00++) {
		if(level.players[var_00] == self) {
			return var_00;
		}
	}

	return -1;
}

commander_spectate_next_bot(param_00) {
	var_01 = self getspectatingplayer();
	var_02 = undefined;
	var_03 = 0;
	var_04 = 1;
	if(isdefined(param_00) && param_00 == 1) {
		var_04 = -1;
	}

	if(isdefined(var_01)) {
		var_03 = var_01 player_get_player_index();
	}

	var_05 = 1;
	for(var_06 = var_03 + var_04;var_05 < level.players.size;var_06 = var_06 + var_04) {
		var_05++;
		if(var_06 < 0) {
			var_06 = level.players.size - 1;
		}
		else if(var_06 >= level.players.size) {
			var_06 = 0;
		}

		if(!isdefined(level.players[var_06])) {
			continue;
		}

		if(isdefined(var_01) && level.players[var_06] == var_01) {
			break;
		}

		var_07 = commander_can_takeover_bot(level.players[var_06]);
		if(var_07) {
			var_02 = level.players[var_06];
			break;
		}
	}

	if(isdefined(var_02) && !isdefined(var_01) || var_02 != var_01) {
		thread commander_spectate_bot(var_02);
		self playlocalsound("oldschool_return");
		var_02 thread takeover_flash();
		if(isdefined(var_01)) {
			var_01 bot_free_to_move();
			return;
		}

		return;
	}

	self playlocalsound("counter_uav_deactivate");
}

commander_spectate_bot(param_00) {
	self notify("commander_spectate_bot");
	self endon("commander_spectate_bot");
	self endon("commander_spectate_stop");
	self endon("disconnect");
	while(isdefined(param_00)) {
		if(!self.clearstartpointtransients && param_00.sessionstate == "playing") {
			var_01 = param_00 getentitynumber();
			if(self.missile_createrepulsorent != var_01) {
				self allowspectateteam("none",0);
				self allowspectateteam("freelook",0);
				self.missile_createrepulsorent = var_01;
				self.forcespectatorent = param_00;
			}
		}

		wait(0.05);
	}
}

get_spectated_player() {
	var_00 = undefined;
	if(isdefined(self.forcespectatorent)) {
		var_00 = self.forcespectatorent;
	}
	else
	{
		var_00 = self getspectatingplayer();
	}

	return var_00;
}

commander_takeover_first_available_bot() {
	self endon("disconnect");
	self endon("joined_team");
	self endon("spectating_cycle");
	for(;;) {
		foreach(var_01 in level.players) {
			if(isbot(var_01) && var_01.team == self.team) {
				spectator_takeover_other(var_01);
				return;
			}
		}

		wait(0.1);
	}
}

spectator_takeover_other(param_00) {
	self.forcespawnorigin = param_00.origin;
	var_01 = param_00 getplayerangles();
	var_01 = (var_01[0],var_01[1],0);
	self.forcespawnangles = (0,param_00.angles[1],0);
	self setstance(param_00 getstance());
	self.botlastloadout = param_00.botlastloadout;
	self.bot_class = param_00.bot_class;
	commander_or_bot_change_class(self.bot_class);
	self.health = param_00.health;
	self.var_381 = param_00.var_381;
	store_weapons_status(param_00);
	param_00 thread scripts\mp\_playerlogic::spawnspectator();
	if(isbot(param_00)) {
		param_00.sidelinedbycommander = 1;
		param_00 bot_free_to_move();
		self playlocalsound(param_00);
		self notify("commander_spectate_stop");
		param_00 notify("commander_took_over");
	}
	else
	{
	}

	thread scripts\mp\_playerlogic::spawnclient();
	self setplayerangles(var_01);
	apply_weapons_status();
	function_0027(self,param_00);
	if(isbot(self)) {
		param_00 thread commander_spectate_bot(self);
		param_00 playlocalsound(undefined);
		self.sidelinedbycommander = 0;
		param_00 playlocalsound("counter_uav_activate");
		thread takeover_flash();
		param_00.commanding_bot = undefined;
		param_00.last_commanded_bot = self;
		bot_wait_here();
		return;
	}

	thread monitor_enter_commander_mode();
	self playsound("copycat_steal_class");
	thread takeover_flash();
	self.commanding_bot = param_00;
	self.last_commanded_bot = undefined;
	if(!isdefined(self.commander_gave_hint)) {
		thread commander_hint();
	}
}

takeover_flash() {
	if(!isdefined(self.takeoverflashoverlay)) {
		self.takeoverflashoverlay = newclienthudelem(self);
		self.takeoverflashoverlay.x = 0;
		self.takeoverflashoverlay.y = 0;
		self.takeoverflashoverlay.alignx = "left";
		self.takeoverflashoverlay.aligny = "top";
		self.takeoverflashoverlay.horzalign = "fullscreen";
		self.takeoverflashoverlay.vertalign = "fullscreen";
		self.takeoverflashoverlay setshader("combathigh_overlay",640,480);
		self.takeoverflashoverlay.sort = -10;
		self.takeoverflashoverlay.archived = 1;
	}

	self.takeoverflashoverlay.alpha = 0;
	self.takeoverflashoverlay fadeovertime(0.25);
	self.takeoverflashoverlay.alpha = 1;
	wait(0.75);
	self.takeoverflashoverlay fadeovertime(0.5);
	self.takeoverflashoverlay.alpha = 0;
}

wait_commander_takeover_bot() {
	self endon("disconnect");
	self endon("joined_team");
	self notify("takeover_wait_start");
	self endon("takeover_wait_start");
	for(;;) {
		self waittill("takeover_bot");
		var_00 = get_spectated_player();
		var_01 = commander_can_takeover_bot(var_00);
		if(!var_01) {
			commander_spectate_next_bot(0);
			var_00 = get_spectated_player();
			var_01 = commander_can_takeover_bot(var_00);
		}

		if(var_01) {
			thread spectator_takeover_other(var_00);
			break;
		}

		self playlocalsound("counter_uav_deactivate");
	}
}

bot_wait_here() {
	if(!isdefined(self) || !isplayer(self) || !isbot(self)) {
		return;
	}

	self notify("wait_here");
	self botsetflag("disable_movement",1);
	self.badplacename = "bot_waiting_" + self.team + "_" + self.name;
	badplace_cylinder(self.badplacename,5,self.origin,32,72,self.team);
	thread bot_delete_badplace_on_death();
	thread bot_wait_free_to_move();
}

bot_delete_badplace_on_death(param_00) {
	self endon("freed_to_move");
	self endon("disconnect");
	self waittill("death");
	bot_free_to_move();
}

bot_wait_free_to_move() {
	self endon("wait_here");
	wait(5);
	thread bot_free_to_move();
}

bot_free_to_move() {
	if(!isdefined(self) || !isplayer(self) || !isbot(self)) {
		return;
	}

	self botsetflag("disable_movement",0);
	if(isdefined(self.badplacename)) {
		badplace_delete(self.badplacename);
	}

	self notify("freed_to_move");
}

commander_loadout_class_callback(param_00) {
	return self.botlastloadout;
}

commander_or_bot_change_class(param_00) {
	self.pers["class"] = param_00;
	self.class = param_00;
	scripts\mp\_class::setclass(param_00);
	self.weaponispreferreddrop = undefined;
	self.tag_stowed_hip = undefined;
}

store_weapons_status(param_00) {
	self.copy_fullweaponlist = param_00 getweaponslistall();
	self.copy_weapon_current = param_00 getcurrentweapon();
	foreach(var_02 in self.copy_fullweaponlist) {
		self.copy_weapon_ammo_clip[var_02] = param_00 getweaponammoclip(var_02);
		self.copy_weapon_ammo_stock[var_02] = param_00 getweaponammostock(var_02);
	}
}

apply_weapons_status() {
	foreach(var_01 in self.copy_fullweaponlist) {
		if(!self hasweapon(var_01)) {
			self giveweapon(var_01);
		}
	}

	var_03 = self getweaponslistall();
	foreach(var_01 in var_03) {
		if(!scripts\engine\utility::array_contains(self.copy_fullweaponlist,var_01)) {
			scripts\mp\_utility::_takeweapon(var_01);
		}
	}

	foreach(var_01 in self.copy_fullweaponlist) {
		if(self hasweapon(var_01)) {
			self setweaponammoclip(var_01,self.copy_weapon_ammo_clip[var_01]);
			self setweaponammostock(var_01,self.copy_weapon_ammo_stock[var_01]);
			continue;
		}
	}

	if(self getcurrentweapon() != self.copy_weapon_current) {
		scripts\mp\_utility::_switchtoweapon(self.copy_weapon_current);
	}
}