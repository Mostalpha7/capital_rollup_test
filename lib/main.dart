import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../presentation/routes/router_definition.dart';
import '../presentation/screens/onboarding/splash.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, /* DeviceOrientation.portraitDown */
    ]);
    return const MaterialApp(
      title: 'CapitalRollup',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouterDefinition.generateRoute,
    );
  }
}
