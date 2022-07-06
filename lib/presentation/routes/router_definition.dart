import 'package:capital_rollup_test/presentation/screens/dashboard/trade_screen.dart';
import 'package:capital_rollup_test/presentation/screens/onboarding/login_screen.dart';
import 'package:flutter/material.dart';

import '../not_found.dart';
import '../screens/dashboard/home_screen.dart';
import '../screens/dashboard/sucess_screen.dart';
import '../screens/onboarding/sign_up_screen.dart';
import 'arguments/trade_screen_arg.dart';

class RouterDefinition {
  //
  static const String loginScreen = '/loginScreen';
  static const String homeScreen = '/homeScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String tradeScreen = '/tradeScreen';
  static const String successScreen = '/successScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Authentication
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      // Dashboard
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case tradeScreen:
        return MaterialPageRoute(
            builder: (_) =>
                TradeScreen(param: settings.arguments as TradeScreenArgument));
      case successScreen:
        return MaterialPageRoute(builder: (_) => const SuccessScreen());

      default:
        return MaterialPageRoute(builder: (ctx) => const NotFound());
    }
  }
}
