import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reels/core/utils/app_colors.dart';
import 'package:reels/core/utils/extension.dart';
import 'package:reels/core/utils/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 4),
      () => context.goAndReplaceToHome(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Reels',
          style: Styles.textStyle30.copyWith(color: AppColors.splashScreenTextColor),
        ),
      ),
    );
  }
}
