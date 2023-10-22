import 'package:flutter/material.dart';
import 'package:news_app/pages/home/home_view.dart';
import 'package:news_app/pages/settings/settings_view.dart';
import 'package:news_app/pages/splash/splash_view.dart';

import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName : (context) => SplashView(),
        HomeView.routeName : (context) => HomeView(),
        SettingsView.routeName : (context) => SettingsView(),
      },
      theme: AppTheme.lightMode,
      themeMode: ThemeMode.light,
    );
  }
}

