/**************************************************
 * Decompiled by Bog
 * Edited by SyndiShanX
 * Script: scripts\scripts\mp\intelchallenges.gsc
**************************************************/

func_DEF9() {
	level.var_9979 = [];
	func_DEF8("ch_intel_kills",::func_999E);
	func_DEF8("ch_intel_super_kills",::func_99D6);
	func_DEF8("ch_intel_killjoys",::func_999D);
	func_DEF8("ch_intel_score",::func_99C9);
	func_DEF8("ch_intel_scorestreaks",::func_99CD);
	func_DEF8("ch_intel_kills_or_assists",::func_999F);
	func_DEF8("ch_intel_headshots",::func_9992);
	func_DEF8("ch_intel_double_kills",::func_9981);
	func_DEF8("ch_intel_triple_kills",::func_99E2);
	func_DEF8("ch_intel_kills_this_life",::func_99A0);
	func_DEF8("ch_intel_close_range_kills",::func_997A);
	func_DEF8("ch_intel_ballistic_kills",::func_9971);
	func_DEF8("ch_intel_energy_kills",::func_9983);
	func_DEF8("ch_intel_secondary_kills",::func_99CE);
	func_DEF8("ch_intel_hipfire_kills",::func_9993);
	func_DEF8("ch_intel_buzzkill",::func_9973);
	func_DEF8("ch_intel_medals",::func_99B3);
	func_DEF8("ch_intel_multiple_weapon_kills",::func_99BE);
	func_DEF8("ch_intel_attachment_0",::intelattachmentcount0kills);
	func_DEF8("ch_intel_medal_savior",::func_99C8);
	func_DEF8("ch_intel_medal_avenger",::func_996E);
	func_DEF8("ch_intel_objective_attack",::func_99C1);
	func_DEF8("ch_intel_objective_defend",::func_99C3);
	func_DEF8("ch_intel_objective_capture",::func_99C2);
	func_DEF8("ch_intel_ground_pound_rushdown_kills",::func_998F);
	func_DEF8("ch_intel_lethal_kills",::func_99A2);
	func_DEF8("ch_intel_popcorn",::func_99C6);
	func_DEF8("ch_intel_stick",::func_99D5);
	func_DEF8("ch_intel_aerial_support",::func_9965);
	func_DEF8("ch_intel_scorestreak_assists",::func_99CA);
	func_DEF8("ch_intel_scorestreak_kills",::func_99CC);
	func_DEF8("ch_intel_tactical_assists",::func_99D8);
	func_DEF8("ch_intel_ss_drone_kills",::func_99D3);
	func_DEF8("ch_intel_ss_remote_kills",::func_99D4);
	func_DEF8("ch_intel_attachment_4plus",::intelattachmentcount4pluskills);
	func_DEF8("ch_intel_medal_jumpshot",::func_99AD);
	func_DEF8("ch_intel_medal_grounded",::func_99AC);
	func_DEF8("ch_intel_medal_smackdown",::func_99B4);
	func_DEF8("ch_intel_medal_wallbuster",::func_99B6);
	func_DEF8("ch_intel_medal_kingslayer",::func_99AE);
	func_DEF8("ch_intel_medal_nosebreaker",::func_99B2);
	func_DEF8("ch_intel_medal_low_blow",::func_99B0);
	func_DEF8("ch_intel_medal_long_shot",::func_99AF);
	func_DEF8("ch_intel_afterlife_kills",::func_9966);
	func_DEF8("ch_intel_backstab_kills",::func_9970);
	func_DEF8("ch_intel_crouch_kills",::func_997B);
	func_DEF8("ch_intel_medal_fixated",::func_99A9);
	func_DEF8("ch_intel_perch_active_camo_kills",::func_99C5);
	func_DEF8("ch_intel_multikills",::func_99BD);
	func_DEF8("ch_intel_medal_backfire",::func_99A6);
	func_DEF8("ch_intel_ace",::func_99A4);
	func_DEF8("ch_intel_multiple_weapon_one_life",::func_99BF);
	func_DEF8("ch_intel_ftl_jump_rewind",::func_998A);
	func_DEF8("ch_intel_assault_kills",::func_996C);
	func_DEF8("ch_intel_assault_super_kills",::func_996D);
	func_DEF8("ch_intel_guard_kills",::func_9990);
	func_DEF8("ch_intel_guard_super_kills",::func_9991);
	func_DEF8("ch_intel_agent_kills",::func_9967);
	func_DEF8("ch_intel_agent_super_kills",::func_9968);
	func_DEF8("ch_intel_ftl_kills",::func_998B);
	func_DEF8("ch_intel_ftl_super_kills",::func_998C);
	func_DEF8("ch_intel_engineer_kills",::func_9984);
	func_DEF8("ch_intel_engineer_super_kills",::func_9985);
	func_DEF8("ch_intel_ghost_kills",::func_998D);
	func_DEF8("ch_intel_ghost_super_kills",::func_998E);
	func_DEF8("ch_intel_weapon_assault_kills",::func_996B);
	func_DEF8("ch_intel_weapon_lmg_kills",::func_99A3);
	func_DEF8("ch_intel_weapon_shotgun_kills",::func_99CF);
	func_DEF8("ch_intel_weapon_smg_kills",::func_99D0);
	func_DEF8("ch_intel_weapon_sniper_kills",::func_99D1);
	func_DEF8("ch_intel_finish",::func_9988);
	func_DEF8("ch_intel_survive",::func_99D7);
	func_DEF8("ch_intel_medal_fury",::func_99AB);
	func_DEF8("ch_intel_medal_frenzy",::func_99AA);
	func_DEF8("ch_intel_medal_super",::func_99B5);
	func_DEF8("ch_intel_medal_merciless",::func_99B1);
	func_DEF8("ch_intel_injured_kills",::func_9995);
	func_DEF8("ch_intel_wallrun_time",::func_99E3);
	func_DEF8("ch_intel_scorestreak_destroy",::func_99CB);
	func_DEF8("ch_intel_destroy_equipment",::func_9980);
	func_DEF8("ch_intel_medal_collateral",::func_99A8);
	func_DEF8("ch_intel_air_sniper_kills",::func_99A5);
}

