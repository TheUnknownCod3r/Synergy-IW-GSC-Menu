/****************************
 * Decompiled by Bog
 * Edited by SyndiShanX
 * Script: scripts\2928.gsc
****************************/

func_1032A() {
	if(!scripts\engine\utility::add_init_script("slowmo",::func_1032A)) {
		return;
	}

	level.var_1031B = spawnstruct();
	func_10329();
	function_014C("_cheat_player_press_slowmo","+melee");
	function_014C("_cheat_player_press_slowmo","+melee_breath");
	function_014C("_cheat_player_press_slowmo","+melee_zoom");
}

func_10329() {
	level.var_1031B.var_ABA1 = 0;
	level.var_1031B.var_ABA2 = 0.25;
	level.var_1031B.var_1098F = 0.4;
	level.var_1031B.var_1098C = 1;
}