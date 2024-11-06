/****************************
 * Decompiled by Bog
 * Edited by SyndiShanX
 * Script: scripts\2587.gsc
****************************/

func_2980(param_00,param_01) {
	self._blackboard.var_1FC7[param_00] = param_01;
}

func_2927(param_00) {
	if(isdefined(self._blackboard.var_1FC7) && isdefined(self._blackboard.var_1FC7[param_00])) {
		return self._blackboard.var_1FC7[param_00];
	}

	return undefined;
}

func_2928(param_00) {
	var_01 = func_2927(param_00);
	if(isdefined(var_01) && var_01.size > 0) {
		return var_01 + "_";
	}

	return undefined;
}

bb_wantstostrafe() {
	if(isdefined(self._blackboard.meleerequested) && self._blackboard.meleerequested) {
		return 1;
	}

	if(isdefined(self._blackboard.bwantstostrafe)) {
		return self._blackboard.bwantstostrafe;
	}

	return 0;
}

func_9DA4(param_00,param_01,param_02,param_03) {
	return self.a.pose == param_03;
}

bb_requestsmartobject(param_00) {
	self._blackboard.var_527D = param_00;
}

func_292C() {
	return self._blackboard.var_527D;
}

func_2949(param_00,param_01,param_02,param_03) {
	return self._blackboard.var_527D == param_03;
}

bb_setisincombat(param_00) {
	self._blackboard.var_2B11 = !isdefined(param_00) || param_00;
}

bb_isincombat() {
	if(isdefined(self._blackboard.var_2B11)) {
		return self._blackboard.var_2B11;
	}

	return 0;
}

bb_isweaponclass(param_00,param_01,param_02,param_03) {
	return scripts\engine\utility::weaponclass(self.var_394) == param_03;
}

bb_shoulddroprocketlauncher(param_00,param_01,param_02,param_03) {
	if(scripts\engine\utility::weaponclass(self.var_394) != "rocketlauncher") {
		return 0;
	}

	var_04 = bb_getrequestedweapon();
	if(!isdefined(var_04)) {
		return 0;
	}

	return var_04 != "rocketlauncher";
}

bb_requestmove() {}

bb_clearmoverequest() {}

bb_moverequested() {
	return self codemoverequested();
}

func_2958(param_00,param_01,param_02,param_03) {
	return !self codemoverequested();
}

bb_movetyperequested(param_00) {
	return self._blackboard.movetype == param_00;
}

bb_requestmovetype(param_00) {
	self._blackboard.movetype = param_00;
	if(param_00 == "cqb") {
		self.asm.var_13CAF = 0;
	}
}

bb_requestweapon(param_00) {
	self._blackboard.weaponrequest = param_00;
}

bb_clearweaponrequest() {
	self._blackboard.weaponrequest = undefined;
}

bb_getrequestedweapon() {
	return self._blackboard.weaponrequest;
}

bb_requestreload(param_00) {
	if(!isdefined(param_00)) {
		self._blackboard.breload = 1;
		return;
	}

	self._blackboard.breload = param_00;
}

bb_reloadrequested() {
	if(isdefined(self._blackboard.breload)) {
		return self._blackboard.breload;
	}

	return 0;
}

bb_requestthrowgrenade(param_00,param_01) {
	if(!isdefined(param_00)) {
		self._blackboard.bthrowgrenade = 1;
	}
	else
	{
		self._blackboard.bthrowgrenade = param_00;
	}

	if(self._blackboard.bthrowgrenade) {
		self._blackboard.throwgrenadetarget = param_01;
		return;
	}

	self._blackboard.throwgrenadetarget = undefined;
}

bb_throwgrenaderequested() {
	if(isdefined(self._blackboard.bthrowgrenade)) {
		return self._blackboard.bthrowgrenade && isdefined(self._blackboard.throwgrenadetarget);
	}

	return 0;
}

bb_getthrowgrenadetarget() {
	return self._blackboard.throwgrenadetarget;
}

