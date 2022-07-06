import 'package:flutter/material.dart';

import '../../../core/constants/dimensions.dart';
import '../../resource/color_definition.dart';

class CustomKeyboard extends StatelessWidget {
  const CustomKeyboard(
      {required this.onTextInput,
      required this.onBackspace,
      this.isCrypto = false,
      this.allowDecimalInput = true});

  final ValueSetter<String> onTextInput;
  final VoidCallback onBackspace;
  final bool isCrypto;
  final bool allowDecimalInput;

  void _textInputHandler(String text) => onTextInput.call(text);

  void _backspaceHandler() => onBackspace.call();

  /// Handles entering value using the [CustomKeyboard],
  /// Accepts String? [formerValue], String [input] and in optional int [maxLenght]
  /// [formerValue] is the current value of the entered inputs where it is used.
  /// [input] is the current value tapped by the user.
  /// [maxLenght] is the maximum lenght the keyboard will enter.
  static String? insertValue(
      {required String? formerValue, required String input, int? maxLenght}) {
    // If input value lenght is less than the maximum length or 11
    if ((formerValue ?? "").length < (maxLenght ?? 11)) {
      // Handle when 0 is clicked first.
      if ((formerValue ?? "").length == 0 && input == "0") return formerValue;

      // Avoid multiple (.)
      if ((formerValue ?? "").contains(".") && input == '.') return formerValue;

      // Handle the case where (.) is clicked first.
      if ((formerValue ?? "").length == 0 && input == ".") return "0.";

      // if ((formerValue ?? "").length == 1 &&
      //     (formerValue ?? "").split("")[0] == '0') {
      //   _inputValue = input;
      // } else {
      return (formerValue ?? "") + input;
      // }
    }

    return formerValue;
  }

  /// Handles removing value when using the [CustomKeyboard] widget. String? [formerValue] parameter is required.
  static String? backspace(String? formerValue) {
    // Handle where input is '0.'
    if (formerValue == "0." || formerValue == null) return null;

    if (formerValue.length > 1) {
      return formerValue.substring(0, formerValue.length - 1);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: DimensionDefinition.kCustomKeyBoardHeight(size: size.height),
      padding: const EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildRowOne(),
          buildRowTwo(),
          buildRowThree(),
          Flexible(child: buildRowFour(size)),
        ],
      ),
    );
  }

  Widget buildRowOne() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _TextKey(
            text: '1',
            onTextInput: _textInputHandler,
            isCrypto: isCrypto,
          ),
          _TextKey(
            text: '2',
            onTextInput: _textInputHandler,
            isCrypto: isCrypto,
          ),
          _TextKey(
            text: '3',
            onTextInput: _textInputHandler,
            isCrypto: isCrypto,
          ),
        ],
      ),
    );
  }

  Widget buildRowTwo() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _TextKey(
            text: '4',
            onTextInput: _textInputHandler,
            isCrypto: isCrypto,
          ),
          _TextKey(
            text: '5',
            onTextInput: _textInputHandler,
            isCrypto: isCrypto,
          ),
          _TextKey(
            text: '6',
            onTextInput: _textInputHandler,
            isCrypto: isCrypto,
          ),
        ],
      ),
    );
  }

  Widget buildRowThree() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _TextKey(
            text: '7',
            onTextInput: _textInputHandler,
            isCrypto: isCrypto,
          ),
          _TextKey(
            text: '8',
            onTextInput: _textInputHandler,
            isCrypto: isCrypto,
          ),
          _TextKey(
            text: '9',
            onTextInput: _textInputHandler,
            isCrypto: isCrypto,
          ),
        ],
      ),
    );
  }

  Widget buildRowFour(Size size) {
    double height = size.height;
    return Container(
      // 700px has been tested to work well on all smaller devices.
      padding: size.height > 700
          ? const EdgeInsets.only(bottom: 10)
          : EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          allowDecimalInput
              ? _DotPointKey(
                  onTextInput: _textInputHandler,
                  text: ".",
                  isCrypto: isCrypto,
                )
              : SizedBox(
                  height:
                      DimensionDefinition.kSmallScreenHeight < height ? 64 : 45,
                  width:
                      DimensionDefinition.kSmallScreenHeight < height ? 64 : 45,
                ),
          _TextKey(
            text: '0',
            onTextInput: _textInputHandler,
            isCrypto: isCrypto,
          ),
          _BackspaceKey(
            onBackspace: _backspaceHandler,
            isCrypto: isCrypto,
          ),
        ],
      ),
    );
  }
}

class _TextKey extends StatelessWidget {
  const _TextKey(
      {required this.text, required this.onTextInput, this.isCrypto = false});

  final String text;
  final ValueSetter<String> onTextInput;
  final bool isCrypto;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: DimensionDefinition.kSmallScreenHeight < height ? 64 : 45,
      width: DimensionDefinition.kSmallScreenHeight < height ? 64 : 45,
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () => onTextInput.call(text),
          borderRadius: BorderRadius.circular(50),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorDefinition.kPrimaryColor,
                fontWeight: FontWeight.w600,
                fontSize:
                    DimensionDefinition.kSmallScreenHeight < height ? 24 : 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BackspaceKey extends StatelessWidget {
  const _BackspaceKey({required this.onBackspace, this.isCrypto = false});

  final VoidCallback onBackspace;
  final bool isCrypto;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: DimensionDefinition.kSmallScreenHeight < height ? 64 : 45,
      width: DimensionDefinition.kSmallScreenHeight < height ? 64 : 45,
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () => onBackspace.call(),
          child: Center(
            child: Icon(
              Icons.backspace,
              color: ColorDefinition.kErrorColor,
            ),
          ),
        ),
      ),
    );
  }
}

class _DotPointKey extends StatelessWidget {
  const _DotPointKey(
      {required this.text, required this.onTextInput, this.isCrypto = false});

  final String text;
  final ValueSetter<String> onTextInput;
  final bool isCrypto;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: DimensionDefinition.kSmallScreenHeight < height ? 64 : 45,
      width: DimensionDefinition.kSmallScreenHeight < height ? 64 : 45,
      child: Material(
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () => onTextInput.call(text),
          child: const Center(
            child: Icon(
              Icons.circle,
              size: 10,
              color: ColorDefinition.kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
