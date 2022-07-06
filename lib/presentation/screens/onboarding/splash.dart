import 'package:flutter/material.dart';
import '../../resource/image_definition.dart';
import '../../routes/router_definition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
        const Duration(milliseconds: 2000),
        () => Navigator.popAndPushNamed(context, RouterDefinition.loginScreen),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      child: Image.asset(
        ImageDefinition.kAppLogo,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
