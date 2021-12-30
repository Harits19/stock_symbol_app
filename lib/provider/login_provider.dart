import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_symbol_app/base/base_constanta.dart';
import 'package:stock_symbol_app/base/base_function.dart';
import 'package:stock_symbol_app/models/facebook_user_data.dart';

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
    await pref.setString(
        KeyCons.lastLoginKey, dateTimeFormat.format(lastLogin!));
  }

  getFromStorage() async {
    final pref = await SharedPreferences.getInstance();
    token = pref.getString(KeyCons.tokenKey) ?? "";
    if (token.isEmpty) return;
    facebookUserData = FacebookUserData.fromJson(
        jsonDecode(pref.getString(KeyCons.facebookUserDataKey) ?? ""));
    lastLogin =
        dateTimeFormat.parse(pref.getString(KeyCons.lastLoginKey) ?? "");
    notifyListeners();
  }

  signInWithToken({
    required VoidCallback onSuccess,
    required VoidCallback onError,
  }) async {
    await getFromStorage();
    if (token.isEmpty) {
      onError();
      return;
    }
    final facebookAuthCredential = FacebookAuthProvider.credential(token);
    final userCredential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
    if (userCredential.user == null) {
      onError();
      return;
    }
    onSuccess();
  }
}
