import 'package:flutter/material.dart';
import 'package:reels/core/routes/app_routes.dart';
import 'package:reels/features/reels/presentation/screens/reels_screen.dart';

import '../../features/splash/presentation/screens/splash_screen.dart';
import '../utils/app_strings.dart';

class AppPages {
  static Route<dynamic>? onGenerateRoute(RouteSettings rs) {
    switch (rs.name) {
      case AppRoutes.initial:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case AppRoutes.reels:
        return MaterialPageRoute(builder: (context) =>  const ReelsScreen());
    }
    return undefinedRoute();
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}
