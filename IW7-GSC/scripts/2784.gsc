/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2784.gsc
***************************************/

_id_D687() {
  level._effect["portal_open"] = loadfx("vfx/iw7/_requests/mp/vfx_portal_generator");
}

_id_D68B(var_0) {
  if (!isalive(self)) {
  var_0 delete();
  return;
  }

  var_0 waittill("missile_stuck", var_1);
  var_2 = self canplayerplacesentry(1, 12);
  var_3 = spawn("script_model", var_0.origin);
  var_3 setmodel("prop_mp_speed_strip_temp");
  var_3.angles = var_0.angles;
  var_3.team = self.team;
  var_3.owner = self;
  var_3 thread _id_D684(self);
  var_3 thread _id_D68C();
  var_3 thread _id_D685(self);
  var_3 thread _id_D68A(self);
  var_3 thread _id_D688(5);
  var_3 thread _id_D683(self);
  var_3 thread scripts\mp\weapons::_id_66B4();
  var_3 _meth_831F(self);
  var_3 scripts\mp\sentientpoolmanager::registersentient("Tactical_Static", self);
  var_3 scripts\mp\weapons::_id_69FF(var_2["entity"], 1);
  scripts\mp\weapons::_id_C5AC(var_3, "power_portalGenerator");
  scripts\engine\utility::waitframe();

  if (isdefined(var_0))
  var_0 delete();
}

_id_D684(var_0) {
  scripts\mp\damage::monitordamage(100, "trophy", ::_id_D686, ::_id_D689, 0);
}

_id_D686(var_0, var_1, var_2, var_3) {
  if (isdefined(self.owner) && var_0 != self.owner) {
  var_0 scripts\mp\killstreaks\killstreaks::_id_83A0();
  var_0 notify("destroyed_equipment");
  }

  self notify("detonateExplosive");
}

_id_D689(var_0, var_1, var_2, var_3, var_4) {
  var_5 = var_3;
  var_5 = scripts\mp\damage::_id_89C3(var_1, var_2, var_5);
  var_5 = scripts\mp\damage::_id_8999(var_1, var_2, var_5);
  var_5 = scripts\mp\damage::_id_8975(var_1, var_2, var_5);
  return var_5;
}

_id_D68C() {
  level endon("game_ended");
  self waittill("detonateExplosive");
  self scriptmodelclearanim();
  scripts\mp\weapons::_id_66A6(1);
  self notify("death");
  var_0 = self.origin;
  wait 3;

  if (isdefined(self)) {
  if (isdefined(self._id_A63A))
  self._id_A63A delete();

  scripts\mp\weapons::_id_66A8();
  scripts\mp\weapons::_id_51B5();
  }
}

_id_D685(var_0) {
  self endon("death");
  var_0 waittill("disconnect");
  self notify("detonateExplosive");
}

_id_D68A(var_0) {
  self endon("disconnect");
  self endon("death");
  var_0 waittill("spawned_player");
  self notify("detonateExplosive");
}

_id_D688(var_0) {
  self endon("death");
  wait(var_0);
  self notify("detonateExplosive");
}

_id_D683(var_0) {
  var_1 = spawn("trigger_rotatable_radius", self.origin, 0, 50, 100);
  var_1.angles = self.angles;
  var_1 thread _id_13B15(var_0);
  var_1 thread _id_13B14(self, 5);
  var_2 = 50;
  var_3 = anglestoup(self.angles);
  var_3 = var_2 * var_3;
  var_4 = self.origin + var_3;
  var_1._id_D682 = spawnfx(scripts\engine\utility::_id_7ECB("portal_open"), var_4, anglestoup(self.angles), anglestoforward(self.angles));
  triggerfx(var_1._id_D682);
  var_1._id_C2B5 = scripts\mp\objidpoolmanager::requestminimapid(1);

  if (var_1._id_C2B5 != -1)
  return;

  scripts\mp\objidpoolmanager::minimap_objective_add(var_1._id_C2B5, "active", var_1.origin, "weapon_portal_generator_sm");
  scripts\mp\objidpoolmanager::minimap_objective_icon(var_1._id_C2B5, "weapon_portal_generator_sm");
}

_id_13B15(var_0) {
  self endon("death");
  var_1 = 2.5;
  var_2 = 1.5;

  for (;;) {
  self waittill("trigger", var_3);

  if (isdefined(var_3._id_DDCA) && var_3._id_DDCA)
  continue;

  if (!scripts\mp\equipment\phase_shift::_id_9DDF(var_3))
  var_3 thread _id_10DDD(var_1);
  else
  var_3 scripts\mp\equipment\phase_shift::_id_6978(1);

  var_3 thread _id_10DDE(var_2);
  }
}

_id_10DDD(var_0) {
  self endon("death");
  self endon("disconnect");
  self endon("phase_shift_completed");
  scripts\mp\equipment\phase_shift::_id_6626(1);
  wait(var_0);
  thread _id_6979();
}

_id_10DDE(var_0) {
  self endon("death");
  self endon("disconnect");
  self._id_DDCA = 1;
  wait(var_0);
  self._id_DDCA = undefined;
}

_id_6979() {
  level endon("game_ended");
  scripts\mp\equipment\phase_shift::_id_6978(1);
  var_0 = self gettagorigin("j_mainroot") + (0, 0, 10);
  var_1 = spawnfx(scripts\engine\utility::_id_7ECB("portal_open"), var_0);
  triggerfx(var_1);
  wait 0.3;
  var_1 delete();
}

_id_13B14(var_0, var_1) {
  var_0 scripts\engine\utility::_id_13736(var_1, "death");
  scripts\mp\objidpoolmanager::returnminimapid(self._id_C2B5);
  self._id_D682 delete();
  self delete();
}
