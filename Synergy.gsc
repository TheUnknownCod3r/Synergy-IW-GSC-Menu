#include scripts\cp\maps\cp_zmb\cp_zmb_ghost_wave;
#include scripts\cp\utility;

init() {
	level thread onPlayerConnect();
}

on_event() {
	self endon("disconnect");
	self.syn = [];
	self.syn["user"] = spawnstruct();
	while (true) {
		self.syn["user"].spawn_origin = self.origin;
		self.syn["user"].spawn_angles = self.angles;
		if(!isdefined(self.syn["user"].has_menu)) {
			self.syn["user"].has_menu = true;
			if(!return_toggle(level.private_match)) {
				self.access = self is_moderator() ? "Moderator" : undefined;
				if(!isdefined(self.access)) {
					return;
				}
			}
			
			self initial_variable();
			self thread initial_monitor();
		}
		break;
	}
}

on_ended() {
	level waittill("game_ended");
	if(self in_menu()) {
		self close_menu();
	}
	
	level notify("on_close_ended");
	level endon("on_close_ended");
	if(return_toggle(level.debug_leave)) {
		exitlevel(false);
	}
}

return_toggle(variable) {
	return isdefined(variable) && variable;
}

really_alive() {
	return isalive(self) && !return_toggle(self.laststand);
}

is_moderator() {
	for(i = 0; i < level.guid_list.size; i++) {
		if(self.guid == level.guid_list[i]) {
			return true;
		}
	}
	
	return false;
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
	if(isdefined(menu)) {
		self.syn["menu"] = menu;
	}
}

set_cursor(cursor, menu) {
	if(isdefined(cursor)) {
		self.cursor[isdefined(menu) ? menu : self get_menu()] = cursor;
	}
}

