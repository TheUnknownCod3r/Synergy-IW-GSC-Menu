#include scripts\cp\maps\cp_zmb\cp_zmb_ghost_wave;
#include scripts\cp\utility;
#include scripts\mp\mp_agent;
#include scripts\cp\cp_weapon;
#include scripts\cp\zombies\zombies_perk_machines;

init() {
	level thread onPlayerConnect();
}

on_event() {
	self endOn("disconnect");
	self.syn = [];
	self.syn["user"] = spawnStruct();
	while (true) {
		if(!isDefined(self.syn["user"].has_menu)) {
			self.syn["user"].has_menu = true;
			
			self initial_variable();
			self thread initial_monitor();
		}
		break;
	}
}

on_ended() {
	level waitTill("game_ended");
	if(self in_menu()) {
		self close_menu();
	}
	
	level notify("on_close_ended");
	level endOn("on_close_ended");
	if(return_toggle(level.debug_leave)) {
		exitlevel(false);
	}
}

return_toggle(variable) {
	return isDefined(variable) && variable;
}

really_alive() {
	return isAlive(self) && !return_toggle(self.lastStand);
}

get_menu() {
	return self.syn["menu"];
}

get_cursor() {
	return self.cursor[self get_menu()];
}

get_title() {
	return self.syn["title"];
}

set_menu(menu) {
	if(isDefined(menu)) {
		self.syn["menu"] = menu;
	}
}

set_cursor(cursor, menu) {
	if(isDefined(cursor)) {
		self.cursor[isDefined(menu) ? menu : self get_menu()] = cursor;
	}
}

set_title(title) {
	if(isDefined(title)) {
		self.syn["title"] = title;
	}
}

has_menu() {
	return return_toggle(self.syn["user"].has_menu);
}

in_menu() {
	return return_toggle(self.syn["utility"].in_menu);
}

set_state() {
	self.syn["utility"].in_menu = !return_toggle(self.syn["utility"].in_menu);
}

execute_function(function, argument_1, argument_2, argument_3, argument_4) {
	if(!isDefined(function)) {
		return;
	}
	
	if(isDefined(argument_4)) {
		return self thread [[function]](argument_1, argument_2, argument_3, argument_4);
	}
	
	if(isDefined(argument_3)) {
		return self thread [[function]](argument_1, argument_2, argument_3);
	}
	
	if(isDefined(argument_2)) {
		return self thread [[function]](argument_1, argument_2);
	}
	
	if(isDefined(argument_1)) {
		return self thread [[function]](argument_1);
	}
	
	return self thread [[function]]();
}

set_slider(scrolling, index) {
	menu = self get_menu();
	index = isDefined(index) ? index : self get_cursor();
	storage = (menu + "_" + index);
	if(!isDefined(self.slider[storage])) {
		self.slider[storage] = isDefined(self.structure[index].array) ? 0 : self.structure[index].start;
	}
	
	if(isDefined(self.structure[index].array)) {
		self notify("string_slider");
		if(scrolling == -1) {
			self.slider[storage]++;
		}
		
		if(scrolling == 1) {
			self.slider[storage]--;
		}
		
		if(self.slider[storage] > (self.structure[index].array.size - 1)) {
			self.slider[storage] = 0;
		}
		
		if(self.slider[storage] < 0) {
			self.slider[storage] = (self.structure[index].array.size - 1);
		}
		
		if(!self.structure[index].slider_text) {
			self.syn["hud"]["slider"][0][index] set_text(self.structure[index].array[self.slider[storage]]);
		} else {
			self.syn["hud"]["slider"][0][index] set_text(self.syn["zombies"][1][self.structure[index].array[self.slider[storage]]]);
		}
	}
	else {
		self notify("increment_slider");
		if(scrolling == -1)
			self.slider[storage] += self.structure[index].increment;
		
		if(scrolling == 1)
			self.slider[storage] -= self.structure[index].increment;
		
		if(self.slider[storage] > self.structure[index].maximum)
			self.slider[storage] = self.structure[index].minimum;
		
		if(self.slider[storage] < self.structure[index].minimum)
			self.slider[storage] = self.structure[index].maximum;
		
		position = abs((self.structure[index].maximum - self.structure[index].minimum)) / ((50 - 8));
		
		if(!self.structure[index].slider_text) {
			self.syn["hud"]["slider"][0][index] setValue(self.slider[storage]);
		} else {
			self.syn["hud"]["slider"][0][index] setText(self.syn["zombies"][1][self.slider[storage]]);
			self.syn["hud"]["slider"][0][index].x = self.syn["utility"].x_offset + 85;
		}
		self.syn["hud"]["slider"][2][index].x = (self.syn["hud"]["slider"][1][index].x + (abs((self.slider[storage] - self.structure[index].minimum)) / position));
	}
}

clear_option() {
	for(i = 0; i < self.syn["utility"].element_list.size; i++) {
		clear_all(self.syn["hud"][self.syn["utility"].element_list[i]]);
		self.syn["hud"][self.syn["utility"].element_list[i]] = [];
	}
}

check_option(player, menu, cursor) {
	if(isDefined(self.structure) && self.structure.size) {
		for(i = 0; i < self.structure.size; i++) {
			if(player.structure[cursor].text == self.structure[i].text && self get_menu() == menu) {
				return true;
			}
		}
	}

	return false;
}

create_text(text, font, font_scale, align_x, align_y, x, y, color, alpha, z_index, hide_when_in_menu, archive) {
	textElement = newHudElem();
	textElement.font = font;
	textElement.fontscale = font_scale;
	textElement.alpha = alpha;
	textElement.sort = z_index;
	textElement.foreground = true;
	if(isDefined(hide_when_in_menu)) {
		textElement.hideWhenInMenu = hide_when_in_menu;
	} else {
		textElement.hideWhenInMenu = true;
	}
	
	if(isDefined(archive)) {
		textElement.archived = archive;
	} else {
		textElement.archived = false;
	}
	
	textElement.x = x;
	textElement.y = y;
	textElement.alignX = align_x;
	textElement.alignY = align_y;
	textElement.horzAlign = align_x;
	textElement.vertAlign = align_y;
	
	if(color != "rainbow") {
		textElement.color = color;
	} else {
		textElement.color = level.rainbow_color;
		textElement thread start_rainbow();
	}
	
	if(isnumber(text)) {
		textElement setValue(text);
	} else {
		textElement set_text(text);
	}
	
	return textElement;
}

set_text(text) {
	if(!isDefined(self) || !isDefined(text)) {
		return;
	}
	
	self.text = text;
	self setText(text);
}

create_shader(shader, align_x, align_y, x, y, width, height, color, alpha, z_index) {
	shaderElement = newHudElem();
	shaderElement.elemType = "icon";
	shaderElement.children = [];
	shaderElement.alpha = alpha;
	shaderElement.sort = z_index;
	shaderElement.archived = true;
	shaderElement.foreground = true;
	shaderElement.hidden = false;
	shaderElement.hideWhenInMenu = true;
	
	shaderElement.x = x;
	shaderElement.y = y;
	shaderElement.alignX = align_x;
	shaderElement.alignY = align_y;
	shaderElement.horzAlign = align_x;
	shaderElement.vertAlign = align_y;
	
	if(color != "rainbow") {
		shaderElement.color = color;
	} else {
		shaderElement.color = level.rainbow_color;
		shaderElement thread start_rainbow();
	}
	
	shaderElement set_shader(shader, width, height);
	
	return shaderElement;
}

set_shader(shader, width, height) {
	if(!isDefined(shader)) {
		if(!isDefined(self.shader)) {
			return;
		}
	
		shader = self.shader;
	}
	
	if(!isDefined(width)) {
		if(!isDefined(self.width)) {
			return;
		}
	
		width = self.width;
	}
	
	if(!isDefined(height)) {
		if(!isDefined(self.height)) {
			return;
		}
	
		height = self.height;
	}
	
	self.shader = shader;
	self.width = width;
	self.height = height;
	self setShader(shader, width, height);
}

clear_all(array) {
	if(!isDefined(array)) {
		return;
	}
	
	keys = getArrayKeys(array);
	for(a = 0; a < keys.size; a++) {
		if(isArray(array[keys[a]])) {
			forEach(value in array[keys[a]])
				if( isDefined(value)) {
					value destroy();
				}
		} else {
			if(isDefined(array[keys[a]])) {
				array[keys[a]] destroy();
			}
		}
	}
}

add_menu(title, shader) {
	if(isDefined(title)) {
		self set_title(title);
	}

	if(isDefined(shader)) {
		self.shader_option[self get_menu()] = true;
	}

	self.structure = [];
}

add_option(text, function, argument_1, argument_2, argument_3) {
	option = spawnStruct();
	option.text = text;
	option.function = function;
	option.argument_1 = argument_1;
	option.argument_2 = argument_2;
	option.argument_3 = argument_3;
	
	self.structure[self.structure.size] = option;
}

add_toggle(text, function, toggle, array, argument_1, argument_2, argument_3) {
	option = spawnStruct();
	option.text = text;
	option.function = function;
	option.toggle = return_toggle(toggle);
	option.argument_1 = argument_1;
	option.argument_2 = argument_2;
	option.argument_3 = argument_3;
	
	if(isDefined(array)) {
		option.slider = true;
		option.array  = array;
	}
	
	self.structure[self.structure.size] = option;
}

add_string(text, function, array, argument_1, argument_2, argument_3) {
	option = spawnStruct();
	option.text = text;
	option.function = function;
	option.slider = true;
	option.array = array;
	option.argument_1 = argument_1;
	option.argument_2 = argument_2;
	option.argument_3 = argument_3;
	
	self.structure[self.structure.size] = option;
}

