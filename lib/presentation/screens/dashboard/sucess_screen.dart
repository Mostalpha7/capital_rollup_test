import 'package:capital_rollup_test/presentation/resource/image_definition.dart';
import 'package:capital_rollup_test/presentation/resource/text_style_definition.dart';
import 'package:capital_rollup_test/presentation/widgets/component/buttons/cta_button.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    //
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Column(
                children: [
                  Image.asset(
                    ImageDefinition.kSuccessIcon,
                    width: 150,
                  ),
                  Text(
                    "Successful",
                    style: TextStyleDefinition.k16fontSize
                        .copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                      "Lorem Ipsum is simply dummy text of the \nand typese and typese.",
                      textAlign: TextAlign.center),
                ],
              ),

              //
              CTAButton(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                isActive: true,
                child: Center(
                  child: Text(
                    "Done",
                    style: TextStyleDefinition.k16fontSize
                        .copyWith(color: Colors.white),
                  ),
                ),
                margin: const EdgeInsets.only(bottom: 25),
              )
            ],
          ),
        ),
      ),
    );
  }
}
