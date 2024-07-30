import 'dart:ui';

class AppConstants {
  static const Locale englishLocale = Locale('en', 'US');

  static const Map<String, String> emailInputHintParam = {
    'field': 'username or email'
  };
  static const Map<String, String> passwordInputHintParam = {
    'field': 'password'
  };
  static const Map<String, String> facebookParam = {'type': 'Facebook'};
  static const Map<String, String> googleParam = {'type': 'Google'};
  static const Map<String, String> appleParam = {'type': 'Apple'};
  static const Map<String, String> extParam = {'extension': ' project here'};
  static const Map<String, String> extParamEmpty = {'extension': ''};

  static const double buttonRadius = 8.0;
}
