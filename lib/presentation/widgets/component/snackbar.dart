import 'package:flutter/material.dart';

import '../../../core/constants/enums.dart';
import '../../resource/color_definition.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showCustomSnackBar(
    {required BuildContext context,
    Widget? widget,
    String? text,
    Color? backgroundColor,
    NotificationType type = NotificationType.neutral}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: widget ??
          Text(text ?? "An event occured.", textAlign: TextAlign.center),
      duration: const Duration(milliseconds: 1500),
      backgroundColor: backgroundColor ?? getBgColor(type),
    ),
  );
}

Color getBgColor(NotificationType type) {
  if (type == NotificationType.error || type == NotificationType.warning) {
    return ColorDefinition.kErrorColor;
  } else if (type == NotificationType.success) {
    return ColorDefinition.kSuccessColor;
  }

  return ColorDefinition.kBlackColor;
}
