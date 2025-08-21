import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/app_theme.dart';
import 'package:movies_app/core/global_cubit/global_cubit.dart';
import 'package:movies_app/core/global_cubit/global_state.dart';
import 'package:movies_app/core/router/app_router.dart';
import 'package:movies_app/core/router/route_names.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => BlocBuilder<GlobalCubit, GlobalState>(
        buildWhen: (previous, current) => current is ChangeLanguageIndexState,
        builder: (context, state) => MaterialApp(
          title: 'Movies',
          debugShowCheckedModeBanner: false,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.dark,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: RouteNames.login,
        ),
      ),
    );
  }
}