add_increment(text, function, start, minimum, maximum, increment, argument_1, argument_2, argument_3) {
	option = spawnStruct();
	option.text = text;
	option.function = function;
	option.slider = true;
	option.slider_text = false;
	option.start = start;
	option.minimum = minimum;
	option.maximum = maximum;
	option.increment = increment;
	option.argument_1 = argument_1;
	option.argument_2 = argument_2;
	option.argument_3 = argument_3;
	
	self.structure[self.structure.size] = option;
}

add_text_increment(text, function, start, minimum, maximum, increment, argument_1, argument_2, argument_3) {
	option = spawnStruct();
	option.text = text;
	option.function = function;
	option.slider = true;
	option.slider_text = true;
	option.start = start;
	option.minimum = minimum;
	option.maximum = maximum;
	option.increment = increment;
	option.argument_1 = argument_1;
	option.argument_2 = argument_2;
	option.argument_3 = argument_3;
	
	self.structure[self.structure.size] = option;
}

add_category(text) {
	option = spawnStruct();
	option.text = text;
	option.category = true;
	
	self.structure[self.structure.size] = option;
}

new_menu(menu) {
	if(!isDefined(menu)) {
		menu = self.previous[(self.previous.size - 1)];
		self.previous[(self.previous.size - 1)] = undefined;
	} else {
		self.previous[self.previous.size] = self get_menu();
	}
	
	self set_menu(menu);
	self clear_option();
	self create_option();
}

