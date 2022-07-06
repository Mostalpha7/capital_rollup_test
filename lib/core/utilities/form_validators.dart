import 'package:capital_rollup_test/core/utilities/formatters.dart';
import 'package:capital_rollup_test/core/utilities/regex.dart';

class FormValidators {
  static String? validateField(
      {required String fieldName, required String? input}) {
    if ((input ?? "").isEmpty) {
      return "${capitalizeFirstString(fieldName.toLowerCase())} can't be empty";
    }
    return null;
  }

  static String? validateEmail(val) {
    if ((val ?? "").isEmpty) {
      return "Email is required";
    } else if ((val ?? "").contains("+") ||
        !RegExp(RegexExpression.kEmailValidator).hasMatch((val ?? "").trim())) {
      return "Enter a valid email address";
    }
    return null;
  }

  static String? validatePassword(String? val) {
    if (val == null || val.isEmpty) {
      return "Password can't be empty";
    } else if (!(val).contains(RegExp(r'[a-z]'))) {
      return "Password should contain lowercase";
    } else if (!(val).contains(RegExp(r'[A-Z]'))) {
      return "Password should contain uppercase";
    } else if (!containNumber(val)) {
      return "Password should contain number";
    } else if (val.length < 12) {
      return "Minimum characters of 12 is required.";
    }
//
    return null;
  }
}