set_title(title) {
	if(isdefined(title)) {
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
	if(!isdefined(function)) {
		return;
	}
	
	if(isdefined(argument_4)) {
		return self thread [[function]](argument_1, argument_2, argument_3, argument_4);
	}
	
	if(isdefined(argument_3)) {
		return self thread [[function]](argument_1, argument_2, argument_3);
	}
	
	if(isdefined(argument_2)) {
		return self thread [[function]](argument_1, argument_2);
	}
	
	if(isdefined(argument_1)) {
		return self thread [[function]](argument_1);
	}
	
	return self thread [[function]]();
}

set_slider(scrolling, index) {
	menu = self get_menu();
	index = isdefined(index) ? index : self get_cursor();
	storage = (menu + "_" + index);
	if(!isdefined(self.slider[storage])) {
		self.slider[storage] = isdefined(self.structure[index].array) ? 0 : self.structure[index].start;
	}
	
	if(isdefined(self.structure[index].array)) {
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
		
		if (!self.structure[index].sliderText) {
			self.syn["hud"]["slider"][0][index] set_text(self.structure[index].array[self.slider[storage]]);
		} else {
			self.syn["hud"]["slider"][0][index] set_text(convert_weapon_names(level.weaponArray[self.structure[index].array[self.slider[storage]]]));
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
		
		if (!self.structure[index].sliderText) {
			self.syn["hud"]["slider"][0][index] setvalue(self.slider[storage]);
		} else {
			self.syn["hud"]["slider"][0][index] settext(convert_weapon_names(level.weaponArray[self.slider[storage]]));
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
	if(isdefined(self.structure) && self.structure.size) {
		for(i = 0; i < self.structure.size; i++) {
			if(player.structure[cursor].text == self.structure[i].text && self get_menu() == menu) {
				return true;
			}
		}
	}

	return false;
}

create_text(text, font, font_scale, alignX, alignY, x, y, color, alpha, zIndex) {
	textElement = newhudelem();
	textElement.font = font;
	textElement.fontscale = font_scale;
	textElement.alpha = alpha;
	textElement.sort = zIndex;
	textElement.archived = false;
	textElement.foreground = true;
	textElement.hidewheninmenu = true;
	
	textElement.x = x;
	textElement.y = y;
	textElement.alignx = alignX;
	textElement.aligny = alignY;
	textElement.horzalign = alignX;
	textElement.vertalign = alignY;
	
	if (color != "rainbow") {
		textElement.color = color;
	} else {
		textElement.color = level.rainbowColour;
		textElement thread start_rainbow();
	}
	
	if(isnumber(text)) {
		textElement setvalue(text);
	} else {
		textElement set_text(text);
	}
	
	return textElement;
}

set_text(text) {
	if(!isdefined(self) || !isdefined(text)) {
		return;
	}
	
	self.text = text;
	self settext(text);
}

create_shader(shader, alignX, alignY, x, y, width, height, color, alpha, zIndex) {
	shaderElement = newHudElem();
	shaderElement.elemtype = "icon";
	shaderElement.children = [];
	shaderElement.alpha = alpha;
	shaderElement.sort = zIndex;
	shaderElement.archived = true;
	shaderElement.foreground = true;
	shaderElement.hidden = false;
	shaderElement.hidewheninmenu = true;
	
	shaderElement.x = x;
	shaderElement.y = y;
	shaderElement.alignx = alignX;
	shaderElement.aligny = alignY;
	shaderElement.horzalign = alignX;
	shaderElement.vertalign = alignY;
	
	if (color != "rainbow") {
		shaderElement.color = color;
	} else {
		shaderElement.color = level.rainbowColour;
		shaderElement thread start_rainbow();
	}
	
	shaderElement set_shader(shader, width, height);
	
	return shaderElement;
}

set_shader(shader, width, height) {
	if(!isdefined(shader)) {
		if(!isdefined(self.shader)) {
			return;
		}
	
		shader = self.shader;
	}
	
	if(!isdefined(width)) {
		if(!isdefined(self.width)) {
			return;
		}
	
		width = self.width;
	}
	
	if(!isdefined(height)) {
		if(!isdefined(self.height)) {
			return;
		}
	
		height = self.height;
	}
	
	self.shader = shader;
	self.width = width;
	self.height = height;
	self setshader(shader, width, height);
}

hud_move_x(x, time) {
	self moveovertime(time);
	self.x = x;
	wait time;
}

hud_move_y(y, time) {
	self moveovertime(time);
	self.y = y;
	wait time;
}

hud_move_xy(x, y, time) {
	self moveovertime(time);
	self.x = x;
	self.y = y;
	wait time;
}

hud_fade(alpha, time) {
	self fadeovertime(time);
	self.alpha = alpha;
	wait time;
}

hud_fade_destroy(alpha, time) {
	self hud_fade(alpha, time);
	self destroy();
}

hud_fade_color(color, time) {
	self fadeovertime(time);
	self.color = color;
}

hud_scale_over_time(time, width, height) {
	self scaleovertime(time, width, height);
	self.width  = width;
	self.height = height;
	wait time;
}

font_scale_over_time(scale, time) {
	self changefontscaleovertime(time);
	self.fontscale = scale;
}

clear_all(array) {
	if(!isdefined(array)) {
		return;
	}
	
	keys = getarraykeys(array);
	for(a = 0; a < keys.size; a++) {
		if(isarray(array[keys[a]])) {
			foreach(value in array[keys[a]])
				if( isdefined(value)) {
					value destroy();
				}
		} else {
			if(isdefined(array[keys[a]])) {
				array[keys[a]] destroy();
			}
		}
	}
}

add_menu(title, shader) {
	if(isdefined(title)) {
		self set_title(title);
	}

	if(isdefined(shader)) {
		self.shader_option[self get_menu()] = true;
	}

	self.structure = [];
}

add_option(text, function, argument_1, argument_2, argument_3) {
	option = spawnstruct();
	option.text = text;
	option.function = function;
	option.argument_1 = argument_1;
	option.argument_2 = argument_2;
	option.argument_3 = argument_3;
	
	self.structure[self.structure.size] = option;
}

add_toggle(text, function, toggle, array, argument_1, argument_2, argument_3) {
	option = spawnstruct();
	option.text = text;
	option.function = function;
	option.toggle = return_toggle(toggle);
	option.argument_1 = argument_1;
	option.argument_2 = argument_2;
	option.argument_3 = argument_3;
	
	if(isdefined(array)) {
		option.slider = true;
		option.array  = array;
	}
	
	self.structure[self.structure.size] = option;
}

add_string(text, function, array, argument_1, argument_2, argument_3) {
	option = spawnstruct();
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
	option = spawnstruct();
	option.text = text;
	option.function = function;
	option.slider = true;
	option.sliderText = false;
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
	option = spawnstruct();
	option.text = text;
	option.function = function;
	option.slider = true;
	option.sliderText = true;
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
	option = spawnstruct();
	option.text = text;
	option.category = true;
	
	self.structure[self.structure.size] = option;
}

new_menu(menu) {
	if(!isdefined(menu)) {
		menu = self.previous[(self.previous.size - 1)];
		self.previous[(self.previous.size - 1)] = undefined;
	} else {
		self.previous[self.previous.size] = self get_menu();
	}
	
	self set_menu(menu);
	self clear_option();
	self create_option();
}

initial_precache () {
	foreach(index, shader in ["ui_arrow_right", "ui_scrollbar_arrow_right", "ui_scrollbar_arrow_left"]) {
		precacheshader(shader);
	}
}

initial_variable() {
	self.syn["utility"] = spawnstruct();
	self.syn["utility"].font = "objective";
	self.syn["utility"].font_scale = 0.7;
	self.syn["utility"].option_limit = 8;
	self.syn["utility"].option_spacing = 14;
	self.syn["utility"].x_offset = 600;
	self.syn["utility"].y_offset = 100;
	self.syn["utility"].element_list = ["text", "submenu", "toggle", "category", "slider", "sliderText"];
	
	level.weaponCategories = ["Assault Rifles", "Submachine Guns", "Light Machine Guns", "Shotguns", "Sniper Rifles", "Pistols", "Launchers", "Specials"];
	
	self.syn["weapons"] = [];
	self.syn["weapons"][0] = ["iw7_m4_zm", "iw7_sdfar_zm", "iw7_ar57_zm", "iw7_fmg_zm", "iw7_ake_zmr", "iw7_rvn_zm", "iw7_vr_zm", "iw7_gauss_zm", "iw7_erad_zm", "iw7_fhr_zm", "iw7_crb_zml", "iw7_ripper_zmr", "iw7_ump45_zml", "iw7_crdb_zm", "iw7_mp28_zm", "iw7_tacburst_zm", "iw7_sdflmg_zm", "iw7_mauler_zm", "iw7_lmg03_zm", "iw7_minilmg_zm", "iw7_unsalmg_zm", "iw7_kbs_zm", "iw7_m8_zm", "iw7_cheytac_zmr", "iw7_devastator_zm", "iw7_sonic_zmr", "iw7_sdfshotty_zm", "iw7_spas_zmr", "iw7_mod2187_zm", "iw7_emc_zm", "iw7_nrg_zm", "iw7_g18_zmr", "iw7_revolver_zm", "iw7_udm45_zm", "iw7_mag_zm", "iw7_lockon_zm", "iw7_glprox_zm", "iw7_chargeshot_zm", "iw7_venomx_zm", "iw7_knife_zm", "iw7_axe_zm", "iw7_katana_zm", "iw7_nunchucks_zm", "iw7_m1_zm", "iw7_forgefreeze_zm", "iw7_dischord_zm", "iw7_facemelter_zm", "iw7_headcutter_zm", "iw7_shredder_zm", "iw7_m1c_zm", "iw7_g18c_zm", "iw7_ump45c_zm", "iw7_spasc_zm", "iw7_arclassic_zm", "iw7_cheytacc_zm", "iw7_ba50cal_zm", "iw7_longshot_zm"];					 
	self.syn["weapons"][1] = ["NV4", "R3K", "KBAR-32", "Type-2", "Volk", "R-VN", "X-Con", "G-Rail", "Erad", "FHR-40", "Karma-45", "RPR Evo", "HVR", "VPR", "Trencher", "Raijin-EMX", "R.A.W.", "Mauler", "Titan", "Auger", "Atlas", "KBS Longbow", "EBR-800", "Widowmaker", "Reaver", "Banshee", "DCM-8", "Rack-9", "M.2187", "EMC", "Oni", "Kendall 44", "Hailstorm", "UDM", "Stallion 44", "Spartan SA3", "Howitzer", "P-Law", "Venom-X", "Knife", "Axe", "Katana", "Nunchucks", "DMR-1", "Forge Freeze", "Dischord", "Face Melter", "Head Cutter", "Shredder", "M1", "Hornet", "MacTav-45", "S-Ravage", "OSA", "TF-141", "Trek-50", "Proteus"];
	
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
	self endon("disconnect");
	level endon("game_ended");
	while(true) {
		if(self really_alive()) {
			if(!self in_menu()) {
				if(self adsbuttonpressed() && self meleebuttonpressed()) {
					if(return_toggle(self.syn["utility"].interaction)) {
						self playsoundtoplayer("entrance_sign_power_on_build", self);
					}
					
					close_controls_menu();
					
					self open_menu();
					wait .15;
				}
			} else {
				menu   = self get_menu();
				cursor = self get_cursor();
				if(self meleebuttonpressed()) {
					if(return_toggle(self.syn["utility"].interaction)) {
						self playsoundtoplayer(isdefined(self.previous[(self.previous.size - 1)]) ? "zmb_powerup_activate" : "zmb_powerup_activate", self);
					}
					
					if(isdefined(self.previous[(self.previous.size - 1)])) {
						self new_menu(self.previous[menu]);
					} else {
						self close_menu();
					}
					
					wait .15;
				}
				else if(self adsbuttonpressed() && !self attackbuttonpressed() || self attackbuttonpressed() && !self adsbuttonpressed()) {
					if(isdefined(self.structure) && self.structure.size >= 2) {
						if(return_toggle(self.syn["utility"].interaction)) {
							self playsoundtoplayer("zmb_powerup_activate", self);
						}
						
						scrolling = self attackbuttonpressed() ? 1 : -1;
						
						self set_cursor((cursor + scrolling));
						self update_scrolling(scrolling);
					}
					wait .25;
				}
				else if(self fragbuttonpressed() && !self secondaryoffhandbuttonpressed() || self secondaryoffhandbuttonpressed() && !self fragbuttonpressed()) {
					if(return_toggle(self.structure[cursor].slider)) {
						if(return_toggle(self.syn["utility"].interaction)) {
							self playsoundtoplayer("zmb_powerup_activate", self);
						}
						
						scrolling = self secondaryoffhandbuttonpressed() ? 1 : -1;
						
						self set_slider(scrolling);
					}
					wait .07;
				}
				else if(self usebuttonpressed()) {
					if(isdefined(self.structure[cursor].function)) {
						if(return_toggle(self.syn["utility"].interaction)) {
							self playsoundtoplayer(isdefined(self.structure[cursor].toggle) ? return_toggle(self.structure[cursor].toggle) ? "zmb_wheel_wpn_acquired" : "zmb_wheel_wpn_acquired" : "zmb_wheel_wpn_acquired", self);
						}
						
						if(return_toggle(self.structure[cursor].slider)) {
							self thread execute_function(self.structure[cursor].function, isdefined(self.structure[cursor].array) ? self.structure[cursor].array[self.slider[menu + "_" + cursor]] :self.slider[menu + "_" + cursor], self.structure[cursor].argument_1, self.structure[cursor].argument_2, self.structure[cursor].argument_3);
						} else {
							self thread execute_function(self.structure[cursor].function, self.structure[cursor].argument_1, self.structure[cursor].argument_2, self.structure[cursor].argument_3);
						}
						
						if(isdefined(self.structure[cursor].toggle)) {
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
	if(!isdefined(menu)) {
		menu = isdefined(self get_menu()) && self get_menu() != "Synergy" ? self get_menu() : "Synergy";
	}
	
	self.syn["hud"] = [];
	self.syn["hud"]["title"][0] = self create_text(self get_title(), self.syn["utility"].font, self.syn["utility"].font_scale, "left", "CENTER", (self.syn["utility"].x_offset + 86), (self.syn["utility"].y_offset + 2), self.syn["utility"].color[4], 1, 10);
	self.syn["hud"]["title"][1] = self create_shader("white", "left", "CENTER", (self.syn["utility"].x_offset + 4), (self.syn["utility"].y_offset + 6), 30, 1, self.syn["utility"].color[5], 1, 10);
	self.syn["hud"]["title"][2] = self create_shader("white", "left", "CENTER", (self.syn["utility"].x_offset + 166), (self.syn["utility"].y_offset + 6), 30, 1, self.syn["utility"].color[5], 1, 10);
			
	self.syn["hud"]["background"][0] = self create_shader("white", "left", "CENTER", self.syn["utility"].x_offset - 1, (self.syn["utility"].y_offset - 1), 202, 30, self.syn["utility"].color[5], 1, 1);
	self.syn["hud"]["background"][1] = self create_shader("white", "left", "CENTER", (self.syn["utility"].x_offset), self.syn["utility"].y_offset, 200, 28, self.syn["utility"].color[1], 1, 2);
	self.syn["hud"]["foreground"][0] = self create_shader("white", "left", "CENTER", (self.syn["utility"].x_offset), (self.syn["utility"].y_offset + 14), 200, 14, self.syn["utility"].color[2], 0.8, 3);
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
	self.syn["hud"]["title"][0] set_text(isdefined(title) ? title : self get_title());
}

create_option() {
	self clear_option();
	self menu_index();
	if(!isdefined(self.structure) || !self.structure.size) {
		self add_option("Currently No Options To Display");
	}
	
	if(!isdefined(self get_cursor())) {
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
	if(isdefined(self.structure) && self.structure.size) {
		limit = min(self.structure.size, self.syn["utility"].option_limit);
		for(i = 0; i < limit; i++) {
			index = (i + start);
			cursor = (self get_cursor() == index);
			color[0] = cursor ? self.syn["utility"].color[0] : self.syn["utility"].color[4];
			color[1] = return_toggle(self.structure[index].toggle) ? cursor ? self.syn["utility"].color[0] : self.syn["utility"].color[4] : cursor ? self.syn["utility"].color[2] : self.syn["utility"].color[3];
			if(isdefined(self.structure[index].function) && self.structure[index].function == ::new_menu) {
				self.syn["hud"]["submenu"][index] = self create_shader("ui_arrow_right", "left", "CENTER", (self.syn["utility"].x_offset + 192), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 19)), 4, 4, color[0], 1, 10);
			}
			
			if(isdefined(self.structure[index].toggle)) {
				self.syn["hud"]["toggle"][1][index] = self create_shader("white", "left", "CENTER", (self.syn["utility"].x_offset + 4), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 17)), 8, 8, color[1], 1, 10);
			}
			
			if(return_toggle(self.structure[index].slider)) {
				if(isdefined(self.structure[index].array)) {
					self.syn["hud"]["slider"][0][index] = self create_text(self.structure[index].array[self.slider[self get_menu() + "_" + index]], self.syn["utility"].font, self.syn["utility"].font_scale, "left", "CENTER", (self.syn["utility"].x_offset + 155), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 16)), color[0], 1, 10);
				} else {
					if(cursor) {
						self.syn["hud"]["slider"][0][index] = self create_text(self.slider[self get_menu() + "_" + index], self.syn["utility"].font, (self.syn["utility"].font_scale - 0.1), "left", "CENTER", (self.syn["utility"].x_offset + 155), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 17)), self.syn["utility"].color[4], 1, 10);
					}
				
					self.syn["hud"]["slider"][1][index] = self create_shader("white", "left", "CENTER", (self.syn["utility"].x_offset + 135), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 17)), 50, 8, cursor ? self.syn["utility"].color[2] : self.syn["utility"].color[1], 1, 8);
					self.syn["hud"]["slider"][2][index] = self create_shader("white", "left", "CENTER", (self.syn["utility"].x_offset + 149), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 17)), 8, 8, cursor ? self.syn["utility"].color[0] : self.syn["utility"].color[3], 1, 9);
				}
				
				self set_slider(undefined, index);
			}
			
			if(return_toggle(self.structure[index].category)) {
				self.syn["hud"]["category"][0][index] = self create_text(self.structure[index].text, self.syn["utility"].font, self.syn["utility"].font_scale, "left", "CENTER", (self.syn["utility"].x_offset + 88), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 17)), self.syn["utility"].color[0], 1, 10);
				self.syn["hud"]["category"][1][index] = self create_shader("white", "left", "CENTER", (self.syn["utility"].x_offset + 4), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 21)), 30, 1, self.syn["utility"].color[5], 1, 10);
				self.syn["hud"]["category"][2][index] = self create_shader("white", "left", "CENTER", (self.syn["utility"].x_offset + 166), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 21)), 30, 1, self.syn["utility"].color[5], 1, 10);
			}
			else {
				if(return_toggle(self.shader_option[self get_menu()])) {
					self.syn["hud"]["text"][index] = self create_shader(isdefined(self.structure[index].text) ? self.structure[index].text : "white", "left", "CENTER", (self.syn["utility"].x_offset + ((i * 20) - ((limit * 10) - 110))), (self.syn["utility"].y_offset + 27), isdefined(self.structure[index].argument_2) ? self.structure[index].argument_2 : 18, isdefined(self.structure[index].argument_3) ? self.structure[index].argument_3 : 18, isdefined(self.structure[index].argument_1) ? self.structure[index].argument_1 : (1, 1, 1), cursor ? 1 : 0.2, 10);
				} else {
					self.syn["hud"]["text"][index] = self create_text(return_toggle(self.structure[index].slider) ? self.structure[index].text + ":" : self.structure[index].text, self.syn["utility"].font, self.syn["utility"].font_scale, "left", "CENTER", isdefined(self.structure[index].toggle) ? (self.syn["utility"].x_offset + 15) : (self.syn["utility"].x_offset + 4), (self.syn["utility"].y_offset + ((i * self.syn["utility"].option_spacing) + 16)), color[0], 1, 10);
				}
			}
		}
		
		if(!isdefined(self.syn["hud"]["text"][self get_cursor()])) {
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
	if(return_toggle(self.shader_option[self get_menu()])) {
		if(!isdefined(self.syn["hud"]["arrow"][0])) {
			self.syn["hud"]["arrow"][0] = self create_shader("ui_scrollbar_arrow_left", "left", "CENTER", (self.syn["utility"].x_offset + 10), (self.syn["utility"].y_offset + 24), 6, 6, self.syn["utility"].color[4], 1, 10);
		}
	
		if(!isdefined(self.syn["hud"]["arrow"][1])) {
			self.syn["hud"]["arrow"][1] = self create_shader("ui_scrollbar_arrow_right", "left", "CENTER", (self.syn["utility"].x_offset + 190), (self.syn["utility"].y_offset + 24), 6, 6, self.syn["utility"].color[4], 1, 10);
		}
	
		self.syn["hud"]["foreground"][1] destroy();
		self.syn["hud"]["foreground"][2] destroy();
	} else {
		if(!isdefined(self.syn["hud"]["foreground"][1])) {
			self.syn["hud"]["foreground"][1] = self create_shader("white", "left", "CENTER", (self.syn["utility"].x_offset), (self.syn["utility"].y_offset + 14), 194, 14, self.syn["utility"].color[3], 1, 4);
		}
		
		if(!isdefined(self.syn["hud"]["foreground"][2])) {
			self.syn["hud"]["foreground"][2] = self create_shader("white", "left", "CENTER", (self.syn["utility"].x_offset + 201), (self.syn["utility"].y_offset + 14), 4, 14, self.syn["utility"].color[3], 1, 4);
		}
		
		self.syn["hud"]["arrow"][0] destroy();
		self.syn["hud"]["arrow"][1] destroy();
	}
	
	self.syn["hud"]["background"][0] set_shader(self.syn["hud"]["background"][0].shader, self.syn["hud"]["background"][0].width, return_toggle(self.shader_option[self get_menu()]) ? 42 : (height + 16));
	self.syn["hud"]["background"][1] set_shader(self.syn["hud"]["background"][1].shader, self.syn["hud"]["background"][1].width, return_toggle(self.shader_option[self get_menu()]) ? 40 : (height + 14));
	self.syn["hud"]["foreground"][0] set_shader(self.syn["hud"]["foreground"][0].shader, self.syn["hud"]["foreground"][0].width, return_toggle(self.shader_option[self get_menu()]) ? 26 : height);
	self.syn["hud"]["foreground"][2] set_shader(self.syn["hud"]["foreground"][2].shader, self.syn["hud"]["foreground"][2].width, adjust);
	
	if(isdefined(self.syn["hud"]["foreground"][1])) {
		self.syn["hud"]["foreground"][1].y = (self.syn["hud"]["text"][self get_cursor()].y - 2);
	}
	
	self.syn["hud"]["foreground"][2].y = (self.syn["utility"].y_offset + 14);
	if(self.structure.size > self.syn["utility"].option_limit) {
	    self.syn["hud"]["foreground"][2].y += (self get_cursor() / position);
	}
}

