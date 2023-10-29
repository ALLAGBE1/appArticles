import 'package:flutter/material.dart';

@immutable
class ToshoColors extends ThemeExtension<ToshoColors> {
  const ToshoColors({
    required this.toshoPurple,
    required this.darkerToshoPurple,
    required this.cadetGray,
    required this.antiFlashWhite,
    required this.systemRed,
    required this.systemGreen,
    required this.systemYellow,
    required this.oxfordBlue,
    required this.white,
    required this.black,
    required this.toshoBorderPurple,
    // required this.lightGrey,
  });

  final Color? toshoPurple;
  final Color? darkerToshoPurple;
  final Color? cadetGray;
  final Color? antiFlashWhite;
  final Color? systemRed;
  final Color? systemGreen;
  final Color? systemYellow;
  final Color? oxfordBlue;
  final Color? white;
  final Color? black;
  final Color? toshoBorderPurple;
  // final Color? lightGrey;

  @override
  ToshoColors copyWith({
    Color? toshoPurple,
    Color? darkerToshoPurple,
    Color? cadetGray,
    Color? antiFlashWhite,
    Color? systemRed,
    Color? systemGreen,
    Color? systemYellow,
    Color? oxfordBlue,
    Color? white,
    Color? black,
    Color? toshoBorderPurple,
    // Color? lightGrey,
  }) {
    return ToshoColors(
      toshoPurple: toshoPurple ?? this.toshoPurple,
      darkerToshoPurple: darkerToshoPurple ?? this.darkerToshoPurple,
      cadetGray: cadetGray ?? this.cadetGray,
      antiFlashWhite: antiFlashWhite ?? this.antiFlashWhite,
      systemRed: systemRed ?? this.systemRed,
      systemGreen: systemGreen ?? this.systemGreen,
      systemYellow: systemYellow ?? this.systemYellow,
      oxfordBlue: oxfordBlue ?? this.oxfordBlue,
      white: white ?? this.white,
      black: black ?? this.black,
      toshoBorderPurple: toshoBorderPurple ?? this.toshoBorderPurple,
      // lightGrey: lightGrey ?? this.lightGrey,
    );
  }

  @override
  ToshoColors lerp(ToshoColors? other, double t) {
    if (other is! ToshoColors) {
      return this;
    }
    return ToshoColors(
      toshoPurple: Color.lerp(toshoPurple, other.toshoPurple, t),
      darkerToshoPurple:
          Color.lerp(darkerToshoPurple, other.darkerToshoPurple, t),
      cadetGray: Color.lerp(cadetGray, other.cadetGray, t),
      antiFlashWhite: Color.lerp(antiFlashWhite, other.antiFlashWhite, t),
      systemRed: Color.lerp(systemRed, other.systemRed, t),
      systemGreen: Color.lerp(systemGreen, other.systemGreen, t),
      systemYellow: Color.lerp(systemYellow, other.systemYellow, t),
      oxfordBlue: Color.lerp(oxfordBlue, other.oxfordBlue, t),
      white: Color.lerp(white, other.white, t),
      black: Color.lerp(black, other.black, t),
      toshoBorderPurple:
          Color.lerp(toshoBorderPurple, other.toshoBorderPurple, t),
      // lightGrey: Color.lerp(lightGrey, other.lightGrey, t),
    );
  }

// Optional
  @override
  String toString() => '''MyColors(
toshoPurple : $toshoPurple ,
darkerToshoPurple : $darkerToshoPurple ,
cadetGray : $cadetGray ,
antiFlashWhite : $antiFlashWhite ,
systemRed : $systemRed ,
systemGreen : $systemGreen ,
systemYellow : $systemYellow ,
oxfordBlue : $oxfordBlue ,
white : $white ,
black : $black ,
toshoBorderPurple : $toshoBorderPurple ,

  )''';
}

const ToshoColors lightToshoColors = ToshoColors(
  toshoPurple: Color(0xFF695ED3),
  darkerToshoPurple: Color(0xFF4437C8),
  cadetGray: Color(0xFF97A3B7),
  antiFlashWhite: Color(0xFFF5F6F8),
  systemRed: Color(0xFFFF3B30),
  systemGreen: Color(0xFF34C759),
  systemYellow: Color(0xFFFFCC00),
  oxfordBlue: Color(0xFF0E0B28),
  white: Color(0xFFFFFFFF),
  black: Color(0xFF000000),
  toshoBorderPurple: Color(0xFF6B5EDB),
  // lightGrey: Color(0xFFD9D9D9),
);

