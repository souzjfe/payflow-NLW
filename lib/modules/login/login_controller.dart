import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow_nlw_together_flutter/shared/auth/authController.dart';
import 'package:payflow_nlw_together_flutter/shared/models/user_modal.dart';

class LoginController {
  final authController = AuthController();

  Future<void> googleSigIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      final response = await _googleSignIn.signIn();
      final user =
          UserModel(name: response!.displayName!, photoUrl: response.photoUrl);
      authController.setUser(context, user);

      print(response);
    } catch (error) {
      print(error);
    }
  }
}
