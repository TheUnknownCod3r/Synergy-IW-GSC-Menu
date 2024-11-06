/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\3028.gsc
***************************************/

_id_A298() {
  if (isdefined(level._id_A3B9))
  self [[level._id_A3B9._id_375D._id_444F]]();
}

_id_9640() {
  _id_F8A5();
  _id_FA3D();
  _id_0BDC::_id_19B8();

  if (_id_0BDC::_id_9CF5())
  _id_0BDC::_id_F43D("player");
  else if (isdefined(self._id_C0B0) && self._id_C0B0)
  _id_0BDC::_id_F43D("null");
  else if (self._id_01F1 == "tag_origin")
  _id_0BDC::_id_F43D("null");
  else if (issubstr(self.classname, "jackal_fake"))
  _id_0BDC::_id_F43D("fake");
  else
  _id_0BDC::_id_F43D("ai");

  self._id_5960 = 1;
  self setneargoalnotifydist(128.0);

  if (isdefined(self._id_0334)) {
  var_0 = scripts\engine\utility::_id_817E(self._id_0334, "targetname");

  if (isdefined(var_0))
  return;

  var_1 = _func_2CA(self._id_0334);

  if (isdefined(var_1))
  return;

  return;
  }
}

_id_F8A5() {
  self._id_9B4C = level.vehicle._id_116CE._id_155C[self.classname];
}

_id_FA3D() {
  self._id_9CB8 = level.vehicle._id_116CE._id_F216[self.classname];
}

_id_A329(var_0) {
  if (getdvarint("jackalHandbrakeMode"))
  level.player _meth_8009(0);

  level.player _id_0BCE::_id_A2B2(self, undefined, var_0);
  level.player setorigin((100000, 100000, 100000));
  level.player._id_D409 = self;
  _func_1C5("spaceship_disableViewModelNotetracks", 1);
}

_id_A2D9() {
  _func_1C5("spaceship_disableViewModelNotetracks", 0);

  if (getdvarint("jackalHandbrakeMode"))
  level.player _meth_8009(1);

  setomnvar("ui_jackal_hide_follow_pip", 1);
  level.player _id_0BCE::_id_A2B1(self);
}

_id_10492() {
  var_0 = spawnstruct();
  var_0._id_B8F9 = "sp";
  var_0._id_5F6C = ::_id_5F6C;
  var_0.init = ::_id_9640;
  _id_0BCE::main(var_0);
  _id_104AB();
  _id_104A5();
  _id_10496();
  _id_10498();
  _id_104A7();
  _id_104A8();

  if (level._id_A056._id_B323) {
  _id_104A4();
  _id_ABD7();
  }
}

_id_ABD7() {
  level._id_A056._id_3A02 = _id_0BD5::_id_3A02;
  level._id_A056._id_11543 = _id_0BDC::_id_105DB;
  level._id_A056._id_11540 = _id_0BDC::_id_105DA;
  level._id_A056._id_1151D = _id_0BDC::_id_105D2;
  level._id_A056._id_F389 = _id_0BDC::_id_F389;
  level._id_A056._id_B81C = _id_0BD5::_id_B81C;
  level._id_A056._id_A16E = _id_0BDC::_id_A16E;
  level._id_A056._id_A16D = _id_0BDC::_id_A2DF;
  level._id_A056._id_20A9 = _id_0BDC::_id_A079;
}

