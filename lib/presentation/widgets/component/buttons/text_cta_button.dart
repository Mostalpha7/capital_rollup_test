import 'package:flutter/material.dart';

import '../../../resource/text_style_definition.dart';

class TextCTAButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final TextStyle? textStyles;
  const TextCTAButton(
      {Key? key, required this.text, required this.onTap, this.textStyles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: textStyles ??
              TextStyleDefinition.k14fontSize.copyWith(fontSize: 11),
        ),
      ),
    );
  }
}
