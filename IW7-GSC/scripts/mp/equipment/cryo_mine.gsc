/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: 3555.gsc
 * Game: Call of Duty: Infinite Warfare
 * Platform: PC
 * Function Count: 14
 * Decompile Time: 5 ms
 * Timestamp: 10/27/2023 12:30:41 AM
*******************************************************************/

//Function Number: 1
func_4ADA(param_00)
{
	self endon("disconnect");
	param_00 endon("death");
	scripts\mp\_utility::printgameaction("cryo mine spawn",param_00.triggerportableradarping);
	param_00 thread func_4AD5();
	thread scripts\mp\_weapons::monitordisownedgrenade(self,param_00);
	param_00 waittill("missile_stuck",var_01);
	param_00 give_player_tickets(1);
	if(scripts\mp\_utility::_hasperk("specialty_rugged_eqp"))
	{
		param_00.hasruggedeqp = 1;
	}

	scripts\mp\_weapons::ontacticalequipmentplanted(param_00,"power_cryoMine");
	thread scripts\mp\_weapons::monitordisownedequipment(self,param_00);
	param_00 thread scripts\mp\_weapons::minedamagemonitor();
	param_00.var_ABC6 = func_4AD1(param_00);
	param_00 thread scripts\mp\_weapons::minedeletetrigger(param_00.var_ABC6);
	param_00 thread func_4ACE();
	param_00 missilethermal();
	param_00 missileoutline();
	param_00 scripts\mp\sentientpoolmanager::registersentient("Tactical_Static",param_00.triggerportableradarping);
	param_00 thread scripts\mp\_weapons::makeexplosiveusabletag("tag_use",1);
	param_00 thread func_4AD7();
	param_00 thread func_4AD4();
	param_00 thread scripts\mp\perks\_perk_equipmentping::runequipmentping();
	param_00 setscriptablepartstate("plant","active",0);
	param_00.shouldnotblockspawns = 1;
	thread scripts\mp\_weapons::outlineequipmentforowner(param_00,self);
	param_00 thread scripts\mp\_entityheadicons::setheadicon_factionimage(self,(0,0,20),0.1);
}

//Function Number: 2
func_4ACE()
{
	self endon("mine_triggered");
	self endon("mine_destroyed");
	self endon("mine_selfdestruct");
	self endon("death");
	self.triggerportableradarping endon("disconnect");
	wait(2);
	thread func_4ADC();
}

//Function Number: 3
func_4AD9(param_00)
{
	self endon("mine_destroyed");
	self endon("mine_selfdestruct");
	self endon("death");
	self.triggerportableradarping endon("disconnect");
	self notify("mine_triggered");
	scripts\mp\_utility::printgameaction("cryo mine triggered",self.triggerportableradarping);
	self setscriptablepartstate("plant","neutral",0);
	self setscriptablepartstate("trigger","active",0);
	scripts\mp\_weapons::explosivetrigger(param_00,0.3,"cryoMine");
	thread func_4AD6(self.triggerportableradarping);
}

//Function Number: 4
func_4AD6(param_00)
{
	thread func_4AD2(0.1);
	self setentityowner(param_00);
	self _meth_8593();
	self setscriptablepartstate("plant","neutral",0);
	self setscriptablepartstate("trigger","neutral",0);
	self setscriptablepartstate("explode","active",0);
}

//Function Number: 5
func_4AD3(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = 0;
	}

	thread func_4AD2(param_00 + 0.1);
	wait(param_00);
	self setscriptablepartstate("plant","neutral",0);
	self setscriptablepartstate("trigger","neutral",0);
	self setscriptablepartstate("destroy","active",0);
}

//Function Number: 6
func_4AD2(param_00)
{
	self notify("death");
	level.mines[self getentitynumber()] = undefined;
	self setcandamage(0);
	scripts\mp\_weapons::makeexplosiveunusuabletag();
	self.exploding = 1;
	var_01 = self.triggerportableradarping;
	if(isdefined(self.triggerportableradarping))
	{
		var_01.plantedtacticalequip = scripts\engine\utility::array_remove(var_01.plantedtacticalequip,self);
		var_01 notify("cryo_mine_update",0);
	}

	wait(param_00);
	self delete();
}

//Function Number: 7
func_4AD7()
{
	self endon("death");
	self.triggerportableradarping endon("disconnect");
	level endon("game_ended");
	var_00 = self.triggerportableradarping;
	self waittill("detonateExplosive",var_01);
	if(isdefined(var_01))
	{
		if(var_01 != var_00)
		{
			var_00 thread scripts\mp\_utility::leaderdialogonplayer("mine_destroyed",undefined,undefined,self.origin);
		}

		thread func_4AD6(var_01);
		return;
	}

	thread func_4AD6(var_00);
}

