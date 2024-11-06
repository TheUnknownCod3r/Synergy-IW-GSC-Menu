/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2997.gsc
***************************************/

main(var_0, var_1, var_2) {
  _id_0B95::_id_31C5("capital_ship", var_0, var_1, var_2);
  _id_0B95::_id_31A6(::_id_966B);
  _id_0BA9::_id_39B3(var_0, "un", var_2);
  level._effect["retribution_thrust_rear_idle"] = loadfx("vfx/iw7/core/vehicle/retr/vfx_veh_retr_thrust_rear_idle_child.vfx");
  level._effect["retribution_thrust_rear_heavy"] = loadfx("vfx/iw7/core/vehicle/retr/vfx_veh_retr_thrust_rear_max_child.vfx");
  level._effect["retribution_thrust_vert_small_idle"] = loadfx("vfx/iw7/core/vehicle/retr/vfx_veh_retr_thrust_vert_small_idle.vfx");
  level._effect["retribution_thrust_vert_small_heavy"] = loadfx("vfx/iw7/core/vehicle/retr/vfx_veh_retr_thrust_vert_small_max.vfx");
  level._effect["retribution_thrust_vert_large_idle"] = loadfx("vfx/iw7/core/vehicle/retr/vfx_veh_retr_thrust_vert_large_idle.vfx");
  level._effect["retribution_thrust_vert_large_heavy"] = loadfx("vfx/iw7/core/vehicle/retr/vfx_veh_retr_thrust_vert_large_max.vfx");

  if (issubstr(var_2, "periph")) {
  precachemodel("veh_mil_air_un_retribution_periph");
  precachemodel("veh_mil_air_un_retribution_rig");
  precachemodel("vfx_ftl_ca_destroyer");
  precachemodel("ship_exterior_un_cannon_b_rig");
  precacheturret("cap_turret_cannon_large_un");
  level._effect["capital_turret_muzzle_lg"] = loadfx("vfx/iw7/core/muzflash/cannon/vfx_mega_cannon_muzflash.vfx");
  level._effect["capital_un_turret_sml_cheap"] = loadfx("vfx/iw7/core/muzflash/cannon/vfx_un_turret_small_cheap.vfx");
  return;
  }

  precachemodel("veh_mil_air_un_retribution_rig");
  precachemodel("veh_mil_air_un_retribution_engines");
  precachemodel("veh_mil_air_un_retribution_details");
  precachemodel("vfx_ftl_ca_destroyer");

  if (issubstr(var_2, "cheap")) {
  precachemodel("veh_mil_air_un_retribution_periph");
  precachemodel("ship_exterior_un_cannon_b_rig");
  precacheturret("cap_turret_cannon_large_un");
  level._effect["capital_turret_muzzle_lg"] = loadfx("vfx/iw7/core/muzflash/cannon/vfx_mega_cannon_muzflash.vfx");
  level._effect["capital_un_turret_sml_cheap"] = loadfx("vfx/iw7/core/muzflash/cannon/vfx_un_turret_small_cheap.vfx");
  return;
  }

  precachemodel("veh_mil_air_un_retribution");
  precacheturret("cap_turret_cannon_large_un");
  precacheturret("cap_turret_cannon_large_un_zerog");
  precachemodel("veh_mil_air_un_retribution_interior_01");

  if (issubstr(var_2, "_damaged"))
  precachemodel("veh_mil_air_un_retribution_repair");
  else if (issubstr(var_2, "_repaired"))
  precachemodel("veh_mil_air_un_retribution_repair");

  level._effect["retribution_un_warp_pre"] = loadfx("vfx/iw7/core/vehicle/retr/vfx_vehicle_retr_warp_in_anticipation.vfx");
  level._effect["retribution_un_warp_in"] = loadfx("vfx/iw7/core/vehicle/retr/vfx_vehicle_retr_warp_in.vfx");
  level._effect["retribution_un_warp_in_post"] = loadfx("vfx/iw7/core/vehicle/retr/vfx_vehicle_retr_warp_in.vfx");
  level._effect["retribution_un_warp_out"] = loadfx("vfx/iw7/core/vehicle/mons/vfx_vehicle_mons_warp_out.vfx");
  _id_0B95::_id_31C6(var_2, "default", "vfx/iw7/core/tread/tread_airship_retr_titan.vfx", 0);
  level._effect["retr_wash_dirt"] = loadfx("vfx/iw7/core/tread/tread_airship_retr_titan.vfx");
  level._effect["retribution_thrust_rear_launch"] = loadfx("vfx/iw7/core/vehicle/retr/vfx_veh_retr_thrust_rear_launch.vfx");
  level._effect["retribution_thrust_vert_small_launch"] = loadfx("vfx/iw7/core/vehicle/retr/vfx_veh_retr_thrust_vert_small_launch.vfx");
  level._effect["retribution_thrust_vert_large_launch"] = loadfx("vfx/iw7/core/vehicle/retr/vfx_veh_retr_thrust_vert_large_launch.vfx");
}

