import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies/di/di.dart';
import 'package:movies/features/network/api/movies_services.dart';
import 'package:movies/features/network/model/request/login_request/login_request.dart';
import 'package:movies/providers/language_provider.dart';
import 'package:movies/splash/splash.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  LanguageProvider languageProvider = LanguageProvider();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // getIt<MoviesServices>();
    return MaterialApp(
      locale: Locale(LanguageProvider.currentLocale),
      debugShowCheckedModeBanner: false,
      // theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      // themeMode: themeProvider.themeMode,
      home: Splash(),
    );
  }
}