func_DEF8(param_00,param_01) {
	level.var_9979[param_00] = param_01;
}

updatecurrentobjective(param_00) {
	if(!isdefined(param_00)) {
		param_00 = 1;
	}

	var_01 = self.var_9978;
	var_02 = var_01.var_118A7[var_01.var_4C0D]["target"];
	var_03 = param_00;
	var_04 = var_02 - var_01.progress;
	param_00 = min(param_00,var_04);
	var_05 = var_03 - param_00;
	var_01.progress = var_01.progress + param_00;
	setmatchdata("players",self.clientid,"missionTeam_challengeProgress",var_01.progress);
	if(var_01.progress >= var_02) {
		scripts\mp\intel::func_F75C();
	}

	scripts\mp\intel::func_12EB7(var_01.progress);
	if(var_05 > 0 && !scripts\mp\intel::func_9E94()) {
		updatecurrentobjective(var_05);
	}
}

func_F80D(param_00) {
	if(!isdefined(param_00)) {
		return;
	}

	if(scripts\mp\intel::func_9E94()) {
		return;
	}

	var_01 = self.var_9978;
	var_01.progress = param_00;
	var_02 = var_01.var_118A7[var_01.var_4C0D]["target"];
	setmatchdata("players",self.clientid,"missionTeam_challengeProgress",param_00);
	while(var_01.progress >= var_02) {
		scripts\mp\intel::func_F75C();
		if(scripts\mp\intel::func_9E94()) {
			break;
		}

		var_02 = var_01.var_118A7[var_01.var_4C0D]["target"];
	}

	scripts\mp\intel::func_12EB7(var_01.progress);
}