initial_variable() {
	self.syn["utility"] = spawnStruct();
	self.syn["utility"].font = "objective";
	self.syn["utility"].font_scale = 0.7;
	self.syn["utility"].option_limit = 10;
	self.syn["utility"].option_spacing = 14;
	self.syn["utility"].x_offset = 600;
	self.syn["utility"].y_offset = 100;
	self.syn["utility"].element_list = ["text", "subMenu", "toggle", "category", "slider", "slider_text"];
	self.syn["visions"] = ["ac130", "ac130_enhanced_mp", "ac130_inverted", "aftermath", "aftermath_glow", "aftermath_post", "apex_mp", "black_bw", "cp_frontend", "cp_zmb", "cp_zmb_afterlif e", "cp_zmb_alien", "cp_zmb_bw", "cp_zmb_ghost_path", "cp_zmb_int_basement", "cp_zmb_int_triton_main", "default", "default_night", "default_night_mp", "dronehive_mp", "end_game", "europa", "jackal_streak_mp", "last_stand_cp_zmb", "map_select_mp", "missilecam", "mpintro", "mpnuke", "mpnuke_aftermath", "mpoutro", "mp_frontier", "mp_frontier_alt", "mp_frontier_basement", "mp_frontier_mainfog", "mp_out_of_bounds", "near_death", "near_death_mp", "nuke_global_flash", "opticwave_mp", "overcharge_mp", "phase_shif t_mp", "rc8_mp", "thermal_mp", "thermal_snowlevel_mp", "thorbright_mp", "thor_mp", "venomgas_mp"];
	self.syn["weapons"]["category"] = ["Assault Rifles", "Sub Machine Guns", "Light Machine Guns", "Sniper Rifles", "Shotguns", "Pistols", "Launchers", "Classic Weapons", "Melee Weapons", "Map Specific Weapons", "Arcade Weapons", "Other Weapons"];
	self.syn["weapons"]["assault_rifles"][0] =     ["iw7_m4_zm", "iw7_sdfar_zm", "iw7_ar57_zm", "iw7_fmg_zm+akimbofmg_zm", "iw7_ake_zmr", "iw7_rvn_zm+meleervn", "iw7_vr_zm", "iw7_gauss_zm", "iw7_erad_zm"];
	self.syn["weapons"]["sub_machine_guns"][0] =   ["iw7_fhr_zm", "iw7_crb_zml+crblscope_camo", "iw7_ripper_zmr", "iw7_ump45_zml+ump45lscope_camo", "iw7_crdb_zm", "iw7_mp28_zm", "iw7_tacburst_zm+gltacburst"];
	self.syn["weapons"]["light_machine_guns"][0] = ["iw7_sdflmg_zm", "iw7_mauler_zm", "iw7_lmg03_zm", "iw7_minilmg_zm", "iw7_unsalmg_zm"];
	self.syn["weapons"]["sniper_rifles"][0] =      ["iw7_kbs_zm", "iw7_m8_zm", "iw7_cheytac_zmr", "iw7_m1_zm", "iw7_ba50cal_zm", "iw7_longshot_zm+longshotlscope_zm"];
	self.syn["weapons"]["shotguns"][0] =           ["iw7_devastator_zm", "iw7_sonic_zmr", "iw7_sdfshotty_zm+sdfshottyscope_camo", "iw7_spas_zmr", "iw7_mod2187_zm"];
	self.syn["weapons"]["pistols"][0] =            ["iw7_emc_zm", "iw7_nrg_zm", "iw7_g18_zmr", "iw7_revolver_zm", "iw7_udm45_zm+udm45scope", "iw7_mag_zm"];
	self.syn["weapons"]["launchers"][0] =          ["iw7_lockon_zm", "iw7_glprox_zm", "iw7_chargeshot_zm+chargeshotscope_camo"];
	self.syn["weapons"]["classics"][0] =           ["iw7_m1c_zm", "iw7_g18c_zm", "iw7_ump45c_zm", "iw7_spasc_zm", "iw7_arclassic_zm", "iw7_cheytacc_zm"];
	self.syn["weapons"]["melees"][0] =             ["iw7_axe_zm"];
	self.syn["weapons"]["assault_rifles"][1] =     ["NV4", "R3K", "KBAR-32", "Type-2", "Volk", "R-VN", "X-Con", "G-Rail", "Erad"];
	self.syn["weapons"]["sub_machine_guns"][1] =   ["FHR-40", "Karma-45", "RPR Evo", "HVR", "VPR", "Trencher", "Raijin-EMX"];
	self.syn["weapons"]["light_machine_guns"][1] = ["R.A.W.", "Mauler", "Titan", "Auger", "Atlas"];
	self.syn["weapons"]["sniper_rifles"][1] =      ["KBS Longbow", "EBR-800", "Widowmaker", "DMR-1", "Trek-50", "Proteus"];
	self.syn["weapons"]["shotguns"][1] =           ["Reaver", "Banshee", "DCM-8", "Rack-9", "M.2187"];
	self.syn["weapons"]["pistols"][1] =            ["EMC", "Oni", "Kendall 44", "Hailstorm", "UDM", "Stallion 44"];
	self.syn["weapons"]["launchers"][1] =          ["Spartan SA3", "Howitzer", "P-Law"];
	self.syn["weapons"]["classics"][1] =           ["M1", "Hornet", "MacTav-45", "S-Ravage", "OSA", "TF-141"];
	self.syn["weapons"]["melees"][1] =             ["Axe"];
	self.syn["weapons"]["assault_rifles"][2] =     ["m4", "sdfar", "ar57", "fmg", "ake", "rvn", "vr", "gauss", "erad"];
	self.syn["weapons"]["sub_machine_guns"][2] =   ["fhr", "crb", "ripper", "ump", "crdb", "mp28", "tacburst"];
	self.syn["weapons"]["light_machine_guns"][2] = ["sdflmg", "mauler", "lmg03", "minilmg", "unsalmg"];
	self.syn["weapons"]["sniper_rifles"][2] =      ["kbs", "m8", "cheytac", "m1", "ba50cal", "longshot"];
	self.syn["weapons"]["shotguns"][2] =           ["dev", "sonic", "sdfs", "spas", "mod2187"];
	self.syn["weapons"]["pistols"][2] =            ["emc", "nrg", "g18", "revolver", "udm", "mag"];
	self.syn["weapons"]["launchers"][2] =          ["lockon", "gl", "cs"];
	self.syn["weapons"]["classics"][2] =           ["m1c", "g18c", "umpc", "spasc", "arc", "cheytacc"];
	self.syn["weapons"]["melees"][2] =             [""];
	self.syn["weapons"]["assault_rifles"][3] =     ["", "", "", "+fmgscope_camo", "", "+rvnscope", "+vrscope", "+gaussscope", "+eradscope_camo"];
	self.syn["weapons"]["sub_machine_guns"][3] =   ["", "", "+ripperrscope_zm", "", "", "", "+tacburstscope"];
	self.syn["weapons"]["light_machine_guns"][3] = ["", "", "+lmg03scope_camo", "+minilmgscope", ""];
	self.syn["weapons"]["sniper_rifles"][3] =      ["+kbsscope_zm_camo", "+m8scope_zm_camo", "+cheytacrscope_camo", "+m1scope_camo", "+ba50calscope", ""];
	self.syn["weapons"]["shotguns"][3] =           ["", "+sonicrscope_camo", "", "", "+mod2187scope"];
	self.syn["weapons"]["pistols"][3] =            ["", "", "", "", "", ""];
	self.syn["weapons"]["launchers"][3] =          ["+lockonscope_camo", "+glproxscope_camo", ""];
	self.syn["weapons"]["classics"][3] =           ["", "", "", "", "+glarclassic", "+cheytacscope_camo"];
	self.syn["weapons"]["melees"][3] =             [""];
	self.syn["weapons"]["cp_zmb"][0] =   ["iw7_forgefreeze_zm", "iw7_dischord_zm", "iw7_facemelter_zm", "iw7_headcutter_zm", "iw7_shredder_zm"];
	self.syn["weapons"]["cp_zmb"][1] =   ["Forge Freeze", "Dischord", "Face Melter", "Head Cutter", "Shredder"];
	self.syn["weapons"]["cp_zmb"][2] =   ["", "", "", "", ""];
	self.syn["weapons"]["cp_zmb"][3] =   ["", "", " ", "", ""];														 
	self.syn["weapons"]["cp_rave"][0] =  ["iw7_golf_club_mp", "iw7_spiked_bat_mp", "iw7_two_headed_axe_mp", "iw7_machete_mp"];
	self.syn["weapons"]["cp_rave"][1] =  ["Golf Club", "Spiked Bat", "2 Headed Axe", "Machete"];
	self.syn["weapons"]["cp_rave"][2] =  ["", "", "", ""];
	self.syn["weapons"]["cp_rave"][3] =  ["", "", "", ""];
	self.syn["weapons"]["cp_disco"][0] = ["iw7_katana_zm", "iw7_nunchucks_zm"];					 
	self.syn["weapons"]["cp_disco"][1] = ["Katana", "Nunchucks"];
	self.syn["weapons"]["cp_disco"][2] = ["", ""];
	self.syn["weapons"]["cp_disco"][3] = ["", ""];
	self.syn["weapons"]["cp_town"][0] =  ["iw7_cutie_zm"];
	self.syn["weapons"]["cp_town"][1] =  ["Modular Atomic Disintegrator"];
	self.syn["weapons"]["cp_town"][2] =  ["", "", ""];
	self.syn["weapons"]["cp_town"][3] =  ["", "", ""];
	self.syn["weapons"]["cp_final"][0] = ["iw7_venomx_zm"];					 				 
	self.syn["weapons"]["cp_final"][1] = ["Venom-X"];
	self.syn["weapons"]["cp_final"][2] = [""];
	self.syn["weapons"]["cp_final"][3] = [""];
	self.syn["weapons"]["other"][0] =    ["iw7_fists_zm", "iw7_entangler_zm"];	
	self.syn["weapons"]["other"][1] =    ["Fists", "Entangler"];
	self.syn["weapons"]["other"][2] =    ["", "", "", ""];
	self.syn["weapons"]["other"][3] =    ["", "", "", ""];
	self.syn["camos"]["cp_zmb"] = ["+camo1", "+camo4"];
	self.syn["camos"]["cp_rave"] = ["+camo204", "+camo205"];
	self.syn["camos"]["cp_disco"] = ["+camo211", "+camo212"];
	self.syn["camos"]["cp_town"] = ["+camo92", "+camo93"];
	self.syn["camos"]["cp_final"] = ["+camo32", "+camo34"];
	self.syn["Main Teleports"]["cp_zmb"][0] =            ["PaP Room", "Spawn", "Main Portal", "Afterlife Arcade"];
	self.syn["Map Setup Teleports"]["cp_zmb"][0] =       ["Spawn Power", "Journey Power", "Kepler Power", "Polar Peak Power", "Arcade Power", "Journey Teleporter", "Kepler Teleporter", "Polar Peak Teleporter", "Arcade Teleporter"];
	self.syn["Mystery Wheel Teleports"]["cp_zmb"][0] =   ["Journey 1", "Journey 2", "Journey 3", "Astrocade", "Polar Peak", "Kepler 1", "Kepler 2", "Kepler 3"];
	self.syn["Main Quest Teleports"]["cp_zmb"][0] =      ["Calculator 1", "Calculator 2", "Calculator 3", "Boom Box 1", "Boom Box 2", "Boom Box 3", "Umbrella 1", "Umbrella 2", "Umbrella 3", "DJ Booth 1", "DJ Booth 2", "DJ Booth 3"];
	self.syn["Extra Teleports"]["cp_zmb"][0] =           ["N31L's Head", "N31L Auxiliary Battery 1", "N31L Auxiliary Battery 2", "N31L Auxiliary Battery 3", "N31L Auxiliary Battery 4", "N31L Auxiliary Battery 5", "N31L Auxiliary Battery 6", "N31L Floppy Disk 1", "N31L Floppy Disk 2", "N31L Floppy Disk 3", "N31L Floppy Disk 4", "N31L Floppy Disk 5"];
	self.syn["Main Teleports"]["cp_zmb"][1] =            [(-10245, 740, -1630), (465, 3680, 0), (650, 970, 0), (-9885, -70, -1795)];
	self.syn["Map Setup Teleports"]["cp_zmb"][1] =       [(1075, 3720, 0), (4695, 1250, 115), (-1365, -65, 380), (-695, -2795, 560), (2390, -1825, 115), (3640, 1165, 55), (-2150, -35, 225), (-1490, -2650, 360), (2285, -1615, 115)];
	self.syn["Mystery Wheel Teleports"]["cp_zmb"][1] =   [(1470, 1045, 0), (4065, 2135, 55), (3690, 420, 55), (2575, -865, 240), (955, -2260, 440), (-1950, 1830, 365), (-1900, -530, 380), (-845, -1492, 360)];
	self.syn["Main Quest Teleports"]["cp_zmb"][1] =      [(540, 1060, 0), (-2520, 805, 365), (2960, -850, 240), (595, 2125, -65), (-1415, -175, 380), (1375, -590, -195), (155, -505, 0), (-1890, -3040, 360), (3640, 2335, 115), (-1000, 1495, 225), (-2710, -2480, 360), (2926, 1305, 0)];
	self.syn["Extra Teleports"]["cp_zmb"][1] =           [(475, -265, 0), (-1800, -2825, 360), (-535, -3265, 390), (-757, -2415, 560), (-2775, 1565, 365), (-3045, 730, 365), (-1230, 1625, 225), (000, 000, 000), (000, 000, 000), (000, 000, 000), (000, 000, 000), (000, 000, 000)];
	self.syn["Main Teleports"]["cp_zmb"][2] =            [90, -90, -90];
	self.syn["Map Setup Teleports"]["cp_zmb"][2] =       [-90, 0, -90, 90, 180, 0, -45, 20, -90];
	self.syn["Mystery Wheel Teleports"]["cp_zmb"][2] =   [180, 90, 0, -90, 0, -45, -90, 0];
	self.syn["Main Quest Teleports"]["cp_zmb"][2] =      [0, 0, 90, 45, 0, 90, 160, 90, -90, 0, -90, 0];
	self.syn["Extra Teleports"]["cp_zmb"][2] =           [-90, 180, -90, 0, 0, 0, 90, 0, 0, 0, 0, 0];
	self.syn["Main Teleports"]["cp_rave"][0] =           ["PaP Room", "Spawn", "Cellar", "Kevin's Cabin", "Afterlife Arcade"];
	self.syn["Mystery Wheel Teleports"]["cp_rave"][0] =  ["Rave Stage", "Dock", "Main Fire", "Mess Hall", "Cellar", "Bear Lodge", "Camp Wolf"];
	self.syn["Main Teleports"]["cp_rave"][1] =           [(-10245, 750, -1630), (-940, -1620, 225), (-395, -1815, 55), (-6035, 4890, 120), (-9885, -70, -1795)];
	self.syn["Map Setup Teleports"]["cp_rave"][1] =      [(000, 000, 000), (000, 000, 000)];
	self.syn["Mystery Wheel Teleports"]["cp_rave"][1] =  [(2205, -1390, -15), (-2900, 2275, -150), (145, 1125, 50), (-3355, -3365, 150), (-560, -1895, 55), (-950, -1150, 390), (-2585, -4575, 255)];
	self.syn["Main Quest Teleports"]["cp_rave"][1] =     [(000, 000, 000), (000, 000, 000)];
	self.syn["Extra Teleports"]["cp_rave"][1] =          [(000, 000, 000), (000, 000, 000)];
	self.syn["Main Teleports"]["cp_rave"][2] =           [90, 165, 130, 100, 0];
	self.syn["Map Setup Teleports"]["cp_rave"][2] =      [0, 0];
	self.syn["Mystery Wheel Teleports"]["cp_rave"][2] =  [100, 140, 90, -50, -180, -90, -75];
	self.syn["Main Quest Teleports"]["cp_rave"][2] =     [0, 0];
	self.syn["Extra Teleports"]["cp_rave"][2] =          [0, 0];
	self.syn["Main Teleports"]["cp_disco"][0] =          ["PaP Room", "Spawn", "Sewer", "Afterlife Arcade"];
	self.syn["Mystery Wheel Teleports"]["cp_disco"][0] = ["Alleyway", "Rooftop", "Garden", "Disco Roof", "Subway Station 1", "Subway Station 2", "Disco"];
	self.syn["Extra Teleports"]["cp_disco"][0] =         ["Pink Cat Flier 1", "Pink Cat Flier 2", "Pink Cat Flier 3", "Pink Cat Flier 4", "Token"];
	self.syn["Main Teleports"]["cp_disco"][1] =          [(-10245, 750, -1630), (580, 3025, 285), (-875, 1820, 180), (-9885, -35, -1795)];
	self.syn["Map Setup Teleports"]["cp_disco"][1] =     [(-1915, 4620, 750), (1590, 1290, 750), (-810, 765, 925), (-1110, 3435, 1120), (-1075, 2795, 260)];
	self.syn["Mystery Wheel Teleports"]["cp_disco"][1] = [(105, 1300, 750), (15, 665, 935), (-3515, 1165, 975), (-2100, 2795, 1175), (375, 2065, 525), (-2450, 3610, 500), (-1185, 3735, 750)];
	self.syn["Main Quest Teleports"]["cp_disco"][1] =    [(000, 000, 000), (000, 000, 000)];
	self.syn["Extra Teleports"]["cp_disco"][1] =         [(000, 000, 000), (000, 000, 000)];
	self.syn["Main Teleports"]["cp_disco"][2] =          [90, -145, 90, 0];
	self.syn["Map Setup Teleports"]["cp_disco"][2] =     [-180, -30, 90, 0, 180];
	self.syn["Mystery Wheel Teleports"]["cp_disco"][2] = [-90, 90, -180, 180, -180, 90. -20];
	self.syn["Main Quest Teleports"]["cp_disco"][2] =    [0, 0];
	self.syn["Extra Teleports"]["cp_disco"][2] =         [0, 0];
	self.syn["Main Teleports"]["cp_town"][0] =           ["PaP Room", "Spawn", "Studio", "Afterlife Arcade"];
	self.syn["Map Setup Teleports"]["cp_town"][0] =      ["Power Handle", "Power Station", "Telepad 1", "Telepad 2", "Telepad 3", "Telepad 4"];
	self.syn["Mystery Wheel Teleports"]["cp_town"][0] =  ["Power Station", "Beach Mart", "RV Park", "Pool", "Studio", "Trail"];
	self.syn["Main Quest Teleports"]["cp_town"][0] =     ["Elvira's Book", "Zombie Head", "Zombie Torso", "Zombie Arm 1", "Zombie Arm 2", "Zombie Leg"];
	self.syn["Extra Teleports"]["cp_town"][0] =          ["Cleaver", "Crowbar", "M.A.D. Attachment 1", "M.A.D. Attachment 2", "M.A.D. Attachment 3"];
	self.syn["Main Teleports"]["cp_town"][1] =           [(-10245, 750, -1630), (3939, -4515, 15), (235, -2555, 520), (-9885, -70, -1795)];
	self.syn["Map Setup Teleports"]["cp_town"][1] =      [(3205, 1815, -105), (6440, -2770, 105), (5375, -2800, 195), (4795, -180, 330), (490, 4115, 395), (-937, -2695, 520)];
	self.syn["Mystery Wheel Teleports"]["cp_town"][1] =  [(6440, -1955, 105), (6210, 1075, 330), (-790, 3840, 400), (-255, -590, 410), (-480, -3410, 515), (340, -4710, 255)];
	self.syn["Main Quest Teleports"]["cp_town"][1] =     [(5405, -4720, -15), (-295, 3665, 425), (6245, -550, 335), (3205, 1815, -105), (470, 2200, 395), (-1175, -4219, 335)];
	self.syn["Extra Teleports"]["cp_town"][1] =          [(6015, -820, 335), (1270, -130, 475), (-1055, 3505, 400), (4260, 1620, 335), (-130, -3045, 520)];
	self.syn["Main Teleports"]["cp_town"][2] =           [90, 60, 0, 0];
	self.syn["Map Setup Teleports"]["cp_town"][2] =      [65, 20, -160, -90, 100, -180];
	self.syn["Mystery Wheel Teleports"]["cp_town"][2] =  [-65, 0, 150, 180, -90, -80];
	self.syn["Main Quest Teleports"]["cp_town"][2] =     [45, -170, 75, 65, 30, 80];
	self.syn["Extra Teleports"]["cp_town"][2] =          [-85, -30, 100, -180, 90];
	self.syn["Main Teleports"]["cp_final"][0] =          ["PaP Room", "Spawn", "Control Room", "Theatre", "Afterlife Arcade"];
	self.syn["Map Setup Teleports"]["cp_final"][0] =     ["N31L's Head", "N31L", "Open Theatre Portal"];
	self.syn["Mystery Wheel Teleports"]["cp_final"][0] = ["Spawn", "Water Room", "Main Room", "Hallway", "Storage Room", "Theatre", "Outside"];
	self.syn["Extra Teleports"]["cp_final"][0] =         ["PaP Bridge Part 1", "PaP Bridge Part 2", "PaP Bridge Part 3", "PaP Bridge", "Mephistopheles Arena"];
	self.syn["Main Teleports"]["cp_final"][1] =          [(5135, -5180, 285), (-760, 2920, 90), (730, 5065, 90), (5515, -4515, -20), (2080, -4520, 330)];
	self.syn["Map Setup Teleports"]["cp_final"][1] =     [(-1210, 5040, -70), (45, 3840, 25), (1920, 3470, 15)];
	self.syn["Mystery Wheel Teleports"]["cp_final"][1] = [(-90, 2880, 25), (-1215, 4755, -205), (645, 5710, 60), (1510, 4010, 15), (1470, 3565, -175), (5700, -4050, -70), (2185, 6275, 95)];
	self.syn["Main Quest Teleports"]["cp_final"][1] =    [(000, 000, 000), (000, 000, 000)];
	self.syn["Extra Teleports"]["cp_final"][1] =         [(-855, 5435, -70), (1755, 3110, -290), (4990, -6835, 50), (3465, 6640, 165), (-13300, -325, -105)];
	self.syn["Main Teleports"]["cp_final"][2] =          [90, 20, -45, 90, 0];
	self.syn["Map Setup Teleports"]["cp_final"][2] =     [-155, 90, 90];
	self.syn["Mystery Wheel Teleports"]["cp_final"][2] = [-90, -130, 180, 90, 60, 0, -50];
	self.syn["Main Quest Teleports"]["cp_final"][2] =    [0, 0];
	self.syn["Extra Teleports"]["cp_final"][2] =         [-55, 60, -100, 45, 0];
	self.syn["zombies"]["cp_zmb"][0] =   ["generic_zombie", "zombie_clown", "zombie_brute", "zombie_grey", "zombie_ghost", "the_hoff"];
	self.syn["zombies"]["cp_zmb"][1] =   ["Normal Zombie", "Clown", "Brute", "Alien", "Ghost", "David Hasselhoff"];
	self.syn["zombies"]["cp_zmb"][2] =   ["axis", "axis", "axis", "axis", "allies"];
	self.syn["zombies"]["cp_rave"][0] =  ["generic_zombie", "lumberjack", "zombie_sasquatch", "slasher", "superslasher"];
	self.syn["zombies"]["cp_rave"][1] =  ["Normal Zombie", "Lumberjack", "Sasquatch", "Slasher", "Super Slasher"];
	self.syn["zombies"]["cp_rave"][2] =  ["axis", "axis", "axis", "axis", "axis"];
	self.syn["zombies"]["cp_disco"][0] = ["generic_zombie", "karatemaster", "skater", "ratking", "pamgrier"];
	self.syn["zombies"]["cp_disco"][1] = ["Normal Zombie", "Karate Zombie", "Skater", "Rat King", "Pam Grier"];
	self.syn["zombies"]["cp_disco"][2] = ["axis", "axis", "axis", "axis", "allies"];
	self.syn["zombies"]["cp_town"][0] =  ["generic_zombie", "crab_mini", "crab_brute", "crab_boss", "elvira"];
	self.syn["zombies"]["cp_town"][1] =  ["Normal Zombie", "Crog", "Crog Brute", "Crog Boss", "Elvira"];
	self.syn["zombies"]["cp_town"][2] =  ["axis", "axis", "axis", "axis", "allies"];
	self.syn["zombies"]["cp_final"][0] = ["generic_zombie", "alien_goon", "alien_phantom", "alien_rhino", "zombie_skeleton", "dlc4_boss"];
	self.syn["zombies"]["cp_final"][1] = ["Normal Zombie", "Cryptid", "Phantom", "Rhino", "Skeleton", "Mephistopheles"];
	self.syn["zombies"]["cp_final"][2] = ["axis", "axis", "axis", "axis", "axis", "axis"];
	self.syn["perks"][0] = ["perk_machine_revive", "perk_machine_tough", "perk_machine_rat_a_tat", "perk_machine_flash", "perk_machine_run", "perk_machine_boom", "perk_machine_more", "perk_machine_zap", "perk_machine_smack", "perk_machine_fwoosh"];
	self.syn["perks"][1] = ["Up N' Atoms", "Tuff Nuff", "Bang Bangs", "Quickies", "Racin' Stripes", "Bombstoppers", "Mule Munchies", "Blue Bolts", "Slappy Taffy", "Trail Blazers"];
	self.syn["perks"]["cp_disco"][0] = ["perk_machine_deadeye"];
	self.syn["perks"]["cp_disco"][1] = ["Deadeye Dewdrops"];
	self.syn["perks"]["cp_town"][0] = ["perk_machine_deadeye", "perk_machine_change"];
	self.syn["perks"]["cp_town"][1] = ["Deadeye Dewdrops", "Change Chews"];
	self.syn["perks"]["cp_final"][0] = ["perk_machine_deadeye", "perk_machine_change"];
	self.syn["perks"]["cp_final"][1] = ["Deadeye Dewdrops", "Change Chews"];
	self.syn["utility"].interaction = true;
	self.syn["utility"].color[0] = (0.752941176, 0.752941176, 0.752941176);
	self.syn["utility"].color[1] = (0.074509804, 0.070588235, 0.078431373);
	self.syn["utility"].color[2] = (0.074509804, 0.070588235, 0.078431373);
	self.syn["utility"].color[3] = (0.243137255, 0.22745098, 0.247058824);
	self.syn["utility"].color[4] = (1, 1, 1);
	self.syn["utility"].color[5] = "rainbow";
	
	self.cursor = [];
	self.previous = [];
	
	self set_menu("Synergy");
	self set_title(self get_menu());
}

