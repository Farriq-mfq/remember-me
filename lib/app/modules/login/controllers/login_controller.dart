import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remember_me/app/data/auth_provider.dart';
import 'package:remember_me/constant.dart';
import 'package:remember_me/model/input/login_input.dart';
import 'package:remember_me/model/login_response.dart';

class LoginController extends GetxController with StateMixin<dynamic> {
  final AuthProvider _authProvider = AuthProvider();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final box = GetStorage();
  
  Rx<bool> loading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loginAction() async {
    loading.value = true;
    try {
      final LoginInput credentials =
          LoginInput(email: email.text, password: password.text);
      final res = await _authProvider.login(credentials);
      if (res.statusCode == 200) {
        LoginResponse successResponse = LoginResponse.fromJson(res.body);
        box.write(Constant.token_key, successResponse.token);
        box.write('user', successResponse.authState);
        loading.value = false;
      } else {
        loading.value = false;
        print('login error');
      }
    } catch (e) {
      loading.value = false;
    }
  }
}