func_9988(param_00) {
	self endon("disconnect");
	level waittill("game_ended");
	scripts\mp\intel::func_F75C();
}

func_9992(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("kill_event_buffered",var_01,var_02,var_03,var_04);
		if(scripts\mp\utility::istrue(var_04["headshot"])) {
			updatecurrentobjective();
		}
	}
}

func_999E(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("kill_event_buffered",var_01,var_02);
		updatecurrentobjective();
	}
}

func_99C9(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("earned_score_buffered",var_01);
		var_02 = self.pers["gamemodeScore"];
		if(isdefined(var_02) && var_02 > 0) {
			var_01 = var_02 - self.var_9978.progress;
		}

		updatecurrentobjective(var_01);
	}
}

func_99CD(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("earned_killstreak_buffered");
		updatecurrentobjective();
	}
}

func_99B3(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("earned_award_buffered");
		updatecurrentobjective();
	}
}

func_999F(param_00) {
	self endon("disconnect");
	self endon("killsOrAssistsChallengeFinished");
	thread func_A67D();
	thread func_A67C();
}

func_A67D() {
	self endon("disconnect");
	self endon("killsOrAssistsChallengeFinished");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("kill_event_buffered",var_00,var_01,var_02,var_03);
		updatecurrentobjective();
	}

	self notify("killsOrAssistsChallengeFinished");
}

func_A67C() {
	self endon("disconnect");
	self endon("killsOrAssistsChallengeFinished");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("assist_buffered",var_00);
		updatecurrentobjective();
	}

	self notify("killsOrAssistsChallengeFinished");
}

func_999D(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("earned_award_buffered",var_01);
		var_02 = level.awards[var_01].category;
		if(var_02 == "supershutdown" || var_02 == "streak_shutdown") {
			updatecurrentobjective();
		}
	}
}

func_9981(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("update_rapid_kill_buffered",var_01);
		if(var_01 % 2 == 0) {
			updatecurrentobjective();
		}
	}
}

func_99E2(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("update_rapid_kill_buffered",var_01);
		if(var_01 % 3 == 0) {
			updatecurrentobjective();
		}
	}
}

func_99D6(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("super_kill_buffered");
		updatecurrentobjective();
	}
}

func_99A0(param_00) {}

func_997A(param_00) {}

func_9971(param_00) {}

func_9983(param_00) {}

func_99CE(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("kill_event_buffered",var_01,var_02,var_03,var_04);
		var_05 = scripts\mp\utility::getweaponrootname(var_02) == "iw7_axe";
		var_02 = scripts\mp\utility::func_13CA1(var_02);
		if(scripts\mp\utility::iscacsecondaryweapon(var_02)) {
			if(var_03 == "MOD_MELEE" || var_05) {
				continue;
			}

			updatecurrentobjective();
		}
	}
}

func_9993(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("kill_event_buffered",var_01,var_02,var_03,var_04);
		if(scripts\mp\utility::istrue(var_04["hipfire"])) {
			updatecurrentobjective();
		}
	}
}

func_9973(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("kill_event_buffered",var_01,var_02,var_03,var_04);
		if(scripts\mp\utility::istrue(var_04["buzzkill"])) {
			updatecurrentobjective();
		}
	}
}

func_99D7(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("damage");
		waittillframeend;
		if(self.health > 0 && self.health < self.maxhealth * 0.25) {
			thread func_99BC();
		}
	}
}

func_99BC() {
	self endon("disconnect");
	self endon("death");
	self notify("monitorSurviveHealth");
	self endon("monitorSurviveHealth");
	self waittill("healed");
	updatecurrentobjective();
}

func_9995(param_00) {}

func_99BE(param_00) {}

intelattachmentcount0kills(param_00) {
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("kill_event_buffered",var_01,var_02);
		if(isdefined(var_02)) {
			if(!scripts\mp\utility::iscacprimaryweapon(var_02) && !scripts\mp\utility::iscacsecondaryweapon(var_02)) {
				continue;
			}

			intelattachmentcountchallenge(var_02,0,0);
		}
	}
}

