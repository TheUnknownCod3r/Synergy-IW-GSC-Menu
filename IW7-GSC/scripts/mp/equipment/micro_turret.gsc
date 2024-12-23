/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: 3568.gsc
 * Game: Call of Duty: Infinite Warfare
 * Platform: PC
 * Function Count: 51
 * Decompile Time: 16 ms
 * Timestamp: 10/27/2023 12:30:44 AM
*******************************************************************/

//Function Number: 1
func_B703()
{
	if(!isdefined(level.microturrets))
	{
		level.microturrets = [];
	}
}

//Function Number: 2
func_B70A()
{
}

//Function Number: 3
func_B718(param_00)
{
	thread func_B6F5();
	if(isdefined(self.var_B710))
	{
		self.var_B710 = undefined;
		func_B6F9(param_00);
	}
}

//Function Number: 4
microturret_use()
{
	scripts\mp\_utility::func_1254();
	self setscriptablepartstate("killstreak","visor_active",0);
	self.var_B710 = 1;
	func_5232();
	thread func_139EE();
	thread func_139EC();
	thread func_139ED();
	thread watcharbitraryup();
}

//Function Number: 5
func_B6F9(param_00)
{
	self notify("microTurret_end");
	if(!scripts\mp\_utility::istrue(param_00))
	{
		scripts\mp\_utility::func_11DB();
	}

	self setscriptablepartstate("killstreak","neutral",0);
	func_5236(param_00);
	var_01 = self.var_B710;
	self.var_B710 = undefined;
	return scripts\mp\_utility::istrue(var_01);
}

//Function Number: 6
func_B711(param_00,param_01,param_02)
{
	level thread scripts\mp\_battlechatter_mp::saytoself(self,"plr_perk_turret",undefined,0.75);
	self notify("microTurret_spawned");
	if(!isdefined(self.microturrets))
	{
		self.microturrets = [];
	}

	if(self.microturrets.size >= microturret_getmaxnum())
	{
		self.microturrets[0] thread func_B6F6();
	}

	var_03 = spawnturret("misc_turret",param_00,"micro_turret_gun_mp");
	var_03 setmodel("micro_turret_wm");
	var_03.angles = param_01;
	var_03.triggerportableradarping = self;
	var_03.team = self.team;
	var_03.weapon_name = "micro_turret_mp";
	var_03 playsound("mp_super_miniturret_plant");
	var_03 thread microturret_beepsounds();
	var_03 getvalidattachments();
	var_03 makeunusable();
	if(level.teambased)
	{
		var_03 setturretteam(self.team);
	}

	var_03.var_1A4A = scripts\engine\utility::spawn_tag_origin(var_03.origin,var_03.angles);
	var_03.var_1A4A linkto(var_03,"tag_origin",(0,0,0),(0,0,0));
	microturret_addtoarrays(var_03,self);
	var_03 thread func_B71E();
	var_03 thread func_B71C();
	var_03 setdefaultdroppitch(0);
	var_03 give_player_session_tokens("sentry_offline");
	var_03 setsentryowner(self);
	var_03 setleftarc(180);
	var_03 setrightarc(180);
	var_03 settoparc(90);
	var_03 give_crafted_gascan(45);
	var_03 setotherent(self);
	var_03 give_player_tickets(1);
	var_04 = scripts\mp\_utility::_hasperk("specialty_rugged_eqp");
	var_05 = scripts\engine\utility::ter_op(var_04,209,119);
	var_06 = scripts\engine\utility::ter_op(var_04,"hitequip","");
	var_03 thread scripts\mp\_damage::monitordamage(var_05,var_06,::func_B6FF,::func_B6FE,0,0);
	var_03.killcament = func_B6F3(var_03);
	if(isdefined(param_02))
	{
		var_03 scripts\mp\_weapons::explosivehandlemovers(param_02);
	}

	var_03.stunned = 0;
	var_03 thread scripts\mp\perks\_perk_equipmentping::runequipmentping();
	thread scripts\mp\_weapons::outlinesuperequipment(var_03,self);
	var_03 thread func_B6EA();
	thread func_B71D();
	self.var_B710 = undefined;
	scripts\mp\_supers::func_DE3B(9999000);
	scripts\mp\_utility::printgameaction("microturret placed",self);
}

//Function Number: 7
microturret_beepsounds()
{
	self endon("death");
	level endon("game_ended");
	for(;;)
	{
		wait(3);
		if(!isdefined(self.carriedby))
		{
			self playsound("mp_super_miniturret_beep");
		}
	}
}

