/***********************************************
 * Decompiled by Bog
 * Edited by SyndiShanX
 * Script: scripts\scripts\anim\weaponlist.gsc
***********************************************/

usingautomaticweapon() {
	return function_0245(self.var_394) || function_02BE(self.var_394) || function_023C(self.var_394) > 0;
}

usingsemiautoweapon() {
	return function_0248(self.var_394);
}

autoshootanimrate() {
	if(usingautomaticweapon()) {
		return 0.1 \ function_0240(self.var_394);
	}

	return 0.5;
}

burstshootanimrate() {
	if(usingautomaticweapon()) {
		return 0.1 \ function_0240(self.var_394);
	}

	return 0.2;
}

waitaftershot() {
	return 0.25;
}

shootanimtime(param_00) {
	if(!usingautomaticweapon() || isdefined(param_00) && param_00 == 1) {
		var_01 = 0.5 + randomfloat(1);
		return function_0240(self.var_394) * var_01;
	}

	return function_0240(self.var_394);
}

refillclip() {
	if(self.var_394 == "none") {
		self.bulletsinclip = 0;
		return 0;
	}

	if(!isdefined(self.bulletsinclip)) {
		self.bulletsinclip = weaponclipsize(self.var_394);
	}
	else
	{
		self.bulletsinclip = weaponclipsize(self.var_394);
	}

	if(self.bulletsinclip <= 0) {
		return 0;
	}

	return 1;
}

add_weapon(param_00,param_01,param_02,param_03,param_04) {
	if(!isdefined(param_02)) {
		param_02 = 3;
	}

	if(!isdefined(param_03)) {
		param_02 = 1;
	}

	if(!isdefined(param_04)) {
		param_04 = "rifle";
	}

	param_00 = tolower(param_00);
	level.aiweapon[param_00]["type"] = param_01;
	level.aiweapon[param_00]["time"] = param_02;
	level.aiweapon[param_00]["clipsize"] = param_03;
	level.aiweapon[param_00]["anims"] = param_04;
}

addturret(param_00) {
	level.aiweapon[tolower(param_00)]["type"] = "turret";
}