initial_monitor() {
	self endOn("disconnect");
	level endOn("game_ended");
	while(true) {
		if(self really_alive()) {
			if(!self in_menu()) {
				if(self adsButtonPressed() && self meleeButtonPressed()) {
					if(return_toggle(self.syn["utility"].interaction)) {
						self playSoundToPlayer("entrance_sign_power_on_build", self);
					}
					
					close_controls_menu();
					
					self open_menu();
					wait .15;
				}
			} else {
				menu   = self get_menu();
				cursor = self get_cursor();
				if(self meleeButtonPressed()) {
					if(return_toggle(self.syn["utility"].interaction)) {
						self playSoundToPlayer(isDefined(self.previous[(self.previous.size - 1)]) ? "zmb_powerup_activate" : "zmb_powerup_activate", self);
					}
					
					if(isDefined(self.previous[(self.previous.size - 1)])) {
						self new_menu(self.previous[menu]);
					} else {
						self close_menu();
					}
					
					wait .15;
				}
				else if(self adsButtonPressed() && !self attackButtonPressed() || self attackButtonPressed() && !self adsButtonPressed()) {
					if(isDefined(self.structure) && self.structure.size >= 2) {
						if(return_toggle(self.syn["utility"].interaction)) {
							self playSoundToPlayer("zmb_powerup_activate", self);
						}
						
						scrolling = self attackButtonPressed() ? 1 : -1;
						
						self set_cursor((cursor + scrolling));
						self update_scrolling(scrolling);
					}
					wait .25;
				}
				else if(self fragButtonPressed() && !self secondaryOffhandButtonPressed() || self secondaryOffhandButtonPressed() && !self fragButtonPressed()) {
					if(return_toggle(self.structure[cursor].slider)) {
						if(return_toggle(self.syn["utility"].interaction)) {
							self playSoundToPlayer("zmb_wheel_wpn_acquired", self);
						}
						
						scrolling = self secondaryOffhandButtonPressed() ? 1 : -1;
						
						self set_slider(scrolling);
					}
					wait .07;
				}
				else if(self useButtonPressed()) {
					if(isDefined(self.structure[cursor].function)) {
						if(return_toggle(self.syn["utility"].interaction)) {
							self playSoundToPlayer(isDefined(self.structure[cursor].toggle) ? return_toggle(self.structure[cursor].toggle) ? "part_pickup" : "part_pickup" : "part_pickup", self);
						}
						
						if(return_toggle(self.structure[cursor].slider)) {
							self thread execute_function(self.structure[cursor].function, isDefined(self.structure[cursor].array) ? self.structure[cursor].array[self.slider[menu + "_" + cursor]] :self.slider[menu + "_" + cursor], self.structure[cursor].argument_1, self.structure[cursor].argument_2, self.structure[cursor].argument_3);
						} else {
							self thread execute_function(self.structure[cursor].function, self.structure[cursor].argument_1, self.structure[cursor].argument_2, self.structure[cursor].argument_3);
						}
						
						if(isDefined(self.structure[cursor].toggle)) {
							self update_menu(menu, cursor);
						}
					}
					wait .2;
				}
			}
		}
		wait .05;
	}
}