bb_requestfire(param_00,param_01) {
	if(!isdefined(param_00)) {
		self._blackboard.bfire = 1;
	}
	else
	{
		self._blackboard.bfire = param_00;
	}

	if(self._blackboard.bfire) {
		self._blackboard.var_1182F = param_01;
		return;
	}

	self._blackboard.var_1182F = undefined;
}

func_298B() {
	if(isdefined(self._blackboard.bfire)) {
		return self._blackboard.bfire && isdefined(self._blackboard.var_1182F);
	}

	return 0;
}

func_2931() {
	return self._blackboard.var_1182F;
}

bb_requestfire(param_00) {
	if(!isdefined(param_00)) {
		self._blackboard.var_2AA6 = 1;
		return;
	}

	self._blackboard.var_2AA6 = param_00;
}

func_291C() {
	if(isdefined(self._blackboard.var_2AA6)) {
		return self._blackboard.var_2AA6;
	}

	return 0;
}

bb_setshootparams(param_00,param_01) {
	self._blackboard.shootparams = param_00;
	if(isdefined(param_00)) {
		self._blackboard.shootparams.target = param_01;
		if(isdefined(param_01)) {
			self._blackboard.shootparams.var_3137 = 1;
			return;
		}

		self._blackboard.shootparams.var_3137 = undefined;
	}
}

func_2985() {
	if(isdefined(self._blackboard.shootparams)) {
		if(isdefined(self.var_FED1) && isdefined(self._blackboard.shootparams.pos)) {
			return 1;
		}

		if(isdefined(self.dontevershoot) && self.dontevershoot) {
			return 0;
		}

		if(isdefined(self._blackboard.shootparams.target) && isdefined(self.isnodeoccupied) && self.isnodeoccupied == self._blackboard.shootparams.target) {
			return scripts\engine\utility::func_9DA3();
		}
	}

	return 0;
}

func_2961(param_00) {
	self._blackboard.coverstate = param_00;
}

bb_getrequestedcoverstate() {
	if(!isdefined(self._blackboard.coverstate)) {
		return "none";
	}

	return self._blackboard.coverstate;
}

func_2948(param_00,param_01,param_02,param_03) {
	return bb_getrequestedcoverstate() == param_03;
}

func_2944(param_00,param_01,param_02,param_03) {
	return bb_getrequestedcoverstate() != param_03;
}

func_295E(param_00) {
	self._blackboard.var_4720 = param_00;
}

func_2929() {
	return self._blackboard.var_4720;
}

func_2947(param_00,param_01,param_02,param_03) {
	return isdefined(self._blackboard.var_4720) && self._blackboard.var_4720 == param_03;
}

func_2946(param_00,param_01,param_02,param_03) {
	return bb_getrequestedcoverstate() == "exposed" && func_2947(param_00,param_01,param_02,param_03);
}

func_2943(param_00,param_01,param_02,param_03) {
	return bb_getrequestedcoverstate() != "exposed" || !func_2947(param_00,param_01,param_02,param_03);
}

func_295D(param_00) {
	self._blackboard.var_2996 = param_00;
}

func_291A() {
	return isdefined(self._blackboard.var_2996) && self._blackboard.var_2996;
}

bb_setcovernode(param_00) {
	self._blackboard.covernode = param_00;
	self._blackboard.bhascovernode = isdefined(param_00);
}

func_2932() {
	return isdefined(self._blackboard.bhascovernode) && self._blackboard.bhascovernode;
}

bb_getcovernode() {
	return self._blackboard.covernode;
}

bb_getrequestedturret() {
	if(isdefined(self._blackboard.requestedturret)) {
		return self._blackboard.requestedturret;
	}

	return undefined;
}

func_296E(param_00) {
	self._blackboard.requestedturret = param_00;
}

func_296F(param_00) {
	self._blackboard.var_E1AF = param_00;
}

bb_hasshufflenode(param_00,param_01,param_02,param_03) {
	return isdefined(self._blackboard.shufflenode) && isdefined(self.target_getindexoftarget) && self._blackboard.shufflenode == self.target_getindexoftarget && distancesquared(self.target_getindexoftarget.origin,self.origin) > 16;
}