intelattachmentcount4pluskills(param_00) {
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("kill_event_buffered",var_01,var_02);
		if(isdefined(var_02)) {
			if(!scripts\mp\utility::iscacprimaryweapon(var_02) && !scripts\mp\utility::iscacsecondaryweapon(var_02)) {
				continue;
			}

			intelattachmentcountchallenge(var_02,3,1);
		}
	}
}

func_99E3(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		if(self gold_teeth_hint_func()) {
			var_01 = gettime();
			while(self gold_teeth_hint_func()) {
				wait(0.1);
			}

			var_02 = gettime() - var_01;
			var_02 = var_02 / 1000;
			if(!isdefined(self.var_138D5)) {
				self.var_138D5 = var_02;
			}
			else
			{
				self.var_138D5 = self.var_138D5 + var_02;
			}

			updatecurrentobjective(var_02);
		}

		wait(0.05);
	}
}

func_996C(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_9969("archetype_assault");
	}
}

func_996D(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_996A("archetype_assault");
	}
}

func_9990(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_9969("archetype_heavy");
	}
}

func_9991(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_996A("archetype_heavy");
	}
}

func_9967(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_9969("archetype_scout");
	}
}

func_9968(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_996A("archetype_scout");
	}
}

func_99A3(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_99E4("weapon_lmg");
	}
}

func_99C8(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_99A7("save_teammate");
	}
}

func_996E(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_99A7("avenger");
	}
}

func_99C1(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("earned_award_buffered",var_01);
		if(var_01 == "mode_x_assault" || var_01 == "mode_sd_defuse_save" || var_01 == "mode_uplink_kill_with_ball" || var_01 == "mode_ctf_kill_with_flag") {
			updatecurrentobjective();
		}
	}
}

func_99C3(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("earned_award_buffered",var_01);
		if(var_01 == "mode_x_defend" || var_01 == "mode_sd_plant_save" || var_01 == "mode_uplink_kill_carrier" || var_01 == "mode_ctf_kill_carrier") {
			updatecurrentobjective();
		}
	}
}

func_99C2(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		thread func_99C0("earned_award_buffered");
		thread func_99C0("bomb_planted");
		self waittill("update_objective_capture",var_01);
		if(isdefined(var_01)) {
			if(var_01 == "mode_dom_secure_b" || var_01 == "mode_dom_secure_neutral" || var_01 == "mode_dom_secure" || var_01 == "mode_hp_secure" || var_01 == "mode_sd_last_defuse" || var_01 == "mode_sd_defuse" || var_01 == "mode_uplink_dunk" || var_01 == "mode_uplink_fieldgoal" || var_01 == "mode_ctf_cap" || var_01 == "mode_siege_secure") {
				updatecurrentobjective();
			}

			continue;
		}

		updatecurrentobjective();
	}
}

func_99C0(param_00) {
	self waittill(param_00,var_01);
	self notify("update_objective_capture",var_01);
}

func_998F(param_00) {}

func_99CF(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_99E4("weapon_shotgun");
	}
}

func_99A2(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("kill_event_buffered",var_01,var_02,var_03,var_04);
		var_05 = scripts\mp\utility::getequipmenttype(var_02);
		if(isdefined(var_05) && var_05 == "lethal") {
			updatecurrentobjective();
		}
	}
}

func_99C6(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_99A7("grenade_double");
	}
}

func_99D5(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("grenade_stuck_enemy");
		updatecurrentobjective();
	}
}

func_9965(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("killstreak_used",var_01);
		var_02 = 0;
		switch(var_01) {
			case "jammer":
			case "jackal":
			case "directional_uav":
			case "counter_uav":
			case "uav":
			case "bombardment":
			case "precision_airstrike":
			case "thor":
			case "minijackal":
			case "drone_hive":
				var_02 = 1;
				break;
		}

		if(var_02) {
			updatecurrentobjective();
		}
	}
}

