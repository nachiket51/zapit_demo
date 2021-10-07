import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:zapit_demo/services/route_services.dart';
import 'package:zapit_demo/utils/enums.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),

      /// currency list navigation
      () => AppRoutes.navigatePage(
        pageRoute: AppRoutes.CURRENCIES_SCREEN_ROUTE,
        pageNav: PageNav.offAll,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Center(
        child: FlutterLogo(
          size: 50.h,
        ),
      ),
    );
  }
}
