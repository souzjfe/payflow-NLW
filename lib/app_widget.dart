import 'package:flutter/material.dart';
import 'package:payflow_nlw_together_flutter/modules/home/home_page.dart';
import 'package:payflow_nlw_together_flutter/modules/splash/splash_screen.dart';

import 'modules/login/login_page.dart';
import 'shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Payflow",
      theme: ThemeData(primaryColor: AppColors.primary),
      initialRoute: "/splash",
      routes: {
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage(),
        "/splash": (context) => SplashPage()
      },
    );
  }
}