func_99CA(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("update_uav_assist_buffered");
		updatecurrentobjective();
	}
}

func_99CB(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("earned_award_buffered",var_01);
		var_02 = level.awards[var_01].category;
		if(var_02 == "streak_shutdown") {
			updatecurrentobjective();
		}
	}
}

func_99CC(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("kill_event_buffered",var_01,var_02);
		if(scripts\mp\utility::iskillstreakweapon(var_02)) {
			updatecurrentobjective();
		}
	}
}

func_9980(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("destroyed_equipment");
		updatecurrentobjective();
	}
}

func_99D8(param_00) {}

func_99D3(param_00) {}

func_99D4(param_00) {}

func_9984(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_9969("archetype_engineer");
	}
}

func_9985(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_996A("archetype_engineer");
	}
}

func_996B(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_99E4("weapon_assault");
	}
}

func_99AD(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("kill_event_buffered",var_01,var_02,var_03,var_04);
		if(scripts\mp\utility::istrue(var_04["airborne"])) {
			updatecurrentobjective();
		}
	}
}

func_99AC(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_99A7("kill_jumper");
	}
}

func_99B4(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_99A7("wallrun_kill");
	}
}

func_99B6(param_00) {}

func_99AE(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_99A7("first_place_kill");
	}
}

func_99B2(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("kill_event_buffered",var_01,var_02,var_03,var_04);
		if(var_03 == "MOD_MELEE") {
			updatecurrentobjective();
		}
	}
}

func_99B0(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_99A7("slide_kill");
	}
}

func_99AF(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_99A7("longshot");
	}
}

func_9966(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("kill_event_buffered",var_01,var_02,var_03,var_04);
		if(scripts\mp\utility::istrue(var_04["posthumous"])) {
			updatecurrentobjective();
		}
	}
}

func_9970(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("kill_event_buffered",var_01,var_02,var_03,var_04);
		if(scripts\mp\utility::istrue(var_04["backstab"]) && var_03 == "MOD_MELEE") {
			updatecurrentobjective();
		}
	}
}

func_997B(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("kill_event_buffered",var_01,var_02,var_03,var_04);
		if(scripts\mp\utility::istrue(var_04["crouch_kill"])) {
			updatecurrentobjective();
		}
	}
}

func_99A9(param_00) {}

func_99C5(param_00) {}

func_998D(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_9969("archetype_sniper");
	}
}

func_998E(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_996A("archetype_sniper");
	}
}

func_99D1(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_99E4("weapon_sniper");
	}
}

func_99AB(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("update_rapid_kill_buffered",var_01);
		if(var_01 % 4 == 0) {
			updatecurrentobjective();
		}
	}
}

func_99AA(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("update_rapid_kill_buffered",var_01);
		if(var_01 % 5 == 0) {
			updatecurrentobjective();
		}
	}
}

func_99B5(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("update_rapid_kill_buffered",var_01);
		if(var_01 % 6 == 0) {
			updatecurrentobjective();
		}
	}
}

func_99BD(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("update_rapid_kill_buffered",var_01);
		if(var_01) {
			func_F80D(var_01);
			thread func_99BB();
			thread func_99B9();
		}
	}
}

func_99BB() {
	self endon("disconnect");
	self endon("intel_max_tier_complete");
	self notify("intelMonitorMultikills");
	self endon("intelMonitorMultikills");
	while(self.var_DDC2 != 0) {
		wait(0.1);
	}

	func_F80D(0);
}

func_99A6(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_99A7("backfire");
	}
}

func_99A8(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_99A7("one_shot_two_kills");
	}
}

func_99B1(param_00) {}

func_99A5(param_00) {}

func_99A4(param_00) {}

func_99BF(param_00) {}

func_998A(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		self waittill("super_kill_buffered");
		if(scripts\mp\supers::getcurrentsuperref() == "super_teleport" || scripts\mp\supers::getcurrentsuperref() == "super_rewind") {
			updatecurrentobjective();
		}
	}
}