//Function Number: 8
func_B6F6()
{
	thread func_B700();
}

//Function Number: 9
func_B6F5()
{
	self notify("microTurret_destroyAll");
	if(isdefined(self.microturrets))
	{
		foreach(var_01 in self.microturrets)
		{
			var_01 func_B6F6();
		}
	}

	self.microturrets = undefined;
}

//Function Number: 10
func_B70B()
{
	self setscriptablepartstate("effects","activeArmed",0);
	self setturretminimapvisible(1,"micro_turret");
	self setdefaultdroppitch(0);
	self give_player_session_tokens("manual_target");
	func_B70F();
	self.planted = 1;
	if(!issentient(self))
	{
		scripts\mp\sentientpoolmanager::registersentient("Killstreak_Ground",self.triggerportableradarping);
	}
}

//Function Number: 11
func_B70C()
{
	self setturretminimapvisible(0);
	self laseroff();
	self setdefaultdroppitch(45);
	self give_player_session_tokens("sentry_offline");
	func_B6F2();
	scripts\mp\sentientpoolmanager::unregistersentient(self.sentientpool,self.sentientpoolindex);
	func_B6F1();
}

//Function Number: 12
func_B70F()
{
	if(!isdefined(self.triggerportableradarping))
	{
		return;
	}

	var_00 = self.triggerportableradarping;
	var_01 = var_00.team;
	if(level.teambased && !scripts\mp\_utility::istrue(self.var_115D1))
	{
		scripts\mp\_entityheadicons::setteamheadicon(var_01,(0,0,50));
		self.var_115D1 = 1;
		return;
	}

	if(!scripts\mp\_utility::istrue(self.var_D3AA))
	{
		scripts\mp\_entityheadicons::setplayerheadicon(var_00,(0,0,50));
		self.var_D3AA = 1;
	}
}

//Function Number: 13
func_B6F2()
{
	if(scripts\mp\_utility::istrue(self.var_115D1))
	{
		scripts\mp\_entityheadicons::setteamheadicon("none",(0,0,0));
		self.var_115D1 = undefined;
	}

	if(scripts\mp\_utility::istrue(self.var_D3AA))
	{
		scripts\mp\_entityheadicons::setplayerheadicon(undefined,(0,0,0));
		self.var_D3AA = undefined;
	}
}

//Function Number: 14
func_B71C()
{
	self endon("death");
	level endon("game_ended");
	for(;;)
	{
		self waittill("emp_damage",var_00,var_01,var_02,var_03,var_04);
		var_05 = 119;
		if(self.triggerportableradarping scripts\mp\_utility::_hasperk("specialty_rugged_eqp"))
		{
			var_05 = 209;
		}

		var_06 = int(ceil(var_05 / 1));
		if(isdefined(var_03) && var_03 == "kineticpulse_emp_mp")
		{
			var_06 = int(ceil(var_05 / 1));
		}

		var_02 = scripts\engine\utility::ter_op(isdefined(var_02),var_02,self.origin);
		var_03 = scripts\engine\utility::ter_op(isdefined(var_03),var_03,"emp_grenade_mp");
		var_04 = scripts\engine\utility::ter_op(isdefined(var_04),var_04,"MOD_EXPLOSIVE");
		thread func_B6F8(var_01);
		self dodamage(var_06,var_02,var_00,undefined,var_04,var_03);
	}
}

//Function Number: 15
func_B6F8(param_00)
{
	self endon("death");
	if(isdefined(self.var_11198) && self.var_11198 < gettime() + param_00 * 1000)
	{
		return;
	}

	self.stunned = 1;
	self.var_11198 = gettime() + param_00 * 1000;
	self notify("stunned");
	self endon("stunned");
	wait(param_00);
	self.stunned = 0;
	self.var_11198 = undefined;
}

//Function Number: 16
func_B6EA()
{
	self endon("death");
	level endon("game_ended");
	self.var_1E2D = 34;
	wait(1);
	for(;;)
	{
		func_B70B();
		if(!self.stunned && !func_B701())
		{
			func_B717();
		}

		func_B712();
		if(!self.stunned && func_B701())
		{
			func_B6EB();
		}

		if(self.stunned)
		{
			func_B713();
		}

		scripts\engine\utility::waitframe();
	}
}