func_2936(param_00,param_01,param_02,param_03) {
	if(!isdefined(self._blackboard.shufflenode)) {
		return 0;
	}

	if(!isdefined(self.target_getindexoftarget)) {
		return 0;
	}

	if(self._blackboard.shufflenode != self.target_getindexoftarget) {
		return 0;
	}

	if(distancesquared(self.target_getindexoftarget.origin,self.origin) <= 16) {
		return 0;
	}

	if(self._blackboard.shufflenode.type != param_03) {
		return 0;
	}

	return 1;
}

func_9F53(param_00,param_01) {
	var_02 = vectornormalize(param_00.origin - self.origin);
	var_03 = anglestoforward(param_00.angles);
	var_04 = vectorcross(var_03,var_02);
	if(var_04[2] > 0 && param_01 == "left") {
		return 1;
	}

	if(var_04[2] < 0 && param_01 == "right") {
		return 1;
	}

	return 0;
}

func_2935(param_00,param_01,param_02,param_03) {
	if(!bb_hasshufflenode(param_00,param_01,param_02,param_03)) {
		return 0;
	}

	return func_9F53(self._blackboard.shufflenode,param_03);
}

func_2933(param_00,param_01,param_02,param_03) {
	if(!bb_hasshufflenode(param_00,param_01,param_02,param_03)) {
		return 0;
	}

	if(!func_9F53(self._blackboard.shufflenode,param_03)) {
		return 0;
	}

	if(param_03 == "right") {
		return self._blackboard.var_1016B.type == "Cover Right" && self._blackboard.shufflenode.type == "Cover Left";
	}

	return self._blackboard.var_1016B.type == "Cover Left" && self._blackboard.shufflenode.type == "Cover Right";
}

bb_setanimscripted() {
	self._blackboard.animscriptedactive = 1;
}

bb_clearanimscripted() {
	self._blackboard.animscriptedactive = 0;
}

bb_isanimscripted() {
	if(!isdefined(self.script)) {
		return 0;
	}

	return self.script == "scripted" || self.script == "<custom>" || scripts\engine\utility::istrue(self._blackboard.animscriptedactive);
}

bb_requestmelee(param_00) {
	self._blackboard.meleerequested = 1;
	self._blackboard.meleerequestedtarget = param_00;
	self._blackboard.meleerequestedcomplete = 0;
}

bb_getmeleetarget() {
	if(!isdefined(self._blackboard.meleerequested)) {
		return undefined;
	}

	return self._blackboard.meleerequestedtarget;
}

bb_clearmeleerequest() {
	self._blackboard.meleerequested = undefined;
	self._blackboard.meleerequestedtarget = undefined;
}

bb_clearmeleerequestcomplete() {
	self._blackboard.meleerequestedcomplete = undefined;
}

bb_meleeinprogress(param_00,param_01,param_02,param_03) {
	return isdefined(self._blackboard.meleerequestedcomplete);
}

bb_meleecomplete(param_00,param_01,param_02,param_03) {
	return isdefined(self._blackboard.meleerequestedcomplete) && self._blackboard.meleerequestedcomplete;
}

bb_meleerequested(param_00,param_01,param_02,param_03) {
	return isdefined(self._blackboard.meleerequested) && self._blackboard.meleerequested;
}

bb_meleerequestinvalid(param_00,param_01,param_02,param_03) {
	if(!isdefined(self.melee)) {
		return 1;
	}

	if(!isdefined(self.melee.target)) {
		return 1;
	}

	return 0;
}

bb_requestmeleecharge(param_00,param_01) {
	self._blackboard.meleerequestedcharge = 1;
	self._blackboard.meleerequestedcharge_target = param_00;
	self._blackboard.meleerequestedcharge_targetposition = param_01;
}

bb_clearmeleechargerequest() {
	self._blackboard.meleerequestedcharge = undefined;
	self._blackboard.meleerequestedcharge_target = undefined;
	self._blackboard.meleerequestedcharge_targetposition = undefined;
}

