/****************************
 * Decompiled by Bog
 * Edited by SyndiShanX
 * Script: scripts\3598.gsc
****************************/

func_218F() {}

func_2197() {
	self setscriptablepartstate("armorUp","active",0);
	self setscriptablepartstate("armorUpMaterial","on");
	self.health = self.maxhealth;
	scripts\mp\_heavyarmor::addheavyarmor(getheavyarmorvalue());
	thread func_2196();
	thread func_219C();
	thread func_2199();
	if(!scripts\mp\_utility::isanymlgmatch()) {
		thread scripts\mp\_supers::watchobjuse(75);
	}

	return 1;
}

func_218E(param_00) {
	self notify("armorUp_end");
	self notify("obj_drain_end");
	if(scripts\mp\_utility::istrue(param_00)) {
		self setscriptablepartstate("armorUpMaterial","offImmediate",0);
	}
	else
	{
		self setscriptablepartstate("armorUpMaterial","off",0);
	}

	if(self.loadoutarchetype == "archetype_heavy") {
		self setscriptablepartstate("armorUp","neutral",0);
	}

	if(scripts\mp\_heavyarmor::hasheavyarmor() && !scripts\mp\_utility::istrue(self.heavyarmor.invulnerabilityframe)) {
		scripts\mp\_heavyarmor::removeheavyarmor();
	}
}

func_219C() {
	self endon("disconnect");
	self endon("armorUp_end");
	level waittill("game_ended");
	scripts\mp\_supers::func_DE3B(9999);
}

func_2199() {
	self endon("disconnect");
	self endon("armorUp_end");
	self waittill("heavyArmor_broken");
	scripts\mp\_supers::func_DE3B(9999);
}

func_2196() {
	self endon("disconnect");
	self endon("armorUp_end");
	self.var_219F = [];
	for(;;) {
		self waittill("damage",var_00,var_01);
		if(isdefined(var_01)) {
			self.var_219F[self.var_219F.size] = var_01;
		}
	}
}

func_9FC0() {
	var_00 = scripts\mp\_supers::getcurrentsuperref();
	if(!isdefined(var_00) || var_00 != "super_armorup") {
		return 0;
	}

	return scripts\mp\_supers::issuperinuse();
}

getheavyarmorvalue() {
	var_00 = scripts\engine\utility::ter_op(scripts\mp\_utility::isanymlgmatch(),100,114);
	return scripts\engine\utility::ter_op(scripts\mp\_utility::istrue(level.hardcoremode),76,var_00);
}