//Function Number: 17
func_B717()
{
	self endon("stunned");
	self give_player_session_tokens("manual");
	self laseroff();
	if(func_B701())
	{
		func_B6F1();
	}

	thread func_B709();
	for(;;)
	{
		var_00 = anglestoforward(self gettagangles("tag_flash"));
		var_01 = [];
		var_02 = gettime();
		foreach(var_04 in level.var_69D6)
		{
			if(var_04.throwtime + 1500 > var_02)
			{
				var_01[var_01.size] = var_04;
			}
		}

		var_06 = scripts\engine\utility::array_combine(level.characters,var_01,level.spidergrenade.activeagents,level.spidergrenade.proxies);
		var_07 = [];
		var_08 = [];
		foreach(var_0A in var_06)
		{
			if(!func_B71A(var_0A))
			{
				continue;
			}

			var_0B = var_0A.origin - self gettagorigin("tag_dummy");
			var_0C = vectornormalize(var_0B);
			var_0D = vectordot(var_0B,var_0C);
			var_0E = scripts\engine\utility::anglebetweenvectorsunit(var_00,var_0C);
			var_0F = 1 - var_0D / 800;
			var_10 = 1 - var_0E / 180;
			var_11 = var_0F * 0.5 + var_10 * 0.8;
			var_07[var_07.size] = var_0A;
			var_08[var_08.size] = var_11;
		}

		for(;;)
		{
			var_13 = 0;
			for(var_14 = 0;var_14 < var_07.size - 1;var_14++)
			{
				var_15 = var_07[var_14];
				var_16 = var_08[var_14];
				if(var_16 < var_08[var_14])
				{
					var_07[var_14] = var_07[var_14 + 1];
					var_08[var_14] = var_08[var_14 + 1];
					var_07[var_14 + 1] = var_15;
					var_08[var_14 + 1] = var_16;
					var_13 = 1;
				}
			}

			if(!var_13)
			{
				break;
			}
		}

		for(var_14 = 0;var_14 < var_07.size;var_14++)
		{
			var_17 = var_07[var_14];
			var_18 = func_B714(var_17);
			if(isdefined(var_18))
			{
				func_B70D(var_17,var_18);
				return;
			}
		}

		wait(0.1);
	}
}

//Function Number: 18
func_B6EB()
{
	self endon("stunned");
	self endon("lostTarget");
	self give_player_session_tokens("manual");
	self laseron();
	thread func_B721();
	func_B704();
	func_B6EC();
}

//Function Number: 19
func_B6EC()
{
	var_00 = function_0240("micro_turret_gun_mp");
	if(isdefined(self.var_1A4A) && isplayer(self.var_1A4A))
	{
		level thread scripts\mp\_battlechatter_mp::saytoself(self.var_1A4A,"plr_killstreak_target");
	}

	for(;;)
	{
		if(func_B701())
		{
			var_01 = self _meth_8161(0);
			if(!isdefined(self.var_1A4A))
			{
				self settargetentity(self.var_1A4A);
			}

			if(func_B715() && isdefined(self _meth_8161(1)))
			{
				self shootturret();
				self.var_1E2D--;
				if(self.var_1E2D <= 0)
				{
					func_B6F6();
				}
			}

			wait(var_00);
			continue;
		}

		scripts\engine\utility::waitframe();
	}
}

//Function Number: 20
func_B713()
{
	self setscriptablepartstate("effects","activeStunned",0);
	func_B70C();
}

//Function Number: 21
func_B721()
{
	self endon("death");
	self endon("stunned");
	level endon("game_ended");
	func_B722();
	func_B6F1();
	self notify("lostTarget");
}

//Function Number: 22
func_B722()
{
	var_00 = func_B6FD();
	var_00 endon("death");
	var_00 endon("disconnect");
	var_01 = undefined;
	var_02 = func_B6FD();
	while(isdefined(var_02) && var_02 == var_00)
	{
		var_02 = func_B6FD();
		if(!isdefined(var_02) || var_02 != var_00)
		{
			break;
		}

		if(var_02 scripts\mp\_utility::_hasperk("specialty_blindeye"))
		{
			break;
		}

		if(isdefined(var_01) && gettime() > var_01)
		{
			break;
		}

		if(scripts/mp/equipment/phase_shift::isentityphaseshifted(var_02))
		{
			if(!isdefined(var_01))
			{
				var_01 = gettime() + 500;
			}

			wait(0.1);
			continue;
		}

		var_03 = func_B714(var_02);
		if(!isdefined(var_03))
		{
			if(!isdefined(var_01))
			{
				var_01 = gettime() + 500;
			}

			wait(0.1);
			continue;
		}

		func_B70D(var_02,var_03);
		var_01 = undefined;
		wait(0.1);
	}
}