update_menu(menu, cursor) {
	if(isdefined(menu) && !isdefined(cursor) || !isdefined(menu) && isdefined(cursor)) {
		return;
	}
	
	if(isdefined(menu) && isdefined(cursor)) {
		foreach(player in level.players) {
			if(!isdefined(player) || !player in_menu()) {
				continue;
			}
		
			if(player get_menu() == menu || self != player && player check_option(self, menu, cursor)) {
				if(isdefined(player.syn["hud"]["text"][cursor]) || player == self && player get_menu() == menu && isdefined(player.syn["hud"]["text"][cursor]) || self != player && player check_option(self, menu, cursor)) {
					player create_option();
				}
			}
		}
	} else {
		if(isdefined(self) && self in_menu()) {
			self create_option();
		}
	}
}

rgb(r, g, b) {
	return (r/255, g/255, b/255);
}

create_rainbow_color() {
	x = 0; y = 0;
	r = 0; g = 0; b = 0;
	level.rainbowColour = (0, 0, 0);

	while(true) {
		if (y >= 0 && y < 255) {
			r = 255;
			g = 0;
			b = x;
		} else if (y >= 255 && y < 510) {
			r = 255 - x;
			g = 0;
			b = 255;
		} else if (y >= 510 && y < 765) {
			r = 0;
			g = x;
			b = 255;
		} else if (y >= 765 && y < 1020) {
			r = 0;
			g = 255;
			b = 255 - x;
		} else if (y >= 1020 && y < 1275) {
			r = x;
			g = 255;
			b = 0;
		} else if (y >= 1275 && y < 1530) {
			r = 255;
			g = 255 - x;
			b = 0;
		}

		x += 3;
		if (x >= 255) {
			x = 0;
		}

		y += 3;
		if (y > 1530) {
			y = 0;
		}

		level.rainbowColour = rgb(r, g, b);
		wait .05;
	}
}

