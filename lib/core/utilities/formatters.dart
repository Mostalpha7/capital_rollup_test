String capitalizeFirstString(String? s) {
  if (s == null || s == '') return '';
  if (s.isEmpty) return '';
  return s.substring(0, 1).toUpperCase() + s.substring(1).toLowerCase();
}

bool containNumber(String str) {
  bool res = false;

  for (final String el in str.split('')) {
    if (isNumeric(el)) {
      res = true;
      break;
    }
  }

  return res;
}

bool isNumeric(String s) {
  try {
    double.parse(s);
    return true;
  } catch (_) {
    return false;
  }
}

bool containsUppercase(String str) => str.contains(RegExp(r'[A-Z]'));
bool containsLowercase(String str) => str.contains(RegExp(r'[a-z]'));
