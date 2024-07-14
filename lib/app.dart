import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reels/core/utils/api_service.dart';
import 'package:reels/core/utils/app_strings.dart';
import 'package:reels/features/reels/data/repo/reels_repo.dart';
import 'package:reels/features/reels/presentation/manager/reels_cubit/reels_cubit.dart';

import 'core/routes/app_pages.dart';

class ReelsApp extends StatelessWidget {
  const ReelsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: false,
      splitScreenMode: false,
      builder: (_, child) {
        return BlocProvider(
          // todo should use service locator here
          create: (context) => ReelsCubit(repo: ReelsRepo(apiService: ApiService(Dio())))..getReels(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appTitle,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            onGenerateRoute: AppPages.onGenerateRoute,
          ),
        );
      },
    );
  }
}
