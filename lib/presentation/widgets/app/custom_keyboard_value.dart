import 'package:capital_rollup_test/presentation/resource/text_style_definition.dart';
import 'package:flutter/material.dart';

class CustomKeyBoardValue extends StatelessWidget {
  final String prefix;
  final String value;

  const CustomKeyBoardValue(
      {Key? key, required this.prefix, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      alignment: Alignment.bottomLeft,
      fit: BoxFit.scaleDown,
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          children: [
            WidgetSpan(
              child: Transform.translate(
                offset: const Offset(3, -30),
                child: Text('$prefix ', style: TextStyleDefinition.k16fontSize),
              ),
            ),
            TextSpan(
              text: value.split(".").first,
              style: const TextStyle(fontSize: 64),
            ),
            (value.isNotEmpty && value.contains('.'))
                ? TextSpan(
                    text: ".${value.split(".").last}",
                    style: const TextStyle(fontSize: 24),
                  )
                : const TextSpan()
          ],
        ),
      ),
    );
  }
}