open_menu(menu) {
	if(!isDefined(menu)) {
		menu = isDefined(self get_menu()) && self get_menu() != "Synergy" ? self get_menu() : "Synergy";
	}
	
	self.syn["hud"] = [];
	self.syn["hud"]["title"][0] = self create_text(self get_title(), self.syn["utility"].font, self.syn["utility"].font_scale, "left", "CENTER", (self.syn["utility"].x_offset + 86), (self.syn["utility"].y_offset + 2), self.syn["utility"].color[4], 1, 10);
	self.syn["hud"]["title"][1] = self create_text("______", self.syn["utility"].font, self.syn["utility"].font_scale * 1.5, "left", "CENTER", (self.syn["utility"].x_offset + 4), (self.syn["utility"].y_offset - 4), self.syn["utility"].color[5], 1, 10);
	self.syn["hud"]["title"][2] = self create_text("______", self.syn["utility"].font, self.syn["utility"].font_scale * 1.5, "left", "CENTER", (self.syn["utility"].x_offset + 157), (self.syn["utility"].y_offset - 4), self.syn["utility"].color[5], 1, 10);
			
	self.syn["hud"]["background"][0] = self create_shader("white", "left", "CENTER", self.syn["utility"].x_offset - 1, (self.syn["utility"].y_offset - 1), 202, 30, self.syn["utility"].color[5], 1, 1);
	self.syn["hud"]["background"][1] = self create_shader("white", "left", "CENTER", (self.syn["utility"].x_offset), self.syn["utility"].y_offset, 200, 28, self.syn["utility"].color[1], 1, 2);
	self.syn["hud"]["foreground"][1] = self create_shader("white", "left", "CENTER", (self.syn["utility"].x_offset), (self.syn["utility"].y_offset + 14), 194, 14, self.syn["utility"].color[3], 1, 4);
	self.syn["hud"]["foreground"][2] = self create_shader("white", "left", "CENTER", (self.syn["utility"].x_offset + 195), (self.syn["utility"].y_offset + 14), 4, 14, self.syn["utility"].color[3], 1, 4);
	
	self set_menu(menu);
	self create_option();
	self set_state();
}

close_menu() {
	self clear_option();
	self clear_all(self.syn["hud"]);
	self set_state();
}

create_title(title) {
	self.syn["hud"]["title"][0] set_text(isDefined(title) ? title : self get_title());
}

create_option() {
	self clear_option();
	self menu_index();
	if(!isDefined(self.structure) || !self.structure.size) {
		self add_option("Currently No Options To Display");
	}
	
	if(!isDefined(self get_cursor())) {
		self set_cursor(0);
	}
	
	start = 0;
	if((self get_cursor() > int(((self.syn["utility"].option_limit - 1) / 2))) && (self get_cursor() < (self.structure.size - int(((self.syn["utility"].option_limit + 1) / 2)))) && (self.structure.size > self.syn["utility"].option_limit)) {
		start = (self get_cursor() - int((self.syn["utility"].option_limit - 1) / 2));
	}
	
	if((self get_cursor() > (self.structure.size - (int(((self.syn["utility"].option_limit + 1) / 2)) + 1))) && (self.structure.size > self.syn["utility"].option_limit)) {
		start = (self.structure.size - self.syn["utility"].option_limit);
	}
	
	self create_title();
	if(isDefined(self.structure) && self.structure.size) {
		limit = min(self.structure.size, self.syn["utility"].option_limit);
		for(i = 0; i < limit; i++) {
			index = (i + start);
			cursor = (self get_cursor() == index);
			color[0] = cursor ? self.syn["utility"].color[0] : self.syn["utility"].color[4];
			color[1] = return_toggle(self.structure[index].toggle) ? cursor ? self.syn["utility"].color[0] : self.syn["utility"].color[4] : cursor ? self.syn["utility"].color[2] : self.syn["utility"].color[3];
			if(isDefined(self.structure[index].function) && self.structure[index].function == ::new_menu) {
				self.syn["hud"]["subMenu"][index] = self create_text(">", self.syn["utility"].font, self.syn["utility"].font_scale, "left", "CENTER", (self.syn["utility"].x_offset + 185), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 16)), self.syn["utility"].color[4], 1, 10);
			}
			
			if(isDefined(self.structure[index].toggle)) {
				self.syn["hud"]["toggle"][1][index] = self create_shader("white", "left", "CENTER", (self.syn["utility"].x_offset + 4), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 17)), 8, 8, color[1], 1, 10);
			}
			
			for(x = 0; x < 10; x++) {
				if(isDefined(self.syn["hud"]["arrow"][0][x])) {
					self.syn["hud"]["arrow"][0][x] destroy();
					self.syn["hud"]["arrow"][1][x] destroy();
				}
			}
			
			if(return_toggle(self.structure[index].slider)) {
				if(isDefined(self.structure[index].array)) {
					self.syn["hud"]["slider"][0][index] = self create_text(self.structure[index].array[self.slider[self get_menu() + "_" + index]], self.syn["utility"].font, self.syn["utility"].font_scale, "left", "CENTER", (self.syn["utility"].x_offset + 155), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 16)), color[0], 1, 10);
				} else {
					if(cursor) {
						self.syn["hud"]["slider"][0][index] = self create_text(self.slider[self get_menu() + "_" + index], self.syn["utility"].font, (self.syn["utility"].font_scale - 0.1), "left", "CENTER", (self.syn["utility"].x_offset + 155), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 17)), self.syn["utility"].color[4], 1, 10);
						self.syn["hud"]["arrow"][0][index] = self create_text("<", self.syn["utility"].font, self.syn["utility"].font_scale, "left", "CENTER", (self.syn["utility"].x_offset + 129), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 16)), self.syn["utility"].color[4], 1, 10);
						self.syn["hud"]["arrow"][1][index] = self create_text(">", self.syn["utility"].font, self.syn["utility"].font_scale, "left", "CENTER", (self.syn["utility"].x_offset + 185), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 16)), self.syn["utility"].color[4], 1, 10);
					} else {
						self.syn["hud"]["arrow"][0][index] destroy();
						self.syn["hud"]["arrow"][1][index] destroy();
					}
				
					self.syn["hud"]["slider"][1][index] = self create_shader("white", "left", "CENTER", (self.syn["utility"].x_offset + 135), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 17)), 50, 8, cursor ? self.syn["utility"].color[2] : self.syn["utility"].color[1], 1, 8);
					self.syn["hud"]["slider"][2][index] = self create_shader("white", "left", "CENTER", (self.syn["utility"].x_offset + 149), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 17)), 8, 8, cursor ? self.syn["utility"].color[0] : self.syn["utility"].color[3], 1, 9);
				}
				
				self set_slider(undefined, index);
			}
			
			if(return_toggle(self.structure[index].category)) {
				self.syn["hud"]["category"][0][index] = self create_text(self.structure[index].text, self.syn["utility"].font, self.syn["utility"].font_scale, "left", "CENTER", (self.syn["utility"].x_offset + 88), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 17)), self.syn["utility"].color[0], 1, 10);
				self.syn["hud"]["category"][1][index] = self create_text("______", self.syn["utility"].font, self.syn["utility"].font_scale * 1.5, "left", "CENTER", (self.syn["utility"].x_offset + 4), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 11)), self.syn["utility"].color[5], 1, 10);
				self.syn["hud"]["category"][2][index] = self create_text("______", self.syn["utility"].font, self.syn["utility"].font_scale * 1.5, "left", "CENTER", (self.syn["utility"].x_offset + 157), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 11)), self.syn["utility"].color[5], 1, 10);
			}
			else {
				if(return_toggle(self.shader_option[self get_menu()])) {
					self.syn["hud"]["text"][index] = self create_shader(isDefined(self.structure[index].text) ? self.structure[index].text : "white", "left", "CENTER", (self.syn["utility"].x_offset + ((i * 20) - ((limit * 10) - 110))), (self.syn["utility"].y_offset + 27), isDefined(self.structure[index].argument_2) ? self.structure[index].argument_2 : 18, isDefined(self.structure[index].argument_3) ? self.structure[index].argument_3 : 18, isDefined(self.structure[index].argument_1) ? self.structure[index].argument_1 : (1, 1, 1), cursor ? 1 : 0.2, 10);
				} else {
					self.syn["hud"]["text"][index] = self create_text(return_toggle(self.structure[index].slider) ? self.structure[index].text + ":" : self.structure[index].text, self.syn["utility"].font, self.syn["utility"].font_scale, "left", "CENTER", isDefined(self.structure[index].toggle) ? (self.syn["utility"].x_offset + 15) : (self.syn["utility"].x_offset + 4), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 16)), color[0], 1, 10);
				}
			}
		}
		
		if(!isDefined(self.syn["hud"]["text"][self get_cursor()])) {
			self set_cursor((self.structure.size - 1));
		}
	}
	self update_resize();
}

