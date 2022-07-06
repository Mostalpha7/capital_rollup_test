import 'package:flutter/material.dart';

class DimensionDefinition {
  static kCustomKeyBoardHeight({num? size}) {
    if (size != null && size >= kSmallScreenHeight) return 290.0;
    return 205.0;
  }

  static double kCustomKeyBoardReminderHeight(
      {required MediaQueryData mediaQueryData}) {
    return (mediaQueryData.size.height -
            mediaQueryData.padding.top -
            kToolbarHeight) -
        kCustomKeyBoardHeight(size: mediaQueryData.size.height);
  }

  static double kSmallScreenHeight = 700;
}
