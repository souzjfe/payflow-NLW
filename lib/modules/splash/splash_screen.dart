import 'package:flutter/material.dart';
import 'package:payflow_nlw_together_flutter/shared/auth/authController.dart';
import 'package:payflow_nlw_together_flutter/shared/themes/app_colors.dart';
import 'package:payflow_nlw_together_flutter/shared/themes/app_images.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authController = AuthController();

    authController.hasCurrentUser(context);

    return Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            Center(child: Image.asset(AppImages.union)),
            Center(child: Image.asset(AppImages.logoFull))
          ],
        ));
  }
}
