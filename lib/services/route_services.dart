import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zapit_demo/screens/currencies/currencies_screen.dart';
import 'package:zapit_demo/screens/currency_info/currency_info_screen.dart';
import 'package:zapit_demo/screens/splash/splash_screen.dart';
import 'package:zapit_demo/utils/enums.dart';

class AppRoutes {
  static const SPLASH_SCREEN_ROUTE = 'splash_screen';
  static const CURRENCIES_SCREEN_ROUTE = 'currencies_screen';
  static const CURRENCY_INFO_SCREEN_ROUTE = 'currencies_info';

  /// All Application Routes
  static Map<String, WidgetBuilder> applicationRoutes() {
    return {
      SPLASH_SCREEN_ROUTE: (context) => const SplashScreen(),
      CURRENCIES_SCREEN_ROUTE: (context) => const CurrenciesScreen(),
      CURRENCY_INFO_SCREEN_ROUTE: (context) => const CurrencyInfoScreen(),
    };
  }

  /// App Navigation Function
  static navigatePage(
      {required String pageRoute,
      required PageNav pageNav,
      Object? arguments}) {
    if (pageNav == PageNav.to) {
      if (arguments == null) {
        Get.toNamed(pageRoute);
      } else {
        Get.toNamed(pageRoute, arguments: arguments);
      }
    } else if (pageNav == PageNav.off) {
      if (arguments == null) {
        Get.offNamed(pageRoute);
      } else {
        Get.offNamed(pageRoute, arguments: arguments);
      }
    } else if (pageNav == PageNav.offAll) {
      if (arguments == null) {
        Get.offAllNamed(pageRoute);
      } else {
        Get.offAllNamed(pageRoute, arguments: arguments);
      }
    } else {
      Get.back();
    }
  }
}