start_rainbow() {
	while(IsDefined(self)) {
		self fadeOverTime(.05);
		self.color = level.rainbowColour;
		wait .05;
	}
}

onPlayerConnect() {
	for(;;) {
		level waittill("connected", player);
		if (self isHost()) {
			player.status = "Host";
		} else {
			player.status = "Unverified";
		}
		get_all_weapons();
		player thread onPlayerSpawned();
	}
}

onPlayerSpawned() {
	self endon("disconnect");
	level endon("game_ended");
	for(;;) {
		self waittill("spawned_player");
		if (isDefined(self.playerSpawned)) {
			continue;
		}
		self.playerSpawned = true;
		
		if(!isdefined(level.initial_setup)) {
			level.initial_setup = true;
		}
		
		self thread on_event();
		self thread on_ended();

		if (self isHost()) {
			self FreezeControls(false);
		}

		level thread create_rainbow_color();

		level thread create_text("SyndiShanX", "default", 1, "left", "top", 5, 10, "rainbow", 1, 3);

		if (self.status == "Host" || self.status == "Verified") {
			if (!self.menuInit) {
				open_controls_menu("Controls");
			}
		}
	}
}

open_controls_menu() {
	self.syn["controls-hud"] = [];
	self.syn["controls-hud"]["title"][0] = self create_text("Controls", self.syn["utility"].font, self.syn["utility"].font_scale, "left", "CENTER", (self.syn["utility"].x_offset + 86), (self.syn["utility"].y_offset + 2), self.syn["utility"].color[4], 1, 10);
	self.syn["controls-hud"]["title"][1] = self create_shader("white", "left", "CENTER", (self.syn["utility"].x_offset + 4), (self.syn["utility"].y_offset + 6), 30, 1, self.syn["utility"].color[5], 1, 10);
	self.syn["controls-hud"]["title"][2] = self create_shader("white", "left", "CENTER", (self.syn["utility"].x_offset + 166), (self.syn["utility"].y_offset + 6), 30, 1, self.syn["utility"].color[5], 1, 10);
	
	self.syn["controls-hud"]["background"][0] = self create_shader("white", "left", "CENTER", self.syn["utility"].x_offset - 1, (self.syn["utility"].y_offset - 1), 202, 97, self.syn["utility"].color[5], 1, 1);
	self.syn["controls-hud"]["background"][1] = self create_shader("white", "left", "CENTER", (self.syn["utility"].x_offset), self.syn["utility"].y_offset, 200, 95, self.syn["utility"].color[1], 1, 2);
	self.syn["controls-hud"]["foreground"][0] = self create_shader("white", "left", "CENTER", (self.syn["utility"].x_offset), (self.syn["utility"].y_offset + 14), 200, 81, self.syn["utility"].color[2], 0.8, 3);
	
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
	if(!isdefined(menu)) {
		menu = "Empty Menu";
	}
	
	switch(menu) {
		case "Synergy":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86;
			
			self add_option("Basic Options", ::new_menu, "Basic Options");
			self add_option("Account Options", ::new_menu, "Account Options");
			self add_option("Weapon Options", ::new_menu, "Weapon Options");
		
			break;
		case "Basic Options":
			self add_menu(menu);
			
			self.syn["hud"]["title"][0].x = self.syn["utility"].x_offset + 86 - (menu.size - 1);
			
			self add_toggle("God Mode", ::god_mode, self.god_mode);
			self add_toggle("No Clip", ::no_clip, self.no_clip);
			self add_toggle("UFO", ::ufo_mode, self.ufo_mode);
			self add_toggle("Infinite Ammo", ::infinite_ammo, self.infinite_ammo);
			
			self add_option("Give Perkaholic", ::give_perkalholic);
			
			self add_increment("Set Points", ::set_points, 100, 100, 100000, 100);
			self add_increment("Set Tickets", ::set_tickets, 100, 100, 100000, 100);
			
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

			self add_text_increment("Give Weapon", ::set_weapon, 0, 0, level.weaponArray.size - 1, 1);
			self add_option("Take Current Weapon", ::take_weapon);
			
			break;
		case "Empty Menu":
			self add_menu(menu);
			self add_option("Unassigned Menu");
			break;
	}
}