bb_meleechargerequested(param_00,param_01,param_02,param_03) {
	return isdefined(self._blackboard.meleerequestedcharge) && self._blackboard.meleerequestedcharge && isdefined(self.vehicle_getspawnerarray);
}

func_2957(param_00,param_01,param_02,param_03) {
	return !bb_meleechargerequested(param_00,param_01,param_02,param_03);
}

bb_meleechargeaborted(param_00,param_01,param_02,param_03) {
	if(bb_meleechargerequested(param_00,param_01,param_02,param_03)) {
		return 0;
	}

	return 1;
}

func_2923() {
	if(!isdefined(self._blackboard.meleerequestedcharge)) {
		return undefined;
	}

	return self._blackboard.meleerequestedcharge_target;
}

func_2924() {
	return self._blackboard.meleerequestedcharge_targetposition;
}

func_2964(param_00) {
	self._blackboard.var_2AB0 = param_00;
}

func_293D(param_00,param_01,param_02,param_03) {
	return isdefined(self._blackboard.var_2AB0) && self._blackboard.var_2AB0;
}

func_2963(param_00) {
	self._blackboard.var_2AAF = param_00;
}

func_293C() {
	return isdefined(self._blackboard.var_2AAF) && self._blackboard.var_2AAF;
}

bb_requestwhizby(param_00) {
	self._blackboard.whizbyevent = param_00;
}

bb_iswhizbyrequested() {
	return isdefined(self._blackboard.whizbyevent);
}

bb_getrequestedwhizby() {
	return self._blackboard.whizbyevent;
}

bb_isfrantic() {
	var_00 = bb_getcovernode();
	if(!isdefined(var_00)) {
		var_00 = self.target_getindexoftarget;
	}

	var_01 = isdefined(var_00) && var_00.type == "Conceal Crouch" || var_00.type == "Conceal Stand";
	return self._blackboard.movetype == "frantic" && !var_01;
}

bb_ismissingaleg() {
	var_00 = bb_getmissingleg();
	if(isdefined(var_00)) {
		return 1;
	}

	return 0;
}

bb_getmissingleg() {
	var_00 = 0;
	var_01 = undefined;
	if(!isdefined(self._blackboard.dismemberedparts)) {
		return var_01;
	}

	if(isdefined(self._blackboard.dismemberedparts["left_leg"])) {
		var_00++;
		var_01 = "left";
	}

	if(isdefined(self._blackboard.dismemberedparts["right_leg"])) {
		var_00++;
		var_01 = "right";
	}

	if(var_00 == 2) {
		var_01 = "both";
	}

	return var_01;
}

ispartdismembered(param_00) {
	if(!isdefined(self._blackboard)) {
		return 0;
	}

	if(isdefined(self._blackboard.scriptableparts)) {
		if(!isdefined(self._blackboard.scriptableparts[param_00])) {
			return 0;
		}

		return self._blackboard.scriptableparts[param_00].state == "dismember";
	}

	if(!isdefined(self._blackboard.dismemberedparts)) {
		return 0;
	}

	return isdefined(self._blackboard.dismemberedparts[param_00]);
}

bb_ispartdismembered(param_00,param_01,param_02,param_03) {
	return ispartdismembered(param_03);
}

waspartjustdismembered(param_00) {
	if(isdefined(self._blackboard.scriptableparts)) {
		if(!isdefined(self._blackboard.scriptableparts[param_00])) {
			return 0;
		}

		if(self._blackboard.scriptableparts[param_00].state != "dismember") {
			return 0;
		}

		return self._blackboard.scriptableparts[param_00].time == gettime();
	}

	if(!isdefined(self._blackboard.dismemberedparts)) {
		return 0;
	}

	if(!isdefined(self._blackboard.dismemberedparts[param_00])) {
		return 0;
	}

	return self._blackboard.dismemberedparts[param_00] == gettime();
}

func_298F(param_00,param_01,param_02,param_03) {
	return waspartjustdismembered(param_03);
}

bb_werepartsdismemberedinorder(param_00,param_01,param_02,param_03) {
	return ispartdismembered(param_03[0]) && waspartjustdismembered(param_03[1]);
}

