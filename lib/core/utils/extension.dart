import 'package:flutter/material.dart';
import 'package:reels/core/routes/app_routes.dart';

extension OnContext on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  void goToHome() => Navigator.pushNamed(this, AppRoutes.reels);
  void goAndReplaceToHome() =>
      Navigator.pushReplacementNamed(this, AppRoutes.reels);
}