import 'package:flutter/material.dart';
import 'package:payflow_nlw_together_flutter/shared/models/user_modal.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  var _isAuthenticated = false;
  UserModel? _user;

  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      saveUser(user);
      _user = user;
      _isAuthenticated = true;

      Navigator.pushReplacementNamed(context, "/home");
    } else {
      _isAuthenticated = false;

      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();

    await instance.setString("user", user.toJson());
  }

  Future<void> hasCurrentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();

    await Future.delayed(Duration(seconds: 2));

    if (instance.containsKey('user')) {
      final foundUser = await instance.getString("user") as String;
      setUser(context, UserModel.fromJson(foundUser));
      return;
    }

    setUser(context, null);
    return;
  }
}
