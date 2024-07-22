// ignore_for_file: constant_identifier_names

import 'package:flutter/animation.dart';

class CurveDecoder {
   static const _curves_key_bounce_in = 'bounceIn';
  static const _curves_key_bounce_in_out = 'bounceInOut';
  static const _curves_key_bounce_out = 'bounceOut';
  static const _curves_key_decelerate = 'decelerate';
  static const _curves_key_ease = 'ease';
  static const _curves_key_ease_in = 'easeIn';
  static const _curves_key_ease_in_back = 'easeInBack';
  static const _curves_key_ease_in_circ = 'easeInCirc';
  static const _curves_key_ease_in_cubic = 'easeInCubic';
  static const _curves_key_ease_in_expo = 'easeInExpo';
  static const _curves_key_ease_in_out = 'easeInOut';
  static const _curves_key_ease_in_out_back = 'easeInOutBack';
  static const _curves_key_ease_in_out_circ = 'easeInOutCirc';
  static const _curves_key_ease_in_out_cubic = 'easeInOutCubic';
  static const _curves_key_ease_in_out_expo = 'easeInOutExpo';
  static const _curves_key_ease_in_out_quad = 'easeInOutQuad';
  static const _curves_key_ease_in_out_quart = 'easeInOutQuart';
  static const _curves_key_ease_in_out_quint = 'easeInOutQuint';
  static const _curves_key_ease_in_out_sine = 'easeInOutSine';
  static const _curves_key_ease_in_quad = 'easeInQuad';
  static const _curves_key_ease_in_quart = 'easeInQuart';
  static const _curves_key_ease_in_quint = 'easeInQuint';
  static const _curves_key_ease_in_sine = 'easeInSine';
  static const _curves_key_ease_in_to_linear = 'easeInToLinear';
  static const _curves_key_ease_out = 'easeOut';
  static const _curves_key_ease_out_back = 'easeOutBack';
  static const _curves_key_ease_out_circ = 'easeOutCirc';
  static const _curves_key_ease_out_cubic = 'easeOutCubic';
  static const _curves_key_ease_out_expo = 'easeOutExpo';
  static const _curves_key_ease_out_quad = 'easeOutQuad';
  static const _curves_key_ease_out_quart = 'easeOutQuart';
  static const _curves_key_ease_out_quint = 'easeOutQuint';
  static const _curves_key_ease_out_sine = 'easeOutSine';
  static const _curves_key_elastic_in = 'elasticIn';
  static const _curves_key_elastic_in_out = 'elasticInOut';
  static const _curves_key_elastic_out = 'elasticOut';
  static const _curves_key_fast_linear_to_slow_ease_in = 'fastLinearToSlowEaseIn';
  static const _curves_key_fast_out_slow_in = 'fastOutSlowIn';
  static const _curves_key_linear = 'linear';
  static const _curves_key_linear_to_ease_out = 'linearToEaseOut';
  static const _curves_key_slow_middle = 'slowMiddle';

  // static String? encode(dynamic curve) {
  //   String? result;

  //   if (curve is String) {
  //     result = curve;
  //   } else if (curve is Curve) {
  //     try {
  //       result = values.entries.firstWhere((e) => e.value == curve).key;
  //     } catch (e) {
  //       // no-op
  //     }
  //   }

  //   return result;
  // }

  static Curve? decodeCurve(dynamic curve) => curve is Curve ? curve : values[curve];

  static const values = {
    _curves_key_bounce_in: Curves.bounceIn,
    _curves_key_bounce_in_out: Curves.bounceInOut,
    _curves_key_bounce_out: Curves.bounceOut,
    _curves_key_decelerate: Curves.decelerate,
    _curves_key_ease: Curves.ease,
    _curves_key_ease_in: Curves.easeIn,
    _curves_key_ease_in_back: Curves.easeInBack,
    _curves_key_ease_in_circ: Curves.easeInCirc,
    _curves_key_ease_in_cubic: Curves.easeInCubic,
    _curves_key_ease_in_expo: Curves.easeInExpo,
    _curves_key_ease_in_out: Curves.easeInOut,
    _curves_key_ease_in_out_back: Curves.easeInOutBack,
    _curves_key_ease_in_out_circ: Curves.easeInOutCirc,
    _curves_key_ease_in_out_cubic: Curves.easeInOutCubic,
    _curves_key_ease_in_out_expo: Curves.easeInOutExpo,
    _curves_key_ease_in_out_quad: Curves.easeInOutQuad,
    _curves_key_ease_in_out_quart: Curves.easeInOutQuart,
    _curves_key_ease_in_out_quint: Curves.easeInOutQuint,
    _curves_key_ease_in_out_sine: Curves.easeInOutSine,
    _curves_key_ease_in_quad: Curves.easeInQuad,
    _curves_key_ease_in_quart: Curves.easeInQuart,
    _curves_key_ease_in_quint: Curves.easeInQuint,
    _curves_key_ease_in_sine: Curves.easeInSine,
    _curves_key_ease_in_to_linear: Curves.easeInToLinear,
    _curves_key_ease_out: Curves.easeOut,
    _curves_key_ease_out_back: Curves.easeOutBack,
    _curves_key_ease_out_circ: Curves.easeOutCirc,
    _curves_key_ease_out_cubic: Curves.easeOutCubic,
    _curves_key_ease_out_expo: Curves.easeOutExpo,
    _curves_key_ease_out_quad: Curves.easeOutQuad,
    _curves_key_ease_out_quart: Curves.easeOutQuart,
    _curves_key_ease_out_quint: Curves.easeOutQuint,
    _curves_key_ease_out_sine: Curves.easeOutSine,
    _curves_key_elastic_in: Curves.elasticIn,
    _curves_key_elastic_in_out: Curves.elasticInOut,
    _curves_key_elastic_out: Curves.elasticOut,
    _curves_key_fast_linear_to_slow_ease_in: Curves.fastLinearToSlowEaseIn,
    _curves_key_fast_out_slow_in: Curves.fastOutSlowIn,
    _curves_key_linear: Curves.linear,
    _curves_key_linear_to_ease_out: Curves.linearToEaseOut,
    _curves_key_slow_middle: Curves.slowMiddle,
  };
}
