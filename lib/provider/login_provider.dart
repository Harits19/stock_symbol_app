import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_symbol_app/base/base_constanta.dart';
import 'package:stock_symbol_app/base/base_function.dart';
import 'package:stock_symbol_app/stock/models/facebook_user_data.dart';

class LoginProvider extends ChangeNotifier {
  FacebookUserData? facebookUserData;
  String token = "";
  DateTime? lastLogin;

  loginFacebook({
    required VoidCallback onSuccess,
  }) async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final userDataJson = await FacebookAuth.instance.getUserData();

      token = result.accessToken!.token;
      facebookUserData = FacebookUserData.fromJson(userDataJson);
      lastLogin = DateTime.now();

      await saveToStorage();

      onSuccess();
    } else {}
    notifyListeners();
  }

  saveToStorage() async {
    final pref = await SharedPreferences.getInstance();

    await pref.setString(KeyCons.tokenKey, token);
    await pref.setString(
        KeyCons.facebookUserDataKey, jsonEncode(facebookUserData!.toJson()));
    await pref.setString(KeyCons.lastLoginKey, dateTimeToString(lastLogin!));
  }
}
