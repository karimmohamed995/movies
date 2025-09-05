// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/shared_pref_help/shared_pref_helper.dart';
import 'package:movies/di/di.dart';
// import 'package:movies/features/network/api/movies_services.dart';
// import 'package:movies/features/network/model/request/login_request/login_request.dart';
import 'package:movies/providers/language_provider.dart';
import 'package:movies/screens/home/home.dart';
import 'package:movies/splash/splash.dart';
// import 'package:movies/utils/app_routes.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();
  var prefHelper = getIt<SharedPrefHelper>();
  var isLoggedIn = (await prefHelper.getToken()) != null;
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  MyApp({super.key, required this.isLoggedIn});
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
      home: isLoggedIn ? Home() : Splash(),
    );
  }
}