//Function Number: 23
func_B704()
{
	var_00 = func_B6FD();
	if(isplayer(var_00) || isagent(var_00))
	{
		thread func_B705(var_00);
	}

	wait(0.65);
	self notify("lockOnEnded");
}

//Function Number: 24
func_B705(param_00)
{
	self endon("death");
	self endon("lockOnEnded");
	param_00 endon("death");
	param_00 endon("disconnect");
	var_01 = 0;
	var_02 = 0.2;
	for(;;)
	{
		param_00 playlocalsound("mp_super_miniturret_lockon");
		wait(var_02);
		var_01 = var_01 + var_02;
	}
}

//Function Number: 25
func_B6FE(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = param_03;
	var_05 = scripts\mp\_damage::handlemeleedamage(param_01,param_02,var_05);
	var_05 = scripts\mp\_damage::handleapdamage(param_01,param_02,var_05);
	var_05 = microturret_handlesuperandexplosivedamage(param_01,param_02,var_05);
	var_05 = scripts\mp\_supers::modifysuperequipmentdamage(param_00,param_01,param_02,var_05,param_04);
	return var_05;
}

//Function Number: 26
func_B6FF(param_00,param_01,param_02,param_03)
{
	if(scripts\mp\_utility::istrue(scripts\mp\_utility::playersareenemies(self.triggerportableradarping,param_00)))
	{
		if(param_00 scripts\mp\_missions::func_66B8("specialty_blindeye"))
		{
			param_00 scripts\mp\_missions::func_D991("ch_perk_kills_blindeye");
		}

		param_00 scripts\mp\_missions::func_D991("ch_killjoy_six_ability");
		param_00 thread scripts\mp\_events::supershutdown(self.triggerportableradarping);
		param_00 notify("destroyed_equipment");
	}

	thread func_B700();
}

//Function Number: 27
func_B700()
{
	self notify("death");
	self.var_1A4A delete();
	microturret_removefromarrays(self,self.triggerportableradarping);
	func_B70C();
	self setscriptablepartstate("effects","activeDestroyed");
	wait(3);
	scripts\mp\_weapons::equipmentdeletevfx(self.origin,self.angles);
	scripts\mp\_utility::printgameaction("microturret destroyed",self.triggerportableradarping);
	self delete();
}

//Function Number: 28
func_139EE()
{
	self endon("disconnect");
	self endon("microTurret_spawned");
	self endon("microTurret_end");
	for(;;)
	{
		self waittill("equip_deploy_succeeded",var_00,var_01,var_02,var_03);
		if(var_00 == "deploy_microturret_mp")
		{
			thread func_B711(var_01,var_02,var_03);
		}
	}
}

//Function Number: 29
func_139EC()
{
	self endon("disconnect");
	self endon("microTurret_spawned");
	self endon("microTurret_end");
	for(;;)
	{
		self waittill("equip_deploy_failed",var_00,var_01,var_02,var_03);
		if(var_00 == "deploy_microturret_mp")
		{
			self setweaponammoclip("deploy_microturret_mp",100);
		}
	}
}

//Function Number: 30
func_139ED()
{
	self endon("disconnect");
	self endon("microTurret_spawned");
	self endon("microTurret_end");
	level waittill("game_ended");
	scripts\mp\_supers::func_DE3B(9999000);
}

//Function Number: 31
watcharbitraryup()
{
	self endon("disconnect");
	self endon("microTurret_spawned");
	self endon("microTurret_end");
	scripts\engine\utility::waitframe();
	while(!scripts\mp\_utility::isinarbitraryup())
	{
		scripts\engine\utility::waitframe();
	}

	scripts\mp\_supers::superdisabledinarbitraryupmessage();
	scripts\mp\_supers::func_DE3B(9999000);
}

//Function Number: 32
func_5232()
{
	self.var_B6FB = 1;
	scripts\engine\utility::allow_usability(0);
	scripts\mp\_powers::func_D729();
	scripts\mp\_utility::func_1C47(0);
}