_id_966B() {
  if (issubstr(self.classname, "_damaged"))
  self._id_B210 = "veh_mil_air_un_retribution_repair";
  else if (issubstr(self.classname, "_repaired"))
  self._id_B210 = "veh_mil_air_un_retribution_repair";

  self._id_24C4 = ["tag_origin", "amb_turret_sml_t_l_4", "tag_engine_bottom_rear_a", "amb_missile_l_2", "tag_engine_bottom_midlf_a", "mdl_ftl_a_al", "amb_turret_sml_t_l_2", "mdl_ftl_b_el", "mdl_ftl_b_bl", "amb_turret_sml_t_r_1", "mdl_ftl_b_gr", "mdl_ftl_a_ar", "tag_lockon", "amb_missile_r_3", "amb_turret_sml_t_r_4"];
  thread _id_0BA9::_id_396E("un");
  _id_0B93::_id_8441();
  _id_0BB8::_id_7561("thrust_vert", "tag_engine_bottom_front_a", "retribution_thrust_vert_large", self._id_5020);
  _id_0BB8::_id_7561("thrust_vert", "tag_engine_bottom_front_b", "retribution_thrust_vert_large", self._id_5020);
  _id_0BB8::_id_7561("thrust_vert", "tag_engine_bottom_mid_a", "retribution_thrust_vert_large", self._id_5020);
  _id_0BB8::_id_7561("thrust_vert", "tag_engine_bottom_mid_b", "retribution_thrust_vert_large", self._id_5020);
  _id_0BB8::_id_7561("thrust_vert", "tag_engine_bottom_midlr_a", "retribution_thrust_vert_large", self._id_5020);
  _id_0BB8::_id_7561("thrust_vert", "tag_engine_bottom_midlf_a", "retribution_thrust_vert_large", self._id_5020);
  _id_0BB8::_id_7561("thrust_vert", "tag_engine_bottom_rear_a", "retribution_thrust_vert_large", self._id_5020);
  _id_0BB8::_id_7562("thrust_rear", "tag_engine_rear_l_out_00", "retribution_thrust_rear", self._id_501F);
  _id_0BB8::_id_7562("thrust_rear", "tag_engine_rear_l_in_00", "retribution_thrust_rear", self._id_501F);
  _id_0BB8::_id_7562("thrust_rear", "tag_engine_rear_r_in_00", "retribution_thrust_rear", self._id_501F);
  _id_0BB8::_id_7562("thrust_rear", "tag_engine_rear_r_out_00", "retribution_thrust_rear", self._id_501F);
  self._id_539B = ["veh_mil_air_un_retribution_engines", "veh_mil_air_un_retribution_details"];
  self._id_539A = "veh_mil_air_un_retribution_interior_01";

  if (issubstr(self.classname, "periph")) {
  self._id_B210 = "veh_mil_air_un_retribution_periph";
  return;
  }

  if (issubstr(self.classname, "cheap"))
  return;

  thread _id_1EDC();
  self._id_7482 = "retribution_un_warp";
  self._id_748F = "vfx_ftl_ca_destroyer";
  self._id_7475 = 0.5;
  self._id_7499 = "retribution_un_warp_in";
  self._id_749A = 0.195;
}

#using_animtree("vehicles");

_id_1EDC() {
  level._id_EC87["ftl_model"] = #animtree;
  level._id_EC8C["ftl_model"] = "vfx_ftl_ca_destroyer";
  level._id_EC85["ftl_model"]["ftl_in"] = %vfx_ftl_ca_destroyer_in;
  level._id_EC85["ftl_model"]["ftl_out"] = %vfx_ftl_ca_destroyer_out;
}