get_map_name() {
	level.mapName = getdvar("mapname");
}

god_mode() {
	self.god_mode = !return_toggle(self.god_mode);
	executecommand("god");
	wait .01;
	if(self.god_mode) {
		self iPrintln("God Mode [^2ON^7]");
	} else {
		self iPrintln("God Mode [^1OFF^7]");
	}
}

no_clip() {
	self.no_clip = !return_toggle(self.no_clip);
	executecommand("noclip");
	wait .01;
	if(self.no_clip) {
		self iPrintln("No Clip [^2ON^7]");
	} else {
		self iPrintln("No Clip [^1OFF^7]");
	}
}

ufo_mode() {
	self.ufo_mode = !return_toggle(self.ufo_mode);
	executecommand("ufo");
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
	self endon("stop_infinite_ammo");
	self endon("game_ended");
	
	for(;;) {
		self setweaponammoclip(self getcurrentweapon(), 999);
		self setweaponammoclip(self getcurrentweapon(), 999, "left");
		self setweaponammoclip(self getcurrentweapon(), 999, "right");
		wait .2;
	}
}

give_perkalholic() {
	give_gns_base_reward(self);
}

set_prestige(value){
	self setplayerdata("cp","progression","playerLevel","prestige", value);
}

set_rank(value) {
	value--;
	self SetPlayerData("cp", "progression", "playerLevel", "xp", Int(TableLookup("cp/zombies/rankTable.csv", 0, value, (value == Int(TableLookup("cp/zombies/rankTable.csv", 0, "maxrank", 1))) ? 7 : 2)));
}