//Function Number: 33
func_5236(param_00)
{
	if(!scripts\mp\_utility::istrue(param_00))
	{
		if(scripts\mp\_utility::istrue(self.var_B6FB))
		{
			scripts\engine\utility::allow_usability(1);
			scripts\mp\_powers::func_D72F();
			scripts\mp\_utility::func_1C47(1);
		}
	}

	self.var_B6FB = undefined;
}

//Function Number: 34
func_B71E()
{
	self endon("death");
	self.triggerportableradarping waittill("disconnect");
	thread func_B6F6();
}

//Function Number: 35
func_B71D()
{
	self endon("disconnect");
	self endon("microTurret_destroyAll");
	self notify("microTurret_watchForGameEnd");
	self endon("microTurret_watchForGameEnd");
	level scripts\engine\utility::waittill_any_3("game_ended","bro_shot_start");
	thread func_B6F5();
}

//Function Number: 36
microturret_addtoarrays(param_00,param_01)
{
	param_01.microturrets[param_01.microturrets.size] = param_00;
	level.microturrets[param_00 getentitynumber()] = param_00;
}

//Function Number: 37
microturret_removefromarrays(param_00,param_01)
{
	if(isdefined(param_01) && isdefined(param_01.microturrets))
	{
		param_01.microturrets = scripts\engine\utility::array_remove(param_01.microturrets,param_00);
	}

	level.microturrets[param_00 getentitynumber()] = undefined;
}

//Function Number: 38
func_B6F3(param_00)
{
	var_01 = param_00 gettagorigin("tag_laser");
	var_02 = spawn("script_model",param_00.origin + anglestoup(param_00.angles) * 30);
	var_02 setmodel("tag_origin");
	var_02 setscriptmoverkillcam("explosive");
	var_02 linkto(param_00);
	var_02 thread func_B6F0(param_00);
	return var_02;
}

//Function Number: 39
func_B6F0(param_00)
{
	self endon("death");
	param_00 waittill("death");
	wait(10);
	self delete();
}

//Function Number: 40
func_B714(param_00)
{
	var_01 = undefined;
	var_02 = physics_createcontents(["physicscontents_solid","physicscontents_vehicle","physicscontents_glass","physicscontents_ainosight","physicscontents_sky"]);
	var_03 = self gettagorigin("tag_dummy");
	if(isplayer(param_00) || isagent(param_00) && !scripts\mp\_utility::func_9F72(param_00))
	{
		var_04 = "j_spine4";
		var_05 = param_00 gettagorigin(var_04);
		if(!isdefined(var_01) && !scripts\mp\_utility::func_C7A0(var_03,var_05))
		{
			var_06 = function_0287(var_03,var_05,var_02,self,0,"physicsquery_closest");
			var_07 = !isdefined(var_06) || var_06.size == 0;
			var_01 = scripts\engine\utility::ter_op(var_07,var_04,var_01);
		}

		if(!isdefined(var_01))
		{
			var_04 = "tag_eye";
			var_05 = param_00 gettagorigin(var_04);
			if(!isdefined(var_01) && !scripts\mp\_utility::func_C7A0(var_03,var_05))
			{
				var_06 = function_0287(var_03,var_05,var_02,self,0,"physicsquery_closest");
				var_07 = !isdefined(var_06) || var_06.size == 0;
				var_01 = scripts\engine\utility::ter_op(var_07,var_04,var_01);
			}
		}

		if(!isdefined(var_01))
		{
			var_05 = param_00.origin;
			if(!isdefined(var_01) && !scripts\mp\_utility::func_C7A0(var_03,var_05))
			{
				var_06 = function_0287(var_03,var_05,var_02,self,0,"physicsquery_closest");
				var_07 = !isdefined(var_06) || var_06.size == 0;
				var_01 = scripts\engine\utility::ter_op(var_07,var_04,var_01);
			}
		}
	}
	else
	{
		var_04 = "tag_origin";
		var_05 = var_01 gettagorigin(var_05);
		if(!isdefined(var_01) && !scripts\mp\_utility::func_C7A0(var_03,var_05))
		{
			var_06 = function_0287(var_03,var_05,var_02,self,0,"physicsquery_closest");
			var_07 = !isdefined(var_06) || var_06.size == 0;
			var_01 = scripts\engine\utility::ter_op(var_07,var_04,var_01);
		}
	}

	return var_01;
}