update_scrolling(scrolling) {	
	if(return_toggle(self.structure[self get_cursor()].category)) {
		self set_cursor((self get_cursor() + scrolling));
		return self update_scrolling(scrolling);
	}
	
	if((self.structure.size > self.syn["utility"].option_limit) || (self get_cursor() >= 0) || (self get_cursor() <= 0)) {
		if((self get_cursor() >= self.structure.size) || (self get_cursor() < 0)) {
			self set_cursor((self get_cursor() >= self.structure.size) ? 0 : (self.structure.size - 1));
		}
		self create_option();
	}
	self update_resize();
}

update_resize() {
	limit = min(self.structure.size, self.syn["utility"].option_limit);
	height = int((limit * self.syn["utility"].option_spacing));
	adjust = (self.structure.size > self.syn["utility"].option_limit) ? int(((94 / self.structure.size) * limit)) : height;
	position = (self.structure.size - 1) / (height - adjust);
	if(!return_toggle(self.shader_option[self get_menu()])) {
		if(!isDefined(self.syn["hud"]["foreground"][1])) {
			self.syn["hud"]["foreground"][1] = self create_shader("white", "left", "CENTER", (self.syn["utility"].x_offset), (self.syn["utility"].y_offset + 14), 194, 14, self.syn["utility"].color[3], 1, 4);
		}
		
		if(!isDefined(self.syn["hud"]["foreground"][2])) {
			self.syn["hud"]["foreground"][2] = self create_shader("white", "left", "CENTER", (self.syn["utility"].x_offset + 195), (self.syn["utility"].y_offset + 14), 4, 14, self.syn["utility"].color[3], 1, 4);
		}
	}
	
	self.syn["hud"]["background"][0] set_shader(self.syn["hud"]["background"][0].shader, self.syn["hud"]["background"][0].width, return_toggle(self.shader_option[self get_menu()]) ? 42 : (height + 16));
	self.syn["hud"]["background"][1] set_shader(self.syn["hud"]["background"][1].shader, self.syn["hud"]["background"][1].width, return_toggle(self.shader_option[self get_menu()]) ? 40 : (height + 14));
	self.syn["hud"]["foreground"][0] set_shader(self.syn["hud"]["foreground"][0].shader, self.syn["hud"]["foreground"][0].width, return_toggle(self.shader_option[self get_menu()]) ? 26 : height);
	self.syn["hud"]["foreground"][2] set_shader(self.syn["hud"]["foreground"][2].shader, self.syn["hud"]["foreground"][2].width, adjust);
	
	if(isDefined(self.syn["hud"]["foreground"][1])) {
		self.syn["hud"]["foreground"][1].y = (self.syn["hud"]["text"][self get_cursor()].y - 2);
	}
	
	self.syn["hud"]["foreground"][2].y = (self.syn["utility"].y_offset + 14);
	if(self.structure.size > self.syn["utility"].option_limit) {
	    self.syn["hud"]["foreground"][2].y += (self get_cursor() / position);
	}
}

update_menu(menu, cursor) {
	if(isDefined(menu) && !isDefined(cursor) || !isDefined(menu) && isDefined(cursor)) {
		return;
	}
	
	if(isDefined(menu) && isDefined(cursor)) {
		forEach(player in level.players) {
			if(!isDefined(player) || !player in_menu()) {
				continue;
			}
		
			if(player get_menu() == menu || self != player && player check_option(self, menu, cursor)) {
				if(isDefined(player.syn["hud"]["text"][cursor]) || player == self && player get_menu() == menu && isDefined(player.syn["hud"]["text"][cursor]) || self != player && player check_option(self, menu, cursor)) {
					player create_option();
				}
			}
		}
	} else {
		if(isDefined(self) && self in_menu()) {
			self create_option();
		}
	}
}

create_rainbow_color() {
	x = 0; y = 0;
	r = 0; g = 0; b = 0;
	level.rainbow_color = (0, 0, 0);
	
	while(true) {
		if (y >= 0 && y < 258) {
			r = 255;
			g = 0;
			b = x;
		} else if (y >= 258 && y < 516) {
			r = 255 - x;
			g = 0;
			b = 255;
		} else if (y >= 516 && y < 774) {
			r = 0;
			g = x;
			b = 255;
		} else if (y >= 774 && y < 1032) {
			r = 0;
			g = 255;
			b = 255 - x;
		} else if (y >= 1032 && y < 1290) {
			r = x;
			g = 255;
			b = 0;
		} else if (y >= 1290 && y < 1545) {
			r = 255;
			g = 255 - x;
			b = 0;
		}
		
		x += 3;
		if (x > 255)
			x = 0;
		
		y += 3;
		if (y > 1545)
			y = 0;
		
		level.rainbow_color = (r/255, g/255, b/255);
		wait .05;
	}
}

start_rainbow() {
	while(isDefined(self)) {
		self fadeOverTime(.05);
		self.color = level.rainbow_color;
		wait .05;
	}
}

onPlayerConnect() {
	for(;;) {
		level waitTill("connected", player);
		get_map_name();
		player thread onPlayerSpawned();
	}
}

onPlayerSpawned() {
	self endOn("disconnect");
	level endOn("game_ended");
	for(;;) {
		self waitTill("spawned_player");
		if(isDefined(self.playerSpawned)) {
			continue;
		}
		self.playerSpawned = true;
		
		if(!isDefined(level.initial_setup)) {
			level.initial_setup = true;
		}
		
		self thread on_event();
		self thread on_ended();

		if(self isHost()) {
			self freezeControls(false);
		}
		
		level thread create_rainbow_color();

		level thread create_text("SyndiShanX", "default", 1, "left", "top", 5, 10, "rainbow", 1, 3);

		if(!self.menuInit) {
			open_controls_menu("Controls");
		}
	}
}

open_controls_menu() {
	self.syn["controls-hud"] = [];
	self.syn["controls-hud"]["title"][0] = self create_text("Controls", self.syn["utility"].font, self.syn["utility"].font_scale, "left", "CENTER", (self.syn["utility"].x_offset + 86), (self.syn["utility"].y_offset + 2), self.syn["utility"].color[4], 1, 10);
	self.syn["controls-hud"]["title"][1] = self create_text("______", self.syn["utility"].font, self.syn["utility"].font_scale * 1.5, "left", "CENTER", (self.syn["utility"].x_offset + 4), (self.syn["utility"].y_offset - 4), self.syn["utility"].color[5], 1, 10);
	self.syn["controls-hud"]["title"][2] = self create_text("______", self.syn["utility"].font, self.syn["utility"].font_scale * 1.5, "left", "CENTER", (self.syn["utility"].x_offset + 157), (self.syn["utility"].y_offset - 4), self.syn["utility"].color[5], 1, 10);
	
	self.syn["controls-hud"]["background"][0] = self create_shader("white", "left", "CENTER", self.syn["utility"].x_offset - 1, (self.syn["utility"].y_offset - 1), 202, 97, self.syn["utility"].color[5], 1, 1);
	self.syn["controls-hud"]["background"][1] = self create_shader("white", "left", "CENTER", (self.syn["utility"].x_offset), self.syn["utility"].y_offset, 200, 95, self.syn["utility"].color[1], 1, 2);
	
	self.syn["controls-hud"]["controls"][0] = self create_text("Open: ^3[{+speed_throw}] ^7and ^3[{+melee}]", self.syn["utility"].font, 1, "left", "CENTER", (self.syn["utility"].x_offset + 5), (self.syn["utility"].y_offset + 15), self.syn["utility"].color[4], 1, 10);
	self.syn["controls-hud"]["controls"][1] = self create_text("Scroll: ^3[{+speed_throw}] ^7and ^3[{+attack}]", self.syn["utility"].font, 1, "left", "CENTER", (self.syn["utility"].x_offset + 5), (self.syn["utility"].y_offset + 35), self.syn["utility"].color[4], 1, 10);
	self.syn["controls-hud"]["controls"][2] = self create_text("Select: ^3[{+activate}] ^7Back: ^3[{+melee}]", self.syn["utility"].font, 1, "left", "CENTER", (self.syn["utility"].x_offset + 5), (self.syn["utility"].y_offset + 55), self.syn["utility"].color[4], 1, 10);
	self.syn["controls-hud"]["controls"][3] = self create_text("Sliders: ^3[{+smoke}] ^7and ^3[{+frag}]", self.syn["utility"].font, 1, "left", "CENTER", (self.syn["utility"].x_offset + 5), (self.syn["utility"].y_offset + 75), self.syn["utility"].color[4], 1, 10);
	
	wait 8;
	
	close_controls_menu();
}

close_controls_menu() {
	self.syn["controls-hud"] destroy();
	self.syn["controls-hud"]["title"][0] destroy();
	self.syn["controls-hud"]["title"][1] destroy();
	self.syn["controls-hud"]["title"][2] destroy();
	
	self.syn["controls-hud"]["background"][0] destroy();
	self.syn["controls-hud"]["background"][1] destroy();
	self.syn["controls-hud"]["foreground"][0] destroy();
	
	self.syn["controls-hud"]["controls"][0] destroy();
	self.syn["controls-hud"]["controls"][1] destroy();
	self.syn["controls-hud"]["controls"][2] destroy();
	self.syn["controls-hud"]["controls"][3] destroy();
}

