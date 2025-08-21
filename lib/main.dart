import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/global_cubit/global_cubit.dart';
import 'package:movies_app/movies_app.dart';
import 'package:movies_app/my_bloc_observer.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Bloc.observer = MyBlocObserver();
  await configureDependencies();
  FlutterNativeSplash.remove();
  runApp(
    BlocProvider<GlobalCubit>(
      create: (context) => getIt.get<GlobalCubit>()..onInit(),
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: "assets/translations",
        fallbackLocale: const Locale('en'),
        child: const MoviesApp(),
      ),
    ),
  );
}
