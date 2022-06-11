import 'dart:convert';

import 'package:amazon_locker/helpers/shared_preferences_helper.dart';
import 'package:amazon_locker/models/response/response_model.dart';
import 'package:amazon_locker/models/user/user_model.dart';
import 'package:amazon_locker/providers/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountController extends ChangeNotifier {
  UserModel? _currentUser;
  final Ref ref;
  final SharedPreferencesHelper _sharedPreferences = SharedPreferencesHelper();

  AccountController({required this.ref});

  UserModel? get currentUser => _currentUser;

  bool refreshFavourites = false;
  bool refreshOwned = false;
  bool refreshUploads = false;

  void setUser(UserModel userModel, {bool? rememberMe}) {
    _currentUser = userModel.copyWith(token: userModel.token);

    if (rememberMe != null && rememberMe) {
      _sharedPreferences.store(tag: 'token', data: userModel.token ?? '');
      _sharedPreferences.store(
          tag: 'user', data: jsonEncode(_currentUser!.toJson()));
    }
    notifyListeners();
  }

  Future<bool> isLoggedIn() async {
    // Check if user token is stored
    String? token = await _sharedPreferences.get(tag: 'token');
    String? user = await _sharedPreferences.get(tag: 'user');

    if (token != null && user != null) {
      setUser(UserModel.fromJson(jsonDecode(user)));
    }

    // No user object initialized
    if (_currentUser == null) return false;

    // If the token is already loaded, return true
    if (_currentUser != null) return true;

    // No login was called and no token in shared preference
    return false;
  }

  Future<String?> login(
      {required String email,
      required String password,
      required bool rememberMe}) async {
    try {
      ResponseModel response =
          await ref.read(apiProvider).login(email: email, password: password);
      if (response.statusCode == 200) {
        setUser(UserModel.fromJson(response.data!), rememberMe: rememberMe);
        return null;
      } else {
        throw response.error!;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> register(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final ResponseModel response = await ref
          .read(apiProvider)
          .register(email: email, password: password, name: name);
      if (response.statusCode == 201) {
        setUser(UserModel.fromJson(response.data!), rememberMe: true);
        return null;
      } else {
        throw response.error!;
      }
    } catch (e) {
      return e.toString();
    }
  }

  void resetUserData() {
    _sharedPreferences.delete(tag: 'user');
    _sharedPreferences.delete(tag: 'token');
    _currentUser = null;

    notifyListeners();
  }
}