_id_10496() {
  level.player _id_0B91::_id_65E0("flag_player_landing_enabled");
  level.player _id_0B91::_id_65E0("flag_player_has_jackal");
  level.player _id_0B91::_id_65E0("flag_player_is_flying");
  level.player _id_0B91::_id_65E0("flag_takeoff_cooldown");
  level.player _id_0B91::_id_65E0("flag_player_is_landing");
  level.player _id_0B91::_id_65E0("disable_jackal_missiles");
  level.player _id_0B91::_id_65E0("disable_jackal_mode_switch");
  level.player _id_0B91::_id_65E0("disable_jackal_emp");
  level.player _id_0B91::_id_65E0("disable_jackal_juke");
  level.player _id_0B91::_id_65E0("disable_jackal_flares");
  level.player _id_0B91::_id_65E0("disable_jackal_dogfight");
  level.player _id_0B91::_id_65E0("disable_jackal_guns");
  level.player _id_0B91::_id_65E0("disable_jackal_weapon_switch");
  level.player _id_0B91::_id_65E0("disable_jackal_ads");
  level.player _id_0B91::_id_65E0("disable_jackal_roll");
  level.player _id_0B91::_id_65E0("disable_jackal_quickturn");
  level.player _id_0B91::_id_65E0("disable_jackal_HUD_horizon");
  level.player _id_0B91::_id_65E0("disable_jackal_lockon");
  level.player _id_0B91::_id_65E0("disable_jackal_pilot_assist");
  level.player _id_0B91::_id_65E0("disable_jackal_overheat");
  level.player _id_0B91::_id_65E0("disable_jackal_targetAid");
  level.player _id_0B91::_id_65E0("disable_jackal_targetAid_update");
  level.player _id_0B91::_id_65E0("disable_jackal_map_boundary_autoturn");
  level.player _id_0B91::_id_65E0("disable_jackal_map_boundary_warning");
  level.player _id_0B91::_id_65E0("disable_jackal_map_boundary_push");
  level.player _id_0B91::_id_65E0("disable_jackal_cockpit_VO");
  level.player _id_0B91::_id_65E0("disable_jackal_damage_vision_distortion");
  level.player _id_0B91::_id_65E0("jackal_cockpit_VO");
  level.player _id_0B91::_id_65E0("jackal_force_mode");
  level.player _id_0B91::_id_65E0("jackal_autoboost");
  level.player _id_0B91::_id_65E0("flag_player_dismounting");
  level.player _id_0B91::_id_65E0("jackal_hud_on");
  level.player _id_0B91::_id_65E0("jackal_enemy_homing_missile_allowed");
  level.player _id_0B91::_id_65E0("jackal_enemy_homing_missile_allowed_hyperaggressive");
  scripts\engine\utility::_id_6E39("flag_trip_new_hover_speed");
  scripts\engine\utility::_id_6E39("flag_trip_new_fly_speed");
  scripts\engine\utility::_id_6E39("flag_trip_new_juke_speed");
  scripts\engine\utility::_id_6E39("flag_trip_new_boost_scale");
  scripts\engine\utility::_id_6E39("flag_trip_new_turn_scale");
  scripts\engine\utility::_id_6E39("flag_player_on_runway");
  scripts\engine\utility::_id_6E39("player_jackal_drone_dock");
  scripts\engine\utility::_id_6E39("jackal_missile_drone_primed");
  scripts\engine\utility::_id_6E39("jackal_missile_drone_active");
  scripts\engine\utility::_id_6E39("jackal_taking_off");
  scripts\engine\utility::_id_6E39("jackal_reving_hint");
  scripts\engine\utility::_id_6E39("jackal_launching_hint");
  scripts\engine\utility::_id_6E39("jackal_ads_hint");
  scripts\engine\utility::_id_6E39("jackal_lockon_hint");
  scripts\engine\utility::_id_6E39("jackal_brake_hint");
  scripts\engine\utility::_id_6E39("jackal_boost_hint");
  scripts\engine\utility::_id_6E39("jackal_weapon_switch_hint");
  scripts\engine\utility::_id_6E39("jackal_land_hint");
  scripts\engine\utility::_id_6E39("jackal_juke_hint");
  scripts\engine\utility::_id_6E39("jackal_flare_hint");
  scripts\engine\utility::_id_6E39("jackal_noflare_hint");
  scripts\engine\utility::_id_6E39("jackal_missile_hint");
  scripts\engine\utility::_id_6E39("jackal_missile_lock_hint");
  scripts\engine\utility::_id_6E39("jackal_lose_lock_hint");
  scripts\engine\utility::_id_6E39("jackal_supply_drop_hint");
  scripts\engine\utility::_id_6E39("jackal_runway_hint");
  scripts\engine\utility::_id_6E39("jackal_runway_landing_active");
  scripts\engine\utility::_id_6E39("jackal_runway_first_attempt");
  scripts\engine\utility::_id_6E39("jackal_return_to_battle_hint");
  scripts\engine\utility::_id_6E39("jackal_sees_ret_for_landing");
  scripts\engine\utility::_id_6E39("jackal_can_takeoff");
  scripts\engine\utility::_id_6E39("jackal_hint_ret_launch");
  scripts\engine\utility::_id_6E39("jackal_hint_ret_return");
  scripts\engine\utility::_id_6E39("jackal_hint_ret_reapproach");
  scripts\engine\utility::_id_6E39("jackal_dogfight_hint");
  scripts\engine\utility::_id_6E39("jackal_missile_tutorial");
  scripts\engine\utility::_id_6E39("jackal_find_lockon");
  scripts\engine\utility::_id_6E39("jackal_landing_drone_detached");
  scripts\engine\utility::_id_6E39("jackal_landing_active");
  scripts\engine\utility::_id_6E39("jackal_landing_never_launch_drone");

  if (!scripts\engine\utility::_id_6E34("flag_jackal_in_landingzone"))
  scripts\engine\utility::_id_6E39("flag_jackal_in_landingzone");
}