bb_dismemberedpart(param_00) {
	self._blackboard.dismemberedparts[param_00] = gettime();
}

bb_setselfdestruct(param_00) {
	self._blackboard.selfdestruct = param_00;
}

bb_isselfdestruct() {
	if(!isdefined(self._blackboard.selfdestruct)) {
		if(isdefined(self.bt.forceselfdestructtimer) && gettime() > self.bt.forceselfdestructtimer) {
			self._blackboard.selfdestruct = 1;
		}
	}

	return isdefined(self._blackboard.selfdestruct);
}

func_2972() {
	self._blackboard.selfdestructnow = 1;
}

bb_selfdestructnow() {
	return isdefined(self._blackboard.selfdestructnow);
}

bb_setheadless(param_00) {
	self._blackboard.isheadless = param_00;
}

bb_isheadless() {
	if(isdefined(self.bt.crawlmeleegrab)) {
		return 0;
	}

	return isdefined(self._blackboard.isheadless);
}

bb_setcanrodeo(param_00,param_01) {
	if(!isdefined(param_01)) {
		param_01 = 1;
	}

	var_02 = "left";
	if(param_00 == var_02) {
		var_02 = "right";
	}

	if(isdefined(self._blackboard.rodeo) && isdefined(self._blackboard.rodeo[var_02])) {
		self._blackboard.rodeo[var_02] = 0;
		self._blackboard.rodeo[param_00] = 0;
		return;
	}

	self._blackboard.rodeo[param_00] = param_01;
}

bb_canrodeo(param_00) {
	if(!isdefined(self._blackboard.rodeo)) {
		return 0;
	}

	if(!isdefined(self._blackboard.rodeo[param_00])) {
		return 0;
	}

	if(!self._blackboard.rodeo[param_00]) {
		return 0;
	}

	return 1;
}

bb_setrodeorequest(param_00) {
	self._blackboard.rodeorequested = param_00;
}

bb_clearrodeorequest(param_00) {
	self._blackboard.var_E600 = undefined;
}

bb_isrodeorequested(param_00,param_01,param_02,param_03) {
	if(!isdefined(self._blackboard.rodeorequested)) {
		return 0;
	}

	return 1;
}

bb_setmeleetarget(param_00) {
	self.melee = spawnstruct();
	param_00.melee = spawnstruct();
	self.melee.target = param_00;
	self.melee.partner = param_00;
	param_00.melee.partner = self;
}

bb_clearmeleetarget() {
	if(!isdefined(self.melee)) {
		return;
	}

	if(isdefined(self.melee.target)) {
		self.melee.target.melee = undefined;
	}

	if(isdefined(self.melee.temp_ent)) {
		self.melee.temp_ent delete();
	}

	self.melee = undefined;
}

func_2977(param_00) {
	self._blackboard.crawlmelee = param_00;
}

bb_iscrawlmelee() {
	return isdefined(self._blackboard.crawlmelee);
}

func_297B(param_00) {
	self._blackboard.var_8C52 = param_00;
}

func_293E() {
	return isdefined(self._blackboard.var_8C52);
}

func_2922() {
	return self._blackboard.var_8C52;
}

bb_setisinbadcrouchspot(param_00) {
	self._blackboard.var_2992 = param_00;
}

bb_isinbadcrouchspot() {
	return isdefined(self._blackboard.var_2992) && self._blackboard.var_2992;
}

bb_setcivilianstate(param_00) {
	self._blackboard.civstate = param_00;
	self._blackboard.civstatetime = gettime();
}

func_291D(param_00) {
	return self._blackboard.civstate;
}

func_291E() {
	return self._blackboard.civstatetime;
}

func_1005F(param_00,param_01,param_02,param_03) {
	return !isdefined(self.bpowerdown) || !self.bpowerdown;
}

bb_isshort() {
	return isdefined(self._blackboard.var_FEED) && self._blackboard.var_FEED;
}

func_2984(param_00) {
	self._blackboard.var_FEED = param_00;
}