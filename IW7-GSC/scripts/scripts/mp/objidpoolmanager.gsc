/***************************************************
 * Decompiled by Bog
 * Edited by SyndiShanX
 * Script: scripts\scripts\mp\objidpoolmanager.gsc
***************************************************/

init() {
	var_00 = spawnstruct();
	var_00.var_19 = [];
	var_00.reclaimed = [];
	var_00.index = 0;
	level.objidpool = var_00;
}

requestminimapid(param_00) {
	var_01 = getnext(param_00);
	if(var_01 == -1) {
		return -1;
	}

	var_02 = spawnstruct();
	var_02.priority = param_00;
	var_02.requesttime = gettime();
	var_02.objid = var_01;
	level.objidpool.var_19[var_01] = var_02;
	return var_01;
}

removebest(param_00) {
	var_01 = [];
	foreach(var_03 in level.objidpool.var_19) {
		if(var_03.priority <= param_00) {
			var_01[var_01.size] = var_03;
		}
	}

	scripts\engine\utility::array_sort_with_func(var_01,::comparepriorityandtime);
	return returnminimapid(var_01[0].objid);
}

comparepriorityandtime(param_00,param_01) {
	if(param_00.priority == param_01.priority) {
		return param_00.requesttime < param_01.requesttime;
	}

	return param_00.priority < param_01.priority;
}

getnext(param_00) {
	if(!level.objidpool.reclaimed.size) {
		if(level.objidpool.index == 32) {
			return -1;
		}
		else
		{
			var_01 = level.objidpool.index;
			level.objidpool.index++;
		}
	}
	else
	{
		var_01 = level.objidpool.reclaimed[level.objidpool.reclaimed.size - 1];
		level.objidpool.reclaimed[level.objidpool.reclaimed.size - 1] = undefined;
	}

	return var_01;
}

returnminimapid(param_00) {
	if(!isdefined(param_00) || param_00 == -1) {
		return 0;
	}

	for(var_01 = 0;var_01 < level.objidpool.reclaimed.size;var_01++) {
		if(param_00 == level.objidpool.reclaimed[var_01]) {
			return 0;
		}
	}

	level.objidpool.var_19[param_00] = undefined;
	function_0154(param_00);
	level.objidpool.reclaimed[level.objidpool.reclaimed.size] = param_00;
	return 1;
}

minimap_objective_add(param_00,param_01,param_02,param_03,param_04) {
	if(param_00 == -1) {
		return;
	}

	if(isdefined(param_02)) {
		if(isdefined(param_03)) {
			if(isdefined(param_04)) {
				function_014E(param_00,param_01,param_02,param_03,param_04);
				return;
			}

			function_014E(param_00,param_01,param_02,param_03);
			return;
		}

		function_014E(param_00,param_01,param_02);
		return;
	}

	function_014E(param_00,param_01);
}

minimap_objective_state(param_00,param_01) {
	if(param_00 == -1) {
		return;
	}

	function_0162(param_00,param_01);
}

minimap_objective_position(param_00,param_01) {
	if(param_00 == -1) {
		return;
	}

	function_015F(param_00,param_01);
}

minimap_objective_icon(param_00,param_01) {
	if(param_00 == -1) {
		return;
	}

	function_0155(param_00,param_01);
}

minimap_objective_icon_colortype(param_00,param_01) {
	if(param_00 == -1) {
		return;
	}

	function_0320(param_00,param_01);
}

minimap_objective_icon_backgroundtype(param_00,param_01) {
	if(param_00 == -1) {
		return;
	}

	function_031F(param_00,param_01);
}

minimap_objective_onentity(param_00,param_01) {
	if(param_00 == -1) {
		return;
	}

	function_0156(param_00,param_01);
}

minimap_objective_onentitywithrotation(param_00,param_01) {
	if(param_00 == -1) {
		return;
	}

	function_0157(param_00,param_01);
}

minimap_objective_player(param_00,param_01) {
	if(param_00 == -1) {
		return;
	}

	function_0158(param_00,param_01);
}

minimap_objective_team(param_00,param_01) {
	if(param_00 == -1) {
		return;
	}

	function_0166(param_00,param_01);
}

minimap_objective_playermask_hidefromall(param_00) {
	if(param_00 == -1) {
		return;
	}

	function_015B(param_00);
}

minimap_objective_playermask_hidefrom(param_00,param_01) {
	if(param_00 == -1) {
		return;
	}

	function_015A(param_00,param_01);
}

minimap_objective_playermask_showto(param_00,param_01) {
	if(param_00 == -1) {
		return;
	}

	function_015C(param_00,param_01);
}

minimap_objective_playermask_showtoall(param_00) {
	if(param_00 == -1) {
		return;
	}

	function_015D(param_00);
}

minimap_objective_playerteam(param_00,param_01) {
	if(param_00 == -1) {
		return;
	}

	function_015E(param_00,param_01);
}

minimap_objective_playerenemyteam(param_00,param_01) {
	if(param_00 == -1) {
		return;
	}

	function_0159(param_00,param_01);
}