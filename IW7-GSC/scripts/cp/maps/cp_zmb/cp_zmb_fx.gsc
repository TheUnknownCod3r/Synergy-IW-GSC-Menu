/********************************************************
 * Decompiled by Bog
 * Edited by SyndiShanX
 * Script: scripts\scripts\cp\maps\cp_zmb\cp_zmb_fx.gsc
********************************************************/

main() {
	level._effect["vfx_blood_throw"] = loadfx("vfx/iw7/levels/cp_zmb/willard/vfx_blood_throw.vfx");
	level._effect["vfx_blood_cut"] = loadfx("vfx/iw7/levels/cp_zmb/willard/vfx_blood_cut.vfx");
	level._effect["vfx_zmb_gns_ghost_float_arms"] = loadfx("vfx/iw7/core/zombie/ghosts_n_skulls/vfx_zmb_ghost_arms.vfx");
	level._effect["vfx_zmb_gns_ghost_float_legs"] = loadfx("vfx/iw7/core/zombie/ghosts_n_skulls/vfx_zmb_ghost_legs.vfx");
	level._effect["vfx_zb_pack_grd_d"] = loadfx("vfx/iw7/core/zombie/pack_a_punch/vfx_zb_pack_grd_d.vfx");
	level._effect["vfx_zb_pack_grd_e"] = loadfx("vfx/iw7/core/zombie/pack_a_punch/vfx_zb_pack_grd_e.vfx");
	level._effect["vfx_zb_pack_grd_c"] = loadfx("vfx/iw7/core/zombie/pack_a_punch/vfx_zb_pack_grd_c.vfx");
	level._effect["vfx_zb_pack_grd_b"] = loadfx("vfx/iw7/core/zombie/pack_a_punch/vfx_zb_pack_grd_b.vfx");
	level._effect["vfx_zb_pack_grd_a"] = loadfx("vfx/iw7/core/zombie/pack_a_punch/vfx_zb_pack_grd_a.vfx");
	level._effect["vfx_zb_sj_smk"] = loadfx("vfx/iw7/core/zombie/pack_a_punch/vfx_zb_sj_smk.vfx");
	level._effect["vfx_zb_pack_glow_ground_b"] = loadfx("vfx/iw7/core/zombie/pack_a_punch/vfx_zb_pack_glow_ground_b.vfx");
	level._effect["vfx_zb_pack_glow"] = loadfx("vfx/iw7/core/zombie/pack_a_punch/vfx_zb_pack_glow.vfx");
	level._effect["vfx_zmb_candle_flame"] = loadfx("vfx/iw7/core/zombie/pack_a_punch/vfx_zmb_candle_flame.vfx");
	level._effect["vfx_ufo_snow"] = loadfx("vfx/iw7/core/zombie/ufo/vfx_ufo_snow.vfx");
	level._effect["vfx_ufo_p_beam"] = loadfx("vfx/iw7/core/zombie/ufo/vfx_ufo_p_beam.vfx");
	level._effect["vfx_ufo_elec_beam_impact"] = loadfx("vfx/iw7/_requests/coop/vfx_ufo_elec_beam_impact.vfx");
	level._effect["vfx_zmb_kr_head_panner_red"] = loadfx("vfx/iw7/_requests/coop/vfx_zmb_kr_head_panner_red.vfx");
	level._effect["vfx_gator_chomp_blood_shot"] = loadfx("vfx/iw7/_requests/coop/vfx_gator_chomp_blood_shot.vfx");
	level._effect["vfx_zmb_sd_lensf"] = loadfx("vfx/iw7/core/zombie/traps/steel_dragon/vfx_zmb_sd_lensf.vfx");
	level._effect["vfx_zmb_sd_g_wall"] = loadfx("vfx/iw7/core/zombie/traps/steel_dragon/vfx_zmb_sd_g_wall.vfx");
	level._effect["vfx_zmb_flume_whtwtr"] = loadfx("vfx/iw7/core/zombie/environment/vfx_zmb_flume_whtwtr.vfx");
	level._effect["vfx_zmb_flumefall"] = loadfx("vfx/iw7/core/zombie/environment/vfx_zmb_flumefall.vfx");
	level._effect["vfx_zmb_arcade_dance_floor_tiles"] = loadfx("vfx/iw7/_requests/coop/vfx_zmb_arcade_dance_floor_tiles.vfx");
	level._effect["vfx_zmb_drips_parent"] = loadfx("vfx/iw7/core/zombie/environment/vfx_zmb_drips_parent.vfx");
	level._effect["vfx_zmb_fntn_keplerbase"] = loadfx("vfx/iw7/core/zombie/environment/vfx_zmb_fntn_keplerbase.vfx");
	level._effect["vfx_zmb_fntn_sml_kepler"] = loadfx("vfx/iw7/core/zombie/environment/vfx_zmb_fntn_sml_kepler.vfx");
	level._effect["vfx_zmb_fntn_ufo"] = loadfx("vfx/iw7/core/zombie/environment/vfx_zmb_fntn_ufo.vfx");
	level._effect["vfx_zmb_fntn_sml_spray"] = loadfx("vfx/iw7/core/zombie/environment/vfx_zmb_fntn_sml_spray.vfx");
	level._effect["vfx_zmb_grd_fog_tunnel"] = loadfx("vfx/iw7/_requests/coop/vfx_zmb_grd_fog_tunnel.vfx");
	level._effect["vfx_gator_door_dust"] = loadfx("vfx/iw7/levels/sa_common/vfx_sa_falling_dust_rumble_ch.vfx");
	level._effect["vfx_gator_mouth_drop_sparks"] = loadfx("vfx/iw7/_requests/coop/vfx_gator_mouth_drop_sparks.vfx");
	level._effect["vfx_gator_mouth_dust_kickup"] = loadfx("vfx/iw7/_requests/coop/vfx_gator_mouth_dust_kickup.vfx");
	level._effect["vfx_zmb_life_link_beam"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_life_link_beam.vfx");
	level._effect["vfx_zmb_spawn_ceiling"] = loadfx("vfx/iw7/core/zombie/spawn/vfx_zmb_spawn_ceiling.vfx");
	level._effect["vfx_zmb_spawn_ground"] = loadfx("vfx/iw7/core/zombie/spawn/vfx_zmb_spawn_ground.vfx");
	level._effect["vfx_zmb_waterfall"] = loadfx("vfx/iw7/core/zombie/environment/vfx_zmb_waterfall.vfx");
	level._effect["vfx_zmb_river_fog"] = loadfx("vfx/iw7/_requests/coop/vfx_zmb_river_fog.vfx");
	level._effect["vfx_zb_moth_c"] = loadfx("vfx/iw7/core/zombie/environment/vfx_zb_moth_c.vfx");
	level._effect["vfx_zb_moth_b"] = loadfx("vfx/iw7/core/zombie/environment/vfx_zb_moth_b.vfx");
	level._effect["vfx_zb_moth_a"] = loadfx("vfx/iw7/core/zombie/environment/vfx_zb_moth_a.vfx");
	level._effect["vfx_zb_mist_far"] = loadfx("vfx/iw7/core/zombie/environment/vfx_zb_mist_far.vfx");
	level._effect["vfx_zmb_grd_fog_bri"] = loadfx("vfx/iw7/_requests/coop/vfx_zmb_grd_fog_bri.vfx");
	level._effect["vfx_zmb_grd_fog_bri"] = loadfx("vfx/iw7/_requests/coop/vfx_zmb_grd_fog_bri.vfx");
	level._effect["vfx_zmb_grd_fog_dar"] = loadfx("vfx/iw7/_requests/coop/vfx_zmb_grd_fog_dar.vfx");
	level._effect["vfx_zb_thu_sparks"] = loadfx("vfx/iw7/_requests/coop/vfx_zb_thu_sparks.vfx");
	level._effect["vfx_zb_thu_big_side"] = loadfx("vfx/iw7/_requests/coop/vfx_zb_thu_big_side.vfx");
	level._effect["vfx_zb_thu_big"] = loadfx("vfx/iw7/_requests/coop/vfx_zb_thu_big.vfx");
	level._effect["vfx_zb_thu_smk_ground_fast"] = loadfx("vfx/iw7/_requests/coop/vfx_zb_thu_smk_ground_fast.vfx");
	level._effect["vfx_zb_linger_smk_af"] = loadfx("vfx/iw7/_requests/coop/vfx_zb_linger_smk_af.vfx");
	level._effect["vfx_zb_linger_smk_af"] = loadfx("vfx/iw7/_requests/coop/vfx_zb_linger_smk_af.vfx");
	level._effect["vfx_zb_thu_smk_ground"] = loadfx("vfx/iw7/_requests/coop/vfx_zb_thu_smk_ground.vfx");
	level._effect["vfx_zb_thu_ignite"] = loadfx("vfx/iw7/_requests/coop/vfx_zb_thu_ignite.vfx");
	level._effect["vfx_zb_linger_smk_bf"] = loadfx("vfx/iw7/_requests/coop/vfx_zb_linger_smk_bf.vfx");
	level._effect["vfx_nuke_explosion_01"] = loadfx("vfx/iw7/_requests/coop/vfx_nuke_explosion_01.vfx");
	level._effect["vfx_magicwheel_fire"] = loadfx("vfx/iw7/_requests/coop/vfx_magicwheel_fire.vfx");
	level._effect["vfx_magicwheel_beam"] = loadfx("vfx/iw7/_requests/coop/vfx_magicwheel_beam.vfx");
	level._effect["vfx_magicwheel_toy_pop"] = loadfx("vfx/iw7/core/zombie/magicwheel/vfx_magicwheel_toy_pop.vfx");
	level._effect["vfx_magicwheel_beam_firesale"] = loadfx("vfx/iw7/core/zombie/vfx_magicwheel_beam_upgrade.vfx");
	level._effect["vfx_zmb_window_smk"] = loadfx("vfx/iw7/core/zombie/environment/vfx_zmb_window_smk.vfx");
	level._effect["vfx_zb_fireflys_quick_b"] = loadfx("vfx/iw7/core/zombie/environment/vfx_zb_fireflys_quick_b.vfx");
	level._effect["vfx_zb_fireflys_quick"] = loadfx("vfx/iw7/core/zombie/environment/vfx_zb_fireflys_quick.vfx");
	level._effect["vfx_zmb_trash_dir_runner"] = loadfx("vfx/iw7/core/zombie/environment/vfx_zmb_trash_dir_runner.vfx");
	level._effect["vfx_cop_zmb_particle_dust"] = loadfx("vfx/iw7/core/zombie/environment/vfx_cop_zmb_particle_dust.vfx");
	level._effect["vfx_knee_high_fog_dark"] = loadfx("vfx/iw7/core/zombie/environment/vfx_knee_high_fog_dark.vfx");
	level._effect["vfx_knee_high_fog_bright"] = loadfx("vfx/iw7/core/zombie/environment/vfx_knee_high_fog_bright.vfx");
	level._effect["vfx_zmb_portal_centhub"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_portal_centhub.vfx");
	level._effect["vfx_zmb_portal_exit_burst"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_portal_exit_burst.vfx");
	level._effect["vfx_cp_z_portal_exit_burst"] = loadfx("vfx/iw7/core/zombie/vfx_cp_z_portal_exit_burst.vfx");
	level._effect["vfx_zmb_light_wedge_01"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_light_wedge_01.vfx");
	level._effect["vfx_zmb_genbox_loop"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_genbox_loop.vfx");
	level._effect["vfx_zmb_portal_base_01"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_portal_base_01.vfx");
	level._effect["vfx_zmb_smk_amb_hang_med"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_smk_amb_hang_med.vfx");
	level._effect["vfx_zmb_smk_ambient_hang_lrg"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_smk_ambient_hang_lrg.vfx");
	level._effect["vfx_zmb_smk_ambient_hang_med"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_smk_ambient_hang_med.vfx");
	level._effect["vfx_zmb_birds_01"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_birds_01.vfx");
	level._effect["vfx_zmb_fireflys"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_fireflys.vfx");
	level._effect["vfx_zmb_fire_trash_01"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_fire_trash_01.vfx");
	level._effect["vfx_zmb_gatebuy_01"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_gatebuy_01.vfx");
	level._effect["vfx_zmb_gatebuy_02"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_gatebuy_02.vfx");
	level._effect["vfx_zmb_xtrash_drift_01_ch"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_xtrash_drift_01_ch.vfx");
	level._effect["vfx_zmb_trash_swirl_fig_eight_01"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_trash_swirl_fig_eight_01.vfx");
	level._effect["vfx_zmb_trash_swirl_circle_01"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_trash_swirl_circle_01.vfx");
	level._effect["vfx_zmb_trash_flys"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_trash_flys.vfx");
	level._effect["vfx_zmb_trash_flys"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_trash_flys.vfx");
	level._effect["vfx_zmb_trash_drift_slow_01"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_trash_drift_slow_01.vfx");
	level._effect["vfx_zmb_trash_drift_01"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_trash_drift_01.vfx");
	level._effect["vfx_zmb_trash_swirl_fig_eight_01"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_trash_swirl_fig_eight_01.vfx");
	level._effect["vfx_cp_z_portal_01"] = loadfx("vfx/iw7/levels/cp_zmb/vfx_cp_z_portal_01.vfx");
	level._effect["vfx_zom_light_cone_01"] = loadfx("vfx/iw7/core/zombie/vfx_zom_light_cone_01.vfx");
	level._effect["vfx_zmb_light_strobe_01"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_light_strobe_01.vfx");
	level._effect["vfx_zmb_brute_warn_01"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_brute_warn_01.vfx");
	level._effect["pillage_box"] = loadfx("vfx/iw7/_requests/coop/vfx_zmb_pillage_box.vfx");
	level._effect["coaster_smoke"] = loadfx("vfx/iw7/_requests/coop/zmb_coaster_smoke");
	level._effect["coaster_laser"] = loadfx("vfx/iw7/_requests/coop/zmb_coaster_laser");
	level._effect["coaster_laser_exp"] = loadfx("vfx/iw7/_requests/coop/zmb_coaster_laser_exp");
	level._effect["coaster_rocks"] = loadfx("vfx/iw7/_requests/coop/zmb_coaster_fallingice");
	level._effect["gator_tooth_break"] = loadfx("vfx/iw7/levels/jvan_test/vfx_falling_ice_shatter.vfx");
	level._effect["neil_light_on"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_neil_light.vfx");
	level._effect["neil_light_on_red"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_neil_light_red.vfx");
	level._effect["coaster_ice_frost"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_mbreath.vfx");
	level._effect["coaster_full_screen"] = loadfx("vfx/iw7/_requests/mp/vfx_cryo_grenade_frost_scrn");
	level._effect["health_boost"] = loadfx("vfx/iw7/_requests/mp/vfx_adrenaline_drip_heal_scrn.vfx");
	level._effect["bumpercar_impact"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_spark_bumpercar.vfx");
	level._effect["neil_repair_sparks"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_spark_robot.vfx");
	level._effect["green_ark_effects"] = loadfx("vfx/iw7/core/zombie/vfx_zombie_ark_poison.vfx");
	level._effect["red_ark_effects"] = loadfx("vfx/iw7/core/zombie/vfx_zombie_ark_fire.vfx");
	level._effect["pink_ark_effects"] = loadfx("vfx/iw7/core/zombie/vfx_zombie_ark_ap.vfx");
	level._effect["yellow_ark_effects"] = loadfx("vfx/iw7/core/zombie/vfx_zombie_ark_explosive.vfx");
	level._effect["blue_ark_effects"] = loadfx("vfx/iw7/core/zombie/vfx_zombie_ark_shock.vfx");
	level._effect["blue_ark_beam"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_shock_beam_blue.vfx");
	level._effect["geyser_splash_lg"] = loadfx("vfx/iw7/core/zombie/geyser/vfx_zmb_geyser_small.vfx");
	level._effect["geyser_blast"] = loadfx("vfx/iw7/core/zombie/geyser/vfx_zmb_geyser_burst.vfx");
	level._effect["geyser_blast_side"] = loadfx("vfx/iw7/core/zombie/geyser/vfx_zmb_geyser_side.vfx");
	level._effect["geyser_fullscreen_fx"] = loadfx("vfx/core/screen/vfx_scrnfx_zm_waterdrops.vfx");
	level._effect["police_lights"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_police_lights.vfx");
	level._effect["vfx_zmb_water_drip"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_water_drip.vfx");
	level._effect["vfx_zmb_dust_motes_md"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_dust_motes_md.vfx");
	level._effect["rocket_feet"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_facemelter_rocket_feet.vfx");
	level._effect["part_glow_red"] = loadfx("vfx/iw7/core/zombie/weapon/shredder/zmb_part_glow_red.vfx");
	level._effect["part_glow_green"] = loadfx("vfx/iw7/core/zombie/weapon/dischord/zmb_part_glow_green.vfx");
	level._effect["part_glow_yellow"] = loadfx("vfx/iw7/core/zombie/weapon/zmb_part_glow_yellow.vfx");
	level._effect["part_glow_blue"] = loadfx("vfx/iw7/core/zombie/weapon/zmb_part_glow_blue.vfx");
	level._effect["part_glow_red_complete"] = loadfx("vfx/iw7/core/zombie/weapon/zmb_part_glow_red_comp.vfx");
	level._effect["part_glow_green_complete"] = loadfx("vfx/iw7/core/zombie/weapon/dischord/zmb_p_glw_gc.vfx");
	level._effect["part_glow_blue_complete"] = loadfx("vfx/iw7/core/zombie/weapon/zmb_part_glow_blue_comp.vfx");
	level._effect["part_glow_yellow_complete"] = loadfx("vfx/iw7/core/zombie/weapon/zmb_part_glow_yellow_comp.vfx");
	level._effect["headcutter_ring"] = loadfx("vfx/iw7/core/ui/vfx_ui_ring_radius_marker.vfx");
	level._effect["fire_pool_wide"] = loadfx("vfx/iw7/core/zombie/weapon/facemelter/vfx_zb_fct_gfire.vfx");
	level._effect["neil_fire_pool"] = loadfx("vfx/iw7/core/zombie/robot/vfx_ground_fire_linger.vfx");
	level._effect["booth_respawn"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_ticket_booth_zap_respawn.vfx");
	level._effect["shock_melee_impact"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_elec_knife_impact.vfx");
	level._effect["melee_impact"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_gore_melee_imp.vfx");
	level._effect["ufo_light_white"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_ufo_light_white.vfx");
	level._effect["pink_ark_spawn"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_ark_pink_create.vfx");
	level._effect["pink_essense"] = loadfx("vfx/iw7/core/zombie/weapon/ark/vfx_zmb_ark_pink_b.vfx");
	level._effect["life_link"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_life_link_beam.vfx");
	level._effect["life_link_target"] = loadfx("vfx/iw7/core/zombie/cards/vfx_zmb_life_link_beam_send.vfx");
	level._effect["dischord_explosion"] = loadfx("vfx/iw7/core/zombie/weapon/dischord/vfx_zb_dc_exp.vfx");
	level._effect["neil_impact"] = loadfx("vfx/iw7/core/expl/weap/grenade/vfx_exp_frag_expl.vfx");
	level._effect["neil_trail"] = loadfx("vfx/iw7/core/smktrail/vfx_smktrail_mega_missile.vfx");
	level._effect["quest_glasses_drop"] = loadfx("vfx/iw7/_requests/coop/zmb_glasses_drop.vfx");
	level._effect["bumpercar_light"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_headlight.vfx");
	level._effect["player_scr_fire"] = loadfx("vfx/iw7/_requests/coop/vfx_zb_player_burn_flames.vfx");
	level._effect["atomize_body"] = loadfx("vfx/iw7/_requests/mp/vfx_atomize_body.vfx");
	level._effect["atm_withdrawal"] = loadfx("vfx/iw7/prop/vfx_cash_eject_a.vfx");
	level._effect["console_spark"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_console_sparks.vfx");
	level._effect["extra_cash_kill"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_money_cash_imp_exp.vfx");
	level._effect["neil_flash"] = loadfx("vfx/iw7/core/zombie/vfx_zmb_neil_flash.vfx");
	level._effect["screen_blood"] = loadfx("vfx/iw7/core/zombie/weapon/axe/vfx_zmb_axe_screen_blood.vfx");
	level._effect["goon_spawn_bolt"] = loadfx("vfx/iw7/_requests/coop/vfx_clown_spawn.vfx");
	level._effect["goon_spawn_bolt_underground"] = loadfx("vfx/iw7/_requests/coop/vfx_clown_spawn_indoor.vfx");
	level._effect["exp_touch"] = loadfx("vfx/iw7/levels/cp_rave/vfx_explosive_touch.vfx");
	level._effect["lava_torrent"] = loadfx("vfx/iw7/levels/cp_rave/vfx_lava_erupt_fnf.vfx");
	level._effect["fire_chains"] = loadfx("vfx/iw7/core/zombie/cards/fire_chains/vfx_zmb_fire_chains_beam.vfx");
	level._effect["fire_chains_target"] = loadfx("vfx/iw7/core/zombie/cards/fire_chains/vfx_zmb_fire_chains_beam_imp_ch_a.vfx");
	level._effect["twister"] = loadfx("vfx/iw7/core/zombie/vfx_fnf_twister.vfx");
	level._effect["cone_expl_fx"] = loadfx("vfx/iw7/core/muzflash/rvn/vfx_rvn_defib_legend_cone.vfx");
	level._effect["powerup_additive_fx"] = loadfx("vfx/iw7/core/zombie/powerups/vfx_pwrup_additive.vfx");
	level._effect["dodge_ground_spark_fx"] = loadfx("vfx/core/mp/killstreaks/vfx_ims_sparks");
	level._effect["dodge_fwd_screen"] = loadfx("vfx/iw7/levels/cp_town/dodge/vfx_zb_fwd.vfx");
	level._effect["dodge_back_screen"] = loadfx("vfx/iw7/levels/cp_town/dodge/vfx_zb_back.vfx");
	level._effect["dodge_left_screen"] = loadfx("vfx/iw7/levels/cp_town/dodge/vfx_zb_left.vfx");
	level._effect["dodge_right_screen"] = loadfx("vfx/iw7/levels/cp_town/dodge/vfx_zb_right.vfx");
	level._effect["dodge_fwd_left_screen"] = loadfx("vfx/iw7/levels/cp_town/dodge/vfx_zb_fwd_left.vfx");
	level._effect["dodge_fwd_right_screen"] = loadfx("vfx/iw7/levels/cp_town/dodge/vfx_zb_fwd_right.vfx");
	level._effect["dodge_back_left_screen"] = loadfx("vfx/iw7/levels/cp_town/dodge/vfx_zb_back_left.vfx");
	level._effect["dodge_back_right_screen"] = loadfx("vfx/iw7/levels/cp_town/dodge/vfx_back_right.vfx");
	level._effect["dodge_touch"] = loadfx("vfx/iw7/levels/cp_town/dodge/vfx_zb_dodge_touch.vfx");
	level._effect["stimulus_shield"] = loadfx("vfx/iw7/levels/cp_town/fnf/vfx_stimulus_heal_scrn.vfx");
	level._effect["stimulus_glow_burst"] = loadfx("vfx/iw7/levels/cp_town/fnf/vfx_stimulus_burst.vfx");
	level._effect["ammo_crate_fx"] = loadfx("vfx/iw7/levels/cp_town/craft/vfx_cp_town_ammo_idle.vfx");
	level._effect["ammo_crate_ping"] = loadfx("vfx/iw7/levels/cp_town/vfx_cp_town_ammo_flash.vfx");
	scripts/cp/func_0A5A::main();
}