//Function Number: 41
func_B70D(param_00,param_01)
{
	if(!isdefined(self.var_1A4A))
	{
		return 0;
	}

	self.var_1A4A.var_23EA = param_00;
	self.var_1A4A.var_23EB = param_01;
	self.var_1A4A linkto(param_00,param_01,(0,0,0),(0,0,0));
	self settargetentity(self.var_1A4A);
}

//Function Number: 42
func_B6F1()
{
	if(isdefined(self.var_1A4A))
	{
		self.var_1A4A linkto(self,"tag_origin",(0,0,0),(0,0,0));
		self.var_1A4A.var_23EA = undefined;
		self.var_1A4A.var_23EB = undefined;
	}

	self cleartargetentity();
}

//Function Number: 43
func_B701()
{
	return isdefined(self.var_1A4A) && isdefined(self.var_1A4A.var_23EA);
}

//Function Number: 44
func_B6FD()
{
	if(func_B701())
	{
		return self.var_1A4A.var_23EA;
	}

	return undefined;
}

//Function Number: 45
func_B715()
{
	return isdefined(self.var_1A4A) && isdefined(self.var_1A4A.var_23EB);
}

//Function Number: 46
func_B71A(param_00)
{
	var_01 = param_00;
	if(!isdefined(param_00))
	{
		return 0;
	}

	if(scripts/mp/equipment/phase_shift::isentityphaseshifted(param_00))
	{
		return 0;
	}

	if(param_00 scripts\mp\_utility::_hasperk("specialty_blindeye") && !scripts\mp\_utility::func_9F72(param_00))
	{
		return 0;
	}

	if(isplayer(param_00) || isagent(param_00))
	{
		if(!scripts\mp\_utility::isreallyalive(param_00))
		{
			return 0;
		}

		if(scripts\mp\_utility::func_9F22(param_00))
		{
			var_01 = param_00.triggerportableradarping;
		}

		if(scripts\mp\_utility::func_9F72(param_00))
		{
			var_01 = param_00.triggerportableradarping;
		}
	}
	else
	{
		var_01 = param_00.triggerportableradarping;
	}

	if(!scripts\mp\_utility::istrue(scripts\mp\_utility::playersareenemies(self.triggerportableradarping,var_01)))
	{
		return 0;
	}

	if(distancesquared(param_00.origin,self.origin) > 640000)
	{
		return 0;
	}

	return 1;
}

//Function Number: 47
func_B709()
{
	self endon("death");
	self endon("microTurret_stopIdleMovements");
	self settargetentity(self.var_1A4A);
	self.var_1A4A unlink();
	for(;;)
	{
		self.var_1A4A.origin = (randomintrange(-100,100),randomintrange(-100,100),50) + self.origin;
		self playsound("mp_super_miniturret_servos");
		wait(randomfloatrange(0.75,1.25));
	}
}

//Function Number: 48
func_B712()
{
	self notify("microTurret_stopIdleMovements");
}

//Function Number: 49
microturret_getmaxnum()
{
	var_00 = 1;
	if(scripts\mp\_utility::_hasperk("specialty_rugged_eqp"))
	{
		var_00++;
	}

	return var_00;
}

//Function Number: 50
microturret_onruggedequipmentunset()
{
	self endon("disconnect");
	if(!isdefined(self.microturrets) || self.microturrets.size <= 0)
	{
		return;
	}

	if(!scripts\mp\_utility::isreallyalive(self))
	{
		self waittill("giveLoadout");
		if(!isdefined(self.microturrets) || self.microturrets.size <= 0)
		{
			return;
		}
	}

	var_00 = microturret_getmaxnum();
	var_01 = max(0,self.microturrets.size - var_00);
	for(var_02 = 0;var_02 < var_01;var_02++)
	{
		self.microturrets[0] thread func_B6F6();
	}
}

//Function Number: 51
microturret_handlesuperandexplosivedamage(param_00,param_01,param_02)
{
	var_03 = 1;
	var_04 = getweaponbasename(param_00);
	if(isdefined(var_04))
	{
		param_00 = var_04;
	}

	switch(param_00)
	{
		case "micro_turret_gun_mp":
			var_03 = 5;
			break;

		case "iw7_penetrationrail_mp":
			var_03 = 2.3;
			break;

		case "iw7_atomizer_mp":
			var_03 = 1.5;
			break;
	}

	if(function_0107(param_01) && var_03 < 1.5)
	{
		var_03 = 1.5;
	}

	return int(ceil(var_03 * param_02));
}