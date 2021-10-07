import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zapit_demo/services/route_services.dart';

class ZapitApp extends StatelessWidget {
  const ZapitApp({Key? key}) : super(key: key);

  static GlobalKey<NavigatorState> appNavigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    /// IOS: PLATFORM SET-UP
    return GetPlatform.isIOS
        ? Sizer(builder: (context, orientation, deviceType) {
            return GetMaterialApp(
              navigatorKey: appNavigatorKey,
              routes: AppRoutes.applicationRoutes(),
              initialRoute: AppRoutes.SPLASH_SCREEN_ROUTE,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                DefaultMaterialLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate,
                DefaultWidgetsLocalizations.delegate,
              ],
            );
          })

        /// ANDROID: PLATFORM SET-UP
        : Sizer(builder: (context, orientation, deviceType) {
            return GetCupertinoApp(
              navigatorKey: appNavigatorKey,
              routes: AppRoutes.applicationRoutes(),
              initialRoute: AppRoutes.SPLASH_SCREEN_ROUTE,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                DefaultMaterialLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate,
                DefaultWidgetsLocalizations.delegate,
              ],
            );
          });
  }
}