menu_index() {
	menu = self get_menu();
	if(!isDefined(menu)) {
		menu = "Empty Menu";
	}
	
	switch(menu) {
		case "Synergy":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86;
			
			self add_option("Basic Options", ::new_menu, "Basic Options");
			self add_option("Account Options", ::new_menu, "Account Options");
			self add_option("Weapon Options", ::new_menu, "Weapon Options");
			self add_option("Zombie Options", ::new_menu, "Zombie Options");
			self add_option("Visual Options", ::new_menu, "Visual Options");
			self add_option("Teleport Options", ::new_menu, "Teleport Options");
			self add_option("Debug Options", ::new_menu, "Debug Options");
			
			break;
		case "Basic Options":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - (menu.size - 1);
			
			self add_toggle("God Mode", ::god_mode, self.god_mode);
			self add_toggle("No Clip", ::no_clip, self.no_clip);
			self add_toggle("UFO", ::ufo_mode, self.ufo_mode);
			self add_toggle("Infinite Ammo", ::infinite_ammo, self.infinite_ammo);
			
			self add_option("Give Perks", ::new_menu, "Give Perks");
			self add_option("Take Perks", ::new_menu, "Take Perks");
			self add_option("Give Perma Perkaholic", ::give_perkaholic);
			
			self add_increment("Set Points", ::set_points, 100, 100, 100000, 100);
			
			break;
		case "Account Options":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu.size;
			
			self add_increment("Set Prestige", ::set_prestige, 0, 0, 20, 1);
			self add_increment("Set Level", ::set_rank, 1, 1, 999, 1);
			
			break;
		case "Weapon Options":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu.size;
			
			self add_toggle("Double Pack-a-Punch", ::double_pack, self.double_pack);
			self add_toggle("Mystery Wheel Pack-a-Punch", ::upgraded_box_weapons, self.upgraded_box_weapons);
			self add_toggle("Mystery Wheel Double Pack-a-Punch", ::double_upgraded_box_weapons, self.double_upgraded_box_weapons);
			
			self add_toggle("Give Pack-a-Punched Weapons", ::give_packed_weapon, self.give_packed_weapon);
			self add_toggle("Give Double Pack-a-Punched Weapons", ::give_double_packed_weapon, self.give_double_packed_weapon);
			
			self add_option("Give Weapons", ::new_menu, "Give Weapons");
			self add_option("Take Current Weapon", ::take_weapon);
			
			break;
		case "Zombie Options":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu.size;
			
			self add_toggle("One Shot Zombies", ::one_shot_zombies, self.one_shot_zombies);
			self add_toggle("Freeze Zombies", ::freeze_zombies, self.freeze_zombies);
			
			self add_option("Spawn Zombies", ::new_menu, "Spawn Zombies");
			self add_option("Kill All Zombies", ::kill_all_zombies);
			self add_option("Teleport Zombies to Me", ::teleport_zombies);
			
			break;
		case "Visual Options":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu.size;
			
			self add_toggle("Fullbright", ::fullbright, self.fullbright);
			self add_toggle("Third Person", ::third_person, self.third_person);
			
			self add_option("Visions", ::new_menu, "Visions");
			
			break;
		case "Visions":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu.size;
			
			for(i = 0; i < self.syn["visions"].size; i++) {
				self add_option(self.syn["visions"][i], ::set_vision, self.syn["visions"][i]);
			}

			break;
		case "Spawn Zombies":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu.size;
			
			map = level.mapName;
			
			for(i = 0; i < self.syn["zombies"][map][0].size; i++) {
				self add_option("Spawn " + self.syn["zombies"][map][1][i], ::spawn_zombie, self.syn["zombies"][map][0][i], self.syn["zombies"][map][2][i]);
			}
			
			break;
		case "Teleport Options":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu.size;
			
			map = level.mapName;
			
			for(i = 0; i < self.syn["Main Teleports"][map][0].size; i++) {
				self add_option(self.syn["Main Teleports"][map][0][i], ::set_position, self.syn["Main Teleports"][map][1][i], (0, self.syn["Main Teleports"][map][2][i], 0));
			}
			
			if(isDefined(self.syn["Map Setup Teleports"][map][0])) {
				self add_option("Map Setup Teleports", ::new_menu, "Map Setup Teleports");
			}
			if(isDefined(self.syn["Mystery Wheel Teleports"][map][0])) {
				self add_option("Mystery Wheel Teleports", ::new_menu, "Mystery Wheel Teleports");
			}
			if(isDefined(self.syn["Main Quest Teleports"][map][0])) {
				self add_option("Main Quest Teleports", ::new_menu, "Main Quest Teleports");
			}
			if(isDefined(self.syn["Extra Teleports"][map][0])) {
				self add_option("Extra Teleports", ::new_menu, "Extra Teleports");
			}
			
			break;
		case "Map Setup Teleports":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu.size;
			
			map = level.mapName;
			
			for(i = 0; i < self.syn["Map Setup Teleports"][map][0].size; i++) {
				self add_option(self.syn["Map Setup Teleports"][map][0][i], ::set_position, self.syn["Map Setup Teleports"][map][1][i], (0, self.syn["Map Setup Teleports"][map][2][i], 0));
			}
			
			break;
		case "Mystery Wheel Teleports":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu.size;
			
			map = level.mapName;
			
			for(i = 0; i < self.syn["Mystery Wheel Teleports"][map][0].size; i++) {
				self add_option(self.syn["Mystery Wheel Teleports"][map][0][i], ::set_position, self.syn["Mystery Wheel Teleports"][map][1][i], (0, self.syn["Mystery Wheel Teleports"][map][2][i], 0));
			}
			
			break;
		case "Main Quest Teleports":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu.size;
			
			map = level.mapName;
			
			for(i = 0; i < self.syn["Main Quest Teleports"][map][0].size; i++) {
				self add_option(self.syn["Main Quest Teleports"][map][0][i], ::set_position, self.syn["Main Quest Teleports"][map][1][i], (0, self.syn["Main Quest Teleports"][map][2][i], 0));
			}
			
			break;
		case "Extra Teleports":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu.size;
			
			map = level.mapName;
			
			for(i = 0; i < self.syn["Extra Teleports"][map][0].size; i++) {
				self add_option(self.syn["Extra Teleports"][map][0][i], ::set_position, self.syn["Extra Teleports"][map][1][i], (0, self.syn["Extra Teleports"][map][2][i], 0));
			}
			
			break;
		case "Give Perks":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - (menu.size - 5);
			
			map = level.mapName;
			
			for(i = 0; i < self.syn["perks"][0].size; i++) {
				self add_option(self.syn["perks"][1][i], ::give_zombies_perk, self.syn["perks"][0][i], 0);
			}
			
			if(map == "cp_disco" || map == "cp_town" || map == "cp_final") {
				for(i = 0; i < self.syn["perks"][map][0].size; i++) {
					self add_option(self.syn["perks"][map][1][i], ::give_zombies_perk, self.syn["perks"][map][0][i], 0);
				}
			}

			break;
		case "Take Perks":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - (menu.size - 5);
			
			map = level.mapName;
			
			for(i = 0; i < self.syn["perks"][0].size; i++) {
				self add_option(self.syn["perks"][1][i], ::take_zombies_perk, self.syn["perks"][0][i]);
			}
			
			if(map == "cp_disco" || map == "cp_town" || map == "cp_final") {
				for(i = 0; i < self.syn["perks"][map][0].size; i++) {
					self add_option(self.syn["perks"][map][1][i], ::take_zombies_perk, self.syn["perks"][map][0][i], 0);
				}
			}

			break;
		case "Give Weapons":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu.size;
			
			for(i = 0; i < self.syn["weapons"]["category"].size; i++) {
				self add_option(self.syn["weapons"]["category"][i], ::new_menu, self.syn["weapons"]["category"][i]);
			}
			
			break;
		case "Assault Rifles":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu.size;
			
			category = "assault_rifles";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], ::give_weapon, self.syn["weapons"][category][0][i], category, i);
			}
			
			break;
		case "Sub Machine Guns":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu.size;
			
			category = "sub_machine_guns";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], ::give_weapon, self.syn["weapons"][category][0][i], category, i);
			}
			
			break;
		case "Light Machine Guns":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu.size;
			
			category = "light_machine_guns";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], ::give_weapon, self.syn["weapons"][category][0][i], category, i);
			}
			
			break;
		case "Sniper Rifles":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu.size;
			
			category = "sniper_rifles";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], ::give_weapon, self.syn["weapons"][category][0][i], category, i);
			}
			
			break;
		case "Shotguns":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu.size;
			
			category = "shotguns";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], ::give_weapon, self.syn["weapons"][category][0][i], category, i);
			}
			
			break;
		case "Pistols":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu.size;
			
			category = "pistols";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], ::give_weapon, self.syn["weapons"][category][0][i], category, i);
			}
			
			break;
		case "Launchers":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu.size;
			
			category = "launchers";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], ::give_weapon, self.syn["weapons"][category][0][i], category, i);
			}
			
			break;
		case "Classic Weapons":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu.size;
			
			category = "classics";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], ::give_weapon, self.syn["weapons"][category][0][i], category, i);
			}
			
			break;
		case "Melee Weapons":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu.size;
			
			category = "melees";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], ::give_weapon, self.syn["weapons"][category][0][i], category, i);
			}
			
			break;
		case "Map Specific Weapons":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu.size;
			
			category = level.mapName;
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], ::give_weapon, self.syn["weapons"][category][0][i], category, i);
			}
			
			break;
		case "Other Weapons":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu.size;
			
			category = "other";
			
			for(i = 0; i < self.syn["weapons"][category][0].size; i++) {
				self add_option(self.syn["weapons"][category][1][i], ::give_weapon, self.syn["weapons"][category][0][i], category, i);
			}
			
			break;
		case "Empty Menu":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - menu.size;
			
			self add_option("Unassigned Menu");
			break;
	}
}