func_998B(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_9969("archetype_assassin");
	}
}

func_998C(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_996A("archetype_assassin");
	}
}

func_99D0(param_00) {
	self endon("disconnect");
	while(!scripts\mp\intel::func_9E94()) {
		func_99E4("weapon_smg");
	}
}

func_99BA(param_00,param_01,param_02,param_03,param_04) {
	self endon("disconnect");
	if(isdefined(self.var_9978)) {
		if(!scripts\mp\intel::func_9E94()) {
			switch(self.var_9978.ref) {
				case "ch_intel_air_sniper_kills":
					if(!self isonground() && isdefined(param_02) && scripts\mp\utility::getweapongroup(param_02) == "weapon_sniper") {
						updatecurrentobjective();
					}
					break;

				case "ch_intel_medal_merciless":
					if(isdefined(self.killsthislife) && self.killsthislife.size % 10 == 0) {
						updatecurrentobjective();
					}
					break;

				case "ch_intel_ace":
					var_05 = 0;
					if(level.teambased) {
						var_05 = scripts\mp\utility::getteamarray(scripts\mp\utility::getotherteam(self.team)).size;
					}
					else
					{
						var_05 = level.players.size - 1;
					}
	
					if(isdefined(self.var_A653) && var_05 >= 4) {
						var_06 = combinepartialprogressandvalidateplayers(self.var_A653);
						if(var_06.size == var_05) {
							var_07 = self.var_9978.progress;
							foreach(var_09 in var_06) {
								if(var_09 <= var_07) {
									return;
								}
							}
	
							updatecurrentobjective();
						}
					}
					break;

				case "ch_intel_injured_kills":
					if(self.health > 0 && self.health < self.maxhealth * 0.9) {
						updatecurrentobjective();
					}
					break;

				case "ch_intel_kills_this_life":
					if(isdefined(self.killsthislife)) {
						var_0B = self.pers["cur_kill_streak"];
						func_F80D(var_0B);
						thread func_99B9();
					}
					break;

				case "ch_intel_multiple_weapon_kills":
					var_07 = self.var_9978.progress;
					if(isdefined(self.killsperweapon)) {
						var_0C = combinealtweaponarray(self.killsperweapon);
						var_0D = combinepartialprogress(var_0C);
						if(var_0D.size > var_07) {
							updatecurrentobjective();
						}
					}
					break;

				case "ch_intel_multiple_weapon_one_life":
					if(isdefined(self.killsthislifeperweapon)) {
						var_0E = combinealtweaponarray(self.killsthislifeperweapon);
						var_0D = combinepartialprogress(var_0E);
						thread func_99B9();
						func_F80D(var_0D.size);
					}
					break;

				case "ch_intel_ballistic_kills":
					if(((isdefined(param_02) && scripts\mp\utility::iscacprimaryweapon(param_02)) || scripts\mp\utility::iscacsecondaryweapon(param_02)) && !function_02D4(param_02)) {
						if(param_03 == "MOD_MELEE") {
							var_0F = scripts\mp\utility::getweaponrootname(param_02);
							if(var_0F == "iw7_devastator") {
								var_10 = function_02C4(param_02);
								if(isdefined(var_10) && var_10 == 4 || var_10 == 36) {
									updatecurrentobjective();
								}
							}
						}
						else if(function_0107(param_03)) {
							var_0F = scripts\mp\utility::getweaponrootname(param_02);
							if(var_0F == "iw7_kbs") {
								var_10 = function_02C4(param_02);
								if(isdefined(var_10) && var_10 == 6 || var_10 == 38) {
									updatecurrentobjective();
								}
							}
						}
						else if(scripts\engine\utility::isbulletdamage(param_03)) {
							updatecurrentobjective();
						}
					}
					break;

				case "ch_intel_energy_kills":
					if(((isdefined(param_02) && scripts\mp\utility::iscacprimaryweapon(param_02)) || scripts\mp\utility::iscacsecondaryweapon(param_02)) && function_02D4(param_02)) {
						if(param_03 == "MOD_MELEE") {
							var_0F = scripts\mp\utility::getweaponrootname(param_02);
							if(var_0F == "iw7_rvn") {
								if(self _meth_8519(param_02)) {
									updatecurrentobjective();
								}
							}
						}
						else if(function_0107(param_03)) {
							var_0F = scripts\mp\utility::getweaponrootname(param_02);
							if(var_0F == "iw7_rvn") {
								var_10 = function_02C4(param_02);
								if(isdefined(var_10) && var_10 == 3 || var_10 == 35) {
									if(self _meth_8519(param_02)) {
										updatecurrentobjective();
									}
								}
							}
						}
						else if(scripts\engine\utility::isbulletdamage(param_03)) {
							updatecurrentobjective();
						}
					}
					break;

				case "ch_intel_ground_pound_rushdown_kills":
					if(isdefined(param_02) && param_02 == "groundpound_mp" || param_02 == "thruster_mp") {
						updatecurrentobjective();
					}
					break;

				case "ch_intel_ss_drone_kills":
					if(!isdefined(param_02) || !scripts\mp\utility::iskillstreakweapon(param_02)) {
						return;
					}
	
					var_11 = scripts\mp\missions::func_7F48(param_02);
					switch(var_11) {
						case "ball_drone_backup":
						case "jackal":
						case "sentry_shock":
							updatecurrentobjective();
							break;
	
						case "remote_c8":
							if(isdefined(self.var_4BE1) && self.var_4BE1 != "MANUAL") {
								updatecurrentobjective();
							}
							break;
					}
					break;

				case "ch_intel_ss_remote_kills":
					if(!isdefined(param_02) || !scripts\mp\utility::iskillstreakweapon(param_02)) {
						return;
					}
	
					var_11 = scripts\mp\missions::func_7F48(param_02);
					switch(var_11) {
						case "venom":
						case "thor":
						case "minijackal":
						case "drone_hive":
							updatecurrentobjective();
							break;
	
						case "remote_c8":
							if(isdefined(self.var_4BE1) && self.var_4BE1 == "MANUAL") {
								updatecurrentobjective();
							}
							break;
					}
					break;

				case "ch_intel_perch_active_camo_kills":
					if((isdefined(self.trait) && self.trait == "specialty_wall_lock" && scripts\mp\utility::istrue(self.var_9FF6)) || scripts\mp\supers::issuperinuse() && scripts\mp\supers::getcurrentsuperref() == "super_invisible") {
						updatecurrentobjective();
					}
					break;

				case "ch_intel_medal_fixated":
					var_05 = 0;
					if(level.teambased) {
						var_05 = scripts\mp\utility::getteamarray(scripts\mp\utility::getotherteam(self.team)).size;
					}
					else
					{
						var_05 = level.players.size - 1;
					}
	
					if(isdefined(self.var_A653)) {
						var_06 = combinepartialprogressandvalidateplayers(self.var_A653);
						var_07 = self.var_9978.progress;
						var_12 = 0;
						foreach(var_09 in var_06) {
							if(var_09 > var_07) {
								var_12 = 1;
								break;
							}
						}
	
						if(var_12) {
							updatecurrentobjective();
						}
					}
					break;

				case "ch_intel_close_range_kills":
					if(param_01 == self) {
						var_15 = distancesquared(self.origin,param_00.origin);
						if(param_03 == "MOD_MELEE" || var_15 < 24336) {
							updatecurrentobjective();
						}
					}
					break;

				case "ch_intel_medal_wallbuster":
					if(isdefined(param_00.var_AA43) && gettime() - param_00.var_AA43 < 1000) {
						updatecurrentobjective();
					}
					break;
			}
		}
	}
}