_id_10498() {
  _id_0B91::_id_16EB("jackal_mount_hint", &"JACKAL_MOUNT", ::_id_A217);
  _id_0B91::_id_16EB("jackal_supply_drop", &"JACKAL_MARK_DROPZONE", ::_id_A220);
  _id_0B91::_id_16EB("jackal_takeoff", &"JACKAL_TAKEOFF", ::_id_A221);
  _id_0B91::_id_16EB("jackal_launch_rev", &"JACKAL_LAUNCH_REV", ::_id_A21D);
  _id_0B91::_id_16EB("jackal_launch_rev_pc", &"JACKAL_LAUNCH_REV_PC", ::_id_A21D);
  _id_0B91::_id_16EB("jackal_launch_start", &"JACKAL_LAUNCH_START", ::_id_A222);
  _id_0B91::_id_16EB("jackal_ads", &"JACKAL_ADS", ::_id_A209);
  _id_0B91::_id_16EB("jackal_lockon", &"JACKAL_LOCKON", ::_id_A213);
  _id_0B91::_id_16EB("jackal_brake", &"JACKAL_BRAKE", ::_id_A20C);
  _id_0B91::_id_16EB("jackal_boost", &"JACKAL_BOOST", ::_id_A20B);
  _id_0B91::_id_16EB("jackal_land", &"JACKAL_LAND", ::_id_A211);
  _id_0B91::_id_16EB("jackal_landing_scan", &"JACKAL_LANDING_SCAN", ::_id_A212);
  _id_0B91::_id_16EB("jackal_strike", &"JACKAL_STRIKE", ::_id_A21F);
  _id_0B91::_id_16EB("jackal_assault", &"JACKAL_ASSAULT", ::_id_A20A);
  _id_0B91::_id_16EB("jackal_weapon_switch", &"JACKAL_WEAP_SWITCH", ::_id_A223);
  _id_0B91::_id_16EB("jackal_missile", &"JACKAL_MISSILE", ::_id_A215);
  _id_0B91::_id_16EB("jackal_missile_lock", &"JACKAL_MISSILE_LOCK", ::_id_A216);
  _id_0B91::_id_16EB("jackal_find_lockon", &"JACKAL_FIND_LOCKON", ::_id_A20E);
  _id_0B91::_id_16EB("jackal_lose_lock", &"JACKAL_LOSE_LOCK", ::_id_A214);
  _id_0B91::_id_16EB("jackal_juke_hint", &"JACKAL_JUKE_HINT", ::_id_A210);
  _id_0B91::_id_16EB("jackal_flare_hint", &"JACKAL_FLARE_HINT", ::_id_A20F);
  _id_0B91::_id_16EB("jackal_runway_hint", &"JACKAL_LAND_RUNWAY", ::_id_A21E);
  _id_0B91::_id_16EB("jackal_runway_hint_inverted", &"JACKAL_LAND_RUNWAY_INVERTED", ::_id_A21E);
  _id_0B91::_id_16EB("jackal_return_to_battle", &"JACKAL_RETURN_TO_BATTLE", ::_id_A21C);
  _id_0B91::_id_16EB("jackal_launch_retribution", &"JACKAL_RET_LAUNCH", ::_id_A219);
  _id_0B91::_id_16EB("jackal_return_to_ret", &"JACKAL_HINT_RETURN", ::_id_A21B);
  _id_0B91::_id_16EB("jackal_hint_ret_reapproach", &"JACKAL_HINT_REAAPROACH", ::_id_A21A);
  _id_0B91::_id_16EB("jackal_hint_ret_approach", &"JACKAL_HINT_APPROACH", ::_id_A218);
  _id_0B91::_id_16EB("jackal_dogfight_hint", &"JACKAL_DOGFIGHT", ::_id_A20D);
}

