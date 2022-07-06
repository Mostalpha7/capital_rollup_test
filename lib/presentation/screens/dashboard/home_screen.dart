import 'package:capital_rollup_test/presentation/resource/text_style_definition.dart';
import 'package:capital_rollup_test/presentation/routes/arguments/trade_screen_arg.dart';
import 'package:capital_rollup_test/presentation/routes/router_definition.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../widgets/app/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          elevation: 0,
          leading: SizedBox(
            child: Center(
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 238, 77, 77),
                    borderRadius: BorderRadius.circular(50)),
                child: const Icon(LucideIcons.user,
                    size: 18, color: Color.fromARGB(255, 83, 4, 4)),
              ),
            ),
          ),
          actions: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(LucideIcons.glasses,
                        size: 16, color: Colors.black),
                    const SizedBox(width: 5),
                    Text(
                      "Discover",
                      style: TextStyleDefinition.k15fontSize.copyWith(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 30,
                width: 30,
                margin: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(LucideIcons.scan, size: 16, color: Colors.black),
                ),
              ),
            )
          ],
        ),
        body: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 55, bottom: 30),
              child: Text(
                "To get started, \n buy some ETH",
                textAlign: TextAlign.center,
                style: TextStyleDefinition.k26fontSize,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildQuickBuyBtn(
                    text: "100",
                    bgColor:
                        const Color.fromARGB(255, 72, 58, 226).withOpacity(0.9),
                    textColor: const Color.fromARGB(255, 67, 194, 244),
                    spreadColor: const Color.fromARGB(181, 76, 213, 201)
                        .withOpacity(0.1),
                    onTap: () {
                      Navigator.pushNamed(context, RouterDefinition.tradeScreen,
                          arguments: TradeScreenArgument(100));
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: buildQuickBuyBtn(
                    text: "200",
                    bgColor:
                        const Color.fromARGB(255, 72, 58, 226).withOpacity(0.9),
                    textColor: const Color.fromARGB(255, 67, 194, 244),
                    spreadColor: const Color.fromARGB(181, 76, 213, 201)
                        .withOpacity(0.1),
                    onTap: () {
                      Navigator.pushNamed(context, RouterDefinition.tradeScreen,
                          arguments: TradeScreenArgument(200));
                    },
                  ),
                ),
                buildQuickBuyBtn(
                  text: "300",
                  bgColor: const Color.fromARGB(255, 118, 33, 160),
                  textColor: const Color.fromARGB(255, 216, 73, 232),
                  spreadColor:
                      const Color.fromARGB(255, 163, 85, 171).withOpacity(0.1),
                  onTap: () {
                    Navigator.pushNamed(context, RouterDefinition.tradeScreen,
                        arguments: TradeScreenArgument(300));
                  },
                )
              ],
            ),

            //
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.pushNamed(context, RouterDefinition.tradeScreen,
                          arguments: TradeScreenArgument(null));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(203, 234, 234, 234)
                              .withOpacity(0.5),
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(LucideIcons.plusCircle,
                              size: 18, color: Colors.black.withOpacity(0.4)),
                          const SizedBox(width: 5),
                          Text(
                            "Other amount",
                            style: TextStyleDefinition.k16fontSize.copyWith(
                                fontSize: 16.5,
                                fontWeight: FontWeight.w700,
                                color: Colors.black.withOpacity(0.4)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 0.5,
              width: double.infinity,
              color: const Color.fromARGB(255, 246, 246, 246),
              margin: const EdgeInsets.only(
                  bottom: 45, top: 45, left: 70, right: 70),
            ),
            const Text(
              "or send ETH to\n your wallet",
              textAlign: TextAlign.center,
              style: TextStyleDefinition.k26fontSize,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 35),
              child: Text(
                textAlign: TextAlign.center,
                "Send from Coinbase or another\nexchange - or ask a friend.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blueAccent.withOpacity(0.08)),
                  child: Row(
                    children: [
                      const Icon(LucideIcons.copy,
                          size: 17, color: Colors.blueAccent),
                      const SizedBox(width: 5),
                      Text(
                        "Copy address",
                        style: TextStyleDefinition.k16fontSize.copyWith(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            )

            //
          ],
        ),
      ),
    );
  }

  Widget buildQuickBuyBtn(
      {required String text,
      required Color bgColor,
      required Color textColor,
      required Color spreadColor,
      required Function onTap}) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTap(),
      child: Container(
        height: 80,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: bgColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                    color: spreadColor,
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 1.5)),
              ],
            ),
            child: Text(
              "\$$text",
              style: TextStyleDefinition.k26fontSize
                  .copyWith(color: textColor, height: 0),
            ),
          ),
        ),
      ),
    );
  }
}