func_99B8(param_00) {
	self endon("disconnect");
	var_01 = param_00.attackerdata[self.guid];
	if(isdefined(self.var_9978)) {
		if(!scripts\mp\intel::func_9E94()) {
			if(self.var_9978.ref == "ch_intel_tactical_assists") {
				if(isdefined(var_01) && scripts\mp\utility::istrue(var_01.diddamagewithtacticalequipment)) {
					updatecurrentobjective();
					return;
				}

				return;
			}
		}
	}
}

func_99B9() {
	self endon("disconnect");
	self endon("intel_max_tier_complete");
	self notify("intelMonitorDeathResetProgress");
	self endon("intelMonitorDeathResetProgress");
	self waittill("death");
	func_F80D(0);
	self.pers["intelPartialProgress"] = undefined;
}

func_99A7(param_00) {
	self waittill("earned_award_buffered",var_01);
	if(var_01 == param_00) {
		updatecurrentobjective();
	}
}

func_9969(param_00) {
	self waittill("kill_event_buffered",var_01,var_02);
	if(!scripts\mp\utility::iskillstreakweapon(var_02) && scripts\mp\utility::func_9D48(param_00)) {
		updatecurrentobjective();
	}
}

func_996A(param_00) {
	self waittill("super_kill_buffered");
	if(scripts\mp\utility::func_9D48(param_00)) {
		updatecurrentobjective();
	}
}

