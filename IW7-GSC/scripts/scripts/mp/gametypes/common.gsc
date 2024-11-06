/***************************************************
 * Decompiled by Bog
 * Edited by SyndiShanX
 * Script: scripts\scripts\mp\gametypes\common.gsc
***************************************************/

setupcommoncallbacks() {
	level.onnormaldeath = ::onnormaldeath;
	level.onsuicidedeath = ::onsuicidedeath;
	level.onteamscore = ::onteamscore;
	scripts\mp\_utility::registerdogtagsenableddvar(level.gametype,0);
	level._effect["protection_cameraFX"] = loadfx("vfx/iw7/_requests/mp/vfx_adrenaline_drip_heal_scrn.vfx");
}

updategametypedvars() {
	level.dogtagsenabled = scripts\mp\_utility::istrue(scripts\mp\_utility::getwatcheddvar("dogtags"));
	if(level.dogtagsenabled) {
		scripts\mp\gametypes\obj_dogtag::init();
	}
}

onnormaldeath(param_00,param_01,param_02,param_03,param_04) {
	var_05 = level.scoremod["death"] * -1;
	if(var_05 != 0) {
		if(level.teambased) {
			level scripts\mp\_gamescore::giveteamscoreforobjective(param_00.pers["team"],var_05,0);
		}
		else
		{
			param_01 scripts\mp\_gamescore::giveplayerscore("kill",var_05);
		}
	}

	var_06 = level.scoremod["kill"];
	if(param_03 == "MOD_HEAD_SHOT") {
		var_06 = var_06 + level.scoremod["headshot"];
	}

	if(scripts\mp\_utility::istrue(level.supportcranked)) {
		if(scripts\mp\_utility::matchmakinggame() && isdefined(param_01.cranked)) {
			var_06 = var_06 + 1;
			param_01 thread scripts\mp\_rank::scoreeventpopup("teamscore_notify_" + var_06);
		}

		param_01 scripts\mp\_utility::oncranked(param_00,param_01,param_02);
	}

	if(var_06 != 0) {
		if(level.teambased) {
			level scripts\mp\_gamescore::giveteamscoreforobjective(param_01.pers["team"],var_06,0);
		}
		else
		{
			param_01 scripts\mp\_gamescore::giveplayerscore("kill",var_06);
		}
	}

	if(level.dogtagsenabled && scripts\mp\_utility::gameflag("prematch_done")) {
		level thread scripts\mp\gametypes\obj_dogtag::spawndogtags(param_00,param_01,"new_tag_spawned");
	}
}

onsuicidedeath(param_00) {
	if(scripts\mp\_utility::istrue(level.supportcranked)) {
		param_00 scripts\mp\_utility::cleanupcrankedplayertimer();
	}

	if(isdefined(level.scoremod)) {
		var_01 = level.scoremod["death"] * -1;
		if(var_01 != 0) {
			if(level.teambased) {
				level scripts\mp\_gamescore::giveteamscoreforobjective(param_00.pers["team"],var_01,0);
				return;
			}
		}
	}
}

onteamscore(param_00) {
	if(scripts\mp\_utility::istrue(level.supportcranked)) {
		param_00 scripts\mp\_utility::cleanupcrankedplayertimer();
	}
}

dogtagallyonusecb(param_00) {}

dogtagenemyonusecb(param_00) {}

onspawnplayer() {
	if(scripts\mp\_utility::istrue(level.spawnprotectiontimer) && !scripts\mp\_spawnlogic::shoulduseteamstartspawn()) {
		thread managespawnprotection();
	}
}

managespawnprotection() {
	level endon("game_ended");
	self endon("disconnect");
	self endon("remove_spawn_protection");
	thread applyspawnprotection();
	wait(level.spawnprotectiontimer);
	removespawnprotection();
}

applyspawnprotection() {
	level endon("game_ended");
	self endon("disconnect");
	self endon("death");
	self endon("remove_spawn_protection");
	self waittill("spawned_player");
	self setclientomnvar("ui_uplink_carrier_hud",1);
	self.spawnprotection = 1;
	scripts\mp\_lightarmor::setlightarmorvalue(self,1000,undefined,1);
	self setclientomnvar("ui_uplink_carrier_armor",100);
	self setclientomnvar("ui_uplink_carrier_armor_max",100);
}

removespawnprotection() {
	if(isdefined(self)) {
		self setclientomnvar("ui_uplink_carrier_hud",0);
		self.spawnprotection = 0;
	}

	scripts\mp\_lightarmor::lightarmor_unset(self);
	self setclientomnvar("ui_uplink_carrier_armor",-1);
	self notify("remove_spawn_protection");
}