get_map_name() {
	level.mapName = getDvar("mapname");
}

god_mode() {
	self.god_mode = !return_toggle(self.god_mode);
	executeCommand("god");
	wait .01;
	if(self.god_mode) {
		self iPrintln("God Mode [^2ON^7]");
	} else {
		self iPrintln("God Mode [^1OFF^7]");
	}
}

no_clip() {
	self.no_clip = !return_toggle(self.no_clip);
	executeCommand("noclip");
	wait .01;
	if(self.no_clip) {
		self iPrintln("No Clip [^2ON^7]");
	} else {
		self iPrintln("No Clip [^1OFF^7]");
	}
}

ufo_mode() {
	self.ufo_mode = !return_toggle(self.ufo_mode);
	executeCommand("ufo");
	wait .01;
	if(self.ufo_mode) {
		self iPrintln("UFO Mode [^2ON^7]");
	} else {
		self iPrintln("UFO Mode [^1OFF^7]");
	}
}

infinite_ammo() {
	self.infinite_ammo = !return_toggle(self.infinite_ammo);
	if(self.infinite_ammo) {
		self iPrintln("Infinite Ammo [^2ON^7]");
		enable_infinite_ammo(self.infinite_ammo);
		self thread infinite_ammo_loop();
	} else {
		self iPrintln("Infinite Ammo [^1OFF^7]");
		enable_infinite_ammo(self.infinite_ammo);
		self notify("stop_infinite_ammo");
	}
}

infinite_ammo_loop() {
	self endOn("stop_infinite_ammo");
	self endOn("game_ended");
	
	for(;;) {
		self setWeaponAmmoClip(self getCurrentWeapon(), 999);
		self setWeaponAmmoClip(self getCurrentWeapon(), 999, "left");
		self setWeaponAmmoClip(self getCurrentWeapon(), 999, "right");
		wait .2;
	}
}

give_perkaholic() {
	give_gns_base_reward(self);
}

set_points(value) {
	self setPlayerData("cp","alienSession", "currency", value);
}

set_tickets(value) {
	self playLocalSound("zmb_ui_earn_tickets");
	self setClientOmnVar("zombie_number_of_ticket", int(value));
}

set_prestige(value){
	self setPlayerData("cp","progression","playerLevel","prestige", value);
}

set_rank(value) {
	value--;
	self setPlayerData("cp", "progression", "playerLevel", "xp", Int(TableLookup("cp/zombies/rankTable.csv", 0, value, (value == Int(TableLookup("cp/zombies/rankTable.csv", 0, "maxrank", 1))) ? 7 : 2)));
}

double_pack() {
	self.double_pack = !return_toggle(self.double_pack);
	if(self.double_pack) {
		self iPrintln("Double Pack-a-Punch [^2ON^7]");
		level.pap_max++;
	} else {
		self iPrintln("Double Pack-a-Punch [^1OFF^7]");
		level.pap_max--;
	}
}

upgraded_box_weapons() {
	self.upgraded_box_weapons = !return_toggle(self.upgraded_box_weapons);
	if(self.upgraded_box_weapons) {
		self iPrintln("Mystery Wheel Pack-a-Punch [^2ON^7]");
		level.magic_wheel_upgraded_pap1 = 1;
	} else {
		self iPrintln("Mystery Wheel Pack-a-Punch [^1OFF^7]");
		level.magic_wheel_upgraded_pap1 = 0;
	}
}

double_upgraded_box_weapons() {
	self.double_upgraded_box_weapons = !return_toggle(self.double_upgraded_box_weapons);
	if(self.double_upgraded_box_weapons) {
		self iPrintln("Mystery Wheel Double Pack-a-Punch [^2ON^7]");
		level.magic_wheel_upgraded_pap2 = 1;
	} else {
		self iPrintln("Mystery Wheel Double Pack-a-Punch [^1OFF^7]");
		level.magic_wheel_upgraded_pap2 = 0;
	}
}

give_packed_weapon() {
	self.give_packed_weapon = !return_toggle(self.give_packed_weapon);
	if(isDefined(self.give_double_packed_weapon) && self.give_double_packed_weapon == true) {
		self.give_double_packed_weapon = !return_toggle(self.give_double_packed_weapon);
	}
}

give_double_packed_weapon() {
	self.give_double_packed_weapon = !return_toggle(self.give_double_packed_weapon);
	if(isDefined(self.give_packed_weapon) && self.give_packed_weapon == true) {
		self.give_packed_weapon = !return_toggle(self.give_packed_weapon);
	}
}

give_weapon(weapon, category, index) {
	if(isDefined(self.give_packed_weapon) && self.give_packed_weapon == 1 || isDefined(self.give_double_packed_weapon) && self.give_double_packed_weapon == 1) {
		papText = "";
		papCamo = "";
		papLevel = "";
		if(self.give_packed_weapon == 1) {
			papText = "pap1";
			papCamo = self.syn["camos"][level.mapName][0];
			papLevel = "1";
		} else if(self.give_double_packed_weapon == 1) {
			papText = "pap2";
			papCamo = self.syn["camos"][level.mapName][1];
			papLevel = "2";
		}
	
		if(weapon == "iw7_axe_zm") {
			weapon = "iw7_axe_zm_pap" + papLevel + "+axe" + papText;
		} else if(weapon == "iw7_forgefreeze_zm+forgefreezealtfire") {
			weapon = "iw7_forgefreeze_zm_pap" + papLevel + "+freeze" + papText + papCamo + "+forgefreezealtfire";
		} else if(self.syn["weapons"][category][3][index] != "") {
			weapon += "+" + self.syn["weapons"][category][2][index] + papText + self.syn["weapons"][category][3][index] + papCamo;
		} else {
			weapon += "+" + self.syn["weapons"][category][2][index] + papText + papCamo;
		}
	} else {
		if(self.syn["weapons"][category][3][index] != "") {
			weapon += self.syn["weapons"][category][3][index];
		}
	}
	
	if(self getCurrentWeapon() != weapon && self getWeaponsListPrimaries()[1] != weapon && self getWeaponsListPrimaries()[2] != weapon && self getWeaponsListPrimaries()[3] != weapon) {
		if(self getWeaponsListPrimaries().size >= 3) {
			self takeWeapon(self getCurrentWeapon());
		}
		
		self giveWeapon(return_weapon_name_with_like_attachments(weapon));
		self switchToWeapon(return_weapon_name_with_like_attachments(weapon));
	} else {
		self switchToWeaponImmediate(return_weapon_name_with_like_attachments(weapon));
	}
}

take_weapon(weapon_name) {
	self takeWeapon(self getCurrentWeapon());
	self switchToWeapon(self getWeaponsListPrimaries()[1]);
}

get_zombies() {
	return scripts\cp\cp_agent_utils::getAliveAgentsOfTeam("axis");
}

kill_all_zombies() {
	forEach(zombie in get_zombies()) {
		zombie doDamage(zombie.health + 999, zombie.origin, self, self, "MOD_EXPLOSIVE", "iw7_walkietalkie_zm");
	}
}

spawn_zombie(archetype, team) {
	scripts\mp\mp_agent::spawnNewAgent(archetype, team, self.origin + (0, 200, 0), self.angles);
}

one_shot_zombies() {
	if(!isDefined(self.one_shot_zombies)) {
		self.one_shot_zombies = true;
		zombies = get_zombies();
		level.prevHealth = zombies[0].health;
		while(isDefined(self.one_shot_zombies)) {
			forEach(zombie in get_zombies()) {
				zombie.maxHealth = 1;
				zombie.health	= zombie.maxHealth;
			}
			wait 0.01;
		}
	} else {
		self.one_shot_zombies = undefined;
		forEach(zombie in get_zombies()) {
			zombie.maxHealth = level.prevHealth;
			zombie.health	= level.prevHealth;
		}
	}
}

freeze_zombies() {
	if(!isDefined(self.freeze_zombies)) {
		self.freeze_zombies = true;
		while(isDefined(self.freeze_zombies)) {
			forEach(zombie in get_zombies()) {
				zombie freezeControls(true);
			}
			wait 0.01;
		}
	} else {
		self.freeze_zombies = undefined;
		forEach(zombie in get_zombies()) {
			zombie freezeControls(false);
		}
	}
}

teleport_zombies() {
	forEach(zombie in get_zombies()) {
		zombie setOrigin(self.origin + (20, 200, 20));
	}
}

fullbright() {
	self.fullbright = !return_toggle(self.fullbright);
	if(self.fullbright) {
		executeCommand("r_fullbright 1");
		wait .01;
		self iPrintln("Fullbright [^2ON^7]");
	} else {
		executeCommand("r_fullbright 0");
		wait .01;
		self iPrintln("Fullbright [^1OFF^7]");
	}
}

third_person() {
	self.third_person = !return_toggle(self.third_person);
	if(self.third_person) {
		self iPrintln("UFO Mode [^2ON^7]");
		executeCommand("camera_thirdPerson 1");
		setThirdPersonDOF(1);
	} else {
		self iPrintln("UFO Mode [^1OFF^7]");
		executeCommand("camera_thirdPerson 0");
		setThirdPersonDOF(0);
	}
}

set_vision(vision) {
	self visionSetNakedForPlayer("ac130_enhanced_mp", 0.1);
	wait .1;
	self visionSetNakedForPlayer(vision, 0.1);
}

set_position(origin, angles) {
	self setOrigin(origin);
	self setPlayerAngles(angles);
}