func_99E4(param_00) {
	self waittill("kill_event_buffered",var_01,var_02,var_03);
	var_02 = scripts\mp\utility::func_13CA1(var_02);
	if(!scripts\mp\utility::iskillstreakweapon(var_02) && scripts\mp\utility::getweapongroup(var_02) == param_00) {
		if(var_03 != "MOD_MELEE") {
			updatecurrentobjective();
		}
	}
}

intelattachmentcountchallenge(param_00,param_01,param_02) {
	var_03 = scripts\mp\utility::getweaponrootname(param_00);
	var_04 = 0;
	foreach(var_06 in function_00E3(param_00)) {
		var_07 = scripts\mp\utility::attachmentmap_tobase(var_06);
		if(scripts\mp\weapons::func_9F3C(var_03,var_07)) {
			var_04++;
		}
	}

	if(param_02 < 0) {
		if(var_04 < param_01) {
			updatecurrentobjective();
			return;
		}

		return;
	}

	if(param_02 > 0) {
		if(var_04 > param_01) {
			updatecurrentobjective();
			return;
		}

		return;
	}

	if(var_04 == param_01) {
		updatecurrentobjective();
		return;
	}
}

combinealtweaponarray(param_00) {
	var_01 = [];
	foreach(var_05, var_03 in param_00) {
		var_04 = var_05;
		if(scripts\mp\utility::isstrstart(var_05,"alt_")) {
			var_04 = getsubstr(var_05,4,var_05.size);
		}

		if(!isdefined(var_01[var_04])) {
			var_01[var_04] = var_03;
			continue;
		}

		var_01[var_04] = var_01[var_04] + var_03;
	}

	return var_01;
}

combinepartialprogress(param_00) {
	if(!isdefined(self.pers["intelPartialProgress"])) {
		self.pers["intelPartialProgress"] = [];
	}

	self.pers["intelPartialProgress"][level.currentround] = param_00;
	var_01 = [];
	var_02 = self.pers["intelPartialProgress"];
	foreach(var_04 in var_02) {
		foreach(var_07, var_06 in var_04) {
			if(!isdefined(var_01[var_07])) {
				var_01[var_07] = var_06;
				continue;
			}

			var_01[var_07] = var_01[var_07] + var_06;
		}
	}

	return var_01;
}

combinepartialprogressandvalidateplayers(param_00) {
	var_01 = combinepartialprogress(param_00);
	var_02 = [];
	foreach(var_08, var_04 in var_01) {
		foreach(var_06 in level.players) {
			if(var_06.guid == var_08) {
				var_02[var_08] = var_04;
				break;
			}
		}
	}

	return var_02;
}