_id_75E7(var_0, var_1) {
  var_2 = "";

  if (var_0 == "axis")
  var_2 = "_enemy";

  level._effect[var_0 + "_rearThrustBoost"] = loadfx("vfx/iw7/core/vehicle/jackal" + var_2 + "/vfx_jackal" + var_2 + "_rear_thrust_boost.vfx");
  level._effect[var_0 + "_rearThrustMax"] = loadfx("vfx/iw7/core/vehicle/jackal" + var_2 + "/vfx_jackal" + var_2 + "_rear_thrust_fly_atmosphere.vfx");
  level._effect[var_0 + "_rearThrustMax_space"] = loadfx("vfx/iw7/core/vehicle/jackal" + var_2 + "/vfx_jackal" + var_2 + "_rear_thrust_fly_space.vfx");
  level._effect[var_0 + "_rearThrustIdle"] = loadfx("vfx/iw7/core/vehicle/jackal" + var_2 + "/vfx_jackal" + var_2 + "_rear_thrust_idle_atmosphere.vfx");
  level._effect[var_0 + "_rearThrustIdle_space"] = loadfx("vfx/iw7/core/vehicle/jackal" + var_2 + "/vfx_jackal" + var_2 + "_rear_thrust_idle_space.vfx");
  level._effect[var_0 + "_vtolThrustCenter"] = loadfx("vfx/iw7/core/vehicle/jackal" + var_2 + "/vfx_jackal" + var_2 + "_vtol_center.vfx");
  level._effect[var_0 + "_vtolThrustSide"] = loadfx("vfx/iw7/core/vehicle/jackal" + var_2 + "/vfx_jackal" + var_2 + "_vtol_side.vfx");

  if (var_2 == "") {
  level._effect[var_0 + "_rearThrustLaunch_med"] = loadfx("vfx/iw7/core/vehicle/jackal" + var_2 + "/vfx_jackal" + var_2 + "_rear_thrust_launch_child_med.vfx");
  level._effect[var_0 + "_rearThrustLaunch_lrg"] = loadfx("vfx/iw7/core/vehicle/jackal" + var_2 + "/vfx_jackal" + var_2 + "_rear_thrust_launch_child_lrg.vfx");
  level._effect[var_0 + "_rearThrustLaunch_panels_blow_med"] = loadfx("vfx/iw7/core/vehicle/jackal" + var_2 + "/vfx_jackal" + var_2 + "_bottom_burst.vfx");
  level._effect[var_0 + "_rearThrustLaunch_charge_lrg"] = loadfx("vfx/iw7/core/vehicle/jackal" + var_2 + "/vfx_jackal" + var_2 + "_rear_thrust_launch_charge_lrg.vfx");
  }

  level._effect["allies_winglight"] = loadfx("vfx/iw7/core/vehicle/global/vfx_acraft_light_wingtip_blue_blink.vfx");
  level._effect["axis_winglight"] = loadfx("vfx/iw7/core/vehicle/global/vfx_acraft_light_wingtip_orange_blink.vfx");
  level._effect["allies_taillight"] = loadfx("vfx/iw7/core/vehicle/global/vfx_acraft_light_wingtip_blue.vfx");
  level._effect["axis_taillight"] = loadfx("vfx/iw7/core/vehicle/global/vfx_acraft_light_wingtip_orange.vfx");
  level._effect["allies_bellylight"] = loadfx("vfx/iw7/core/vehicle/global/vfx_acraft_light_white_blink.vfx");
  level._effect["axis_bellylight"] = loadfx("vfx/iw7/core/vehicle/global/vfx_acraft_light_red_blink.vfx");
  level._effect["jackal_boost_speed"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_boost_speed.vfx");
  level._effect["fighter_spaceship_damage_med_linger"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_hit_damage_linger.vfx");
  level._effect["fighter_spaceship_dying_init"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_death_damage.vfx");
  level._effect["fighter_spaceship_dying"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_dying_01.vfx");
  level._effect["fighter_spaceship_explosion"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_death_01.vfx");
  level._effect["fighter_spaceship_explosion_space"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_death_01.vfx");
  level._effect["fighter_spaceship_explosion_cheap"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_death_01_cheap.vfx");
  level._effect["fighter_spaceship_explosion_ground"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_death_ground.vfx");
  level._effect["jackal_debris_impact"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_death_windshield_reflect.vfx");
  level._effect[var_0 + "_spaceship_explosion"] = loadfx("vfx/iw7/core/vehicle/jackal" + var_2 + "/vfx_jackal" + var_2 + "_death_01.vfx");
  level._effect[var_0 + "_spaceship_explosion_space"] = loadfx("vfx/iw7/core/vehicle/jackal" + var_2 + "/vfx_jackal" + var_2 + "_death_01.vfx");
  level._effect[var_0 + "_spaceship_explosion_cheap"] = loadfx("vfx/iw7/core/vehicle/jackal" + var_2 + "/vfx_jackal" + var_2 + "_death_01_cheap.vfx");
  level._effect[var_0 + "_spaceship_explosion_hov"] = loadfx("vfx/iw7/core/vehicle/jackal" + var_2 + "/vfx_jackal" + var_2 + "_death_hover_01.vfx");
  level._effect[var_0 + "_spaceship_explosion_hov_space"] = loadfx("vfx/iw7/core/vehicle/jackal" + var_2 + "/vfx_jackal" + var_2 + "_death_hover_01.vfx");
  level._effect["fighter_spaceship_damage_med_hov_trail"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_hit_hov_damage_linger.vfx");
  level._effect["fighter_spaceship_explosion_hov_space"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_death_hover_01.vfx");
  level._effect["fighter_spaceship_explosion_hov"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_death_hover_01.vfx");
  level._effect["fighter_spaceship_damage_med"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_hit_damage.vfx");
  level._effect["jackal_impact_target"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_player_impact.vfx");
  level._effect["jackal_impact_target_large"] = loadfx("vfx/iw7/core/impact/veh_bullet_explode/vfx_imp_vbexp_vul.vfx");
  level._effect["weapon_drone_counterthrust_exhaust"] = loadfx("vfx/iw7/core/vehicle/jackal/drone/weapon_drone_counterthrust_exhaust.vfx");
  level._effect["weapon_drone_counterthrust"] = loadfx("vfx/iw7/core/vehicle/jackal/drone/weapon_drone_counterthrust.vfx");
  level._effect["weapon_drone_thrust_small"] = loadfx("vfx/iw7/core/vehicle/jackal/drone/weapon_drone_thrust_small.vfx");
  level._effect["weapon_drone_thrust_small_out"] = loadfx("vfx/iw7/core/vehicle/jackal/drone/weapon_drone_thrust_small_out.vfx");
  level._effect["weapon_drone_thrust_big"] = loadfx("vfx/iw7/core/vehicle/jackal/drone/weapon_drone_thrust_big.vfx");
  level._effect["weapon_drone_thrust_med"] = loadfx("vfx/iw7/core/vehicle/jackal/drone/weapon_drone_thrust_med.vfx");
  level._effect["weapon_drone_pod_open"] = loadfx("vfx/iw7/core/vehicle/jackal/drone/weapon_drone_pod_open.vfx");
  level._effect["weapon_drone_pod_trail"] = loadfx("vfx/iw7/core/vehicle/jackal/drone/weapon_drone_pod_trail.vfx");
  level._effect["landing_drone_light_top"] = loadfx("vfx/iw7/core/vehicle/jackal/drone/landing_drone_light_top.vfx");
  level._effect["landing_drone_light_top_blink"] = loadfx("vfx/iw7/core/vehicle/jackal/drone/landing_drone_light_top_blink.vfx");
  level._effect["landing_drone_light_top_off"] = loadfx("vfx/iw7/core/vehicle/jackal/drone/landing_drone_light_top_off.vfx");
  level._effect["landing_pad_lights"] = loadfx("vfx/iw7/core/light/landingpad/vfx_lp_green_blink.vfx");
  level._effect["landing_pad_marker"] = loadfx("vfx/core/vehicles/vfx_jackal_landing_pad_marker.vfx");
  level._effect["landing_pad_marker_pulse"] = loadfx("vfx/core/vehicles/vfx_jackal_landing_pad_marker_pulse.vfx");
  level._effect["landing_pad_confirmed"] = loadfx("vfx/core/vehicles/vfx_jackal_landing_pad_marker_confirmed.vfx");
  level._effect["jackal_runway_hangar_light"] = loadfx("vfx/iw7/core/vehicle/jackal/drone/landing_runway_hangar_light.vfx");
  level._effect["jackal_runway_segment"] = loadfx("vfx/iw7/core/vehicle/jackal/drone/landing_runway_segment_2.vfx");
  level._effect["jackal_runway_segment_start"] = loadfx("vfx/iw7/core/vehicle/jackal/drone/landing_runway_segment_start.vfx");
  level._effect["jackal_runway_segment_end"] = loadfx("vfx/iw7/core/vehicle/jackal/drone/landing_runway_segment_end.vfx");
  level._effect["jackal_runway_arrows"] = loadfx("vfx/iw7/core/vehicle/jackal/drone/landing_runway_arrows.vfx");
  level._effect["jackal_runway_arrow_end"] = loadfx("vfx/iw7/core/vehicle/jackal/drone/landing_runway_arrow_end.vfx");
  level._effect["jackal_runway_hoop"] = loadfx("vfx/iw7/core/vehicle/jackal/drone/landing_runway_hoop.vfx");
  level._effect["jet_missile_imp_water"] = loadfx("vfx/old/space_fighter/vfx_jet_missile_imp_water.vfx");
  level._effect["jet_missile_imp_generic"] = loadfx("vfx/iw7/core/expl/weap/missile/vfx_missile_small_exp.vfx");
  level._effect["jet_missile_imp_generic_zg"] = loadfx("vfx/iw7/core/expl/weap/missile/vfx_missile_small_exp_zg.vfx");
  level._effect["jet_missile_imp_airburst"] = loadfx("vfx/iw7/levels/moon/vfx_jet_missile_imp_generic_moon_premature.vfx");
  level._effect["jackal_missile_tag"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_missile_tag.vfx");
  level._effect["missile_flare_generic"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_player_missile.vfx");
  level._effect["jackal_enemy_locking"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_enemy_locking.vfx");
  level._effect["jackal_flare_decoy"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_flare_decoy.vfx");
  level._effect["jackal_flare_decoy_plr"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_flare_decoy_plr.vfx");
  level._effect["jackal_flare_impact_plr"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_flare_impact_plr.vfx");
  level._effect["jackal_flare_fizzle_plr"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_flare_fizzle_plr.vfx");
  level._effect["jackal_primary_energy"] = loadfx("vfx/core/beam/jackal/vfx_jackal_primary_beam.vfx");
  level._effect["jackal_dogfight_cam"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_dogfight_cam_particles.vfx");
  level._effect["fake_follow_jackal_tracer"] = loadfx("vfx/core/projectile/jackal/vfx_core_projectile_jackal_ai_modern_tail_fake.vfx");
  level._effect["30mm_flash"] = loadfx("vfx/core/muzflash/jackal/vfx_core_flash_jackal_30mm.vfx");

  if (!isdefined(level._id_A1E3))
  level._id_A1E3 = [];

  if (var_0 == "axis") {
  level._id_A1E3[var_0 + "_rear_thrusters"] = ["tag_thrust_rear1"];
  level._id_A1E3[var_0 + "_launch_boosters_sml"] = [];
  level._id_A1E3[var_0 + "_launch_boosters_med"] = [];
  level._id_A1E3[var_0 + "_launch_boosters_lrg"] = [];
  }
  else if (var_0 == "allies") {
  level._id_A1E3[var_0 + "_rear_thrusters"] = ["tag_thrust_rear_LE", "tag_thrust_rear_RI"];
  level._id_A1E3[var_0 + "_launch_boosters_med"] = ["j_rocket_booster_rear_left1", "j_rocket_booster_rear_right1"];
  level._id_A1E3[var_0 + "_launch_boosters_lrg"] = ["j_rocket_booster_rear_left2", "j_rocket_booster_rear_right2"];
  }

  if (issubstr(var_1, "_moon")) {
  level._effect[var_0 + "_rearThrustBoost"] = loadfx("vfx/iw7/core/vehicle/jackal" + var_2 + "/vfx_jackal" + var_2 + "_rear_thrust_boost.vfx");
  level._effect[var_0 + "_rearThrustMax"] = loadfx("vfx/iw7/core/vehicle/jackal" + var_2 + "/vfx_jackal" + var_2 + "_rear_thrust_fly_atmosphere.vfx");
  level._effect[var_0 + "_rearThrustMax_space"] = loadfx("vfx/iw7/levels/sa_moon/vfx_sa_moon_jackal" + var_2 + "_rear_thrust_fly_space.vfx");
  level._effect[var_0 + "_rearThrustIdle"] = loadfx("vfx/iw7/core/vehicle/jackal" + var_2 + "/vfx_jackal" + var_2 + "_rear_thrust_idle_atmosphere.vfx");
  level._effect[var_0 + "_rearThrustIdle_space"] = loadfx("vfx/iw7/core/vehicle/jackal" + var_2 + "/vfx_jackal" + var_2 + "_rear_thrust_idle_space.vfx");
  level._effect[var_0 + "_vtolThrustCenter"] = loadfx("vfx/iw7/core/vehicle/jackal" + var_2 + "/vfx_jackal" + var_2 + "_vtol_center.vfx");
  level._effect[var_0 + "_vtolThrustSide"] = loadfx("vfx/iw7/core/vehicle/jackal" + var_2 + "/vfx_jackal" + var_2 + "_vtol_side.vfx");
  level._effect["fighter_spaceship_explosion_space"] = loadfx("vfx/iw7/levels/sa_moon/vfx_sa_moon_jackal_death_intro.vfx");
  }

  if (level._id_A056._id_B323) {
  level._effect["vfx_jackal_cockpit_decomp"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_cockpit_decomp.vfx");
  level._effect["vfx_jackal_cockpit_canopy"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_jackal_cockpit_canopy.vfx");
  level._effect["missile_flare_short"] = loadfx("vfx/iw7/core/vehicle/jackal/vfx_player_missile_short.vfx");
  level._effect["cockpit_death_explo"] = loadfx("vfx/iw7/core/vehicle/jackal/cockpit/vfx_jkl_cockpit_interior_emp_imp.vfx");
  level._effect["cockpit_death_explo_huge"] = loadfx("vfx/iw7/core/vehicle/jackal/cockpit/vfx_jkl_cockpit_interior_death_explo_huge.vfx");
  level._effect["cockpit_dying_flames"] = loadfx("vfx/iw7/core/vehicle/jackal/cockpit/vfx_jkl_cockpit_interior_dying_fire.vfx");
  level._effect["cockpit_damage_sparks"] = loadfx("vfx/iw7/core/vehicle/jackal/cockpit/vfx_jkl_cockpit_interior_damage_sparks.vfx");
  level._effect["cockpit_damage_sparks_med"] = loadfx("vfx/iw7/core/vehicle/jackal/cockpit/vfx_jkl_cockpit_interior_damage_sparks_med.vfx");
  level._effect["cockpit_damage_sparks_lrg"] = loadfx("vfx/iw7/core/vehicle/jackal/cockpit/vfx_jkl_cockpit_interior_damage_sparks_lrg.vfx");
  level._effect["cockpit_light_monitor_mid"] = loadfx("vfx/iw7/core/vehicle/jackal/cockpit/vfx_jkl_cockpit_light_monitor_mid.vfx");
  level._effect["cockpit_light_monitor_l"] = loadfx("vfx/iw7/core/vehicle/jackal/cockpit/vfx_jkl_cockpit_light_monitor_l.vfx");
  level._effect["cockpit_light_monitor_r"] = loadfx("vfx/iw7/core/vehicle/jackal/cockpit/vfx_jkl_cockpit_light_monitor_r.vfx");
  level._effect["cockpit_light_monitor_boot_mid"] = loadfx("vfx/iw7/core/vehicle/jackal/cockpit/vfx_jkl_cockpit_light_monitor_boot_mid.vfx");
  level._effect["cockpit_light_monitor_boot_l"] = loadfx("vfx/iw7/core/vehicle/jackal/cockpit/vfx_jkl_cockpit_light_monitor_boot_l.vfx");
  level._effect["cockpit_light_monitor_boot_r"] = loadfx("vfx/iw7/core/vehicle/jackal/cockpit/vfx_jkl_cockpit_light_monitor_boot_r.vfx");
  level._effect["cockpit_light_monitor_alarm_mid"] = loadfx("vfx/iw7/core/vehicle/jackal/cockpit/vfx_jkl_cockpit_light_monitor_alarm_mid.vfx");
  level._effect["cockpit_light_monitor_alarm_l"] = loadfx("vfx/iw7/core/vehicle/jackal/cockpit/vfx_jkl_cockpit_light_monitor_alarm_l.vfx");
  level._effect["cockpit_light_monitor_alarm_r"] = loadfx("vfx/iw7/core/vehicle/jackal/cockpit/vfx_jkl_cockpit_light_monitor_alarm_r.vfx");
  level._effect["cockpit_light_monitor_incoming_mid"] = loadfx("vfx/iw7/core/vehicle/jackal/cockpit/vfx_jkl_cockpit_light_monitor_incoming_mid.vfx");
  level._effect["cockpit_light_monitor_incoming_l"] = loadfx("vfx/iw7/core/vehicle/jackal/cockpit/vfx_jkl_cockpit_light_monitor_incoming_l.vfx");
  level._effect["cockpit_light_monitor_incoming_r"] = loadfx("vfx/iw7/core/vehicle/jackal/cockpit/vfx_jkl_cockpit_light_monitor_incoming_r.vfx");
  level._effect["cockpit_light_side"] = loadfx("vfx/iw7/core/vehicle/jackal/cockpit/vfx_jkl_cockpit_spot_sides.vfx");
  }
}

#using_animtree("jackal");

_id_31A1() {
  level._id_A065["evasion"] = [%jackal_vehicle_evade_01, %jackal_vehicle_evade_02, %jackal_vehicle_evade_03, %jackal_vehicle_evade_04, %jackal_vehicle_evade_05, %jackal_vehicle_evade_06, %jackal_vehicle_evade_07, %jackal_vehicle_evade_08];
  level._id_A065["evasion_overlay"] = %jackal_evade_overlay;
  level._id_A065["evasion"] = scripts\engine\utility::_id_22A7(level._id_A065["evasion"]);
}

_id_104A7() {
  level._id_A056._id_A82D = [];
  level._id_A056._id_1632 = [];
  var_0 = getentarray("jackal_landingzone", "targetname");

  foreach (var_2 in var_0) {
  var_3 = scripts\engine\utility::_id_817E(var_2._id_0334, "targetname");
  var_4 = scripts\engine\utility::_id_107E6();
  var_4.origin = var_3.origin;
  var_4.angles = var_3.angles;
  var_4._id_0336 = var_3._id_0336;
  var_4._id_1270F = var_2;
  var_4._id_0315 = scripts\engine\utility::_id_107E6();
  var_4._id_0315.origin = var_4.origin;
  var_4._id_0315.angles = var_4.angles;

  if (isdefined(var_3.script_noteworthy))
  var_4.script_noteworthy = var_3.script_noteworthy;

  if (isdefined(var_3._id_EE10))
  var_4._id_EE10 = var_3._id_EE10;

  var_3 = undefined;
  var_5 = undefined;

  if (isdefined(var_2.script_noteworthy)) {
  var_5 = getent(var_2.script_noteworthy, "targetname");

  if (isdefined(var_5)) {
  if (issubstr(var_5.classname, "_vehicle"))
  var_5 = _id_0B91::_id_7D40(var_2.script_noteworthy, "targetname");

  var_2 _meth_80D2();
  var_2 _meth_8314();
  var_2 linkto(var_5);
  var_4 linkto(var_5);
  var_4._id_0315 linkto(var_5);
  }
  }

  level._id_A056._id_A82D = scripts\engine\utility::_id_2279(level._id_A056._id_A82D, var_4);
  var_4._id_ACC9 = [];
  var_6 = scripts\engine\utility::_id_8180(var_4._id_0336, "target");

  foreach (var_8 in var_6) {
  if (var_8._id_EE79 == "landing_pad_light") {
  var_9 = scripts\engine\utility::_id_107E6();
  var_9.origin = var_8.origin;

  if (isdefined(var_5))
  var_9 linkto(var_5);

  var_4._id_ACC9 = scripts\engine\utility::_id_2279(var_4._id_ACC9, var_9);
  }
  }

  var_4._id_6261 = 0;
  var_4._id_B36C = 0;
  _id_0BDC::_id_6211(var_4, 1);
  }

  _id_0BDC::_id_A06A(1);
}

_id_104A8() {
  var_0 = getentarray("jackal_cockpit_probe", "targetname");

  if (var_0.size == 0)
  return;
  else
  level._id_A056._id_DE59 = var_0[0];
}

_id_966B() {}

_id_5F6C(var_0, var_1) {
  _func_1C5(var_0, var_1);
}

_id_10499() {}

_id_104A5() {
  precacheitem("spaceship_ai_30mm_projectile");
  precacheitem("spaceship_ai_energy_projectile");
  precacheitem("magic_spaceship_30mm_projectile");
  precacheitem("magic_spaceship_30mm_projectile_fake");
  precacheitem("spaceship_homing_missile");
  precacheitem("spaceship_forward_missile");
  precacheitem("spaceship_scripted_miniflak");
  precacheitem("spaceship_scripted_locked_enemy_bullets");
  precacheshader("overlay_static");
  precacherumble("steady_rumble");
  precachestring(&"JACKAL_DOGFIGHT");
  precachestring(&"JACKAL_JACKAL");
  precachestring(&"JACKAL_SDF_DESTROYER");
  precachestring(&"JACKAL_RETRIBUTION");
  precachestring(&"JACKAL_AJAK");
  precachestring(&"JACKAL_ACE_SKELTER");
  precachestring(&"JACKAL_R7_SKELTER");
  precachestring(&"JACKAL_R16_SKELTER");
  precachestring(&"JACKAL_TURRET");
  precachestring(&"JACKAL_MMT38_WHIPLASH");
  precachestring(&"JACKAL_30MM_GRUNION");
  precachestring(&"JACKAL_76MM_DSM");
  precachestring(&"JACKAL_20MM_OST");
  precachestring(&"JACKAL_R28_TASKMASTER");
  precachestring(&"JACKAL_ENGINE");
  precachestring(&"JACKAL_SHIELD");
  precachestring(&"JACKAL_ENEMY");
  precachemodel("veh_mil_air_un_jackal_missile_coll");
  precachemodel("veh_mil_air_un_jackal_02_panels");
}

_id_104A4() {
  precachevehicle("jackal_un_landing");
  precachemodel("veh_mil_air_un_support_drone");
  precachemodel("veh_mil_air_un_support_drone_pod");
  precachemodel("veh_mil_air_un_landing_drone");
  precachemodel("vm_hero_protagonist_helmet");
  precachemodel("viewmodel_base_animated");
  precacheshader("hud_jackal_overlay_damage");
}

_id_104AB() {
  precacheitem("spaceship_disabled_guns");
  precacheitem("spaceship_cannon_projectile");
  precacheitem("spaceship_cleaver_projectile");
  precacheitem("spaceship_anvil_projectile");
  precacheitem("spaceship_30mm_projectile");
  precacheitem("spaceship_30mm_growler");
  precacheitem("spaceship_30mm_slow");
  precacheitem("spaceship_cannon_projectile_weapupgrade");
  precacheitem("spaceship_cleaver_projectile_weapupgrade");
  precacheitem("spaceship_anvil_projectile_weapupgrade");
  precacheitem("spaceship_30mm_projectile_weapupgrade");
  precacheitem("spaceship_30mm_growler_weapupgrade");
  precacheitem("spaceship_30mm_slow_weapupgrade");
  precacheitem("spaceship_forward_missile");
  precacheitem("spaceship_homing_missile");
}

_id_A220() {
  return !scripts\engine\utility::_id_6E25("jackal_supply_drop_hint") || isdefined(level._id_10260);
}

_id_A217() {
  return !scripts\engine\utility::_id_6E25("flag_mount_jackal") || level.player._id_C53F;
}

_id_A221() {
  return level.player _meth_81CE() || isdefined(level._id_D127._id_7294);
}

_id_A21D() {
  return !scripts\engine\utility::_id_6E25("jackal_reving_hint");
}

_id_A222() {
  return !scripts\engine\utility::_id_6E25("jackal_launching_hint");
}

_id_A209() {
  return !scripts\engine\utility::_id_6E25("jackal_ads_hint");
}

_id_A213() {
  return !scripts\engine\utility::_id_6E25("jackal_lockon_hint");
}

_id_A20A() {
  if (!isdefined(level._id_D127))
  return 1;

  if (level._id_D127._id_02A9 == "hover")
  return 1;
  else
  return 0;
}

_id_A21F() {
  if (!isdefined(level._id_D127))
  return 1;

  if (level._id_D127._id_02A9 == "fly")
  return 1;
  else
  return 0;
}

_id_A223() {
  return !scripts\engine\utility::_id_6E25("jackal_weapon_switch_hint");
}

_id_A210() {
  return !scripts\engine\utility::_id_6E25("jackal_juke_hint");
}

_id_A20F() {
  return !scripts\engine\utility::_id_6E25("jackal_flare_hint");
}

_id_A20C() {
  return !scripts\engine\utility::_id_6E25("jackal_brake_hint");
}

_id_A20B() {
  return !scripts\engine\utility::_id_6E25("jackal_boost_hint");
}

_id_A211() {
  return !scripts\engine\utility::_id_6E25("jackal_land_hint");
}

_id_A21E() {
  return !scripts\engine\utility::_id_6E25("jackal_runway_hint");
}

_id_A212() {
  return !scripts\engine\utility::_id_6E25("jackal_landing_scan_hint");
}

_id_A215() {
  return !scripts\engine\utility::_id_6E25("jackal_missile_hint");
}

_id_A214() {
  return !scripts\engine\utility::_id_6E25("jackal_lose_lock_hint");
}

_id_A216() {
  return !scripts\engine\utility::_id_6E25("jackal_missile_lock_hint");
}

_id_A20E() {
  return !scripts\engine\utility::_id_6E25("jackal_find_lockon");
}

_id_A21C() {
  return !scripts\engine\utility::_id_6E25("jackal_return_to_battle_hint");
}

_id_A219() {
  return !scripts\engine\utility::_id_6E25("jackal_hint_ret_launch");
}

_id_A21B() {
  return !scripts\engine\utility::_id_6E25("jackal_hint_ret_return");
}

_id_A21A() {
  return !scripts\engine\utility::_id_6E25("jackal_hint_ret_reapproach");
}

_id_A218() {
  return !scripts\engine\utility::_id_6E25("jackal_hint_ret_reapproach");
}

_id_A20D() {
  return !scripts\engine\utility::_id_6E25("jackal_dogfight_hint");
}
