/***************************************
 * Decompiled and Edited by SyndiShanX
 * Script: scripts\2888.gsc
***************************************/

main() {
  _id_0A2F::_id_9789();
  _id_0B91::_id_965C();
  _id_0B33::_id_95F3();
  _id_0B2F::_id_9752();
  _id_0B35::_id_95F9();
  _id_0F18::_id_956A();
  _id_0B45::_id_9631();
  _id_0B79::_id_9766();

  if (_id_0B91::_id_93A6())
  _id_0B78::init();

  _id_0B49::_id_83DD();
  _id_0B49::_id_83DB();
  _id_0B49::_id_83D5();
  scripts\engine\utility::_id_978C();
  scripts\engine\utility::_id_1115B();
  _id_0B13::_id_957F();
  _id_0B5F::_id_96D7();
  _id_0B4F::main();
  scripts\common\exploder::_id_FAAA();
  _id_0B5D::main();
  _id_0B0A::main();
  _id_0B06::init();
  scripts\common\fx::_id_980A();
  _id_0B17::_id_49B4();
  _id_0B39::main();
  _id_0B1D::init();
  _id_0B8D::init();
  _id_0B47::init();
  scripts\engine\utility::_id_D959();
  _id_0B55::_id_F9E6();
  _id_0B0B::_id_9539();
  _id_0B90::_id_9726();
  _func_1C5("ufoHitsTriggers", "0");
  _id_0B3E::init();
  _id_0B9B::_id_979C();
  _id_0B28::main();
  _id_0E2B::_id_C32F();
  _id_0E2D::_id_112B5();
  _id_0E26::_id_972B();
  _id_0E25::_id_95C4();
  _id_0B93::_id_979A();
  _id_0B29::init();
  _id_0E21::_id_9527();
  _id_0E29::_id_8829();
  _id_0B2A::_id_66A1();
  _id_0B16::_id_4761();
  precacheitem("frag_up1");
  precacheitem("frag_c6hug");
  _id_0E4B::_id_D5E3();
  _id_0B79::_id_57C6();
  scripts\engine\utility::_id_C953();
  _id_0B0E::main();
  anim._id_13086 = 0;
  _id_0B49::_id_F7C2();
  _id_0B45::main();
  _id_0B1B::init();
  _id_0B32::main();

  if (getdvarint("ai_iw7", 0) == 1) {
  scripts\asm\asm::_id_2343();
  scripts\aitypes\bt_util::init();
  }

  _id_0B2D::_id_F97C();
  _id_0B49::_id_51C4();
  scripts\anim\traverse\shared::_id_F9C6();
  _id_0B04::_id_94F9();
  _id_0B41::main();
  _id_0E44::_id_952C();
  _id_0B1F::_id_95B6();
  _id_0E20::_id_DE0F();
  _id_0E1F::_id_6137();
  _id_0E1C::_id_200A();
  _id_0E1E::_id_5374();
  _id_0B09::_id_952F();
  _id_0B91::_id_9674();

  if (isdefined(level._id_83DF))
  [[level._id_83DF]]();

  _id_0B49::_id_B3CD();
  _id_0B77::main();
  _id_0B91::_id_48C1();
  _id_0B34::_id_95F7();
  _id_0B44::_id_9A2F();
  thread _id_0B36::_id_409C();

  if (_id_0B91::_id_93A6()) {
  if (_id_0B78::_id_2C8F())
  _id_0B78::_id_F2D2(1);
  else
  level._id_10964 thread _id_0B78::main();
  }

  _id_0B49::_id_E810();
  _func_305(_id_0B91::_id_7F6E(level.script));
  var_0 = _id_0B91::_id_7E2C(level.script);
  setomnvar("ui_client_settle_time", var_0);
  var_1 = _id_0B91::_id_7F70(level.script);

  if (isdefined(var_1) && var_1 != "")
  setomnvar("ui_transition_movie", var_1);
  else
  setomnvar("ui_transition_movie", "none");

  _id_0B05::main();
}