//Function Number: 8
func_4AD4()
{
	self endon("death");
	self.triggerportableradarping endon("disconnect");
	self waittill("emp_damage",var_00,var_01,var_02,var_03,var_04);
	if(scripts\mp\_utility::istrue(scripts\mp\_utility::playersareenemies(self.triggerportableradarping,var_00)))
	{
		var_00 notify("destroyed_equipment");
		var_00 scripts\mp\killstreaks\_killstreaks::_meth_83A0();
		if(isdefined(var_03) && var_03 == "emp_grenade_mp")
		{
			var_00 scripts\mp\_missions::func_D991("ch_tactical_emp_eqp");
		}
	}

	var_05 = "";
	if(scripts\mp\_utility::istrue(self.hasruggedeqp))
	{
		var_05 = "hitequip";
	}

	if(isplayer(var_00))
	{
		var_00 scripts\mp\_damagefeedback::updatedamagefeedback(var_05);
	}

	thread func_4AD3();
}

//Function Number: 9
func_4AD5()
{
	self endon("death");
	self.triggerportableradarping endon("disconnect");
	level scripts\engine\utility::waittill_any_3("game_ended","start_bro_shot");
	thread func_4AD3();
}

//Function Number: 10
func_4ADC()
{
	self endon("mine_triggered");
	self endon("mine_destroyed");
	self endon("mine_selfdestruct");
	self endon("death");
	self.triggerportableradarping endon("disconnect");
	var_00 = self.var_ABC6;
	while(isdefined(var_00))
	{
		var_00 waittill("trigger",var_01);
		if(func_4ADB(var_01))
		{
			thread func_4AD9(var_01);
		}
	}
}

//Function Number: 11
func_4AD1(param_00)
{
	var_01 = spawn("trigger_rotatable_radius",param_00.origin,0,128,100);
	var_01.angles = param_00.angles;
	var_01 enablelinkto();
	var_01 linkto(param_00);
	var_01 hide();
	return var_01;
}

//Function Number: 12
func_4ACF(param_00,param_01)
{
	if(!isplayer(self) || !isdefined(param_00))
	{
		return;
	}

	var_02 = param_00 scripts\mp\_powerloot::func_7FC1("power_cryoMine",4.5);
	if(scripts\mp\_utility::_hasperk("specialty_stun_resistance"))
	{
		scripts\mp\perks\_perkfunctions::applystunresistence(param_00,self);
		var_02 = 0.5;
	}

	if(isdefined(param_01))
	{
		var_02 = var_02 + param_01;
	}

	thread func_4AD8(param_00,var_02);
	scripts\mp\killstreaks\_chill_common::chill(param_00 getentitynumber(),var_02);
	param_00 scripts\mp\_damage::combatrecordtacticalstat("power_cryoMine");
}

//Function Number: 13
func_4ADB(param_00)
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

	if(isplayer(param_00) || isagent(param_00))
	{
		if(scripts\mp\_utility::func_9F72(param_00))
		{
			return 0;
		}

		if(scripts\mp\_utility::func_9F22(param_00))
		{
			var_01 = param_00.triggerportableradarping;
		}

		if(!scripts\mp\_utility::isreallyalive(param_00))
		{
			return 0;
		}

		if(!scripts\mp\_utility::istrue(scripts\mp\_utility::playersareenemies(self.triggerportableradarping,var_01)))
		{
			return 0;
		}

		if(lengthsquared(param_00 getentityvelocity()) < 0.0001)
		{
			return 0;
		}

		var_02 = scripts\common\trace::create_contents(0,1,0,0,1,0,0);
		var_03 = function_0287(self.origin,param_00 geteye(),var_02,self,0,"physicsquery_closest");
		if(isdefined(var_03) && var_03.size > 0)
		{
			var_03 = function_0287(self.origin,param_00.origin,var_02,self,0,"physicsquery_closest");
			if(isdefined(var_03) && var_03.size > 0)
			{
				return 0;
			}
		}

		return 1;
	}

	return 0;
}

//Function Number: 14
func_4AD8(param_00,param_01)
{
	self endon("death");
	self endon("disconnect");
	param_00 endon("disconnect");
	var_02 = param_00 getentitynumber();
	self notify("cryoGrenade_trackDebuff_" + var_02);
	self endon("cryoGrenade_trackDebuff_" + var_02);
	scripts\mp\_weapons::func_F7FC();
	scripts\mp\_gamescore::func_11ACE(param_00,self,"cryo_mine_mp");
	scripts\engine\utility::waittill_any_timeout_1(param_01,"chillEnd");
	scripts\mp\_weapons::func_F800();
	scripts\mp\_gamescore::untrackdebuffassist(param_00,self,"cryo_mine_mp");
}