take_weapon(weapon_name) {
	self takeweapon(self getcurrentweapon());
	self switchToWeapon(self getweaponslistprimaries()[1]);
}

set_weapon(value) {
	if(self getcurrentweapon() != level.weaponArray[value] && self getweaponslistprimaries()[1] != level.weaponArray[value] && self getweaponslistprimaries()[2] != level.weaponArray[value]) {
		if(self getweaponslistprimaries().size >= 3) {
			self takeweapon(self getcurrentweapon());
		}
		
		self giveweapon(level.weaponArray[value]);
		self switchToWeapon(level.weaponArray[value]);
	} else {
		self switchToWeapon(level.weaponArray[value]);
	}
}

get_all_weapons() {
	for(i = 0; i < 128; i++) {
		if(level.script == get_map_name()) {
			weapons_table = "cp/cp_weapontable.csv";
		} else {
			weapons_table = "cp/" + level.script + "_weapontable.csv";
		}

		internalname = tablelookupbyrow(weapons_table, i, 1);
		if(internalname == "") {
			continue;
		}

		level.weaponArray[level.weaponArray.size] = internalname;
	}
}

convert_weapon_names(weapon) {
	for(i = 0; i < self.syn["weapons"][0].size; i++) {
		if (weapon == self.syn["weapons"][0][i]) {
			return self.syn["weapons"][1][i];
		}
	}
	return weapon;
}

set_points(value) {
	self setplayerdata("cp","alienSession", "currency", value);
}

set_tickets(value) {
	self playlocalsound("zmb_ui_earn_tickets");
	self setClientOmnVar("zombie_number_of_ticket", value);
}