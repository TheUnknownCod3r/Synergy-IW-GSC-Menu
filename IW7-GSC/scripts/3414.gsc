/****************************
 * Decompiled by Bog
 * Edited by SyndiShanX
 * Script: scripts\3414.gsc
****************************/

init() {
	if(!isdefined(game["clientMatchDataDef"])) {
		game["clientMatchDataDef"] = "mp/zombieclientmatchdata.ddl";
		function_01A9(game["clientMatchDataDef"]);
		setclientmatchdata("map",level.script);
	}

	level.maxdeathlogs = 50;
}

canlogclient(param_00) {
	if(isagent(param_00)) {
		return 0;
	}

	return param_00.clientid < level.maxlogclients;
}

canlogdeath(param_00) {
	return param_00 < level.maxdeathlogs;
}

logplayerdeath() {
	var_00 = function_0080("deathCount");
	if(!canlogclient(self) || !canlogdeath(var_00)) {
	}
}