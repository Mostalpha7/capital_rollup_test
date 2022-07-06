import 'package:capital_rollup_test/presentation/resource/text_style_definition.dart';
import 'package:capital_rollup_test/presentation/routes/router_definition.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/dimensions.dart';
import '../../resource/color_definition.dart';
import '../../routes/arguments/trade_screen_arg.dart';
import '../../widgets/app/custom_app_bar.dart';
import '../../widgets/app/custom_app_bar_leading.dart';
import '../../widgets/app/custom_keyboard.dart';
import '../../widgets/app/custom_keyboard_value.dart';
import '../../widgets/component/buttons/cta_button.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({Key? key, required this.param}) : super(key: key);
  final TradeScreenArgument param;

  @override
  _TradeScreenState createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  String? _inputValue;
  bool loading = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        // _inputValue = widget.param.amount.toInt().toString();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        leading: const CustomAppBarLeading(),
        elevation: 0.00,
        title: Column(
          children: [
            Text(
              "Wallet Balance",
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontWeight: FontWeight.w400,
                fontSize: 10,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "\$12,000.80",
              style: TextStyleDefinition.k12fontSize
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      body: Container(
        height: DimensionDefinition.kCustomKeyBoardReminderHeight(
                mediaQueryData: MediaQuery.of(context)) -
            150,
        padding: const EdgeInsets.only(left: 29, right: 29),
        child: Center(
          child: CustomKeyBoardValue(prefix: "ETH", value: _inputValue ?? "0"),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.only(top: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 2.5, color: ColorDefinition.kDividerColor),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CTAButton(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                isActive: (_inputValue ?? "").isNotEmpty,
                isLoading: loading,
                onTap: () async {
                  setState(() => loading = true);
                  await Future.delayed(const Duration(milliseconds: 500));
                  Navigator.pushNamed(context, RouterDefinition.successScreen);
                  if (mounted) setState(() => loading = false);
                },
                child: const Center(
                  child: Text(
                    'Buy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CustomKeyboard(
                onTextInput: (input) {
                  setState(() {
                    _inputValue = CustomKeyboard.insertValue(
                      formerValue: _inputValue,
                      input: input,
                    );
                  });
                },
                onBackspace: () {
                  setState(() =>
                      _inputValue = CustomKeyboard.backspace(_inputValue));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
